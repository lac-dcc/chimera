// binToDecCharH8.v
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

module binToDecCharH8(
    RESET ,
    CLK   ,
    RM,
    wren,
    wrdata,
    ascOut
    );   

input RESET;
input CLK;
input [1:0] RM;
input wren;
input [15:0] wrdata;
output [63:0] ascOut; 

reg [63:0] wrdata_del_1,
           wrdata_del_2,
           wrdata_del_3,
           wrdata_del_4,
           wrdata_del_5;       

reg [63:0] ascOut;
reg [5:0] adjExponent;
reg [31:0] alignDigits;
wire [63:0] finalResult;


wire [15:0] payloadStr;                          

wire [4:0] finalSel;

wire fractionOnly;
wire [4:0] baseExp;
wire tokenDetect;
wire resultMinus;
wire [7:0] resultSign;

wire [3:0] intDigit8; 
wire [3:0] intDigit7; 
wire [3:0] intDigit6; 
wire [3:0] intDigit5; 
wire [3:0] intDigit4; 
wire [3:0] intDigit3; 
wire [3:0] intDigit2; 
wire [3:0] intDigit1; 
wire [3:0] intDigit0; 
wire [3:0] fractDigit7;   //this is for visibility only, as it is not used at this level
wire [3:0] fractDigit6;
wire [3:0] fractDigit5;
wire [3:0] fractDigit4;
wire [3:0] fractDigit3;
wire [3:0] fractDigit2;
wire [3:0] fractDigit1;
wire [3:0] fractDigit0;

wire input_is_infinite_del;
wire input_is_underflow_del;
wire input_is_nan_del;
wire input_is_snan_del;
wire input_is_qnan_del;
wire input_is_zero_del;

assign input_is_infinite_del = &wrdata_del_5[14:8] && ~|wrdata_del_5[7:0];
assign input_is_underflow_del = ~|wrdata_del_5[14:8] && |wrdata_del_5[7:0];
assign input_is_nan_del = &wrdata_del_5[14:8] && |wrdata_del_5[7:0];
assign input_is_snan_del = input_is_nan_del && ~wrdata_del_5[7];
assign input_is_qnan_del = input_is_nan_del && wrdata_del_5[7];
assign input_is_zero_del = ~|wrdata_del_5[14:0];
                                            
assign finalSel = {input_is_infinite_del,
                   input_is_qnan_del,
                   input_is_snan_del,
                   input_is_underflow_del,
                   input_is_zero_del
                  };
assign resultMinus = wrdata_del_5[15];
assign resultSign = resultMinus ? "-" : "+";
                 
payloadH8 payloadH8(
    .payloadIn (wrdata_del_5[6:0]),
    .payloadStr(payloadStr)
    );                                          

binToDecH8Engine H8Eng(           //5 clocks
    .CLK           (CLK           ),
    .RESET         (RESET         ),
    .RM            (RM            ),
    .wren          (wren          ),
    .wrdata        (wrdata        ),
    .fractionOnly  (fractionOnly  ),
    .intDigit8     (intDigit8   ),
    .intDigit7     (intDigit7   ),
    .intDigit6     (intDigit6   ),
    .intDigit5     (intDigit5   ),
    .intDigit4     (intDigit4   ),
    .intDigit3     (intDigit3   ),
    .intDigit2     (intDigit2   ),
    .intDigit1     (intDigit1   ),
    .intDigit0     (intDigit0   ),
    .fractDigit7   (fractDigit7 ),
    .fractDigit6   (fractDigit6 ),
    .fractDigit5   (fractDigit5 ),
    .fractDigit4   (fractDigit4 ),
    .fractDigit3   (fractDigit3 ),
    .fractDigit2   (fractDigit2 ),
    .fractDigit1   (fractDigit1 ),
    .fractDigit0   (fractDigit0 ),
    .baseExp       (baseExp     )     //decimal exponent out
);

wire isNegative;
assign isNegative = wrdata_del_5[15];
assign tokenDetect = |adjExponent && ~(adjExponent==6'h3F);           
  
wire intDigit8NotZero; 
wire intDigit7NotZero; 
wire intDigit6NotZero; 
wire intDigit5NotZero; 
wire intDigit4NotZero; 
wire intDigit3NotZero; 
wire intDigit2NotZero; 
wire intDigit1NotZero; 
wire intDigit0NotZero; 
//wire fractDigit7NotZero;
wire fractDigit6NotZero;
wire fractDigit5NotZero;
wire fractDigit4NotZero;
wire fractDigit3NotZero;
wire fractDigit2NotZero;
wire fractDigit1NotZero;
wire fractDigit0NotZero;
  
assign intDigit8NotZero   = |intDigit8  ;
assign intDigit7NotZero   = |intDigit7  ;
assign intDigit6NotZero   = |intDigit6  ;
assign intDigit5NotZero   = |intDigit5  ;
assign intDigit4NotZero   = |intDigit4  ;
assign intDigit3NotZero   = |intDigit3  ;
assign intDigit2NotZero   = |intDigit2  ;
assign intDigit1NotZero   = |intDigit1  ;
assign intDigit0NotZero   = |intDigit0  ;
//assign fractDigit7NotZero = |fractDigit7;
assign fractDigit6NotZero = |fractDigit6;
assign fractDigit5NotZero = |fractDigit5;
assign fractDigit4NotZero = |fractDigit4;
assign fractDigit3NotZero = |fractDigit3;
assign fractDigit2NotZero = |fractDigit2;
assign fractDigit1NotZero = |fractDigit1;
assign fractDigit0NotZero = |fractDigit0;
  
wire [15:0] alignSel;
assign alignSel = {intDigit8NotZero  ,  
                   intDigit7NotZero  ,
                   intDigit6NotZero  ,
                   intDigit5NotZero  ,
                   intDigit4NotZero  ,
                   intDigit3NotZero  ,
                   intDigit2NotZero  ,
                   intDigit1NotZero  ,
                   intDigit0NotZero  ,
                   fractDigit6NotZero,
                   fractDigit5NotZero,
                   fractDigit4NotZero,
                   fractDigit3NotZero,
                   fractDigit2NotZero,
                   fractDigit1NotZero,
                   fractDigit0NotZero
                   };


always @(*)
    casex(alignSel)
      16'b1xxxxxxxxxxxxxxx : begin
                                  alignDigits = isNegative ? {4'b0,      intDigit8, intDigit7, intDigit6, intDigit5, intDigit4, intDigit3, intDigit2} :
                                                             {intDigit8, intDigit7, intDigit6, intDigit5, intDigit4, intDigit3, intDigit2, intDigit1};
                                  adjExponent = isNegative ? baseExp + 2: baseExp + 1; 
                             end    
      16'b01xxxxxxxxxxxxxx : begin
                                 alignDigits = isNegative ? {4'b0,      intDigit7, intDigit6, intDigit5, intDigit4, intDigit3, intDigit2, intDigit1} :
                                                            {intDigit7, intDigit6, intDigit5, intDigit4, intDigit3, intDigit2, intDigit1, intDigit0};
                                 adjExponent = isNegative ? baseExp + 1 : baseExp;
                             end    
      16'b001xxxxxxxxxxxxx : begin
                                 alignDigits = isNegative ? {4'b0,      intDigit6, intDigit5, intDigit4, intDigit3, intDigit2, intDigit1, intDigit0} :
                                                            {intDigit6, intDigit5, intDigit4, intDigit3, intDigit2, intDigit1, intDigit0, fractDigit6};
                                 adjExponent = isNegative ? baseExp : baseExp - 1;
                             end    
      16'b0001xxxxxxxxxxxx : begin
                                 alignDigits = isNegative ? {4'b0,      intDigit5, intDigit4, intDigit3, intDigit2, intDigit1, intDigit0,   fractDigit6} :
                                                            {intDigit5, intDigit4, intDigit3, intDigit2, intDigit1, intDigit0, fractDigit6, fractDigit7};
                                 adjExponent = isNegative ? baseExp - 1 : baseExp - 2;
                             end    
      16'b00001xxxxxxxxxxx : begin
                                 alignDigits = isNegative ? {4'b0,      intDigit4, intDigit3, intDigit2, intDigit1, intDigit0,   fractDigit6, fractDigit5} :
                                                            {intDigit4, intDigit3, intDigit2, intDigit1, intDigit0, fractDigit6, fractDigit5, fractDigit4};
                                 adjExponent = isNegative ? baseExp - 2 : baseExp - 3;
                             end    
      16'b000001xxxxxxxxxx : begin
                                 alignDigits = isNegative ? {4'b0,      intDigit3, intDigit2, intDigit1, intDigit0,   fractDigit6, fractDigit5, fractDigit4} :
                                                            {intDigit3, intDigit2, intDigit1, intDigit0, fractDigit6, fractDigit5, fractDigit4, fractDigit3};
                                 adjExponent = isNegative ? baseExp - 3 : baseExp - 4;
                             end    
      16'b0000001xxxxxxxxx : begin
                                 alignDigits = isNegative ? {4'b0,      intDigit2, intDigit1, intDigit0,   fractDigit6, fractDigit5, fractDigit4, fractDigit3} :
                                                            {intDigit2, intDigit1, intDigit0, fractDigit6, fractDigit5, fractDigit4, fractDigit3, fractDigit2};
                                 adjExponent = isNegative ? baseExp - 4 : baseExp - 5;
                             end    
      16'b00000001xxxxxxxx : begin
                                 alignDigits = isNegative ? {4'b0,      intDigit1, intDigit0,   fractDigit6, fractDigit5, fractDigit4, fractDigit3, fractDigit2} :
                                                            {intDigit1, intDigit0, fractDigit6, fractDigit5, fractDigit4, fractDigit3, fractDigit2, fractDigit1};
                                 adjExponent = isNegative ? baseExp - 5 : baseExp - 6;
                             end    
      16'b000000001xxxxxxx : begin
                                 alignDigits = isNegative ? {4'b0,      intDigit0,   fractDigit6, fractDigit5, fractDigit4, fractDigit3, fractDigit2, fractDigit1} :
                                                            {intDigit0, fractDigit6, fractDigit5, fractDigit4, fractDigit3, fractDigit2, fractDigit1, fractDigit0};
                                 adjExponent = isNegative ? baseExp - 6 : baseExp - 7;
                             end 
                                
      16'b0000000001xxxxxx : begin
                                 alignDigits = isNegative ? {4'b0,        fractDigit6, fractDigit5, fractDigit4, fractDigit3, fractDigit2, fractDigit1, fractDigit0} :
                                                            {fractDigit6, fractDigit5, fractDigit4, fractDigit3, fractDigit2, fractDigit1, fractDigit0, 4'b0};
                                 adjExponent = isNegative ? 0-(baseExp + 6) : 0-(baseExp + 7);
                             end
                                 
      16'b00000000001xxxxx : begin
                                 alignDigits = isNegative ? {4'b0,        fractDigit5, fractDigit4, fractDigit3, fractDigit2, fractDigit1, fractDigit0, 4'b0} :
                                                            {fractDigit5, fractDigit4, fractDigit3, fractDigit2, fractDigit1, fractDigit0, 4'b0,        4'b0};
                                 adjExponent = isNegative ? 0-(baseExp + 8) : 0-(baseExp + 9);
                             end    
      16'b000000000001xxxx : begin
                                 alignDigits = isNegative ? {4'b0,        fractDigit4, fractDigit3, fractDigit2, fractDigit1, fractDigit0, 4'b0, 4'b0} :
                                                            {fractDigit4, fractDigit3, fractDigit2, fractDigit1, fractDigit0, 4'b0,        4'b0, 4'b0};
                                 adjExponent = isNegative ? 0-(baseExp + 10) : 0-(baseExp + 11);
                             end    
      16'b0000000000001xxx : begin
                                 alignDigits = isNegative ? {4'b0,        fractDigit3, fractDigit2, fractDigit1, fractDigit0, 4'b0, 4'b0, 4'b0} :
                                                            {fractDigit3, fractDigit2, fractDigit1, fractDigit0, 4'b0,        4'b0, 4'b0, 4'b0};
                                 adjExponent = isNegative ? 0-(baseExp + 12) : 0-(baseExp + 13);
                             end    
      16'b00000000000001xx : begin
                                 alignDigits = isNegative ? {4'b0,        fractDigit2, fractDigit1, fractDigit0, 4'b0, 4'b0, 4'b0, 4'b0} :
                                                            {fractDigit2, fractDigit1, fractDigit0, 4'b0,        4'b0, 4'b0, 4'b0, 4'b0};
                                 adjExponent = isNegative ? 0-(baseExp + 14) : 0-(baseExp + 15);
                             end    
      16'b000000000000001x : begin
                                 alignDigits = isNegative ? {4'b0,        fractDigit1, fractDigit0, 4'b0, 4'b0, 4'b0, 4'b0, 4'b0} :
                                                            {fractDigit1, fractDigit0, 4'b0,        4'b0, 4'b0, 4'b0, 4'b0, 4'b0};
                                 adjExponent = isNegative ? 0-(baseExp + 16) : 0-(baseExp + 17);
                             end    
      16'b0000000000000001 : begin
                                 alignDigits = isNegative ? {4'b0,        fractDigit0, 4'b0, 4'b0, 4'b0, 4'b0, 4'b0, 4'b0} :
                                                            {fractDigit0, 4'b0,        4'b0, 4'b0, 4'b0, 4'b0, 4'b0, 4'b0};
                                 adjExponent = isNegative ? 0-(baseExp + 18) : 0-(baseExp + 19);
                             end 
                   default : begin             
                                  alignDigits = isNegative ? {4'b0,        4'b0, 4'b0, 4'b0, 4'b0, 4'b0, 4'b0, 4'b0} :
                                                             {4'b0,        4'b0, 4'b0, 4'b0, 4'b0, 4'b0, 4'b0, 4'b0};
                                  adjExponent = baseExp;
                             end 
    endcase

assign finalResult = {(isNegative ? "-" : {4'h3, alignDigits[31:28]}), 
                                          {4'h3, alignDigits[27:24]}, 
                                          {4'h3, alignDigits[23:20]}, 
                                          {4'h3, alignDigits[19:16]}, 
                                          {4'h3, alignDigits[15:12]}, 
                                          {4'h3, alignDigits[11: 8]}, 
                                          {4'h3, alignDigits[ 7: 4]}, 
                                          {4'h3, alignDigits[ 3: 0]}}; 
    
always @(posedge CLK) begin
   if (RESET) begin
      wrdata_del_1  <= 0;
      wrdata_del_2  <= 0;
      wrdata_del_3  <= 0;
      wrdata_del_4  <= 0;
      wrdata_del_5  <= 0; 
   end      
   else begin
       wrdata_del_1  <= wrdata;
       wrdata_del_2  <= wrdata_del_1;
       wrdata_del_3  <= wrdata_del_2 ;
       wrdata_del_4  <= wrdata_del_3 ;
       wrdata_del_5  <= wrdata_del_4 ; 
   end
end 

wire [7:0] token;
assign token = adjExponent[5] ?  ((6'h3F - adjExponent[5:0]) + "a" - 1) : ( adjExponent[5:0] + "A" - 1); 
 
always @(posedge CLK)    //6th clock from first write enable at front end
    casex(finalSel)
        5'b1xxxx : ascOut = {{4{" "}}, resultSign, "inf"};
        5'b01xxx : ascOut = {" ", resultSign, "nan ", payloadStr[15:0]};
        5'b001xx : ascOut = {resultSign, "snan ", payloadStr[15:0]};
        5'b0001x : ascOut = resultMinus ? "-.21684v" : ".216840v";   
        5'b00001 : ascOut = {"      ", resultSign, "0"};  
        default : ascOut = {finalResult[63:8], tokenDetect ? token : finalResult[7:0]};  
    endcase

endmodule

                                              
