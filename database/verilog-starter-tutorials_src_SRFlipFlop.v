module srff(sr,clk,q,qbar);
	input [1:0] sr;
	input clk;
	output q,qbar;
	reg q,qbar;

	always@(posedge clk)
	begin
	case(sr)
		2'b00:
			q = q;


		2'b01:
			q=0;

		2'b10:
			q=1;
	
		2'b11:
			q= 1'bz;
	endcase
	qbar = ~q;
	end 
endmodule

module test;
	reg [1:0] sr;
	reg clk;
	integer i;
	wire q,qbar;

	srff s(sr,clk,q,qbar);
	initial 
	begin
	$display("sr flip flop");
	$monitor("%b  %b %b \t %b %b",sr[1],sr[0],clk, q,qbar);
	$dumpfile("vcd/SRFlipFlop.vcd");
	$dumpvars(1,test);

		sr = 2'b00;
		#10

		sr = 2'b01;
		#10

		sr = 2'b10;
		#10
		sr = 2'b00;
		#10
		sr = 2'b11;
		#10
	$finish;
	end 

	initial begin
		clk = 0;
		for(i=0;i<20;i=i+1)
			#5 clk = ~clk;
	end

endmodule
