`timescale 1ns / 1ps
`define NULL 0

// Engineer:	Chris Shucksmith
// Description:
//	Utility to replay a packets from a pcap file over a 64-bit
//  Avalon-ST bus, for use in network test benches.
//    http://wiki.wireshark.org/Development/LibpcapFileFormat
//
//  $fread(mem, fid) parameter ordering seems Icarus specific :-/

module pcapparser_10gbmac
	#(
		parameter pcap_filename = "none",
		parameter ipg = 32
	) (
		input pause,
		output available,

		output reg  [63:0] aso_out_data,      //       out.data
        input  wire        aso_out_ready,     //         .ready
        output reg         aso_out_valid = 0, //         .valid
        output reg         aso_out_sop = 0,   //         .startofpacket
        output reg  [2:0]  aso_out_empty = 0, //         .empty
        output reg         aso_out_eop = 0,   //         .endofpacket
        output reg  [5:0]  aso_out_error = 0, //         .error
        input  wire        clk_out,           // clock_out.clk

		output [7:0] pktcount,
		output reg newpkt = 0,
		output reg pcapfinished = 0
	);

	// regs
	reg available = 0;
	reg [7:0] pktcount = 0;	// line up with Wireshark GUI

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
			$display("can't read pcap input %s", pcap_filename);
			$finish_and_return(1);
		end

		// Initialize Inputs
		$display("PCAP: %m reading from %s", pcap_filename);

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

	always @(posedge clk_out)
	begin
		if (eof == 0 && diskSz == 0 && countIPG == 0) begin
			// read packet header
			// fields of interest are U32 so bear in mind the byte ordering when assembling
			// multibyte fields
			r = $fread(packet_header, file);
			if (swapped == 1) begin
				pktSz  = {packet_header[11],packet_header[10],packet_header[9] ,packet_header[8] };
				diskSz = {packet_header[15],packet_header[14],packet_header[13],packet_header[12]};
			end else begin
				pktSz =  {packet_header[ 8],packet_header[ 9],packet_header[10],packet_header[11]};
				diskSz = {packet_header[12],packet_header[13],packet_header[14],packet_header[15]};
			end

			$display("PCAP:  packet %0d: incl_length %0d orig_length %0d", pktcount, pktSz, diskSz );

			available <= 1;
			newpkt <= 1;
			pktcount <= pktcount + 1;
			countIPG <= ipg;	// reload interpacket gap counter

			aso_out_eop <= 0;
			aso_out_sop <= 0;
			aso_out_valid <= 0;

			// bytes before EOP should be "07070707FB555555", MAC framing check digit
			aso_out_data <= 64'h07070707FB555555;
		end else if ( diskSz > 0) begin

			// packet content is byte-aligned, no swapping required
			if (~pause) begin

				newpkt <= 0;
				diskSz <= (diskSz > 7) ? diskSz - 8 : 0;

				aso_out_empty <= (diskSz > 8) ? 0 : 8 - diskSz;
				aso_out_sop <= newpkt;
				aso_out_eop <= diskSz <= 8;


				aso_out_data[7*8+:8] <= diskSz > 7 ? $fgetc(file) : 8'bx;
				aso_out_data[6*8+:8] <= diskSz > 6 ? $fgetc(file) : 8'bx;
				aso_out_data[5*8+:8] <= diskSz > 5 ? $fgetc(file) : 8'bx;
				aso_out_data[4*8+:8] <= diskSz > 4 ? $fgetc(file) : 8'bx;
				aso_out_data[3*8+:8] <= diskSz > 3 ? $fgetc(file) : 8'bx;
				aso_out_data[2*8+:8] <= diskSz > 2 ? $fgetc(file) : 8'bx;
				aso_out_data[1*8+:8] <= diskSz > 1 ? $fgetc(file) : 8'bx;
				aso_out_data[0*8+:8] <= diskSz > 0 ? $fgetc(file) : 8'bx;
				// $display("diskSz %d", diskSz);

				eof = $feof(file);
				if ( eof != 0 || diskSz == 1) begin
					available <= 0;
				end else begin
					aso_out_valid <= 1;
				end
			end else begin
				aso_out_valid <= 0;
			end

		end else if (countIPG > 0) begin
			countIPG <= countIPG - 1;
			aso_out_eop <= 0;
			aso_out_sop <= 0;
			aso_out_valid <= 0;
			// byte after EOP should be "FD", MAC framing check digit
			aso_out_data <= (aso_out_empty == 0 && aso_out_eop) ? 64'hFDxxxxxxxxxxxxxx : 64'bx;

		end else if (eof != 0) begin
			pcapfinished <= 1;	// terminal loop here
			aso_out_eop <= 0;
			aso_out_sop <= 0;
			aso_out_valid <= 0;
			aso_out_data <= 64'bx;
		end


	end

endmodule
