
// Solidity program to demonstrate
// local variables
pragma solidity ^0.5.0;
  
// Creating a contract
contract Solidity_var_Test {
  
   // Defining function to show the declaration and
   // scope of local variables
   function getResult() public view returns(uint){
       
      // Initializing local variables
      uint local_var1 = 1; 
      uint local_var2 = 2;
      uint result = local_var1 + local_var2;
       
      // Access the local variable
      return result; 
   }
}
