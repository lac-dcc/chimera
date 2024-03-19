// tokenExpformatr.v
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

 module tokenExpformatr(
    DCSin,
    DCSout
    );
input [63:0]  DCSin;      //up to 8 characters in
output [135:0] DCSout;    //standard (default) output format

// XXXXXXXX
// .XXXXXXX
// X.XXXXXX
// XX.XXXXX
// XXX.XXXX
// XXXX.XXX
// XXXXX.XX
// XXXXXX.X
// XXXXXXX.

// XXXXXXXT
// .XXXXXXT
// X.XXXXXT
// XX.XXXXT
// XXX.XXXT
// XXXX.XXT
// XXXXX.XT
// XXXXXX.T

// -XXXXXXX
// -.XXXXXX
// -X.XXXXX
// -XX.XXXX
// -XXX.XXX
// -XXXX.XX
// -XXXXX.X
// -XXXXXX.
// -XXXXXXX

// -XXXXXXT
// -.XXXXXT
// -X.XXXXT
// -XX.XXXT
// -XXX.XXT
// -XXXX.XT
// -XXXXX.T

//----Token Exponent Definitions---------------------------------
// "A" thru "Z" means: "e+001" thru "e+026" respectively
// "a" thru "z" means: "e-001" thru "e-026" respectively

reg [55:0] normFractPart;
reg [7:0] adjDecExpWithSign;
reg [2:0] dotPosition;
reg [47:0] zeroBucket;
reg [63:0] integerPart;
reg [55:0] fractPart;
reg  [7:0] dotBucket;
reg [4:0] decExpIn; //range is 0 to 18 for positive number and 1 to 18 for negative numbers
reg expSign;   

wire [111:0] stringNoToken;   // no token and no sign, both of which were replaced with zero characters
wire signIsNeg;
wire [7:0] dotPosSel;
wire fractD7isNotZero,
     fractD6isNotZero,
     fractD5isNotZero,
     fractD4isNotZero,
     fractD3isNotZero,
     fractD2isNotZero,
     fractD1isNotZero;
wire [6:0] fractShiftAmt;  
wire [7:0] token;
wire [7:0] decExpWithSign;
wire [7:0] DCSin_8,
           DCSin_7,
           DCSin_6,
           DCSin_5,
           DCSin_4,
           DCSin_3,
           DCSin_2,
           DCSin_1;
           
assign token = DCSin[7:0];
always @(*)
    if (token<="g") begin
        decExpIn = 1;
        expSign = 1'b1;  //negative
    end    
    else if ((token>"g") && (token<="z")) begin
        decExpIn = (token - "a") - 5;
        expSign = 1'b1;  //negative
    end    
    else if ((token>="A") && (token<="Z")) begin
        decExpIn = (token - "A") + (signIsNeg ? 6 : 7);
        expSign = 0;  //positive
    end    
    else begin
        decExpIn = |dotPosition;   //if no dot present, then integer-only.  If dot present and no token, then decExpIn is -1, unbiased
        expSign = |dotPosition;
    end
    
assign decExpWithSign = {expSign, 2'b0, decExpIn[4:0]};
        
                             
assign DCSin_8 = ((DCSin[63:56]=="+") || (DCSin[63:56]=="-") || (DCSin[63:56]==" ") || (DCSin[63:56]==8'b0)) ? "0" : DCSin[63:56];      
assign DCSin_7 = ((DCSin[55:48]=="+") || (DCSin[55:48]=="-") || (DCSin[55:48]==" ") || (DCSin[55:48]==8'b0)) ? "0" : DCSin[55:48];      
assign DCSin_6 = ((DCSin[47:40]=="+") || (DCSin[47:40]=="-") || (DCSin[47:40]==" ") || (DCSin[47:40]==8'b0)) ? "0" : DCSin[47:40];      
assign DCSin_5 = ((DCSin[39:32]=="+") || (DCSin[39:32]=="-") || (DCSin[39:32]==" ") || (DCSin[39:32]==8'b0)) ? "0" : DCSin[39:32];      
assign DCSin_4 = ((DCSin[31:24]=="+") || (DCSin[31:24]=="-") || (DCSin[31:24]==" ") || (DCSin[31:24]==8'b0)) ? "0" : DCSin[31:24];      
assign DCSin_3 = ((DCSin[23:16]=="+") || (DCSin[23:16]=="-") || (DCSin[23:16]==" ") || (DCSin[23:16]==8'b0)) ? "0" : DCSin[23:16];      
assign DCSin_2 = ((DCSin[15: 8]=="+") || (DCSin[15: 8]=="-") || (DCSin[15: 8]==" ") || (DCSin[15: 8]==8'b0)) ? "0" : DCSin[15: 8];      
assign DCSin_1 = (DCSin[7: 4]==4'h3) ? DCSin[7: 0] : "0";

assign signIsNeg = (DCSin[63:56]=="-") ||
                   (DCSin[55:48]=="-") ||
                   (DCSin[47:40]=="-") ||
                   (DCSin[39:32]=="-") ||
                   (DCSin[31:24]=="-") ||
                   (DCSin[23:16]=="-") ||
                   (DCSin[15: 8]=="-");

assign dotPosSel = {(DCSin_8=="."),
                    (DCSin_7=="."),
                    (DCSin_6=="."),
                    (DCSin_5=="."),
                    (DCSin_4=="."),
                    (DCSin_3=="."),
                    (DCSin_2==".")
                    };       


always @(*)
    casex(dotPosSel)    //dot has to appear in one of the 22 right-most character positions to be considered (for those numbers that actually have one)
        7'b1xxxxxx : dotPosition = 7 ;    
        7'b01xxxxx : dotPosition = 6 ;    
        7'b001xxxx : dotPosition = 5 ;    
        7'b0001xxx : dotPosition = 4 ;    
        7'b00001xx : dotPosition = 3 ;    
        7'b000001x : dotPosition = 2 ;    
        7'b0000001 : dotPosition = 1 ;    //far right position next to (immediately left of) token exponent character
           default : dotPosition = 0 ;    //if no dot present, then it's all integer and the fract part needs to be filled with 0s <---not correct statement, as no dot is required
    endcase

assign stringNoToken = {DCSin_8, DCSin_7, DCSin_6, DCSin_5, DCSin_4, DCSin_3, DCSin_2, DCSin_1, {6{"0"}}} ;        

    
always @(*)
    if ((dotPosition[2:0]==3'b0) && (token>="a") && (token<="g")) 
        case(token) 
            "a" : {dotBucket, integerPart, fractPart, zeroBucket} = {"0", {2{"0"}}, DCSin_8, DCSin_7, DCSin_6, DCSin_5, DCSin_4, DCSin_3, DCSin_2, {6{"0"}}, {6{"0"}}}; 
            "b" : {dotBucket, integerPart, fractPart, zeroBucket} = {"0", {3{"0"}}, DCSin_8, DCSin_7, DCSin_6, DCSin_5, DCSin_4,          DCSin_3, DCSin_2, {5{"0"}}, {6{"0"}}}; 
            "c" : {dotBucket, integerPart, fractPart, zeroBucket} = {"0", {4{"0"}}, DCSin_8, DCSin_7, DCSin_6, DCSin_5,                   DCSin_4, DCSin_3, DCSin_2, {4{"0"}}, {6{"0"}}}; 
            "d" : {dotBucket, integerPart, fractPart, zeroBucket} = {"0", {5{"0"}}, DCSin_8, DCSin_7, DCSin_6,                            DCSin_5, DCSin_4, DCSin_3, DCSin_2, {3{"0"}}, {6{"0"}}}; 
            "e" : {dotBucket, integerPart, fractPart, zeroBucket} = {"0", {6{"0"}}, DCSin_8, DCSin_7,                                     DCSin_6, DCSin_5, DCSin_4, DCSin_3, DCSin_2, {2{"0"}}, {6{"0"}}}; 
            "f" : {dotBucket, integerPart, fractPart, zeroBucket} = {"0", {7{"0"}}, DCSin_8,                                              DCSin_7, DCSin_6, DCSin_5, DCSin_4, DCSin_3, DCSin_2, "0", {6{"0"}}}; 
            "g" : {dotBucket, integerPart, fractPart, zeroBucket} = {"0", {8{"0"}},                                                       DCSin_8, DCSin_7, DCSin_6, DCSin_5, DCSin_4, DCSin_3, DCSin_2, {6{"0"}}};
        default : {dotBucket, integerPart, fractPart, zeroBucket} = {22{"0"}};
        endcase    
    else if ((dotPosition[2:0]==3'b0) && (token>="h") && (token<="z")) {dotBucket, integerPart, fractPart, zeroBucket} = {"0", {8{"0"}}, DCSin_8, DCSin_7, DCSin_6, DCSin_5, DCSin_4, DCSin_3, DCSin_2, {6{"0"}}}; 
    else if ((dotPosition[2:0]==3'b0) && (token>="A") && (token<="Z")) {dotBucket, integerPart, fractPart, zeroBucket} = {"0", DCSin_8, DCSin_7, DCSin_6, DCSin_5, DCSin_4, DCSin_3, DCSin_2, DCSin_2, {7{"0"}}, {6{"0"}}}; 
    else {integerPart, dotBucket, fractPart, zeroBucket} = stringNoToken << ((7 - dotPosition) * 8);    //this is necessary to get rid of dot, if any
    
      
//fraction part must now be normalized

assign fractD7isNotZero = ~(fractPart[55:48]=="0");    
assign fractD6isNotZero = ~(fractPart[47:40]=="0");    
assign fractD5isNotZero = ~(fractPart[39:32]=="0");    
assign fractD4isNotZero = ~(fractPart[31:24]=="0");    
assign fractD3isNotZero = ~(fractPart[23:16]=="0");    
assign fractD2isNotZero = ~(fractPart[15:08]=="0");    
assign fractD1isNotZero = ~(fractPart[07:00]=="0");

assign fractShiftAmt = {fractD7isNotZero,
                        fractD6isNotZero,
                        fractD5isNotZero,
                        fractD4isNotZero,
                        fractD3isNotZero,
                        fractD2isNotZero,
                        fractD1isNotZero};

always @(*) 
    if (~|(integerPart & {8{8'h0F}})) 
        casex(fractShiftAmt)
            7'b1xxxxxx : begin
                           normFractPart = fractPart;     //no shift
                           adjDecExpWithSign = decExpWithSign[7:0]; 
                         end   
            7'b01xxxxx : begin
                           normFractPart = {fractPart[47:0], "0"};     //shift by 1
                           adjDecExpWithSign = decExpWithSign[7:0] + 1; //use next neg exponent token value in increasing mag/sequence
                        end   
            7'b001xxxx : begin
                           normFractPart = {fractPart[39:0], "00"};    //shift by 2
                           adjDecExpWithSign = decExpWithSign[7:0] + 2; //use next neg exponent token value in increasing mag/sequence
                        end   
            7'b0001xxx : begin
                           normFractPart = {fractPart[31:0], "000"};   //shift by 3
                           adjDecExpWithSign = decExpWithSign[7:0] + 3; //use next neg exponent token value in increasing mag/sequence
                        end   
            7'b00001xx : begin
                           normFractPart = {fractPart[23:0], "0000"};  //shift by 4
                           adjDecExpWithSign = decExpWithSign[7:0] + 4; //use next neg exponent token value in increasing mag/sequence
                        end   
            7'b000001x : begin
                           normFractPart = {fractPart[15:0], "00000"}; //shift by 5
                           adjDecExpWithSign = decExpWithSign[7:0] + 5; //use next neg exponent token value in increasing mag/sequence
                        end   
            7'b0000001 : begin
                           normFractPart = {fractPart[ 7:0], "000000"}; //shift by 6
                           adjDecExpWithSign = decExpWithSign[7:0] + 6; //use next neg exponent token value in increasing mag/sequence
                        end   
               default : begin
                           normFractPart = fractPart; //already normalized or all zeros
                           adjDecExpWithSign = decExpWithSign[7:0]; 
                         end  
        endcase
    else begin
           normFractPart = fractPart; //already normalized or all zeros
           adjDecExpWithSign = decExpWithSign[7:0]; 
         end  
        

// default output format                                                                                                                                                                                                                        <---- Integer Part --->|<---- Fraction Part --->
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
//                              


wire [135:0] DCSout;
assign DCSout = { (signIsNeg ? "-" : "+"), (integerPart | {8{"0"}}), (normFractPart | {7{"0"}}), adjDecExpWithSign[7:0]};

endmodule
