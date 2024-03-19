//==================================================================================================
//  Filename      : get_class.v
//  Created On    : 2018-01-23 09:28:48
//  Last Modified : 2018-03-21 15:29:14
//  Revision      : 
//  Author        : YzTong
//  Company       : UESTC
//  Email         : yztong1994@gmail.com
//
//  Description   : Comparators Tree to Compare final layers' output.
//
//
//==================================================================================================
module get_class(/*autoport*/
//output
			get_class_done,
			class_value,
			class_index,
//input
			clk,
			class0,
			class1,
			class2,
			class3,
			class4,
			class5,
			class6,
			class7,
			class8,
			class9,
			get_class_start);

input clk;

input [15:0]  class0;
input [15:0]  class1;
input [15:0]  class2;
input [15:0]  class3;
input [15:0]  class4;
input [15:0]  class5;
input [15:0]  class6;
input [15:0]  class7;
input [15:0]  class8;
input [15:0]  class9;		

input get_class_start;
output get_class_done;
output [15:0] class_value;
output [3:0]  class_index;

//--------------------------------- 
//Stage 1: Compare
//---------------------------------
wire [15:0] value_0_1;
wire [15:0] value_2_3;
wire [15:0] value_4_5;
wire [15:0] value_6_7;
wire [15:0] value_8_9;

wire [3:0]index_0_1;
wire [3:0]index_2_3;
wire [3:0]index_4_5;
wire [3:0]index_6_7;
wire [3:0]index_8_9;

assign value_0_1 =  class0 > class1 ? class0 : class1;
assign value_2_3 =  class2 > class3 ? class2 : class3;
assign value_4_5 =  class4 > class5 ? class4 : class5;
assign value_6_7 =  class6 > class7 ? class6 : class7;
assign value_8_9 =  class8 > class9 ? class8 : class9;

assign index_0_1 = class0 > class1 ? 4'b0:4'b1;
assign index_2_3 = class2 > class3 ? 4'd2:4'd3;
assign index_4_5 = class4 > class5 ? 4'd4:4'd5;
assign index_6_7 = class6 > class7 ? 4'd6:4'd7;
assign index_8_9 = class8 > class9 ? 4'd8:4'd9;

reg [15:0] value_0_1_r;
reg [15:0] value_2_3_r;
reg [15:0] value_4_5_r;
reg [15:0] value_6_7_r;
reg [15:0] value_8_9_r;

reg [3:0]index_0_1_r;
reg [3:0]index_2_3_r;
reg [3:0]index_4_5_r;
reg [3:0]index_6_7_r;
reg [3:0]index_8_9_r;
always@(posedge clk)begin
	value_0_1_r <= value_0_1;
	value_2_3_r <= value_2_3;
	value_4_5_r <= value_4_5;
	value_6_7_r <= value_6_7;
	value_8_9_r <= value_8_9;

	index_0_1_r <= index_0_1;
	index_2_3_r <= index_2_3;
	index_4_5_r <= index_4_5;
	index_6_7_r <= index_6_7;
	index_8_9_r <= index_8_9;
end

//--------------------------------- 
//Stage 2: Compare
//---------------------------------
wire [15:0]value_s2_0,value_s2_1,value_s2_2;
wire [3:0] index_s2_0,index_s2_1,index_s2_2;

assign value_s2_0 = value_0_1_r > value_2_3_r? value_0_1_r:value_2_3_r;
assign value_s2_1 = value_4_5_r > value_6_7_r? value_4_5_r:value_6_7_r;
assign value_s2_2 = value_8_9_r;

assign index_s2_0 = value_0_1_r > value_2_3_r? index_0_1_r:index_2_3_r;
assign index_s2_1 = value_4_5_r > value_6_7_r? index_4_5_r:index_6_7_r;
assign index_s2_2 = index_8_9_r;

reg [15:0]value_s2_0_r,value_s2_1_r,value_s2_2_r;
reg [3:0] index_s2_0_r,index_s2_1_r,index_s2_2_r;

always@(posedge clk)begin
	value_s2_0_r <= value_s2_0;
	value_s2_1_r <= value_s2_1;
	value_s2_2_r <= value_s2_2;

	index_s2_0_r <= index_s2_0;
	index_s2_1_r <= index_s2_1;
	index_s2_2_r <= index_s2_2;
end

//--------------------------------- 
//Stage 3: Compare
//---------------------------------
wire [15:0] value_s3_0,value_s3_1;
wire [3:0] index_s3_0,index_s3_1;

assign value_s3_0 = value_s2_0_r > value_s2_1_r? value_s2_0_r:value_s2_1_r;
assign value_s3_1 = value_s2_2_r;

assign index_s3_0 = value_s2_0_r > value_s2_1_r? index_s2_0_r:index_s2_1_r;
assign index_s3_1 = index_s2_2_r;

reg [15:0] value_s3_0_r,value_s3_1_r;
reg [3:0]  index_s3_0_r,index_s3_1_r;

always@(posedge clk)begin
	value_s3_0_r <= value_s3_0;
	value_s3_1_r <= value_s3_1;
	index_s3_0_r <= index_s3_0;
	index_s3_1_r <= index_s3_1;
end

//--------------------------------- 
//Stage 4: Compare
//---------------------------------
wire [15:0] value_s4_0;
wire [3:0] index_s4_0;

assign value_s4_0 = value_s3_0_r > value_s3_1_r? value_s3_0_r:value_s3_1_r;
assign index_s4_0 = value_s3_0_r > value_s3_1_r? index_s3_0_r:index_s3_1_r;


reg [15:0] value_s4_0_r;
reg [3:0]  index_s4_0_r;

always@(posedge clk)begin
	value_s4_0_r <= value_s4_0;
	index_s4_0_r <= index_s4_0;
end

//---------------------------------
//Register Done Signal
//---------------------------------
reg done_r1,done_r2,done_r3,done_r4;
always@(posedge clk)begin
	done_r1 <= get_class_start;
	done_r2 <= done_r1;
	done_r3 <= done_r2;
	done_r4 <= done_r3;

end
//output to external
assign class_value = value_s4_0_r;
assign class_index = index_s4_0_r;
assign get_class_done = done_r4;

endmodule
