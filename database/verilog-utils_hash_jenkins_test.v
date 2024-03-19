`timescale 1ns / 1ps
`define EOF 32'hFFFF_FFFF
`define NULL 0

////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
// Design Name:   jenkins
// Module Name:   jenkins_test.v
// Project Name:  fix
////////////////////////////////////////////////////////////////////////////////

module jenkins_test;

	// Inputs
	reg CLOCK;
	reg sample;
	reg [7:0] value;

	// Outputs
	wire [31:0] hash;
	wire complete;

	// Instantiate the Unit Under Test (UUT)
	jenkins uut (
		.CLOCK(CLOCK),
		.sample(sample),
		.value(value),
		.hash(hash),
		.complete(complete)
	);


	always #10 CLOCK = ~CLOCK;
	integer file;
	integer r;
	reg [7:0] i = 0;
	reg [31:0] chash, result;
	reg [7:0] clen;
	reg [12*8-1:0] chars;

	initial begin

		 $dumpfile("bin/ohash.lxt");
		 $dumpvars(0,uut);

		// Initialize Inputs
		CLOCK = 1;
		sample = 0;
		value = 0;



		// open stimulus table
 		file = $fopen("hash/jenkins.csv", "r");
        if (file == `NULL) begin
        	$display("can't read test cases");
        	$finish_and_return(1);
        end
        // Wait 100 ns for global reset to finish
  		#100;
        r = $fscanf(file,"%s\n", chars);	// header row

        while (1) begin
            r = $fscanf(file,"%d,%x,%s\n", clen, chash, chars);
            if ( r == `EOF) begin
                #100 $finish;
            end else if (r != 3) begin	// truncated read
            	$display("bad read %d %x %s", r, clen, chash, chars);
                $finish_and_return(1);
            end
            // $display("Test: %d %x %s", clen, chash, chars);
            for (i = clen+1; i != 0; i = i - 1) begin
    			#20 value <= (i != 1) ? chars[(i-2)*8 +: 8] : 0;
    			sample <= i != 1;
    			 // $display("  %d %d", i, clen);
    		end
    		wait(complete);
    		result <= hash;	// latch immediately
    		#200 $display("Hashed: '%s' length:%d expected:%h got:%h", chars, clen, chash, result);
    		if (result != chash) begin
    		   $finish_and_return(2);
    		end
		end
		$finish;

	end

endmodule

