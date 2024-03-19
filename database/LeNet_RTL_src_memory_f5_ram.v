//==================================================================================================
//  Filename      : f5_ram.v
//  Created On    : 2018-01-07 20:39:04
//  Last Modified : 2018-03-21 17:06:00
//  Revision      : 
//  Author        : YzTong
//  Company       : UESTC
//  Email         : yztong1994@gmail.com
//
//  Description   : 
//
//
//==================================================================================================
module f5_ram(/*autoport*/
//output
      f5_rdata,
//input
      clk,
      f5_waddr,
      f5_wdata,
      f5_wr_en,
      f5_sel,
      f5_raddr);

  

	input clk;
	input [4:0]  f5_waddr;
  input [255:0]f5_wdata;
	input        f5_wr_en;
	input [3:0]  f5_sel;
	input [4:0]  f5_raddr;

	output [15:0] f5_rdata;


  wire [15:0] f5_1_rdata;
  wire [15:0] f5_2_rdata;
  wire [15:0] f5_3_rdata;
  wire [15:0] f5_4_rdata;
  wire [15:0] f5_5_rdata;
  wire [15:0] f5_6_rdata;
  wire [15:0] f5_7_rdata;
  wire [15:0] f5_8_rdata;
  wire [15:0] f5_9_rdata;
  wire [15:0] f5_10_rdata;
  wire [15:0] f5_11_rdata;
  wire [15:0] f5_12_rdata;
  wire [15:0] f5_13_rdata;
  wire [15:0] f5_14_rdata;
  wire [15:0] f5_15_rdata;
  wire [15:0] f5_16_rdata;

  wire [255:0] f5_rdata_all;
  dist_mem_gen_f5_ram f5_ram (
    .a(f5_waddr),        // input [4 : 0] a
    .d(f5_wdata),        // input [255 : 0] d
    .dpra(f5_raddr),  // input [4 : 0] dpra
    .clk(clk),    // input clk
    .we(f5_wr_en),      // input we
    .qdpo(f5_rdata_all)  // output [255 : 0] qdpo
  );


  assign f5_1_rdata = f5_rdata_all[15:0];
  assign f5_2_rdata = f5_rdata_all[31:16];
  assign f5_3_rdata = f5_rdata_all[47:32];
  assign f5_4_rdata = f5_rdata_all[63:48];
  assign f5_5_rdata = f5_rdata_all[79:64];
  assign f5_6_rdata = f5_rdata_all[95:80];
  assign f5_7_rdata = f5_rdata_all[111:96];
  assign f5_8_rdata = f5_rdata_all[127:112];
  assign f5_9_rdata = f5_rdata_all[143:128];
  assign f5_10_rdata = f5_rdata_all[159:144];
  assign f5_11_rdata = f5_rdata_all[175:160];
  assign f5_12_rdata = f5_rdata_all[191:176];
  assign f5_13_rdata = f5_rdata_all[207:192];
  assign f5_14_rdata = f5_rdata_all[223:208];
  assign f5_15_rdata = f5_rdata_all[239:224];
  assign f5_16_rdata = f5_rdata_all[255:240];





  reg[3:0] f5_sel_r1,f5_sel_r2;
  always@(posedge clk)begin
    f5_sel_r1 <= f5_sel;
    f5_sel_r2 <= f5_sel_r1;
  end


  reg[15:0] f5_rdata_temp;
  always@(posedge clk)begin
  	case(f5_sel_r2)
      4'd0:f5_rdata_temp = f5_1_rdata;
      4'd1:f5_rdata_temp = f5_2_rdata;
      4'd2:f5_rdata_temp = f5_3_rdata;
      4'd3:f5_rdata_temp = f5_4_rdata;
      4'd4:f5_rdata_temp = f5_5_rdata;
      4'd5:f5_rdata_temp = f5_6_rdata;
      4'd6:f5_rdata_temp = f5_7_rdata;
      4'd7:f5_rdata_temp = f5_8_rdata;
      4'd8:f5_rdata_temp = f5_9_rdata;
      4'd9:f5_rdata_temp = f5_10_rdata;
      4'd10:f5_rdata_temp = f5_11_rdata;
      4'd11:f5_rdata_temp = f5_12_rdata;
      4'd12:f5_rdata_temp = f5_13_rdata;
      4'd13:f5_rdata_temp = f5_14_rdata;
      4'd14:f5_rdata_temp = f5_15_rdata;
      4'd15:f5_rdata_temp = f5_16_rdata;
  	endcase
  end

  assign f5_rdata = f5_rdata_temp;
endmodule