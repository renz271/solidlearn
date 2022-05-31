1] Contract
pragma solidity ^0.5.0; contract C {
//private state variable uint private data;
//public state variable uint public info;
//constructor constructor() public {
info = 10;
}
//private function
function increment(uint a) private pure returns(uint) { return a + 1; }
//public function
function updateData(uint a) public { data = a; }
function getData() public view returns(uint) { return data; }
function compute(uint a, uint b) internal pure returns (uint) { return a + b; }
}
//External Contract contract D {
function readData() public returns(uint) { C c = new C();
c.updateData(7); return c.getData();
}
}
//Derived Contract contract E is C {
uint private result; C private c;
constructor() public { c = new C();
}
function getComputedResult() public { result = compute(3, 5);
}
function getResult() public view returns(uint) { return result; } function getData() public view returns(uint) { return c.info(); }
}


2] Inheritance
Code:
pragma solidity ^0.5.0;
contract C {
//private state variable uint private data;
//public state variable uint public info;
//constructor constructor() public {
info = 10;
}
//private function
function increment(uint a) private pure returns(uint) { return a + 1; }
//public function
function updateData(uint a) public { data = a; }
function getData() public view returns(uint) { return data; }
function compute(uint a, uint b) internal pure returns (uint) { return a + b; }
}
//Derived Contract
contract E is C { uint private result; C private c;
constructor() public { c = new C();
}
function getComputedResult() public { result = compute(3, 5);
}
function getResult() public view returns(uint) { return result; } function getData() public view returns(uint) { return c.info(); }
}


3] Constructor
Code:
// creating a constructor pragma solidity ^0.5.0;
// Creating a contract
contract constructorExample {
// Declaring state variable string str;
// Creating a constructor
// to set value of 'str' constructor() public {
str = "GeeksForGeeks";
}
// Defining function to
// return the value of 'str' function getValue(
) public view returns ( string memory) { return str;
}
}

4] Abstract Contract
Code:
pragma solidity ^0.5.0; contract Calculator {
function getResult() public view returns(uint);
}
contract Test is Calculator {
function getResult() public view returns(uint) { uint a = 1;
uint b = 2;
uint result = a + b; return result;
}
}

5] Interface
Code:
pragma solidity ^0.5.0; interface Calculator {
function getResult() external view returns(uint);
}
contract Test is Calculator { constructor() public {}
function getResult() external view returns(uint){ uint a = 1;
uint b = 2;
uint result = a + b; return result;
}
}

