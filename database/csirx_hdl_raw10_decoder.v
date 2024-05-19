// This program was cloned from: https://github.com/stevenbell/csirx
// License: GNU Lesser General Public License v3.0

/* RAW10 data decoder
 * Gedeon Nyengele <nyengele@stanford.edu>
 * 22 January 2018
 */

/*
 * @param rxbyteclkhs byte clock to synchronize to
 * @param reset an active-high reset line
 * @param data_in 16-bit input data (byte1, byte2)
 * @param data_out 64-bit (4pixels: [pixel4, pixel3, pixel2, pixel1])
 * @param out_valid 1-bit output to indicate whether the 64-bit output is valid or not
 * @param last_packet_in input signal to indicate if data_in contains the last packet for the frame
 * @param last_packet_out output signal to indicate that data_out contains the last packet for the frame
 */

module raw10_decoder(rxbyteclkhs, reset, data_in, frame_active, frame_valid, data_out, out_valid, last_packet_in, last_packet_out);

	// parameters
	parameter IN_DATA_WIDTH		= 16;
	parameter OUT_DATA_WIDTH	= 64;

	// inputs
	input wire rxbyteclkhs, reset, frame_active, frame_valid;
	input [(IN_DATA_WIDTH-1):0] data_in;
	input last_packet_in;

	// outputs
	output out_valid;
	output [(OUT_DATA_WIDTH-1):0] data_out;
	output reg last_packet_out;

	// internal decls
	reg out_valid;
	reg [(OUT_DATA_WIDTH-1):0] data_out;

	reg [7:0] buff[3:0];
	reg [2:0] state;

	wire valid = frame_active & frame_valid;
	
	always @(posedge rxbyteclkhs) begin
	   if(reset | ~valid) last_packet_out <= 0;
	   else last_packet_out <= last_packet_in;
	end

	always @(posedge rxbyteclkhs) begin
		if(reset | ~valid) begin
			out_valid <= 0;
			data_out <= 0;
			state <= 3'b000;
		end
		else begin
			case(state)
				3'b000:	begin
					data_out <= 0;
					out_valid <= 0;
					buff[0] <= data_in[15:8];
					buff[1] <= data_in[7:0];
					state <= 3'b001;
				end
				3'b001:	begin
					buff[2] <= data_in[15:8];
					buff[3] <= data_in[7:0];
					state <= 3'b010;
				end
				3'b010:	begin
					data_out <=	{ 6'd0, buff[3], data_in[15:14],	// 4th pixel data (16 bits)
								  6'd0, buff[2], data_in[13:12],	// 3rd pixel data (16 bits)
								  6'd0, buff[1], data_in[11:10],	// 2nd pixel data (16 bits)
								  6'd0, buff[0], data_in[9:8]		// 1st pixel data (16 bits)
								};
					out_valid <= 1'b1;
					buff[0] <= data_in[7:0];
					state <= 3'b011;
				end
				3'b011: begin
					data_out <= 0;
					out_valid <= 0;
					buff[1] <= data_in[15:8];
					buff[2] <= data_in[7:0];
					state <= 3'b100;
				end
				3'b100:	begin
					data_out <=	{ 6'd0, data_in[15:8], data_in[7:6],	// 4th pixel data (16 bits)
								  6'd0, buff[2], data_in[5:4],			// 3rd pixel data (16 bits)
								  6'd0, buff[1], data_in[3:2],			// 2nd pixel data (16 bits)
								  6'd0, buff[0], data_in[1:0]			// 1st pixel data (16 bits)
								};
					out_valid <= 1'b1;
					state <= 3'b000;
				end
			endcase
		end
	end
endmodule