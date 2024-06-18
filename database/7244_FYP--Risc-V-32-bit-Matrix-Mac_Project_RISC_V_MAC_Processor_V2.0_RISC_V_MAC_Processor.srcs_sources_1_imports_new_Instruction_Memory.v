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
    
    output [31:0] RD,//instruction to output from instruction memory// accessing memory
    output [31:0] temp
    );

    reg [31:0] Memory [1023:0];  //register memory containing, 1024 seperate registers of 32 bits each  
    
    //             if reset low, access memry start, else access address from memomory 
    assign RD =  ( rst == 1'b0 )? 32'h00000000 : Memory[A[31:2]] ;
    
    
    
    


 
    
    
    
    
    

    
    always@(negedge rst)
    begin
        if(rst == 0)
        begin
        Memory[0]     <= 32'h00100093;
        Memory[1]     <= 32'h00200113;
        Memory[2]     <= 32'h00300193;
        Memory[3]     <= 32'h00400213;
        Memory[4]     <= 32'h00500293;
        Memory[5]     <= 32'h00600313;
        Memory[6]     <= 32'h00700393;
        Memory[7]     <= 32'h00800413;
        Memory[8]     <= 32'h00900493;
        Memory[9]     <= 32'h00A00513;
        Memory[10]     <= 32'h00B00593;
        Memory[11]     <= 32'h00C00613;
        Memory[12]     <= 32'h00D00693;
        Memory[13]     <= 32'h00E00713;
        Memory[14]     <= 32'h00F00793;
        Memory[15]     <= 32'h01000813;
        Memory[16]     <= 32'h01100893;
        Memory[17]     <= 32'h01200913;
        Memory[18]     <= 32'h01300993;
        Memory[19]     <= 32'h01400A13;
        Memory[20]     <= 32'h01500A93;
        Memory[21]     <= 32'h01600B13;
        Memory[22]     <= 32'h01700B93;
        Memory[23]     <= 32'h01800C13;
        Memory[24]     <= 32'h01900C93;
        Memory[25]     <= 32'h18102823;
        Memory[26]     <= 32'h182028A3;
        Memory[27]     <= 32'h18302923;
        Memory[28]     <= 32'h184029A3;
        Memory[29]     <= 32'h18502A23;
        Memory[30]     <= 32'h18602AA3;
        Memory[31]     <= 32'h18702B23;
        Memory[32]     <= 32'h18802BA3;
        Memory[33]     <= 32'h18902C23;
        Memory[34]     <= 32'h18A02CA3;
        Memory[35]     <= 32'h18B02D23;
        Memory[36]     <= 32'h18C02DA3;
        Memory[37]     <= 32'h18D02E23;
        Memory[38]     <= 32'h18E02EA3;
        Memory[39]     <= 32'h18F02F23;
        Memory[40]     <= 32'h19002FA3;
        Memory[41]     <= 32'h1B102023;
        Memory[42]     <= 32'h1B2020A3;
        Memory[43]     <= 32'h1B302123;
        Memory[44]     <= 32'h1B4021A3;
        Memory[45]     <= 32'h1B502223;
        Memory[46]     <= 32'h1B6022A3;
        Memory[47]     <= 32'h1B702323;
        Memory[48]     <= 32'h1B8023A3;
        Memory[49]     <= 32'h1B902423;
        Memory[50]     <= 32'h01A00093;
        
        Memory[51]     <= 32'h01B00113;
        Memory[52]     <= 32'h01C00193;
        Memory[53]     <= 32'h01D00213;
        Memory[54]     <= 32'h01E00293;
        Memory[55]     <= 32'h01F00313;
        Memory[56]     <= 32'h02000393;
        Memory[57]     <= 32'h02100413;
        Memory[58]     <= 32'h02200493;
        Memory[59]     <= 32'h02300513;
        Memory[60]     <= 32'h02400593;
        Memory[61]     <= 32'h02500613;
        Memory[62]     <= 32'h02600693;
        Memory[63]     <= 32'h02700713;
        Memory[64]     <= 32'h02800793;
        Memory[65]     <= 32'h02900813;
        Memory[66]     <= 32'h02A00893;
        Memory[67]     <= 32'h02B00913;
        Memory[68]     <= 32'h02C00993;
        Memory[69]     <= 32'h02D00A13;
        Memory[70]     <= 32'h02E00A93;
        Memory[71]     <= 32'h02F00B13;
        Memory[72]     <= 32'h03000B93;
        Memory[73]     <= 32'h03100C13;
        Memory[74]     <= 32'h03200C93;
        Memory[75]     <= 32'h1A1024A3;
        Memory[76]     <= 32'h1A202523;
        Memory[77]     <= 32'h1A3025A3;
        Memory[78]     <= 32'h1A402623;
        Memory[79]     <= 32'h1A5026A3;
        Memory[80]     <= 32'h1A602723;
        Memory[81]     <= 32'h1A7027A3;
        Memory[82]     <= 32'h1A802823;
        Memory[83]     <= 32'h1A9028A3;
        Memory[84]     <= 32'h1AA02923;
        Memory[85]     <= 32'h1AB029A3;
        Memory[86]     <= 32'h1AC02A23;
        Memory[87]     <= 32'h1AD02AA3;
        Memory[88]     <= 32'h1AE02B23;
        Memory[89]     <= 32'h1AF02BA3;
        Memory[90]     <= 32'h1B002C23;
        Memory[91]     <= 32'h1B102CA3;
        Memory[92]     <= 32'h1B202D23;
        Memory[93]     <= 32'h1B302DA3;
        Memory[94]     <= 32'h1B402E23;
        Memory[95]     <= 32'h1B502EA3;
        Memory[96]     <= 32'h1B602F23;
        Memory[97]     <= 32'h1B702FA3;
        Memory[98]     <= 32'h1D802023;
        Memory[99]     <= 32'h1D9020A3;
//        Memory[100]     <= 32'h00208D33;
        
//        Memory[101]     <= 32'h40418DB3;
//        Memory[102]     <= 32'h02628E33;
//        Memory[103]     <= 32'h00239E93;
//        Memory[104]     <= 32'h13A02623;
//        Memory[105]     <= 32'h13B026A3;
//        Memory[106]     <= 32'h13C02723;
//        Memory[107]     <= 32'h13D027A3;
//        Memory[108]     <= 32'h02628E33;
        
        Memory[100]     <= 32'h400001F7;
        Memory[101]     <= 32'h00564077;
        Memory[102]     <= 32'h0056A4F7;
        Memory[103]     <= 32'h80000077;
        Memory[104]     <= 32'hC0000077;
        
        /*loadin data(MAC Resultant) form memory to regfile*/
        Memory[105]    <= 32'h20002083;
        Memory[106]    <= 32'h1FF02103;
        Memory[107]    <= 32'h1FE02183;
        Memory[108]    <= 32'h1FD02203;
        Memory[109]    <= 32'h1FC02283;
        Memory[110]    <= 32'h1FB02303;
        Memory[111]    <= 32'h1FA02383;
        Memory[112]    <= 32'h1F902403;
        Memory[113]    <= 32'h1F802483;
        Memory[114]    <= 32'h1F702503;
        Memory[115]    <= 32'h1F602583;
        Memory[116]    <= 32'h1F502603;
        Memory[117]    <= 32'h1F402683;
        Memory[118]    <= 32'h1F302703;
        Memory[119]    <= 32'h1f202783;
        Memory[120]    <= 32'h1f102803;
        Memory[121]    <= 32'h1f002883;
        Memory[122]    <= 32'h1ef02903;
        Memory[123]    <= 32'h1EE02983;
        Memory[124]    <= 32'h1ED02A03;
        Memory[125]    <= 32'h1EC02A83;
        Memory[126]    <= 32'h1EB02B03;
        Memory[127]    <= 32'h1EA02B83;
        Memory[128]    <= 32'h1E902C03;
        Memory[129]    <= 32'h1E802C83;
        
        //loading registers from r0-r25 to r31-r7
        Memory[130]    <= 32'h000080B3;
        Memory[131]    <= 32'h00010133;
        Memory[132]    <= 32'h000181B3;
        Memory[133]    <= 32'h00020233;
        Memory[134]    <= 32'h000282B3;
        Memory[135]    <= 32'h00030333;
        Memory[136]    <= 32'h000383B3;
        Memory[137]    <= 32'h00040433;
        Memory[138]    <= 32'h000484B3;
        Memory[139]    <= 32'h00050533;
        Memory[140]    <= 32'h000585B3;
        Memory[141]    <= 32'h00060633;
        Memory[142]    <= 32'h000686B3;
        Memory[143]    <= 32'h00070733;
        Memory[144]    <= 32'h000787B3;
        Memory[145]    <= 32'h00080833;
        Memory[146]    <= 32'h000888B3;
        Memory[147]    <= 32'h00090933;
        Memory[148]    <= 32'h000989B3;
        Memory[149]    <= 32'h000A0A33;
        Memory[150]    <= 32'h000A8AB3;
        Memory[151]    <= 32'h000B0B33;
        Memory[152]    <= 32'h000B8BB3;
        Memory[153]    <= 32'h000C0C33;
        Memory[154]    <= 32'h000C8CB3;

                        
        Memory[155]     <= 32'h00000073;
//        Memory[130]     <= 32'h00000073;
        end
    end
    assign temp = Memory[2];
  

//    initial begin
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
//     $readmemh("E:/UNI/FYP/FYP--Risc-V-32-bit-Matrix-Mac/Project/Single_Cycle_Processor_V_1.2/Piplined_Test.hex",Memory);   //change path according to your directory
//     $readmemh("E:/UNI/FYP/FYP--Risc-V-32-bit-Matrix-Mac/Project/Backups/files/Piplined_Test.hex",Memory);
//        $readmemh("D:/UNI/FYP/FYP--Risc-V-32-bit-Matrix-Mac/Project/Pipline_Five_v_2.0/memfile.hex",Memory);

//    end


endmodule





















