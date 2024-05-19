// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License




`timescale 1ns / 1ps
`default_nettype none


module mnist_lut_net
		#(
			parameter	USER_WIDTH   = 8,
			parameter	INPUT_WIDTH  = 28*28,
			parameter	LAYER0_WIDTH = 8192,
			parameter	LAYER1_WIDTH = 4096,
			parameter	LAYER2_WIDTH = 1080,
			parameter	LAYER3_WIDTH = 180,
			parameter	LAYER4_WIDTH = 30,
			parameter	OUTPUT_WIDTH = 30,
			
			parameter	INIT_USER    = {USER_WIDTH{1'bx}}
		)
		(
			input  wire							reset,
			input  wire							clk,
			input  wire							cke,
			
			input  wire		[USER_WIDTH-1:0]	in_user,
			input  wire		[INPUT_WIDTH-1:0]	in_data,
			input  wire							in_valid,
			
			output  wire	[USER_WIDTH-1:0]	out_user,
			output  wire	[OUTPUT_WIDTH-1:0]	out_data,
			output  wire						out_valid
		);
	
	
	// input
	reg		[USER_WIDTH-1:0]	reg_in_user;
	reg		[INPUT_WIDTH-1:0]	reg_in_data;
	reg							reg_in_valid;
	always @(posedge clk) begin
		if ( reset ) begin
			reg_in_user  <= INIT_USER;
			reg_in_data  <= {INPUT_WIDTH{1'bx}};
			reg_in_valid <= 1'b0;
		end
		else if ( cke ) begin
			reg_in_user  <= in_user;
			reg_in_data  <= in_data;
			reg_in_valid <= in_valid;
		end
	end
	
	
	// layer 0
	wire	[LAYER0_WIDTH-1:0]		layer0_data;
	
	lutnet_layer0
		i_lutnet_layer0
			(
				.reset			(reset),
				.clk			(clk),
				.cke			(cke),
				
				.in_data		(reg_in_data),
				.out_data		(layer0_data)
			);
	
	reg		[USER_WIDTH-1:0]	layer0_user;
	reg							layer0_valid;
	always @(posedge clk) begin
		if ( reset ) begin
			layer0_user  <= INIT_USER;
			layer0_valid <= 1'b0;
		end
		else if  ( cke ) begin
			layer0_user  <= reg_in_user;
			layer0_valid <= reg_in_valid;
		end
	end
	
	
	
	// layer 1
	wire	[LAYER1_WIDTH-1:0]		layer1_data;
	
	lutnet_layer1
		i_lutnet_layer1
			(
				.reset			(reset),
				.clk			(clk),
				.cke			(cke),
				
				.in_data		(layer0_data),
				.out_data		(layer1_data)
			);
	
	reg		[USER_WIDTH-1:0]	layer1_user;
	reg							layer1_valid;
	always @(posedge clk) begin
		if ( reset ) begin
			layer1_user  <= INIT_USER;
			layer1_valid <= 1'b0;
		end
		else if  ( cke ) begin
			layer1_user  <= layer0_user;
			layer1_valid <= layer0_valid;
		end
	end
	
	
	
	// layer 2
	wire	[LAYER2_WIDTH-1:0]		layer2_data;
	
	lutnet_layer2
		i_lutnet_layer2
			(
				.reset			(reset),
				.clk			(clk),
				.cke			(cke),
				
				.in_data		(layer1_data),
				.out_data		(layer2_data)
			);
	
	reg		[USER_WIDTH-1:0]	layer2_user;
	reg							layer2_valid;
	always @(posedge clk) begin
		if ( reset ) begin
			layer2_user  <= INIT_USER;
			layer2_valid <= 1'b0;
		end
		else if  ( cke ) begin
			layer2_user  <= layer1_user;
			layer2_valid <= layer1_valid;
		end
	end
	
	
	// layer 3
	wire	[LAYER3_WIDTH-1:0]		layer3_data;
	
	lutnet_layer3
		i_lutnet_layer3
			(
				.reset			(reset),
				.clk			(clk),
				.cke			(cke),
				
				.in_data		(layer2_data),
				.out_data		(layer3_data)
			);
	
	reg		[USER_WIDTH-1:0]	layer3_user;
	reg							layer3_valid;
	always @(posedge clk) begin
		if ( reset ) begin
			layer3_user  <= INIT_USER;
			layer3_valid <= 1'b0;
		end
		else if  ( cke ) begin
			layer3_user  <= layer2_user;
			layer3_valid <= layer2_valid;
		end
	end
	
	
	// layer 4
	wire	[LAYER4_WIDTH-1:0]		layer4_data;
	
	lutnet_layer4
		i_lutnet_layer4
			(
				.reset			(reset),
				.clk			(clk),
				.cke			(cke),
				
				.in_data		(layer3_data),
				.out_data		(layer4_data)
			);
	
	reg		[USER_WIDTH-1:0]	layer4_user;
	reg							layer4_valid;
	always @(posedge clk) begin
		if ( reset ) begin
			layer4_user  <= INIT_USER;
			layer4_valid <= 1'b0;
		end
		else if  ( cke ) begin
			layer4_user  <= layer3_user;
			layer4_valid <= layer3_valid;
		end
	end
	
	
	assign out_user  = layer4_user;
	assign out_data  = layer4_data;
	assign out_valid = layer4_valid;
	
	
endmodule


`default_nettype wire

