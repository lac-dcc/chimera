//FADD711.v
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

module FADD711 (
    CLK,
    A,
    GRSinA,
    B,
    GRSinB,
    R,
    GRSout,
    except
    );

input CLK;
input [15:0] A;
input [2:0] GRSinA;
input [15:0] B;
input [2:0] GRSinB;
output [15:0] R;
output [2:0] GRSout;
output [4:0] except;

reg sign;

reg [7:0] expAB;       
reg [15:0] normAfract;  //includes hidden bit
reg [15:0] normBfract;
reg [7:0] EXP;
reg [7:0] normSum;     
reg [2:0] GRSout;
reg [2:0] GRS;
reg intrmSign;
reg [16:0] intrmSum;    //extra bit allows for carry

reg [15:0] R;
wire [6:0] expA;
wire [6:0] expB;
wire signA;
wire signB;
wire AisZero;
wire BisZero;
wire AisSubnorm;
wire BisSubnorm;

assign AisZero = ~|A[14:0];
assign BisZero = ~|B[14:0];
assign AisSubnorm = ~|A[14:8];
assign BisSubnorm = ~|B[14:8];
assign expA = AisZero || AisSubnorm ? 0 : A[14:8];
assign expB = BisZero || BisSubnorm ? 0 : B[14:8];
assign signA = A[15];
assign signB = B[15];

//new stuff
wire [4:0] except;
reg [2:0] Rsel;
reg [15:0] theNaN_del;
wire AisInf;
wire BisInf;
wire AisNaN;
wire BisNaN;
wire [15:0] theNaN;
wire anInputIsNaN;
wire anInputIsInf;

reg invalid;
wire divX0;
wire overflow;
wire underflow;
wire inexact;
wire inputIsInvalid;

assign AisInf = &A[14:8] && ~|{A[7:0], GRSinA[2:0]};
assign BisInf = &B[14:8] && ~|{B[7:0], GRSinB[2:0]};
assign AisNaN = &A[14:8] &&  |{A[6:0], GRSinA[2:0]};
assign BisNaN = &B[14:8] &&  |{B[6:0], GRSinB[2:0]};
assign theNaN = AisNaN ? A : B;
assign anInputIsNaN = AisNaN || BisNaN;
assign anInputIsInf = AisInf || BisInf;

assign inputIsInvalid = AisInf && BisInf && (A[15] ^ B[15]);
assign divX0 = 0;
assign underflow = ~|EXP;
assign overflow = &EXP;
assign inexact = |GRS;
assign except = {divX0, invalid, overflow, underflow && inexact, inexact};
  

always @(*)
    if (expA >= expB) begin
        expAB =  expA;
        normAfract = {~(AisZero || AisSubnorm), A[7:0], GRSinA, 4'b0000};    
        normBfract = {~(BisZero || BisSubnorm), B[7:0], GRSinB, 4'b0000} >> (expA - expB);
    end
    else begin
        expAB = expB;
        normAfract = {~(AisZero || AisSubnorm), A[7:0], GRSinA, 4'b0000} >> (expB - expA);    
        normBfract = {~(BisZero || BisSubnorm), B[7:0], GRSinB, 4'b0000};
    end 

always @(*)
    if (signA==signB) begin                  //for values of A and B with the same sign
        intrmSum = normAfract + normBfract;  //signs are the same so just add
        intrmSign = signA;
    end    
    else if (normAfract > normBfract) begin  //for values with different signs when A > B
        intrmSum = normAfract - normBfract;
        intrmSign = signA;
    end
    else if (normAfract==normBfract) begin   // equal values with different signs   
        intrmSum = 0;
        intrmSign = 0;
    end
    else begin                               // for B > A  and different signs
        intrmSum = normBfract - normAfract;
        intrmSign = signB;
    end

always @(posedge CLK) begin
    invalid <= inputIsInvalid;
    theNaN_del <= theNaN;
    Rsel <= {inputIsInvalid, anInputIsNaN, anInputIsInf || (intrmSum[16] ? &(expAB + 1) : &expAB)};

    sign <= intrmSign;
    if (intrmSum[16]) {EXP, normSum, GRS} <= {expAB+1, intrmSum[15:8], intrmSum[7:6], |intrmSum[5:0]};
    else if (intrmSum[15]) {EXP, normSum, GRS} <= {  expAB, intrmSum[14:7], intrmSum[6:5], |intrmSum[4:0]};
    else if (intrmSum[14]) {EXP, normSum, GRS} <= {  expAB-1,  intrmSum[13:6], intrmSum[5:4], |intrmSum[3:0]};
    else if (intrmSum[13]) {EXP, normSum, GRS} <= {  expAB-2,  intrmSum[12:5], intrmSum[4:3], |intrmSum[2:0]};
    else if (intrmSum[12]) {EXP, normSum, GRS} <= {  expAB-3,  intrmSum[11:4], intrmSum[3:2], |intrmSum[1:0]};
    else if (intrmSum[11]) {EXP, normSum, GRS} <= {  expAB-4,  intrmSum[10:3], intrmSum[2:1], intrmSum[0]};
    else if (intrmSum[10]) {EXP, normSum, GRS} <= {  expAB-5,  intrmSum[ 9:2], intrmSum[1:0], 1'b0};
    else if (intrmSum[ 9]) {EXP, normSum, GRS} <= {  expAB-6,  intrmSum[ 8:1], intrmSum[0], 2'b00};
    else if (intrmSum[ 8]) {EXP, normSum, GRS} <= {  expAB-7,  intrmSum[ 7:0],  3'b000};
    else if (intrmSum[ 7]) {EXP, normSum, GRS} <= {  expAB-8,  intrmSum[ 6:0],  4'b0000};
    else if (intrmSum[ 6]) {EXP, normSum, GRS} <= {  expAB-9,  intrmSum[ 5:0],  5'b00000};
    else if (intrmSum[ 5]) {EXP, normSum, GRS} <= {  expAB-10, intrmSum[ 4:0],  6'b000000};
    else if (intrmSum[ 4]) {EXP, normSum, GRS} <= {  expAB-11, intrmSum[ 3:0],  7'b0000000};
    else if (intrmSum[ 3]) {EXP, normSum, GRS} <= {  expAB-12, intrmSum[ 2:0],  8'b00000000};
    else if (intrmSum[ 2]) {EXP, normSum, GRS} <= {  expAB-13, intrmSum[ 1:0],  9'b000000000};
    else if (intrmSum[ 1]) {EXP, normSum, GRS} <= {  expAB-14, intrmSum[   0],  10'b0000000000};
    else if (intrmSum[ 0]) {EXP, normSum, GRS} <= {  expAB-15,                  11'b00000000000};
    else  {EXP, normSum, GRS} <= 0;   
end
 
always @(*)
    casex(Rsel)
        3'b1xx : {R, GRSout} = {sign, 7'h7F, 1'b1, 7'h1A, GRS};   // invalid input
        3'b01x : {R, GRSout} = {theNaN_del, GRS};                 // an input is NaN
        3'b001 : {R, GRSout} = {sign, 15'h7F00, GRS};             // infinite or overflow
       default : {R, GRSout} = overflow ? {sign, 16'h7F00, 3'b000} : {sign, EXP[6:0], normSum[7:0], GRS};
    endcase    
   
endmodule                                                                                              
                                                   
                                                   
                                                   
                                                   
                                                   
                                                   
                                                   
                                                   
                                                   
                                                   
                                                   
                                                   
                                                   
                                                   
                                                   
                                                   
                                                   
                            
