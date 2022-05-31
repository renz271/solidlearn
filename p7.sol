Libraries, Assembly, Events, Error handling.
1] Library
Code:
pragma solidity ^0.5.0; library Search {
function indexOf(uint[] storage self, uint value) public view returns (uint) { for (uint i = 0; i < self.length; i++)if (self[i] == value) return i;
return uint(-1);
}
}
contract Test {
using Search for uint[]; uint[] data; constructor() public {
data.push(1);
data.push(2);
data.push(3);
data.push(4);
data.push(5);
}
function isValuePresent() external view returns(uint){ uint value = 4;
//Now data is representing the Library uint index = data.indexOf(value); return index;
}
}

2] Assembly
Code:
pragma solidity ^0.5.0;
library Sum {
function sumUsingInlineAssembly(uint[] memory _data) public pure returns (uint o_sum) { for (uint i = 0; i < _data.length; ++i) {
assembly {
o_sum := add(o_sum, mload(add(add(_data, 0x20), mul(i, 0x20))))
}
}
}
}
contract Test { uint[] data;
constructor() public { data.push(1);
data.push(2);
data.push(3);
data.push(4);
data.push(5);
}
function sum() external view returns(uint){ return Sum.sumUsingInlineAssembly(data);
}
}


3] Error Handling
Code:
pragma solidity ^0.5.0; contract Vendor { address public seller; modifier onlySeller() { require(
msg.sender == seller, "Only seller can call this."
);
_;
}
function sell(uint amount) public payable onlySeller { if (amount > msg.value / 2 ether)
revert("Not enough Ether provided.");
// Perform the sell operation.
}
}


