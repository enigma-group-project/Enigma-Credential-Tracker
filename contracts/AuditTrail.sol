// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import {IAttestationRegistry} from "./interfaces/IAttestationRegistry.sol";
import {RecordRegistry} from "./RecordRegistry.sol";
import {ReentrancyGuard} from "@openzeppelin/contracts/utils/ReentrancyGuard.sol";

/// @title AuditTrail — Slice 4 (Transfer / Revocation / Renewal / Audit)  [STUDENT TEMPLATE]
/// @notice Implement every TODO(member4). Spec: test/AuditTrail.t.sol.
contract AuditTrail is ReentrancyGuard {
    RecordRegistry public immutable registry;

    event HolderTransferred(bytes32 indexed id, address indexed from, address indexed to, uint64 at);
    event CredentialRevoked(bytes32 indexed id, address indexed by, string reason, uint64 at);
    event CredentialRenewed(bytes32 indexed id, bytes32 newHash, string newCid, uint64 at);
    event CredentialEventLogged(bytes32 indexed id, address indexed by, string note, uint64 at);

    error NotOwner();
    error NotInstitutionOrRegistrar();
    error Missing();

    constructor(address recordRegistry) { registry = RecordRegistry(recordRegistry); }

    function transferHolder(bytes32 id, address newOwner) external nonReentrant {
        // TODO(member4): read record; require exists (Missing) + msg.sender==owner (NotOwner);
        //               registry.controllerTransfer(id,newOwner); emit HolderTransferred.
        revert("TODO(member4): implement transferHolder");
    }
    function revokeCredential(bytes32 id, string calldata reason) external nonReentrant {
        // TODO(member4): require exists; require issuer or registry.issuers().registrar() (NotInstitutionOrRegistrar);
        //               registry.controllerRevoke(id,msg.sender); emit CredentialRevoked.
        revert("TODO(member4): implement revokeCredential");
    }
    function renewCredential(bytes32 id, bytes32 newHash, string calldata newCid) external nonReentrant {
        // TODO(member4): same authz; registry.controllerUpdate(...); emit CredentialRenewed.
        revert("TODO(member4): implement renewCredential");
    }
    function logCredentialEvent(bytes32 id, string calldata note) external {
        // TODO(member4): emit CredentialEventLogged(id, msg.sender, note, uint64(block.timestamp));
        revert("TODO(member4): implement logCredentialEvent");
    }
}
