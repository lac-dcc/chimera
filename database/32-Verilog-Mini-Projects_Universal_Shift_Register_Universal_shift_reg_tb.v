`timescale 1ns / 1ps
module Universal_shift_reg_tb;

	// Inputs
	reg clk;
	reg clear;
	reg [2:0] S;
	reg [3:0] I;

	// Outputs
	wire [3:0] O;

	// Instantiate the Unit Under Test (UUT)
	Universal_shift_reg uut (
		.O(O), 
		.clk(clk), 
		.clear(clear), 
		.S(S), 
		.I(I)
	);

always #50 clk = ~clk ;

	initial begin

		clk = 1'b0;
		clear = 1'b1;
		I = 4'b1001;
		S = 3'b011;

		#10 clear = 1'b0;
		
		#50 clear = 1'b1;
			
		#140 S = 3'b100;
			  I = 4'b0000;
				
		#100 S = 3'b111;
			  
		#100 S = 3'b110;

		#100 S = 3'b101;		

	   #100 S = 3'b010;
		
		#100 S = 3'b001;
		
		#100 S = 3'b000;

	end
      
endmodule

