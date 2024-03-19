//thresholds_128x4096.v     128bits (8 bytes) wide by 4096 deep
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

module thresholds_128x4096(
    CLK,
    wren,
    wraddrs,
    wrdata,
    rden,
    rdaddrs,
    rddata,
    thresholds
    );
    
input CLK;
input wren;
input [14:0] wraddrs;   //writes must be on 16-bit boundaries
input [15:0] wrdata;
input rden;
input [14:0] rdaddrs;
output [15:0] rddata;
output [127:0] thresholds;

wire [127:0] thresholds;
reg [2:0] rdWordSel_q1;

reg [15:0] rddata;

reg [127:0] wrdata_q2;

//for automatic read-after-write
reg wren_del;
reg [11:0] wraddrs_del;

wire [2:0] rdWordSel;
wire [11:0] groupSel;
wire [127:0] threshholds;
wire [2:0] wrWordSel_q2;
wire [11:0] wraddrs_q2;

assign rdWordSel = rdaddrs[2:0];
assign groupSel = rdaddrs[14:3];
assign wraddrs_q2 = wraddrs[14:3];
assign wrWordSel_q2 = wraddrs[2:0];

always @(posedge CLK) begin
    wraddrs_del <= wraddrs[14:3];
    wren_del <= wren;
end    

ultraRAMx72_TDP #(.ADDRS_WIDTH(12))
    ram0(  //"true" dual port RAM built from ultraRAM
    .CLK     (CLK       ),
    .wrenA   (wren      ),
    .wrenB   (1'b0      ),
    .wraddrsA(wraddrs_q2),
    .wraddrsB(12'b0     ),
    .wrdataA (wrdata_q2[63:0]),
    .wrdataB (64'b0   ),
    .rdenA   (1'b0      ),
    .rdenB   (rden || wren_del),
    .rdaddrsA(12'b0     ),
    .rdaddrsB(wren_del ? wraddrs_del : groupSel),
    .rddataA (          ),
    .rddataB (thresholds[63:0])
    );        

ultraRAMx72_TDP #(.ADDRS_WIDTH(12))
    ram1(  //"true" dual port RAM built from ultraRAM
    .CLK     (CLK       ),
    .wrenA   (wren      ),
    .wrenB   (1'b0      ),
    .wraddrsA(wraddrs_q2),
    .wraddrsB(12'b0     ),
    .wrdataA (wrdata_q2[127:64]),
    .wrdataB (64'b0   ),
    .rdenA   (1'b0      ),
    .rdenB   (rden || wren_del),
    .rdaddrsA(12'b0     ),
    .rdaddrsB(wren_del ? wraddrs_del : groupSel),
    .rddataA (          ),
    .rddataB (thresholds[127:64])
    );        

reg [127:0] wrdata_q3;
always @(posedge CLK) wrdata_q3 <= wrdata_q2;
wire [127:0] rddataCollision;
assign rddataCollision = wren_del ? wrdata_q3 : thresholds[127:0]; 

always @(*)
    (* parallel *) case (wrWordSel_q2)
        6'd0  : wrdata_q2 = {rddataCollision[127:16 ], wrdata[15:0]};    
        6'd1  : wrdata_q2 = {rddataCollision[127:32 ], wrdata[15:0], rddataCollision[ 15:0]};
        6'd2  : wrdata_q2 = {rddataCollision[127:48 ], wrdata[15:0], rddataCollision[ 31:0]};
        6'd3  : wrdata_q2 = {rddataCollision[127:64 ], wrdata[15:0], rddataCollision[ 47:0]};
        6'd4  : wrdata_q2 = {rddataCollision[127:80 ], wrdata[15:0], rddataCollision[ 63:0]};
        6'd5  : wrdata_q2 = {rddataCollision[127:96 ], wrdata[15:0], rddataCollision[ 79:0]};
        6'd6  : wrdata_q2 = {rddataCollision[127:112], wrdata[15:0], rddataCollision[ 95:0]};
        6'd7  : wrdata_q2 = { wrdata[15:0], rddataCollision[111:0]};
    endcase
        

always @(*)
    (* parallel *) case(rdWordSel_q1)
        6'd0  : rddata = rddataCollision[ 15:0  ];
        6'd1  : rddata = rddataCollision[ 31:16 ];
        6'd2  : rddata = rddataCollision[ 47:32 ];
        6'd3  : rddata = rddataCollision[ 63:48 ];
        6'd4  : rddata = rddataCollision[ 79:64 ];
        6'd5  : rddata = rddataCollision[ 95:80 ];
        6'd6  : rddata = rddataCollision[111:96 ];
        6'd7  : rddata = rddataCollision[127:112];
    endcase
    
always @(posedge CLK) rdWordSel_q1 <= rdWordSel;

endmodule

   
