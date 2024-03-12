`timescale 1ns / 1ps

module router_west_psum
 					 #( parameter DATA_BITWIDTH = 16,
						parameter ADDR_BITWIDTH_GLB = 10,
						parameter ADDR_BITWIDTH_SPAD = 9,
						
						parameter X_dim = 5,
                        parameter Y_dim = 3,
                        parameter kernel_size = 3,
                        parameter act_size = 5,
						parameter PSUM_READ_ADDR = 0,
						parameter PSUM_LOAD_ADDR = 0
					)
					
					(	input clk,
						input reset,
						input [3:0] router_mode,
						input [DATA_BITWIDTH*X_dim-1:0] north_data_i,
						input north_enable_i,
						output reg [DATA_BITWIDTH*X_dim-1:0] south_data_o,
						output reg south_enable_o,
						input [DATA_BITWIDTH*X_dim-1:0] west_data_i,
						input west_enable_i,
						output  [DATA_BITWIDTH-1:0] west_data_o,
						output  west_enable_o,
						input [DATA_BITWIDTH*X_dim-1:0] east_data_i,
						input east_enable_i,
						output reg [DATA_BITWIDTH*X_dim-1:0] east_data_o,
						// output reg east_enable_o,
						output  [ADDR_BITWIDTH_GLB-1 : 0] w_addr_glb_psum
					);
	reg [DATA_BITWIDTH*X_dim-1:0] data_out;
	// reg [DATA_BITWIDTH-1:0] west_data_i_inter[0:X_dim-1];
	// reg west_enable_i_inter;
	localparam ALL=0;
	localparam NORTH=1;
	localparam SOUTH=2;
	localparam WEST=3;
	localparam EAST=4;
	localparam EASTNORTH=5;
	localparam EASTSOUTH=6;
	localparam EASTWEST=7;
	localparam WESTNORTH=8;
	localparam WESTSOUTH=9;
	localparam WESTEAST = 10;
	localparam CLOSED=11;
	//reg for selecting data_out based on enable
	always@(*)
		begin:data_switch
			if(north_enable_i)
				data_out = north_data_i;
			else if(west_enable_i)
				data_out = west_data_i;
			// else if(east_enable_i)
			// 	data_out = east_data_i;
			else
				begin
					
				data_out ={(DATA_BITWIDTH*X_dim){1'b0}}; //Default value for verification
					
				end
		end	
	always@(*)
		begin: routing_reg
				
			case(router_mode)
			SOUTH:
			begin
				south_data_o=data_out;
				south_enable_o=1;
				east_data_o = {(DATA_BITWIDTH*X_dim){1'b0}};
			end
			EAST:
			begin
				south_data_o={(DATA_BITWIDTH*X_dim){1'b0}};
				south_enable_o=0;
				east_data_o = data_out;
			end
			EASTSOUTH:
			begin
				south_data_o=data_out;
				south_enable_o=1;
				east_data_o = data_out;
			end
			CLOSED:
			begin
				south_data_o={(DATA_BITWIDTH*X_dim){1'b0}};
				south_enable_o=0;
				east_data_o = {(DATA_BITWIDTH*X_dim){1'b0}};
			end
			default:
			begin
				south_data_o={(DATA_BITWIDTH*X_dim){1'b0}};
				south_enable_o=0;
				east_data_o = {(DATA_BITWIDTH*X_dim){1'b0}};
			end
			endcase
			
		end
	router_psum
	#(
		.DATA_BITWIDTH(DATA_BITWIDTH),
		.ADDR_BITWIDTH_GLB(ADDR_BITWIDTH_GLB),
		.ADDR_BITWIDTH_SPAD(ADDR_BITWIDTH_SPAD),
		.X_dim(X_dim),
	    .Y_dim(Y_dim),
	    .kernel_size(kernel_size),
	    .act_size(act_size),
		.PSUM_READ_ADDR(PSUM_READ_ADDR),
		.PSUM_LOAD_ADDR(PSUM_LOAD_ADDR)
		)
	router_psum_0
	(
		.clk(clk),
		.reset(reset),
		.r_data_spad_psum(east_data_i),
		.w_addr_glb_psum(w_addr_glb_psum),
		.write_en_glb_psum(west_enable_o),
		.w_data_glb_psum(west_data_o),
		.write_psum_ctrl(east_enable_i)
		);
	


endmodule
