// This program was cloned from: https://github.com/stevenbell/csirx
// License: GNU Lesser General Public License v3.0

/* Packet Handler: implements the csi protocol and part of the application-layer protocol
 * Gedeon Nyengele <nyengele@stanford.edu>
 * 08 January 2018
 */


/*
 * @param rxbyteclkhs byte clock to synchronize to (input)
 * @param reset active-high synchronous reset signal (input)
 * @param in_stream byte-and-lane-aligned input stream (input)
 * @param in_stream_valid determines whether the input stream is valid (input)
 * @param out_stream csi payload stream (output)
 * @param frame_active determines whether new frame either about to transmitted or in progress (output)
 * @param frame_valid determines whether a frame output is in progress (output)
 * @param lines_per_frame is the number of image lines per frame
 * @param last_packet indicates whether the packet on out_stream is the last packet for the frame
 */
module pckthandler(rxbyteclkhs, reset, in_stream, in_stream_valid, out_stream, frame_active, frame_valid, lines_per_frame, last_packet);
	
	/* parameters */
	parameter IN_STREAM_WIDTH		= 16;
	parameter OUT_STREAM_WIDTH		= IN_STREAM_WIDTH;

	/* inputs */
	input rxbyteclkhs, reset, in_stream_valid;
	input [(IN_STREAM_WIDTH-1):0] in_stream;
	input [31:0] lines_per_frame;

	/* outputs */
	output frame_active, frame_valid;
	output [(OUT_STREAM_WIDTH-1):0] out_stream;
	output last_packet;

	/* internal decl */
	wire [31:0] ph_finder_out;
	wire ph_finder_ph_select;
	wire ph_finder_valid, ecc_error;
	wire [23:0] ecc_ph;
	wire ph_finder_reset;

	assign ph_finder_reset = reset | (~in_stream_valid);

	// Packet Finder
	ph_finder phf(
		.rxbyteclkhs(rxbyteclkhs),
		.reset(ph_finder_reset),
		.din(in_stream),
		.din_valid(in_stream_valid),
		.dout(ph_finder_out),
		.dout_valid(ph_finder_valid),
		.ph_select(ph_finder_ph_select)
	);

	// ECC block
	ecc_block eccb(.PH_in(ph_finder_out), .PH_out(ecc_ph), .error(ecc_error));

	// Packet Handler FSM
	pckthandler_fsm fsm(
		.rxbyteclkhs(rxbyteclkhs),
		.reset(reset),
		.data_stream(ph_finder_out[31:16]),
		.ph_stream(ecc_ph),
		.ph_select(ph_finder_ph_select),
		.valid_stream(ph_finder_valid),
		.ecc_error(ecc_error),
		.out_stream(out_stream),
		.frame_active(frame_active),
		.frame_valid(frame_valid),
		.lines_per_frame(lines_per_frame),
		.last_packet(last_packet)
	);
endmodule