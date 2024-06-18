// This program was cloned from: https://github.com/thinkoco/de10-nano-riscv
// License: Apache License 2.0

 /*                                                                      
 Copyright 2017 Silicon Integrated Microelectronics, Inc.                
                                                                         
 Licensed under the Apache License, Version 2.0 (the "License");         
 you may not use this file except in compliance with the License.        
 You may obtain a copy of the License at                                 
                                                                         
     http://www.apache.org/licenses/LICENSE-2.0                          
                                                                         
  Unless required by applicable law or agreed to in writing, software    
 distributed under the License is distributed on an "AS IS" BASIS,       
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and     
 limitations under the License.                                          
 */                                                                      
                                                                         
                                                                         
                                                                         
//=====================================================================
//--        _______   ___
//--       (   ____/ /__/
//--        \ \     __
//--     ____\ \   / /
//--    /_______\ /_/   MICROELECTRONICS
//--
//=====================================================================
//
// Designer   : Bob Hu
//
// Description:
//  The module is the mask ROM 
//
// ====================================================================

module sirv_mrom # (
    parameter AW = 12,
    parameter DW = 32,
    parameter DP = 1024
)(
  input  [AW-1:2] rom_addr, 
  output [DW-1:0] rom_dout  
  );
        

  wire [31:0] mask_rom [0:DP-1];// 4KB = 1KW 

  assign rom_dout = mask_rom[rom_addr]; 
/*
assign mask_rom[ 0] = 32'h0280006f;
assign mask_rom[ 1] = 32'h00000013;
assign mask_rom[ 2] = 32'h00000013;
assign mask_rom[ 3] = 32'h00000013;
assign mask_rom[ 4] = 32'h00000013;
assign mask_rom[ 5] = 32'h00000013;
assign mask_rom[ 6] = 32'h00000013;
assign mask_rom[ 7] = 32'h00000013;
assign mask_rom[ 8] = 32'h00000013;
assign mask_rom[ 9] = 32'h00000013;
assign mask_rom[10] = 32'h00700093;
assign mask_rom[11] = 32'h10012137;
assign mask_rom[12] = 32'h00810113;
assign mask_rom[13] = 32'h00112023;
assign mask_rom[14] = 32'h00000193;
assign mask_rom[15] = 32'h00100293;
assign mask_rom[16] = 32'h00500093;
assign mask_rom[17] = 32'h10012137;
assign mask_rom[18] = 32'h00c10113;
assign mask_rom[19] = 32'h00112023;
assign mask_rom[20] = 32'h00150237;
assign mask_rom[21] = 32'h40520233;
assign mask_rom[22] = 32'hfe321ee3;
assign mask_rom[23] = 32'h00000093;
assign mask_rom[24] = 32'h10012137;
assign mask_rom[25] = 32'h00c10113;
assign mask_rom[26] = 32'h00112023;
assign mask_rom[27] = 32'h00150237;
assign mask_rom[28] = 32'h40520233;
assign mask_rom[29] = 32'hfe321ee3;
assign mask_rom[30] = 32'hfc1ff06f;
assign mask_rom[31] = 32'h00000013;
assign mask_rom[32] = 32'h00000013;
*/
  genvar i;
  generate 
   if(1) begin: jump_to_ram_gen
       // Just jump to the ITCM base address 
      for (i=0;i<1024;i=i+1) begin: rom_gen
          if(i==0) begin: rom0_gen
              assign mask_rom[i] = 32'h7ffff297; //auipc   t0, 0x7ffff
          end
          else if(i==1) begin: rom1_gen
              assign mask_rom[i] = 32'h00028067; //jr      t0
          end
          else begin: rom_non01_gen
              assign mask_rom[i] = 32'h00000013; 
          end
      end
   end
   else begin: jump_to_non_ram_gen


    // This is the freedom bootrom version, put here have a try
    //  The actual executed trace is as below:
       // CYC: 8615 PC:00001000 IR:0100006f DASM: j       pc + 0x10         
       // CYC: 8618 PC:00001010 IR:204002b7 DASM: lui     t0, 0x20400       xpr[5] = 0x20400000
       // CYC: 8621 PC:00001014 IR:00028067 DASM: jr      t0                

       // The 20400000 is the flash address
         //MEMORY
         //{
         //  flash (rxai!w) : ORIGIN = 0x20400000, LENGTH = 512M
         //  ram (wxa!ri) : ORIGIN = 0x80000000, LENGTH = 16K
         //}


    for (i=0;i<1024;i=i+1) begin: rom_gen
        if(i==0) begin: rom0_gen
            assign mask_rom[i] = 32'h100006f;
        end
        else if(i==1) begin: rom1_gen
            assign mask_rom[i] = 32'h13;
        end
        else if(i==2) begin: rom1_gen
            assign mask_rom[i] = 32'h13;
        end
        else if(i==3) begin: rom1_gen
            assign mask_rom[i] = 32'h6661;// our config code
        end
        else if(i==4) begin: rom1_gen
            //assign mask_rom[i] = 32'h204002b7;
            assign mask_rom[i] = 32'h20400000 | 32'h000002b7;
        end
        else if(i==5) begin: rom1_gen
            assign mask_rom[i] = 32'h28067;
        end
        else begin: rom_non01_gen
            assign mask_rom[i] = 32'h00000000; 
        end
    end
   
  // In the https://github.com/sifive/freedom/blob/master/bootrom/xip/xip.S
  //  ASM code is as below:
     //  //  // See LICENSE for license details.
     //// Execute in place
     //// Jump directly to XIP_TARGET_ADDR
     //
     //  .text
     //  .option norvc
     //  .globl _start
     //_start:
     //  j 1f
     //  nop
     //  nop
     //#ifdef CONFIG_STRING
     //  .word cfg_string
     //#else
     //  .word 0  // Filled in by GenerateBootROM in Chisel
     //#endif
     //
     //1:
     //  li t0, XIP_TARGET_ADDR
     //  jr t0
     //
     //  .section .rodata
     //#ifdef CONFIG_STRING
     //cfg_string:
     //  .incbin CONFIG_STRING
     //#endif
   end

  endgenerate
  
endmodule

