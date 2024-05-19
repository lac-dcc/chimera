// This program was cloned from: https://github.com/stevenbell/csirx
// License: GNU Lesser General Public License v3.0

/* Data-based testbench for pckthandler.v
 * This test pushes part of a real data dump from the byte aligner through.
 * We have to manually confirm that the output appears in whole frames and that
 * the header/footer is stripped off correctly.
 *
 * Steven Bell <sebell@stanford.edu>
 * 22 January 2018
 */

module pckthandler_tb2;

	reg clk, reset, din_valid;
  	reg [7:0] char_in; // Used to get data byte-by-byte
	reg [15:0] din;
	wire dout_valid, fr_active, fr_valid;
	wire [15:0] dout;

	reg [15:0] dout_exp;
	reg fr_valid_exp, fr_active_exp;
	integer infile, outfile, count, stat;

	pckthandler DUT(clk, reset, din, din_valid, dout, fr_active, fr_valid);

	// clock & reset
	initial begin
		clk = 0; reset = 1;
		repeat(4) #10 clk = ~clk;
		reset = 0;
		forever #10 clk = ~clk;
	end

	// files
	initial begin
		infile = $fopen("image4.bin", "r");
    	outfile = $fopen("image4_out.bin", "w");
	end


	// data provider
	initial begin
		din = 0; din_valid = 0;
    	count = 0;
		@(negedge reset); // Wait until (active-high) reset goes low

		while(!$feof(infile)) begin
			stat = $fread(char_in, infile); // Read the first input byte
			din[15:8] = char_in;
			stat = $fread(char_in, infile); // Read the second byte
			din[7:0] = char_in;

	      	din_valid = 1; // Always valid

	      	// Wait for the next cycle
				@(posedge clk);
	      	#1

		    // Write the output bits if they are valid
		    if(dout_valid) begin
		        $fwrite(outfile, "%s", dout);
		    end
	      
	      	// Print some progress
	      	if(count % 16'h1000 == 0) begin
	        	$display("count: %x  din: %x fr_active: %d, fr_valid: %d, dout_valid: %d",
	                count, din, fr_active, fr_valid, dout_valid);
	      	end
	      	count = count+1;
	    end
	    $fclose(infile);
	    $fclose(outfile);
	    $finish;
  	end
endmodule