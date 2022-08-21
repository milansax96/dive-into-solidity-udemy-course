//SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <0.9.0;

contract KnowledgeTest {
    string[] public tokens = ["BTC", "ETH"];
    address[] public players;
    // Add a public state variable of type address called `owner.`
    address public owner;

    /* Add a restriction so that only the `owner` can call `transferAll()`, 
        otherwise, make it revert with an `"ONLY_OWNER"` error (use a require statement). */
    modifier onlyOwner {
        require(msg.sender == owner, "ONLY_OWNER");
        _;
    }

    // Declare the `constructor` and initialize the owner variable in the constructor.
    constructor() {
        // The `owner` should be initialized with the address of the account that deploys the contract.
        owner = msg.sender;
    }

    /* Make it so that the contract can receive ETH by sending 
        it directly to the contract address. */
    receive() external payable {

    }

    /* Modify the `changeTokens()` function in such a way that it changes 
        the state variable called tokens. */
    function changeTokens() public {
        string[] storage t = tokens;
        t[0] = "VET";
    }

    // Add a function called `getBalance()` that returns the contract's balance.
    function getBalance() public view returns (uint) {
        return address(this).balance;
    }

    /* Add a function called `transferAll()` that takes an argument of type `address` and 
        transfers the entire balance of the contract to it. */
    function transferAll(address payable destination) public onlyOwner {
        uint contractBalance = getBalance();
        destination.transfer(contractBalance);
    }

    /* Add a function called `start()` that adds the address of the account 
        that calls it to the dynamic array called `players.` */
    function start() public {
        players.push(msg.sender);
    }

    /* Declare a function called `concatenate` that takes two strings as parameters 
        and returns them concatenated. */
    function concatenate(string memory s1, string memory s2) public pure returns (string memory) {
        return string(abi.encodePacked(s1, s2));
    }
}
