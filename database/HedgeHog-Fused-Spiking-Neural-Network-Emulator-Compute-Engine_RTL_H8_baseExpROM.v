//H8_baseExpROM.v
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
 
module H8_baseExpROM (
    CLK,
    RESET,
    rden,
    rdaddrs,
    baseExp
    );    

input  CLK;
input  RESET;
input  rden;
input  [6:0] rdaddrs;
output [4:0]  baseExp;

//(* ram_style = "distributed" *) 
reg  [4:0] RAMA[127:0];  //5 bits x 128
reg  [4:0] baseExp;

initial begin
                   //  bin    dec
 RAMA[ 127] =  5'D31; //  NaN
 RAMA[ 126] =  18; //  63    +18
 RAMA[ 125] =  18; //  62    +18
 RAMA[ 124] =  18; //  61    +18
 RAMA[ 123] =  18; //  60    +18
 RAMA[ 122] =  17; //  59    +17
 RAMA[ 121] =  17; //  58    +17
 RAMA[ 120] =  17; //  57    +17
 RAMA[ 119] =  16; //  56    +16
 RAMA[ 118] =  16; //  55    +16
 RAMA[ 117] =  16; //  54    +16
 RAMA[ 116] =  15; //  53    +15
 RAMA[ 115] =  15; //  52    +15
 RAMA[ 114] =  15; //  51    +15
 RAMA[ 113] =  15; //  50    +15
 RAMA[ 112] =  14; //  49    +14
 RAMA[ 111] =  14; //  48    +14
 RAMA[ 110] =  14; //  47    +14
 RAMA[ 109] =  13; //  46    +13
 RAMA[ 108] =  13; //  45    +13
 RAMA[ 107] =  13; //  44    +13
 RAMA[ 106] =  12; //  43    +12
 RAMA[ 105] =  12; //  42    +12
 RAMA[ 104] =  12; //  41    +12
 RAMA[ 103] =  12; //  40    +12
 RAMA[ 102] =  11; //  39    +11
 RAMA[ 101] =  11; //  38    +11
 RAMA[ 100] =  11; //  37    +11
 RAMA[  99] =  10; //  36    +10
 RAMA[  98] =  10; //  35    +10
 RAMA[  97] =  10; //  34    +10
 RAMA[  96] =   9; //  33    + 9
 RAMA[  95] =   9; //  32    + 9
 RAMA[  94] =   9; //  31    + 9
 RAMA[  93] =   9; //  30    + 9
 RAMA[  92] =   8; //  29    + 8
 RAMA[  91] =   8; //  28    + 8
 RAMA[  90] =   8; //  27    + 8

 RAMA[  89] =   0; //  26    + 7
 RAMA[  88] =   0; //  25    + 7
 RAMA[  87] =   0; //  24    + 7
 RAMA[  86] =   0; //  23    + 6
 RAMA[  85] =   0; //  22    + 6
 RAMA[  84] =   0; //  21    + 6
 RAMA[  83] =   0; //  20    + 6
 RAMA[  82] =   0; //  19    + 5
 RAMA[  81] =   0; //  18    + 5
 RAMA[  80] =   0; //  17    + 5
 RAMA[  79] =   0; //  16    + 4
 RAMA[  78] =   0; //  15    + 4
 RAMA[  77] =   0; //  14    + 4
 RAMA[  76] =   0; //  13    + 3
 RAMA[  75] =   0; //  12    + 3
 RAMA[  74] =   0; //  11    + 3
 RAMA[  73] =   0; //  10    + 3
 RAMA[  72] =   0; //  9     + 2
 RAMA[  71] =   0; //  8     + 2
 RAMA[  70] =   0; //  7     + 2
 RAMA[  69] =   0; //  6     + 1
 RAMA[  68] =   0; //  5     + 1
 RAMA[  67] =   0; //  4     + 1
 RAMA[  66] =   0; //  3     + 0
 RAMA[  65] =   0; //  2     + 0
 RAMA[  64] =   0; //  1     + 0
 RAMA[  63] =   0; //  0     + 0

                   // bin    dec          
 RAMA[  62] =  1 ; // -1     -1   minus                      
 RAMA[  61] =  1 ; // -2     -1     |                        
 RAMA[  60] =  1 ; // -3     -1     |                        
 RAMA[  59] =  2 ; // -4     -2     v                        
 RAMA[  58] =  2 ; // -5     -2                              
 RAMA[  57] =  2 ; // -6     -2                              
 RAMA[  56] =  3 ; // -7     -3                              
 RAMA[  55] =  3 ; // -8     -3                              
 RAMA[  54] =  3 ; // -9     -3 
                              

 RAMA[  53] =  4 ; // -10    -4                              
 RAMA[  52] =  4 ; // -11    -4                              
 RAMA[  51] =  4 ; // -12    -4 
 RAMA[  50] =  4 ; // -13    -4 
 RAMA[  49] =  5 ; // -14    -5 
 RAMA[  48] =  5 ; // -15    -5 
 RAMA[  47] =  5 ; // -16    -5 
 RAMA[  46] =  6 ; // -17    -6 
 RAMA[  45] =  6 ; // -18    -6 
 RAMA[  44] =  6 ; // -19    -6 
 RAMA[  43] =  7 ; // -20    -7 
 RAMA[  42] =  7 ; // -21    -7 
 RAMA[  41] =  7 ; // -22    -7 
 RAMA[  40] =  7 ; // -23    -7 
 RAMA[  39] =  8 ; // -24    -8 
 RAMA[  38] =  8 ; // -25    -8 
 RAMA[  37] =  8 ; // -26    -8 
 RAMA[  36] =  9 ; // -27    -9 
 RAMA[  35] =  9 ; // -28    -9 
 RAMA[  34] =  9 ; // -29    -9 
 RAMA[  33] =  10; // -30    -10
 RAMA[  32] =  10; // -31    -10
 RAMA[  31] =  10; // -32    -10
 RAMA[  30] =  10; // -33    -10
 RAMA[  29] =  11; // -34    -11
 RAMA[  28] =  11; // -35    -11
 RAMA[  27] =  11; // -36    -11
 RAMA[  26] =  12; // -37    -12
 RAMA[  25] =  12; // -38    -12
 RAMA[  24] =  12; // -39    -12
 RAMA[  23] =  13; // -40    -13
 RAMA[  22] =  13; // -41    -13
 RAMA[  21] =  13; // -42    -13
 RAMA[  20] =  13; // -43    -13
 RAMA[  19] =  14; // -44    -14
 RAMA[  18] =  14; // -45    -14
 RAMA[  17] =  14; // -46    -14
 RAMA[  16] =  15; // -47    -15
 RAMA[  15] =  15; // -48    -15
 RAMA[  14] =  15; // -49    -15
 RAMA[  13] =  16; // -50    -16
 RAMA[  12] =  16; // -51    -16
 RAMA[  11] =  16; // -52    -16
 RAMA[  10] =  16; // -53    -16
 RAMA[   9] =  17; // -54    -17
 RAMA[   8] =  17; // -55    -17
 RAMA[   7] =  17; // -56    -17
 RAMA[   6] =  18; // -57    -18
 RAMA[   5] =  18; // -58    -18
 RAMA[   4] =  18; // -59    -18
 RAMA[   3] =  19; // -60    -19
 RAMA[   2] =  19; // -61    -19
 RAMA[   1] =  19; // -62    -19
 RAMA[   0] =  19; // -63    subnormal
end                 

always @(posedge CLK) begin
    if (RESET) baseExp <= 0;
    else if (rden) baseExp <= RAMA[rdaddrs];
end

endmodule
