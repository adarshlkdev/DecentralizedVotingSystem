// SPDX-License-Identifier: MIT
pragma solidity >= 0.5.0 <0.9.0;
 // Solidity program to demonstrate 
// DApps
 
// Smart Contract for the Voting application

contract DecentralizedVotingApp { 
 

      // Refer to the owner

      address  public owner;
 

      // Declaring the public variable 'Motive'

      // to demonstrate the purpose of voting 

      string public Motive; 

      

      // Defining a structure with boolean  

      // variables authorized and voted

      struct Voter{

          bool authorized;  

          bool voted;

      }
 

      // Declaring the unsigned integer 

      // variables totalVotes, and for the 

      //3 teams- X,Y, and Z

      uint  totalVotes;

      uint public teamX; 

      uint public  teamY; 

      uint public teamZ;

       

      // Creating a mapping for the total Votes

      mapping(address=>Voter) info; 
 

      // Defining a constructor indicating 

      // the purpose of voting

      constructor(

      string memory purpose){ 

        Motive = purpose;   

        owner = msg.sender;

      }

    

      // Defining a modifier to 

      // verify the ownership

      modifier ownerOn() {

        require(msg.sender==owner);

        _;

    }
      // Defining a function to verify 

      // the person is voted or not

      function authorize(

      address _person) ownerOn public {

        info[_person].authorized= true;

         }

    

      // Defining a function to check and 

      // skip the code if the person is already 

      // voted else allow to vote and 

      // calculate totalvotes for team X   

      function VoteforX(address _address) public { 

        require(

        !info[_address].voted, 

        "already voted person");

        require(

        info[_address].authorized, 

        "You Have No Right for Vote");

        info[_address].voted = true;

        teamX = teamX+1;

        totalVotes++;

      }
 

      // Defining a function to check 

      // and skip the code if the person

      // is already voted else allow to vote 

      // and calculate totalvotes for team Y 

      function VoteforY(address _address) public {

       require(

       !info[_address].voted, 

       "already voted person"); 

        require(

        info[_address].authorized, 

        "You Have No Right for Vote"); 

        teamY = teamY+1;

        info[_address].voted = true;

        totalVotes++;

      }
 

      // Defining a function to check 

      // and skip the code if the person

      // is already voted else allow to vote 

      // and calculate totalvotes for team Z   

      function VoteforZ(address _address) public returns(

      string memory){

        require(

        !info[_address].voted, 

        "already voted person"); 

        require(

        info[_address].authorized, 

        "You Have No Right for Vote"); 

        info[_address].voted = true;

        teamZ=teamZ+1;

        totalVotes++;

        return("Thanks for Voting");

      }
 

      function totalvotes() public view returns(uint){

          return totalVotes;

      }
 

      // Defining a function to announce 

      // the result of voting and 

      // the name of the winning team

      function resultOfVoting() public view returns(

      string memory){

          if(teamX>teamY){

              if(teamX>teamZ){

                  return"X is Winning";
                  

              }

              else if(teamZ>teamX){

                  return "Z is Winning"; } }

          else if(teamY>teamZ) {

              return "Y is Winning";

          }

          else if(

          teamX==teamY && teamX==teamZ || teamY==teamZ ){

              return "No One is Winning";

          }

       }

    }