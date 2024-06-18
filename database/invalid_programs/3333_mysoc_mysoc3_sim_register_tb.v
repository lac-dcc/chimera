// This program was cloned from: https://github.com/cmdc0de/mysoc
// License: MIT License

`include "register.v"

`timescale 1ns/1ns

module regtb();

	reg  we, sel, rstn;
	reg clk;
	reg [15:0] inData;
	wire [15:0] outData;

	parameter W = 16;

	register #(.WIDTH(W)) r0 (.clk(clk),.we(we),.sel(sel),.rstn(rstn),.inData(inData),.outData(outData));
	always #1 clk=~clk;


	initial begin
		$dumpfile("regtb.vcd");
		$dumpvars(0,regtb);
		$display("start: resetting register");

		//reset
		//we<=1;sel<=1;rstn<=0;inData<=16'b101010101010101010101010;clk<=0;
		we<=1;sel<=1;rstn<=0;inData<=16'b1010101010101010;clk<=0;
		#5;
		$display("time=%0t rstn=0x%0h we=0x%0h sel=0x%0h indata=0x%0b outData=0x%0b"
				  ,$time,rstn,we,sel,inData,outData);
		$display("write to register");
		we<=0;sel<=0;rstn<=1;
		#5;
		$display("time=%0t rstn=0x%0h we=0x%0h sel=0x%0h indata=0x%0b outData=0x%0b"
				  ,$time,rstn,we,sel,inData,outData);
		$display("output from regsiter");
		we<=1;
		#5;
		$display("time=%0t rstn=0x%0h we=0x%0h sel=0x%0h indata=0x%0b outData=0x%0b"
				  ,$time,rstn,we,sel,inData,outData);
		sel<=1;
		#5;
		$display("output to HIZ");
		$display("time=%0t rstn=0x%0h we=0x%0h sel=0x%0h indata=0x%0b outData=0x%0b"
				  ,$time,rstn,we,sel,inData,outData);
		$finish;
	end
endmodule

