`timescale 1ns / 1ps

module HMNOC_1cluster_wpsum
#(
	// parameter DATA_BITWIDTH = 16,
	// parameter ADDR_BITWIDTH = 9,
	parameter ADDR_BITWIDTH_GLB = 10,
	parameter ADDR_BITWIDTH_SPAD = 9,
	parameter DATA_BITWIDTH = 16,
	parameter ADDR_BITWIDTH = 10,
    parameter A_READ_ADDR = 100,
	parameter A_LOAD_ADDR = 100,
	parameter W_READ_ADDR = 0,
	parameter W_LOAD_ADDR = 0,
	parameter PSUM_READ_ADDR = 0,
	parameter PSUM_LOAD_ADDR = 0,
	parameter PSUM_ADDR= 500,
    parameter X_dim = 3,
    parameter Y_dim = 3,
    parameter kernel_size = 3,
    parameter act_size = 5,
    parameter NUM_GLB_IACT = 1,
    parameter NUM_GLB_PSUM = 1,
    parameter NUM_GLB_WGHT = 1
	)
(
	
	
	// PE interports
	input clk, reset,
	input start,

	output compute_done,
	output load_done,
	
	// output [DATA_BITWIDTH-1:0] pe_out_west_0,

	// GLB Interports
	input write_en_iact,
	input write_en_wght,
	
	input [DATA_BITWIDTH-1:0] w_data_iact,
	input [ADDR_BITWIDTH-1:0] w_addr_iact,
	
	input [DATA_BITWIDTH-1:0] w_data_wght,
	input [ADDR_BITWIDTH-1:0] w_addr_wght,
	input [ADDR_BITWIDTH-1:0] r_addr_psum,
	input [ADDR_BITWIDTH-1:0] r_addr_psum_inter,
	input west_0_req_read_psum_inter,
	input west_0_req_read_psum,
	output [DATA_BITWIDTH-1:0] r_data_psum,

	
	//ROUTER Interports

	input west_enable_i_west_0_wght,

	input west_enable_i_west_0_iact,

	input [3:0] router_mode_west_0_wght,
	input [3:0] router_mode_west_0_iact,




/////////////  IACT interports with other directions   ////////////
	input [DATA_BITWIDTH-1:0] north_data_i_iact,
	input north_enable_i_iact,

	output  [DATA_BITWIDTH-1:0] north_data_o_iact,
	output  north_enable_o_iact,

	input [DATA_BITWIDTH-1:0] south_data_i_iact,
	input south_enable_i_iact,

	output  [DATA_BITWIDTH-1:0] south_data_o_iact,
	output  south_enable_o_iact,

	input [DATA_BITWIDTH-1:0] east_data_i_iact,
	input east_enable_i_iact,

	output  [DATA_BITWIDTH-1:0] east_data_o_iact,
	output  east_enable_o_iact,



/////////////  WGHT interports with other directions   ////////////
	input [DATA_BITWIDTH-1:0] north_data_i_wght,
	input north_enable_i_wght,

	output  [DATA_BITWIDTH-1:0] north_data_o_wght,
	output  north_enable_o_wght,

	input [DATA_BITWIDTH-1:0] south_data_i_wght,
	input south_enable_i_wght,

	output  [DATA_BITWIDTH-1:0] south_data_o_wght,
	output  south_enable_o_wght,

	input [DATA_BITWIDTH-1:0] east_data_i_wght,
	input east_enable_i_wght,

	output  [DATA_BITWIDTH-1:0] east_data_o_wght,
	output  east_enable_o_wght,



////////////  ROUTER PSUM //////////////////////

	input [3:0] router_mode_west_0_psum,
	input [DATA_BITWIDTH*X_dim-1:0] north_data_i_psum,
	input north_enable_i_psum,
	output  [DATA_BITWIDTH*X_dim-1:0] south_data_o_psum,
	output  south_enable_o_psum


	///test signal for tb ////
	// output [DATA_BITWIDTH-1:0] west_data_o_west_0_psum_tb,
	// output west_enable_o_west_0_psum_tb,
	// output [DATA_BITWIDTH*X_dim-1:0] west_data_i_west_0_psum_tb,
	// output [DATA_BITWIDTH*X_dim-1:0] east_data_o_west_0_psum_tb,
	// output [ADDR_BITWIDTH-1:0] west_addr_o_west_0_psum_tb,
	// output [DATA_BITWIDTH*X_dim-1:0] east_data_i_west_0_psum_tb
	
	);

	wire [ADDR_BITWIDTH_GLB-1:0] west_0_addr_read_wght;

	wire [ADDR_BITWIDTH_GLB-1:0] west_0_addr_read_iact;

	wire [ADDR_BITWIDTH-1:0] west_addr_o_west_0_psum;

	wire west_0_req_read_wght;

	wire west_0_req_read_iact;

	wire [DATA_BITWIDTH-1:0] west_data_i_west_0_wght;

	wire [DATA_BITWIDTH-1:0] west_data_i_west_0_iact;

	wire  west_enable_o_west_0_wght;

	wire  west_enable_o_west_0_iact;

	wire [DATA_BITWIDTH-1:0] west_data_o_west_0_iact;

	wire [DATA_BITWIDTH-1:0] west_data_o_west_0_wght;
	

	wire [DATA_BITWIDTH*X_dim-1:0] west_data_i_west_0_psum;
	wire west_enable_i_west_0_psum;
	wire [DATA_BITWIDTH-1:0] west_data_o_west_0_psum;
	wire west_enable_o_west_0_psum;
	wire [DATA_BITWIDTH*X_dim-1:0] east_data_i_west_0_psum;
	wire east_enable_i_west_0_psum;
	wire [DATA_BITWIDTH*X_dim-1:0] east_data_o_west_0_psum;
	// reg east_enable_o_west_0_psum;


	assign compute_done = east_enable_i_west_0_psum;
	// assign  west_data_o_west_0_psum_tb = west_data_o_west_0_psum ;
	// assign west_enable_o_west_0_psum_tb =west_enable_o_west_0_psum ;
	// assign  west_data_i_west_0_psum_tb = west_data_i_west_0_psum;
	// assign  east_data_o_west_0_psum_tb = east_data_o_west_0_psum;
	// assign west_addr_o_west_0_psum_tb = west_addr_o_west_0_psum;
	// assign east_data_i_west_0_psum_tb = east_data_i_west_0_psum ;
	router_cluster_wpsum
	#(
		.DATA_BITWIDTH(DATA_BITWIDTH),
		.ADDR_BITWIDTH(ADDR_BITWIDTH),
		.ADDR_BITWIDTH_GLB(ADDR_BITWIDTH_GLB),
		.ADDR_BITWIDTH_SPAD(ADDR_BITWIDTH_SPAD),
		.A_READ_ADDR(A_READ_ADDR),
		.A_LOAD_ADDR(A_LOAD_ADDR),
		.X_dim(X_dim),
	    .Y_dim(Y_dim),
	    .kernel_size(kernel_size),
	    .act_size(act_size),
		.PSUM_READ_ADDR(PSUM_READ_ADDR),
		.PSUM_LOAD_ADDR(PSUM_LOAD_ADDR),
		.W_READ_ADDR(W_READ_ADDR), 
	    .W_LOAD_ADDR(W_LOAD_ADDR)

		)
	router_cluster_0
	(
		.clk(clk),
		.reset(reset),

		.west_0_addr_read_iact(west_0_addr_read_iact),
		.west_0_req_read_iact(west_0_req_read_iact),
		.router_mode_west_0_iact(router_mode_west_0_iact),
		.west_data_i_west_0_iact(west_data_i_west_0_iact),
		.west_enable_i_west_0_iact(west_enable_i_west_0_iact),
		.west_data_o_west_0_iact(west_data_o_west_0_iact),
		.west_enable_o_west_0_iact(west_enable_o_west_0_iact),


		.west_0_addr_read_wght(west_0_addr_read_wght),
		.west_0_req_read_wght(west_0_req_read_wght),
		.router_mode_west_0_wght(router_mode_west_0_wght),
		.west_data_i_west_0_wght(west_data_i_west_0_wght),
		.west_enable_i_west_0_wght(west_enable_i_west_0_wght),
		.west_data_o_west_0_wght(west_data_o_west_0_wght),
		.west_enable_o_west_0_wght(west_enable_o_west_0_wght),


		.north_data_i_iact(north_data_i_iact),
		.north_enable_i_iact(north_enable_i_iact),
		.north_data_o_iact(north_data_o_iact),
		.north_enable_o_iact(north_enable_o_iact),
		.south_data_i_iact(south_data_i_iact),
		.south_enable_i_iact(south_enable_i_iact),
		.south_data_o_iact(south_data_o_iact),
		.south_enable_o_iact(south_enable_o_iact),
		.east_data_i_iact(east_data_i_iact),
		.east_enable_i_iact(east_enable_i_iact),
		.east_data_o_iact(east_data_o_iact),
		.east_enable_o_iact(east_enable_o_iact),



		.north_data_i_wght(north_data_i_wght),
		.north_enable_i_wght(north_enable_i_wght),
		.north_data_o_wght(north_data_o_wght),
		.north_enable_o_wght(north_enable_o_wght),
		.south_data_i_wght(south_data_i_wght),
		.south_enable_i_wght(south_enable_i_wght),
		.south_data_o_wght(south_data_o_wght),
		.south_enable_o_wght(south_enable_o_wght),
		.east_data_i_wght(east_data_i_wght),
		.east_enable_i_wght(east_enable_i_wght),
		.east_data_o_wght(east_data_o_wght),
		.east_enable_o_wght(east_enable_o_wght),


		.router_mode_west_0_psum(router_mode_west_0_psum),
		.north_data_i_psum(north_data_i_psum),
		.north_enable_i_psum(north_enable_i_psum),
		.south_data_o_psum(south_data_o_psum),
		.south_enable_o_psum(south_enable_o_psum),
		.west_data_i_west_0_psum(west_data_i_west_0_psum),
		.west_enable_i_west_0_psum(west_enable_i_west_0_psum),
		.west_data_o_west_0_psum(west_data_o_west_0_psum),
		.west_enable_o_west_0_psum(west_enable_o_west_0_psum),
		.east_data_i_west_0_psum(east_data_i_west_0_psum),
		.east_enable_i_west_0_psum(east_enable_i_west_0_psum),
		.east_data_o_west_0_psum(east_data_o_west_0_psum),
		// .east_enable_o_west_0_psum(east_enable_o_west_0_psum),
		.west_addr_o_west_0_psum(west_addr_o_west_0_psum)

		);
		
	

	GLB_cluster_wpsum 
			#(	.DATA_BITWIDTH(DATA_BITWIDTH),
				.ADDR_BITWIDTH(ADDR_BITWIDTH),
				.X_dim(X_dim),
				.Y_dim(Y_dim),
				.NUM_GLB_IACT(NUM_GLB_IACT),
				.NUM_GLB_PSUM(NUM_GLB_PSUM),
				.NUM_GLB_WGHT(NUM_GLB_WGHT)
			)
	GLB_cluster_west_0
			(
				.clk(clk),   //TestBench/Controller
				.reset(reset),  //TestBench/Controller
				
				//Signals for reading from GLB
				.read_req_iact(west_0_req_read_iact),
				.read_req_psum(west_0_req_read_psum), //Read by testbench/controller
				.read_req_wght(west_0_req_read_wght),
				.read_req_psum_inter(west_0_req_read_psum_inter),

			    .r_data_iact(west_data_i_west_0_iact),
			    .r_data_psum(r_data_psum), //Read by testbench/controller
				.r_data_wght(west_data_i_west_0_wght),
				.r_data_psum_inter(west_data_i_west_0_psum),
				.read_en_psum_inter(west_enable_i_west_0_psum),

				.r_addr_iact(west_0_addr_read_iact),
			    .r_addr_psum(r_addr_psum), //testbench for reading final psums
				.r_addr_wght(west_0_addr_read_wght),
				.r_addr_psum_inter(r_addr_psum_inter),
				
				//Signals for writing to GLB
			    .w_addr_iact(w_addr_iact), //testbench for writing
			    .w_addr_psum(west_addr_o_west_0_psum),
				.w_addr_wght(w_addr_wght), //testbench for writing
 
			    .w_data_iact(w_data_iact), //testbench for writing
			    // .w_data_psum(network_psum.west_data_o_west_0),
				.w_data_psum(west_data_o_west_0_psum),
				.w_data_wght(w_data_wght), //testbench for writing

				.write_en_iact(write_en_iact), //testbench for writing
				// .write_en_psum(network_psum.west_enable_o_west_0),
				.write_en_psum(west_enable_o_west_0_psum),
				.write_en_wght(write_en_wght) //testbench for writing
			
			);
	
	
	/////// INST PE CLUSTER
		
//    input [DATA_BITWIDTH-1:0] act_in;
//    input [DATA_BITWIDTH-1:0] filt_in;

	
	// PE CLUSTER WEST 0	
	PE_cluster_new #(
					.DATA_BITWIDTH(DATA_BITWIDTH),
					.ADDR_BITWIDTH(ADDR_BITWIDTH),
					
					.kernel_size(kernel_size),
					.act_size(act_size),
					
					.X_dim(X_dim),
					.Y_dim(Y_dim),
					.W_READ_ADDR(W_READ_ADDR),
					.W_LOAD_ADDR(W_LOAD_ADDR),
					.A_READ_ADDR(A_READ_ADDR),
					.A_LOAD_ADDR(A_LOAD_ADDR),
					.PSUM_ADDR(PSUM_ADDR)

    			)
	pe_cluster_west_0
    			(
					.clk(clk),
				    .reset(reset),
					
				    .act_in(west_data_o_west_0_iact),
				    .filt_in(west_data_o_west_0_wght),
				    .pe_before(east_data_o_west_0_psum),
					// .filt_count_n(filt_count_n),
					.load_en_wght(west_enable_o_west_0_wght),
					.load_en_act(west_enable_o_west_0_iact),
					
					.start(start),
                    .pe_out(east_data_i_west_0_psum),
					.compute_done(east_enable_i_west_0_psum),
					.load_done(load_done)
    			);
	

    endmodule