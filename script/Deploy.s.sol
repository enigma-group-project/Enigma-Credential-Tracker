// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import {Script, console2} from "forge-std/Script.sol";
import {IssuerRegistry} from "../contracts/IssuerRegistry.sol";
import {RecordRegistry} from "../contracts/RecordRegistry.sol";
import {Verification} from "../contracts/Verification.sol";
import {AuditTrail} from "../contracts/AuditTrail.sol";

/// @notice Deploys + wires the Enigma-Credential-Tracker spine. Scenario: Diploma and certificate verification: an employer verifies a credential in seconds without contacting the registrar, while the issuer keeps the power to revoke.
contract Deploy is Script {
    function run() external {
        vm.startBroadcast();
        IssuerRegistry issuers = new IssuerRegistry();
        RecordRegistry records = new RecordRegistry(address(issuers));
        Verification verifier = new Verification(address(records));
        AuditTrail audit = new AuditTrail(address(records));
        records.setController(address(audit));
        vm.stopBroadcast();

        console2.log("IssuerRegistry:", address(issuers));
        console2.log("RecordRegistry:", address(records));
        console2.log("Verification :", address(verifier));
        console2.log("AuditTrail   :", address(audit));
    }
}
