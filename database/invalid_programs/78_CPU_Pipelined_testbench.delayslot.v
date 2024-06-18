// This program was cloned from: https://github.com/FIUSCIS-CDA/CPU_Pipelined
// License: MIT License

///////////////////////////////////////////////////////////////////////////////////
// Testbench for Component: CPU_Pipelined (CLK=100)
// Package: FIUSCIS-CDA
// Course: CDA3102 (Computer Architecture), Florida International University
// Developer: Trevor Cickovski
// Extended By: CDA3102 students
// License: MIT, (C) 2020-2022 All Rights Reserved
///////////////////////////////////////////////////////////////////////////////////


module testbenchDelaySlot();
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
// CPU will check if the array sorted if PC hits this value
// Set to location of doneloop1 below  *PLUS 4*
// With the pipeline, PC+4 is done in the IF stage (before the instruction completes)
localparam TERMINALPC=92;
////////////////////////////////////////////////////////////////////////////////////////////////////

   // Strategy - Hardcoded to 10 for Delay Slot
   CPU_Pipelined myCPU(.reset(rst), .clk(clk), .Strategy(2'b10), .EXIR(EXIR), 
                       .IDIR(IDIR), .IFIR(IFIR), .MEMIR(MEMIR), .PC(PC), .WBIR(WBIR));  
   
   initial begin

      //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
      // Initialize Instruction Memory with MIPS Bubble Sort                     //          INSTRUCTION                    PC
      myCPU.b2v_IFStage.b2v_MYIM.memory[0] = 'b00100000000100000000001000000000; // addi $s0, $zero, 512                     0
      myCPU.b2v_IFStage.b2v_MYIM.memory[1] = 'b00100000000100010000000000001011; // addi $s1, $zero, 11                      4
      myCPU.b2v_IFStage.b2v_MYIM.memory[2] = 'b00000000000000001001000000100000; // add $s2, $zero, zero                     8
      myCPU.b2v_IFStage.b2v_MYIM.memory[3] = 'b00100000000011010000000000000001; // addi $t5, $zero, 1                      12
      myCPU.b2v_IFStage.b2v_MYIM.memory[4] = 'b00101010010010000000000000001011; // slti $t0, $s2, 11                       16
      myCPU.b2v_IFStage.b2v_MYIM.memory[5] = 'b00010101000011010000000000010000; // loop1: bne $t0, $t5, doneloop1(16)	    20           
      myCPU.b2v_IFStage.b2v_MYIM.memory[6] = 'b00000000000000001001100000100000; // add $s3, $zero, $zero       [DELAY]     24
      myCPU.b2v_IFStage.b2v_MYIM.memory[7] = 'b00000010001100100111000000100010; // sub $t6, $s1, $s2                       28
      myCPU.b2v_IFStage.b2v_MYIM.memory[8] = 'b00000010011011100100100000101010; // loop2:   slt $t1, $s3, $t6              32
      myCPU.b2v_IFStage.b2v_MYIM.memory[9] = 'b00010001001000000000000000001010; // beq $t1, $zero, doneloop2               36 
      myCPU.b2v_IFStage.b2v_MYIM.memory[10] = 'b00000000000100110101000010000000; // sll $t2, $s3, 2       [DELAY]          40
      myCPU.b2v_IFStage.b2v_MYIM.memory[11] = 'b00000010000010100101100000100000; // add $t3, $s0, $t2                      44
      myCPU.b2v_IFStage.b2v_MYIM.memory[12] = 'b10001101011101000000000000000000; // lw $s4, 0($t3)                         48
      myCPU.b2v_IFStage.b2v_MYIM.memory[13] = 'b10001101011101010000000000000100; // lw $s5, 4($t3)                         52
      myCPU.b2v_IFStage.b2v_MYIM.memory[14] = 'b00000010101101000110000000101010; // slt $t4, $s5, $s4                      56
      myCPU.b2v_IFStage.b2v_MYIM.memory[15] = 'b00010001100000000000000000000011; // beq $t4, $zero, doneif                 60 
      myCPU.b2v_IFStage.b2v_MYIM.memory[16] = 'b00100010011100110000000000000001; // doneif:    addi $s3, $s2, 1 [DELAY]    64     
      myCPU.b2v_IFStage.b2v_MYIM.memory[17] = 'b10101101011101010000000000000000; // sw $s5, 0($t3)                         68   
      myCPU.b2v_IFStage.b2v_MYIM.memory[18] = 'b10101101011101000000000000000100; // sw $s4, 4($t3)                         72
      myCPU.b2v_IFStage.b2v_MYIM.memory[19] = 'b00001000000000000000000000001000; // j loop2 //instruction 9                76
      myCPU.b2v_IFStage.b2v_MYIM.memory[20] = 'b00100010010100100000000000000001; // doneloop2: addi $s2, $s2, 1            80
      myCPU.b2v_IFStage.b2v_MYIM.memory[21] = 'b00001000000000000000000000000100; // j loop1 //instruction 6                84 
      myCPU.b2v_IFStage.b2v_MYIM.memory[22] = 'b00000000000000000000000000000000; // doneloop1:                             88
      ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

      // Constants (Note: addi not supported here)
      myCPU.b2v_MEMStage.b2v_MYDM.memory[500 >> 2] = 512;
      myCPU.b2v_MEMStage.b2v_MYDM.memory[504 >> 2] = 12;
      myCPU.b2v_MEMStage.b2v_MYDM.memory[508 >> 2] = 1;
      /////////////////////////////////////////////////////////////////////////////////////////////
      // Initial Array (Unsorted)
      myCPU.b2v_MEMStage.b2v_MYDM.memory[512 >> 2] = 55;
      myCPU.b2v_MEMStage.b2v_MYDM.memory[516 >> 2] = 88;
      myCPU.b2v_MEMStage.b2v_MYDM.memory[520 >> 2] = 0;
      myCPU.b2v_MEMStage.b2v_MYDM.memory[524 >> 2] = 22;
      myCPU.b2v_MEMStage.b2v_MYDM.memory[528 >> 2] = 77;
      myCPU.b2v_MEMStage.b2v_MYDM.memory[532 >> 2] = 11;
      myCPU.b2v_MEMStage.b2v_MYDM.memory[536 >> 2] = 99;
      myCPU.b2v_MEMStage.b2v_MYDM.memory[540 >> 2] = 33;
      myCPU.b2v_MEMStage.b2v_MYDM.memory[544 >> 2] = 110;
      myCPU.b2v_MEMStage.b2v_MYDM.memory[548 >> 2] = 66;
      myCPU.b2v_MEMStage.b2v_MYDM.memory[552 >> 2] = 121;
      myCPU.b2v_MEMStage.b2v_MYDM.memory[556 >> 2] = 44;
      /////////////////////////////////////////////////////////////////////////////////////////////
      // POWER ON
      rst <= 1;  # (CLK_PERIOD/2);
      rst <= 0; 
      /////////////////////////////////////////////////////////////////////////////////////////////
   end


   // Generate clock
   always @*
   begin
      clk <= 1;       # (CLK_PERIOD/2);
      clk <= 0;       # (CLK_PERIOD/2);
   end
   

  always@(posedge clk)
    begin

         ///////////////////////////////////////////////////////////////////////////////////
        // When we hit the terminal PC, verify every pair of elements is ascending
        // This implies the array is sorted, and bubble sort worked correctly
        if(PC === TERMINALPC) begin
          for (address=512; address <= 552; address = address + 4)
          begin
             $display("Testing element %d and element %d", address, address+4);
             verifyLessEqual32(myCPU.b2v_MEMStage.b2v_MYDM.memory[address >> 2],
                               myCPU.b2v_MEMStage.b2v_MYDM.memory[(address+4) >> 2]);
          end
          $display("CPU functional");
          $stop;
         end
        ///////////////////////////////////////////////////////////////////////////////////
   end
 
endmodule
