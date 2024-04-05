`timescale 1ns / 1ps

// Test bench for serial binary-to-bcd converter
// Chris Shucksmith

module bin2bcd_serial_test;

	// Inputs
	reg CLOCK = 0;
	reg [7:0] value = 0;	// 4 digits
	reg start = 0;
	// Outputs
	wire [4*4-1:0] out;
	wire done;

	integer i;
    reg [8*5:0] cmpbuf;
    reg [4*4-1:0] lastOut;


	// Instantiate the Unit Under Test (UUT)
	bin2bcd_serial #(
        .BCD_DIGITS(4),
        .BINARY_BITS(8)
       ) uut (
	    .clock(CLOCK),
		.start(start),
		.binary_in(value),
		.bcd_out(out),
		.done(done)
	);
	always #10 CLOCK = ~CLOCK;

    wire [3:0] units    = out[3:0];
    wire [3:0] tens     = out[7:4];
    wire [3:0] hundreds = out[11:8];
    wire [3:0] thou     = out[15:12];

	initial begin

		 $dumpfile("bin/obin2bcd_serial.lxt");
		 $dumpvars(0,uut);

        @(posedge CLOCK) $display("starting");
		// Add stimulus here
		for (i = 0; i <= 110; i = i + 1) begin
    		@(posedge CLOCK)
    		value <= i;
    		start <= 1;
    		@(posedge CLOCK)
    		start <= 0;
            @(posedge CLOCK)
    		wait(done);
            @(posedge CLOCK)

    		if (i < 7 | i > 99) $display(" %d  : %d == %d %d %d %d", i, value, thou, hundreds, tens, units);
    		// check that the concatenation of the ascii bytes above is
    		// the same as fprintf to an array
            $sformat(cmpbuf, "%05d", value);
            lastOut <= out;

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

            @(posedge CLOCK);
            // check hold
            if (out != lastOut) begin
                $display("hold mismatch: wanted %04h, got %04h ", out, lastOut);
                $finish_and_return(2);
            end

            @(posedge CLOCK);
            // check hold
            if (out != lastOut) begin
                $display("hold mismatch: wanted %04h, got %04h ", out, lastOut);
                $finish_and_return(2);
            end

    	end

        $display("*OK*");
        $finish;

	end

endmodule

