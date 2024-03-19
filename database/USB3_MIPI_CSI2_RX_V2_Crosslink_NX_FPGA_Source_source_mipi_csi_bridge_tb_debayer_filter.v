`timescale 1ns/1ns

module tb_debayer_filter();
	reg clk;
	reg reset;
	reg line_valid;
	wire [63:0]bytes_o;
	wire unpacked_valid;
	wire [119:0]rgb_output;
	wire output_valid;
	wire [63:0] yuv_data;
	wire is_yuv_valid;
	
	wire [31:0]data_out;
	wire lsync_out;
	reg out_clock;
	reg frame_sync;
wire reset_g;
//GSR GSR_INST (.GSR (reset_g));
PUR PUR_INST (.PUR (reset_g)); 

GSR 
GSR_INST (
	.GSR_N(1'b1),
	.CLK(1'b0)
);

debayer_filter ins1(	.clk_i(clk),
						.reset_i(reset),
						.line_valid_i(line_valid),
						.data_i(bytes_o),
						.data_valid_i(unpacked_valid),
						.output_valid_o(output_valid),
						.output_o(rgb_output));

rgb_to_yuv rgb_to_yuv1(.clk_i(clk),
					   .reset_i(reset),
					   .rgb_i(rgb_output),
					   .rgb_valid_i(output_valid),
					   .yuv_o(yuv_data),
					   .yuv_valid_o(is_yuv_valid));

output_reformatter out_reformat1(
								 .clk_i(clk),
								 .line_sync_i(line_valid),
								 .output_clk_i(out_clock),
								 .data_i(yuv_data),
								 .data_in_valid_i(is_yuv_valid),
								 .output_o(data_out),
								 .output_valid_o(lsync_out),
								 .frame_sync_i(frame_sync));
								 
reg bytes_valid;
reg  [31:0]bytes_i;
wire synced;



mipi_rx_raw_depacker ins2(	.clk_i(clk),
						.packet_type_i(3'd3),
						.data_valid_i(bytes_valid),
						.data_i(bytes_i),
						.output_valid_o(unpacked_valid),
						.output_o(bytes_o));

task sendbytes;
	input [31:0]bytes;
	begin
	bytes_i = bytes;
	clk = 1'b0;
	out_clock = 1'b0;
	#10
	out_clock = 1'b1;
	#10
	out_clock = 1'b0;
	#10
	out_clock = 1'b1;
	#10
	out_clock = 1'b0;
	clk = 1'b1;
	#10
	out_clock = 1'b1;
	#10;
	end
endtask

initial begin
		clk = 1'b0;
		out_clock = 1'b0;
		line_valid = 1'h0;
		bytes_valid = 4'h0;
		frame_sync = 0;
		reset = 1'h1;
		sendbytes(32'h0);
		reset = 1'h0;
		#50
		frame_sync = 1;
		#10;
		sendbytes(32'h0);
		sendbytes(32'h0);
			sendbytes(32'h00000000);
		sendbytes(32'h00000000);
		sendbytes(32'h00000000);
		sendbytes(32'h00000000);
		sendbytes(32'h00000000);
		sendbytes(32'h00000000);
		sendbytes(32'h00000000);
		bytes_valid = 1'h1;
		line_valid = 1'h1;
		sendbytes(32'h12345678);
		sendbytes(32'h00BCDEF0);
		sendbytes(32'h12005678);
		sendbytes(32'h9ABC00F0);
		sendbytes(32'hBBBBBB00);
		
		sendbytes(32'h12345678);
		sendbytes(32'h00BCDEF0);
		sendbytes(32'h12005678);
		sendbytes(32'h9ABC00F0);
		sendbytes(32'hAAAAAA00);
		
		sendbytes(32'h12345678);
		sendbytes(32'h00BCDEF0);
		sendbytes(32'h12005678);
		sendbytes(32'h9ABC00F0);
		sendbytes(32'hDDDDDD00);		
		bytes_valid = 1'h0;
		line_valid = 1'h0;
		sendbytes(32'h00000000);
		sendbytes(32'h00000000);
		sendbytes(32'h00000000);
		sendbytes(32'h00000000);
		sendbytes(32'h00000000);
		sendbytes(32'h00000000);
		sendbytes(32'h00000000);
		sendbytes(32'h00000000);
				
		sendbytes(32'h0);
		sendbytes(32'h0);
		bytes_valid = 1'h1;
		line_valid = 1'h1;
		sendbytes(32'h12345678);
		sendbytes(32'h00BCDEF0);
		sendbytes(32'h12005678);
		sendbytes(32'h9ABC00F0);
		sendbytes(32'hBBBBBB00);
		
		sendbytes(32'h12345678);
		sendbytes(32'h00BCDEF0);
		sendbytes(32'h12005678);
		sendbytes(32'h9ABC00F0);
		sendbytes(32'hAAAAAA00);
		
		sendbytes(32'h12345678);
		sendbytes(32'h00BCDEF0);
		sendbytes(32'h12005678);
		sendbytes(32'h9ABC00F0);
		sendbytes(32'hDDDDDD00);		
		bytes_valid = 1'h0;
		line_valid = 1'h0;
		
				sendbytes(32'h00000000);
		sendbytes(32'h00000000);
		sendbytes(32'h00000000);
		sendbytes(32'h00000000);
		sendbytes(32'h00000000);
		sendbytes(32'h00000000);
		sendbytes(32'h00000000);
		sendbytes(32'h00000000);
				sendbytes(32'h0);
		sendbytes(32'h0);
		bytes_valid = 1'h1;
		line_valid = 1'h1;
		sendbytes(32'h12345678);
		sendbytes(32'h00BCDEF0);
		sendbytes(32'h12005678);
		sendbytes(32'h9ABC00F0);
		sendbytes(32'hBBBBBB00);
		
		sendbytes(32'h12345678);
		sendbytes(32'h00BCDEF0);
		sendbytes(32'h12005678);
		sendbytes(32'h9ABC00F0);
		sendbytes(32'hAAAAAA00);
		
		sendbytes(32'h12345678);
		sendbytes(32'h00BCDEF0);
		sendbytes(32'h12005678);
		sendbytes(32'h9ABC00F0);
		sendbytes(32'hDDDDDD00);		
		bytes_valid = 1'h0;
		line_valid = 1'h0;
		
		
						sendbytes(32'h00000000);
		sendbytes(32'h00000000);
		sendbytes(32'h00000000);
		sendbytes(32'h00000000);
		sendbytes(32'h00000000);
		sendbytes(32'h00000000);
		sendbytes(32'h00000000);
		sendbytes(32'h00000000);
				sendbytes(32'h0);
		sendbytes(32'h0);
		bytes_valid = 1'h1;
		line_valid = 1'h1;
		sendbytes(32'h12345678);
		sendbytes(32'h00BCDEF0);
		sendbytes(32'h12005678);
		sendbytes(32'h9ABC00F0);
		sendbytes(32'hBBBBBB00);
		
		sendbytes(32'h12345678);
		sendbytes(32'h00BCDEF0);
		sendbytes(32'h12005678);
		sendbytes(32'h9ABC00F0);
		sendbytes(32'hAAAAAA00);
		
		sendbytes(32'h12345678);
		sendbytes(32'h00BCDEF0);
		sendbytes(32'h12005678);
		sendbytes(32'h9ABC00F0);
		sendbytes(32'hDDDDDD00);		
		bytes_valid = 1'h0;
		line_valid = 1'h0;
		
						sendbytes(32'h00000000);
		sendbytes(32'h00000000);
		sendbytes(32'h00000000);
		sendbytes(32'h00000000);
		sendbytes(32'h00000000);
		sendbytes(32'h00000000);
		sendbytes(32'h00000000);
		sendbytes(32'h00000000);
				sendbytes(32'h0);
		sendbytes(32'h0);
		bytes_valid = 1'h1;
		line_valid = 1'h1;
		sendbytes(32'h12345678);
		sendbytes(32'h00BCDEF0);
		sendbytes(32'h12005678);
		sendbytes(32'h9ABC00F0);
		sendbytes(32'hBBBBBB00);
		
		sendbytes(32'h12345678);
		sendbytes(32'h00BCDEF0);
		sendbytes(32'h12005678);
		sendbytes(32'h9ABC00F0);
		sendbytes(32'hAAAAAA00);
		
		sendbytes(32'h12345678);
		sendbytes(32'h00BCDEF0);
		sendbytes(32'h12005678);
		sendbytes(32'h9ABC00F0);
		sendbytes(32'hDDDDDD00);		
		bytes_valid = 1'h0;
		line_valid = 1'h0;
		
								sendbytes(32'h00000000);
		sendbytes(32'h00000000);
		sendbytes(32'h00000000);
		sendbytes(32'h00000000);
		sendbytes(32'h00000000);
		sendbytes(32'h00000000);
		sendbytes(32'h00000000);
		sendbytes(32'h00000000);
				sendbytes(32'h0);
		sendbytes(32'h0);
		bytes_valid = 1'h1;
		line_valid = 1'h1;
		sendbytes(32'h12345678);
		sendbytes(32'h00BCDEF0);
		sendbytes(32'h12005678);
		sendbytes(32'h9ABC00F0);
		sendbytes(32'hBBBBBB00);
		
		sendbytes(32'h12345678);
		sendbytes(32'h00BCDEF0);
		sendbytes(32'h12005678);
		sendbytes(32'h9ABC00F0);
		sendbytes(32'hAAAAAA00);
		
		sendbytes(32'h12345678);
		sendbytes(32'h00BCDEF0);
		sendbytes(32'h12005678);
		sendbytes(32'h9ABC00F0);
		sendbytes(32'hDDDDDD00);		
		bytes_valid = 1'h0;
		line_valid = 1'h0;
		
								sendbytes(32'h00000000);
		sendbytes(32'h00000000);
		sendbytes(32'h00000000);
		sendbytes(32'h00000000);
		sendbytes(32'h00000000);
		sendbytes(32'h00000000);
		sendbytes(32'h00000000);
		sendbytes(32'h00000000);
				sendbytes(32'h0);
		sendbytes(32'h0);
		bytes_valid = 1'h1;
		line_valid = 1'h1;
		sendbytes(32'h12345678);
		sendbytes(32'h00BCDEF0);
		sendbytes(32'h12005678);
		sendbytes(32'h9ABC00F0);
		sendbytes(32'hBBBBBB00);
		
		sendbytes(32'h12345678);
		sendbytes(32'h00BCDEF0);
		sendbytes(32'h12005678);
		sendbytes(32'h9ABC00F0);
		sendbytes(32'hAAAAAA00);
		
		sendbytes(32'h12345678);
		sendbytes(32'h00BCDEF0);
		sendbytes(32'h12005678);
		sendbytes(32'h9ABC00F0);
		sendbytes(32'hDDDDDD00);		
		bytes_valid = 1'h0;
		line_valid = 1'h0;
		#10;
		frame_sync = 0;
end
	
endmodule 