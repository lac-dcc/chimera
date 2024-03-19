//  decCharToBinHalfSystIntH8.v
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

module decCharToBinHalfSystIntH8 (
    CLK,
    RESET,
    biasedExp,
    Weight,
    PartBin,
    PartMant,
    biasedBinExpOut,
    WeightLTEtotal,  
    WeightS1LTEtotal,
    WeightS2LTEtotal,
    GRS
    );

input CLK;
input RESET;
input [6:0] biasedExp;
input [26:0] Weight;
input [26:0] PartBin;      //q2
output [8:0] PartMant; 
output [6:0] biasedBinExpOut;
input WeightLTEtotal;  
input WeightS1LTEtotal;
input WeightS2LTEtotal;
output [2:0] GRS;


wire [8:0] PartMant;
wire [6:0] biasedBinExpOut;
wire [2:0] GRS;

wire d8;   
wire [27:0] Bin8Test;
wire GTE8;
wire [26:0] Bin7;
assign Bin8Test = PartBin - Weight;
assign GTE8 = ~Bin8Test[27] && WeightLTEtotal; 
assign Bin7 = GTE8 ? Bin8Test[26:0] : PartBin;
assign d8 = GTE8 && |PartBin;   

wire d7;
wire [27:0] Bin7Test;
wire GTE7;
wire [26:0] Bin6;
assign Bin7Test = Bin7 - (Weight >> 1);
assign GTE7 = ~Bin7Test[27] && (WeightLTEtotal || WeightS1LTEtotal); 
assign Bin6 = GTE7 ? Bin7Test[26:0] : Bin7;
assign d7 = GTE7 && |Bin7;

wire d6;
wire [27:0] Bin6Test;
wire GTE6;
wire [26:0] Bin5;
assign Bin6Test = Bin6 - (Weight >> 2);
assign GTE6 = ~Bin6Test[27] && (WeightLTEtotal || WeightS1LTEtotal || WeightS2LTEtotal); 
assign Bin5 = GTE6 ? Bin6Test[26:0] : Bin6;
assign d6 = GTE6 && |Bin6;

reg d8_q3;
reg d7_q3;
reg d6_q3;
reg [26:0] Bin5_q3;
reg [26:0] Weight_q3;
reg [6:0] biasedExp_q3;
always @(posedge CLK)
    if (RESET) begin
        d8_q3       <= 0;
        d7_q3       <= 0;
        d6_q3       <= 0;
        Bin5_q3     <= 0;
        Weight_q3 <= 0;
        biasedExp_q3 <= 0;
    end
    else begin
        d8_q3       <= d8;
        d7_q3       <= d7;
        d6_q3       <= d6;
        Bin5_q3     <= Bin5;
        Weight_q3 <= Weight >> 3;    
        biasedExp_q3 <= biasedExp;
    end
    
wire d5;
wire [27:0] Bin5Test;
wire GTE5;
wire [26:0] Bin4;
assign Bin5Test = Bin5_q3 - (Weight_q3);
assign GTE5 = ~Bin5Test[27]; 
assign Bin4 = GTE5 ? Bin5Test[26:0] : Bin5_q3;
assign d5 = GTE5 && |Bin5_q3;

wire d4;
wire [27:0] Bin4Test;
wire GTE4;
wire [26:0] Bin3;
assign Bin4Test = Bin4 - (Weight_q3 >> 1);
assign GTE4 = ~Bin4Test[27]; 
assign Bin3 = GTE4 ? Bin4Test[26:0] : Bin4;
assign d4 = GTE4 && |Bin4;

wire d3;
wire [27:0] Bin3Test;
wire GTE3;
wire [26:0] Bin2;
assign Bin3Test = Bin3 - (Weight_q3 >> 2);
assign GTE3 = ~Bin3Test[27]; 
assign Bin2 = GTE3 ? Bin3Test[26:0] : Bin3;
assign d3 = GTE3 && |Bin3;

reg d8_q4;
reg d7_q4;
reg d6_q4;
reg d5_q4;
reg d4_q4;
reg d3_q4;
reg [26:0] Bin2_q4;
reg [26:0] Weight_q4;
reg [6:0] biasedExp_q4;
always @(posedge CLK)
    if (RESET) begin
        d8_q4       <= 0;
        d7_q4       <= 0;
        d6_q4       <= 0;
        d5_q4       <= 0;
        d4_q4       <= 0;
        d3_q4       <= 0;
        Bin2_q4  <= 0;
        Weight_q4 <= 0;
        biasedExp_q4 <= 0;
    end
    else begin
        d8_q4       <= d8_q3;
        d7_q4       <= d7_q3;
        d6_q4       <= d6_q3;
        d5_q4       <= d5;
        d4_q4       <= d4;
        d3_q4       <= d3;
        Bin2_q4  <= Bin2;
        Weight_q4 <= Weight_q3 >> 3;    
        biasedExp_q4 <= biasedExp_q3;
    end

wire d2;
wire [27:0] Bin2Test;
wire GTE2;
wire [26:0] Bin1;
assign Bin2Test = Bin2_q4 - (Weight_q4);
assign GTE2 = ~Bin2Test[27]; 
assign Bin1 = GTE2 ? Bin2Test[26:0] : Bin2_q4;
assign d2 = GTE2 && |Bin2_q4;

wire d1;
wire [27:0] Bin1Test;
wire GTE1;
wire [26:0] Bin0;
assign Bin1Test = Bin1 - (Weight_q4 >> 1);
assign GTE1 = ~Bin1Test[27]; 
assign Bin0 = GTE1 ? Bin1Test[26:0] : Bin1;
assign d1 = GTE1 && |Bin1;

wire d0;
wire [27:0] Bin0Test;
wire GTE0;
wire [26:0] BinG;
wire [26:0] testWeight_q4;
assign testWeight_q4 = (Weight_q4 >> 2);
assign Bin0Test = Bin0 - (Weight_q4 >> 2);
assign GTE0 = ~Bin0Test[27]; 
assign BinG = GTE0 ? Bin0Test[26:0] : Bin0;
assign d0 = GTE0 && |Bin0;

wire G;
wire [27:0] BinGTest;
wire GTE_G;
wire [26:0] BinR;
assign BinGTest = BinG - (Weight_q4 >> 3);
assign GTE_G = ~BinGTest[27]; 
assign BinR = GTE_G ? BinGTest[26:0] : BinG;
assign G = GTE_G && |BinG;

wire R;
wire [27:0] BinRTest;
wire GTE_R;
wire [26:0] BinS;
assign BinRTest = BinR - (Weight_q4 >> 4);
assign GTE_R = ~BinRTest[27]; 
assign BinS = GTE_R ? BinRTest[26:0] : BinR;
assign R = GTE_R && |BinR;

wire S;
wire [27:0] BinSTest;
wire GTE_S;
assign BinSTest = BinS - (Weight_q4 >> 5);
assign GTE_S = ~BinSTest[27]; 
assign S = GTE_S && |BinS;

assign PartMant = {d8_q4, d7_q4,  d6_q4,  d5_q4,  d4_q4,  d3_q4,  d2,  d1,  d0};
                      
assign biasedBinExpOut = biasedExp_q4;                      

assign GRS = {G, R, S};

endmodule
