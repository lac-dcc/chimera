`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Engineer:  Chris Shucksmith
//
////////////////////////////////////////////////////////////////////////////////

module serialMap_test;

	// Inputs
	reg CLOCK;
	reg query;
	reg [7:0] value;

	// Outputs
	wire [7:0] data;
	wire found;
	wire notfound;

	// Instantiate the Unit Under Test (UUT)
	serialMap uut (
	   .CLOCK(CLOCK),
		.query(query),
		.key(value),
		.data(data),
		.found(found),
		.notfound(notfound)
	);


   always #10 CLOCK = ~CLOCK;

	initial begin

		 $dumpfile("bin/ohashmap.lxt");
		 $dumpvars(0,uut);

		// Initialize Inputs
		CLOCK = 1;
		query = 0;
		value = 0;

		// Wait 100 ns for global reset to finish
		#100;

		// Add stimulus here
		#20
		query <= 1;
				value <= "V";
		#20		value <= "O";
		#20 	value <= "D";
		#20 	value <= ".";
		#20 	value <= "L";
		#20 	value <= 0;
		query <= 0;
		while (!found && !notfound) begin
			#20 query <= 0;
		end
		while (found && notfound) begin
			#20 query <= 0;
		end
		#40


		query <= 1;
				value <= "V";
		#20		value <= "O";
		#20 	value <= "P";
		#20 	value <= ".";
		#20 	value <= "L";
		#20 	value <= 0;
		query <= 0;
		while (!found && !notfound) begin
			#20 query <= 0;
		end
		while (found || notfound) begin
			#20 query <= 0;
		end

		#40

		#100
		$finish;

	end

endmodule

