// This program was cloned from: https://github.com/FIUSCIS-CDA/CPU_Pipelined
// License: MIT License

//////////////////////////////////////////////////////////////
// Testbench for Component: ForwardDetection
// Package: FIUSCIS-CDA
// Course: CDA3102 (Computer Architecture), Florida International University
// Developer: Trevor Cickovski
// Extended By: CDA3102 students
// License: MIT, (C) 2020-2022 All Rights Reserved
///////////////////////////////////////////////////////////////////////////////////

module testbench();
`include "../../Test/Test.v"
///////////////////////////////////////////////////////////////////////////////////
// Inputs: MEMop, WBop (6-bit)
//         EXrp, EXrm, EXrn, IDs, IDrn, MEMrn,
//         MEMrp, WBrn, WBrp, MEMrm, WBrm (5-bit)
  reg[5:0] MEMop, WBop;
  reg[4:0] EXrp, EXrm, EXrn, IDrm, IDrn, MEMrn, MEMrp, WBrn, WBrp, MEMrm, WBrm;
///////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////
// Outputs: forwardBfromWBtoID, forwardBfromWBtoEX, forwardBfromMEMtoID, forwardBfromMEMtoEX,
// forwardAfromWBtoID, forwardAfromWBtoEX, forwardAfromMEMtoID, forwardAfromMEMtoEX (1 bit) 
  wire forwardBfromWBtoID, forwardBfromWBtoEX, forwardBfromMEMtoID, forwardBfromMEMtoEX;
  wire forwardAfromWBtoID, forwardAfromWBtoEX, forwardAfromMEMtoID, forwardAfromMEMtoEX;
/////////////////////////////////////////////////////////////////////////////////////////////

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

///////////////////////////////////////////////////////////////////////////
// ROUTINE TO SET INITIAL STATE
// OPCODES ALL ZERO
// REGISTERS ALL DIFFERENT
task initialState;
   begin
      WBop = 6'b000000;
      MEMop = 6'b000000;      
      EXrp = 5'b00001;
      EXrm = 5'b00010;
      EXrn = 5'b00011;
      IDrm = 5'b00100;
      IDrn = 5'b00101;
      MEMrn = 5'b00110;
      MEMrp = 5'b00111;
      WBrn = 5'b01000;
      WBrp = 5'b01001;
   end
endtask
///////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////
// ROUTINE TO SETUP A FORWARD (TOTAL TIME: 10)
// GO BACK TO INITIAL STATE
// THEN SET WIRES TO PASSED VALUES
task setupForward;
   output [6:0] op1;
   input [6:0] opcode1;
   output [5:0] reg1;
   output [5:0] reg2;

begin
   initialState; #10;
   op1 = opcode1; reg1=5'b10101; reg2=5'b10101;      
end
endtask
///////////////////////////////////////////////////////////////////////////


ForwardAfromMEMtoEX unit0(.EXrm(EXrm),.MEMop(MEMop),.MEMrp(MEMrp),.MEMrn(MEMrn),.Y(forwardAfromMEMtoEX));
ForwardAfromMEMtoID unit1(.IDrm(IDrm),.MEMop(MEMop),.MEMrp(MEMrp),.MEMrn(MEMrn),.Y(forwardAfromMEMtoID));
ForwardAfromWBtoEX unit2(.EXrm(EXrm),.WBop(WBop),.WBrp(WBrp),.WBrn(WBrn),.Y(forwardAfromWBtoEX));
ForwardAfromWBtoID unit3(.IDrm(IDrm),.WBop(WBop),.WBrp(WBrp),.WBrn(WBrn),.Y(forwardAfromWBtoID));
ForwardBfromMEMtoEX unit4(.EXrn(EXrn),.MEMop(MEMop),.MEMrp(MEMrp),.MEMrn(MEMrn),.Y(forwardBfromMEMtoEX));
ForwardBfromMEMtoID unit5(.IDrn(IDrn),.MEMop(MEMop),.MEMrp(MEMrp),.MEMrn(MEMrn),.Y(forwardBfromMEMtoID));
ForwardBfromWBtoEX unit6(.EXrn(EXrn),.WBop(WBop),.WBrp(WBrp),.WBrn(WBrn),.Y(forwardBfromWBtoEX));
ForwardBfromWBtoID unit7(.IDrn(IDrn),.WBop(WBop),.WBrp(WBrp),.WBrn(WBrn),.Y(forwardBfromWBtoID));
   
   initial begin
   ////////////////////////////////////////////////////////////////////
   // Each test is 20 time units total
   ///////////////////////////////////////////////////////////////////
   // A, MEM->ID
   $display("[A, MEM->ID] MEMop=RTYPE, MEMrp=IDrm");
   setupForward(MEMop, RTYPE, MEMrp, IDrm); #10;
   verifyEqual(forwardAfromMEMtoID, 1); 

   $display("[A, MEM->ID] MEMop=ADDI, MEMrn=IDrm");
   setupForward(MEMop, ADDI, MEMrn, IDrm); #10;
   verifyEqual(forwardAfromMEMtoID, 1);

   $display("[A, MEM->ID] MEMop=SLTI, MEMrn=IDrm");
   setupForward(MEMop, SLTI, MEMrn, IDrm); #10;
   verifyEqual(forwardAfromMEMtoID, 1); 

   $display("[A, MEM->ID] MEMop=LUI, MEMrn=IDrm");
   setupForward(MEMop, LUI, MEMrn, IDrm); #10;
   verifyEqual(forwardAfromMEMtoID, 1); 

   $display("[A, MEM->ID] MEMop=ORI, MEMrn=IDrm");
   setupForward(MEMop, ORI, MEMrn, IDrm); #10;
   verifyEqual(forwardAfromMEMtoID, 1);
   ///////////////////////////////////////////////////////////////////

   ///////////////////////////////////////////////////////////////////
   // A, WB->ID
   $display("[A, WB->ID] WBop=RTYPE, WBrp=IDrm");
   setupForward(WBop, RTYPE, WBrp, IDrm); #10;
   verifyEqual(forwardAfromWBtoID, 1); 

   $display("[A, WB->ID] WBop=ADDI, WBrn=IDrm");
   setupForward(WBop, ADDI, WBrn, IDrm); #10;
   verifyEqual(forwardAfromWBtoID, 1); 

   $display("[A, WB->ID] WBop=LW, WBrn=IDrm");
   setupForward(WBop, LW, WBrn, IDrm); #10;
   verifyEqual(forwardAfromWBtoID, 1); 

   $display("[A, WB->ID] WBop=SLTI, WBrn=IDrm");
   setupForward(WBop, SLTI, WBrn, IDrm); #10;
   verifyEqual(forwardAfromWBtoID, 1); 

   $display("[A, WB->ID] WBop=LUI, WBrn=IDrm");
   setupForward(WBop, LUI, WBrn, IDrm); #10;
   verifyEqual(forwardAfromWBtoID, 1); 

   $display("[A, WB->ID] WBop=ORI, WBrn=IDrm");
   setupForward(WBop, ORI, WBrn, IDrm); #10;
   verifyEqual(forwardAfromWBtoID, 1); 
   ///////////////////////////////////////////////////////////////////
   
   ///////////////////////////////////////////////////////////////////
   // B, MEM->ID
   $display("[B, MEM->ID] MEMop=RTYPE, MEMrp=IDrn");
   setupForward(MEMop, RTYPE, MEMrp, IDrn); #10;
   verifyEqual(forwardBfromMEMtoID, 1); 

   $display("[B, MEM->ID] MEMop=ADDI, MEMrn=IDrn");
   setupForward(MEMop, ADDI, MEMrn, IDrn); #10;
   verifyEqual(forwardBfromMEMtoID, 1); 

   $display("[B, MEM->ID] MEMop=SLTI, MEMrn=IDrn");
   setupForward(MEMop, SLTI, MEMrn, IDrn); #10;
   verifyEqual(forwardBfromMEMtoID, 1); 

   $display("[B, MEM->ID] MEMop=LUI, MEMrn=IDrn");
   setupForward(MEMop, LUI, MEMrn, IDrn); #10;
   verifyEqual(forwardBfromMEMtoID, 1); 

   $display("[B, MEM->ID] MEMop=ORI, MEMrn=IDrn");
   setupForward(MEMop, ORI, MEMrn, IDrn); #10;
   verifyEqual(forwardBfromMEMtoID, 1); 
   ///////////////////////////////////////////////////////////////////

   ///////////////////////////////////////////////////////////////////
   // B, WB->ID
   $display("[B, WB->ID] WBop=RTYPE, WBrp=IDrn");
   setupForward(WBop, RTYPE, WBrp, IDrn); #10;
   verifyEqual(forwardBfromWBtoID, 1); 

   $display("[B, WB->ID] WBop=ADDI, WBrn=IDrn");
   setupForward(WBop, ADDI, WBrn, IDrn); #10;
   verifyEqual(forwardBfromWBtoID, 1); 

   $display("[B, WB->ID] WBop=LW, WBrn=IDrn");
   setupForward(WBop, LW, WBrn, IDrn); #10;
   verifyEqual(forwardBfromWBtoID, 1); 

   $display("[B, WB->ID] WBop=SLTI, WBrn=IDrn");
   setupForward(WBop, SLTI, WBrn, IDrn); #10;
   verifyEqual(forwardBfromWBtoID, 1); 

   $display("[B, WB->ID] WBop=LUI, WBrn=IDrn");
   setupForward(WBop, LUI, WBrn, IDrn); #10;
   verifyEqual(forwardBfromWBtoID, 1); 

   $display("[B, WB->ID] WBop=ORI, WBrn=IDrn");
   setupForward(WBop, ORI, WBrn, IDrn); #10;
   verifyEqual(forwardBfromWBtoID, 1); 
   ///////////////////////////////////////////////////////////////////


   ///////////////////////////////////////////////////////////////////
   // A, MEM->EX
   $display("[A, MEM->EX] MEMop=RTYPE, MEMrp=EXrm");
   setupForward(MEMop, RTYPE, MEMrp, EXrm); #10;
   verifyEqual(forwardAfromMEMtoEX, 1); 

   $display("[A, MEM->EX] MEMop=ADDI, MEMrn=EXrm");
   setupForward(MEMop, ADDI, MEMrn, EXrm); #10;
   verifyEqual(forwardAfromMEMtoEX, 1); 

   $display("[A, MEM->EX] MEMop=SLTI, MEMrn=EXrm");
   setupForward(MEMop, SLTI, MEMrn, EXrm); #10;
   verifyEqual(forwardAfromMEMtoEX, 1); 

   $display("[A, MEM->EX] MEMop=LUI, MEMrn=EXrm");
   setupForward(MEMop, LUI, MEMrn, EXrm); #10;
   verifyEqual(forwardAfromMEMtoEX, 1); 

   $display("[A, MEM->EX] MEMop=ORI, MEMrn=EXrm");
   setupForward(MEMop, ORI, MEMrn, EXrm); #10;
   verifyEqual(forwardAfromMEMtoEX, 1); 
   //////////////////////////////////////////////////////////////////
   
   //////////////////////////////////////////////////////////////////
   // A, WB->EX
   $display("[A, WB->EX] WBop=RTYPE, WBrp=EXrm");
   setupForward(WBop, RTYPE, WBrp, EXrm); #10;
   verifyEqual(forwardAfromWBtoEX, 1); 

   $display("[A, WB->EX] WBop=ADDI, WBrn=EXrm");
   setupForward(WBop, ADDI, WBrn, EXrm); #10;
   verifyEqual(forwardAfromWBtoEX, 1); 

   $display("[A, WB->EX] WBop=LW, WBrn=EXrm");
   setupForward(WBop, LW, WBrn, EXrm); #10;
   verifyEqual(forwardAfromWBtoEX, 1); 

   $display("[A, WB->EX] WBop=SLTI, WBrn=EXrm");
   setupForward(WBop, SLTI, WBrn, EXrm); #10;
   verifyEqual(forwardAfromWBtoEX, 1); 

   $display("[A, WB->EX] WBop=LUI, WBrn=EXrm");
   setupForward(WBop, LUI, WBrn, EXrm); #10;
   verifyEqual(forwardAfromWBtoEX, 1); 

   $display("[A, WB->EX] WBop=ORI, WBrn=EXrm");
   setupForward(WBop, ORI, WBrn, EXrm); #10;
   verifyEqual(forwardAfromWBtoEX, 1); 
   /////////////////////////////////////////////////////////////////

   /////////////////////////////////////////////////////////////////
   // B, MEM->EX
   $display("[A, MEM->EX] MEMop=RTYPE, MEMrp=EXrn");
   setupForward(MEMop, RTYPE, MEMrp, EXrn); #10;
   verifyEqual(forwardBfromMEMtoEX, 1); 

   $display("[A, MEM->EX] MEMop=ADDI, MEMrn=EXrn");
   setupForward(MEMop, ADDI, MEMrn, EXrn); #10;
   verifyEqual(forwardBfromMEMtoEX, 1); 

   $display("[A, MEM->EX] MEMop=SLTI, MEMrn=EXrn");
   setupForward(MEMop, SLTI, MEMrn, EXrn); #10;
   verifyEqual(forwardBfromMEMtoEX, 1); 

   $display("[A, MEM->EX] MEMop=LUI, MEMrn=EXrn");
   setupForward(MEMop, LUI, MEMrn, EXrn); #10;
   verifyEqual(forwardBfromMEMtoEX, 1); 

   $display("[A, MEM->EX] MEMop=ORI, MEMrn=EXrn");
   setupForward(MEMop, ORI, MEMrn, EXrn); #10;
   verifyEqual(forwardBfromMEMtoEX, 1); 
   /////////////////////////////////////////////////////////////////

   /////////////////////////////////////////////////////////////////
   // B, WB->EX
   $display("[A, WB->EX] WBop=RTYPE, WBrp=EXrn");
   setupForward(WBop, RTYPE, WBrp, EXrn); #10;
   verifyEqual(forwardBfromWBtoEX, 1); 

   $display("[A, WB->EX] WBop=ADDI, WBrn=EXrn");
   setupForward(WBop, ADDI, WBrn, EXrn); #10;
   verifyEqual(forwardBfromWBtoEX, 1); 

   $display("[A, WB->EX] WBop=LW, WBrn=EXrn");
   setupForward(WBop, LW, WBrn, EXrn); #10;
   verifyEqual(forwardBfromWBtoEX, 1); 

   $display("[A, WB->EX] WBop=SLTI, WBrn=EXrn");
   setupForward(WBop, SLTI, WBrn, EXrn); #10;
   verifyEqual(forwardBfromWBtoEX, 1);

   $display("[A, WB->EX] WBop=LUI, WBrn=EXrn");
   setupForward(WBop, LUI, WBrn, EXrn); #10;
   verifyEqual(forwardBfromWBtoEX, 1);

   $display("[A, WB->EX] WBop=ORI, WBrn=EXrn");
   setupForward(WBop, ORI, WBrn, EXrn); #10;
   verifyEqual(forwardBfromWBtoEX, 1);
   /////////////////////////////////////////////////////////////////

      
      $display("All tests passed.");

   end


endmodule
