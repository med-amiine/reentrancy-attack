// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

//   bool internal locked;

// Adding lock contract to prevent the attack
// modifier noReentrant() {
//         require(!locked, "No re-entrancy");
//         locked = true;
//         _;
//         locked = false;
//     }    

contract DepositFunds {
    mapping(address => uint) public balances;

    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }

    function withdraw() public {
        uint bal = balances[msg.sender];
        require(bal > 0);

        (bool sent, ) = msg.sender.call{value: bal}("");
        require(sent, "Failed to send Ether");

        balances[msg.sender] = 0;
    }


}