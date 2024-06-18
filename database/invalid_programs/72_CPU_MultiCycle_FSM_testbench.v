// This program was cloned from: https://github.com/FIUSCIS-CDA/CPU_MultiCycle
// License: MIT License

///////////////////////////////////////////////////////////////////////////////////
// Testbench for Component: FSM (CLK=20)
// Package: FIUSCIS-CDA
// Course: CDA3102 (Computer Architecture), Florida International University
// Developer: Trevor Cickovski
// Extended By: CDA3102 students
// License: MIT, (C) 2020-2022 All Rights Reserved
///////////////////////////////////////////////////////////////////////////////////


module testbench();
`include "../../Test/Test.v"
///////////////////////////////////////////////////////////////////////////////////
// Inputs: clk, reset, addrctl (1-bit), Opcode (6-bit)
   reg clk, rst;
   //reg[15:0] ADDRCTL;
   reg[5:0] Op;
   reg[5:0] Funct;
///////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////
// Output: Next State (NS, 4-bit)
   wire[4:0] NS;
///////////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////////
// Component is CLOCKED
// Set clk period to 20 in wave
localparam CLK_PERIOD=20;
///////////////////////////////////////////////////////////////////////////////////


   ///////////////////////////////////////
   // SUPPORTED OPCODES
   parameter LW = 6'b100011;
   parameter SW = 6'b101011;
   parameter RTYPE = 6'b000000;
   parameter BEQ = 6'b000100;
   parameter J = 6'b000010;
   parameter ADDI = 6'b001000;
   parameter BNE = 6'b000101;
   parameter SLTI = 6'b001010;
   parameter LUI = 6'b001111; 
   parameter ORI = 6'b001101;
   ///////////////////////////////////////

   ///////////////////////////////////////
   // SUPPORTED FUNCTCODES
   parameter ADD = 6'b100000;
   parameter SUB = 6'b100010;
   parameter ANDD = 6'b100100;
   parameter ORR = 6'b100101;
   parameter SLT = 6'b101010;
   parameter SLL = 6'b000000;
   parameter MULT = 6'b011000;
   parameter MFLO = 6'b010010;
   ///////////////////////////////////////



////////////////////////////////////////////////////////////////////////////
// Subroutine to check the state
task checkState;
   input [4:0] thestate;
   
   begin
   #(CLK_PERIOD);
   if (NS!==thestate)
   begin
      $display("Error: Op %d expected %b got %b\n", Op, thestate, NS);
      $stop;
   end
   end
endtask
////////////////////////////////////////////////////////////////////////////



   FSM stateMachine(.clk(clk), .reset(rst), .Funct(Funct), .Op(Op), .NS(NS));
   
   initial begin

   ///////////////////////////////////////////////////////
   // TURN THE POWER ON (one tick)
      rst <= 1;  # (CLK_PERIOD);
      rst <= 0;
   ///////////////////////////////////////////////////////

   ///////////////////////////////////////////////////////
   // LW: 0->1->2->3->4
   $display("Test LW: 0->1->2->3->4");
      Op <= LW;
      checkState(0);
      checkState(1);
      checkState(2);
      checkState(3);
      checkState(4);
   $display("[PASS]");
   ///////////////////////////////////////////////////////


   ///////////////////////////////////////////////////////
   // SW: 0->1->2->5
   $display("Test SW: 0->1->2->5");
      Op <= SW;
      checkState(0);
      checkState(1);
      checkState(2);
      checkState(5);
   $display("[PASS]");
   ///////////////////////////////////////////////////////

   ///////////////////////////////////////////////////////
   // ADD: 0->1->6->7
   $display("Test ADD: 0->1->6->7");
      Op <= RTYPE;  Funct <= ADD;
      checkState(0);
      checkState(1);
      checkState(6);
      checkState(7);
   $display("[PASS]");
   ///////////////////////////////////////////////////////

   ///////////////////////////////////////////////////////
   // SUB: 0->1->6->7
   $display("Test SUB: 0->1->6->7");
      Op <= RTYPE;  Funct <= SUB;
      checkState(0);
      checkState(1);
      checkState(6);
      checkState(7);
   $display("[PASS]");
   ///////////////////////////////////////////////////////



   ///////////////////////////////////////////////////////
   // AND: 0->1->6->7
   $display("Test AND: 0->1->6->7");
      Op <= RTYPE;  Funct <= ANDD;
      checkState(0);
      checkState(1);
      checkState(6);
      checkState(7);
   $display("[PASS]");
   ///////////////////////////////////////////////////////



   ///////////////////////////////////////////////////////
   // OR: 0->1->6->7
   $display("Test OR: 0->1->6->7");
      Op <= RTYPE;  Funct <= ORR;
      checkState(0);
      checkState(1);
      checkState(6);
      checkState(7);
   $display("[PASS]");
   ///////////////////////////////////////////////////////



   ///////////////////////////////////////////////////////
   // SLT: 0->1->6->7
   $display("Test SLT: 0->1->6->7");
      Op <= RTYPE;  Funct <= SLT;
      checkState(0);
      checkState(1);
      checkState(6);
      checkState(7);
   $display("[PASS]");
   ///////////////////////////////////////////////////////



   ///////////////////////////////////////////////////////
   // SLL: 0->1->6->7
   $display("Test SLL: 0->1->6->7");
      Op <= RTYPE;  Funct <= SLL;
      checkState(0);
      checkState(1);
      checkState(6);
      checkState(7);
   $display("[PASS]");
   ///////////////////////////////////////////////////////



   ///////////////////////////////////////////////////////
   // MULT: 0->1->6->14
   $display("Test MULT: 0->1->6->14");
      Op <= RTYPE;  Funct <= MULT;
      checkState(0);
      checkState(1);
      checkState(6);
      checkState(13);
   $display("[PASS]");
   ///////////////////////////////////////////////////////



   ///////////////////////////////////////////////////////
   // ADD: 0->1->6->15
   $display("Test ADD: 0->1->6->15");
      Op <= RTYPE;  Funct <= MFLO;
      checkState(0);
      checkState(1);
      checkState(6);
      checkState(14);
   $display("[PASS]");
   ///////////////////////////////////////////////////////



   ///////////////////////////////////////////////////////
   // BEQ: 0->1->8
   $display("Test BEQ: 0->1->8");
      Op <= BEQ;
      checkState(0);
      checkState(1);
      checkState(8);
   $display("[PASS]");
   ///////////////////////////////////////////////////////

   ///////////////////////////////////////////////////////
   // J: 0->1->9
   $display("Test J: 0->1->9");
      Op <= J;
      checkState(0);
      checkState(1);
      checkState(9);
   $display("[PASS]");
   ///////////////////////////////////////////////////////

   ///////////////////////////////////////////////////////
   // ADDI: 0->1->2->10
   $display("Test ADDI: 0->1->2->10");
      Op <= ADDI;
      checkState(0);
      checkState(1);
      checkState(2);
      checkState(10);
   $display("[PASS]");
   ///////////////////////////////////////////////////////

   ///////////////////////////////////////////////////////
   // BNE: 0->1->11
   $display("Test BNE: 0->1->11");
      Op <= BNE;
      checkState(0);
      checkState(1);
      checkState(11);
   $display("[PASS]");
   ///////////////////////////////////////////////////////

   ///////////////////////////////////////////////////////
   // SLTI: 0->1->12->10
   $display("Test SLTI: 0->1->12->10");
      Op <= SLTI;
      checkState(0);
      checkState(1);
      checkState(12);
      checkState(10);
   $display("[PASS]");
   ///////////////////////////////////////////////////////

   ///////////////////////////////////////////////////////
   // LUI: 0->1->15->10
   $display("Test LUI: 0->1->15->10");
      Op <= LUI;
      checkState(0);
      checkState(1);
      checkState(15);
      checkState(10);
   $display("[PASS]");
   ///////////////////////////////////////////////////////  

   ///////////////////////////////////////////////////////
   // ORI: 0->1->16->10
   $display("Test ORI: 0->1->16->10");
      Op <= ORI;
      checkState(0);
      checkState(1);
      checkState(16);
      checkState(10);
   $display("[PASS]");
   ///////////////////////////////////////////////////////



   ///////////////////////////////////////////////////////
   // ENSURE FSM RETURNS TO ZERO
   $display("Test return to State 0");
      checkState(0);
   $display("[PASS]");
   ///////////////////////////////////////////////////////

   $display("All tests passed.\n");

   end

   // Generate clock
   /*always @*
   begin
      clk <= 1;       # (CLK_PERIOD/2);
      clk <= 0;       # (CLK_PERIOD/2);
   end*/
   

endmodule
