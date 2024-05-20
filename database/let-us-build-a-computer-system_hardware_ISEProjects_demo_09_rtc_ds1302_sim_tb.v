// This program was cloned from: https://github.com/Manistein/let-us-build-a-computer-system
// License: MIT License

`timescale 1ns/1ps
module tb;
parameter CLOCK_P = 10;
reg clk;
reg rst;
reg cmd_read;
reg cmd_write;
initial
begin
	clk = 0;
	rst = 1;
	cmd_read = 1'b0;
	cmd_write = 1'b0;
	#10 rst = 0;
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	@(posedge clk)
		cmd_write = 1'b1;
	
end
always#(CLOCK_P/2) clk = ~clk;
ds1302 DUT(
	.clk(clk),
	.rst(rst),
	.ds1302_ce(),
	.ds1302_sclk(),
	.ds1302_io(),
	
	.write_time_req(cmd_write),
	.write_second(8'h01),
	.write_minute(8'h02),
	.write_hour(8'h03),
	.write_date(8'h04),
	.write_month(8'h05),
	.write_week(8'h06),
	.write_year(8'h07),
	.read_time_req(cmd_read)
);
endmodule 