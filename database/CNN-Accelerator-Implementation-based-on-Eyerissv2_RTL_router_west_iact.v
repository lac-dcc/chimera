`timescale 1ns / 1ps

module router_west_iact
	#(
		// parameter DATA_BITWIDTH = 16,
		parameter DATA_BITWIDTH = 16,
		parameter ADDR_BITWIDTH_GLB = 10,
		parameter ADDR_BITWIDTH_SPAD = 9,
		
		parameter X_dim = 5,
        parameter Y_dim = 3,
        parameter kernel_size = 3,
        parameter act_size = 5,
		
		parameter A_READ_ADDR =100, 
        parameter A_LOAD_ADDR = 0
	)
	(
		input clk,
		input reset,
		input [3:0] router_mode,
		output [ADDR_BITWIDTH_GLB-1:0] west_addr_read,
		output west_req_read,
		// output load_ctrl_state,
		//Interface with North
		//Source ports
		input [DATA_BITWIDTH-1:0] north_data_i,
		input north_enable_i,
//		output reg north_ready_o,
		
		//Destination ports
		output reg [DATA_BITWIDTH-1:0] north_data_o,
		output reg north_enable_o,
//		input north_ready_i,
		
		
		//Interface with South
		//Source ports
		input [DATA_BITWIDTH-1:0] south_data_i,
		input south_enable_i,
//		output reg south_ready_o,
		
		//Destination ports
		output reg [DATA_BITWIDTH-1:0] south_data_o,
		output reg south_enable_o,
//		input south_ready_i,
		
		
		//Interface with West
		//Source ports
		input [DATA_BITWIDTH-1:0] west_data_i,
		input west_enable_i,
//		output reg west_ready_o,
		
		//Destination ports
		output  [DATA_BITWIDTH-1:0] west_data_o,
		output  west_enable_o,
//		input west_ready_i,
		
		
		//Interface with East - Devices
		//Source ports
		input [DATA_BITWIDTH-1:0] east_data_i,
		input east_enable_i,
//		output reg east_ready_o,
		
		//Destination ports
		output reg [DATA_BITWIDTH-1:0] east_data_o,
		output reg east_enable_o
//		input east_ready_i
    );
	reg [DATA_BITWIDTH-1:0] data_out;
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
	reg load_spad_ctrl_0,load_spad_ctrl_1,load_spad_ctrl_c;
	wire load_spad_ctrl;
		// assign load_ctrl_state=load_spad_ctrl;
	//reg for selecting data_out based on enable
	// assign load_spad_ctrl_c = ((east_enable_i) || (west_enable_i)|| (north_enable_i) || (south_enable_i) );
	// assign load_spad_ctrl = ((north_enable_i == 1) | (south_enable_i==1) | (east_enable_i==1) | (west_enable_i==1));
//generate pulse signal of load_spad_ctrl
	assign load_spad_ctrl = load_spad_ctrl_0 & (~load_spad_ctrl_1);

			
	
	always @(posedge clk)
		if (reset)
			begin 
				load_spad_ctrl_0<=0;
				load_spad_ctrl_1<=0;
			end
		else 
		begin
			load_spad_ctrl_0<=load_spad_ctrl_c;
			load_spad_ctrl_1<=load_spad_ctrl_0;
		end
	
	always@(*)
	begin:data_switch
		if(north_enable_i)
		begin
			data_out = north_data_i;
			load_spad_ctrl_c=1;
			end
		else if(south_enable_i)
		begin
			data_out = south_data_i;
			load_spad_ctrl_c=1;
			end
		else if(west_enable_i)
		begin
			data_out = west_data_i;
			load_spad_ctrl_c=1;
			end
		else if(east_enable_i)
		begin
			data_out = east_data_i;
			load_spad_ctrl_c=1;
			end
		else
		begin
			data_out = 10101;
			load_spad_ctrl_c=0;
			end
	end
	

	router_iact
	#(  .DATA_BITWIDTH(DATA_BITWIDTH),
		.ADDR_BITWIDTH_GLB(ADDR_BITWIDTH_GLB),
		.ADDR_BITWIDTH_SPAD(ADDR_BITWIDTH_SPAD),
		
		.X_dim(X_dim),
	    .Y_dim(Y_dim),
	    .kernel_size(kernel_size),
	    .act_size(act_size),
		
		.A_READ_ADDR(A_READ_ADDR), 
	    .A_LOAD_ADDR(A_LOAD_ADDR)
	)

	router_iact_0
	(	.clk(clk),
		.reset(reset),
		.r_data_glb_iact(data_out),
		.r_addr_glb_iact(west_addr_read),
		.read_req_glb_iact(west_req_read),
		.w_data_spad(west_data_o),
		.load_en_spad(west_enable_o),
		.load_spad_ctrl(load_spad_ctrl)
	);
	
	//reg for data out in destination ports based on routing_mode
	always@(*)
	begin:data_reg
		case(router_mode)
			ALL:begin
				north_data_o = data_out;
				north_enable_o = 1;
				
				south_data_o = data_out;
				south_enable_o = 1;
				
				// west_data_o = data_out;
				// west_enable_o = 1;
				
				east_data_o = data_out;
				east_enable_o = 1;
			end
			
			NORTH:begin
				north_data_o = data_out;
				south_data_o = 0;
				east_data_o = 0;
				// west_data_o = 0;
				
				north_enable_o = 1;
				south_enable_o = 0;
				// west_enable_o = 0;
				east_enable_o = 0;
			end
			
			SOUTH:begin
				south_data_o = data_out;
				north_data_o = 0;
				east_data_o = 0;
				// west_data_o = 0;
				
				north_enable_o = 0;
				south_enable_o = 1;
				// west_enable_o = 0;
				east_enable_o = 0;
			end
			
			WEST:begin
				// west_data_o = data_out;
				south_data_o = 0;
				east_data_o = 0;
				north_data_o = 0;
				
				north_enable_o = 0;
				south_enable_o = 0;
				// west_enable_o = 1;
				east_enable_o = 0;
			end
			
			EAST:begin
				east_data_o = data_out;
				south_data_o = 0;
				north_data_o = 0;
				// west_data_o = 0;
				
				north_enable_o = 0;
				south_enable_o = 0;
				// west_enable_o = 0;
				east_enable_o = 1;
			end
			
			//Two Directions - Used for storing in PE cluster and routing
			//With East as compute unit
			EASTNORTH:begin
				east_data_o = data_out;
				north_data_o = data_out;
				south_data_o = 0;
				// west_data_o = 0;
				
				north_enable_o = 1;
				south_enable_o = 0;
				// west_enable_o = 0;
				east_enable_o = 1;
			end
			
			EASTSOUTH:begin
				east_data_o = data_out;
				south_data_o = data_out;
				north_data_o = 0;
				// west_data_o = 0;
				
				north_enable_o = 0;
				south_enable_o = 1;
				// west_enable_o = 0;
				east_enable_o = 1;
			end
			
			EASTWEST:begin
				east_data_o = data_out;
				// west_data_o = data_out;
				south_data_o = 0;
				north_data_o = 0;
				
				north_enable_o = 0;
				south_enable_o = 0;
				// west_enable_o = 1;
				east_enable_o = 1;
			end
			
			//With West as compute unit
			WESTNORTH:begin
				// west_data_o = data_out;
				north_data_o = data_out;
				south_data_o = 0;
				east_data_o = 0;
				
				north_enable_o = 1;
				south_enable_o = 0;
				// west_enable_o = 1;
				east_enable_o = 0;
			end
			
			WESTSOUTH:begin
				// west_data_o = data_out;
				south_data_o = data_out;
				north_data_o = 0;
				east_data_o = 0;
				
				north_enable_o = 0;
				south_enable_o = 1;
				// west_enable_o = 1;
				east_enable_o = 0;
			end
			
			WESTEAST:begin
				// west_data_o = data_out;
				east_data_o = data_out;
				south_data_o = 0;
				north_data_o = 0;
				
				north_enable_o = 0;
				south_enable_o = 0;
				// west_enable_o = 1;
				east_enable_o = 1;
			end
			CLOSED:begin
				// west_data_o = 0;
				east_data_o = data_out;
				south_data_o = 0;
				north_data_o = 0;
				
				north_enable_o = 0;
				south_enable_o = 0;
				// west_enable_o = 0;
				east_enable_o = 0;
			end
			
			default: begin
				north_data_o = 0;
				east_data_o = 0;
				south_data_o = 0;
				// west_data_o = 0;
				
				north_enable_o = 0;
				south_enable_o = 0;
				// west_enable_o = 0;
				east_enable_o = 0;
			end
		endcase
	end

endmodule
