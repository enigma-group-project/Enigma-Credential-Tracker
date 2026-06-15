# Slice 2 — Record Creation (`RecordRegistry.sol`)

> Owner: member2 · Branch: `feature/record-module` · Scenario: Diploma and certificate verification: an employer verifies a credential in seconds without contacting the registrar, while the issuer keeps the power to revoke.

## What it does
Issues a Credential and stores the on-chain proof (hash + CID + owner + status). The only
contract that mutates state; mutations after creation go through the controller (Slice 4).

## Functions
- `issueCredential(id, dataHash, cid, owner, metadataURI)` — `onlyInstitution`, `nonReentrant`.
- `getRecord(id)` / `exists(id)` — views from `IAttestationRegistry`.
- `setController(address)` — registrar links the AuditTrail once.

## Data representation
See `schemas/record.schema.json` (off-chain) and `schemas/attestation-onchain.schema.json` (on-chain).

## Tests (`test/RecordRegistry.t.sol`)
- issuer can create · non-issuer reverts · duplicate reverts.

## TODO checklist
- [ ] `TODO(slice-2)` event-emission test
- [ ] frontend: validate record.json against the schema before issuing
