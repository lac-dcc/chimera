// This program was cloned from: https://github.com/Mariam-Katamashvili/Veri-Simple
// License: MIT License

module tb();
	// Inputs
	reg clk;
	reg reset;

	// Outputs
   wire out;

   // Instantiate the Unit Under Test (UUT)
   clock_divider uut (
    .clk(clk),
    .reset(reset),
    .out(out)
	);

	always #1 clk = ~clk;
	
	initial begin
		clk = 1'b0;
		reset = 1'b1;
		#2;
		reset = 1'b0;
		#2;
	end
	 
endmodule 