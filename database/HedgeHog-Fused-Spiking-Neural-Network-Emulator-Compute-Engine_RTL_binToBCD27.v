// binToBCD27.v
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

module binToBCD27 (
    RESET,
    CLK,
    binIn,
    decDigit8,
    decDigit7,
    decDigit6,
    decDigit5,
    decDigit4,
    decDigit3,
    decDigit2,
    decDigit1,
    decDigit0
    );
    
input RESET, CLK;
input [26:0] binIn;
output [3:0] decDigit8;
output [3:0] decDigit7;
output [3:0] decDigit6;
output [3:0] decDigit5;
output [3:0] decDigit4;
output [3:0] decDigit3;
output [3:0] decDigit2;
output [3:0] decDigit1;
output [3:0] decDigit0;

reg [29:0] shftadd8xq;
reg [32:0] shftadd17xq;
reg [35:0] shftadd23xq;

reg [3:0] decDigit8;
reg [3:0] decDigit7;
reg [3:0] decDigit6;
reg [3:0] decDigit5;
reg [3:0] decDigit4;
reg [3:0] decDigit3;
reg [3:0] decDigit2;
reg [3:0] decDigit1;
reg [3:0] decDigit0;

wire [3:0] shftadd0_out;
wire [3:0] shftadd1_out;
wire [3:0] shftadd2_out;


wire [3:0] shftadd31_out;
wire [3:0] shftadd30_out;

wire [3:0] shftadd41_out;
wire [3:0] shftadd40_out;

wire [3:0] shftadd51_out;
wire [3:0] shftadd50_out;

wire [3:0] shftadd62_out;
wire [3:0] shftadd61_out;
wire [3:0] shftadd60_out;

wire [3:0] shftadd72_out;
wire [3:0] shftadd71_out;
wire [3:0] shftadd70_out;

wire [3:0] shftadd82_out;
wire [3:0] shftadd81_out;
wire [3:0] shftadd80_out;

wire [3:0] shftadd93_out;
wire [3:0] shftadd92_out;
wire [3:0] shftadd91_out;
wire [3:0] shftadd90_out;

wire [3:0] shftadd103_out;
wire [3:0] shftadd102_out;
wire [3:0] shftadd101_out;
wire [3:0] shftadd100_out;

wire [3:0] shftadd113_out;
wire [3:0] shftadd112_out;
wire [3:0] shftadd111_out;
wire [3:0] shftadd110_out;

wire [3:0] shftadd124_out;
wire [3:0] shftadd123_out;
wire [3:0] shftadd122_out;
wire [3:0] shftadd121_out;
wire [3:0] shftadd120_out;

wire [3:0] shftadd134_out;
wire [3:0] shftadd133_out;
wire [3:0] shftadd132_out;
wire [3:0] shftadd131_out;
wire [3:0] shftadd130_out;

wire [3:0] shftadd144_out;
wire [3:0] shftadd143_out;
wire [3:0] shftadd142_out;
wire [3:0] shftadd141_out;
wire [3:0] shftadd140_out;

wire [3:0] shftadd155_out;
wire [3:0] shftadd154_out;
wire [3:0] shftadd153_out;
wire [3:0] shftadd152_out;
wire [3:0] shftadd151_out;
wire [3:0] shftadd150_out;

wire [3:0] shftadd165_out;
wire [3:0] shftadd164_out;
wire [3:0] shftadd163_out;
wire [3:0] shftadd162_out;
wire [3:0] shftadd161_out;
wire [3:0] shftadd160_out;

wire [3:0] shftadd175_out;
wire [3:0] shftadd174_out;
wire [3:0] shftadd173_out;
wire [3:0] shftadd172_out;
wire [3:0] shftadd171_out;
wire [3:0] shftadd170_out;

wire [3:0] shftadd186_out;
wire [3:0] shftadd185_out;
wire [3:0] shftadd184_out;
wire [3:0] shftadd183_out;
wire [3:0] shftadd182_out;
wire [3:0] shftadd181_out;
wire [3:0] shftadd180_out;

wire [3:0] shftadd196_out;
wire [3:0] shftadd195_out;
wire [3:0] shftadd194_out;
wire [3:0] shftadd193_out;
wire [3:0] shftadd192_out;
wire [3:0] shftadd191_out;
wire [3:0] shftadd190_out;

wire [3:0] shftadd206_out;
wire [3:0] shftadd205_out;
wire [3:0] shftadd204_out;
wire [3:0] shftadd203_out;
wire [3:0] shftadd202_out;
wire [3:0] shftadd201_out;
wire [3:0] shftadd200_out;

wire [3:0] shftadd217_out;
wire [3:0] shftadd216_out;
wire [3:0] shftadd215_out;
wire [3:0] shftadd214_out;
wire [3:0] shftadd213_out;
wire [3:0] shftadd212_out;
wire [3:0] shftadd211_out;
wire [3:0] shftadd210_out;

wire [3:0] shftadd227_out;
wire [3:0] shftadd226_out;
wire [3:0] shftadd225_out;
wire [3:0] shftadd224_out;
wire [3:0] shftadd223_out;
wire [3:0] shftadd222_out;
wire [3:0] shftadd221_out;
wire [3:0] shftadd220_out;

wire [3:0] shftadd237_out;
wire [3:0] shftadd236_out;
wire [3:0] shftadd235_out;
wire [3:0] shftadd234_out;
wire [3:0] shftadd233_out;
wire [3:0] shftadd232_out;
wire [3:0] shftadd231_out;
wire [3:0] shftadd230_out;


bindec3 shftadd0(.bin_in ({1'b0, binIn[26:24]}), .dec_out(shftadd0_out));

bindec3 shftadd1(.bin_in ({shftadd0_out[2:0], binIn[23]}), .dec_out(shftadd1_out));
    
bindec3 shftadd2(.bin_in ({shftadd1_out[2:0], binIn[22]}), .dec_out(shftadd2_out));

bindec3 shftadd31(.bin_in ({1'b0, shftadd0_out[3], shftadd1_out[3], shftadd2_out[3]}), .dec_out(shftadd31_out));
bindec3 shftadd30(.bin_in ({shftadd2_out[2:0], binIn[21]}), .dec_out(shftadd30_out));

bindec3 shftadd41(.bin_in ({shftadd31_out[2:0], shftadd30_out[3]}), .dec_out(shftadd41_out));
bindec3 shftadd40(.bin_in ({shftadd30_out[2:0], binIn[20]}), .dec_out(shftadd40_out));

bindec3 shftadd51(.bin_in ({shftadd41_out[2:0], shftadd40_out[3]}), .dec_out(shftadd51_out));
bindec3 shftadd50(.bin_in ({shftadd40_out[2:0], binIn[19]}), .dec_out(shftadd50_out));


bindec3 shftadd62(.bin_in ({1'b0, shftadd31_out[3], shftadd41_out[3], shftadd51_out[3]}), .dec_out(shftadd62_out));
bindec3 shftadd61(.bin_in ({shftadd51_out[2:0], shftadd50_out[3]}), .dec_out(shftadd61_out));
bindec3 shftadd60(.bin_in ({shftadd50_out[2:0], binIn[18]}), .dec_out(shftadd60_out));

bindec3 shftadd72(.bin_in ({shftadd62_out[2:0], shftadd61_out[3]}), .dec_out(shftadd72_out));
bindec3 shftadd71(.bin_in ({shftadd61_out[2:0], shftadd60_out[3]}), .dec_out(shftadd71_out));
bindec3 shftadd70(.bin_in ({shftadd60_out[2:0], binIn[17]}), .dec_out(shftadd70_out));

bindec3 shftadd82(.bin_in ({shftadd72_out[2:0], shftadd71_out[3]}), .dec_out(shftadd82_out));
bindec3 shftadd81(.bin_in ({shftadd71_out[2:0], shftadd70_out[3]}), .dec_out(shftadd81_out));
bindec3 shftadd80(.bin_in ({shftadd70_out[2:0], binIn[16]}  ), .dec_out(shftadd80_out));

//------------------------------------------- register here ----------------------------------

bindec3 shftadd93(.bin_in ({1'b0, shftadd8xq[29:27]}), .dec_out(shftadd93_out));
bindec3 shftadd92(.bin_in (shftadd8xq[26:23]), .dec_out(shftadd92_out));
bindec3 shftadd91(.bin_in (shftadd8xq[22:19]), .dec_out(shftadd91_out));
bindec3 shftadd90(.bin_in (shftadd8xq[18:15]), .dec_out(shftadd90_out));

bindec3 shftadd103(.bin_in ({shftadd93_out[2:0], shftadd92_out[3]}), .dec_out(shftadd103_out));
bindec3 shftadd102(.bin_in ({shftadd92_out[2:0], shftadd91_out[3]}), .dec_out(shftadd102_out));
bindec3 shftadd101(.bin_in ({shftadd91_out[2:0], shftadd90_out[3]}  ), .dec_out(shftadd101_out));
bindec3 shftadd100(.bin_in ({shftadd90_out[2:0], shftadd8xq[14]}), .dec_out(shftadd100_out));

bindec3 shftadd113(.bin_in ({shftadd103_out[2:0], shftadd102_out[3]}), .dec_out(shftadd113_out));
bindec3 shftadd112(.bin_in ({shftadd102_out[2:0], shftadd101_out[3]}), .dec_out(shftadd112_out));
bindec3 shftadd111(.bin_in ({shftadd101_out[2:0], shftadd100_out[3]}  ), .dec_out(shftadd111_out));
bindec3 shftadd110(.bin_in ({shftadd100_out[2:0], shftadd8xq[13]}), .dec_out(shftadd110_out));

bindec3 shftadd124(.bin_in ({1'b0, shftadd93_out[3], shftadd103_out[3], shftadd113_out[3]}), .dec_out(shftadd124_out));
bindec3 shftadd123(.bin_in ({shftadd113_out[2:0], shftadd112_out[3]}), .dec_out(shftadd123_out));
bindec3 shftadd122(.bin_in ({shftadd112_out[2:0], shftadd111_out[3]}), .dec_out(shftadd122_out));
bindec3 shftadd121(.bin_in ({shftadd111_out[2:0], shftadd110_out[3]}), .dec_out(shftadd121_out));
bindec3 shftadd120(.bin_in ({shftadd110_out[2:0], shftadd8xq[12]}), .dec_out(shftadd120_out));

bindec3 shftadd134(.bin_in ({shftadd124_out[2:0], shftadd123_out[3]}), .dec_out(shftadd134_out));
bindec3 shftadd133(.bin_in ({shftadd123_out[2:0], shftadd122_out[3]}), .dec_out(shftadd133_out));
bindec3 shftadd132(.bin_in ({shftadd122_out[2:0], shftadd121_out[3]}), .dec_out(shftadd132_out));
bindec3 shftadd131(.bin_in ({shftadd121_out[2:0], shftadd120_out[3]}), .dec_out(shftadd131_out));
bindec3 shftadd130(.bin_in ({shftadd120_out[2:0], shftadd8xq[11]}), .dec_out(shftadd130_out));

bindec3 shftadd144(.bin_in ({shftadd134_out[2:0], shftadd133_out[3]}), .dec_out(shftadd144_out));
bindec3 shftadd143(.bin_in ({shftadd133_out[2:0], shftadd132_out[3]}), .dec_out(shftadd143_out));
bindec3 shftadd142(.bin_in ({shftadd132_out[2:0], shftadd131_out[3]}), .dec_out(shftadd142_out));
bindec3 shftadd141(.bin_in ({shftadd131_out[2:0], shftadd130_out[3]}), .dec_out(shftadd141_out));
bindec3 shftadd140(.bin_in ({shftadd130_out[2:0], shftadd8xq[10]}), .dec_out(shftadd140_out));

bindec3 shftadd155(.bin_in ({1'b0, shftadd124_out[3], shftadd134_out[3], shftadd144_out[3]}), .dec_out(shftadd155_out));
bindec3 shftadd154(.bin_in ({shftadd144_out[2:0], shftadd143_out[3]}), .dec_out(shftadd154_out));
bindec3 shftadd153(.bin_in ({shftadd143_out[2:0], shftadd142_out[3]}), .dec_out(shftadd153_out));
bindec3 shftadd152(.bin_in ({shftadd142_out[2:0], shftadd141_out[3]}), .dec_out(shftadd152_out));
bindec3 shftadd151(.bin_in ({shftadd141_out[2:0], shftadd140_out[3]}), .dec_out(shftadd151_out));
bindec3 shftadd150(.bin_in ({shftadd140_out[2:0], shftadd8xq[9]}), .dec_out(shftadd150_out));

bindec3 shftadd165(.bin_in ({shftadd155_out[2:0], shftadd154_out[3]}), .dec_out(shftadd165_out));
bindec3 shftadd164(.bin_in ({shftadd154_out[2:0], shftadd153_out[3]}), .dec_out(shftadd164_out));
bindec3 shftadd163(.bin_in ({shftadd153_out[2:0], shftadd152_out[3]}), .dec_out(shftadd163_out));
bindec3 shftadd162(.bin_in ({shftadd152_out[2:0], shftadd151_out[3]}), .dec_out(shftadd162_out));
bindec3 shftadd161(.bin_in ({shftadd151_out[2:0], shftadd150_out[3]}), .dec_out(shftadd161_out));
bindec3 shftadd160(.bin_in ({shftadd150_out[2:0], shftadd8xq[8]}), .dec_out(shftadd160_out));

bindec3 shftadd175(.bin_in ({shftadd165_out[2:0], shftadd164_out[3]}), .dec_out(shftadd175_out));
bindec3 shftadd174(.bin_in ({shftadd164_out[2:0], shftadd163_out[3]}), .dec_out(shftadd174_out));
bindec3 shftadd173(.bin_in ({shftadd163_out[2:0], shftadd162_out[3]}), .dec_out(shftadd173_out));
bindec3 shftadd172(.bin_in ({shftadd162_out[2:0], shftadd161_out[3]}), .dec_out(shftadd172_out));
bindec3 shftadd171(.bin_in ({shftadd161_out[2:0], shftadd160_out[3]}), .dec_out(shftadd171_out));
bindec3 shftadd170(.bin_in ({shftadd160_out[2:0], shftadd8xq[7]}), .dec_out(shftadd170_out));

//------------------------------------------- register here ----------------------------------

bindec3 shftadd186(.bin_in ({1'b0, shftadd17xq[32:30]}), .dec_out(shftadd186_out));
bindec3 shftadd185(.bin_in (shftadd17xq[29:26]), .dec_out(shftadd185_out));
bindec3 shftadd184(.bin_in (shftadd17xq[25:22]), .dec_out(shftadd184_out));
bindec3 shftadd183(.bin_in (shftadd17xq[21:18]), .dec_out(shftadd183_out));
bindec3 shftadd182(.bin_in (shftadd17xq[17:14]), .dec_out(shftadd182_out));
bindec3 shftadd181(.bin_in (shftadd17xq[13:10]), .dec_out(shftadd181_out));
bindec3 shftadd180(.bin_in (shftadd17xq[9:6]), .dec_out(shftadd180_out));

bindec3 shftadd196(.bin_in ({shftadd186_out[2:0], shftadd185_out[3]}), .dec_out(shftadd196_out));
bindec3 shftadd195(.bin_in ({shftadd185_out[2:0], shftadd184_out[3]}), .dec_out(shftadd195_out));
bindec3 shftadd194(.bin_in ({shftadd184_out[2:0], shftadd183_out[3]}), .dec_out(shftadd194_out));
bindec3 shftadd193(.bin_in ({shftadd183_out[2:0], shftadd182_out[3]}), .dec_out(shftadd193_out));
bindec3 shftadd192(.bin_in ({shftadd182_out[2:0], shftadd181_out[3]}), .dec_out(shftadd192_out));
bindec3 shftadd191(.bin_in ({shftadd181_out[2:0], shftadd180_out[3]}), .dec_out(shftadd191_out));
bindec3 shftadd190(.bin_in ({shftadd180_out[2:0], shftadd17xq[5]}), .dec_out(shftadd190_out));

bindec3 shftadd206(.bin_in ({shftadd196_out[2:0], shftadd195_out[3]}), .dec_out(shftadd206_out));
bindec3 shftadd205(.bin_in ({shftadd195_out[2:0], shftadd194_out[3]}), .dec_out(shftadd205_out));
bindec3 shftadd204(.bin_in ({shftadd194_out[2:0], shftadd193_out[3]}), .dec_out(shftadd204_out));
bindec3 shftadd203(.bin_in ({shftadd193_out[2:0], shftadd192_out[3]}), .dec_out(shftadd203_out));
bindec3 shftadd202(.bin_in ({shftadd192_out[2:0], shftadd191_out[3]}), .dec_out(shftadd202_out));
bindec3 shftadd201(.bin_in ({shftadd191_out[2:0], shftadd190_out[3]}), .dec_out(shftadd201_out));
bindec3 shftadd200(.bin_in ({shftadd190_out[2:0], shftadd17xq[4]}), .dec_out(shftadd200_out));


bindec3 shftadd217(.bin_in ({1'b0, shftadd186_out[3], shftadd196_out[3], shftadd206_out[3]}), .dec_out(shftadd217_out));
bindec3 shftadd216(.bin_in ({shftadd206_out[2:0], shftadd205_out[3]}), .dec_out(shftadd216_out));
bindec3 shftadd215(.bin_in ({shftadd205_out[2:0], shftadd204_out[3]}), .dec_out(shftadd215_out));
bindec3 shftadd214(.bin_in ({shftadd204_out[2:0], shftadd203_out[3]}), .dec_out(shftadd214_out));
bindec3 shftadd213(.bin_in ({shftadd203_out[2:0], shftadd202_out[3]}), .dec_out(shftadd213_out));
bindec3 shftadd212(.bin_in ({shftadd202_out[2:0], shftadd201_out[3]}), .dec_out(shftadd212_out));
bindec3 shftadd211(.bin_in ({shftadd201_out[2:0], shftadd200_out[3]}), .dec_out(shftadd211_out));
bindec3 shftadd210(.bin_in ({shftadd200_out[2:0], shftadd17xq[3]}), .dec_out(shftadd210_out));

bindec3 shftadd227(.bin_in ({shftadd217_out[2:0], shftadd216_out[3]}), .dec_out(shftadd227_out));
bindec3 shftadd226(.bin_in ({shftadd216_out[2:0], shftadd215_out[3]}), .dec_out(shftadd226_out));
bindec3 shftadd225(.bin_in ({shftadd215_out[2:0], shftadd214_out[3]}), .dec_out(shftadd225_out));
bindec3 shftadd224(.bin_in ({shftadd214_out[2:0], shftadd213_out[3]}), .dec_out(shftadd224_out));
bindec3 shftadd223(.bin_in ({shftadd213_out[2:0], shftadd212_out[3]}), .dec_out(shftadd223_out));
bindec3 shftadd222(.bin_in ({shftadd212_out[2:0], shftadd211_out[3]}), .dec_out(shftadd222_out));
bindec3 shftadd221(.bin_in ({shftadd211_out[2:0], shftadd210_out[3]}), .dec_out(shftadd221_out));
bindec3 shftadd220(.bin_in ({shftadd210_out[2:0], shftadd17xq[2]}), .dec_out(shftadd220_out));

bindec3 shftadd237(.bin_in ({shftadd227_out[2:0], shftadd226_out[3]}), .dec_out(shftadd237_out));
bindec3 shftadd236(.bin_in ({shftadd226_out[2:0], shftadd225_out[3]}), .dec_out(shftadd236_out));
bindec3 shftadd235(.bin_in ({shftadd225_out[2:0], shftadd224_out[3]}), .dec_out(shftadd235_out));
bindec3 shftadd234(.bin_in ({shftadd224_out[2:0], shftadd223_out[3]}), .dec_out(shftadd234_out));
bindec3 shftadd233(.bin_in ({shftadd223_out[2:0], shftadd222_out[3]}), .dec_out(shftadd233_out));
bindec3 shftadd232(.bin_in ({shftadd222_out[2:0], shftadd221_out[3]}), .dec_out(shftadd232_out));
bindec3 shftadd231(.bin_in ({shftadd221_out[2:0], shftadd220_out[3]}), .dec_out(shftadd231_out));
bindec3 shftadd230(.bin_in ({shftadd220_out[2:0], shftadd17xq[1]}), .dec_out(shftadd230_out));

//------------------------------------------- register here ----------------------------------


always @(posedge CLK ) 
    if (RESET) begin
        shftadd8xq  <= 30'b0;
        shftadd17xq <= 33'b0;
        decDigit8   <= 4'b0;
        decDigit7   <= 4'b0;
        decDigit6   <= 4'b0;
        decDigit5   <= 4'b0;
        decDigit4   <= 4'b0;
        decDigit3   <= 4'b0;
        decDigit2   <= 4'b0;
        decDigit1   <= 4'b0;
        decDigit0   <= 4'b0;
    end
    else begin
        shftadd8xq[29:0] <= {shftadd62_out[3], shftadd72_out[3], shftadd82_out[3:0], shftadd81_out[3:0], shftadd80_out[3:0], binIn[15:0]}; 
        shftadd17xq[32:0] <= {shftadd155_out[3], shftadd165_out[3], shftadd175_out[3:0], shftadd174_out[3:0], shftadd173_out[3:0], shftadd172_out[3:0], shftadd171_out[3:0], shftadd170_out[3:0], shftadd8xq[6:0]}; 
        decDigit8 <= {1'b0, shftadd217_out[3], shftadd227_out[3], shftadd237_out[3]};
        decDigit7 <= {shftadd237_out[2:0], shftadd236_out[3]};
        decDigit6 <= {shftadd236_out[2:0], shftadd235_out[3]};
        decDigit5 <= {shftadd235_out[2:0], shftadd234_out[3]};
        decDigit4 <= {shftadd234_out[2:0], shftadd233_out[3]};
        decDigit3 <= {shftadd233_out[2:0], shftadd232_out[3]};
        decDigit2 <= {shftadd232_out[2:0], shftadd231_out[3]};
        decDigit1 <= {shftadd231_out[2:0], shftadd230_out[3]};
        decDigit0 <= {shftadd230_out[2:0], shftadd17xq[0]};
    end


endmodule    
