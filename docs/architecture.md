# Architecture — Enigma-Credential-Tracker

> Scenario: Diploma and certificate verification: an employer verifies a credential in seconds without contacting the registrar, while the issuer keeps the power to revoke.

## Roles
- **Issuer** — Registrar (holds the issuer role; creates/updates/revokes Credential records)
- **Owner** — Graduate (controls transfer of their own record)
- **Verifier** — Employer (read-only authenticity check)
- **Admin** — deploys, manages issuer roles, links the controller

## System diagram
```
            ┌──────────────────┐
registrar ─────▶│  IssuerRegistry  │◀──── isInstitution()/registrar() reads
            └──────────────────┘
                     ▲ role check
  issuer ──create──▶ │
            ┌──────────────────┐  controller-only   ┌──────────────┐
            │  RecordRegistry  │◀──────────────────│  AuditTrail  │◀── owner/issuer
            └──────────────────┘  transfer/revoke   └──────────────┘
                     ▲ view
            ┌──────────────────┐
verifier ─▶│   Verification   │
            └──────────────────┘
```

## Workflow (per action)
1. **Register issuer** — registrar → `IssuerRegistry.registerInstitution(Registrar)`
2. **Create Credential** — issuer → `RecordRegistry.issueCredential(id, hash, cid, owner, metaURI)` → emits `CredentialIssued`
3. **Verify** — verifier → `Verification.verifyCredential(id, candidateHash)` → `(valid, status, owner, issuer)`
4. **Transfer** — owner → `AuditTrail.transferHolder(id, newOwner)` → emits `HolderTransferred`
5. **Revoke / update** — issuer/registrar → `AuditTrail.revoke|renewCredential(...)`

## On-chain vs off-chain
| On-chain (lean, permanent) | Off-chain (large, private) |
|----------------------------|----------------------------|
| `keccak256(artifact)` hash | the Credential file itself (IPFS) |
| IPFS CID + metadataURI     | the human-readable record.json |
| issuer/owner addresses     | any PII (never on-chain) |
| `issuedAt`, `status`, events | |

## Why blockchain here (and where a DB is fine)
- **Blockchain wins:** tamper-evidence, no single trusted server, public verifiability, issuer can revoke.
- **DB still better for:** search/discovery by name, private lookups, high-frequency mutable data.
> Fill this in with your scenario's concrete argument — it's worth 10 pts (Problem definition).
