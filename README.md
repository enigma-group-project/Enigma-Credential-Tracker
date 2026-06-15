# Enigma-Credential-Tracker

> 🧩 **STUDENT TEMPLATE.** Every `TODO(memberN)` in `contracts/` and `frontend/src/modules/` is yours to implement. The tests in `test/` are the spec — run `forge test` until green. The Auto-Grade Action scores each push. See [STUDENT_GUIDE](../../STUDENT_GUIDE.md).

> Team Enigma (Group E) · CS-GY 9215 Applied Blockchain · **Scenario:** Diploma and certificate verification: an employer verifies a credential in seconds without contacting the registrar, while the issuer keeps the power to revoke.
> One of six fully-functional reference solutions sharing the four-slice attestation architecture (domain-specific functions per scenario) — see [`../../PROJECT_BRIEF.md`](../../PROJECT_BRIEF.md).
> **Status:** Replicated from the gold reference (Vehicle-Emission). All four slices on the dual-network standard (Anvil + Sepolia).

## Roles
| Role | Who | Permissions |
|------|-----|-------------|
| Issuer | Registrar | create / update / revoke Credential |
| Owner | Graduate | transfer their own Credential |
| Verifier | Employer | read-only verification |
| Admin | deployer | manage issuer roles, link controller |

## Quickstart (local Anvil)
```bash
forge build
forge install foundry-rs/forge-std
forge test -vvvv
forge test --gas-report

anvil &
forge script script/Deploy.s.sol --rpc-url http://127.0.0.1:8545 --broadcast
# paste addresses into frontend/src/shared/config.js (anvil block), ABIs into shared/abi.js
# open frontend/src/index.html and pick "Local Anvil"
```

## Hosted demo on GitHub Pages (Sepolia)
```bash
forge script script/Deploy.s.sol --rpc-url $SEPOLIA_RPC_URL --broadcast --verify
```
1. Paste Sepolia addresses into `frontend/src/shared/config.js` and set `DEFAULT_NETWORK = "sepolia"`.
2. Settings → Pages → deploy from `frontend/src`.
3. Reads go over a public Sepolia RPC (no wallet); writes use the visitor's MetaMask.

## Contribution statement
| Member | Slice owned | Branch | Evidence |
|--------|-------------|--------|----------|
| member1 | Registrar Registration (`IssuerRegistry`) | `feature/member1-issuer-registration` | _screenshot / test output_ |
| member2 | Record Creation (`RecordRegistry`) | `feature/member2-record-creation` | _…_ |
| member3 | Verification (`Verification`) | `feature/member3-verification` | _…_ |
| member4 | Transfer/Revoke/Audit (`AuditTrail`) | `feature/member4-transfer-audit` | _…_ |

> Member labels are generic — map them to real students (and GitHub handles in `.github/CODEOWNERS`) when you assign slices.

## Branching
Branch off `develop`; PR into `develop` (never `main`). Each PR = 1 contract + 1 frontend + 1 test + 1 doc change. See PROJECT_BRIEF §8.
