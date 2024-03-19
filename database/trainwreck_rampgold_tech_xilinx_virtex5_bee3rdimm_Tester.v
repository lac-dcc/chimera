//---------------------------------------------------------------------------   
// File:        tester.v
// Author:      Zhangxi Tan
// Description: Modified for 2GB dual-rank SODIMMs 
//------------------------------------------------------------------------------  

`timescale 1ns / 1ps

// © Copyright Microsoft Corporation, 2008
(* syn_maxfan=30 *) module Tester(
 input CLK,
 input Reset,

//Signals to/from TC5. 
 input Start,  //from TC5
 input ResetDDR, //from TC5
 output reg HoldFail, //to TC5
 output [7:0] XDbyte,  //to TC5
 input TakeXD,  //from TC5
 input [1:0] testConf, //The test configuration:
// 0 => sequential address, sequential data,
// 1 => LFSR address, sequential data,
// 2 => sequential address, LFSR data,
// 3 => LFSR address, LFSR data
 input [35:0] LastALU,


 //Signals to/from the DDR controller
 output [27:0] Address,
 output Read, //command
 output WriteAF,
 input AFfull, //stop issuing anything
 input SingleError,
 input DoubleError,
 input WBfull,

 output[127:0] WriteData,
 output WriteWB,

 input [127:0] ReadData,
 output ReadRB,
 input RBempty,
 output Reading
);

/* 
The tester is a small state machine, plus a LFSR (32 bits) which is concatenated four times for each
128 bit data word (2/burst), and another LFSR (28 bits) for the address. 

The address is 26 bits (2**26 words * 2**5 bytes/word = 2**31 bytes = 2 GB).

The test launches "BurstLength" writes, then "BurstLength" reads, checks the data from RB, then loops.
BurstLength is taken from TC5 R[257] at startup.  This register defaults to 31d.
  
The test will run until it detects a failure or the system is reset.

*/
 reg Startd1;
 wire StartTester;
 wire testFail;
 reg OddWord;
 
 reg [25:0] WA, RA; //seperate read and write addresses
 reg [25:0] TA; //test address, reported to TC5
 //write and read data 
 reg [31:0] RD; //expected read data
 reg [31:0] WD;
 reg [191:0] XD; //data read from the controller, plus RD, TA, and the error bits
 reg TakeXDd1;
 wire TakeXDx; //one-clock version of TakeXD
 reg [127:0] RDx; //ReadData delayed 1 cycle
 reg SEx; //Single Error delayed one cycle
 reg DEx; //Double Error delayed one cycle
 reg advance; //advance TA, RD
 wire anyError;
 wire loadXD;
 
(* safe_implementation = "yes" *) reg [1:0] testState;
 reg [27:0] BurstLength;
 reg [27:0] testCnt;  //number of writes and reads per block

 localparam testIdle =   2'b00;
 localparam testWriteA = 2'b01;
 localparam testWriteB = 2'b10;
 localparam testRead =   2'b11;
 
//----------------End of declarations-----------------------
 //synthesis translate_off
  initial begin
    Startd1 = '0;
  end
 //synthesis translate_on

 assign Reading = testState == testRead;
 always @(posedge CLK) TakeXDd1 <= TakeXD;
 assign TakeXDx = TakeXD & ~TakeXDd1;
 
 always @(posedge CLK) if(Start) BurstLength <= LastALU[27:0];
 
 always @(posedge CLK) Startd1 <= Start;
 assign  StartTester = ~Start & Startd1;  //StartTester when Start falls.

//State machine 
 always @(posedge CLK)
   if(Reset | ResetDDR) testState <= testIdle;
   else begin
  case (testState)
     testIdle:
       if(StartTester) begin
         testState <= testWriteA;
         testCnt <= BurstLength;
       end

     testWriteA:
       if(~AFfull & ~WBfull)testState <= testWriteB;
      
     testWriteB:
       if(testCnt == 0) begin  // We're about to do the last write.
         testCnt <= BurstLength;
         testState <= testRead;
       end else begin
         testCnt <= testCnt - 1;
         testState <= testWriteA;
       end
     
     testRead:
       if(~AFfull) 
         if (testCnt == 0) begin
            testCnt <= BurstLength;
            testState <= testWriteA;
         end else testCnt <= testCnt - 1;  //Do another read.
       
    endcase
  end
  
 always @(posedge CLK) begin  //advance WA once per write
   if(testState == testIdle) WA <= 26'h1; //init  
   else if (testState == testWriteB )  //advance
     WA <= testConf[0]? {WA[24:00],WA[25] ^ WA[22]} : WA + 1;
 end

 always @(posedge CLK) begin  //advance RA once per read
   if(testState == testIdle) RA <= 26'h1; //init  
   else if (testState == testRead & ~AFfull)  //advance
     RA <= testConf[0]? {RA[24:00],RA[25] ^ RA[22]} : RA + 1;
 end

 always @(posedge CLK) begin  //advance TA every other word tested
   if(testState == testIdle) begin TA <= 26'h1; OddWord <= 0; end //init  
   else if (advance) begin  //advance if OddWord
     OddWord <= ~OddWord;
     if(OddWord) TA <= testConf[0]? {TA[24:00],TA[25] ^ TA[22]} : TA + 1;
   end
 end

 always @(posedge CLK) begin  //advance RD whenever a word is tested
   if(testState == testIdle) RD <= 32'h00000001; //init  
   else if (advance)  //advance
     RD <= testConf[1]? {RD[30:0],(RD[31] ^ RD[21] ^ RD[1] ^ RD[0])} : RD + 1;
 end

 always @(posedge CLK) begin  //advance WD whenever a word is written
   if(testState == testIdle) WD <= 32'h00000001; //init  
   else if ((testState == testWriteA & ~AFfull & ~WBfull) | testState == testWriteB)  //shift
     WD <= testConf[1]? {WD[30:0],(WD[31] ^ WD[21] ^ WD[1] ^ WD[0])} : WD + 1;
 end
 
 always @(posedge CLK)
   if(loadXD) XD <= {RDx, RD, OddWord, testFail, SEx, DEx, 2'b0, TA};
   else if(TakeXDx) XD <= {XD[7:0], XD[191:8]};
   
 always @(posedge CLK) if (testState == testIdle) HoldFail <= 0;
  else HoldFail <= loadXD  | HoldFail;
  
 always @(posedge CLK) advance <= ~RBempty;
 
 assign anyError =  SEx | DEx | testFail;
 assign loadXD = advance & anyError & ~HoldFail;
 
 always @(posedge CLK) begin
   RDx <= ReadData;
	SEx <= SingleError;
	DEx <= DoubleError;
 end
 
 assign XDbyte = XD[7:0];
 assign Address = testState == testRead?  RA: WA;
 assign WriteAF =  testState == testWriteB | (testState == testRead & ~AFfull);
 assign WriteData = {WD, WD, WD, WD};
 assign Read = testState == testRead;
 assign WriteWB = (testState == testWriteA & ~AFfull & ~WBfull) | testState == testWriteB;
 assign testFail = RDx != {RD,RD,RD,RD};
 assign ReadRB = ~RBempty;
 
endmodule
