// This program was cloned from: https://github.com/yuravg/uvm_book_examples
// License: Apache License 2.0

//File name   : sram_voltage_island.v
//Title       : 
//Created     : 1999
//Description : 
//Notes       : 
//----------------------------------------------------------------------
//   Copyright 1999-2010 Cadence Design Systems, Inc.
//   All Rights Reserved Worldwide
//
//   Licensed under the Apache License, Version 2.0 (the
//   "License"); you may not use this file except in
//   compliance with the License.  You may obtain a copy of
//   the License at
//
//       http://www.apache.org/licenses/LICENSE-2.0
//
//   Unless required by applicable law or agreed to in
//   writing, software distributed under the License is
//   distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
//   CONDITIONS OF ANY KIND, either express or implied.  See
//   the License for the specific language governing
//   permissions and limitations under the License.
//----------------------------------------------------------------------
module sram_voltage_island(
        //inputs
        hclk,
	n_hreset,        
	addr,
	hwdata,
	wen_g,
	cen0,
	cen1,
	cen2,
	cen3,
	reg_cen0,
	reg_cen1,
	reg_cen2,
	reg_cen3,
	g_wr_dphase,
       //outputs
        hrdata_island,
        scan_mode
);


input hclk;
input n_hreset;
input [31:0] addr;
input [31:0] hwdata;
input [3:0]  wen_g;
input cen0;
input cen1;
input cen2;
input cen3;
input reg_cen0;
input reg_cen1;
input reg_cen2;
input reg_cen3;
input g_wr_dphase;
input scan_mode;
       //outputs
output [31:0] hrdata_island;

wire [3:0]  wen_g;
wire [31:0] r_data_0;
wire [31:0] r_data_1;
wire [31:0] r_data_2;
wire [31:0] r_data_3;
wire        hclk;
wire [31:0] hwdata;
wire [2:0]  EMA;
//reg  [31:0] r_data;
wire [31:0] hrdata_island;
wire [31:0] r_data0;
wire [31:0] r_data1;
wire [31:0] r_data2;
wire [31:0] r_data3;


SRAM_SP_2kx32_wrap i_0_SRAM_2kx32_wrap (
                .Q(r_data_0),
                .CLK(hclk),
                .ME(~cen0),
                .WE(~wen_g),
                .ADR(addr[12:2]),
                .D(hwdata),
		.reset_n(n_hreset),
                .scan_mode(scan_mode)
               );

SRAM_SP_2kx32_wrap i_1_SRAM_2kx32_wrap (
                .Q(r_data_1),
                .CLK(hclk),
                .ME(~cen1),
                .WE(~wen_g),
                .ADR(addr[12:2]),
                .D(hwdata),
		.reset_n(n_hreset),
                .scan_mode(scan_mode)
                 );

SRAM_SP_2kx32_wrap i_2_SRAM_2kx32_wrap (
                .Q(r_data_2),
                .CLK(hclk),
                .ME(~cen2),
                .WE(~wen_g),
                .ADR(addr[12:2]),
                .D(hwdata),
		.reset_n(n_hreset),
                .scan_mode(scan_mode)
                 );

SRAM_SP_2kx32_wrap i_3_SRAM_2kx32_wrap (
                .Q(r_data_3),
                .CLK(hclk),
                .ME(~cen3),
                .WE(~wen_g),
                .ADR(addr[12:2]),
                .D(hwdata),
		.reset_n(n_hreset),
                .scan_mode(scan_mode)
                 );


assign r_data0[0] = (r_data_0[0])  & ~(reg_cen0 | g_wr_dphase);
assign r_data0[1] = (r_data_0[1])  & ~(reg_cen0 | g_wr_dphase);
assign r_data0[2] = (r_data_0[2])  & ~(reg_cen0 | g_wr_dphase);
assign r_data0[3] = (r_data_0[3])  & ~(reg_cen0 | g_wr_dphase);
assign r_data0[4] = (r_data_0[4])  & ~(reg_cen0 | g_wr_dphase);
assign r_data0[5] = (r_data_0[5])  & ~(reg_cen0 | g_wr_dphase);
assign r_data0[6] = (r_data_0[6])  & ~(reg_cen0 | g_wr_dphase);
assign r_data0[7] = (r_data_0[7])  & ~(reg_cen0 | g_wr_dphase);
assign r_data0[8] = (r_data_0[8])  & ~(reg_cen0 | g_wr_dphase);
assign r_data0[9] = (r_data_0[9])  & ~(reg_cen0 | g_wr_dphase);
assign r_data0[10] =(r_data_0[10]) & ~(reg_cen0 | g_wr_dphase);
assign r_data0[11] =(r_data_0[11]) & ~(reg_cen0 | g_wr_dphase);
assign r_data0[12] =(r_data_0[12]) & ~(reg_cen0 | g_wr_dphase);
assign r_data0[13] =(r_data_0[13]) & ~(reg_cen0 | g_wr_dphase);
assign r_data0[14] =(r_data_0[14]) & ~(reg_cen0 | g_wr_dphase);
assign r_data0[15] =(r_data_0[15]) & ~(reg_cen0 | g_wr_dphase);
assign r_data0[16] =(r_data_0[16]) & ~(reg_cen0 | g_wr_dphase);
assign r_data0[17] =(r_data_0[17]) & ~(reg_cen0 | g_wr_dphase);
assign r_data0[18] =(r_data_0[18]) & ~(reg_cen0 | g_wr_dphase);
assign r_data0[19] =(r_data_0[19]) & ~(reg_cen0 | g_wr_dphase);
assign r_data0[20] =(r_data_0[20]) & ~(reg_cen0 | g_wr_dphase);
assign r_data0[21] =(r_data_0[21]) & ~(reg_cen0 | g_wr_dphase);
assign r_data0[22] =(r_data_0[22]) & ~(reg_cen0 | g_wr_dphase);
assign r_data0[23] =(r_data_0[23]) & ~(reg_cen0 | g_wr_dphase);
assign r_data0[24] =(r_data_0[24]) & ~(reg_cen0 | g_wr_dphase);
assign r_data0[25] =(r_data_0[25]) & ~(reg_cen0 | g_wr_dphase);
assign r_data0[26] =(r_data_0[26]) & ~(reg_cen0 | g_wr_dphase);
assign r_data0[27] =(r_data_0[27]) & ~(reg_cen0 | g_wr_dphase);
assign r_data0[28] =(r_data_0[28]) & ~(reg_cen0 | g_wr_dphase);
assign r_data0[29] =(r_data_0[29]) & ~(reg_cen0 | g_wr_dphase);
assign r_data0[30] =(r_data_0[30]) & ~(reg_cen0 | g_wr_dphase);
assign r_data0[31] =(r_data_0[31]) & ~(reg_cen0 | g_wr_dphase);

assign r_data1[0] = (r_data_1[0])  & ~(reg_cen1 | g_wr_dphase);
assign r_data1[1] = (r_data_1[1])  & ~(reg_cen1 | g_wr_dphase);
assign r_data1[2] = (r_data_1[2])  & ~(reg_cen1 | g_wr_dphase);
assign r_data1[3] = (r_data_1[3])  & ~(reg_cen1 | g_wr_dphase);
assign r_data1[4] = (r_data_1[4])  & ~(reg_cen1 | g_wr_dphase);
assign r_data1[5] = (r_data_1[5])  & ~(reg_cen1 | g_wr_dphase);
assign r_data1[6] = (r_data_1[6])  & ~(reg_cen1 | g_wr_dphase);
assign r_data1[7] = (r_data_1[7])  & ~(reg_cen1 | g_wr_dphase);
assign r_data1[8] = (r_data_1[8])  & ~(reg_cen1 | g_wr_dphase);
assign r_data1[9] = (r_data_1[9])  & ~(reg_cen1 | g_wr_dphase);
assign r_data1[10] =(r_data_1[10]) & ~(reg_cen1 | g_wr_dphase);
assign r_data1[11] =(r_data_1[11]) & ~(reg_cen1 | g_wr_dphase);
assign r_data1[12] =(r_data_1[12]) & ~(reg_cen1 | g_wr_dphase);
assign r_data1[13] =(r_data_1[13]) & ~(reg_cen1 | g_wr_dphase);
assign r_data1[14] =(r_data_1[14]) & ~(reg_cen1 | g_wr_dphase);
assign r_data1[15] =(r_data_1[15]) & ~(reg_cen1 | g_wr_dphase);
assign r_data1[16] =(r_data_1[16]) & ~(reg_cen1 | g_wr_dphase);
assign r_data1[17] =(r_data_1[17]) & ~(reg_cen1 | g_wr_dphase);
assign r_data1[18] =(r_data_1[18]) & ~(reg_cen1 | g_wr_dphase);
assign r_data1[19] =(r_data_1[19]) & ~(reg_cen1 | g_wr_dphase);
assign r_data1[20] =(r_data_1[20]) & ~(reg_cen1 | g_wr_dphase);
assign r_data1[21] =(r_data_1[21]) & ~(reg_cen1 | g_wr_dphase);
assign r_data1[22] =(r_data_1[22]) & ~(reg_cen1 | g_wr_dphase);
assign r_data1[23] =(r_data_1[23]) & ~(reg_cen1 | g_wr_dphase);
assign r_data1[24] =(r_data_1[24]) & ~(reg_cen1 | g_wr_dphase);
assign r_data1[25] =(r_data_1[25]) & ~(reg_cen1 | g_wr_dphase);
assign r_data1[26] =(r_data_1[26]) & ~(reg_cen1 | g_wr_dphase);
assign r_data1[27] =(r_data_1[27]) & ~(reg_cen1 | g_wr_dphase);
assign r_data1[28] =(r_data_1[28]) & ~(reg_cen1 | g_wr_dphase);
assign r_data1[29] =(r_data_1[29]) & ~(reg_cen1 | g_wr_dphase);
assign r_data1[30] =(r_data_1[30]) & ~(reg_cen1 | g_wr_dphase);
assign r_data1[31] =(r_data_1[31]) & ~(reg_cen1 | g_wr_dphase);

assign r_data2[0] = (r_data_2[0])  & ~(reg_cen2 | g_wr_dphase);
assign r_data2[1] = (r_data_2[1])  & ~(reg_cen2 | g_wr_dphase);
assign r_data2[2] = (r_data_2[2])  & ~(reg_cen2 | g_wr_dphase);
assign r_data2[3] = (r_data_2[3])  & ~(reg_cen2 | g_wr_dphase);
assign r_data2[4] = (r_data_2[4])  & ~(reg_cen2 | g_wr_dphase);
assign r_data2[5] = (r_data_2[5])  & ~(reg_cen2 | g_wr_dphase);
assign r_data2[6] = (r_data_2[6])  & ~(reg_cen2 | g_wr_dphase);
assign r_data2[7] = (r_data_2[7])  & ~(reg_cen2 | g_wr_dphase);
assign r_data2[8] = (r_data_2[8])  & ~(reg_cen2 | g_wr_dphase);
assign r_data2[9] = (r_data_2[9])  & ~(reg_cen2 | g_wr_dphase);
assign r_data2[10] =(r_data_2[10]) & ~(reg_cen2 | g_wr_dphase);
assign r_data2[11] =(r_data_2[11]) & ~(reg_cen2 | g_wr_dphase);
assign r_data2[12] =(r_data_2[12]) & ~(reg_cen2 | g_wr_dphase);
assign r_data2[13] =(r_data_2[13]) & ~(reg_cen2 | g_wr_dphase);
assign r_data2[14] =(r_data_2[14]) & ~(reg_cen2 | g_wr_dphase);
assign r_data2[15] =(r_data_2[15]) & ~(reg_cen2 | g_wr_dphase);
assign r_data2[16] =(r_data_2[16]) & ~(reg_cen2 | g_wr_dphase);
assign r_data2[17] =(r_data_2[17]) & ~(reg_cen2 | g_wr_dphase);
assign r_data2[18] =(r_data_2[18]) & ~(reg_cen2 | g_wr_dphase);
assign r_data2[19] =(r_data_2[19]) & ~(reg_cen2 | g_wr_dphase);
assign r_data2[20] =(r_data_2[20]) & ~(reg_cen2 | g_wr_dphase);
assign r_data2[21] =(r_data_2[21]) & ~(reg_cen2 | g_wr_dphase);
assign r_data2[22] =(r_data_2[22]) & ~(reg_cen2 | g_wr_dphase);
assign r_data2[23] =(r_data_2[23]) & ~(reg_cen2 | g_wr_dphase);
assign r_data2[24] =(r_data_2[24]) & ~(reg_cen2 | g_wr_dphase);
assign r_data2[25] =(r_data_2[25]) & ~(reg_cen2 | g_wr_dphase);
assign r_data2[26] =(r_data_2[26]) & ~(reg_cen2 | g_wr_dphase);
assign r_data2[27] =(r_data_2[27]) & ~(reg_cen2 | g_wr_dphase);
assign r_data2[28] =(r_data_2[28]) & ~(reg_cen2 | g_wr_dphase);
assign r_data2[29] =(r_data_2[29]) & ~(reg_cen2 | g_wr_dphase);
assign r_data2[30] =(r_data_2[30]) & ~(reg_cen2 | g_wr_dphase);
assign r_data2[31] =(r_data_2[31]) & ~(reg_cen2 | g_wr_dphase);

assign r_data3[0] = (r_data_3[0])  & ~(reg_cen3 | g_wr_dphase);
assign r_data3[1] = (r_data_3[1])  & ~(reg_cen3 | g_wr_dphase);
assign r_data3[2] = (r_data_3[2])  & ~(reg_cen3 | g_wr_dphase);
assign r_data3[3] = (r_data_3[3])  & ~(reg_cen3 | g_wr_dphase);
assign r_data3[4] = (r_data_3[4])  & ~(reg_cen3 | g_wr_dphase);
assign r_data3[5] = (r_data_3[5])  & ~(reg_cen3 | g_wr_dphase);
assign r_data3[6] = (r_data_3[6])  & ~(reg_cen3 | g_wr_dphase);
assign r_data3[7] = (r_data_3[7])  & ~(reg_cen3 | g_wr_dphase);
assign r_data3[8] = (r_data_3[8])  & ~(reg_cen3 | g_wr_dphase);
assign r_data3[9] = (r_data_3[9])  & ~(reg_cen3 | g_wr_dphase);
assign r_data3[10] =(r_data_3[10]) & ~(reg_cen3 | g_wr_dphase);
assign r_data3[11] =(r_data_3[11]) & ~(reg_cen3 | g_wr_dphase);
assign r_data3[12] =(r_data_3[12]) & ~(reg_cen3 | g_wr_dphase);
assign r_data3[13] =(r_data_3[13]) & ~(reg_cen3 | g_wr_dphase);
assign r_data3[14] =(r_data_3[14]) & ~(reg_cen3 | g_wr_dphase);
assign r_data3[15] =(r_data_3[15]) & ~(reg_cen3 | g_wr_dphase);
assign r_data3[16] =(r_data_3[16]) & ~(reg_cen3 | g_wr_dphase);
assign r_data3[17] =(r_data_3[17]) & ~(reg_cen3 | g_wr_dphase);
assign r_data3[18] =(r_data_3[18]) & ~(reg_cen3 | g_wr_dphase);
assign r_data3[19] =(r_data_3[19]) & ~(reg_cen3 | g_wr_dphase);
assign r_data3[20] =(r_data_3[20]) & ~(reg_cen3 | g_wr_dphase);
assign r_data3[21] =(r_data_3[21]) & ~(reg_cen3 | g_wr_dphase);
assign r_data3[22] =(r_data_3[22]) & ~(reg_cen3 | g_wr_dphase);
assign r_data3[23] =(r_data_3[23]) & ~(reg_cen3 | g_wr_dphase);
assign r_data3[24] =(r_data_3[24]) & ~(reg_cen3 | g_wr_dphase);
assign r_data3[25] =(r_data_3[25]) & ~(reg_cen3 | g_wr_dphase);
assign r_data3[26] =(r_data_3[26]) & ~(reg_cen3 | g_wr_dphase);
assign r_data3[27] =(r_data_3[27]) & ~(reg_cen3 | g_wr_dphase);
assign r_data3[28] =(r_data_3[28]) & ~(reg_cen3 | g_wr_dphase);
assign r_data3[29] =(r_data_3[29]) & ~(reg_cen3 | g_wr_dphase);
assign r_data3[30] =(r_data_3[30]) & ~(reg_cen3 | g_wr_dphase);
assign r_data3[31] =(r_data_3[31]) & ~(reg_cen3 | g_wr_dphase);

assign  hrdata_island =((r_data0) | (r_data1)  |  (r_data2)  |  (r_data3) );

endmodule
 
