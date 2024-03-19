`timescale 1ns/1ns

/*
MIPI CSI RX to Parallel Bridge (c) by Gaurav Singh www.CircuitValley.com

MIPI CSI RX to Parallel Bridge is licensed under a
Creative Commons Attribution 3.0 Unported License.

You should have received a copy of the license along with this
work.  If not, see <http://creativecommons.org/licenses/by/3.0/>.
*/

/*
MIPI CSI 4 Lane Receiver To Parallel Bridge 
Tested with Lattice MachXO3LF-6900 with IMX219 Camera 
Takes MIPI Clock and 4 Data lane as input convert into Parallel YUV output 
Ouputs 32bit YUV data with Frame sync, lsync and pixel clock 
*/

module mipi_bridge(	reset_in,
					mipi_clk_p_in,
					mipi_clk_n_in,
					mipi_data_p_in,
					mipi_data_n_in,

					pclk_o, 
					data_o,
					fsync_o,
					lsync_o,
					
					frame_sync_in,
					line_sync_in
					);
					
parameter MIPI_LANES = 4;
input frame_sync_in;
input line_sync_in;
					
input reset_in;
input mipi_clk_p_in;
input mipi_clk_n_in;
input [MIPI_LANES-1:0]mipi_data_p_in;
input [MIPI_LANES-1:0]mipi_data_n_in;

output pclk_o;
output [31:0]data_o;
output fsync_o;
output lsync_o;


wire osc_clk;

wire reset ;



wire output_clock; 
wire mipi_byte_clock; //byte clock from mipi phy



wire [3:0]is_byte_valid;
wire is_lane_aligned_valid;
wire is_decoded_valid;
wire is_unpacked_valid;
wire is_rgb_valid;
wire is_yuv_valid;

wire mipi_out_clk;

wire [31:0]mipi_data_raw;
wire [31:0]byte_aligned;
wire [31:0]lane_aligned;
wire [31:0]decoded_data;
wire [2:0]packet_type;
wire [15:0]packet_length;
wire [63:0]unpacked_data;
wire [191:0]rgb_data;
wire [63:0]yuv_data;

wire byte_aligner_reset;
//wire frame_sync_in;
assign reset = !reset_in;


assign byte_aligner_reset = line_sync_in;

oscillator oscillator_inst0(.hf_out_en_i(1'b1), 
							 .hf_clk_out_o(mipi_out_clk), 
							 .lf_clk_out_o(osc_clk));
wire ready;
	
mipi_csi_phy mipi_csi_phy_inst0(	.sync_clk_i(osc_clk), 
									.sync_rst_i(reset), 
								   // .lmmi_clk_i(osc_clk), 
									//.lmmi_resetn_i(), 
									//.lmmi_wdata_i(), 
									//.lmmi_wr_rdn_i(), 
									//.lmmi_offset_i(), 
									//.lmmi_request_i(), 
									//.lmmi_ready_o(), 
									//.lmmi_rdata_o(), 
									//.lmmi_rdata_valid_o(), 
									.hs_rx_en_i(1'b1), 
									.hs_rx_data_o(mipi_data_raw), 
									//.hs_rx_data_sync_o(), 
									.lp_rx_en_i(1'b0), 
									.lp_rx_data_p_o(),//byte_aligner_reset), 
									.lp_rx_data_n_o(), 
									.lp_rx_clk_p_o(),//frame_sync_in), 
									.lp_rx_clk_n_o(ready), 
									.pll_lock_i(1'b1), 
									.clk_p_io(mipi_clk_p_in), 
									.clk_n_io(mipi_clk_n_in), 
									.data_p_io(mipi_data_p_in), 
									.data_n_io(mipi_data_n_in), 
									.pd_dphy_i(1'b0), 
									.clk_byte_o(mipi_byte_clock), 
									.ready_o()) ;
									//.oclk(mipi_out_clk), //double to mipi_clock
							 				  
							  
mipi_rx_byte_aligner mipi_rx_byte_aligner_0(	.clk_i(mipi_byte_clock),
									.reset_i(byte_aligner_reset),
									.byte_i(mipi_data_raw[7:0]),
									.byte_o( byte_aligned[7:0]),
									.byte_valid_o(is_byte_valid[0]));
					  
					  
mipi_rx_byte_aligner mipi_rx_byte_aligner_1(	.clk_i(mipi_byte_clock),
									.reset_i(byte_aligner_reset),
									.byte_i(mipi_data_raw[15:8]),
									.byte_o(byte_aligned[15:8]),
									.byte_valid_o(is_byte_valid[1]));
					  

mipi_rx_byte_aligner mipi_rx_byte_aligner_2(	.clk_i(mipi_byte_clock),
									.reset_i(byte_aligner_reset),
									.byte_i(mipi_data_raw[23:16]),
									.byte_o( byte_aligned[23:16]),
									.byte_valid_o(is_byte_valid[2]));
					  
mipi_rx_byte_aligner mipi_rx_byte_aligner_3(	.clk_i(mipi_byte_clock),
									.reset_i(byte_aligner_reset),
									.byte_i(mipi_data_raw[31:24]),
									.byte_o( byte_aligned[31:24]),
									.byte_valid_o(is_byte_valid[3]));

mipi_rx_lane_aligner mipi_rx_lane_aligner(	.clk_i(mipi_byte_clock),
									.reset_i(byte_aligner_reset),
									.bytes_valid_i(is_byte_valid),
									.byte_i(byte_aligned),
									.lane_valid_o(is_lane_aligned_valid),
									.lane_byte_o(lane_aligned));


mipi_csi_packet_decoder mipi_csi_packet_decoder_0(	.clk_i(mipi_byte_clock),
													.data_valid_i(is_lane_aligned_valid),
													.data_i(lane_aligned),
													.output_valid_o(is_decoded_valid),
													.data_o(decoded_data),
													.packet_length_o(packet_length),
													.packet_type_o(packet_type));


mipi_rx_raw_depacker mipi_rx_raw_depacker_0(.clk_i(mipi_byte_clock),
												.data_valid_i(is_decoded_valid),
												.data_i(decoded_data),
												.packet_type_i(packet_type),
												.output_o(unpacked_data),
												.output_valid_o(is_unpacked_valid));


debayer_filter debayer_filter_0(.clk_i(mipi_byte_clock),
								.reset_i(!frame_sync_in),
								.line_valid_i(is_decoded_valid),
								.data_i(unpacked_data),
								.data_valid_i(is_unpacked_valid),
								.output_o(rgb_data),
								.output_valid_o(is_rgb_valid));

rgb_to_yuv rgb_to_yuv_0(.clk_i(mipi_byte_clock),
					    .reset_i(!frame_sync_in),
					    .rgb_i(rgb_data),
					    .rgb_valid_i(is_rgb_valid),
					    .yuv_o(yuv_data),
					    .yuv_valid_o(is_yuv_valid));


output_reformatter out_reformatter_0(  .clk_i(mipi_byte_clock),
									 .line_sync_i(is_decoded_valid),
									 .frame_sync_i(frame_sync_in),
									 .output_clk_i(mipi_out_clk),
									 .data_i(yuv_data),
									 .data_in_valid_i(is_yuv_valid),
									 .output_o(data_o),
									 .output_valid_o(lsync_o));

//assign pclk_o = mipi_byte_clock;
assign pclk_o = frame_sync_in? osc_clk: mipi_out_clk ; //output clock always available, slow when there is no mipi frame , fast from mipi_clk when mipi_clock is active
assign fsync_o = !frame_sync_in;					  //activate fsync as soon as mipi frame is active

endmodule