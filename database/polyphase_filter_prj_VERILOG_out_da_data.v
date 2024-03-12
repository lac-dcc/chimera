`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:20:26 05/23/2016 
// Design Name: 
// Module Name:    out_da_data 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module out_da_data(
    input clk_in,
    input rst_n,
    input [2:0] key,
    output reg [13:0] DA_value,
    output reg DA_clk,
	 output DA_reset_n
    );
assign DA_reset_n = rst_n;

//直接FIR滤波
wire [7:0] data_out1;
wire [7:0] data_out_up1;
wire data_clk1;
wire [7:0] fir_out1;
wire [7:0] fir_out_up1;
wire fir_clk1;
data_fir fir1 (
	.clk(clk_in),
	.fir_out(fir_out1),
	.data_out(data_out1),
	.rst_n(rst_n),
	.clk_data(data_clk1),
	.clk_fir(fir_clk1)
);
assign data_out_up1 = data_out1 + 8'd128;
assign fir_out_up1 = fir_out1 + 8'd128;

//多相FIR滤波
wire [7:0] data_out2;
wire [7:0] data_out_up2;
wire data_clk2;
wire [7:0] fir_out2;
wire [7:0] fir_out_up2;
wire fir_clk2;
polypase_fir fir2 (
	.clk(clk_in),
	.fir_out(fir_out2),
	.data_out(data_out2),
	.rst_n(rst_n),
	.clk_data(data_clk2),
	.clk_fir(fir_clk2)
);
assign data_out_up2 = data_out2 + 8'd128;//将数据抬高到0-256之间，负数会翻转波形
assign fir_out_up2 = fir_out2 + 8'd128;

//抽取器
wire [7:0] data_out3;
wire [7:0] data_out_up3;
wire data_clk3;
wire [7:0] fir_out3;
wire [7:0] fir_out_up3;
wire fir_clk3;
decimation fir3 (
	.clk(clk_in),
	.fir_out(fir_out3),
	.data_out(data_out3),
	.rst_n(rst_n),
	.clk_data(data_clk3),
	.clk_fir(fir_clk3)
);
assign data_out_up3 = data_out3 + 8'd128;
assign fir_out_up3 = fir_out3 + 8'd128;

//插值器
wire [7:0] data_out4;
wire [7:0] data_out_up4;
wire data_clk4;
wire [7:0] fir_out4;
wire [7:0] fir_out_up4;
wire fir_clk4;
interpolation fir4 (
	.clk(clk_in),
	.fir_out(fir_out4),
	.data_out(data_out4),
	.rst_n(rst_n),
	.clk_data(data_clk4),
	.clk_fir(fir_clk4)
);
assign data_out_up4 = data_out4 + 8'd128;
assign fir_out_up4 = fir_out4 + 8'd128;

//输出选择控制
always @(key or rst_n or data_out_up1 or fir_out_up1 or data_out_up2 or fir_out_up2 or data_out_up3 or fir_out_up3 or data_out_up4 or fir_out_up4) begin
   if(!rst_n)
   		DA_value <= 14'd0;
	else begin
		case (key)
		//直接FIR滤波
			3'd0: DA_value <= (data_out_up1<<6);
			3'd1: DA_value <= (fir_out_up1<<6);
		//多相FIR滤波
			3'd2: DA_value <= (data_out_up2<<6);
			3'd3: DA_value <= (fir_out_up2<<6);
		//抽取器
			3'd4: DA_value <= (data_out_up3<<6);
			3'd5: DA_value <= (fir_out_up3<<6);
		//插值器
			3'd6: DA_value <= (data_out_up4<<6);
			3'd7: DA_value <= (fir_out_up4<<6);
		endcase
	end//else
end//always
//输出时钟控制
always @(key or rst_n or data_clk1 or fir_clk1 or data_clk2 or fir_clk2 or data_clk3 or fir_clk3 or data_clk4 or fir_clk4) begin
   if(!rst_n)
   		DA_clk <= 1'd0;
	else begin
		case (key)
		//直接FIR滤波
			3'd0: DA_clk <= data_clk1;
			3'd1: DA_clk <= fir_clk1;
		//多相FIR滤波
			3'd2: DA_clk <= data_clk2;
			3'd3: DA_clk <= fir_clk2;
		//抽取器
			3'd4: DA_clk <= data_clk3;
			3'd5: DA_clk <= fir_clk3;
		//插值器
			3'd6: DA_clk <= data_clk4;
			3'd7: DA_clk <= fir_clk4;
		endcase
	end//else
end//always




endmodule
