`timescale 1ns / 1ps
`define NULL 0

// Engineer:	Chris Shucksmith
// Description:
//	Write packets from an Avalon-ST bus to a Wireshark compatible capture file.
//    http://wiki.wireshark.org/Development/LibpcapFileFormat
//
//  $fwrite and $fputc are not universally supported, works with Icarus Verilog

module pcapwriter_10gbmac
	#(
		parameter pcap_filename = "none",
		parameter pcap_buffsz = 9000
	) (
		input wire  [63:0] aso_in_data,      //       out.data
        output reg        aso_in_ready = 1,  //         .ready
        input wire         aso_in_valid,     //         .valid
        input wire         aso_in_sop,       //         .startofpacket
        input wire  [2:0]  aso_in_empty,     //         .empty
        input wire         aso_in_eop,       //         .endofpacket
        input wire  [5:0]  aso_in_error,     //         .error
        input wire         clk_in,
		output reg [7:0] pktcount = 0
	);

	// buffers for message
	reg [31:0] global_header [0:5]; // 6*32bit words = 24 bytes
	reg [31:0] packet_header [0:3]; // 3*32bits = 12 bytes
	reg [7:0] packet_buffer [0:pcap_buffsz];

	integer file = 0;
	integer r    = 0;
	integer eof  = 0;
	integer i    = 0;
	integer pktSz  = 0;
	integer diskSz = 0;

	wire [31:0] pcap_buffsz32 = pcap_buffsz;

	initial begin

		// open pcap file
		if (pcap_filename == "none") begin
			$display("pcap filename parameter not set");
			$finish_and_return(1);
		end

		file = $fopen(pcap_filename, "wb");
		if (file == `NULL) begin
			$display("can't open pcap file %s for writing!", pcap_filename);
			$finish_and_return(-1);
		end

		// Initialize Inputs
		$display("PCAP: %m writing to %s", pcap_filename);

		// write binary global_header
		// verilog can't write a vpiMemory to disk, so write bytes directly
		$fwrite(file, "%u", 32'ha1b2c3d4);  // .magic_number - Magic number A1B2C3D4
		$fwrite(file, "%u", 32'h00020004);  // .version major - major version (2), .version_minor - minor version (4)
		$fwrite(file, "%u", 32'd00000000);  // .thiszone - GMT to local correction (0)
		$fwrite(file, "%u", 32'd00000000);  // .sigfigs - Accuracy of timestamps (0)
		$fwrite(file, "%u", pcap_buffsz32); // .snaplen - Max length of captured packets (65k bytes)
		$fwrite(file, "%u", 32'h00000001);  // .network - data link type (Ethernet = 1)

	end

	// when we see packet data (sop & valid), write to a RAM. When we see SOP,
	// write header, flush the RAM to file and clear for next packet.
	// raise warnings about repeated SOP values, duplicate EOP values
	reg [63:0] timebuf = 0;
	wire [7:0] x = packet_buffer[i];
	always @(posedge clk_in)
	begin
		if (aso_in_valid) begin
			// write 8 bytes per cycle
			if (aso_in_sop & ~(pktSz == 0)) begin
				$display("duplicate SOP asserted at data byte %d", pktSz);
				$finish_and_return(-1);
			end
			if (~aso_in_sop & (pktSz == 0)) begin
				$display("valid data bye 0 did not come with SOP bit set");
				$finish_and_return(-1);
			end
			packet_buffer[pktSz+7] = aso_in_data[0*8+:8];
			packet_buffer[pktSz+6] = aso_in_data[1*8+:8];
			packet_buffer[pktSz+5] = aso_in_data[2*8+:8];
			packet_buffer[pktSz+4] = aso_in_data[3*8+:8];
			packet_buffer[pktSz+3] = aso_in_data[4*8+:8];
			packet_buffer[pktSz+2] = aso_in_data[5*8+:8];
			packet_buffer[pktSz+1] = aso_in_data[6*8+:8];
			packet_buffer[pktSz+0] = aso_in_data[7*8+:8];
			pktSz = ((aso_in_eop) ? 8 - aso_in_empty : 8) + pktSz;

			if (aso_in_eop) begin
				// finalise packet header values
				timebuf = $time;

				$fwrite(file, "%u", timebuf[63:32]); // ts_sec timestamp seconds
				$fwrite(file, "%u", timebuf[31:0]); 		// ts_usec timestamp microseconds
				$fwrite(file, "%u", pktSz > pcap_buffsz ? pcap_buffsz : pktSz);       // incl_len length bounded by global_header.snaplen
				$fwrite(file, "%u", pktSz);       // orig_len length observed on wire

				// now write bytes of packet
				for(i=0; i < pktSz; i=i+1) begin
					r = $fputc(x, file);
				end
				pktcount = pktcount + 1;

				$display("PCAP: wrote packet %0d: incl_length %0d orig_length %0d", pktcount, pktSz, diskSz );

				$fflush(file);

				pktSz = 0;
			end
		end

	end

endmodule
