`timescale 1ns / 1ps

module HMNOC_4cluster_wpsum
#(
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
	
	
	input clk, reset,
//  PE interfaces                     //
	input start,
	output compute_done,
	output load_done,



//          GLB Interfaces              //


//    west 0 glb interfaces             //
	input write_en_iact_west_0,
	input [DATA_BITWIDTH-1:0] w_data_iact_west_0,
	input [ADDR_BITWIDTH-1:0] w_addr_iact_west_0,
	
	input [DATA_BITWIDTH-1:0] w_data_wght_west_0,
	input [ADDR_BITWIDTH-1:0] w_addr_wght_west_0,
	input write_en_wght_west_0,

	input [ADDR_BITWIDTH-1:0] r_addr_psum_west_0,
	output [DATA_BITWIDTH-1:0] r_data_psum_west_0,
	input r_req_psum_west_0,


	input [ADDR_BITWIDTH-1:0] r_addr_psum_inter_west_0,
	input r_req_psum_inter_west_0,


//    west 1 glb interfaces            //

	input write_en_iact_west_1,
	input [DATA_BITWIDTH-1:0] w_data_iact_west_1,
	input [ADDR_BITWIDTH-1:0] w_addr_iact_west_1,
	
	input [DATA_BITWIDTH-1:0] w_data_wght_west_1,
	input [ADDR_BITWIDTH-1:0] w_addr_wght_west_1,
	input write_en_wght_west_1,

	input [ADDR_BITWIDTH-1:0] r_addr_psum_west_1,
	output [DATA_BITWIDTH-1:0] r_data_psum_west_1,
	input r_req_psum_west_1,

	input [ADDR_BITWIDTH-1:0] r_addr_psum_inter_west_1,
	input r_req_psum_inter_west_1,

//   east 0   glb interfaces          //

	input write_en_iact_east_0,
	input [DATA_BITWIDTH-1:0] w_data_iact_east_0,
	input [ADDR_BITWIDTH-1:0] w_addr_iact_east_0,
	
	input [DATA_BITWIDTH-1:0] w_data_wght_east_0,
	input [ADDR_BITWIDTH-1:0] w_addr_wght_east_0,
	input write_en_wght_east_0,

	input [ADDR_BITWIDTH-1:0] r_addr_psum_east_0,
	output [DATA_BITWIDTH-1:0] r_data_psum_east_0,
	input r_req_psum_east_0,


	input [ADDR_BITWIDTH-1:0] r_addr_psum_inter_east_0,
	input r_req_psum_inter_east_0,



//   east 1 glb interfaces           //


	input write_en_iact_east_1,
	input [DATA_BITWIDTH-1:0] w_data_iact_east_1,
	input [ADDR_BITWIDTH-1:0] w_addr_iact_east_1,
	
	input [DATA_BITWIDTH-1:0] w_data_wght_east_1,
	input [ADDR_BITWIDTH-1:0] w_addr_wght_east_1,
	input write_en_wght_east_1,

	input [ADDR_BITWIDTH-1:0] r_addr_psum_east_1,
	output [DATA_BITWIDTH-1:0] r_data_psum_east_1,
	input r_req_psum_east_1,


	input [ADDR_BITWIDTH-1:0] r_addr_psum_inter_east_1,
	input r_req_psum_inter_east_1,



//              ROUTER ctrl            //
 	input west_enable_i_west_0_wght,
	
	input west_enable_i_west_0_iact,

 	input west_enable_i_west_1_wght,
	
	input west_enable_i_west_1_iact,

	input west_enable_i_east_0_wght,
	
	input west_enable_i_east_0_iact,

	input west_enable_i_east_1_wght,
	
	input west_enable_i_east_1_iact,


//      MODE for 4 ROUTERS          //

	input [3:0] router_mode_west_0_wght, 
 
	input [3:0] router_mode_west_0_iact, 

	input [3:0] router_mode_west_0_psum,

	input [3:0] router_mode_west_1_wght, 
 
	input [3:0] router_mode_west_1_iact, 

	input [3:0] router_mode_west_1_psum,

	input [3:0] router_mode_east_0_wght, 
 
	input [3:0] router_mode_east_0_iact, 

	input [3:0] router_mode_east_0_psum,

	input [3:0] router_mode_east_1_wght, 
 
	input [3:0] router_mode_east_1_iact, 

	input [3:0] router_mode_east_1_psum
	);
//     interfaces of west 0 cluster
	wire [DATA_BITWIDTH-1:0] south_data_i_wght_west_0;
	wire south_enable_i_wght_west_0;

	wire  [DATA_BITWIDTH-1:0] south_data_o_wght_west_0;
	wire  south_enable_o_wght_west_0;

	wire [DATA_BITWIDTH-1:0] east_data_i_wght_west_0;
	wire east_enable_i_wght_west_0;

	wire  [DATA_BITWIDTH-1:0] east_data_o_wght_west_0;
	wire  east_enable_o_wght_west_0;

	wire [DATA_BITWIDTH-1:0] south_data_i_iact_west_0;
	wire south_enable_i_iact_west_0;

	wire  [DATA_BITWIDTH-1:0] south_data_o_iact_west_0;
	wire  south_enable_o_iact_west_0;

	wire [DATA_BITWIDTH-1:0] east_data_i_iact_west_0;
	wire east_enable_i_iact_west_0;

	wire  [DATA_BITWIDTH-1:0] east_data_o_iact_west_0;
	wire  east_enable_o_iact_west_0;

	wire [DATA_BITWIDTH*X_dim-1:0] south_data_o_psum_west_0;
	wire south_enable_o_psum_west_0;


//     interfaces of east 1 cluster
	wire [DATA_BITWIDTH-1:0] north_data_i_wght_east_1;
	wire north_enable_i_wght_east_1;

	wire  [DATA_BITWIDTH-1:0] north_data_o_wght_east_1;
	wire  north_enable_o_wght_east_1;

	wire [DATA_BITWIDTH-1:0] east_data_i_wght_east_1;
	wire east_enable_i_wght_east_1;

	wire  [DATA_BITWIDTH-1:0] east_data_o_wght_east_1;
	wire  east_enable_o_wght_east_1;

	wire [DATA_BITWIDTH-1:0] north_data_i_iact_east_1;
	wire north_enable_i_iact_east_1;

	wire  [DATA_BITWIDTH-1:0] north_data_o_iact_east_1;
	wire  north_enable_o_iact_east_1;

	wire [DATA_BITWIDTH-1:0] east_data_i_iact_east_1;
	wire east_enable_i_iact_east_1;

	wire  [DATA_BITWIDTH-1:0] east_data_o_iact_east_1;
	wire  east_enable_o_iact_east_1;

	wire [DATA_BITWIDTH*X_dim-1:0] north_data_i_psum_east_1;
	wire north_enable_i_psum_east_1;


HMNOC_1cluster_wpsum

		#(
		 // .DATA_BITWIDTH(DATA_BITWIDTH),
		 // .ADDR_BITWIDTH(ADDR_BITWIDTH),
		 .ADDR_BITWIDTH_GLB(ADDR_BITWIDTH_GLB),
		 .ADDR_BITWIDTH_SPAD(ADDR_BITWIDTH_SPAD),
		 .DATA_BITWIDTH(DATA_BITWIDTH),
		 .ADDR_BITWIDTH(ADDR_BITWIDTH),
		 .A_LOAD_ADDR(A_LOAD_ADDR),
		 .A_READ_ADDR(A_READ_ADDR),
		 .W_LOAD_ADDR(W_LOAD_ADDR),
		 .W_READ_ADDR(W_READ_ADDR),
		 .PSUM_ADDR(PSUM_ADDR),
		 .X_dim(X_dim),
		 .Y_dim(Y_dim),

		 .kernel_size(kernel_size),
		 .act_size(act_size),
		 .NUM_GLB_IACT(NUM_GLB_IACT),
		 .NUM_GLB_PSUM(NUM_GLB_PSUM),
		 .NUM_GLB_WGHT(NUM_GLB_WGHT)
	     )
		HMNOC_1cluster_west_0
		(	
		.clk(clk), 
		.reset(reset),
		.start(start),
	  
		.compute_done(compute_done),
		.load_done(load_done),
		// GLB Interports
		.write_en_iact(write_en_iact_west_0),
		.w_data_iact(w_data_iact_west_0),
		.w_addr_iact(w_addr_iact_west_0),

		.west_enable_i_west_0_iact(west_enable_i_west_0_iact),
		.router_mode_west_0_iact(router_mode_west_0_iact),



		.write_en_wght(write_en_wght_west_0),
		.w_data_wght(w_data_wght_west_0),
		.w_addr_wght(w_addr_wght_west_0),

		.west_enable_i_west_0_wght(west_enable_i_west_0_wght),
		.router_mode_west_0_wght(router_mode_west_0_wght),


		.west_0_req_read_psum(r_req_psum_west_0),
		.west_0_req_read_psum_inter(r_req_psum_inter_west_0),
		.r_addr_psum(r_addr_psum_west_0),
		.r_addr_psum_inter(r_addr_psum_inter_west_0),
		.r_data_psum(r_data_psum_west_0),
		.router_mode_west_0_psum(router_mode_west_0_psum),

		.north_data_i_iact(),
		.north_enable_i_iact(),
		.north_data_o_iact(),
		.north_enable_o_iact(),
		.south_data_i_iact(south_data_i_iact_west_0),
		.south_enable_i_iact(south_enable_i_iact_west_0),
		.south_data_o_iact(south_data_o_iact_west_0),
		.south_enable_o_iact(south_enable_o_iact_west_0),
		.east_data_i_iact(east_data_i_iact_west_0),
		.east_enable_i_iact(east_enable_i_iact_west_0),
		.east_data_o_iact(east_data_o_iact_west_0),
		.east_enable_o_iact(east_enable_o_iact_west_0),



		.north_data_i_wght(),
		.north_enable_i_wght(),
		.north_data_o_wght(),
		.north_enable_o_wght(),
		.south_data_i_wght(south_data_i_wght_west_0),
		.south_enable_i_wght(south_enable_i_wght_west_0),
		.south_data_o_wght(south_data_o_wght_west_0),
		.south_enable_o_wght(south_enable_o_wght_west_0),
		.east_data_i_wght(east_data_i_wght_west_0),
		.east_enable_i_wght(east_enable_i_wght_west_0),
		.east_data_o_wght(east_data_o_wght_west_0),
		.east_enable_o_wght(east_enable_o_wght_west_0),
	


		.north_data_i_psum(),
		.north_enable_i_psum(),
		.south_data_o_psum(south_data_o_psum_west_0),
		.south_enable_o_psum(south_enable_o_psum_west_0)
			);
HMNOC_1cluster_wpsum

		#(
		 // .DATA_BITWIDTH(DATA_BITWIDTH),
		 // .ADDR_BITWIDTH(ADDR_BITWIDTH),
		 .ADDR_BITWIDTH_GLB(ADDR_BITWIDTH_GLB),
		 .ADDR_BITWIDTH_SPAD(ADDR_BITWIDTH_SPAD),
		 .DATA_BITWIDTH(DATA_BITWIDTH),
		 .ADDR_BITWIDTH(ADDR_BITWIDTH),
		 .A_LOAD_ADDR(A_LOAD_ADDR),
		 .A_READ_ADDR(A_READ_ADDR),
		 .W_LOAD_ADDR(W_LOAD_ADDR),
		 .W_READ_ADDR(W_READ_ADDR),
		 .PSUM_ADDR(PSUM_ADDR),
		 .X_dim(X_dim),
		 .Y_dim(Y_dim),

		 .kernel_size(kernel_size),
		 .act_size(act_size),
		 .NUM_GLB_IACT(NUM_GLB_IACT),
		 .NUM_GLB_PSUM(NUM_GLB_PSUM),
		 .NUM_GLB_WGHT(NUM_GLB_WGHT)
	     )
		HMNOC_1cluster_west_1
		(	
		.clk(clk), 
		.reset(reset),
		.start(start),
	  
		.compute_done(),
		.load_done(),
		// GLB Interports
		.write_en_iact(write_en_iact_west_1),
		.w_data_iact(w_data_iact_west_1),
		.w_addr_iact(w_addr_iact_west_1),

		.west_enable_i_west_0_iact(west_enable_i_west_1_iact),
		.router_mode_west_0_iact(router_mode_west_1_iact),



		.write_en_wght(write_en_wght_west_1),
		.w_data_wght(w_data_wght_west_1),
		.w_addr_wght(w_addr_wght_west_1),

		.west_enable_i_west_0_wght(west_enable_i_west_1_wght),
		.router_mode_west_0_wght(router_mode_west_1_wght),


		.west_0_req_read_psum(r_req_psum_west_1),
		.west_0_req_read_psum_inter(r_req_psum_inter_west_1),
		.r_addr_psum(r_addr_psum_west_1),
		.r_addr_psum_inter(r_addr_psum_inter_west_1),
		.r_data_psum(r_data_psum_west_1),
		.router_mode_west_0_psum(router_mode_west_1_psum),

		.north_data_i_iact(south_data_o_iact_west_0),
		.north_enable_i_iact(south_enable_o_iact_west_0),
		.north_data_o_iact(south_data_i_iact_west_0),
		.north_enable_o_iact(south_enable_i_iact_west_0),
		.south_data_i_iact(),
		.south_enable_i_iact(),
		.south_data_o_iact(),
		.south_enable_o_iact(),
		.east_data_i_iact(east_data_o_iact_east_1),
		.east_enable_i_iact(east_enable_o_iact_east_1),
		.east_data_o_iact(east_data_i_iact_east_1),
		.east_enable_o_iact(east_enable_i_iact_east_1),



		.north_data_i_wght(south_data_o_wght_west_0),
		.north_enable_i_wght(south_enable_o_wght_west_0),
		.north_data_o_wght(south_data_i_wght_west_0),
		.north_enable_o_wght(south_enable_i_wght_west_0),
		.south_data_i_wght(),
		.south_enable_i_wght(),
		.south_data_o_wght(),
		.south_enable_o_wght(),
		.east_data_i_wght(east_data_o_wght_east_1),
		.east_enable_i_wght(east_enable_o_wght_east_1),
		.east_data_o_wght(east_data_i_wght_east_1),
		.east_enable_o_wght(east_enable_i_wght_east_1),
	


		.north_data_i_psum(south_data_o_psum_west_0),
		.north_enable_i_psum(south_enable_o_psum_west_0),
		.south_data_o_psum(),
		.south_enable_o_psum()
			);


HMNOC_1cluster_wpsum

		#(
		 // .DATA_BITWIDTH(DATA_BITWIDTH),
		 // .ADDR_BITWIDTH(ADDR_BITWIDTH),
		 .ADDR_BITWIDTH_GLB(ADDR_BITWIDTH_GLB),
		 .ADDR_BITWIDTH_SPAD(ADDR_BITWIDTH_SPAD),
		 .DATA_BITWIDTH(DATA_BITWIDTH),
		 .ADDR_BITWIDTH(ADDR_BITWIDTH),
		 .A_LOAD_ADDR(A_LOAD_ADDR),
		 .A_READ_ADDR(A_READ_ADDR),
		 .W_LOAD_ADDR(W_LOAD_ADDR),
		 .W_READ_ADDR(W_READ_ADDR),
		 .PSUM_ADDR(PSUM_ADDR),
		 .X_dim(X_dim),
		 .Y_dim(Y_dim),

		 .kernel_size(kernel_size),
		 .act_size(act_size),
		 .NUM_GLB_IACT(NUM_GLB_IACT),
		 .NUM_GLB_PSUM(NUM_GLB_PSUM),
		 .NUM_GLB_WGHT(NUM_GLB_WGHT)
	     )
		HMNOC_1cluster_east_0
		(	
		.clk(clk), 
		.reset(reset),
		.start(start),
	  
		.compute_done(),
		.load_done(),
		// GLB Interports
		.write_en_iact(write_en_iact_east_0),
		.w_data_iact(w_data_iact_east_0),
		.w_addr_iact(w_addr_iact_east_0),

		.west_enable_i_west_0_iact(west_enable_i_east_0_iact),
		.router_mode_west_0_iact(router_mode_east_0_iact),



		.write_en_wght(write_en_wght_east_0),
		.w_data_wght(w_data_wght_east_0),
		.w_addr_wght(w_addr_wght_east_0),

		.west_enable_i_west_0_wght(west_enable_i_east_0_wght),
		.router_mode_west_0_wght(router_mode_east_0_wght),


		.west_0_req_read_psum(r_req_psum_east_0),
		.west_0_req_read_psum_inter(r_req_psum_inter_east_0),
		.r_addr_psum(r_addr_psum_east_0),
		.r_addr_psum_inter(r_addr_psum_inter_east_0),
		.r_data_psum(r_data_psum_east_0),
		.router_mode_west_0_psum(router_mode_east_0_psum),

		.north_data_i_iact(),
		.north_enable_i_iact(),
		.north_data_o_iact(),
		.north_enable_o_iact(),
		.south_data_i_iact(north_data_o_iact_east_1),
		.south_enable_i_iact(north_enable_o_iact_east_1),
		.south_data_o_iact(north_data_i_iact_east_1),
		.south_enable_o_iact(north_enable_i_iact_east_1),
		.east_data_i_iact(east_data_o_iact_west_0),
		.east_enable_i_iact(east_enable_o_iact_west_0),
		.east_data_o_iact(east_data_i_iact_west_0),
		.east_enable_o_iact(east_enable_i_iact_west_0),



		.north_data_i_wght(),
		.north_enable_i_wght(),
		.north_data_o_wght(),
		.north_enable_o_wght(),
		.south_data_i_wght(north_data_o_wght_east_1),
		.south_enable_i_wght(north_enable_o_wght_east_1),
		.south_data_o_wght(north_data_i_wght_east_1),
		.south_enable_o_wght(north_enable_i_wght_east_1),
		.east_data_i_wght(east_data_o_wght_west_0),
		.east_enable_i_wght(east_enable_o_wght_west_0),
		.east_data_o_wght(east_data_i_wght_west_0),
		.east_enable_o_wght(east_enable_i_wght_west_0),
	


		.north_data_i_psum(),
		.north_enable_i_psum(),
		.south_data_o_psum(north_data_i_psum_east_1),
		.south_enable_o_psum(north_enable_i_psum_east_1)
			);
HMNOC_1cluster_wpsum

		#(
		 // .DATA_BITWIDTH(DATA_BITWIDTH),
		 // .ADDR_BITWIDTH(ADDR_BITWIDTH),
		 .ADDR_BITWIDTH_GLB(ADDR_BITWIDTH_GLB),
		 .ADDR_BITWIDTH_SPAD(ADDR_BITWIDTH_SPAD),
		 .DATA_BITWIDTH(DATA_BITWIDTH),
		 .ADDR_BITWIDTH(ADDR_BITWIDTH),
		 .A_LOAD_ADDR(A_LOAD_ADDR),
		 .A_READ_ADDR(A_READ_ADDR),
		 .W_LOAD_ADDR(W_LOAD_ADDR),
		 .W_READ_ADDR(W_READ_ADDR),
		 .PSUM_ADDR(PSUM_ADDR),
		 .X_dim(X_dim),
		 .Y_dim(Y_dim),

		 .kernel_size(kernel_size),
		 .act_size(act_size),
		 .NUM_GLB_IACT(NUM_GLB_IACT),
		 .NUM_GLB_PSUM(NUM_GLB_PSUM),
		 .NUM_GLB_WGHT(NUM_GLB_WGHT)
	     )
		HMNOC_1cluster_east_1
		(	
		.clk(clk), 
		.reset(reset),
		.start(start),
	  
		.compute_done(),
		.load_done(),
		// GLB Interports
		.write_en_iact(write_en_iact_east_1),
		.w_data_iact(w_data_iact_east_1),
		.w_addr_iact(w_addr_iact_east_1),

		.west_enable_i_west_0_iact(west_enable_i_east_1_iact),
		.router_mode_west_0_iact(router_mode_east_1_iact),



		.write_en_wght(write_en_wght_east_1),
		.w_data_wght(w_data_wght_east_1),
		.w_addr_wght(w_addr_wght_east_1),

		.west_enable_i_west_0_wght(west_enable_i_east_1_wght),
		.router_mode_west_0_wght(router_mode_east_1_wght),


		.west_0_req_read_psum(r_req_psum_east_1),
		.west_0_req_read_psum_inter(r_req_psum_inter_east_1),
		.r_addr_psum(r_addr_psum_east_1),
		.r_addr_psum_inter(r_addr_psum_inter_east_1),
		.r_data_psum(r_data_psum_east_1),
		.router_mode_west_0_psum(router_mode_east_1_psum),

		.north_data_i_iact(north_data_i_iact_east_1),
		.north_enable_i_iact(north_enable_i_iact_east_1),
		.north_data_o_iact(north_data_o_iact_east_1),
		.north_enable_o_iact(north_enable_o_iact_east_1),
		.south_data_i_iact(),
		.south_enable_i_iact(),
		.south_data_o_iact(),
		.south_enable_o_iact(),
		.east_data_i_iact(east_data_i_iact_east_1),
		.east_enable_i_iact(east_enable_i_iact_east_1),
		.east_data_o_iact(east_data_o_iact_east_1),
		.east_enable_o_iact(east_enable_o_iact_east_1),



		.north_data_i_wght(north_data_i_wght_east_1),
		.north_enable_i_wght(north_enable_i_wght_east_1),
		.north_data_o_wght(north_data_o_wght_east_1),
		.north_enable_o_wght(north_enable_o_wght_east_1),
		.south_data_i_wght(),
		.south_enable_i_wght(),
		.south_data_o_wght(),
		.south_enable_o_wght(),
		.east_data_i_wght(east_data_i_wght_east_1),
		.east_enable_i_wght(east_enable_i_wght_east_1),
		.east_data_o_wght(east_data_o_wght_east_1),
		.east_enable_o_wght(east_enable_o_wght_east_1),
	


		.north_data_i_psum(north_data_i_psum_east_1),
		.north_enable_i_psum(north_enable_i_psum_east_1),
		.south_data_o_psum(),
		.south_enable_o_psum()
			);

endmodule
