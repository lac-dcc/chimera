//==================================================================================================
//  Filename      : CNN_accelerator.v
//  Created On    : 2018-01-25 13:32:28
//  Last Modified : 2018-03-21 21:51:34
//  Revision      : 
//  Author        : YzTong
//  Company       : UESTC
//  Email         : yztong1994@gmail.com
//
//  Description   : 
//
//
//==================================================================================================
`timescale 1ns/1ns
module CNN_accelerator(/*autoport*/
//output
			done,
			class_value,
			class_index,
//input
			sys_clk,
			rst_n,
			bd_clk,
			start,
			ena,
			f1_wr_en,
			f1_waddr,
			f1_wdata);
input sys_clk;
input rst_n;
input bd_clk;
input start;
input ena;
input [3:0] f1_wr_en;
input [31:0]f1_waddr;
input [31:0]f1_wdata;
output done;
output [15:0] class_value;
output [3:0]  class_index;





/*autodef*/
wire [15:0]class_value;
wire pool1_start;
wire [671:0]w6_rdata;
wire pool2_done;
wire [15:0]class0;
wire [95:0]f2_wdata;
wire [95:0]f2_rdata;
wire [15:0]f5_rdata;
wire [6:0]w6_raddr;
wire f8_wr_en;
wire pool1_clr;
wire [15:0]f7_rdata;
wire [4:0]f5_raddr;
wire [6:0]w7_raddr;
wire fc3_clr;
wire [9:0]f2_raddr;
wire conv1_clr;
wire [4:0]w1_raddr;
wire f5_wr_en;
wire pool2_clr;
wire [95:0]f3_rdata;
wire clk;
wire [6:0]f7_raddr;
wire sel;
wire [7:0]f3_raddr;
wire pool1_done;
wire [6:0]f6_raddr;
wire [3:0]f5_sel;
wire conv2_start;
wire [15:0]f6_rdata;
wire [79:0]w7_rdata;
wire f3_wr_en;
wire [1931:0]mac_4;
wire [959:0]w5_rdata;
wire [9:0]f2_waddr;
wire [3:0]class_index;
wire get_class_start;
wire [6:0]f4_waddr;
wire [95:0]f3_wdata;
wire fc1_start;
wire [255:0]f4_rdata;
wire [15:0]class9;
wire [8:0]w5_raddr;
wire conv1_start;
wire [255:0]f4_wdata;
wire conv2_done;
wire f4_wr_en;
wire fc1_clr;
wire [229:0]mac_5;
wire [7:0]f3_waddr;
wire fc1_done;
wire [4:0]f5_waddr;
wire [4:0]w3_raddr;
wire get_class_done;
wire fc3_done;
wire [9:0]f1_raddr;
wire conv1_done;
wire pool2_start;
wire f2_wr_en;
wire [7:0]f1_rdata;
wire f6_wr_en;
wire wclk;
wire [6:0]f4_raddr;
wire [47:0]w1_rdata;
wire conv2_clr;
wire fc3_start;
wire fc2_clr;
wire [255:0]f5_wdata;
wire [767:0]w3_rdata;
wire fc2_done;
wire f7_wr_en;
wire [15:0]class8;
wire [137:0]mac_1;
wire [2207:0]mac_2;
wire [2759:0]mac_3;
wire [15:0]class3;
wire [15:0]class2;
wire [15:0]class1;
wire fc2_start;
wire [15:0]class7;
wire [15:0]class6;
wire [15:0]class5;
wire [15:0]class4;





f1_ram f1_ram(/*autoinst*/
			.f1_rdata(f1_rdata[7:0]),
			.rclk(clk),
			.wclk(wclk),
			.f1_wr_en(f1_wr_en[3:0]),
			.f1_waddr(f1_waddr[31:0]),
			.f1_wdata(f1_wdata[31:0]),
			.ena(ena),
			.f1_raddr(f1_raddr[9:0]));
f2_ram f2_ram(/*autoinst*/
			.f2_rdata(f2_rdata[95:0]),
			.clk(clk),
			.f2_wdata(f2_wdata[95:0]),
			.f2_wr_en(f2_wr_en),
			.f2_waddr(f2_waddr[9:0]),
			.f2_raddr(f2_raddr[9:0]));
f3_ram f3_ram(/*autoinst*/
			.f3_rdata(f3_rdata[95:0]),
			.clk(clk),
			.f3_wdata(f3_wdata[95:0]),
			.f3_wr_en(f3_wr_en),
			.f3_waddr(f3_waddr[7:0]),
			.f3_raddr(f3_raddr[7:0]));
f4_ram f4_ram(/*autoinst*/
			.f4_rdata(f4_rdata[255:0]),
			.clk(clk),
			.f4_wdata(f4_wdata[255:0]),
			.f4_wr_en(f4_wr_en),
			.f4_waddr(f4_waddr[6:0]),
			.f4_raddr(f4_raddr[6:0]));
f5_ram f5_ram(/*autoinst*/
			.f5_rdata(f5_rdata[15:0]),
			.clk(clk),
			.f5_waddr(f5_waddr[4:0]),
			.f5_wdata(f5_wdata[255:0]),
			.f5_wr_en(f5_wr_en),
			.f5_sel(f5_sel[3:0]),
			.f5_raddr(f5_raddr[4:0]));
w1_rom w1_rom(/*autoinst*/
			.w1_rdata(w1_rdata[47:0]),
			.clk(clk),
			.w1_raddr(w1_raddr[4:0]));
w3_rom w3_rom(/*autoinst*/
			.w3_rdata(w3_rdata[767:0]),
			.clk(clk),
			.w3_raddr(w3_raddr[4:0]));
w5_rom w5_rom(/*autoinst*/
			.w5_rdata(w5_rdata[959:0]),
			.clk(clk),
			.w5_raddr(w5_raddr[8:0]));
w6_rom w6_rom(/*autoinst*/
			.w6_rdata(w6_rdata[671:0]),
			.clk(clk),
			.w6_raddr(w6_raddr[6:0]));
w7_rom w7_rom(/*autoinst*/
			.w7_rdata(w7_rdata[79:0]),
			.clk(clk),
			.w7_raddr(w7_raddr[6:0]));
conv1_ctrl conv1_ctrl(/*autoinst*/
			.w1_raddr(w1_raddr[4:0]),
			.f1_raddr(f1_raddr[9:0]),
			.f2_waddr(f2_waddr[9:0]),
			.f2_wr_en(f2_wr_en),
			.conv1_done(conv1_done),
			.conv1_clr(conv1_clr),
			.clk(clk),
			.rst_n(rst_n),
			.conv1_start(conv1_start));
pool1_ctrl pool1_ctrl(/*autoinst*/
			.f2_raddr(f2_raddr[9:0]),
			.f3_waddr(f3_waddr[7:0]),
			.f3_wr_en(f3_wr_en),
			.pool1_done(pool1_done),
			.pool1_clr(pool1_clr),
			.clk(clk),
			.rst_n(rst_n),
			.pool1_start(pool1_start));
conv2_ctrl conv2_ctrl(/*autoinst*/
			.w3_raddr(w3_raddr[4:0]),
			.f3_raddr(f3_raddr[7:0]),
			.f4_waddr(f4_waddr[6:0]),
			.f4_wr_en(f4_wr_en),
			.conv2_clr(conv2_clr),
			.conv2_done(conv2_done),
			.clk(clk),
			.rst_n(rst_n),
			.conv2_start(conv2_start));
pool2_ctrl pool2_ctrl(/*autoinst*/
			.f4_raddr(f4_raddr[6:0]),
			.f5_waddr(f5_waddr[4:0]),
			.f5_wr_en(f5_wr_en),
			.pool2_done(pool2_done),
			.pool2_clr(pool2_clr),
			.clk(clk),
			.rst_n(rst_n),
			.pool2_start(pool2_start));
fc1_ctrl fc1_ctrl(/*autoinst*/
			.f5_raddr(f5_raddr[4:0]),
			.f5_sel(f5_sel[3:0]),
			.w5_raddr(w5_raddr[8:0]),
			.f6_wr_en(f6_wr_en),
			.fc1_done(fc1_done),
			.fc1_clr(fc1_clr),
			.clk(clk),
			.rst_n(rst_n),
			.fc1_start(fc1_start));
fc2_ctrl fc2_ctrl(/*autoinst*/
			.f6_raddr(f6_raddr[6:0]),
			.w6_raddr(w6_raddr[6:0]),
			.f7_wr_en(f7_wr_en),
			.fc2_done(fc2_done),
			.fc2_clr(fc2_clr),
			.clk(clk),
			.rst_n(rst_n),
			.fc2_start(fc2_start));
fc3_ctrl fc3_ctrl(/*autoinst*/
			.f7_raddr(f7_raddr[6:0]),
			.w7_raddr(w7_raddr[6:0]),
			.f8_wr_en(f8_wr_en),
			.fc3_done(fc3_done),
			.fc3_clr(fc3_clr),
			.clk(clk),
			.rst_n(rst_n),
			.fc3_start(fc3_start));

conv1_exec conv1_exec(/*autoinst*/
			.f2_wdata(f2_wdata[95:0]),
			.clk(clk),
			.rst_n(rst_n),
			.mac_1(mac_1[137:0]));
conv2_exec conv2_exec(/*autoinst*/
			.f4_wdata(f4_wdata[255:0]),
			.mac_2(mac_2[2207:0]),
			.clk(clk),
			.rst_n(rst_n));

pool1_exec pool1_exec(/*autoinst*/
			.f2_rdata(f2_rdata[95:0]),
			.clk(clk),
			.rst_n(rst_n),
			.f3_wdata(f3_wdata[95:0]),
			.pool1_clr(pool1_clr));
pool2_exec pool2_exec(/*autoinst*/
			.f5_wdata(f5_wdata[255:0]),
			.clk(clk),
			.rst_n(rst_n),
			.f4_rdata(f4_rdata[255:0]),
			.pool2_clr(pool2_clr));

fc1_exec fc1_exec(/*autoinst*/
			.f6_rdata(f6_rdata[15:0]),
			.clk(clk),
			.rst_n(rst_n),
			.f6_wr_en(f6_wr_en),
			.mac_3(mac_3[2759:0]),
			.f6_raddr(f6_raddr[6:0]));
fc2_exec fc2_exec(/*autoinst*/
			.f7_rdata(f7_rdata[15:0]),
			.clk(clk),
			.rst_n(rst_n),
			.f7_wr_en(f7_wr_en),
			.mac_4(mac_4[1931:0]),
			.f7_raddr(f7_raddr[6:0]));
fc3_exec fc3_exec(/*autoinst*/
			.class0(class0[15:0]),
			.class1(class1[15:0]),
			.class2(class2[15:0]),
			.class3(class3[15:0]),
			.class4(class4[15:0]),
			.class5(class5[15:0]),
			.class6(class6[15:0]),
			.class7(class7[15:0]),
			.class8(class8[15:0]),
			.class9(class9[15:0]),
			.clk(clk),
			.rst_n(rst_n),
			.f8_wr_en(f8_wr_en),
			.mac_5(mac_5[229:0]));

shared_mac_bank shared_mac_bank(/*autoinst*/
			.mac_1(mac_1[137:0]),
			.mac_2(mac_2[2207:0]),
			.mac_3(mac_3[2759:0]),
			.mac_4(mac_4[1931:0]),
			.mac_5(mac_5[229:0]),
			.clk(clk),
			.f1_rdata(f1_rdata[7:0]),
			.w1_rdata(w1_rdata[47:0]),
			.f3_rdata(f3_rdata[95:0]),
			.w3_rdata(w3_rdata[767:0]),
			.f5_rdata(f5_rdata[15:0]),
			.w5_rdata(w5_rdata[959:0]),
			.f6_rdata(f6_rdata[15:0]),
			.w6_rdata(w6_rdata[671:0]),
			.f7_rdata(f7_rdata[15:0]),
			.w7_rdata(w7_rdata[79:0]),
			.sel(sel),
			.conv1_clr(conv1_clr),
			.conv2_clr(conv2_clr),
			.fc1_clr(fc1_clr),
			.fc2_clr(fc2_clr),
			.fc3_clr(fc3_clr));

get_class	get_class(/*autoinst*/
			.get_class_done(get_class_done),
			.class_value(class_value[15:0]),
			.class_index(class_index[3:0]),
			.clk(clk),
			.class0(class0[15:0]),
			.class1(class1[15:0]),
			.class2(class2[15:0]),
			.class3(class3[15:0]),
			.class4(class4[15:0]),
			.class5(class5[15:0]),
			.class6(class6[15:0]),
			.class7(class7[15:0]),
			.class8(class8[15:0]),
			.class9(class9[15:0]),
			.get_class_start(get_class_start));
//CLK assignment
assign clk = sys_clk;
assign wclk = bd_clk; 

(* max_fanout = 50 *)reg sel_r;
always@(posedge clk or negedge rst_n)begin
	if(!rst_n)begin
		sel_r <= 1'b0;
	end
	else if(conv1_start)begin
		sel_r <= 1'b1;
	end
	else if(fc1_start)begin
		sel_r <= 1'b0;
	end
end


assign conv1_start = start;
assign pool1_start = conv1_done;
assign conv2_start = pool1_done;
assign pool2_start = conv2_done;
assign fc1_start   = pool2_done;
assign fc2_start   = fc1_done;
assign fc3_start   = fc2_done;
assign get_class_start  = fc3_done;
assign done 	   = get_class_done;
assign sel 		   = sel_r;
endmodule