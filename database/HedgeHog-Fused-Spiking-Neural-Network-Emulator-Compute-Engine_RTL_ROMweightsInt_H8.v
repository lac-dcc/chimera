// ROMweightsInt_H8.v
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

module ROMweightsInt_H8 (
    CLK,
    RESET,
    rden,
    rdaddrs,
    IntWeight,
    mantissa,
    fractMask,
    intMask,
    zeroIn,
    fractionOnly
    );    

input  CLK;
input  RESET;
input  rden;
input  [6:0] rdaddrs;
input  [7:0] mantissa;
output [26:0] IntWeight;
output [8:0] fractMask;
output [7:0] intMask;
input zeroIn;
output fractionOnly;

//(* ram_style = "distributed" *) 
//(* rom_style = "block" *) reg  [26:0] RAMA[63:0];
reg  [26:0] RAMA[63:0];
reg  [26:0] rddata;
reg intEnable;
reg NaN_q;    //or inf
reg fractionOnly;

reg [7:0] intMask;
reg [8:0] fractMask;

wire [26:0] IntWeight;
wire [5:0] unbiasedExp;
wire NaN;
assign IntWeight = intEnable ? rddata[26:0] : 0;
assign unbiasedExp = rdaddrs - 63;
assign NaN = &rdaddrs;

initial begin
    RAMA[  63] = 27'D92233720;   //   + 18  
    RAMA[  62] = 27'D46116860;   //   + 18  
    RAMA[  61] = 27'D23058430;   //   + 18  
    RAMA[  60] = 27'D11529215;   //   + 18  
    RAMA[  59] = 27'D57646075;   //   + 17  
    RAMA[  58] = 27'D28823037;   //   + 17  
    RAMA[  57] = 27'D14411518;   //   + 17  
    RAMA[  56] = 27'D72057594;   //   + 16  
    RAMA[  55] = 27'D36028797;   //   + 16  
    RAMA[  54] = 27'D18014398;   //   + 16  
    RAMA[  53] = 27'D90071992;   //   + 15  
    RAMA[  52] = 27'D45035996;   //   + 15  
    RAMA[  51] = 27'D22517998;   //   + 15  
    RAMA[  50] = 27'D11258999;   //   + 15   
    RAMA[  49] = 27'D56294995;   //   + 14  
    RAMA[  48] = 27'D28147497;   //   + 14  
    RAMA[  47] = 27'D14073748;   //   + 14  
    RAMA[  46] = 27'D70368744;   //   + 13  
    RAMA[  45] = 27'D35184372;   //   + 13  
    RAMA[  44] = 27'D17592186;   //   + 13  
    RAMA[  43] = 27'D87960930;   //   + 12  
    RAMA[  42] = 27'D43980465;   //   + 12  
    RAMA[  41] = 27'D21990232;   //   + 12  
    RAMA[  40] = 27'D10995116;   //   + 12  
    RAMA[  39] = 27'D54975581;   //   + 11  
    RAMA[  38] = 27'D27487790;   //   + 11  
    RAMA[  37] = 27'D13743895;   //   + 11  
    RAMA[  36] = 27'D68719476;   //   + 10  
    RAMA[  35] = 27'D34359738;   //   + 10  
    RAMA[  34] = 27'D17179869;   //   + 10  
    RAMA[  33] = 27'D85899345;   //   +  9  
    RAMA[  32] = 27'D42949672;   //   +  9  
    RAMA[  31] = 27'D21474836;   //   +  9  
    RAMA[  30] = 27'D10737418;   //   +  9  
    RAMA[  29] = 27'D53687091;   //   +  8  
    RAMA[  28] = 27'D26843545;   //   +  8  
    RAMA[  27] = 27'D13421772;   //   +  8 
    RAMA[  26] = 27'D67108864;   //   +  7  
    RAMA[  25] = 27'D33554432;   //   +  7  
    RAMA[  24] = 27'D16777216;   //   +  7  
    RAMA[  23] = 27'D08388608;   //   +  6  
    RAMA[  22] = 27'D04194304;   //   +  6  
    RAMA[  21] = 27'D02097152;   //   +  6  
    RAMA[  20] = 27'D01048576;   //   +  6  
    RAMA[  19] = 27'D00524288;   //   +  5  
    RAMA[  18] = 27'D00262144;   //   +  5  
    RAMA[  17] = 27'D00131072;   //   +  5  
    RAMA[  16] = 27'D00065536;   //   +  4  
    RAMA[  15] = 27'D00032768;   //   +  4  
    RAMA[  14] = 27'D00016384;   //   +  4  
    RAMA[  13] = 27'D00008192;   //   +  3  
    RAMA[  12] = 27'D00004096;   //   +  3  
    RAMA[  11] = 27'D00002048;   //   +  3  
    RAMA[  10] = 27'D00001024;   //   +  3  
    RAMA[   9] = 27'D00000512;   //   +  2     72
    RAMA[   8] = 27'D00000256;   //   +  2     71  8
    RAMA[   7] = 27'D00000128;   //   +  2     70  7
    RAMA[   6] = 27'D00000064;   //   +  1     69  6
    RAMA[   5] = 27'D00000032;   //   +  1     68  5
    RAMA[   4] = 27'D00000016;   //   +  1     67  4
    RAMA[   3] = 27'D00000008;   //   +  0     66  3
    RAMA[   2] = 27'D00000004;   //   +  0     65  2
    RAMA[   1] = 27'D00000002;   //   +  0     64  1
    RAMA[   0] = 27'D00000001;   //   +  0     63  0
end                                                                      

always @(posedge CLK) begin
    if (RESET) begin
        intEnable <= 1'b0;
        NaN_q <= 1'b0;
        fractionOnly <= 1'b0;
        intMask <= 0;
        fractMask <= 0;
    end
    else begin
        intEnable <= (rdaddrs > 62) && ~NaN && ~zeroIn;  //rdaddrs is biased
        NaN_q <= NaN;
        fractionOnly <= rdaddrs < 63;
        
        if ((rdaddrs[6:0] < 71) && (rdaddrs[6:0] > 62) && ~NaN && ~zeroIn) intMask <= ({9{1'b1}} << (71 - rdaddrs[6:0])) & mantissa;
        else if ((rdaddrs[6:0] > 62) && ~NaN && ~zeroIn) intMask <= mantissa;
        else intMask <= 0;
        if ((rdaddrs[6:0] < 71) && (rdaddrs[6:0] > 62) && ~NaN && ~zeroIn) fractMask <= mantissa << (rdaddrs[6:0] - 62);
        else if ((rdaddrs[6:0] < 63) && ~NaN && ~zeroIn) fractMask <= {1'b1, mantissa};  //fraction only
        else fractMask <= 0;        

    end
end
    
always @(posedge CLK) begin
    if (RESET) rddata <= 0;
    else if (rden) rddata <= RAMA[unbiasedExp[5:0]];   
end

endmodule    
