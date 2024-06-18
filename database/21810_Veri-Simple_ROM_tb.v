// This program was cloned from: https://github.com/Mariam-Katamashvili/Veri-Simple
// License: MIT License

module tb();
	// Inputs
	reg [1:0] address;
	reg sel;
	
	// Outputs
	wire [7:0] data;
	
	// Instantiate the Unit Under Test (UUT)
	rom uut (
		.address(address),
		.sel(sel),
		.data(data)
	);
	
	initial begin
		address = 0;
		sel = 0;
		#10;
		sel = 1'b1;
		#10
		address = 1;
		#10;
		address = 2;
		#10;
		address = 3;
		#10;
		address = 4;
		#10;
	end
	
endmodule 