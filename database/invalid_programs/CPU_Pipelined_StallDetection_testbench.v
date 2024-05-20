// This program was cloned from: https://github.com/FIUSCIS-CDA/CPU_Pipelined
// License: MIT License

///////////////////////////////////////////////////////////////////////////////////
// Testbench for Component: StallDetection
// Package: FIUSCIS-CDA
// Course: CDA3102 (Computer Architecture), Florida International University
// Developer: Trevor Cickovski
// Extended By: CDA3102 students
// License: MIT, (C) 2020-2022 All Rights Reserved
///////////////////////////////////////////////////////////////////////////////////

module testbench();
`include "../../Test/Test.v"
///////////////////////////////////////////////////////////////////////////////////
// Inputs: IDop, EXop, MEMop (6-bit)
//         EXrp, EXrm, EXrn, IDs, IDrn, MEMrn (5-bit)
  reg[5:0] IDop, EXop, MEMop;
  reg[4:0] EXrp, EXrm, EXrn, IDrm, IDrn, MEMrn;
///////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////
// Outputs: IDstall, EXstall (1-bit)
  wire IDstall, EXstall;
///////////////////////////////////////////////////////////////////////////////////

   ///////////////////////////////////////
   // SUPPORTED OPCODES
   parameter LW = 6'b100011;
   parameter SW = 6'b101011;
   parameter RTYPE = 6'b000000;
   parameter BEQ = 6'b000100;
   parameter BNE = 6'b000101;
   parameter J = 6'b000010;
   parameter ADDI = 6'b001000;
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
      IDop = 6'b000000;
      EXop = 6'b000000;
      MEMop = 6'b000000;      
      EXrp = 5'b00001;
      EXrm = 5'b00010;
      EXrn = 5'b00011;
      IDrm = 5'b00100;
      IDrn = 5'b00101;
      MEMrn = 5'b00110;
   end
endtask
///////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////
// ROUTINE TO SETUP A STALL (TOTAL TIME: 10)
// GO BACK TO INITIAL STATE
// THEN SET WIRES TO PASSED VALUES
task setupStall;
   input theStall;
   output [6:0] op1;
   input [6:0] opcode1;
   output [6:0] op2;
   input [6:0] opcode2;
   output [5:0] reg1;
   output [5:0] reg2;


begin
   initialState; #10;
   op1 = opcode1; op2=opcode2; reg1=5'b10101; reg2=5'b10101;  
end
endtask
///////////////////////////////////////////////////////////////////////////
	
StallDetection stallDetector(.EXop(EXop), .EXrp(EXrp), .EXrm(EXrm), .EXrn(EXrn), 
                             .IDop(IDop), .IDrm(IDrm), .IDrn(IDrn), 
                             .MEMop(MEMop), .MEMrn(MEMrn), .IDStall(IDstall), .EXStall(EXstall));
   
   initial begin

   ///////////////////////////////////////////////////////////////////////////////
   // IDSTALL TESTS (Time: 20 each)
   $display("[IDSTALL] IDop=BEQ, EXop=RTYPE, EXrp=IDrm");
   setupStall(IDstall, IDop, BEQ, EXop, RTYPE, EXrp, IDrm); #10;
   verifyEqual(IDstall, 1);

   $display("[IDSTALL] IDop=BEQ, EXop=RTYPE, EXrp=IDrn");
   setupStall(IDstall, IDop, BEQ, EXop, RTYPE, EXrp, IDrn); #10;
   verifyEqual(IDstall, 1);

   $display("[IDSTALL] IDop=BEQ, EXop=LW, EXrn=IDrm");
   setupStall(IDstall, IDop, BEQ, EXop, LW, EXrn, IDrm); #10;
   verifyEqual(IDstall, 1);

   $display("[IDSTALL] IDop=BEQ, EXop=LW, EXrn=IDrn");
   setupStall(IDstall, IDop, BEQ, EXop, LW, EXrn, IDrn); #10;
   verifyEqual(IDstall, 1);

   $display("[IDSTALL] IDop=BEQ, EXop=ADDI, EXrn=IDrm");
   setupStall(IDstall, IDop, BEQ, EXop, ADDI, EXrn, IDrm); #10;
   verifyEqual(IDstall, 1);

   $display("[IDSTALL] IDop=BEQ, EXop=ADDI, EXrn=IDrn");
   setupStall(IDstall, IDop, BEQ, EXop, ADDI, EXrn, IDrn); #10;
   verifyEqual(IDstall, 1);

   $display("[IDSTALL] IDop=BEQ, MEMop=LW, MEMrn=IDrm");
   setupStall(IDstall, IDop, BEQ, MEMop, LW, MEMrn, IDrm); #10;
   verifyEqual(IDstall, 1);

   $display("[IDSTALL] IDop=BEQ, MEMop=LW, MEMrn=IDrn");
   setupStall(IDstall, IDop, BEQ, MEMop, LW, MEMrn, IDrn); #10;
   verifyEqual(IDstall, 1);

   $display("[IDSTALL] IDop=BEQ, EXop=SLTI, EXrn=IDrm");
   setupStall(IDstall, IDop, BEQ, EXop, SLTI, EXrn, IDrm); #10;
   verifyEqual(IDstall, 1);
   
   $display("[IDSTALL] IDop=BEQ, EXop=SLTI, EXrn=IDrn");
   setupStall(IDstall, IDop, BEQ, EXop, LUI, EXrn, IDrn); #10;
   verifyEqual(IDstall, 1);

   $display("[IDSTALL] IDop=BEQ, EXop=LUI, EXrn=IDrm");
   setupStall(IDstall, IDop, BEQ, EXop, SLTI, EXrn, IDrm); #10;
   verifyEqual(IDstall, 1);
   
   $display("[IDSTALL] IDop=BEQ, EXop=LUI, EXrn=IDrn");
   setupStall(IDstall, IDop, BEQ, EXop, LUI, EXrn, IDrn); #10;
   verifyEqual(IDstall, 1);

   $display("[IDSTALL] IDop=BNE, EXop=RTYPE, EXrp=IDrm");
   setupStall(IDstall, IDop, BNE, EXop, RTYPE, EXrp, IDrm); #10;
   verifyEqual(IDstall, 1);

   $display("[IDSTALL] IDop=BNE, EXop=RTYPE, EXrp=IDrn");
   setupStall(IDstall, IDop, BNE, EXop, RTYPE, EXrp, IDrn); #10;
   verifyEqual(IDstall, 1);

   $display("[IDSTALL] IDop=BNE, EXop=LW, EXrn=IDrm");
   setupStall(IDstall, IDop, BNE, EXop, LW, EXrn, IDrm); #10;
   verifyEqual(IDstall, 1);

   $display("[IDSTALL] IDop=BNE, EXop=LW, EXrn=IDrn");
   setupStall(IDstall, IDop, BNE, EXop, LW, EXrn, IDrn);  #10;
   verifyEqual(IDstall, 1);

   $display("[IDSTALL] IDop=BNE, EXop=ADDI, EXrn=IDrm");
   setupStall(IDstall, IDop, BNE, EXop, ADDI, EXrn, IDrm); #10;
   verifyEqual(IDstall, 1);

   $display("[IDSTALL] IDop=BNE, EXop=ADDI, EXrn=IDrn");
   setupStall(IDstall, IDop, BNE, EXop, ADDI, EXrn, IDrn); #10;
   verifyEqual(IDstall, 1);

   $display("[IDSTALL] IDop=BNE, MEMop=LW, MEMrn=IDrm");
   setupStall(IDstall, IDop, BNE, MEMop, LW, MEMrn, IDrm); #10;
   verifyEqual(IDstall, 1);

   $display("[IDSTALL] IDop=BNE, MEMop=LW, MEMrn=IDrn");
   setupStall(IDstall, IDop, BNE, MEMop, LW, MEMrn, IDrn); #10;
   verifyEqual(IDstall, 1);
   
   $display("[IDSTALL] IDop=BNE, EXop=SLTI, EXrn=IDrm");
   setupStall(IDstall, IDop, BNE, EXop, SLTI, EXrn, IDrm); #10;
   verifyEqual(IDstall, 1);
   
   $display("[IDSTALL] IDop=BNE, EXop=SLTI, EXrn=IDrn");
   setupStall(IDstall, IDop, BNE, EXop, SLTI, EXrn, IDrn); #10;
   verifyEqual(IDstall, 1);

   $display("[IDSTALL] IDop=BNE, EXop=LUI, EXrn=IDrm");
   setupStall(IDstall, IDop, BNE, EXop, LUI, EXrn, IDrm); #10;
   verifyEqual(IDstall, 1);
   
   $display("[IDSTALL] IDop=BNE, EXop=LUI, EXrn=IDrn");
   setupStall(IDstall, IDop, BNE, EXop, LUI, EXrn, IDrn); #10;
   verifyEqual(IDstall, 1);

   $display("[IDSTALL] IDop=BNE, EXop=ORI, EXrn=IDrm");
   setupStall(IDstall, IDop, BNE, EXop, ORI, EXrn, IDrm); #10;
   verifyEqual(IDstall, 1);
   
   $display("[IDSTALL] IDop=BNE, EXop=ORI, EXrn=IDrn");
   setupStall(IDstall, IDop, BNE, EXop, ORI, EXrn, IDrn); #10;
   verifyEqual(IDstall, 1);
   ///////////////////////////////////////////////////////////////////////////////

   ///////////////////////////////////////////////////////////////////////////////
   // EXSTALL TESTS (Time: 20 each)
   $display("[EXSTALL] MEMop=LW, EXop=RTYPE, MEMrn=EXrm");
   setupStall(EXstall, MEMop, LW, EXop, RTYPE, MEMrn, EXrm); #10;
   verifyEqual(EXstall, 1);

   $display("[EXSTALL] MEMop=LW, EXop=RTYPE, MEMrn=EXrn");
   setupStall(EXstall, MEMop, LW, EXop, RTYPE, MEMrn, EXrn);  #10;
   verifyEqual(EXstall, 1);

   $display("[EXSTALL] MEMop=LW, EXop=LW, MEMrn=EXrm");
   setupStall(EXstall, MEMop, LW, EXop, LW, MEMrn, EXrm); #10;
   verifyEqual(EXstall, 1);

   $display("[EXSTALL] MEMop=LW, EXop=SW, MEMrn=EXrm");
   setupStall(EXstall, MEMop, LW, EXop, SW, MEMrn, EXrm); #10;
   verifyEqual(EXstall, 1);

   $display("[EXSTALL] MEMop=LW, EXop=ADDI, MEMrn=EXrm");
   setupStall(EXstall, MEMop, LW, EXop, ADDI, MEMrn, EXrm); #10;
   verifyEqual(EXstall, 1);

   $display("[EXSTALL] MEMop=LW, EXop=SLTI, MEMrn=EXrm");
   setupStall(EXstall, MEMop, LW, EXop, SLTI, MEMrn, EXrm); #10;
   verifyEqual(EXstall, 1);

   $display("[EXSTALL] MEMop=LW, EXop=ORI, MEMrn=EXrm");
   setupStall(EXstall, MEMop, LW, EXop, ORI, MEMrn, EXrm); #10;
   verifyEqual(EXstall, 1);
   ///////////////////////////////////////////////////////////////////////////////
   $display("All tests passed.");

   end


endmodule
