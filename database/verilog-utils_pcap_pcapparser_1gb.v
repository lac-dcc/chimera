`timescale 1ns / 1ps
`define NULL 0

// Engineer:	Chris Shucksmith
// Description:
//	Utility to replay a packets from a pcap file over a single-byte bus
//  for use in network handling test benches.
//    http://wiki.wireshark.org/Development/LibpcapFileFormat
//
//  $fread(mem, fid) parameter ordering seems Icarus specific :-/
//

module PcapParser
	#(
		parameter pcap_filename = "none",
		parameter ipg = 32
	) (
		input CLOCK,
		input pause,
		output available,
		output datavalid,
		output [7:0] data,
		output [7:0] pktcount,
		output newpkt,
		output pcapfinished
	);

	// regs
	reg available = 0;
	reg datavalid = 0;
	reg [7:0] pktcount = 0;	// line up with Wireshark GUI
	reg [7:0] data = 0;
	reg pcapfinished = 0;
	reg newpkt = 0;

	// buffers for message
	reg [7:0] global_header [0:23];
	reg [7:0] packet_header [0:15];

	integer swapped = 0;
	integer toNanos = 0;
	integer file = 0;
	integer r    = 0;
	integer eof  = 0;
	integer i    = 0;
	integer pktSz  = 0;
	integer diskSz = 0;
	integer countIPG = 0;

	initial begin

		// open pcap file
		if (pcap_filename == "none") begin
			$display("pcap filename parameter not set");
			$finish_and_return(1);
		end

		file = $fopen(pcap_filename, "rb");
		if (file == `NULL) begin
			$display("can't read pcap input");
			$finish_and_return(1);
		end

		// read binary global_header
		// r = $fread(file, global_header);
		r = $fread(global_header,file);

		// check magic signature to determine byte ordering
		if (global_header[0] == 8'hD4 && global_header[1] == 8'hC3 && global_header[2] == 8'hB2) begin
			$display(" pcap endian: swapped, ms");
			swapped = 1;
			toNanos = 32'd1000000;
		end else if (global_header[0] == 8'hA1 && global_header[1] == 8'hB2 && global_header[2] == 8'hC3) begin
			$display(" pcap endian: native, ms");
			swapped = 0;
			toNanos = 32'd1000000;
		end else if (global_header[0] == 8'h4D && global_header[1] == 8'h3C && global_header[2] == 8'hb2) begin
			$display(" pcap endian: swapped, nanos");
			swapped = 1;
			toNanos = 32'd1;
		end else if (global_header[0] == 8'hA1 && global_header[1] == 8'hB2 && global_header[2] == 8'h3c) begin
			$display(" pcap endian: native, nanos");
			swapped = 0;
			toNanos = 32'd1;
		end else begin
			$display(" pcap endian: unrecognised format %02x%02x%02x%02x", global_header[0], global_header[1], global_header[2], global_header[3] );
			$finish_and_return(1);
		end
	end

	always @(posedge CLOCK)
	begin
		if (eof == 0 && diskSz == 0 && countIPG == 0) begin
			// read packet header
			// fields of interest are U32 so bear in mind the byte ordering when assembling
			// multibyte fields
			r = $fread(packet_header, file);
			eof = $feof(file);

			if ( eof == 0) begin
				if (swapped == 1) begin
					pktSz  = {packet_header[11],packet_header[10],packet_header[9] ,packet_header[8] };
					diskSz = {packet_header[15],packet_header[14],packet_header[13],packet_header[12]};
				end else begin
					pktSz =  {packet_header[ 8],packet_header[ 9],packet_header[10],packet_header[11]};
					diskSz = {packet_header[12],packet_header[13],packet_header[14],packet_header[15]};
				end

				$display("  packet %0d: incl_length %0d orig_length %0d eof %0d", pktcount, pktSz, diskSz, eof );

				available <= 1;
				newpkt <= 1;
				pktcount <= pktcount + 1;
				countIPG <= ipg;	// reload interpacket gap counter
			end
		end else if ( diskSz > 0) begin

			// packet content is byte-aligned, no swapping required
			if (~pause) begin
				newpkt <= 0;
				diskSz <= diskSz - 1;
				data <= $fgetc(file);
				eof = $feof(file);
				if ( eof != 0 || diskSz == 1) begin
					available <= 0;
				end else begin
					datavalid <= 1;
				end
			end else begin
				datavalid <= 0;
			end
		end else if (countIPG > 0) begin
			countIPG <= countIPG - 1;
		end else if (eof != 0) begin
			pcapfinished <= 1;	// terminal loop here
		end


	end

endmodule
