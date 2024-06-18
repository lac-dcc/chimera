// This program was cloned from: https://github.com/RockingSNP/Verilog
// License: MIT License

module mux1b4to1(
	input a,b,c,d,
	input [1:0]s,
	output e);

	wire p,q,r,t;

	assign p = ((~s[1])&(~s[0]))&a;
	assign q = ((~s[1])&s[0])&b;
	assign r = (s[1]&(~s[0]))&c;
	assign t = (s[1]&s[0])&d;

	assign e = p|q|r|s;
endmodule

module tb_mux1b4to1(
	output reg a,b,c,d,
	output reg [1:0]s,
	input e
);
	initial begin
		$monitor("At time %t, when a=%b, b=%b, c=%b, d=%b, s=%b then e=%b",$time,a,b,c,d,s,e);
		{a,b,c,d,s}=6'b010100;
		#5 s=2'b01;
		#5 s=2'b10;
		#5 s=2'b11;
	end
endmodule

module wb;
	wire a,b,c,d,e;
	wire [1:0]s;
	initial begin
		$dumpfile("1bit_4to1_mux.vcd");
		$dumpvars(0,wb);
	end
	mux1b4to1 dut (a,b,c,d,s,e);
	tb_mux1b4to1 tb (a,b,c,d,s,e);
endmodule