`timescale 1ns / 1ps

module HMNOC_1cluster_wpsum_tb();
	// parameter DATA_BITWIDTH = 16;
	// parameter ADDR_BITWIDTH = 7;
	parameter ADDR_BITWIDTH_GLB = 6;
	parameter ADDR_BITWIDTH_SPAD = 6;
	parameter DATA_BITWIDTH = 16;
	parameter ADDR_BITWIDTH = 6;
    parameter A_READ_ADDR = 10;
	parameter A_LOAD_ADDR = 10;
	parameter W_READ_ADDR = 0;
	parameter W_LOAD_ADDR = 0;
	parameter PSUM_READ_ADDR = 0;
	parameter PSUM_LOAD_ADDR = 0;
	parameter PSUM_ADDR =40;
    parameter X_dim = 3;
    parameter Y_dim = 3;
    
    parameter kernel_size = 3;
    parameter act_size = 5;
    parameter NUM_GLB_IACT = 1;
    parameter NUM_GLB_PSUM = 1;
    parameter NUM_GLB_WGHT = 1;
    reg clk, reset;
	reg start;

	wire compute_done;
	wire load_done;
	// reg [DATA_BITWIDTH-1:0] pe_before;
	// reg [DATA_BITWIDTH-1:0] pe_out_west_0;


	// GLB Interports
	reg write_en_iact;
	reg [DATA_BITWIDTH-1:0] w_data_iact;
	reg [ADDR_BITWIDTH-1:0] w_addr_iact;
	
	reg [DATA_BITWIDTH-1:0] w_data_wght;
	reg [ADDR_BITWIDTH-1:0] w_addr_wght;
	reg write_en_wght;

	reg [ADDR_BITWIDTH-1:0] r_addr_psum;
	wire [DATA_BITWIDTH-1:0] r_data_psum;
	reg r_req_psum;


	reg [ADDR_BITWIDTH-1:0] r_addr_psum_inter;
	reg r_req_psum_inter;


 	reg west_enable_i_west_0_wght;
	
	reg west_enable_i_west_0_iact;

	reg [3:0] router_mode_west_0_wght; 
 
	reg [3:0] router_mode_west_0_iact; 

	reg [3:0] router_mode_west_0_psum;


//   test signal for tb    //
	// reg [DATA_BITWIDTH-1:0] west_data_o_west_0_psum_tb;
	// reg west_enable_o_west_0_psum_tb;
	// reg [DATA_BITWIDTH*X_dim-1:0] west_data_i_west_0_psum_tb;
	// reg [DATA_BITWIDTH*X_dim-1:0] east_data_o_west_0_psum_tb;
	// reg [ADDR_BITWIDTH-1:0] west_addr_o_west_0_psum_tb;
	// reg [DATA_BITWIDTH*X_dim-1:0] east_data_i_west_0_psum_tb;

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
	HMNOC_1cluster_0
		(
		.clk(clk), 
		.reset(reset),
		.start(start),
		// .load_en_wght(load_en_wght), 
		// .load_en_iact(load_en_iact),
	  
		.compute_done(compute_done),
		.load_done(load_done),
		// .pe_before(pe_before),
		// .pe_out_west_0(pe_out_west_0),



		// GLB Interports
		.write_en_iact(write_en_iact),
		.w_data_iact(w_data_iact),
		.w_addr_iact(w_addr_iact),

		.west_enable_i_west_0_iact(west_enable_i_west_0_iact),
		.router_mode_west_0_iact(router_mode_west_0_iact),



		.write_en_wght(write_en_wght),
		.w_data_wght(w_data_wght),
		.w_addr_wght(w_addr_wght),

		.west_enable_i_west_0_wght(west_enable_i_west_0_wght),
		.router_mode_west_0_wght(router_mode_west_0_wght),


		.west_0_req_read_psum(r_req_psum),
		.west_0_req_read_psum_inter(r_req_psum_inter),
		.r_addr_psum(r_addr_psum),
		.r_addr_psum_inter(r_addr_psum_inter),
		.r_data_psum(r_data_psum),
		.router_mode_west_0_psum(router_mode_west_0_psum),

		.north_data_i_iact(),
		.north_enable_i_iact(),
		.north_data_o_iact(),
		.north_enable_o_iact(),
		.south_data_i_iact(),
		.south_enable_i_iact(),
		.south_data_o_iact(),
		.south_enable_o_iact(),
		.east_data_i_iact(),
		.east_enable_i_iact(),
		.east_data_o_iact(),
		.east_enable_o_iact(),



		.north_data_i_wght(),
		.north_enable_i_wght(),
		.north_data_o_wght(),
		.north_enable_o_wght(),
		.south_data_i_wght(),
		.south_enable_i_wght(),
		.south_data_o_wght(),
		.south_enable_o_wght(),
		.east_data_i_wght(),
		.east_enable_i_wght(),
		.east_data_o_wght(),
		.east_enable_o_wght(),
	


		.north_data_i_psum(),
		.north_enable_i_psum(),
		.south_data_o_psum(),
		.south_enable_o_psum()

//     test signal for tb   //
		// .west_data_o_west_0_psum_tb(west_data_o_west_0_psum_tb),
		// .west_enable_o_west_0_psum_tb(west_enable_o_west_0_psum_tb),
		// .west_data_i_west_0_psum_tb(west_data_i_west_0_psum_tb),
		// .east_data_o_west_0_psum_tb(east_data_o_west_0_psum_tb),
		// .west_addr_o_west_0_psum_tb(west_addr_o_west_0_psum_tb),
		// .east_data_i_west_0_psum_tb(east_data_i_west_0_psum_tb)
		);

	integer clk_prd = 10;
	integer i,a;
	reg [DATA_BITWIDTH-1:0] cluster_out_1[0:8];
	
	always begin
		clk = 0; #(clk_prd/2);
		clk = 1; #(clk_prd/2);
		//0.1GHz
	end
	
	
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
	
	initial begin
	
		reset = 1; #30;
		reset = 0;
		start = 0;
		west_enable_i_west_0_wght = 0;

		west_enable_i_west_0_iact = 0;
		router_mode_west_0_wght = CLOSED;

		router_mode_west_0_iact = CLOSED;

		router_mode_west_0_psum = CLOSED;

		// router_mode = 0;
		

		#100;
		// pe_before=0;
		//writing weights to glb_wght
		write_en_wght = 1;		
		for(i=0; i<kernel_size**2;i=i+1) begin
			w_data_wght = 1;
			w_addr_wght = W_LOAD_ADDR+i;
			#(clk_prd);
		end
		write_en_wght = 0;
	
		//writing activations to  glb_iact
		write_en_iact = 1;
		for(i=0; i<act_size**2;i=i+1) begin
			w_data_iact = i+1;
			w_addr_iact = A_LOAD_ADDR + i;
			#(clk_prd);
		end
		write_en_iact = 0;
		#(clk_prd);

		$display("\n\nLoading Begins: Weights.....\n\n");
		
		
		// read_req_wght = 1;
		// r_addr_wght	= 0;
		
		#(clk_prd);
		#(clk_prd/2);
		west_enable_i_west_0_wght = 1;
		// west_enable_i_west_1_wght = 0;
		// east_enable_i_east_0_wght = 0;
		// east_enable_i_east_1_wght = 0;

		router_mode_west_0_wght = WEST;

		
		// load_en_wght = 1;
		#(clk_prd);
		#(clk_prd);
		#(clk_prd);
		for(i=1; i<=kernel_size**2; i=i+1) begin
			
			#(clk_prd);
			
		end
		
		// read_req_wght = 0;
		
		// #(clk_prd);
		// #(clk_prd);
		west_enable_i_west_0_wght = 0; 

		
		router_mode_west_0_wght = CLOSED;

		
				wait(load_done==1);

		$display("\n\nLoading Begins: Iacts.....\n\n");
		// read_req_iact = 1;
		// r_addr_iact	= 0;
		#(clk_prd);
		west_enable_i_west_0_iact = 1;

		router_mode_west_0_iact = WEST;

		
		// load_en_iact = 1;
		
		
		#(clk_prd);
		#(clk_prd);
		#(clk_prd);
		for(i=1; i<=act_size**2; i=i+1) begin
			// r_addr_iact= i;
			#(clk_prd);
			// load_en_iact = 0;
		end

		west_enable_i_west_0_iact = 0;
	
		router_mode_west_0_iact = CLOSED;

		wait(load_done==1);	
		#(clk_prd);
		#(clk_prd);
		start = 1; #25; 
		$display("\n\nReading & Computing Begins.....\n\n");
		start = 0;
		
		wait (compute_done == 1);
		
		$display("\n\nFinal PSUM of Iteration 1");
 		// for(i=0; i<X_dim; i=i+1) begin
			// cluster_out_1[i] = pe_out_west_0[i];
			// $display("\npsum from column %d on west0 is:%d",i+1,pe_out_west_0[i]);
			// end

		#80;
		for(i=0;i<X_dim;i=i+1)
		begin
			r_req_psum=1;
			r_addr_psum=PSUM_LOAD_ADDR+i;
			#(clk_prd);
			$display("\npsum from column %d on west0 is:%d",i+1,r_data_psum);
			
		end
		r_req_psum=0;


		start = 1; #25; 
		$display("\n\nReading & Computing Begins for iter 2.....\n\n");
		start = 0;


		// router_mode_west_0_psum =EAST;
		// r_req_psum_inter=1;
		// r_addr_psum_inter=PSUM_LOAD_ADDR;



		wait (compute_done == 1);	
		$display("\n\nFinal PSUM of Iteration 2:");
		#10;
		router_mode_west_0_psum=CLOSED;
		r_req_psum_inter=0;
		#(8*clk_prd);

		for(i=0;i<X_dim;i=i+1)
		begin
			r_req_psum=1;
			r_addr_psum=PSUM_LOAD_ADDR+X_dim+i;
			#(clk_prd);
			$display("\npsum from column %d on west0 is:%d",i+1,r_data_psum);
			
		end
		r_req_psum=0;
 	// 	for(i=0; i<X_dim; i=i+1) begin
		// 	cluster_out_1[i+X_dim] = pe_out_west_0[i];
		// 	$display("\npsum from column %d is:%d",i+1,pe_out_west_0[i]);
		// end
		
		#40;
		start = 1; #25; 
		$display("\n\nReading & Computing Begins for iter 3.....\n\n");
		start = 0;
		
		wait (compute_done == 1);	
		#(8*clk_prd);
		for(i=0;i<X_dim;i=i+1)
		begin
			r_req_psum=1;
			r_addr_psum=PSUM_LOAD_ADDR+2*X_dim+i;
			#(clk_prd);
			$display("\npsum from column %d on west0 is:%d",i+1,r_data_psum);
			
		end
		r_req_psum=0;
 	// 	for(i=0; i<X_dim; i=i+1) begin
		// cluster_out_1[i+2*X_dim] = pe_out_west_0[i];
		// 	$display("\npsum from column %d is:%d",i+1,pe_out_west_0[i]);
		// end
		 
		
		// $display("\tFinal psums of Cluster 1:\n");
		// for(a=0; a<kernel_size**2; a=a+1) begin
		// 	$display("\t\t %d \n",cluster_out_1[a]);
		// end
		
		$display("\tTotal #cycles taken: %d",cycles);
		$stop;
		
		
	end 
	
	integer cycles;
		// track # of cycles
	always @(posedge clk)
	begin
		if (reset)
			cycles = 0;
		else
			cycles = cycles + 1;
	end


endmodule