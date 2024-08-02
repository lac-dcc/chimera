// This program was cloned from: https://github.com/paollacq/Verilog
// License: MIT License

module tff(t,clk,q,qbar);
	input t;
	input clk;
	output q,qbar;
	reg q,qbar;

	always@(negedge clk)
	begin
	case(t)
		1'b0:
			q = 1;

		1'b1:
			q=0;
	endcase
	qbar = ~q;
	end 
endmodule

module test;
	reg t;
	reg clk;
	integer i;
	wire q,qbar;

	tff s(t,clk,q,qbar);
	initial 
	begin
	$display("t flip flop");
	$monitor("%b %b \t %b %b",t,clk, q,qbar);
	$dumpfile("vc/TFlipFlop.vcd");
	$dumpvars(1,test);

		t = 0;
		#10
		t = 1;
		#10

		t = 0;
		#10
		t = 1;
		#10
	$finish;
	end

	initial begin
		clk = 0;
		for(i=0;i<20;i=i+1)
			#2 clk = ~clk;

	end
 
endmodule