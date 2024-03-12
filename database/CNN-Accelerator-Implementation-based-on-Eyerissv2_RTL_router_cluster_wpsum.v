`timescale 1ns/1ps


module router_cluster_wpsum
	#(
		// parameter DATA_BITWIDTH = 16,
		parameter DATA_BITWIDTH = 16,
		parameter ADDR_BITWIDTH = 10,
		parameter ADDR_BITWIDTH_GLB = 10,
		parameter ADDR_BITWIDTH_SPAD = 9,
		parameter A_READ_ADDR = 100,
		parameter A_LOAD_ADDR = 0,
		parameter X_dim = 5,
        parameter Y_dim = 3,
        parameter kernel_size = 3,
        parameter act_size = 5,
		
		parameter W_READ_ADDR = 0, 
        
        parameter W_LOAD_ADDR = 0,
        parameter PSUM_READ_ADDR = 0,
        parameter PSUM_LOAD_ADDR = 0
        )
	(
	input clk,
	input reset,



	///////////////      ROUTER IACT      ///////////////////////////////////
	output [ADDR_BITWIDTH_GLB-1:0] west_0_addr_read_iact,
	output west_0_req_read_iact,
	input [3:0] router_mode_west_0_iact,
	//Interface with West
	//Source ports
	input [DATA_BITWIDTH-1:0] west_data_i_west_0_iact,
	input west_enable_i_west_0_iact,
	//Destination ports
	output [DATA_BITWIDTH-1:0] west_data_o_west_0_iact,
	output west_enable_o_west_0_iact,




	///////////////      ROUTER WGHT      ///////////////////////////////////
	output [ADDR_BITWIDTH_GLB-1:0] west_0_addr_read_wght,
	output west_0_req_read_wght,
	input [3:0] router_mode_west_0_wght,	
	//Interface with West
	//Source ports
	input [DATA_BITWIDTH-1:0] west_data_i_west_0_wght,
	input west_enable_i_west_0_wght,
	
	//Destination ports
	output [DATA_BITWIDTH-1:0] west_data_o_west_0_wght,
	output west_enable_o_west_0_wght,



	/////////////  IACT interports with other directions   ////////////
	input [DATA_BITWIDTH-1:0] north_data_i_iact,
	input north_enable_i_iact,
//		output  north_ready_o_iact,
	
	//Destination ports
	output  [DATA_BITWIDTH-1:0] north_data_o_iact,
	output  north_enable_o_iact,
//		input north_ready_i_iact,
	
	
	//Interface with South
	//Source ports
	input [DATA_BITWIDTH-1:0] south_data_i_iact,
	input south_enable_i_iact,
//		output  south_ready_o_iact,
	
	//Destination ports
	output  [DATA_BITWIDTH-1:0] south_data_o_iact,
	output  south_enable_o_iact,
//		input south_ready_i_iact,
	
	//Interface with East - Devices
	//Source ports
	input [DATA_BITWIDTH-1:0] east_data_i_iact,
	input east_enable_i_iact,
//		output  east_ready_o_iact,
	
	//Destination ports
	output  [DATA_BITWIDTH-1:0] east_data_o_iact,
	output  east_enable_o_iact,



/////////////  WGHT interports with other directions   ////////////
	input [DATA_BITWIDTH-1:0] north_data_i_wght,
	input north_enable_i_wght,
//		output  north_ready_o_wght,
	
	//Destination ports
	output  [DATA_BITWIDTH-1:0] north_data_o_wght,
	output  north_enable_o_wght,
//		input north_ready_i_wght,
	
	
	//Interface with South
	//Source ports
	input [DATA_BITWIDTH-1:0] south_data_i_wght,
	input south_enable_i_wght,
//		output  south_ready_o_wght,
	
	//Destination ports
	output  [DATA_BITWIDTH-1:0] south_data_o_wght,
	output  south_enable_o_wght,
//		input south_ready_i_wght,
	
	//Interface with East - Devices
	//Source ports
	input [DATA_BITWIDTH-1:0] east_data_i_wght,
	input east_enable_i_wght,
//		output  east_ready_o_wght,
	
	//Destination ports
	output  [DATA_BITWIDTH-1:0] east_data_o_wght,
	output  east_enable_o_wght,

//  ROUTER PSUM   //
	input [3:0] router_mode_west_0_psum,
	input [DATA_BITWIDTH*X_dim-1:0] north_data_i_psum,
	input north_enable_i_psum,
	output  [DATA_BITWIDTH*X_dim-1:0] south_data_o_psum,
	output  south_enable_o_psum,
	input [DATA_BITWIDTH*X_dim-1:0] west_data_i_west_0_psum,
	input west_enable_i_west_0_psum,
	output  [DATA_BITWIDTH-1:0] west_data_o_west_0_psum,
	output  west_enable_o_west_0_psum,
	input [DATA_BITWIDTH*X_dim-1:0] east_data_i_west_0_psum,
	input east_enable_i_west_0_psum,
	output  [DATA_BITWIDTH*X_dim-1:0] east_data_o_west_0_psum,
	// output  east_enable_o_west_0_psum,
	output  [ADDR_BITWIDTH-1:0] west_addr_o_west_0_psum

		);
	router_west_iact
		#(
			.DATA_BITWIDTH(DATA_BITWIDTH),
			.ADDR_BITWIDTH_GLB(ADDR_BITWIDTH_GLB),
			.ADDR_BITWIDTH_SPAD(ADDR_BITWIDTH_SPAD),
			
			.X_dim(X_dim),
		    .Y_dim(Y_dim),
		    .kernel_size(kernel_size),
		    .act_size(act_size),
			
			.A_READ_ADDR(A_READ_ADDR), 
		    .A_LOAD_ADDR(A_LOAD_ADDR)
		)
	router_west_0_iact
		(
			.clk(clk),
			.reset(reset),
			.west_req_read(west_0_req_read_iact),
			.west_addr_read(west_0_addr_read_iact),
			.router_mode(router_mode_west_0_iact),
			// .load_ctrl_state(load_ctrl_state_west_0),
			
			//Interface with North
			//Source ports
			.north_data_i(north_data_i_iact),
			.north_enable_i(north_enable_i_iact),
			
			//Destination ports
			.north_data_o(north_data_o_iact),
			.north_enable_o(north_enable_o_iact),
			
			//Interface with South
			//Source ports
			.south_data_i(south_data_i_iact),
			.south_enable_i(south_enable_i_iact),
			
			//Destination ports
			.south_data_o(south_data_o_iact),
			.south_enable_o(south_enable_o_iact),
			
			
			//Interface with West
			//Source ports
			.west_data_i(west_data_i_west_0_iact),
			.west_enable_i(west_enable_i_west_0_iact),
			
			//Destination ports
			.west_data_o(west_data_o_west_0_iact),
			.west_enable_o(west_enable_o_west_0_iact),
			
			
			//Interface with East
			//Source ports
			.east_data_i(east_data_i_iact),
			.east_enable_i(east_enable_i_iact),
	        
			//Destination ports
	        .east_data_o(east_data_o_iact),
            .east_enable_o(east_enable_o_iact)
		);
	router_west_wght 
		#(
			.DATA_BITWIDTH(DATA_BITWIDTH),
			.ADDR_BITWIDTH_GLB(ADDR_BITWIDTH_GLB),
			.ADDR_BITWIDTH_SPAD(ADDR_BITWIDTH_SPAD),
			
			.X_dim(X_dim),
		    .Y_dim(Y_dim),
		    .kernel_size(kernel_size),
		    .act_size(act_size),
			
			.W_READ_ADDR(W_READ_ADDR), 
		    .W_LOAD_ADDR(W_LOAD_ADDR)
		)
	router_west_0_wght(
		.clk(clk),
		.reset(reset),
		.west_req_read(west_0_req_read_wght),
		.west_addr_read(west_0_addr_read_wght),
		.router_mode(router_mode_west_0_wght),
		// .load_ctrl_state(load_ctrl_state_west_0),
		
		//Interface with North
		//Source ports
		.north_data_i(north_data_i_wght),
		.north_enable_i(north_enable_i_wght),
		
		//Destination ports
		.north_data_o(north_data_o_wght),
		.north_enable_o(north_enable_o_wght),
		
		//Interface with South
		//Source ports
		.south_data_i(south_data_i_wght),
		.south_enable_i(south_enable_i_wght),
		
		//Destination ports
		.south_data_o(south_data_o_wght),
		.south_enable_o(south_enable_o_wght),
		
		
		//Interface with West
		//Source ports
		.west_data_i(west_data_i_west_0_wght),
		.west_enable_i(west_enable_i_west_0_wght),
		
		//Destination ports
		.west_data_o(west_data_o_west_0_wght),
		.west_enable_o(west_enable_o_west_0_wght),
		
		
		//Interface with East
		//Source ports
		.east_data_i(east_data_i_wght),
		.east_enable_i(east_enable_i_wght),
        
		//Destination ports
        .east_data_o(east_data_o_wght),
        .east_enable_o(east_enable_o_wght)
		);
	router_west_psum
	#(
		.DATA_BITWIDTH(DATA_BITWIDTH),
		.ADDR_BITWIDTH_GLB(ADDR_BITWIDTH_GLB),
		.ADDR_BITWIDTH_SPAD(ADDR_BITWIDTH_SPAD),
		.PSUM_READ_ADDR(PSUM_READ_ADDR),
		.PSUM_LOAD_ADDR(PSUM_LOAD_ADDR),
		.X_dim(X_dim),
	    .Y_dim(Y_dim),
	    .kernel_size(kernel_size),
	    .act_size(act_size)
		)
	router_west_0_psum(
		.clk(clk),
		.reset(reset),
		.router_mode(router_mode_west_0_psum),
		.north_data_i(north_data_i_psum),
		.north_enable_i(north_enable_i_psum),
		.south_data_o(south_data_o_psum),
		.south_enable_o(south_enable_o_psum),
		.west_data_i(west_data_i_west_0_psum),
		.west_enable_i(west_enable_i_west_0_psum),
		.west_data_o(west_data_o_west_0_psum),
		.west_enable_o(west_enable_o_west_0_psum),
		.east_data_i(east_data_i_west_0_psum),
		.east_enable_i(east_enable_i_west_0_psum),
		.east_data_o(east_data_o_west_0_psum),
		// .east_enable_o(east_enable_o_west_0_psum),
		.w_addr_glb_psum(west_addr_o_west_0_psum)
		);
	endmodule