// This program was cloned from: https://github.com/FIUSCIS-CDA/CPU_Pipelined
// License: MIT License

///////////////////////////////////////////////////////////////////////////////////
// Testbench for Component: CPU_Pipelined (CLK=100)
// Package: FIUSCIS-CDA
// Course: CDA3102 (Computer Architecture), Florida International University
// Developer: Trevor Cickovski
// Extended By: CDA3102 students
// License: MIT, (C) 2020-2023 All Rights Reserved
///////////////////////////////////////////////////////////////////////////////////


module testbenchLui();
`include "../Test/Test.v"
///////////////////////////////////////////////////////////////////////////////////
// Inputs: clk, reset (1-bit)
   reg clk, rst;
///////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////
// Outputs: PC (32-bit), IFIR (6-bit), IDIR (6-bit), EXIR (6-bit), MEMIR (6-bit), WBIR (6-bit)
   wire[31:0] PC, IFIR, IDIR, EXIR, MEMIR, WBIR;
///////////////////////////////////////////////////////////////////////////////////////////////

  integer address;

///////////////////////////////////////////////////////////////////////////////////
// Component is CLOCKED
// Set clk period to 100 in wave
// Approximating clock period as 100 (one access to RAM)
localparam CLK_PERIOD=100;
///////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////////////////////////////////
// CPU will perform check once PC hits this value
// Note for this CPU you want to go *two* past the end
// With the pipeline, PC+4 is done in the IF stage (before the instruction completes)
localparam TERMINALPC=24;
////////////////////////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Branch prediction strategy
// 00=NOT TAKEN 
// 01=TAKEN 
// 10=DELAY SLOT (works if the program uses delay slots - the bubble sort below does not)  
localparam BRANCH_PRED=2'b00;
////////////////////////////////////////////////////////////////////////////////////////////////////

 
CPU_Pipelined myCPU(.clk(clk), .reset(rst), .Strategy(BRANCH_PRED), .EXIR(EXIR), 
                       .IDIR(IDIR), .IFIR(IFIR), .MEMIR(MEMIR), .PC(PC), .WBIR(WBIR)); 
   
   initial begin
      //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
      // Initialize Instruction Memory with LUI		                         //          INSTRUCTION                    PC
      myCPU.b2v_IFStage.b2v_MYIM.memory[0] = 'b00111100000010000000000000000001; // lui $t0, 1		                     0
      myCPU.b2v_IFStage.b2v_MYIM.memory[1] = 'b00110101000010000000000000000011; // ori $t0, $t0, 3                          4
      myCPU.b2v_IFStage.b2v_MYIM.memory[2] = 'b00000000000000000000000000000000; 
      myCPU.b2v_IFStage.b2v_MYIM.memory[3] = 'b00000000000000000000000000000000; 
      myCPU.b2v_IFStage.b2v_MYIM.memory[4] = 'b00000000000000000000000000000000; 
      myCPU.b2v_IFStage.b2v_MYIM.memory[5] = 'b00000000000000000000000000000000; 
      ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
       
      /////////////////////////////////////////////////////////////////////////////////////////////
      // POWER ON
      rst <= 1;  # (CLK_PERIOD/2);
      rst <= 0; 
      /////////////////////////////////////////////////////////////////////////////////////////////
   end


  always@(posedge clk)
    begin
        ///////////////////////////////////////////////////////////////////////////////////
        // When we hit the terminal PC, verify every pair of elements is ascending
        // This implies the array is sorted, and bubble sort worked correctly
        if(PC === TERMINALPC) begin
             $display("Testing lui with immediate=1");
             verifyEqual32(myCPU.b2v_IDStage.b2v_MYRF.contents_t0, 65539);
          $display("CPU functional");
          $stop;
         end
        ///////////////////////////////////////////////////////////////////////////////////


   end
 
endmodule