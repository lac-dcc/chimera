`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:  Chris Shucksmith
//
////////////////////////////////////////////////////////////////////////////////

module bin2bcd8_test;

	// Inputs
	reg CLOCK;
	reg [7:0] value;

	// Outputs
	wire [3:0] hundreds, tens, units;
	wire found;
	wire notfound;

	// testbench state
	reg [8:0] i;
	// reg [7:0] cmpbuf [0:5];
	reg [8*5:0] cmpbuf;


	// Instantiate the Unit Under Test (UUT)
	bin2bcd8 uut (
	    .A(value),
		.HUNDREDS(hundreds),
		.TENS(tens),
		.ONES(units)
	);

	initial begin

		 $dumpfile("bin/obin2bcd8.lxt");
		 $dumpvars(0,uut);

		// Initialize Inputs
		value = 0;

		// Wait 100 ns for global reset to finish
		#100;

		// Add stimulus here
		for (i = 0; i <= 260; i = i + 1) begin
    		#20 value <= i;
    		#20 $display("  %d  %d == %c %c %c", i, value, 48+hundreds, 48+tens, 48+units);

    		// check that the concatenation of the ascii bytes above is
    		// the same as fprintf to an array buffer
    		$sformat(cmpbuf, "%05d", value);

  			if ((cmpbuf[7:0] - 48) == units) begin
  			    //$display("ok: wanted ascii %h,  got value %h ", cmpbuf[7:0]-48, units);
  			end else begin
  				$display("mismatch: wanted ascii %h,  got value %h ", cmpbuf[7:0]-48, units);
    			$finish_and_return(2);
  			end
  			if ((cmpbuf[15:8] - 48) == tens) begin
  			    //$display("ok: wanted ascii %h,  got value %h ", cmpbuf[15:8]-48, tens);
  			end else begin
  				$display("mismatch: wanted ascii %h,  got value %h ", cmpbuf[15:8]-48, tens);
    			$finish_and_return(2);
  			end
  			if ((cmpbuf[23:16] - 48) == hundreds) begin
  			    //$display("ok: wanted ascii %h,  got value %h ", cmpbuf[23:16]-48, hundreds);
  			end else begin
  				$display("mismatch: wanted ascii %h,  got value %h ", cmpbuf[23:16]-48, hundreds);
    			$finish_and_return(2);
  			end


    	end
    	#100 $finish;

	end

endmodule

