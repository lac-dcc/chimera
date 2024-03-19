//  decCharToBinH8.v
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
 

module decCharToBinH8(
    RESET,
    CLK,
    wren,
    wrdata,
    binOut,
    GRS
    );

input CLK;
input RESET;
input wren;
input [63:0] wrdata;
output [15:0] binOut;
output [2:0] GRS;


reg expIsMinus_q0,        
    expIsMinus_q1,        
    expIsMinus_q2,                                                                                      
    expIsMinus_q3,        
    expIsMinus_q4,
    expIsMinus_q5;
    
reg is_snan_q0,        
    is_snan_q1,        
    is_snan_q2,        
    is_snan_q3,        
    is_snan_q4,        
    is_snan_q5;        

reg is_zero_q0,        
    is_zero_q1,        
    is_zero_q2,        
    is_zero_q3,        
    is_zero_q4,        
    is_zero_q5; 
           
reg is_infinite_q0,        
    is_infinite_q1,        
    is_infinite_q2,        
    is_infinite_q3,        
    is_infinite_q4,
    is_infinite_q5;
    
reg is_overflow_q3,        
    is_overflow_q4,        
    is_overflow_q5;        

reg [6:0] payload_q0,
          payload_q1,
          payload_q2,
          payload_q3,
          payload_q4,
          payload_q5;

reg input_is_negative;

reg [3:0] intLeadZeroDigits;

reg [26:0] integerPartBin7;
reg [26:0] integerPartBin6;
reg [26:0] integerPartBin5;
reg [26:0] integerPartBin4;
reg [26:0] integerPartBin3;
reg [26:0] integerPartBin2;
reg [26:0] integerPartBin1;
reg [26:0] integerPartBin0;

reg [4:0] decExp_del_0,
          decExp_del_1; 

reg [3:0] intLeadZeroDigits_q0,
          intLeadZeroDigits_q1;
          
reg [4:0] decExpForLookUp; // actual decimal value in hex, e.g., 1 for e+1, 5 for e+5, sign is separate bit and not part of the value
                           // e.g., sign = 1 = - , e-1 is 1 for exponent and sign = 1 = -.
reg wren_del_0,
    wren_del_1;

reg [26:0] integerPartBin;

reg [6:0] intBinExpOut_q5;

reg [8:0] intPartMant_q5;

reg [23:0] fractPartBin6;
reg [23:0] fractPartBin5;
reg [23:0] fractPartBin4;
reg [23:0] fractPartBin3;
reg [23:0] fractPartBin2;
reg [23:0] fractPartBin1;
reg [23:0] fractPartBin0;

reg sign_q0,    
    sign_q1,    
    sign_q2,    
    sign_q3,    
    sign_q4,    
    sign_q5;
     
reg is_invalid_q0,    
    is_invalid_q1,    
    is_invalid_q2,    
    is_invalid_q3,    
    is_invalid_q4,    
    is_invalid_q5;    

reg fractIsSubnormal_q3,
    fractIsSubnormal_q4,                               
    fractIsSubnormal_q5;                               

reg is_nan_q0,        
    is_nan_q1,        
    is_nan_q2,        
    is_nan_q3,        
    is_nan_q4,        
    is_nan_q5; 
           
reg is_underflow_q3,
    is_underflow_q4,
    is_underflow_q5;
    
reg [6:0] fractBinExpOut_q5;

reg [8:0] intMantissa;

reg [8:0] fractMantissa;

reg [7:0] mantissaFinal;
    
reg intMantIsZero;

reg [15:0] binOut;


wire [135:0] tFormOut;

tokenExpformatr tExpForm(
    .DCSin (wrdata),
    .DCSout(tFormOut)
    );


// tFormOut                                                                                                                                                                                                                       <---- Integer Part --->|<---- Fraction Part --->
//                                                                                                                                                                                                                                                |
// digit                  16        15        14        13        12      11      10       9       8    |    7       6       5       4       3       2       1       0
//                         |         |         |         |         |       |       |       |       |    |    |       |       |       |       |       |       |    +--|--+
// Char position          + 2B      14        13        12        11      10       9       8       7    |    6       5       4       3       2       1       0    |   unbiased
// ascii code  hex        - 2D      3x        3x        3x        3x      3x      3x      3x      3x    |   3x      3x      3x      3x      3x      3x      3x   sign exponent
//                         |         |         |         |         |       |       |       |       |    |    |       |       |       |       |       |       |    |      |
//                         |         |         |         |         |       |       |       |       |    |    |       |       |       |       |       |       |    |      |
//                         |         |         |         |         |       |       |       |       |    |    |       |       |       |       |       |       |    |      |
// entire byte         [135:128] [127:120] [119:112] [111:104] [103:96] [95:88] [87:80] [79:72] [71:64] | [63:56] [55:48] [47:40] [39:32] [31:24] [23:16] [15:8] [7]   [6:0]
// lower nyble only    [131:128] [123:120] [115:112] [107:104]  [99:96] [91:88] [83:80] [75:72] [67:64] | [59:56] [51:48] [43:40] [35:32] [27:24] [19:16] [11:8]  |______|
//                         |         |         |         |         |       |       |       |       |    |    |       |       |       |       |       |       |        |
// nan                                                                                                  |   20     2B/2D     n       a       n      20      3x       3x
// snan                                                                                                 |  2B/2D     s       n       a       n      20      3x       3x
// infinity                                                                                             |   20      20      20      20     2B/2D     i       n        f
// zero                                                                                                 |  2B/2D    30      30      30      30      30      30       30
//                              

wire [4:0] decExp;
assign decExp = tFormOut[4:0];

wire input_is_nan;
wire input_is_zero;
wire input_is_snan;
wire input_is_infinite;
wire input_is_invalid;
wire input_is_overflow;
wire input_is_underflow;
wire input_is_good_number;
wire good_payload;
wire good_number;

wire [6:0] payload;

always @(*)
    if (input_is_nan) input_is_negative = (wrdata[55:48]=="-");
    else if (input_is_snan) input_is_negative = (wrdata[63:56]=="-");
    else if (input_is_infinite) input_is_negative = (wrdata[31:24]=="-"); 
    else input_is_negative = (tFormOut[135:128]=="-");

assign input_is_zero =    ((wrdata[63:56]=="+") || (wrdata[63:56]=="-") || (wrdata[63:56]=="0")) && 
                           (tFormOut[55:0]=={7{"0"}}) ;
                           
assign input_is_infinite = (wrdata[63:32]=={4{" "}}) && ((wrdata[31:24]=="+") || (wrdata[31:24]=="-")) && (wrdata[23:0]=="inf"); 

wire [7:0] plChar1;        //payload hex character
wire [7:0] plChar0;

assign plChar1  = wrdata[ 15:  8];
assign plChar0  = wrdata[  7:  0];

wire [3:0] plDig1 ;
wire [3:0] plDig0 ;

cnvFHC dig1(
    .charIn  (plChar1),
    .nybleOut(plDig1)
    );
cnvFHC dig0(
    .charIn  (plChar0),
    .nybleOut(plDig0)
    );
   
assign payload = {plDig1,  //max value for this digit is 7h
                  plDig0 
                  };  

wire GoodplChar1 ;
wire GoodplChar0 ;

assign GoodplChar1   = (((wrdata[ 15: 12]==4'h3) && (wrdata[ 11:  8] <= 4'h7))); //max payload is 7F hex, represntable with two hex characters
assign GoodplChar0   = (((wrdata[  7:  4]==4'h3) && (wrdata[  3:  0] <= 4'h9)) || ((wrdata[ 7: 4]==4'b0100) && (wrdata[  3:  0] <= 4'h6)));

assign good_payload = GoodplChar1 && GoodplChar0;
                      
assign input_is_nan = (wrdata[63:56]==" ") && ((wrdata[55:48]=="+") || (wrdata[55:48]=="-") || (wrdata[55:48]==" ")) && 
                      (wrdata[47:16]=="nan ") && good_payload;   //payloads must be specified, e.g., +nan 00; -nan 05; nan 47 --max payload is 7Fn
                      
assign input_is_snan = ((wrdata[63:56]=="+") || (wrdata[63:56]=="-") || (wrdata[63:56]==" ")) && 
                       (wrdata[55:16]=="snan ") && good_payload;  //payloads must be specified, e.g., snan 00; +snan 05; -snan 47 --max payload is 7Fn
                       
assign good_number = ((tFormOut[135:128]=="+") || (tFormOut[135:128]=="-")) &&
                     ((tFormOut[127:120]>="0") && (tFormOut[127:120]<="9")) &&
                     ((tFormOut[119:112]>="0") && (tFormOut[119:112]<="9")) &&
                     ((tFormOut[111:104]>="0") && (tFormOut[111:104]<="9")) &&
                     ((tFormOut[103: 96]>="0") && (tFormOut[103: 96]<="9")) &&
                     ((tFormOut[ 95: 88]>="0") && (tFormOut[ 95: 88]<="9")) &&
                     ((tFormOut[ 87: 80]>="0") && (tFormOut[ 87: 80]<="9")) &&
                     ((tFormOut[ 79: 72]>="0") && (tFormOut[ 79: 72]<="9")) &&
                     ((tFormOut[ 71: 64]>="0") && (tFormOut[ 71: 64]<="9")) &&
                     ((tFormOut[ 63: 56]>="0") && (tFormOut[ 63: 56]<="9")) &&
                     ((tFormOut[ 55: 48]>="0") && (tFormOut[ 55: 48]<="9")) &&
                     ((tFormOut[ 47: 40]>="0") && (tFormOut[ 47: 40]<="9")) &&
                     ((tFormOut[ 39: 32]>="0") && (tFormOut[ 39: 32]<="9")) &&
                     ((tFormOut[ 31: 24]>="0") && (tFormOut[ 31: 24]<="9")) &&
                     ((tFormOut[ 23: 16]>="0") && (tFormOut[ 23: 16]<="9")) &&
                     ((tFormOut[ 15:  8]>="0") && (tFormOut[ 15:  8]<="9")) &&
                      (tFormOut[  6:  0]<= 7'D18);

wire charTest;
assign charTest = ((tFormOut[127:120]>=8'h30) && (tFormOut[127:120]<=8'h39));
                       
                       
assign input_is_good_number = good_number;
                              
assign input_is_invalid = ~input_is_zero     &&
                          ~input_is_nan      &&
                          ~input_is_snan     &&
                          ~input_is_infinite &&
                          ~input_is_good_number;
                          
wire [3:0] digIn14;
wire [3:0] digIn13;
wire [3:0] digIn12;
wire [3:0] digIn11;
wire [3:0] digIn10;   //      /\
wire [3:0] digIn9;    //      ||
wire [3:0] digIn8;    //      ||
wire [3:0] digIn7;    // integer part (8 digits max)

wire [3:0] digIn6;    // fraction part (7 digits max)
wire [3:0] digIn5;    //      ||
wire [3:0] digIn4;    //      ||
wire [3:0] digIn3;    //      \/
wire [3:0] digIn2;
wire [3:0] digIn1;
wire [3:0] digIn0;
               
assign digIn14 = tFormOut[123:120];
assign digIn13 = tFormOut[115:112];
assign digIn12 = tFormOut[107:104];
assign digIn11 = tFormOut[ 99: 96];
assign digIn10 = tFormOut[ 91: 88];   //      /\
assign digIn9  = tFormOut[ 83: 80];   //      ||
assign digIn8  = tFormOut[ 75: 72];   //      ||
assign digIn7  = tFormOut[ 67: 64];   // integer part (8 digits max)

assign digIn6  = tFormOut[ 59: 56];   // fraction part (7 digits max)
assign digIn5  = tFormOut[ 51: 48];   //      ||
assign digIn4  = tFormOut[ 43: 40];   //      ||
assign digIn3  = tFormOut[ 35: 32];   //      \/
assign digIn2  = tFormOut[ 27: 24];
assign digIn1  = tFormOut[ 19: 16];
assign digIn0  = tFormOut[ 11:  8];

wire [31:0] integerPartDec;
assign integerPartDec = {digIn14,
                         digIn13,
                         digIn12,
                         digIn11,
                         digIn10,
                         digIn9 ,
                         digIn8 ,
                         digIn7};

wire expIsMinus;
assign expIsMinus = tFormOut[7];

wire [27:0] fractPartDec;
assign fractPartDec = {digIn6, 
                       digIn5, 
                       digIn4, 
                       digIn3, 
                       digIn2, 
                       digIn1, 
                       digIn0
                       };

wire [3:0] integerPartDec7;
wire [3:0] integerPartDec6;
wire [3:0] integerPartDec5;
wire [3:0] integerPartDec4;
wire [3:0] integerPartDec3;
wire [3:0] integerPartDec2;
wire [3:0] integerPartDec1;
wire [3:0] integerPartDec0;

assign integerPartDec7  = digIn14;
assign integerPartDec6  = digIn13;
assign integerPartDec5  = digIn12;  
assign integerPartDec4  = digIn11;  
assign integerPartDec3  = digIn10;  
assign integerPartDec2  = digIn9 ;  
assign integerPartDec1  = digIn8 ;  
assign integerPartDec0  = digIn7 ;  


wire intDigit7isNotZero;
wire intDigit6isNotZero;
wire intDigit5isNotZero;
wire intDigit4isNotZero;
wire intDigit3isNotZero;
wire intDigit2isNotZero;
wire intDigit1isNotZero;
wire intDigit0isNotZero;

assign intDigit7isNotZero  = |integerPartDec7 ;
assign intDigit6isNotZero  = |integerPartDec6 ;
assign intDigit5isNotZero  = |integerPartDec5 ;
assign intDigit4isNotZero  = |integerPartDec4 ;
assign intDigit3isNotZero  = |integerPartDec3 ;
assign intDigit2isNotZero  = |integerPartDec2 ;
assign intDigit1isNotZero  = |integerPartDec1 ;
assign intDigit0isNotZero  = |integerPartDec0 ;
                                          
wire [7:0] intLeadZeroSel;
assign intLeadZeroSel = {intDigit7isNotZero ,
                         intDigit6isNotZero ,
                         intDigit5isNotZero ,
                         intDigit4isNotZero ,
                         intDigit3isNotZero ,
                         intDigit2isNotZero ,
                         intDigit1isNotZero ,
                         intDigit0isNotZero 
                         };

wire intDigit7isNotDot;
wire intDigit6isNotDot;
wire intDigit5isNotDot;
wire intDigit4isNotDot;
wire intDigit3isNotDot;
wire intDigit2isNotDot;
wire intDigit1isNotDot;
wire intDigit0isNotDot;

assign intDigit7isNotDot  = |integerPartDec7 ;
assign intDigit6isNotDot  = |integerPartDec6 ;
assign intDigit5isNotDot  = |integerPartDec5 ;
assign intDigit4isNotDot  = |integerPartDec4 ;
assign intDigit3isNotDot  = |integerPartDec3 ;
assign intDigit2isNotDot  = |integerPartDec2 ;
assign intDigit1isNotDot  = |integerPartDec1 ;
assign intDigit0isNotDot  = |integerPartDec0 ;
                                          
wire [7:0] intLeadDotSel;
assign intLeadDotSel = {intDigit7isNotDot ,
                        intDigit6isNotDot ,
                        intDigit5isNotDot ,
                        intDigit4isNotDot ,
                        intDigit3isNotDot ,
                        intDigit2isNotDot ,
                        intDigit1isNotDot ,
                        intDigit0isNotDot 
                        };


reg  [23:0] fractPartBin;
wire fractIsZero;
assign fractIsZero = ~|fractPartBin;  

wire intIsZero;
assign intIsZero = ~|integerPartBin;

always @(*)
    casex(intLeadZeroSel)                                
        8'b1xxxxxxx : intLeadZeroDigits = 0;
        8'b01xxxxxx : intLeadZeroDigits = 1;
        8'b001xxxxx : intLeadZeroDigits = 2;
        8'b0001xxxx : intLeadZeroDigits = 3;
        8'b00001xxx : intLeadZeroDigits = 4;
        8'b000001xx : intLeadZeroDigits = 5;
        8'b0000001x : intLeadZeroDigits = 6;
        8'b00000001 : intLeadZeroDigits = 7;
            default : intLeadZeroDigits = 8;
    endcase                                             
 
always @(posedge CLK)
    if (RESET) begin
        decExp_del_0 <= 0;
        decExp_del_1 <= 0;
    end
    else begin
        decExp_del_0 <= decExp;
        decExp_del_1 <= decExp_del_0;
    end  

always @(posedge CLK)
    if (RESET) begin
        intLeadZeroDigits_q0 <= 0;
        intLeadZeroDigits_q1 <= 0;
    end
    else begin
        intLeadZeroDigits_q0 <= intLeadZeroDigits;
        intLeadZeroDigits_q1 <= intLeadZeroDigits_q0;
    end              

always @(*)
        if (|intLeadZeroDigits_q1) decExpForLookUp = (7 - intLeadZeroDigits_q1);
        else decExpForLookUp = (decExp_del_1 + 8) + (8 - intLeadZeroDigits_q1) ;
    
always @(posedge CLK)
    if (RESET) begin
        wren_del_0 <= 0;        
        wren_del_1 <= 0;        
    end
    else begin
        wren_del_0 <= wren;        
        wren_del_1 <= wren_del_0;        
    end    

always @(posedge CLK) begin   //q0
    if (RESET) begin
        integerPartBin7 <= 0;
        integerPartBin6 <= 0;
        integerPartBin5 <= 0;
        integerPartBin4 <= 0; 
        integerPartBin3 <= 0; 
        integerPartBin2 <= 0; 
        integerPartBin1 <= 0; 
        integerPartBin0 <= 0; 
    end
    else begin
        integerPartBin7 <= integerPartDec7 * 24'D10000000;
        integerPartBin6 <= integerPartDec6 * 24'D01000000;
        integerPartBin5 <= integerPartDec5 * 24'D00100000;
        integerPartBin4 <= integerPartDec4 * 24'D00010000;
        integerPartBin3 <= integerPartDec3 * 24'D00001000;
        integerPartBin2 <= integerPartDec2 * 24'D00000100;
        integerPartBin1 <= integerPartDec1 * 24'D00000010;
        integerPartBin0 <= integerPartDec0 * 24'D00000001;
    end
end    
    
wire [26:0] iPB7iPB6;
wire [26:0] iPB5iPB4;
wire [26:0] iPB3iPB2;
wire [26:0] iPB1iPB0;

assign iPB7iPB6 = integerPartBin7  + integerPartBin6;
assign iPB5iPB4 = integerPartBin5  + integerPartBin4;
assign iPB3iPB2 = integerPartBin3  + integerPartBin2;
assign iPB1iPB0 = integerPartBin1  + integerPartBin0;

wire [26:0] iPB7iPB6_iPB5iPB4;
wire [26:0] iPB3iPB2_iPB1iPB0;

assign iPB7iPB6_iPB5iPB4 = iPB7iPB6 + iPB5iPB4;
assign iPB3iPB2_iPB1iPB0 = iPB3iPB2 + iPB1iPB0;

always @(posedge CLK) begin           //q1
    if (RESET) begin
        integerPartBin <= 0;
    end
    else begin
        integerPartBin <= iPB7iPB6_iPB5iPB4 + iPB3iPB2_iPB1iPB0;
    end
end

assign input_is_overflow = (((integerPartBin > 27'D01339555) && (decExp_del_1 == 12))  ||         //1FF<<12
                            ((integerPartBin > 27'D00001339) && (decExp_del_1 == 15))  ||
                            ((integerPartBin > 27'D00000001) && (decExp_del_1 == 18))) && ~expIsMinus_q1;

wire fractIsSubnormal;
assign fractIsSubnormal =    (((fractPartBin < 24'D0003388) && (decExp_del_1 == 18))  ||        //.0003388e-18
                              ((fractPartBin < 24'D0000003) && (decExp_del_1 == 15))) && intIsZero && expIsMinus_q1;
                              
assign input_is_underflow = fractIsSubnormal; 

wire [6:0] intBinExpOut;
wire [8:0] intPartMant;
wire [2:0] GRS_int;
wire [2:0] GRS_fract;
reg [2:0] GRS;
 
decCharToBinIntPart intPart(
    .CLK             (CLK             ), 
    .RESET           (RESET           ), 
    .wren_del_1      (wren_del_1      ), 
    .decExp_del_1    (decExpForLookUp ),
    .intIsZero       (intIsZero       ), 
    .fractIsSubnormal(fractIsSubnormal),
    .integerPartBin  (integerPartBin  ), 
    .intPartMant     (intPartMant     ), //q4
    .biasedBinExpOut (intBinExpOut    ),  //q4
    .GRS_int         (GRS_int         )
    );

always @(posedge CLK)
    if (RESET) intBinExpOut_q5 <= 0;
    else intBinExpOut_q5 <= intBinExpOut;   
    
always @(posedge CLK)
    if (RESET) intPartMant_q5 <= 0;
    else intPartMant_q5 <= intPartMant;

wire [3:0] fractPartDec6;
wire [3:0] fractPartDec5;
wire [3:0] fractPartDec4;
wire [3:0] fractPartDec3;
wire [3:0] fractPartDec2;
wire [3:0] fractPartDec1;
wire [3:0] fractPartDec0;

assign fractPartDec6  = fractPartDec[27:24];
assign fractPartDec5  = fractPartDec[23:20];  
assign fractPartDec4  = fractPartDec[19:16];  
assign fractPartDec3  = fractPartDec[15:12];  
assign fractPartDec2  = fractPartDec[11: 8];  
assign fractPartDec1  = fractPartDec[ 7: 4];  
assign fractPartDec0  = fractPartDec[ 3: 0];  

always @(posedge CLK) begin
    if (RESET) begin
        fractPartBin6  <= 0;
        fractPartBin5  <= 0;
        fractPartBin4  <= 0; 
        fractPartBin3  <= 0; 
        fractPartBin2  <= 0; 
        fractPartBin1  <= 0; 
        fractPartBin0  <= 0; 
    end
    else begin
        fractPartBin6  <= fractPartDec6  * 20'D1000000;
        fractPartBin5  <= fractPartDec5  * 20'D0100000;
        fractPartBin4  <= fractPartDec4  * 20'D0010000;
        fractPartBin3  <= fractPartDec3  * 20'D0001000;
        fractPartBin2  <= fractPartDec2  * 20'D0000100;
        fractPartBin1  <= fractPartDec1  * 20'D0000010;
        fractPartBin0  <= fractPartDec0  * 20'D0000001;
    end
end    

wire [23:0] fPB6    ;
wire [23:0] fPB5fPB4;
wire [23:0] fPB3fPB2;
wire [23:0] fPB1fPB0;

assign fPB6       = fractPartBin6;
assign fPB5fPB4   = fractPartBin5 + fractPartBin4;
assign fPB3fPB2   = fractPartBin3 + fractPartBin2;
assign fPB1fPB0   = fractPartBin1 + fractPartBin0;

wire [23:0] fPB6_fPB5fPB4;
wire [23:0] fPB3fPB2_fPB1fPB0;

assign fPB6_fPB5fPB4 = fPB6 + fPB5fPB4;
assign fPB3fPB2_fPB1fPB0 = fPB3fPB2 + fPB1fPB0;

always @(posedge CLK) begin
    if (RESET) begin
        fractPartBin <= 0;
    end
    else begin
        fractPartBin <= fPB6_fPB5fPB4 + fPB3fPB2_fPB1fPB0;  // q1
    end
end

wire [6:0] fractBinExpOut;
wire [8:0] fractPartMant;

wire [4:0] fractExp_q1;
assign fractExp_q1 = (intLeadZeroDigits_q1 != 8) ? 5'b0 : (decExp_del_1);  //if any integer part digits are not zero, then substitue 0 for fraction exp

decCharToBinFractPart fracPart(
    .CLK             (CLK             ),
    .RESET           (RESET           ),
    .wren_del_1      (wren_del_1      ),
    .decExp_del_1    (fractExp_q1     ),
    .intIsZero       (intIsZero       ), 
    .fractIsZero     (fractIsZero     ),
    .fractIsSubnormal(fractIsSubnormal),
    .fractPartBin    (fractPartBin    ),
    .fractPartMant   (fractPartMant   ), //q4
    .biasedBinExpOut (fractBinExpOut  ),
    .GRS_fract       (GRS_fract       )
    );
       
always @(posedge CLK)
    if (RESET) fractBinExpOut_q5 <= 0;
    else fractBinExpOut_q5 <= fractBinExpOut;   

wire [5:0] unbiasedExp_q4;
assign unbiasedExp_q4 = intBinExpOut - 63;

wire [3:0] intFractSel;
assign intFractSel = (unbiasedExp_q4 < 9) ? unbiasedExp_q4 : 9;
    
always @(posedge CLK)       //q5
    case(intFractSel)
        4'd7  : intMantissa <= {intPartMant[8:1], fractPartMant[8  ]};
        4'd6  : intMantissa <= {intPartMant[8:2], fractPartMant[8:7]};
        4'd5  : intMantissa <= {intPartMant[8:3], fractPartMant[8:6]};
        4'd4  : intMantissa <= {intPartMant[8:4], fractPartMant[8:5]};
        4'd3  : intMantissa <= {intPartMant[8:5], fractPartMant[8:4]};
        4'd2  : intMantissa <= {intPartMant[8:6], fractPartMant[8:3]};
        4'd1  : intMantissa <= {intPartMant[8:7], fractPartMant[8:2]};
        4'd0  : intMantissa <= {intPartMant[8  ], fractPartMant[8:1]};
      default : intMantissa <=  intPartMant[8:0];
    endcase    

always @(posedge CLK)   //q5
    fractMantissa <=  fractPartMant;
    
always @(posedge CLK)   // q5
    if (RESET) intMantIsZero <= 0;
    else intMantIsZero <= intBinExpOut < 63;

always @(posedge CLK)   // q5
    if (RESET) GRS <= 0;
    else GRS <= (intBinExpOut < 63) ? GRS_fract : GRS_int;


always @(*)
    if (intMantIsZero) begin  //
        mantissaFinal = fractMantissa[7:0]; 
    end       
    else begin
        mantissaFinal = intMantissa[7:0];
    end    

wire [6:0] expFinal;
assign expFinal = intMantIsZero ? fractBinExpOut_q5 : intBinExpOut_q5;

wire [15:0] bin16Out;
always @(*)
    if (is_invalid_q5) binOut = {sign_q5, 7'b1111111, 1'b1, 7'h08}; 
    else if (is_snan_q5 || is_nan_q5) binOut = {sign_q5, 7'b1111111, 1'b1, payload_q5}; //signaling snans as char input are quieted 
    else if (is_overflow_q5 || is_infinite_q5) binOut = {sign_q5, 7'b1111111, 8'b0};
    else if (is_zero_q5) binOut = {sign_q5, 15'b0};
    else binOut = {sign_q5, expFinal, mantissaFinal};  

assign bin16Out = binOut; 

always @(posedge CLK)
    if (RESET) begin
        sign_q0 <= 1'b0;
        sign_q1 <= 1'b0; 
        sign_q2 <= 1'b0; 
        sign_q3 <= 1'b0; 
        sign_q4 <= 1'b0;
        sign_q5 <= 1'b0;
    end
    else begin
        sign_q0 <= input_is_negative;
        sign_q1 <= sign_q0; 
        sign_q2 <= sign_q1; 
        sign_q3 <= sign_q2; 
        sign_q4 <= sign_q3; 
        sign_q5 <= sign_q4; 
    end

always @(posedge CLK)
    if (RESET) begin
        is_invalid_q0 <= 1'b0;
        is_invalid_q1 <= 1'b0;    
        is_invalid_q2 <= 1'b0;    
        is_invalid_q3 <= 1'b0;    
        is_invalid_q4 <= 1'b0;    
        is_invalid_q5 <= 1'b0;    
    end
    else begin
        if (wren) is_invalid_q0 <= input_is_invalid;
        is_invalid_q1 <= is_invalid_q0; 
        is_invalid_q2 <= is_invalid_q1; 
        is_invalid_q3 <= is_invalid_q2; 
        is_invalid_q4 <= is_invalid_q3; 
        is_invalid_q5 <= is_invalid_q4; 
    end 
    
always @(posedge CLK)
    if (RESET) begin
        fractIsSubnormal_q3 <= 0;  
        fractIsSubnormal_q4 <= 0;
        fractIsSubnormal_q5 <= 0; 
    end
    else begin                       
        fractIsSubnormal_q3 <= fractIsSubnormal;  
        fractIsSubnormal_q4 <= fractIsSubnormal_q3 ;
        fractIsSubnormal_q5 <= fractIsSubnormal_q4 ; 
    end                       
            
always @(posedge CLK)
    if (RESET) begin
        is_nan_q0 <= 1'b0;
        is_nan_q1 <= 1'b0;
        is_nan_q2 <= 1'b0;
        is_nan_q3 <= 1'b0;
        is_nan_q4 <= 1'b0;
        is_nan_q5 <= 1'b0;
    end
    else begin
        if (wren) is_nan_q0 <= input_is_nan;
        is_nan_q1 <= is_nan_q0;
        is_nan_q2 <= is_nan_q1 ;
        is_nan_q3 <= is_nan_q2 ;
        is_nan_q4 <= is_nan_q3 ;
        is_nan_q5 <= is_nan_q4 ;
  end
                              
always @(posedge CLK)
    if (RESET) begin
        is_snan_q0 <= 1'b0;
        is_snan_q1 <= 1'b0;
        is_snan_q2 <= 1'b0;
        is_snan_q3 <= 1'b0;
        is_snan_q4 <= 1'b0;
        is_snan_q5 <= 1'b0;
    end
    else begin
        if (wren) is_snan_q0 <= input_is_snan;
        is_snan_q1 <= is_snan_q0;
        is_snan_q2 <= is_snan_q1 ;
        is_snan_q3 <= is_snan_q2 ;
        is_snan_q4 <= is_snan_q3 ;
        is_snan_q5 <= is_snan_q4 ;
    end

always @(posedge CLK)
    if (RESET) begin
        is_zero_q0 <= 1'b0;
        is_zero_q1 <= 1'b0;
        is_zero_q2 <= 1'b0;
        is_zero_q3 <= 1'b0;
        is_zero_q4 <= 1'b0;
        is_zero_q5 <= 1'b0;
    end
    else begin
        if (wren) is_zero_q0 <= input_is_zero;
        is_zero_q1 <= is_zero_q0;
        is_zero_q2 <= is_zero_q1 ;
        is_zero_q3 <= is_zero_q2 ;
        is_zero_q4 <= is_zero_q3 ;
        is_zero_q5 <= is_zero_q4 ;
    end

always @(posedge CLK)
    if (RESET) begin
        is_infinite_q0 <= 0;        
        is_infinite_q1 <= 0;        
        is_infinite_q2 <= 0;        
        is_infinite_q3 <= 0;        
        is_infinite_q4 <= 0;
        is_infinite_q5 <= 0;
    end
    else begin
        if (wren) is_infinite_q0 <= input_is_infinite;
            is_infinite_q1 <= is_infinite_q0;
            is_infinite_q2 <= is_infinite_q1;
            is_infinite_q3 <= is_infinite_q2;
            is_infinite_q4 <= is_infinite_q3;
            is_infinite_q5 <= is_infinite_q4;
    end

always @(posedge CLK)
    if (RESET) begin
        is_overflow_q3 <= 0;      
        is_overflow_q4 <= 0;      
        is_overflow_q5 <= 0;      
    end
    else begin
        if (wren) is_overflow_q3 <= input_is_overflow;      
        is_overflow_q4 <= is_overflow_q3 ;      
        is_overflow_q5 <= is_overflow_q4 ;      
    end

always @(posedge CLK)
    if (RESET) begin
        is_underflow_q3 <= 1'b0;
        is_underflow_q4 <= 1'b0;
        is_underflow_q5 <= 1'b0;
    end                 
    else begin
        if (wren) is_underflow_q3 <= input_is_underflow;
        is_underflow_q4 <= is_underflow_q3 ;
        is_underflow_q5 <= is_underflow_q4 ;
    end

always @(posedge CLK)
    if (RESET) begin
        payload_q0 <= 0;
        payload_q1 <= 0;
        payload_q2 <= 0;
        payload_q3 <= 0;
        payload_q4 <= 0;
        payload_q5 <= 0;
    end
    else begin
        if (wren && (input_is_snan || input_is_nan)) payload_q0 <= payload;
        payload_q1 <= payload_q0;
        payload_q2 <= payload_q1;
        payload_q3 <= payload_q2;
        payload_q4 <= payload_q3;
        payload_q5 <= payload_q4;
    end                             

always @(posedge CLK)
    if (RESET) begin
        expIsMinus_q0 <= 0;        
        expIsMinus_q1 <= 0;        
        expIsMinus_q2 <= 0;        
        expIsMinus_q3 <= 0;        
        expIsMinus_q4 <= 0;
        expIsMinus_q5 <= 0;
    end
    else begin
        if (wren) expIsMinus_q0 <= expIsMinus;
            expIsMinus_q1 <= expIsMinus_q0;
            expIsMinus_q2 <= expIsMinus_q1;
            expIsMinus_q3 <= expIsMinus_q2;
            expIsMinus_q4 <= expIsMinus_q3;
            expIsMinus_q5 <= expIsMinus_q4;
    end
    
       
endmodule
