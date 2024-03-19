`timescale 1ns / 1ps
`define NULL 0

////////////////////////////////////////////////////////////////////////////////
// Engineer:		Chris Shucksmith
// Description:		basic TCP test bench
//
//
////////////////////////////////////////////////////////////////////////////////

module Tcp_test;

	// Inputs
	reg CLOCK = 0;
	reg paused = 1;
	wire available;
	wire [7:0] pktcount;
	wire streamvalid;
	wire [7:0] stream;
	wire pcapfinished;
	wire newpkt;

	wire [7:0] tcpdata1, tcpdata2;
	wire tcpdataValidA;
	wire tcpdataValidB;

	// Instantiate the Unit Under Test (UUT)
	PcapParser #(
		.pcap_filename( "pcap/tcp-4846-connect-disconnect.pcap" )
	) pcap (
		.CLOCK(CLOCK),
		.pause(paused),
		.available(available),
		.datavalid(streamvalid),
		.data(stream),
		.pcapfinished(pcapfinished),
		.newpkt( newpkt )
	);

	Tcp #(
		.port( 80 ),
		.mac( 48'hC471FEC856BF )
	) tcp1 (
		.CLOCK(CLOCK),
		.tcpA_src_port(16'd57284),
		.tcpA_src_ip( { 8'd10, 8'd210, 8'd50, 8'd28 } ),
		.tcpA_dst_port(16'd4846),
		.tcpA_dst_ip( { 8'd10, 8'd210, 8'd144, 8'd11 } ),
		.tcpB_src_port(16'd0),
		.tcpB_src_ip( { 8'd0, 8'd0, 8'd0, 8'd0 } ),
		.tcpB_dst_port(16'd0),
		.tcpB_dst_ip( { 8'd0, 8'd0, 8'd0, 8'd0 } ),
		.tcpC_src_port(16'd0),
		.tcpC_src_ip( { 8'd0, 8'd0, 8'd0, 8'd0 } ),
		.tcpC_dst_port(16'd0),
		.tcpC_dst_ip( { 8'd0, 8'd0, 8'd0, 8'd0 } ),
		.tcpD_src_port(16'd0),
		.tcpD_src_ip( { 8'd0, 8'd0, 8'd0, 8'd0 } ),
		.tcpD_dst_port(16'd0),
		.tcpD_dst_ip( { 8'd0, 8'd0, 8'd0, 8'd0 } ),
		.dataValid( streamvalid ),
		.data( stream ),
		.newpkt( newpkt ),

		.outDataMatchA( tcpdataValidA ),
		.outData( tcpdata1 )
	);


	Tcp #(
		.port( 80 ),
		.mac( 48'hC471FEC856BF )
	) tcp2 (
		.CLOCK(CLOCK),
		.tcpA_src_port(16'd57284),
		.tcpA_src_ip( { 8'd0, 8'd0, 8'd0, 8'd0 } ),
		.tcpA_dst_port(16'd0),
		.tcpA_dst_ip( { 8'd0, 8'd0, 8'd0, 8'd0 } ),
		.tcpB_src_port(16'd57284),
		.tcpB_src_ip( { 8'd10, 8'd210, 8'd50, 8'd28 } ),
		.tcpB_dst_port(16'd4846),
		.tcpB_dst_ip( { 8'd10, 8'd210, 8'd144, 8'd11 } ),
		.tcpC_src_port(16'd0),
		.tcpC_src_ip( { 8'd0, 8'd0, 8'd0, 8'd0 } ),
		.tcpC_dst_port(16'd0),
		.tcpC_dst_ip( { 8'd0, 8'd0, 8'd0, 8'd0 } ),
		.tcpD_src_port(16'd0),
		.tcpD_src_ip( { 8'd0, 8'd0, 8'd0, 8'd0 } ),
		.tcpD_dst_port(16'd0),
		.tcpD_dst_ip( { 8'd0, 8'd0, 8'd0, 8'd0 } ),
		.dataValid( streamvalid ),
		.data( stream ),
		.newpkt( newpkt ),

		.outDataMatchB( tcpdataValidB ),
		.outData( tcpdata2 )
	);



	always #10 CLOCK = ~CLOCK;

	integer i;
	integer acount, bcount;

	initial begin

		$dumpfile("bin/olittletoe.lxt");
		$dumpvars(0,tcp1, tcp2);
		acount = 0; bcount = 0;

		#100
		paused = 0;

		// Add stimulus here
		while (~pcapfinished ) begin
			// $display("stream: %8d %x %d %x %x %c", i, paused, pktcount, streamvalid, stream, stream);
			#20
			i = i+1;
		end

		if (acount != 1) begin
			$display(" tcp A - expected one output byte, got %d values last %x", acount, tcpdata1 );
			$finish_and_return(-1);
		end
		if (bcount != 1) begin
			$display(" tcp B - expected one output byte, got %d values last %x", bcount, tcpdata2 );
			$finish_and_return(-1);
		end


		$finish;

	end

	always @(posedge CLOCK)	begin
		if (tcpdataValidA) begin
			$display("tcpA: %x ", tcpdata1);
			acount = acount + 1;
			if (acount > 1 || tcpdata1 != 8'h20 ) begin
				$display(" tcp - expected one output byte, value 0x20, got %d values last %x", acount, tcpdata1 );
				$finish_and_return(-1);
			end
		end

		if (tcpdataValidB) begin
			$display("tcpB: %x ", tcpdata2);
			bcount = bcount + 1;
			if (bcount > 1 || tcpdata2 != 8'h20 ) begin
				$display(" tcp - expected one output byte, value 0x20, got %d values last %x", bcount, tcpdata2 );
				$finish_and_return(-1);
			end
		end
	end

endmodule

