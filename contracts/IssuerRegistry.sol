// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

/// @title IssuerRegistry — Slice 1 (Institution Registration)  [STUDENT TEMPLATE]
/// @notice Implement every TODO(member1). OpenZeppelin Ownable: owner = Registrar.
contract IssuerRegistry is Ownable {
    mapping(address => bool) public isInstitution;

    event RegistrarTransferred(address indexed from, address indexed to);
    event InstitutionRegistered(address indexed institution, address indexed by);
    event InstitutionDeregistered(address indexed institution, address indexed by);

    error NotRegistrar();
    error ZeroAddress();

    modifier onlyRegistrar() { if (msg.sender != owner()) revert NotRegistrar(); _; }

    constructor() Ownable(msg.sender) { emit RegistrarTransferred(address(0), msg.sender); }

    function registrar() external view returns (address) { return owner(); }

    function registerInstitution(address account) external onlyRegistrar {
        // TODO(member1): if (account==address(0)) revert ZeroAddress(); isInstitution[account]=true; emit InstitutionRegistered(account,msg.sender);
        revert("TODO(member1): implement registerInstitution");
    }
    function deregisterInstitution(address account) external onlyRegistrar {
        // TODO(member1): isInstitution[account]=false; emit InstitutionDeregistered(account,msg.sender);
        revert("TODO(member1): implement deregisterInstitution");
    }
    function transferRegistrar(address newAdmin) external onlyRegistrar {
        // TODO(member1): validate; _transferOwnership(newAdmin); emit RegistrarTransferred(prev,newAdmin);
        revert("TODO(member1): implement transferRegistrar");
    }
}
