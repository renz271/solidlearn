1] functions
Code:
pragma solidity ^0.8.0; contract local
{
uint age = 10;
function getter() public view returns(uint)
{
return age;
}
function setter() public
{
age = age+1;
}
}


2] Pure and View
Code:
// Pure
pragma solidity ^0.8.0;
contract C {
function f(uint a, uint b) public pure returns (uint) { return a * (b + 42);
}
}
// View contract local
{
uint age = 10;
function getter() public view returns(uint)
{
return age;
}}

3] Fallback Function:
Code:
pragma solidity ^0.8.0; contract fallbackfn
{
event Log(string func,address sender, uint value, bytes data); fallback() external payable
{
emit Log("fallback",msg.sender,msg.value,msg.data);
}
receive() external payable
{
emit Log("receive",msg.sender,msg.value,"");
}
}


5] Mathematical Operation
Code:
pragma solidity ^0.8.0; contract C {
function f() public pure returns (uint256 aMod, uint256 mMod) { uint256 x = 3;
// Old code gen: add/mulmod(5, 4, 3)
// New code gen: add/mulmod(4, 5, 5) aMod = addmod(++x, ++x, x);
mMod = mulmod(++x, ++x, x);
}
}

6] Cryptographic Function
agma solidity ^0.8.13;
contract HashFunction { function hash(

string memory _text, uint _num,
address _addr
) public pure returns (bytes32) {
return keccak256(abi.encodePacked(_text, _num, _addr));
}
function collision(string memory _text, string memory _anotherText) public
pure
returns (bytes32)
{
// encodePacked(AAA, BBB) -> AAABBB
// encodePacked(AA, ABBB) -> AAABBB
return keccak256(abi.encodePacked(_text, _anotherText));
}
}
contract GuessTheMagicWord { bytes32 public answer =
0x60298f78cc0b47170ba79c10aa3851d7648bd96f2f8e46a19dbc777c36fb0c00;
// Magic word is "Solidity"
function guess(string memory _word) public view returns (bool) { return keccak256(abi.encodePacked(_word)) == answer;
}
}

7] Function Modifiers:
Code:
pragma solidity ^0.8.13;
contract FunctionModifier {
// We will use these variables to demonstrate how to use
// modifiers.
address public owner; uint public x = 10;

bool public locked;
constructor() {
// Set the transaction sender as the owner of the contract. owner = msg.sender;
}
modifier onlyOwner() {
require(msg.sender == owner, "Not owner");
_;
}
modifier validAddress(address _addr) { require(_addr != address(0), "Not valid address");
_;
}
function changeOwner(address _newOwner) public onlyOwner validAddress(_newOwner) { owner = _newOwner;
}
modifier noReentrancy() { require(!locked, "No reentrancy");
locked = true;
_;
locked = false;
}
function decrement(uint i) public noReentrancy { x -= i;
if (i > 1) { decrement(i - 1);
}
}
}
