//rates_256x4096.v     4 bits by 64 nyble (256 bits) wide by 4096 deep
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

module rates_256x4096(
    CLK,
    wren,
    wraddrs,
    wrdata,
    rden,
    rdaddrs, 
    rddata,
    rates
    );
    
input CLK;
input wren;
input [17:0] wraddrs;   //writes must be on 8-bit boundaries
input [3:0] wrdata;
input rden;
input [17:0] rdaddrs;
output [7:0] rddata;
output [191:0] rates;

reg [7:0] rddata;
reg [5:0] rdWordSel_q1;

wire [5:0] rdWordSel;
wire [191:0] rates;  //64 3-bit rates
wire [255:0] LayerRates;

wire ram0wren;
wire ram1wren;
wire ram2wren;
wire ram3wren;

assign ram0wren = wren && wraddrs[5:4]==2'b00;
assign ram1wren = wren && wraddrs[5:4]==2'b01;
assign ram2wren = wren && wraddrs[5:4]==2'b10;
assign ram3wren = wren && wraddrs[5:4]==2'b11;

assign rdWordSel = rdaddrs[5:0];
assign rates = {LayerRates[254:252],
                LayerRates[250:248],
                LayerRates[246:244],
                LayerRates[242:240],
                LayerRates[238:236],
                LayerRates[234:232],
                LayerRates[230:228],
                LayerRates[226:224],
                LayerRates[222:220],
                LayerRates[218:216],
                LayerRates[214:212],
                LayerRates[210:208],
                LayerRates[206:204],
                LayerRates[202:200],
                LayerRates[198:196],
                LayerRates[194:192],
                LayerRates[190:188],
                LayerRates[186:184],
                LayerRates[182:180],
                LayerRates[178:176],
                LayerRates[174:172],
                LayerRates[170:168],
                LayerRates[166:164],
                LayerRates[162:160],
                LayerRates[158:156],
                LayerRates[154:152],
                LayerRates[150:148],
                LayerRates[146:144],
                LayerRates[142:140],
                LayerRates[138:136],
                LayerRates[134:132],
                LayerRates[130:128],
                LayerRates[126:124],
                LayerRates[122:120],
                LayerRates[118:116],
                LayerRates[114:112],
                LayerRates[110:108],
                LayerRates[106:104],
                LayerRates[102:100],
                LayerRates[ 98: 96],
                LayerRates[ 94: 92],
                LayerRates[ 90: 88],
                LayerRates[ 86: 84],
                LayerRates[ 82: 80],
                LayerRates[ 78: 76],
                LayerRates[ 74: 72],
                LayerRates[ 70: 68],
                LayerRates[ 66: 64],
                LayerRates[ 62: 60],
                LayerRates[ 58: 56],
                LayerRates[ 54: 52],
                LayerRates[ 50: 48],
                LayerRates[ 46: 44],
                LayerRates[ 42: 40],
                LayerRates[ 38: 36],
                LayerRates[ 34: 32],
                LayerRates[ 30: 28],
                LayerRates[ 26: 24],
                LayerRates[ 22: 20],
                LayerRates[ 18: 16],
                LayerRates[ 14: 12],
                LayerRates[ 10:  8],
                LayerRates[  6:  4],
                LayerRates[  2:  0]};

UltraTDP64x4096_4 ram0(
    .CLK     (CLK             ),
    .wren    (ram0wren        ),
    .wraddrs ({wraddrs[17:6], wraddrs[3:0]}),
    .wrdata  (wrdata          ),   //8-bit wrdata
    .rden    (rden            ),
    .rdaddrs (rdaddrs[17:6]   ),
    .rddata64(LayerRates[63:0])
    );

UltraTDP64x4096_4 ram1(
    .CLK     (CLK             ),
    .wren    (ram1wren        ),
    .wraddrs ({wraddrs[17:6], wraddrs[3:0]}),
    .wrdata  (wrdata          ),   //8-bit wrdata
    .rden    (rden            ),
    .rdaddrs (rdaddrs[17:6]   ),
    .rddata64(LayerRates[127:64])
    );

UltraTDP64x4096_4 ram2(
    .CLK     (CLK             ),
    .wren    (ram2wren        ),
    .wraddrs ({wraddrs[17:6], wraddrs[3:0]}),
    .wrdata  (wrdata          ),   //8-bit wrdata
    .rden    (rden            ),
    .rdaddrs (rdaddrs[17:6]   ),
    .rddata64(LayerRates[191:128])
    );

UltraTDP64x4096_4 ram3(
    .CLK     (CLK             ),
    .wren    (ram3wren        ),
    .wraddrs ({wraddrs[17:6], wraddrs[3:0]}),
    .wrdata  (wrdata          ),   //8-bit wrdata
    .rden    (rden            ),
    .rdaddrs (rdaddrs[17:6]   ),
    .rddata64(LayerRates[255:192])
    );

always @(*)
    (* parallel *) case(rdWordSel_q1)
        6'd0  : rddata = {5'b0, LayerRates[  2:  0]};
        6'd1  : rddata = {5'b0, LayerRates[  6:  4]};
        6'd2  : rddata = {5'b0, LayerRates[ 10:  8]};
        6'd3  : rddata = {5'b0, LayerRates[ 14: 12]};
        6'd4  : rddata = {5'b0, LayerRates[ 18: 16]};
        6'd5  : rddata = {5'b0, LayerRates[ 22: 20]};
        6'd6  : rddata = {5'b0, LayerRates[ 26: 24]};
        6'd7  : rddata = {5'b0, LayerRates[ 30: 28]};
        6'd8  : rddata = {5'b0, LayerRates[ 34: 32]};
        6'd9  : rddata = {5'b0, LayerRates[ 38: 36]};
        6'd10 : rddata = {5'b0, LayerRates[ 42: 40]};
        6'd11 : rddata = {5'b0, LayerRates[ 46: 44]};
        6'd12 : rddata = {5'b0, LayerRates[ 50: 48]};
        6'd13 : rddata = {5'b0, LayerRates[ 54: 52]};
        6'd14 : rddata = {5'b0, LayerRates[ 58: 56]};
        6'd15 : rddata = {5'b0, LayerRates[ 62: 60]};
        6'd16 : rddata = {5'b0, LayerRates[ 66: 64]};
        6'd17 : rddata = {5'b0, LayerRates[ 70: 68]};
        6'd18 : rddata = {5'b0, LayerRates[ 74: 72]};
        6'd19 : rddata = {5'b0, LayerRates[ 78: 76]};
        6'd20 : rddata = {5'b0, LayerRates[ 82: 80]};
        6'd21 : rddata = {5'b0, LayerRates[ 86: 84]};
        6'd22 : rddata = {5'b0, LayerRates[ 90: 88]};
        6'd23 : rddata = {5'b0, LayerRates[ 94: 92]};
        6'd24 : rddata = {5'b0, LayerRates[ 98: 96]};
        6'd25 : rddata = {5'b0, LayerRates[102:100]};
        6'd26 : rddata = {5'b0, LayerRates[106:104]};
        6'd27 : rddata = {5'b0, LayerRates[110:108]};
        6'd28 : rddata = {5'b0, LayerRates[114:112]};
        6'd29 : rddata = {5'b0, LayerRates[118:116]};
        6'd30 : rddata = {5'b0, LayerRates[122:120]};
        6'd31 : rddata = {5'b0, LayerRates[126:124]};
        6'd32 : rddata = {5'b0, LayerRates[130:128]};
        6'd33 : rddata = {5'b0, LayerRates[134:132]};
        6'd34 : rddata = {5'b0, LayerRates[138:136]};
        6'd35 : rddata = {5'b0, LayerRates[142:140]};
        6'd36 : rddata = {5'b0, LayerRates[146:144]};
        6'd37 : rddata = {5'b0, LayerRates[150:148]};
        6'd38 : rddata = {5'b0, LayerRates[154:152]};
        6'd39 : rddata = {5'b0, LayerRates[158:156]};
        6'd40 : rddata = {5'b0, LayerRates[162:160]};
        6'd41 : rddata = {5'b0, LayerRates[166:164]};
        6'd42 : rddata = {5'b0, LayerRates[170:168]};
        6'd43 : rddata = {5'b0, LayerRates[174:172]};
        6'd44 : rddata = {5'b0, LayerRates[178:176]};
        6'd45 : rddata = {5'b0, LayerRates[182:180]};
        6'd46 : rddata = {5'b0, LayerRates[186:184]};
        6'd47 : rddata = {5'b0, LayerRates[190:188]};
        6'd48 : rddata = {5'b0, LayerRates[194:192]};
        6'd49 : rddata = {5'b0, LayerRates[198:196]};
        6'd50 : rddata = {5'b0, LayerRates[202:200]};
        6'd51 : rddata = {5'b0, LayerRates[206:204]};
        6'd52 : rddata = {5'b0, LayerRates[210:208]};
        6'd53 : rddata = {5'b0, LayerRates[214:212]};
        6'd54 : rddata = {5'b0, LayerRates[218:216]};
        6'd55 : rddata = {5'b0, LayerRates[222:220]};
        6'd56 : rddata = {5'b0, LayerRates[226:224]};
        6'd57 : rddata = {5'b0, LayerRates[230:228]};
        6'd58 : rddata = {5'b0, LayerRates[234:232]};
        6'd59 : rddata = {5'b0, LayerRates[238:236]};
        6'd60 : rddata = {5'b0, LayerRates[242:240]};
        6'd61 : rddata = {5'b0, LayerRates[246:244]};
        6'd62 : rddata = {5'b0, LayerRates[250:248]};
        6'd63 : rddata = {5'b0, LayerRates[254:252]};
    endcase                                       
                                                  
always @(posedge CLK) rdWordSel_q1 <= rdWordSel;  
                                                  
endmodule                                         
                                                  
                                                  
                                                  
                                                  
                                                  
                                                  
