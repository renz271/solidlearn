1] Withdrawl Pattern
Code:
Output:
2] *Restricted Access
pragma solidity ^0.8.0;
contract WithdrawalContract { address public richest;
uint public mostSent;
mapping (address => uint) pendingWithdrawals; error NotEnoughEther();
constructor() payable { richest = msg.sender; mostSent = msg.value;
}
function becomeRichest() public payable {
if (msg.value <= mostSent) revert NotEnoughEther(); pendingWithdrawals[richest] += msg.value;
richest = msg.sender; mostSent = msg.value;
}
function withdraw() public {
uint amount = pendingWithdrawals[msg.sender]; pendingWithdrawals[msg.sender] = 0; payable(msg.sender).transfer(amount);
}
}

B Access restriction
pragma solidity ^0.8.4;
contract AccessRestriction {
address public owner = msg.sender;
uint public creationTime = block.timestamp;
error Unauthorized();
error TooEarly();
error NotEnoughEther();
modifier onlyBy(address account)
{
if (msg.sender != account) revert Unauthorized();
_;
}
function changeOwner(address newOwner) public
onlyBy(owner)
{
owner = newOwner;
}
modifier onlyAfter(uint time) { if (block.timestamp < time)
revert TooEarly();
_;
}
function disown() public onlyBy(owner)
onlyAfter(creationTime + 6 weeks)
{
delete owner;
}
modifier costs(uint amount) { if (msg.value < amount)
revert NotEnoughEther();
_;
if (msg.value > amount) payable(msg.sender).transfer(msg.value - amount)}
function forceOwnerChange(address newOwner) public
payable costs(200 ether)
{
owner = newOwner;
// just some example condition
if (uint160(owner) & 0 == 1)
// This did not refund for Solidity
U.D.I.T M.Sc.(IT) Sem IV (2021-22)
Reynold Barretto 30 Seat No: 2201131
Output:
// before version 0.4.0.
return;
// refund overpaid fees
}
}
