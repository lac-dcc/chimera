// DecCharToBinROMweightsInt.v
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

module DecCharToBinROMweightsInt (
    CLK,
    RESET,
    rden,
    decExpIn,
    intIsZero,
    fractIsSubnormal,    
    integerPartBin,
    IntWeightOut,
    binExpOut
    );    

input  CLK;
input  RESET;
input  rden;
input  [4:0] decExpIn;
input  intIsZero;
input  fractIsSubnormal;
input [26:0] integerPartBin;
output [26:0] IntWeightOut;
output [6:0] binExpOut;


//(* ram_style = "distributed" *) 
//(* rom_style = "block" *) reg  [26:0] RAMA[18:0];
//(* rom_style = "block" *) reg  [6:0] RAMC[18:0];
reg  [26:0] RAMA[19:0];
reg  [6:0] RAMC[19:0];

reg [26:0] IntWeightOut;
reg [6:0] binExpOut;

wire [4:0] decExp;
assign decExp = (intIsZero || fractIsSubnormal) ? 19 : decExpIn;

reg [26:0] IntWeight;
reg [6:0] binExp;

initial begin       
       RAMA[ 19] = 27'D00000000;   //   + 19  NaN
       RAMA[ 18] = 27'D92233720;   //   + 18  [  63]
       RAMA[ 17] = 27'D57646075;   //   + 17  [  59]
       RAMA[ 16] = 27'D72057594;   //   + 16  [  56]
       RAMA[ 15] = 27'D90071992;   //   + 15  [  53]
       RAMA[ 14] = 27'D56294995;   //   + 14  [  49]
       RAMA[ 13] = 27'D70368744;   //   + 13  [  46]
       RAMA[ 12] = 27'D87960930;   //   + 12  [  43]
       RAMA[ 11] = 27'D54975581;   //   + 11  [  39]
       RAMA[ 10] = 27'D68719476;   //   + 10  [  36]
       RAMA[  9] = 27'D85899345;   //   +  9  [  33]
       RAMA[  8] = 27'D53687091;   //   +  8  [  29]
       RAMA[  7] = 27'D67108864;   //   +  7  [  26]
       RAMA[  6] = 27'D08388608;   //   +  6  [  23]
       RAMA[  5] = 27'D00524288;   //   +  5  [  19]
       RAMA[  4] = 27'D00065536;   //   +  4  [  16]
       RAMA[  3] = 27'D00008192;   //   +  3  [  13]
       RAMA[  2] = 27'D00000512;   //   +  2  [   9]
       RAMA[  1] = 27'D00000064;   //   +  1  [   6]
       RAMA[  0] = 27'D00000008;   //   +  0  [   3]
end                                                                      

initial begin
       RAMC[ 19] =         0;   //   + 19  
       RAMC[ 18] =   63 + 63;   //   + 18  [  63]
       RAMC[ 17] =   59 + 63;   //   + 17  [  59]
       RAMC[ 16] =   56 + 63;   //   + 16  [  56]
       RAMC[ 15] =   53 + 63;   //   + 15  [  53]
       RAMC[ 14] =   49 + 63;   //   + 14  [  49]
       RAMC[ 13] =   46 + 63;   //   + 13  [  46]
       RAMC[ 12] =   43 + 63;   //   + 12  [  43]
       RAMC[ 11] =   39 + 63;   //   + 11  [  39]
       RAMC[ 10] =   36 + 63;   //   + 10  [  36]
       RAMC[  9] =   33 + 63;   //   +  9  [  33]
       RAMC[  8] =   29 + 63;   //   +  8  [  29]
       RAMC[  7] =   26 + 63;   //   +  7  [  26]
       RAMC[  6] =   23 + 63;   //   +  6  [  23]
       RAMC[  5] =   19 + 63;   //   +  5  [  19]
       RAMC[  4] =   16 + 63;   //   +  4  [  16]
       RAMC[  3] =   13 + 63;   //   +  3  [  13]
       RAMC[  2] =    9 + 63;   //   +  2  [   9]
       RAMC[  1] =    6 + 63;   //   +  1  [   6]
       RAMC[  0] =    3 + 63;   //   +  0  [   3]
end                                                                      


wire [26:0] IntWeightS1;
wire [26:0] IntWeightS2;
wire [26:0] IntWeightS3;

assign IntWeightS1 = IntWeight >> 1;
assign IntWeightS2 = IntWeight >> 2;
assign IntWeightS3 = IntWeight >> 3;

reg IntWeightLTEtotal;
reg IntWeightS1LTEtotal;
reg IntWeightS2LTEtotal;

always @(*)
    if      (integerPartBin >= IntWeight  ) {IntWeightLTEtotal, IntWeightS1LTEtotal, IntWeightS2LTEtotal} = 3'b100;
    else if (integerPartBin >= IntWeightS1) {IntWeightLTEtotal, IntWeightS1LTEtotal, IntWeightS2LTEtotal} = 3'b010;   
    else if (integerPartBin >= IntWeightS2) {IntWeightLTEtotal, IntWeightS1LTEtotal, IntWeightS2LTEtotal} = 3'b001;   
    else                                    {IntWeightLTEtotal, IntWeightS1LTEtotal, IntWeightS2LTEtotal} = 3'b000;

wire [2:0] shiftSel;
assign shiftSel = {IntWeightLTEtotal, IntWeightS1LTEtotal, IntWeightS2LTEtotal};
 

always @(*) 
    case(shiftSel)
        3'b100 : begin
                    IntWeightOut = IntWeight;
                    binExpOut    = binExp;
                 end
        3'b010 : begin               
                    IntWeightOut = IntWeightS1;
                    binExpOut    = binExp - 1;
                 end
        3'b001 : begin               
                    IntWeightOut = IntWeightS2;
                    binExpOut    = binExp - 2;
                 end                                                                         
       default : begin                                                                       
                    IntWeightOut = IntWeightS3;
                    binExpOut    = binExp - 3;
                 end
    endcase


always @(posedge CLK) begin
    if (RESET) IntWeight <= 0;
    else if (rden) IntWeight <= RAMA[decExp[4:0]];   
end

always @(posedge CLK) begin
    if (RESET) binExp <= 0;
    else if (rden) binExp <= RAMC[decExp[4:0]];   
end

endmodule    
