# Slice 1 — Issuer Registration (`IssuerRegistry.sol`)

> Owner: member1 · Branch: `feature/issuer-module` · Scenario: Diploma and certificate verification: an employer verifies a credential in seconds without contacting the registrar, while the issuer keeps the power to revoke.

## What it does
The single source of truth for **who may issue a Credential** and who the registrar is.

## Functions
- `registerInstitution(address)` — registrar grants the issuer role to a Registrar.
- `deregisterInstitution(address)` — registrar revokes it.
- `transferRegistrar(address)` — hand the registrar key to a multisig.
- `isInstitution(address)` / `registrar()` — reads used by the other three slices.

## Tests (`test/IssuerRegistry.t.sol`)
- registrar is the deployer · register+revoke · non-registrar reverts · zero-address reverts.

## TODO checklist
- [ ] `TODO(slice-1)` two-step registrar handover
- [ ] event-driven issuer list in the frontend
- [ ] Extension: swap to OpenZeppelin `AccessControl`, note gas delta

## Demo evidence
Screenshot: registering a Registrar and the `InstitutionRegistered` event in the trace.
