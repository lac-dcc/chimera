//FDIV711.v
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

module FDIV711 (    // 4 clocks
    CLK,
    RESET,
    A,
    GRSinA,
    B,
    GRSinB,
    R,
    GRSout,
    except
    );

input CLK;
input RESET;
input [15:0] A;
input [2:0] GRSinA;
input [15:0] B;
input [2:0] GRSinB;
output [15:0] R;
output [2:0] GRSout;
output [4:0] except;


reg [22:0] divsr;
reg [7:0] BexpWrk;
reg [6:0] biasedExpOut;
reg NaNdet_q0;
reg NaNdet_q1;                                                     
reg NaNdet_q2;                                                     
reg NaNdet_q3;                                                     
reg [6:0] payload_q0;                                              
reg [6:0] payload_q1;                                              
reg [6:0] payload_q2;
reg [6:0] payload_q3;
reg infinite_q0;
reg infinite_q1;
reg infinite_q2;
reg infinite_q3;
reg invalid_q0;
reg invalid_q1;
reg invalid_q2;
reg invalid_q3;
reg divX0_q0;
reg divX0_q1;
reg divX0_q2;
reg divX0_q3;
reg signAB_q0;
reg signAB_q1;
reg signAB_q2;
reg signAB_q3;


wire AisNaN;
wire BisNaN;
assign AisNaN = &A[14:8] && |A[7:0];
assign BisNaN = &B[14:8] && |B[7:0];
wire AisInf;
wire BisInf;
assign AisInf = &A[14:8] && ~|{A[7:0], GRSinA};
assign BisInf = &B[14:8] && ~|{B[7:0], GRSinB};
wire signAB;
assign signAB = (AisNaN || BisNaN) ? (AisNaN ? A[15] : B[15]) : (A[15] ^ B[15]);
wire AisZero;
wire BisZero;
assign AisZero = ~|{A[14:0], GRSinA};
assign BisZero = ~|{B[14:0], GRSinB};
wire [22:0] divdnd;

assign divdnd = {~AisZero, A[7:0], GRSinA, 11'b0};

wire invalidOp;
assign invalidOp = (AisZero && BisZero) || (AisInf && BisInf);   //deliver NaN with payload
wire divX0;
assign divX0 = BisZero && ~AisInf && ~AisZero && ~AisNaN;  //deliver properly signed infinity

wire [7:0] Aexp8;     //convert 7|8 to 8|8  --to deal with subnormals
wire [7:0] Bexp8;
assign Aexp8 = A[14:8]-63+127;
assign Bexp8 = B[14:8]-63+127;
wire [7:0] ABexp8;
assign ABexp8 = (Aexp8 - BexpWrk) + 127;  //subnormals accounted for at this stage
wire [4:0] except;

wire [11:0] Bsel;
assign Bsel = {|B[14:8], B[7:0], GRSinB};  //anticipate possibility of subnormals coming in
always @(*)
    casex(Bsel)
        12'b1xxxxxxxxxxx : begin
                             divsr = {1'b1, B[7:0], GRSinB[2:0], 11'b0};  
                             BexpWrk = Bexp8;
                           end   
        12'b01xxxxxxxxxx : begin
                             divsr = {      B[7:0], GRSinB[2:0], 12'b0};  //subnormals 
                             BexpWrk = 64;                         //    |
                           end                                            //    |
        12'b001xxxxxxxxx : begin                                          //    |
                             divsr = {      B[6:0], GRSinB[2:0], 13'b0};  //    V
                             BexpWrk = 63;
                           end   
        12'b0001xxxxxxxx : begin
                             divsr = {      B[5:0], GRSinB[2:0], 14'b0};  
                             BexpWrk = 62;
                           end   
        12'b00001xxxxxxx : begin
                             divsr = {      B[4:0], GRSinB[2:0], 15'b0};  
                             BexpWrk = 61;
                           end   
        12'b000001xxxxxx : begin
                             divsr = {      B[3:0], GRSinB[2:0], 16'b0};   
                             BexpWrk = 60;
                           end   
        12'b0000001xxxxx : begin
                             divsr = {      B[2:0], GRSinB[2:0], 17'b0};   
                             BexpWrk = 59;
                           end   
        12'b00000001xxxx : begin
                             divsr = {      B[1:0], GRSinB[2:0], 18'b0};   
                             BexpWrk = 58;
                           end   
        12'b000000001xxx : begin
                             divsr = {      B[  0], GRSinB[2:0], 19'b0};   
                             BexpWrk = 57;
                           end   
        12'b0000000001xx : begin
                             divsr = {              GRSinB[2:0], 20'b0};   
                             BexpWrk = 56;
                           end   
        12'b00000000001x : begin
                             divsr = {              GRSinB[1:0], 21'b0};   
                             BexpWrk = 55;
                           end   
        12'b000000000001 : begin
                             divsr = {              GRSinB[  0], 22'b0}; 
                             BexpWrk = 54;
                           end   
                 default : begin
                             divsr = 0;
                             BexpWrk = Bexp8;
                           end   
     endcase

wire d8;   
wire [23:0] Bin8Test;
wire GTE8;
wire [22:0] Bin7;
assign Bin8Test = divdnd - divsr;
assign GTE8 = ~Bin8Test[23]; 
assign Bin7 = GTE8 ? Bin8Test[22:0] : divdnd;
assign d8 = GTE8 && |divdnd;   

wire d7;
wire [23:0] Bin7Test;
wire GTE7;
wire [22:0] Bin6;
assign Bin7Test = Bin7 - (divsr >> 1);
assign GTE7 = ~Bin7Test[23]; 
assign Bin6 = GTE7 ? Bin7Test[22:0] : Bin7;
assign d7 = GTE7 && |Bin7;

wire d6;
wire [23:0] Bin6Test;
wire GTE6;
wire [22:0] Bin5;
assign Bin6Test = Bin6 - (divsr >> 2);
assign GTE6 = ~Bin6Test[23]; 
assign Bin5 = GTE6 ? Bin6Test[22:0] : Bin6;
assign d6 = GTE6 && |Bin6;

reg d8_q0;
reg d7_q0;
reg d6_q0;
reg [22:0] Bin5_q0;
reg [22:0] divsr_q0;
reg [7:0] biasedExp_q0;
always @(posedge CLK)
    if (RESET) begin
        d8_q0        <= 0;
        d7_q0        <= 0;
        d6_q0        <= 0;
        Bin5_q0      <= 0;
        divsr_q0    <= 0;
        biasedExp_q0 <= 0;
    end
    else begin
        d8_q0        <= d8;
        d7_q0        <= d7;
        d6_q0        <= d6;
        Bin5_q0      <= Bin5;
        divsr_q0     <= divsr >> 3;    
        biasedExp_q0 <= ABexp8;
        NaNdet_q0    <= AisNaN || BisNaN;
        payload_q0   <= (AisNaN || BisNaN) ? (AisNaN ? A[6:0] : B[6:0]) : 0;
        infinite_q0  <= AisInf || BisInf;
        invalid_q0   <= invalidOp;
        divX0_q0     <= divX0;
        signAB_q0    <= signAB;
    end

wire d5;
wire [23:0] Bin5Test;
wire GTE5;
wire [22:0] Bin4;
assign Bin5Test = Bin5_q0 - divsr_q0;
assign GTE5 = ~Bin5Test[23]; 
assign Bin4 = GTE5 ? Bin5Test[22:0] : Bin5_q0;
assign d5 = GTE5 && |Bin5_q0;

wire d4;
wire [23:0] Bin4Test;
wire GTE4;
wire [22:0] Bin3;
assign Bin4Test = Bin4 - (divsr_q0 >> 1);
assign GTE4 = ~Bin4Test[23]; 
assign Bin3 = GTE4 ? Bin4Test[22:0] : Bin4;
assign d4 = GTE4 && |Bin4;

wire d3;
wire [23:0] Bin3Test;
wire GTE3;
wire [22:0] Bin2;
assign Bin3Test = Bin3 - (divsr_q0 >> 2);
assign GTE3 = ~Bin3Test[23]; 
assign Bin2 = GTE3 ? Bin3Test[22:0] : Bin3;
assign d3 = GTE3 && |Bin3;

reg d8_q1;
reg d7_q1;
reg d6_q1;
reg d5_q1;
reg d4_q1;
reg d3_q1;
reg [22:0] Bin2_q1;
reg [22:0] divsr_q1;
reg [7:0] biasedExp_q1;
always @(posedge CLK)
    if (RESET) begin
        d8_q1       <= 0;
        d7_q1       <= 0;
        d6_q1       <= 0;
        d5_q1       <= 0;
        d4_q1       <= 0;
        d3_q1       <= 0;
        Bin2_q1     <= 0;
        divsr_q1   <= 0;
        biasedExp_q1 <= 0;
    end
    else begin
        d8_q1       <= d8_q0;
        d7_q1       <= d7_q0;
        d6_q1       <= d6_q0;
        d5_q1       <= d5;
        d4_q1       <= d4;
        d3_q1       <= d3;
        Bin2_q1     <= Bin2;
        divsr_q1   <= divsr_q0 >> 3;    
        biasedExp_q1 <= biasedExp_q0;
        NaNdet_q1   <=  NaNdet_q0;  
        payload_q1  <=  payload_q0; 
        infinite_q1 <=  infinite_q0;
        invalid_q1  <=  invalid_q0; 
        divX0_q1    <=  divX0_q0;
        signAB_q1   <=  signAB_q0;   
    end

wire d2;
wire [23:0] Bin2Test;
wire GTE2;
wire [22:0] Bin1;
assign Bin2Test = Bin2_q1 - divsr_q1;
assign GTE2 = ~Bin2Test[23]; 
assign Bin1 = GTE2 ? Bin2Test[22:0] : Bin2_q1;
assign d2 = GTE2 && |Bin2_q1;
                       
wire d1;
wire [23:0] Bin1Test;
wire GTE1;
wire [22:0] Bin0;
assign Bin1Test = Bin1 - (divsr_q1 >> 1);
assign GTE1 = ~Bin1Test[23]; 
assign Bin0 = GTE1 ? Bin1Test[22:0] : Bin1;
assign d1 = GTE1 && |Bin1;

wire d0;
wire [23:0] Bin0Test;
wire GTE0;
wire [22:0] BinG;
assign Bin0Test = Bin0 - (divsr_q1 >> 2);
assign GTE0 = ~Bin0Test[23]; 
assign BinG = GTE0 ? Bin0Test[22:0] : Bin0;
assign d0 = GTE0 && |Bin0;

wire G;
wire [23:0] BinGTest;
wire GTE_G;
wire [22:0] BinR;
assign BinGTest = BinG - (divsr_q1 >> 3);
assign GTE_G = ~BinGTest[23]; 
assign BinR = GTE_G ? BinGTest[22:0] : BinG;
assign G = GTE_G && |BinG;

reg d8_q2;
reg d7_q2;
reg d6_q2;
reg d5_q2;
reg d4_q2;
reg d3_q2;
reg d2_q2;
reg d1_q2;
reg d0_q2;
reg G_q2;
reg [22:0] BinR_q2;
reg [22:0] divsr_q2;
reg [7:0] biasedExp_q2;
always @(posedge CLK)
    if (RESET) begin
        d8_q2       <= 0;
        d7_q2       <= 0;
        d6_q2       <= 0;
        d5_q2       <= 0;
        d4_q2       <= 0;
        d3_q2       <= 0;
        d2_q2       <= 0;
        d1_q2       <= 0;
        d0_q2       <= 0;
        G_q2        <= 0;
        BinR_q2     <= 0;
        divsr_q2    <= 0;
        biasedExp_q2 <= 0;
    end
    else begin
        d8_q2       <= d8_q1;
        d7_q2       <= d7_q1;
        d6_q2       <= d6_q1;
        d5_q2       <= d5_q1;
        d4_q2       <= d4_q1;
        d3_q2       <= d3_q1;
        d2_q2       <= d2;
        d1_q2       <= d1;
        d0_q2       <= d0;
        G_q2        <= G;
        BinR_q2     <= BinR;
        divsr_q2    <= divsr_q1 >> 4;    
        biasedExp_q2 <= biasedExp_q1;
        NaNdet_q2   <= NaNdet_q1;   
        payload_q2  <= payload_q1;  
        infinite_q2 <= infinite_q1; 
        invalid_q2  <= invalid_q1;  
        divX0_q2    <= divX0_q1;
        signAB_q2   <= signAB_q1;    
    end

wire Ro;
wire [23:0] BinRTest;
wire GTE_R;
wire [22:0] BinS;
assign BinRTest = BinR_q2 - divsr_q2;
assign GTE_R = ~BinRTest[23]; 
assign BinS = GTE_R ? BinRTest[22:0] : BinR;
assign Ro = GTE_R && |BinR;

wire S;
wire [23:0] BinSTest;
wire GTE_S;
wire [22:0] Rem;
wire BinSnotZero;
assign BinSTest = BinS - (divsr_q2 >> 1);
assign GTE_S = ~BinSTest[23]; 
assign Rem = GTE_R ? BinRTest[22:0] : BinR;
assign BinSnotZero = |BinS;
assign S = (GTE_S && BinSnotZero) || |Rem;

//normalize
reg [7:0] mantis_q3;
reg [2:0] GRSout_q3;
reg inexact_q3;
reg [7:0] biasedExp_q3;
wire [8:0] normSel;
assign normSel = {d8_q2, d7_q2, d6_q2, d5_q2, d4_q2, d3_q2, d2_q2, d1_q2, d0_q2};

always @(posedge CLK) begin    //this is for a 8|8 normalized interm result
    NaNdet_q3   <= NaNdet_q2;  
    payload_q3  <= payload_q2;
    infinite_q3 <= infinite_q2;
    invalid_q3  <= invalid_q2; 
    divX0_q3    <= divX0_q2;
    signAB_q3   <= signAB_q2;   

    casex(normSel)
        9'b1xxxxxxxx : begin
                         mantis_q3 <= {d7_q2, d6_q2, d5_q2, d4_q2, d3_q2, d2_q2, d1_q2, d0_q2};
                         GRSout_q3 <= {G_q2, Ro, S};
                         biasedExp_q3 <= biasedExp_q2;   
                         inexact_q3 <= |{G_q2, Ro, S};
                       end   
        9'b01xxxxxxx : begin
                         mantis_q3 <= {d6_q2, d5_q2, d4_q2, d3_q2, d2_q2, d1_q2, d0_q2, G_q2};
                         GRSout_q3 <= {Ro, (GTE_S && BinSnotZero), |Rem};
                         biasedExp_q3 <= biasedExp_q2 - 1;
                         inexact_q3 <= |{Ro, (GTE_S && BinSnotZero), |Rem};
                       end   
        9'b001xxxxxx : begin
                         mantis_q3 <= {d5_q2, d4_q2, d3_q2, d2_q2, d1_q2, d0_q2, G_q2, Ro};
                         GRSout_q3 <= {(GTE_S && BinSnotZero), |Rem[22], Rem[21:0]};
                         biasedExp_q3 <= biasedExp_q2 - 2;
                         inexact_q3 <= |{S, Rem};
                       end   
        9'b0001xxxxx : begin
                         mantis_q3 <= {d4_q2, d3_q2, d2_q2, d1_q2, d0_q2, G_q2, Ro, (GTE_S && BinSnotZero)};
                         GRSout_q3 <= {Rem[22:21], |Rem[20:0]};
                         biasedExp_q3 <= biasedExp_q2 - 3;
                         inexact_q3 <= |Rem;
                       end   
        9'b00001xxxx : begin
                         mantis_q3 <= {d3_q2, d2_q2, d1_q2, d0_q2, G_q2, Ro, (GTE_S && BinSnotZero), Rem[22]};
                         GRSout_q3 <= {Rem[21:20], |Rem[19:0]};
                         biasedExp_q3 <= biasedExp_q2 - 4;
                         inexact_q3 <= |Rem[21:0];
                       end   
        9'b000001xxx : begin
                         mantis_q3 <= {d2_q2, d1_q2, d0_q2, G_q2, Ro, (GTE_S && BinSnotZero), Rem[22:21]};
                         GRSout_q3 <= {Rem[20:19], |Rem[18:0]};
                         biasedExp_q3 <= biasedExp_q2 - 5;
                         inexact_q3 <= |Rem[20:0];
                       end   
        9'b0000001xx : begin
                         mantis_q3 <= {d1_q2, d0_q2, G_q2, Ro, (GTE_S && BinSnotZero), Rem[22:20]};
                         GRSout_q3 <= {Rem[19:18], |Rem[17:0]};
                         biasedExp_q3 <= biasedExp_q2 - 6;
                         inexact_q3 <= |Rem[19:0];
                       end   
        9'b00000001x : begin
                         mantis_q3 <= {d0_q2, G_q2, Ro, (GTE_S && BinSnotZero), Rem[22:19]};
                         GRSout_q3 <= {Rem[18:17], |Rem[16:0]};
                         biasedExp_q3 <= biasedExp_q2 - 7;
                         inexact_q3 <= |Rem[18:0];
                       end   
        9'b000000001 : begin
                         mantis_q3 <= {G_q2, Ro, (GTE_S && BinSnotZero), Rem[22:18]};
                         GRSout_q3 <= {Rem[17:16], |Rem[15:0]};
                         biasedExp_q3 <= biasedExp_q2 - 8;
                         inexact_q3 <= |Rem[17:0];
                       end   
             default : begin
                         mantis_q3 <= 9'b0;
                         GRSout_q3 <= 3'b0;                         
                         biasedExp_q3 <= 8'b0;
                         inexact_q3 <= 1'b0;
                       end  
    endcase                     
end

//if result subnormal, denormalize it
reg [7:0] mantis;
reg [2:0] GRS;
reg [6:0] Exp;
reg bitBucket;
wire inexact;
assign inexact = inexact_q3 && ~infinite_q3 && ~NaNdet_q3;
wire underflow;
assign underflow = ((biasedExp_q3 < 65) && inexact) && ~infinite_q3 && ~NaNdet_q3;
wire overflow;
assign overflow = &biasedExp_q3 && ~NaNdet_q3 && ~infinite_q3 && ~invalid_q3 && ~divX0_q3;
wire invalid;
assign invalid = invalid_q3;


assign except = {divX0_q3, invalid, overflow, underflow, inexact || overflow}; 

always @(*) 
    if (biasedExp_q3 > 64) begin
        Exp[6:0] = biasedExp_q3 - 64;
        bitBucket = 0;
        mantis[7:0] = mantis_q3[7:0];
        GRS[2:0] = GRSout_q3[2:0];
    end
    else    
        case(biasedExp_q3)
            8'd64 : {Exp[6:0], bitBucket, mantis[7:0], GRS[2:0]} = {7'b0, ({1'b1, mantis_q3, GRSout_q3} >>  1)};  
            8'd63 : {Exp[6:0], bitBucket, mantis[7:0], GRS[2:0]} = {7'b0, ({1'b1, mantis_q3, GRSout_q3} >>  2)};  
            8'd62 : {Exp[6:0], bitBucket, mantis[7:0], GRS[2:0]} = {7'b0, ({1'b1, mantis_q3, GRSout_q3} >>  3)};  
            8'd61 : {Exp[6:0], bitBucket, mantis[7:0], GRS[2:0]} = {7'b0, ({1'b1, mantis_q3, GRSout_q3} >>  4)};  
            8'd60 : {Exp[6:0], bitBucket, mantis[7:0], GRS[2:0]} = {7'b0, ({1'b1, mantis_q3, GRSout_q3} >>  5)};  
            8'd59 : {Exp[6:0], bitBucket, mantis[7:0], GRS[2:0]} = {7'b0, ({1'b1, mantis_q3, GRSout_q3} >>  6)};  
            8'd58 : {Exp[6:0], bitBucket, mantis[7:0], GRS[2:0]} = {7'b0, ({1'b1, mantis_q3, GRSout_q3} >>  7)};  
            8'd57 : {Exp[6:0], bitBucket, mantis[7:0], GRS[2:0]} = {7'b0, ({1'b1, mantis_q3, GRSout_q3} >>  8)};  
            8'd56 : {Exp[6:0], bitBucket, mantis[7:0], GRS[2:0]} = {7'b0, ({1'b1, mantis_q3, GRSout_q3} >>  9)};  
            8'd55 : {Exp[6:0], bitBucket, mantis[7:0], GRS[2:0]} = {7'b0, ({1'b1, mantis_q3, GRSout_q3} >> 10)};  
            8'd54 : {Exp[6:0], bitBucket, mantis[7:0], GRS[2:0]} = {7'b0, ({1'b1, mantis_q3, GRSout_q3} >> 11)};  
          default : {Exp[6:0], bitBucket, mantis[7:0], GRS[2:0]} = 0;
        endcase
     

wire [2:0] Rsel;
assign Rsel = {NaNdet_q3, invalid_q3, divX0_q3 || overflow || infinite_q3}; 
reg [15:0] R;
reg [2:0] GRSout;
always @(*)
    casex(Rsel)
        3'b1xx : {R, GRSout} = {signAB_q3, 7'h7F, 1'b1, payload_q3, 3'b0};  //quiet NaN
        3'b01x : {R, GRSout} = {signAB_q3, 7'h7F, 1'b1, 7'h0D, 3'b0};  //quiet NaN with payload 0D
        3'b001 : {R, GRSout} = {signAB_q3, 7'h7F, 8'h00, 3'b0};  //inf
        default : {R, GRSout} = {signAB_q3, Exp[6:0], mantis[7:0], GRS[2:0]};
    endcase    
    
        
endmodule
