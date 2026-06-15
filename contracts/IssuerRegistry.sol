// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

/// @title IssuerRegistry — Slice 1 (Institution Registration)  [STUDENT TEMPLATE]
/// @notice Implement every TODO(member1). Behavior is described in docs/issuer-module.md and
///         locked by test/IssuerRegistry.t.sol — run `forge test` until it is green.
contract IssuerRegistry {
    address public registrar;
    mapping(address => bool) public isInstitution;

    event RegistrarTransferred(address indexed from, address indexed to);
    event InstitutionRegistered(address indexed issuer, address indexed by);
    event InstitutionDeregistered(address indexed issuer, address indexed by);

    error NotRegistrar();
    error ZeroAddress();

    modifier onlyRegistrar() {
        if (msg.sender != registrar) revert NotRegistrar();
        _;
    }

    constructor() {
        registrar = msg.sender;
        emit RegistrarTransferred(address(0), msg.sender);
    }

    /// @notice Grant the issuer role. Admin-only; reject zero address; emit InstitutionRegistered.
    function registerInstitution(address account) external onlyRegistrar {
        // TODO(member1): if account == address(0) revert ZeroAddress();
        //               isInstitution[account] = true; emit InstitutionRegistered(account, msg.sender);
        revert("TODO(member1): implement registerInstitution");
    }

    /// @notice Revoke the issuer role. Admin-only; emit InstitutionDeregistered.
    function deregisterInstitution(address account) external onlyRegistrar {
        // TODO(member1): isInstitution[account] = false; emit InstitutionDeregistered(account, msg.sender);
        revert("TODO(member1): implement deregisterInstitution");
    }

    /// @notice Transfer the registrar key. Admin-only; reject zero address; emit RegistrarTransferred.
    function transferRegistrar(address newAdmin) external onlyRegistrar {
        // TODO(member1): validate newAdmin, emit RegistrarTransferred(registrar, newAdmin), then registrar = newAdmin;
        revert("TODO(member1): implement transferRegistrar");
    }
}
