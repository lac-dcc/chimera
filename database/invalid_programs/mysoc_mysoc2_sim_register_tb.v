// This program was cloned from: https://github.com/cmdc0de/mysoc
// License: MIT License

`include "register.v"

`timescale 1ns/1ns

module regtb();

	reg  re, we, rstn;
	reg clk;
	wire data[15:0];

	register #(.WIDTH(16)) r0 (.clk(clk), .re(re), .we(we), .rstn(rstn), .data(data));
	always #1 clk=~clk;


	initial begin
		$dumpfile("regtb.vcd");
		$dumpvars(0,register);
		$display("start: resetting flipflop");

		//reset
		re<=1; we<=1; rstn<=0; clk<=0;
		data=16'h0;
		#5;
		$display("time=%0t rstn=0x%0h re=0x%0h we=0x%0h data=0x%0h", $time,rstn,re,we,data);
		#5;
		$finish;
	end
endmodule
