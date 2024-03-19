`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 12/23/2020 04:52:52 AM
// Design Name:
// Module Name: tb_xgmii_fifo
// Project Name:
// Target Devices:
// Tool Versions:
// Description:
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns/100ps

module tb_xgmii_fifo();

reg wr_rst;
reg wr_clk;
reg [63:0] wr_data;
reg [ 7:0] wr_ctrl;

reg rd_clk;
wire [63:0] rd_data;
wire [ 7:0] rd_ctrl;

xgmii_fifo dut(
    .wr_rst(wr_rst),
    .wr_clk(wr_clk),
    .wr_data(wr_data),
    .wr_ctrl(wr_ctrl),

    .rd_clk(rd_clk),
    .rd_data(rd_data),
    .rd_ctrl(rd_ctrl)
);

initial
begin
    wr_data = 64'h0707070707070707;
    wr_ctrl =  8'hff;
    wr_rst = 0;
    #8;
    #30;
    wr_rst = 1;
    #30;
    wr_rst = 0;
    #300;
    wr_ctrl =  8'h01;
    #10;
    wr_data = 64'h123456789abcdef0;
    wr_ctrl =  8'h02;
    #10;
    wr_ctrl =  8'h03;
    #10;
    wr_ctrl =  8'h04;
    #10;
    wr_ctrl =  8'h05;
    #10;
    wr_ctrl =  8'h06;
    #10;
    wr_ctrl =  8'h07;
    #10;
    wr_ctrl =  8'hff;
    #10;
    wr_data = 64'h0707070707070707;
end

always
begin
    wr_clk = 1'b1;
    #5;
    wr_clk = 1'b0;
    #5;
end

always
begin
    rd_clk = 1'b1;
    #5;
    rd_clk = 1'b0;
    #5;
end

endmodule
