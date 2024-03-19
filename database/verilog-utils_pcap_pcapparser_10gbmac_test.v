`timescale 1ns / 1ps
`define NULL 0

// Engineer:	Chris Shucksmith
// Description:
//	Utility to replay a pcap file and record the result. It should yield the same
//  packets with capture times updated to simulation times. Compare tcpdump output
//  with times supressed to check correctness.

module pcapparser_10gbmac_test;

	// Inputs
	reg CLOCK = 0;
	reg paused = 1;
	wire available;
	wire [7:0] pktcount;
	wire pcapfinished;

	wire [63:0] aso_out_data;
    wire        aso_out_ready;
    wire        aso_out_valid;
    wire        aso_out_sop;
    wire [2:0]  aso_out_empty;
    wire        aso_out_eop;
    wire [5:0]  aso_out_error;

	reg reset = 1;

	// Instantiate the Unit Under Test (UUT)
	pcapparser_10gbmac #(
		.pcap_filename( "pcap/tcp-4846-connect-disconnect.pcap" ),
		.ipg(4)
	) pcap (
		.clk_out(CLOCK),
		.pause(paused),
		.available(available),
		.pktcount(pktcount),
		.pcapfinished(pcapfinished),

		// Avalon-ST output bus
		.aso_out_data(aso_out_data),
		.aso_out_ready(aso_out_ready),
		.aso_out_valid(aso_out_valid),
		.aso_out_sop(aso_out_sop),
		.aso_out_empty(aso_out_empty),
		.aso_out_eop(aso_out_eop),
		.aso_out_error(aso_out_error)
	);

	pcapwriter_10gbmac #(
		.pcap_filename( "bin/tcp-4846-connect-disconnect.output.pcap" )
	) pcapwr (
		.clk_in(CLOCK),

		// Avalon-ST output bus
		.aso_in_data(aso_out_data),
		.aso_in_ready(aso_out_ready),
		.aso_in_valid(aso_out_valid),
		.aso_in_sop(aso_out_sop),
		.aso_in_empty(aso_out_empty),
		.aso_in_eop(aso_out_eop),
		.aso_in_error(aso_out_error)
	);


	always #10 CLOCK = ~CLOCK;
	// always #100 paused = ~paused;

	integer i = 0;

	initial begin

		$dumpfile("bin/pcap10gb.lxt");
		$dumpvars(0);

		// Wait 100 ns for global reset to finish
		#400;
		reset <= 0;
		#80;
		// reset <= 1;
		#600;
		paused <= 0;

		while (~pcapfinished ) begin
			$display("stream: %8d %x %d %c%c%c%01x %x %c%c%c%c%c%c%c%c", i, paused, pktcount, aso_out_valid ? "v" : " ", aso_out_sop ? "S" : ".", aso_out_eop ? "E":".", aso_out_empty,
					aso_out_data,
					printable(aso_out_data[0*8+:8]), printable(aso_out_data[1*8+:8]), printable(aso_out_data[2*8+:8]), printable(aso_out_data[3*8+:8]),
					printable(aso_out_data[4*8+:8]), printable(aso_out_data[5*8+:8]), printable(aso_out_data[6*8+:8]), printable(aso_out_data[7*8+:8])
				);

			#20
			i = i+1;
		end

		$finish;

	end

	function [7:0] printable;
        input [7:0] a;
        begin
            printable = (a === 8'bx) ? "x" : ((a > 31 && a < 127) ? a : ".");
        end
    endfunction

endmodule

