//UltraTDP64x4096_16.v     64bits (4 16-bit words) wide by 4096 deep
// read-modify-write RAM only--meaning it must be read before written
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

 module UltraTDP64x4096_16 (
    CLK,
    wren,
    wraddrs,
    wrdata,
    rden,
    rdaddrs,
    rddata64
    );
    
input CLK;
input wren;
input [13:0] wraddrs;   //writes must be on 16-bit boundaries
input [15:0] wrdata;
input rden;
input [11:0] rdaddrs;
output [63:0] rddata64;

reg [63:0] wrdata_q2;
//for automatic read-after-write
reg wren_del;
reg [11:0] wraddrs_del;

wire [1:0] wrWordSel;
wire [63:0] rddata64;

assign wrWordSel = wraddrs[1:0];

always @(posedge CLK) begin
    wraddrs_del <= wraddrs[13:2];
    wren_del <= wren;
end    

ultraRAMx72_TDP #(.ADDRS_WIDTH(12))
   ram0(  //"true" dual port RAM built from ultraRAM
    .CLK     (CLK       ),
    .wrenA   (wren      ),
    .wrenB   (1'b0      ),
    .wraddrsA(wraddrs[13:2]),
    .wraddrsB(12'b0     ),
    .wrdataA (wrdata_q2 ),
    .wrdataB (64'b0     ),
    .rdenA   (1'b0      ),
    .rdenB   (rden || wren_del),
    .rdaddrsA(12'b0     ),
    .rdaddrsB(wren_del ? wraddrs_del : rdaddrs[11:0]),
    .rddataA (          ),
    .rddataB (rddata64[63:0])
    );        

reg [63:0] wrdata_q3;
always @(posedge CLK) wrdata_q3 <= wrdata_q2;
wire [63:0] rddataCollision;
assign rddataCollision = wren_del ? wrdata_q3 : rddata64[63:0]; 
    
always @(*)
    (* parallel *) case(wrWordSel)
        2'b00 : wrdata_q2 = {rddataCollision[63:16], wrdata[15:0]};   
        2'b01 : wrdata_q2 = {rddataCollision[63:32], wrdata[15:0], rddataCollision[15:0]};   
        2'b10 : wrdata_q2 = {rddataCollision[63:48], wrdata[15:0], rddataCollision[31:0]};   
        2'b11 : wrdata_q2 = {wrdata[15:0], rddataCollision[47:0]};   
    endcase
        
endmodule
