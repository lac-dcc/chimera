//SCEultraProgRAM.v
//
// Author:  Jerry D. Harthcock
// Version:  1.22  May 3, 2020
// Copyright (C) 2020.  All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                                    //
//                                                 SYMPL Open-Source                                                  //
//                          HedgeHog Fused Spiking Neural Network Emulator/Compute Engine                             //
//                                    Evaluation and Product Development License                                      //
//                                                                                                                    //
//                                                                                                                    //
// Open-source means:  this source code and this instruction set ("this IP") may be freely downloaded, copied,        //
// modified, distributed and used in accordance with the terms and conditons of the licenses provided herein.         //
//                                                                                                                    //
// Provided that you comply with all the terms and conditions set forth herein, Jerry D. Harthcock ("licensor"),      //
// the original author and exclusive copyright owner of this HedgeHog Fused Spiking Neural Network Emulator/Compute   //
// Engine, including related development software ("this IP"), hereby grants recipient of this IP ("licensee"),       //
// a world-wide, paid-up, non-exclusive license to implement this IP within the programmable fabric of Xilinx Kintex  //
// Ultra Plus brand FPGAs--only--and used only for the purposes of evaluation, education, and development of end      //
// products and related development tools.                                                                            //
//                                                                                                                    //
// Furthermore, limited to the purposes of prototyping, evaluation, characterization and testing of implementations   //
// in a hard, custom or semi-custom ASIC, any university or institution of higher education may have their            //
// implementation of this IP produced for said limited purposes at any foundary of their choosing provided that such  //
// prototypes do not ever wind up in commercial circulation, with this license extending to such foundary and is in   //
// connection with said academic pursuit under the supervision of said university or institution of higher education. //
//                                                                                                                    //
// Any copying, distribution, customization, modification, or derivative work of this IP must include an exact copy   //
// of this license and original copyright notice at the very top of each source file and any derived netlist, and,    //
// in the case of binaries, a printed copy of this license and/or a text format copy in a separate file distributed   //
// with said netlists or binary files having the file name, "LICENSE.txt".  You, the licensee, also agree not to      //
// remove any copyright notices from any source file covered or distributed under this Evaluation and Product         //
// Development License.                                                                                               //
//                                                                                                                    //
// LICENSOR DOES NOT WARRANT OR GUARANTEE THAT YOUR USE OF THIS IP WILL NOT INFRINGE THE RIGHTS OF OTHERS OR          //
// THAT IT IS SUITABLE OR FIT FOR ANY PURPOSE AND THAT YOU, THE LICENSEE, AGREE TO HOLD LICENSOR HARMLESS FROM        //
// ANY CLAIM BROUGHT BY YOU OR ANY THIRD PARTY FOR YOUR SUCH USE.                                                     //
//                                                                                                                    //
// Licensor reserves all his rights, including, but in no way limited to, the right to change or modify the terms     //
// and conditions of this Evaluation and Product Development License anytime without notice of any kind to anyone.    //
// By using this IP for any purpose, licensee agrees to all the terms and conditions set forth in this Evaluation     //
// and Product Development License.                                                                                   //
//                                                                                                                    //
// This Evaluation and Product Development License does not include the right to sell products that incorporate       //
// this IP or any IP derived from this IP. If you would like to obtain such a license, please contact Licensor.       //
//                                                                                                                    //
// Licensor can be contacted at:  SYMPL.gpu@gmail.com or Jerry.Harthcock@gmail.com                                    //
//                                                                                                                    //
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

`timescale 1ns/100ps
 
module SCEultraProgRAM #(parameter ADDRS_WIDTH = 12)(  //"true" dual port RAM build from ultraRAM
    CLK,
    wren,
    wraddrs,
    wrdata,
    rdenA,
    rdaddrsA,
    rddataA,
    rdenB,
    rdaddrsB,
    rddataB
    );    

input  CLK;
input  wren;
input  [ADDRS_WIDTH-1:0] wraddrs;                  
input  [63:0] wrdata;
input  rdenA;
input  [ADDRS_WIDTH-1:0] rdaddrsA;
output [63:0] rddataA;
input  rdenB;
input  [ADDRS_WIDTH-1:0] rdaddrsB;
output [63:0] rddataB;

reg blockRAMreadA_q1;
reg blockRAMreadB_q1;
    
wire [63:0] rdataA;
wire [63:0] rdataB;
wire [63:0] rdataA_blockRAM;
wire [63:0] rddataA_ultraRAM;
wire [63:0] rdataB_blockRAM;
wire [63:0] rddataB_ultraRAM;

wire blockRAMwrite;
assign blockRAMwrite = ~|wraddrs[ADDRS_WIDTH-1:12] && wren;
wire ultraRAMwrite;
assign ultraRAMwrite = |wraddrs[ADDRS_WIDTH-1:12] && wren;
wire blockRAMreadA;
wire blockRAMreadB;
wire ultraRAMreadA;
wire ultraRAMreadB;
assign blockRAMreadA = ~|rdaddrsA[ADDRS_WIDTH-1:12] && rdenA;
assign blockRAMreadB = ~|rdaddrsB[ADDRS_WIDTH-1:12] && rdenB;
assign ultraRAMreadA = |rdaddrsA[ADDRS_WIDTH-1:12] && rdenA;
assign ultraRAMreadB = |rdaddrsB[ADDRS_WIDTH-1:12] && rdenB;
assign rddataA = blockRAMreadA_q1 ? rdataA_blockRAM : rddataA_ultraRAM;
assign rddataB = blockRAMreadB_q1 ? rdataB_blockRAM : rddataB_ultraRAM;

always @(posedge CLK) begin
    blockRAMreadA_q1 <= blockRAMreadA;
    blockRAMreadB_q1 <= blockRAMreadB;
end

ram4kx64 #(.ADDRS_WIDTH(12))       //dword addressable for program and table/constant storage
   pram0(      //program memory 
   .CLK       (CLK           ),
   .wren      (blockRAMwrite ),  
   .wraddrs   (wraddrs[11:0] ),    //writes to program ram are dword in address increments of one
   .wrdata    (wrdata        ),
   .rdenA     (blockRAMreadA ),
   .rdaddrsA  (rdaddrsA[11:0]),
   .rddataA   (rdataA_blockRAM),
   .rdenB     (blockRAMreadB ),
   .rdaddrsB  (rdaddrsB[11:0]),
   .rddataB   (rdataB_blockRAM)
   ); 


ultraRAMx72_TDP #(.ADDRS_WIDTH(`PSIZE))
    pram1(
    .CLK      (CLK         ),
    .wrenA    (ultraRAMwrite),
    .wrenB    (1'b0        ),
    .wraddrsA (wraddrs[`PSIZE-1:0]),
    .wraddrsB (`PSIZE'b0   ),
    .wrdataA  (wrdata      ),
    .wrdataB  (64'b0       ),
    .rdenA    (ultraRAMreadA),
    .rdenB    (ultraRAMreadB),
    .rdaddrsA (rdaddrsA[`PSIZE-1:0]),
    .rdaddrsB (rdaddrsB[`PSIZE-1:0]),
    .rddataA  (rddataA_ultraRAM),
    .rddataB  (rddataB_ultraRAM)
    );    


endmodule
