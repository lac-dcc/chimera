// This program was cloned from: https://github.com/cmdc0de/mysoc
// License: MIT License

`include "dff.v"


`timescale 1ns/1ns

module dfftb();

	reg d;
	reg  re, we, rstn;
	reg clk;
	wire q;

	dff d1 (.d(d), .re(re), .we(we), .rstn(rstn), .clk(clk), .q(q));
	always #1 clk=~clk;


	initial begin
		$dumpfile("test.vcd");
		$dumpvars(0,dfftb);
		//$monitor("[monitor] time=%0t rstn=0x%0h d=0x%0h q=0x%0h re=0x%0h we=0x%0h", $time,rstn, d,q,re,we);
		$display("start: resetting flipflop");
		//reset
		re<=1; we<=1; rstn<=0; clk<=0; d<=0;
		#5;
		$display("time=%0t rstn=0x%0h d=0x%0h q=0x%0h re=0x%0h we=0x%0h", $time,rstn, d,q,re,we);
		$display("read from 'd' signal '1'");
		//read in 1 from 'd'
		rstn<=1; d<=1; re<=0;
		#5;
		$display("time=%0t rstn=0x%0h d=0x%0h q=0x%0h re=0x%0h we=0x%0h", $time,rstn, d,q,re,we);
		$display("stop reading");
		re<=1;we<=1;
		#5;
		$display("time=%0t rstn=0x%0h d=0x%0h q=0x%0h re=0x%0h we=0x%0h", $time,rstn, d,q,re,we);
		//now q should have a value
		$display("write flipflop value out to q");
		we<=0;
		#5;
		$display("time=%0t rstn=0x%0h d=0x%0h q=0x%0h re=0x%0h we=0x%0h", $time,rstn, d,q,re,we);
		$display("turn off write enable");
		we<=1;
		#5;
		$display("time=%0t rstn=0x%0h d=0x%0h q=0x%0h re=0x%0h we=0x%0h", $time,rstn, d,q,re,we);
		$display("read and write, write should be a 1 and should read in a 0");
		re<=0;we<=0;d<=0;
		#5; 
		$display("time=%0t rstn=0x%0h d=0x%0h q=0x%0h re=0x%0h we=0x%0h", $time,rstn, d,q,re,we);
		$display("turn off read and set 'd' = 1");
		re<=1;d<=1;
		#5; 
		$display("time=%0t rstn=0x%0h d=0x%0h q=0x%0h re=0x%0h we=0x%0h", $time,rstn, d,q,re,we);
		$finish;
	end
endmodule
