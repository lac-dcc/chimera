// ROMweightsFract_H8.v
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

module ROMweightsFract_H8 (
    CLK,
    RESET,
    rden,
    rdaddrs,
    mantissa,
    FractWeight,
    zeroIn
    );    

input  CLK;
input  RESET;
input  rden;
input  [6:0] rdaddrs;
input  [7:0] mantissa;
output [23:0] FractWeight;
input zeroIn;

//(* ram_style = "distributed" *) 
//(* rom_style = "block" *) reg  [23:0] RAMA[63:0];
reg  [23:0] RAMA[63:0];
reg  [23:0] rddata;

reg [23:0] FractWeight;

reg zeroOutput;
reg substitutePnt5;

wire [5:0] unbiasedExp;
assign unbiasedExp = rdaddrs - 63;

initial begin

    RAMA[63] = 24'D0000000; //   0       for integer + fraction only   
    RAMA[62] = 24'D5000000; //  -1       fraction only    
    RAMA[61] = 24'D2500000; //  -1                   
    RAMA[60] = 24'D1250000; //  -1                   
    RAMA[59] = 24'D6250000; //  -2                   
    RAMA[58] = 24'D3125000; //  -2                   
    RAMA[57] = 24'D1562500; //  -2                   
    RAMA[56] = 24'D7812500; //  -3                   
    RAMA[55] = 24'D3906250; //  -3                   
    RAMA[54] = 24'D1953125; //  -3                   
    RAMA[53] = 24'D9765625; //  -4                   
    RAMA[52] = 24'D4882812; //  -4                   
    RAMA[51] = 24'D2441406; //  -4                   
    RAMA[50] = 24'D1220703; //  -4                   
    RAMA[49] = 24'D6103515; //  -5                   
    RAMA[48] = 24'D3051757; //  -5                   
    RAMA[47] = 24'D1525878; //  -5                   
    RAMA[46] = 24'D7629394; //  -6                   
    RAMA[45] = 24'D3814697; //  -6                   
    RAMA[44] = 24'D1907348; //  -6                   
    RAMA[43] = 24'D9536743; //  -7                   
    RAMA[42] = 24'D4768371; //  -7                   
    RAMA[41] = 24'D2384185; //  -7                   
    RAMA[40] = 24'D1192092; //  -7                   
    RAMA[39] = 24'D5960464; //  -8                   
    RAMA[38] = 24'D2980232; //  -8                   
    RAMA[37] = 24'D1490116; //  -8                   
    RAMA[36] = 24'D7450580; //  -9                   
    RAMA[35] = 24'D3725290; //  -9                   
    RAMA[34] = 24'D1862645; //  -9                   
    RAMA[33] = 24'D9313225; //  -10                  
    RAMA[32] = 24'D4656612; //  -10                  
    RAMA[31] = 24'D2328306; //  -10                  
    RAMA[30] = 24'D1164153; //  -10                  
    RAMA[29] = 24'D5820766; //  -11                  
    RAMA[28] = 24'D2910383; //  -11                 
    RAMA[27] = 24'D1455191; //  -11                  
    RAMA[26] = 24'D7275957; //  -12                  
    RAMA[25] = 24'D3637978; //  -12                  
    RAMA[24] = 24'D1818989; //  -12                  
    RAMA[23] = 24'D9094947; //  -13                  
    RAMA[22] = 24'D4547473; //  -13                  
    RAMA[21] = 24'D2273736; //  -13                  
    RAMA[20] = 24'D1136868; //  -13                  
    RAMA[19] = 24'D5684341; //  -14                  
    RAMA[18] = 24'D2842170; //  -14                  
    RAMA[17] = 24'D1421085; //  -14                  
    RAMA[16] = 24'D7105427; //  -15                  
    RAMA[15] = 24'D3552713; //  -15                  
    RAMA[14] = 24'D1776356; //  -15                  
    RAMA[13] = 24'D8881784; //  -16                  
    RAMA[12] = 24'D4440892; //  -16                  
    RAMA[11] = 24'D2220446; //  -16                  
    RAMA[10] = 24'D1110223; //  -16                  
    RAMA[ 9] = 24'D5551115; //  -17                  
    RAMA[ 8] = 24'D2775557; //  -17                  
    RAMA[ 7] = 24'D1387778; //  -17                  
    RAMA[ 6] = 24'D6938893; //  -18                  
    RAMA[ 5] = 24'D3469446; //  -18                  
    RAMA[ 4] = 24'D1734723; //  -18                  
    RAMA[ 3] = 24'D8673617; //  -19                  
    RAMA[ 2] = 24'D4336808; //  -19                  
    RAMA[ 1] = 24'D2168404; //  -19                  
    RAMA[ 0] = 24'D0000000; //  -subnormal        
end      



always @(*) if (zeroOutput) FractWeight = 0;
            else if (substitutePnt5) FractWeight = 24'D5000000;
            else FractWeight = rddata; 

always @(posedge CLK)
    if (RESET) zeroOutput <= 1'b1;
    else zeroOutput <= (rdaddrs > 70) || zeroIn || ((rdaddrs > 62) && ~|mantissa);
    
always @(posedge CLK)
    if (RESET) substitutePnt5 <= 1'b0;
    else substitutePnt5 <= (rdaddrs > 62) && |mantissa;
    
always @(posedge CLK) begin
    if (RESET) rddata <= 0;
    else if (rden) rddata <= RAMA[rdaddrs[5:0]];   
end


endmodule    
