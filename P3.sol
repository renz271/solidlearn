1] Variable
pragma solidity ^0.8.0; contract SolidityTest {
uint storedData; // State variable constructor() public {
storedData = 10;
}
function getResult() public view returns(uint){ uint a = 1; // local variable
uint b = 2;
uint result = a + b;
return result; //access the local variable
}
}

2] Operators
Code:
pragma solidity ^0.8.0;
// Creating a contract contract SolidityTest {
// Initializing variables uint16 public a = 20; uint16 public b = 10;
// Initializing a variable
// with sum
uint public sum = a + b;
// Initializing a variable
// with the difference uint public diff = a - b;

3] Loops
Code:
pragma solidity ^0.8.0;
contract loop{ uint[4] public arr; uint public count;
function looptest() public{ while(count<arr.length){
arr[count] = count; count++;
}
}
}

4] Decision Making
Code:
// 'if...else' statement pragma solidity ^0.8.0; contract decisionMaking{
function check(int a) public pure returns(string memory){ string memory value;
if(a>0)
{
value = "Greater than zero";
}
else if(a==0)
{
value = "Equal to zero";
}
else
{
value = "Less than zero";
}
return value;
}
}


5] Strings and Enum
Code:
pragma solidity ^ 0.8.0;
// Creating a contract contract stringtest {
// Initializing String variable
string public str = "GeeksforGeeks";
// Defining an enumerator
enum my_enum { geeks_, _for, _geeks }
// Defining a function to return
// values stored in an enumerator function Enum() public pure returns( my_enum) {
return my_enum._geeks;
}
}

6] Array
Code:
pragma solidity ^0.8.0; contract Array{
uint[4] public arr =[10,20,30,40];
}

7] Structs
Code:
pragma solidity ^0.8.0;
// Creating a contract contract structtest {
struct Book { string name; string writter; uint id;
bool available;
}
Book book1; Book book2
= Book("Building Ethereum DApps", "Roberto Infante ",
2, false);
function set_book_detail() public {
book1 = Book("Introducing Ethereum and Solidity", "Chris Dannen",
1, true);
}
function book_info(
)public view returns (
string memory, string memory, uint, bool) {
return(book2.name, book2.writter, book2.id, book2.available);
}
function get_details(
) public view returns (string memory, uint) { return (book1.name, book1.id);
}
}



8] Mapping
Code:
pragma solidity ^0.8.0; contract Map
{
mapping(uint=>string) public roll_no;
function setter(uint keys, string memory value) public
{
roll_no[keys]= value;
}
}
Output:
9] Conversion
Code:
pragma solidity ^0.8.0; contract Converse
{
uint a = 10; uint8 b = 20; uint16 c = 30;
function add() public view returns(uint)
{
uint d = a + uint(b) + uint(c); return d;
}
}
