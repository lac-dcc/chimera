`default_nettype none
`timescale 1ps/1ps

module TX_MUX # (
	// RX/TX interface data width
	parameter C_DATA_WIDTH = 64,
	parameter TCQ = 1,
	// TSTRB width
	parameter KEEP_WIDTH = C_DATA_WIDTH / 8
)(
	input wire clk,
	input wire sys_rst,
	// AXIS Output
	input wire s_axis_tx_tready,
	output wire [C_DATA_WIDTH-1:0] s_axis_tx_tdata,
	output wire [KEEP_WIDTH-1:0] s_axis_tx_tkeep,
	output wire s_axis_tx_tlast,
	output wire s_axis_tx_tvalid,
	output wire tx_src_dsc,
	// AXIS Input 1
	input wire s_axis_tx1_req,
	output reg s_axis_tx1_ack = 1'b0,
	output wire s_axis_tx1_tready,
	input wire [C_DATA_WIDTH-1:0] s_axis_tx1_tdata,
	input wire [KEEP_WIDTH-1:0] s_axis_tx1_tkeep,
	input wire s_axis_tx1_tlast,
	input wire s_axis_tx1_tvalid,
	input wire tx1_src_dsc,
	// AXIS Input 2
	input wire s_axis_tx2_req,
	output reg s_axis_tx2_ack = 1'b0,
	output wire s_axis_tx2_tready,
	input wire [C_DATA_WIDTH-1:0] s_axis_tx2_tdata,
	input wire [KEEP_WIDTH-1:0] s_axis_tx2_tkeep,
	input wire s_axis_tx2_tlast,
	input wire s_axis_tx2_tvalid,
	input wire tx2_src_dsc
);

always @(posedge clk) begin
	if (sys_rst) begin
		s_axis_tx1_ack <= 1'b0;
		s_axis_tx2_ack <= 1'b0;
	end else begin
		case ({s_axis_tx2_ack, s_axis_tx1_ack})
		2'b00: begin
			if (s_axis_tx1_req)
				s_axis_tx1_ack <= 1'b1;
			else if (s_axis_tx2_req)
				s_axis_tx2_ack <= 1'b1;
			else begin
				s_axis_tx1_ack <= 1'b0;
				s_axis_tx2_ack <= 1'b0;
			end
		end
		2'b01: begin
			if (~s_axis_tx1_req) begin
				s_axis_tx1_ack <= 1'b0;
				if (s_axis_tx2_req)
					s_axis_tx2_ack <= 1'b1;
			end
		end
		2'b10: begin
			if (~s_axis_tx2_req) begin
				s_axis_tx2_ack <= 1'b0;
				if (s_axis_tx1_req)
					s_axis_tx1_ack <= 1'b1;
			end
		end
		2'b11: begin
		end
		endcase
	end
end

assign s_axis_tx1_tready= s_axis_tx_tready & s_axis_tx1_ack;
assign s_axis_tx2_tready= s_axis_tx_tready & s_axis_tx2_ack;
assign s_axis_tx_tdata  = s_axis_tx2_ack ? s_axis_tx2_tdata:  s_axis_tx1_tdata;
assign s_axis_tx_tkeep  = s_axis_tx2_ack ? s_axis_tx2_tkeep:  s_axis_tx1_tkeep;
assign s_axis_tx_tlast  = s_axis_tx2_ack ? s_axis_tx2_tlast:  s_axis_tx1_tlast;
assign s_axis_tx_tvalid = s_axis_tx2_ack ? s_axis_tx2_tvalid: s_axis_tx1_tvalid;
assign tx_src_dsc       = s_axis_tx2_ack ? tx2_src_dsc:       tx1_src_dsc;


endmodule // TX_MUX
`default_nettype wire
