// This program was cloned from: https://github.com/stevenbell/csirx
// License: GNU Lesser General Public License v3.0

/* Packet Header Finder: this module searches for the packet header in a stream of data
 * Gedeon Nyengele <nyengele@stanford.edu>
 * 08 January 2018
 */

/*
 * @param rxbyteclkhs the byte clock to synchrnize to (input)
 * @param reset an active-high synchronous reset signal (input)
 * @param din 16-bit word input. MSB = lane1_byte, LSB = lane2_byte (input)
 * @param din_valid defines if word_in is valid (input)
 * @param dout 32-bit output containing either  the packet header or forwarded data stream (output)
 *             PH is formatted as [ECC, WC_MSB, WC_LSB, DATA_ID]
 *             forwarded data stream format: MSB = lane1_byte, LSB = lane2_byte
 * @param dout_valid defines if dout is valid (output)
 * @param ph_select defines whether 'dout' contains the PH or not
 */
 
module ph_finder(rxbyteclkhs, reset, din, din_valid, dout, dout_valid, ph_select);

	/* inputs */
	input wire rxbyteclkhs, reset;
	input wire [15:0] din; // { lane0[7:0], lane1[7:0] }
	input wire din_valid;

	/* outputs */
	output reg [31:0] dout;
	output reg dout_valid;
	output reg ph_select;

	/* internal decl */
	parameter STATE_HALF_PH	= 2'b00;
	parameter STATE_FULL_PH	= 2'b01;
	parameter STATE_BYPASS	= 2'b10;

	reg [7:0] prev_byte1, prev_byte2;
	reg [1:0] state;

	/* state machine */
	always @(posedge rxbyteclkhs) begin
		if(reset | ~din_valid) begin
			dout <= 32'd0;
			dout_valid <= 1'b0;
			ph_select <= 1'b0;
			prev_byte1 <= 8'd0;
			prev_byte2 <= 8'd0;
			state <= STATE_HALF_PH;
		end
		else begin
			case(state)
				STATE_HALF_PH: begin
					prev_byte1 <= din[15:8];
					prev_byte2 <= din[7:0];
					state <= STATE_FULL_PH;
				end

				STATE_FULL_PH: begin
					dout <= {din[7:0], din[15:8], prev_byte2, prev_byte1};
					dout_valid <= 1'b1;
					ph_select <= 1'b1;
					state <= STATE_BYPASS;
				end

				STATE_BYPASS: begin
					dout <= {din, 16'd0};
					ph_select <= 1'b0;
					state <= STATE_BYPASS;
				end

				default: begin
					dout <= 32'd0;
					dout_valid <= 1'b0;
					ph_select <= 1'b0;
				end
			endcase
		end
	end
endmodule
