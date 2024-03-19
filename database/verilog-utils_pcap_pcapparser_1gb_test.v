`timescale 1ns / 1ps
`define NULL 0

// Company:
// Engineer:
// Description:
//	Utility to replay a pcap file byte at a time
//

module PcapParser_test;

	// Inputs
	reg CLOCK = 0;
	reg paused = 1;
	wire available;
	wire [7:0] pktcount;
	wire streamvalid;
	wire [7:0] stream;
	wire pcapfinished;

	// Instantiate the Unit Under Test (UUT)
	PcapParser #(
		.pcap_filename( "pcap/tcp-4846-connect-disconnect.pcap" )
	) pcap (
		.CLOCK(CLOCK),
		.pause(paused),
		.available(available),
		.datavalid(streamvalid),
		.data(stream),
		.pktcount(pktcount),
		.pcapfinished(pcapfinished)
	);

	always #10 CLOCK = ~CLOCK;
	always #100 paused = ~paused;

	integer i;

	initial begin

		$dumpfile("bin/pcap.lxt");
		$dumpvars(0);

		// Initialize Inputs
		$display("Reading from pcap");

		// Wait 100 ns for global reset to finish
		#100;

		// Add stimulus here
		while (~pcapfinished ) begin
			// $display("stream: %8d %x %d %x %x %c", i, paused, pktcount, streamvalid, stream, stream);
			#20
			i = i+1;
		end

		$finish;

	end

endmodule

