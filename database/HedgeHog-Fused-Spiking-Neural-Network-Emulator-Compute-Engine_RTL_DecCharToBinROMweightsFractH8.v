// DecCharToBinROMweightsFract.v
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

module DecCharToBinROMweightsFract (
    CLK,
    RESET,
    rden,
    decExpIn,
    intIsZero,
    fractIsZero,
    fractIsSubnormal,
    fractPartBin,
    FractWeightOut,
    binExpOut,
//    subnShiftAmtOut,
    FractWeightLTEtotal, 
    FractWeightS1LTEtotal,
    FractWeightS2LTEtotal
    );    

input  CLK;
input  RESET;
input  rden;
input  [4:0] decExpIn;
input  intIsZero;
input  fractIsZero;
input  fractIsSubnormal;
input  [23:0] fractPartBin;
output [23:0] FractWeightOut;
output [6:0] binExpOut;
output  FractWeightLTEtotal; 
output  FractWeightS1LTEtotal;
output  FractWeightS2LTEtotal;

//(* ram_style = "distributed" *) 
//(* rom_style = "block" *) reg  [23:0] RAMA[18:0];
//(* rom_style = "block" *) reg  [6:0] RAMC[18:0];
reg  [23:0] RAMA[18:0];
reg  [6:0] RAMC[18:0];

reg [23:0] FractWeight;
reg [6:0] biasedBinExp;


reg [23:0] FractWeightOut;
reg [6:0] binExpOut;  

reg fractIsZero_q2;
reg fractIsSubnormal_q2;
reg intIsZero_q2;

initial begin
    RAMA[  0] = 24'D5000000; //     0   [63]    63
    RAMA[  1] = 24'D5000000; //  -  1   [62]    62 61 60
    RAMA[  2] = 24'D6250000; //  -  2   [59]    59 58 57
    RAMA[  3] = 24'D7812500; //  -  3   [56]    56 55 54
    RAMA[  4] = 24'D9765625; //  -  4   [53]    53 52 51 50
    RAMA[  5] = 24'D6103515; //  -  5   [49]    49 48 47
    RAMA[  6] = 24'D7629394; //  -  6   [46]    46 45 44
    RAMA[  7] = 24'D9536743; //  -  7   [43]    43 42 41 40
    RAMA[  8] = 24'D5960464; //  -  8   [39]    39 38 37 
    RAMA[  9] = 24'D7450580; //  -  9   [36]    36 35 34
    RAMA[ 10] = 24'D9313225; //  - 10   [33]    33 32 31 30
    RAMA[ 11] = 24'D5820766; //  - 11   [29]    29 28 27
    RAMA[ 12] = 24'D7275957; //  - 12   [26]    26 25 24
    RAMA[ 13] = 24'D9094947; //  - 13   [23]    23 22 21 20 
    RAMA[ 14] = 24'D5684341; //  - 14   [19]    19 18 17  
    RAMA[ 15] = 24'D7105427; //  - 15   [16]    16 15 14  
    RAMA[ 16] = 24'D8881784; //  - 16   [13]    13 12 11 10  
    RAMA[ 17] = 24'D5551115; //  - 17   [09]    09 08 07  
    RAMA[ 18] = 24'D6938893; //  - 18   [06]    06 05 04 03 02 01 00  
    
end 
// 6938893
// 3469446
// 1734723
//  867361  --   d8
//  433680       d7
//  216840       d6
//  108420       d5
//   54210       d4
//   27105       d3
//   13552       d2
//    6776       d1
//    3388       d0  smallest representable number = 3388 e-18

initial begin
    RAMC[  0] = 63; //     0   [63]    
    RAMC[  1] = 62; //  -  1   [62]    
    RAMC[  2] = 59; //  -  2   [59]    
    RAMC[  3] = 56; //  -  3   [56]    
    RAMC[  4] = 53; //  -  4   [53]    
    RAMC[  5] = 49; //  -  5   [49]    
    RAMC[  6] = 46; //  -  6   [46]    
    RAMC[  7] = 43; //  -  7   [43]    
    RAMC[  8] = 39; //  -  8   [39]    
    RAMC[  9] = 36; //  -  9   [36]    
    RAMC[ 10] = 33; //  - 10   [33]    
    RAMC[ 11] = 29; //  - 11   [29]    
    RAMC[ 12] = 26; //  - 12   [26]    
    RAMC[ 13] = 23; //  - 13   [23]    
    RAMC[ 14] = 19; //  - 14   [19]    
    RAMC[ 15] = 16; //  - 15   [16]    
    RAMC[ 16] = 13; //  - 16   [13]    
    RAMC[ 17] = 09; //  - 17   [09]    
    RAMC[ 18] = 06; //  - 18   [06]    
end      


wire [23:0] FractWeightS0;
wire [23:0] FractWeightS1;
wire [23:0] FractWeightS2;
wire [23:0] FractWeightS3;
wire [23:0] FractWeightS4;

assign FractWeightS0 = fractIsZero_q2 ? 0  : FractWeight;
assign FractWeightS1 = fractIsZero_q2 ? 0  : FractWeight >> 1;
assign FractWeightS2 = fractIsZero_q2 ? 0  : FractWeight >> 2;
assign FractWeightS3 = fractIsZero_q2 ? 0  : FractWeight >> 3;
assign FractWeightS4 = fractIsZero_q2 ? 0  : FractWeight >> 4;

wire FractWeightLTEtot;
wire FractWeightS1LTEtot;
wire FractWeightS2LTEtot;

assign FractWeightLTEtot   = (FractWeightS0 <= fractPartBin);
assign FractWeightS1LTEtot = (FractWeightS1 <= fractPartBin);
assign FractWeightS2LTEtot = (FractWeightS2 <= fractPartBin);
assign FractWeightS3LTEtot = (FractWeightS3 <= fractPartBin);


reg FractWeightLTEtotal;
reg FractWeightS1LTEtotal;
reg FractWeightS2LTEtotal;
reg FractWeightS3LTEtotal;

always @(*)
    if      (fractPartBin >= FractWeightS0  ) {FractWeightLTEtotal, FractWeightS1LTEtotal, FractWeightS2LTEtotal, FractWeightS3LTEtotal} = 4'b1000;
    else if (fractPartBin >= FractWeightS1  ) {FractWeightLTEtotal, FractWeightS1LTEtotal, FractWeightS2LTEtotal, FractWeightS3LTEtotal} = 4'b0100;   
    else if (fractPartBin >= FractWeightS2  ) {FractWeightLTEtotal, FractWeightS1LTEtotal, FractWeightS2LTEtotal, FractWeightS3LTEtotal} = 4'b0010;   
    else if (fractPartBin >= FractWeightS3  ) {FractWeightLTEtotal, FractWeightS1LTEtotal, FractWeightS2LTEtotal, FractWeightS3LTEtotal} = 4'b0001;   
    else                                      {FractWeightLTEtotal, FractWeightS1LTEtotal, FractWeightS2LTEtotal, FractWeightS3LTEtotal} = 4'b0000;


wire [3:0] shiftSel;
assign shiftSel = {FractWeightLTEtotal, FractWeightS1LTEtotal, FractWeightS2LTEtotal, FractWeightS3LTEtotal};
 
always @(*) 
    case(shiftSel)
        4'b1000 : begin
                   FractWeightOut  = FractWeightS0;
                   binExpOut       = fractIsZero_q2 ? 0 :  biasedBinExp;
                end
        4'b0100 : begin                
                   FractWeightOut  = intIsZero_q2 ? FractWeightS1 : FractWeightS0;
                   binExpOut       = fractIsZero_q2 ? 0 : (biasedBinExp - 1);
                end
        4'b0010 : begin                
                   FractWeightOut  = intIsZero_q2 ? FractWeightS2 : FractWeightS0;
                   binExpOut       = fractIsZero_q2 ? 0 : (biasedBinExp - 2);
                end                                                                 
        4'b0001 : begin                
                   FractWeightOut  = intIsZero_q2 ? FractWeightS3 : FractWeightS0;
                   binExpOut       = fractIsZero_q2 ? 0 : (biasedBinExp - 3);
                end                                                                 
       default : begin                                                               
                    FractWeightOut  = intIsZero_q2 ? FractWeightS4 : FractWeightS0;
                    binExpOut       = fractIsZero_q2 ? 0 : (biasedBinExp - 4);
                 end
    endcase


always @(posedge CLK)
    if (RESET) fractIsZero_q2 <= 0;
    else  fractIsZero_q2 <= fractIsZero;
       
always @(posedge CLK)
    if (RESET) intIsZero_q2 <= 0;
    else  intIsZero_q2 <= intIsZero;   


always @(posedge CLK)
    if (RESET) fractIsSubnormal_q2 <= 0;
    else  fractIsSubnormal_q2 <= fractIsSubnormal;   

always @(posedge CLK)
    if (RESET) FractWeight <= 0;
    else if (rden && ~fractIsZero && ~fractIsSubnormal) FractWeight <= RAMA[decExpIn[4:0]];   

always @(posedge CLK)
    if (RESET) biasedBinExp <= 0;
    else if (rden && ~fractIsZero && ~fractIsSubnormal) biasedBinExp <= RAMC[decExpIn[4:0]];   


endmodule    
