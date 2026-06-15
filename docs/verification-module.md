# Slice 3 — Verification (`Verification.sol`)

> Owner: member3 · Branch: `feature/verification-module` · Scenario: Diploma and certificate verification: an employer verifies a credential in seconds without contacting the registrar, while the issuer keeps the power to revoke.

## What it does
The zero-gas read path a Employer uses to confirm a Credential is authentic, active, and who owns it.

## Functions
- `verifyCredential(id, candidateHash)` → `(valid, status, owner, issuer)`
- `verifyCredentialHash` · `statusOf` · `ownerOf`

## Demo script
1. Issue a Credential (Slice 2).
2. Re-hash the same artifact in the Verification page → ✅ VALID.
3. Revoke it (Slice 4) → re-verify → status `Revoked`, valid=false.

## Tests (`test/Verification.t.sol`)
- hash match · wrong hash fails · verifyCredential active.

## TODO checklist
- [ ] `TODO(slice-3)` assert valid=false after revoke
- [ ] in-browser IPFS fetch + re-hash
