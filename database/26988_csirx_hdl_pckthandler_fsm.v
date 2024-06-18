// This program was cloned from: https://github.com/stevenbell/csirx
// License: GNU Lesser General Public License v3.0

/* Packet Handler FSM: this module represents the core logic of the packet handler FSM
 * Gedeon Nyengele <nyengele@stanford.edu>
 * 08 January 2018
 */

/* 
 * @param rxbyteclkhs the byte clock to synchronize to (input)
 * @param reset an acitve-high synchronous reset signal (input)
 * @param data_stream csi payload stream
 * @param ph_stream packet header data (WC_MSB, WC_LSB, DATA_ID)
 * @param ph_select defines whether to select the ph_stream or not
 * @param valid_stream determines if either stream is valid
 * @param ecc_error determines if the PH has an error
 * @param out_stream csi payload stream to next module
 * @param frame_active determines if we're either about to/in the middle TX'ing a frame
 * @param frame_valid signals that a frame output is in progress
 * @param lines_per_frame is the number of image lines per frame
 * @param last_packet indicates whether the packet on out_stream is the last packet for the frame
 */
module pckthandler_fsm(rxbyteclkhs, reset, data_stream, ph_stream, ph_select, valid_stream, ecc_error,
	out_stream, frame_active, frame_valid, lines_per_frame, last_packet
);
	
	/* parameters */
	parameter DATA_STREAM_WIDTH		= 16;
	parameter PH_STREAM_WIDTH		= 24;

	/* inputs */
	input rxbyteclkhs, reset, ph_select, valid_stream, ecc_error;
	input [(DATA_STREAM_WIDTH-1):0] data_stream;
	input [(PH_STREAM_WIDTH-1):0] ph_stream;
	input [31:0] lines_per_frame;

	/* outputs */	
	output frame_active, frame_valid;	
	output [(DATA_STREAM_WIDTH-1):0] out_stream;
	output last_packet;

	/* internal decl */
	reg frame_active, frame_valid;
	reg [(DATA_STREAM_WIDTH-1):0] out_stream;

	wire sof_id, eof_id, pxdata_id;
	assign sof_id = (ph_stream[5:0] == 6'h00) ? 1'b1 : 1'b0;
	assign eof_id = (ph_stream[5:0] == 6'h01) ? 1'b1 : 1'b0;
	assign pxdata_id = (ph_stream[5:0] == 6'h2B) ? 1'b1 : 1'b0;  // 2B = RAW10

	reg [1:0] state;
	reg [15:0] packet_size, byte_count;
	reg [31:0] line_count;
	reg last_line, last_out;

	parameter PH_DECODE	= 2'b00;
	parameter WAIT_EOT	= 2'b01;
	parameter REC_DATA	= 2'b10;
	
	assign last_packet = last_out;

	always @(posedge rxbyteclkhs) begin
		if(reset) begin
			frame_active <= 0;
			frame_valid <= 0;
			packet_size <= 0;
			byte_count <= 0;
			out_stream <= 0;
			line_count <= 0;
			last_line <= 0;
			last_out <= 0;
			state <= PH_DECODE;
		end
		else begin
			case(state)
				PH_DECODE: 	begin
					if(valid_stream && ph_select && ~ecc_error) begin
						if(sof_id) begin
							frame_active <= 1'b1;
							line_count <= 0;
							last_line <= 0;
							last_out <= 0;
							state <= PH_DECODE;
						end
						else if(eof_id) begin
							frame_active <= 1'b0;
							line_count <= 0;
                            last_line <= 0;
                            last_out <= 0;
							state <= PH_DECODE;
						end
						else if(pxdata_id) begin
							if(frame_active) begin
								byte_count <= 0;
								packet_size <= ph_stream[23:8];
								line_count <= line_count + 1;
								if((line_count + 1) == lines_per_frame) last_line <= 1'b1;
								else last_line <= 1'b0;
								state <= REC_DATA;
							end
							else state <= WAIT_EOT;
						end
					end
					else if(valid_stream && ~ph_select) state <= WAIT_EOT;
					else state <= PH_DECODE;
				end
				WAIT_EOT: begin
					if(valid_stream) state <= WAIT_EOT;
					else state <= PH_DECODE;
				end
				REC_DATA: 	begin
					if(byte_count < packet_size) begin
						frame_valid <= 1'b1;
						out_stream <= data_stream;
						byte_count <= byte_count + 2;
						state <= REC_DATA;
						if(((byte_count + 2) >= packet_size) && last_line) last_out <= 1'b1;
						else last_out <= 1'b0;
					end
					else begin
						frame_valid <= 1'b0;
						out_stream <= 0;
						last_out <= 0;
						state <= WAIT_EOT;
					end
				end				
			endcase
		end
	end	

endmodule