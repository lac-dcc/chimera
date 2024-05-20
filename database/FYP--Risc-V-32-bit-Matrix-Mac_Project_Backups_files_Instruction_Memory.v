// This program was cloned from: https://github.com/theuppercaseguy/FYP--Risc-V-32-bit-Matrix-Mac
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/19/2023 04:08:07 PM
// Design Name: 
// Module Name: Instruction_Memory
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Instruction_Memory(
    input [31:0] A, //input address of the instruction in the instruction memory
    input rst, //reset
    
    output [31:0] RD//instruction to output from instruction memory// accessing memory
    );

    reg [31:0] Memory [1023:0];  //register memory containing, 1024 seperate registers of 32 bits each
    
    
    
    //             if reset low, access memry start, else access address from memomory 
    assign RD =  ( rst == 1'b0 )? 32'h00000000 : Memory[A[31:2]] ;

    

    initial begin
    //test 1
    //    testing the load word instruction
    //    rs1, im(rd) =      im          rs1  f3   rd     op      hexa
    //    lw x6, -4(x9)  = 11111111100  01001 010 00110 0000011 = FFC4A303 
          
    //    x9 = hex 20, dec 32. from register files.
    //    32 - 4 = 28, memory[28] = 20 hex, 32 dec stored already
    
    //    x6 = 20 hex, 32 dec => from memory
    
    //      Memory[0] = 32'hFFC4A303;     
    
    //test 2
    // loading word from data memory
    
    //     lw  x7, 0x8(x6)   // actual instruction to execute
    //     x6 = 20 hex, 32 dec from previous instr.
    //     32 + 8 = 40 dec => memory[40] = 02 hex saved already
    
    //     x7 = 02 hex
     
    //       Memory[1] = 32'h00832383;
    
   //test-3
   //Store word instruction
    //      Memory[0] = 32'h0064A423;
           
           
   //test-4 
   //store word in memory
   //      sw x11, 8(x12) => store the value thats in register x11 to address in (x12)hex + (8)dec in memory
   //      x11 = 0x28  = 40 dec , stored in data memory manually
   //      x12 = 0x30  = 48 dec, stored in data memory manually
   
    //     Memory[1] = 32'h00B62423;
   
   //test-5
   //R-Type instruction       
           
    //     Memory[0] = 32'h0062E233;
           
           
    //test-6 
    //running code from a hex file
    /*  memfile.hex =>
        
        @00000000
        0062E3B3
        0062F433    
    */

   //test-7
   //checking ADDI instruction
    /*    
          memfile.hex =>
          
          @00000000
          00500293 // addi x6, x0, 5 
    */

    //test-8
   //checking ADDI instruction
    /*  memfile.hex =>
          
          @00000000
          02000493 //addi x9 x0 32
          0094A023 //sw x9 0(x9)
          0004A303 //lw x6 0(x9)

    */


    //$readmemh("E:/UNI/FYP/FYP--Risc-V-32-bit-Matrix-Mac/Project/Single_Cycle_Processor_V_1.2/memfile.hex",Memory);   
   
   
   //Comprehensive Test for SIngle Cycle Processor
    //$readmemh("E:/UNI/FYP/FYP--Risc-V-32-bit-Matrix-Mac/Project/Single_Cycle_Processor_V_1.2/ALL_Instr_Test.hex",Memory);   //change path according to your directory
       
   //Comprehensive Test for Pipelined Processor
     $readmemh("E:/UNI/FYP/FYP--Risc-V-32-bit-Matrix-Mac/Project/Single_Cycle_Processor_V_1.2/Piplined_Test.hex",Memory);   //change path according to your directory


    end
endmodule





















