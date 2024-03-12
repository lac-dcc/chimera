`timescale 1ns / 1ps

module HMNOC_4cluster_wpsum_mf_tb();
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
    parameter act_size = 7;
    parameter NUM_GLB_IACT = 1;
    parameter NUM_GLB_PSUM = 1;
    parameter NUM_GLB_WGHT = 1;



    reg clk, reset;
//  PE interfaces                     //
	reg start;
	wire compute_done;
	wire load_done;



//          GLB Interfaces              //


//    west 0 glb interfaces             //
	reg write_en_iact_west_0;
	reg [DATA_BITWIDTH-1:0] w_data_iact_west_0;
	reg [ADDR_BITWIDTH-1:0] w_addr_iact_west_0;
	
	reg [DATA_BITWIDTH-1:0] w_data_wght_west_0;
	reg [ADDR_BITWIDTH-1:0] w_addr_wght_west_0;
	reg write_en_wght_west_0;

	reg [ADDR_BITWIDTH-1:0] r_addr_psum_west_0;
	wire [DATA_BITWIDTH-1:0] r_data_psum_west_0;
	reg r_req_psum_west_0;


	reg [ADDR_BITWIDTH-1:0] r_addr_psum_inter_west_0;
	reg r_req_psum_inter_west_0;


//    west 1 glb interfaces            //

	reg write_en_iact_west_1;
	reg [DATA_BITWIDTH-1:0] w_data_iact_west_1;
	reg [ADDR_BITWIDTH-1:0] w_addr_iact_west_1;
	
	reg [DATA_BITWIDTH-1:0] w_data_wght_west_1;
	reg [ADDR_BITWIDTH-1:0] w_addr_wght_west_1;
	reg write_en_wght_west_1;

	reg [ADDR_BITWIDTH-1:0] r_addr_psum_west_1;
	wire [DATA_BITWIDTH-1:0] r_data_psum_west_1;
	reg r_req_psum_west_1;

	reg [ADDR_BITWIDTH-1:0] r_addr_psum_inter_west_1;
	reg r_req_psum_inter_west_1;

//   east 0   glb interfaces          //

	reg write_en_iact_east_0;
	reg [DATA_BITWIDTH-1:0] w_data_iact_east_0;
	reg [ADDR_BITWIDTH-1:0] w_addr_iact_east_0;
	
	reg [DATA_BITWIDTH-1:0] w_data_wght_east_0;
	reg [ADDR_BITWIDTH-1:0] w_addr_wght_east_0;
	reg write_en_wght_east_0;

	reg [ADDR_BITWIDTH-1:0] r_addr_psum_east_0;
	wire [DATA_BITWIDTH-1:0] r_data_psum_east_0;
	reg r_req_psum_east_0;


	reg [ADDR_BITWIDTH-1:0] r_addr_psum_inter_east_0;
	reg r_req_psum_inter_east_0;



//   east 1 glb interfaces           //


	reg write_en_iact_east_1;
	reg [DATA_BITWIDTH-1:0] w_data_iact_east_1;
	reg [ADDR_BITWIDTH-1:0] w_addr_iact_east_1;
	
	reg [DATA_BITWIDTH-1:0] w_data_wght_east_1;
	reg [ADDR_BITWIDTH-1:0] w_addr_wght_east_1;
	reg write_en_wght_east_1;

	reg [ADDR_BITWIDTH-1:0] r_addr_psum_east_1;
	wire [DATA_BITWIDTH-1:0] r_data_psum_east_1;
	reg r_req_psum_east_1;


	reg [ADDR_BITWIDTH-1:0] r_addr_psum_inter_east_1;
	reg r_req_psum_inter_east_1;



//              ROUTER ctrl            //
 	reg west_enable_i_west_0_wght;
	
	reg west_enable_i_west_0_iact;

 	reg west_enable_i_west_1_wght;
	
	reg west_enable_i_west_1_iact;

	reg west_enable_i_east_0_wght;
	
	reg west_enable_i_east_0_iact;

	reg west_enable_i_east_1_wght;
	
	reg west_enable_i_east_1_iact;


//      MODE for 4 ROUTERS          //

	reg [3:0] router_mode_west_0_wght; 
 
	reg [3:0] router_mode_west_0_iact; 

	reg [3:0] router_mode_west_0_psum;

	reg [3:0] router_mode_west_1_wght; 
 
	reg [3:0] router_mode_west_1_iact; 

	reg [3:0] router_mode_west_1_psum;

	reg [3:0] router_mode_east_0_wght; 
 
	reg [3:0] router_mode_east_0_iact; 

	reg [3:0] router_mode_east_0_psum;

	reg [3:0] router_mode_east_1_wght; 
 
	reg [3:0] router_mode_east_1_iact; 

	reg [3:0] router_mode_east_1_psum;







//   test signal for tb    //
	// reg [DATA_BITWIDTH-1:0] west_data_o_west_0_psum_tb;
	// reg west_enable_o_west_0_psum_tb;
	// reg [DATA_BITWIDTH*X_dim-1:0] west_data_i_west_0_psum_tb;
	// reg [DATA_BITWIDTH*X_dim-1:0] east_data_o_west_0_psum_tb;
	// reg [ADDR_BITWIDTH-1:0] west_addr_o_west_0_psum_tb;
	// reg [DATA_BITWIDTH*X_dim-1:0] east_data_i_west_0_psum_tb;

	HMNOC_4cluster_wpsum

		#(
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
	HMNOC_4cluster_0
		(
		.clk(clk), 
		.reset(reset),
		.start(start),	  
		.compute_done(compute_done),
		.load_done(load_done),

		// west 0  Interfaces
		.write_en_iact_west_0(write_en_iact_west_0),
		.w_data_iact_west_0(w_data_iact_west_0),
		.w_addr_iact_west_0(w_addr_iact_west_0),

		.west_enable_i_west_0_iact(west_enable_i_west_0_iact),
		.router_mode_west_0_iact(router_mode_west_0_iact),



		.write_en_wght_west_0(write_en_wght_west_0),
		.w_data_wght_west_0(w_data_wght_west_0),
		.w_addr_wght_west_0(w_addr_wght_west_0),

		.west_enable_i_west_0_wght(west_enable_i_west_0_wght),
		.router_mode_west_0_wght(router_mode_west_0_wght),


		.r_req_psum_west_0(r_req_psum_west_0),
		.r_req_psum_inter_west_0(r_req_psum_inter_west_0),
		.r_addr_psum_west_0(r_addr_psum_west_0),
		.r_addr_psum_inter_west_0(r_addr_psum_inter_west_0),
		.r_data_psum_west_0(r_data_psum_west_0),
		.router_mode_west_0_psum(router_mode_west_0_psum),
//      west 1 interfaces
		.write_en_iact_west_1(write_en_iact_west_1),
		.w_data_iact_west_1(w_data_iact_west_1),
		.w_addr_iact_west_1(w_addr_iact_west_1),

		.west_enable_i_west_1_iact(west_enable_i_west_1_iact),
		.router_mode_west_1_iact(router_mode_west_1_iact),



		.write_en_wght_west_1(write_en_wght_west_1),
		.w_data_wght_west_1(w_data_wght_west_1),
		.w_addr_wght_west_1(w_addr_wght_west_1),

		.west_enable_i_west_1_wght(west_enable_i_west_1_wght),
		.router_mode_west_1_wght(router_mode_west_1_wght),


		.r_req_psum_west_1(r_req_psum_west_1),
		.r_req_psum_inter_west_1(r_req_psum_inter_west_1),
		.r_addr_psum_west_1(r_addr_psum_west_1),
		.r_addr_psum_inter_west_1(r_addr_psum_inter_west_1),
		.r_data_psum_west_1(r_data_psum_west_1),
		.router_mode_west_1_psum(router_mode_west_1_psum),
//      east 0 interfaces
		.write_en_iact_east_0(write_en_iact_east_0),
		.w_data_iact_east_0(w_data_iact_east_0),
		.w_addr_iact_east_0(w_addr_iact_east_0),

		.west_enable_i_east_0_iact(west_enable_i_east_0_iact),
		.router_mode_east_0_iact(router_mode_east_0_iact),



		.write_en_wght_east_0(write_en_wght_east_0),
		.w_data_wght_east_0(w_data_wght_east_0),
		.w_addr_wght_east_0(w_addr_wght_east_0),

		.west_enable_i_east_0_wght(west_enable_i_east_0_wght),
		.router_mode_east_0_wght(router_mode_east_0_wght),


		.r_req_psum_east_0(r_req_psum_east_0),
		.r_req_psum_inter_east_0(r_req_psum_inter_east_0),
		.r_addr_psum_east_0(r_addr_psum_east_0),
		.r_addr_psum_inter_east_0(r_addr_psum_inter_east_0),
		.r_data_psum_east_0(r_data_psum_east_0),
		.router_mode_east_0_psum(router_mode_east_0_psum),
//      east 1 interfaces
		.write_en_iact_east_1(write_en_iact_east_1),
		.w_data_iact_east_1(w_data_iact_east_1),
		.w_addr_iact_east_1(w_addr_iact_east_1),

		.west_enable_i_east_1_iact(west_enable_i_east_1_iact),
		.router_mode_east_1_iact(router_mode_east_1_iact),



		.write_en_wght_east_1(write_en_wght_east_1),
		.w_data_wght_east_1(w_data_wght_east_1),
		.w_addr_wght_east_1(w_addr_wght_east_1),

		.west_enable_i_east_1_wght(west_enable_i_east_1_wght),
		.router_mode_east_1_wght(router_mode_east_1_wght),


		.r_req_psum_east_1(r_req_psum_east_1),
		.r_req_psum_inter_east_1(r_req_psum_inter_east_1),
		.r_addr_psum_east_1(r_addr_psum_east_1),
		.r_addr_psum_inter_east_1(r_addr_psum_inter_east_1),
		.r_data_psum_east_1(r_data_psum_east_1),
		.router_mode_east_1_psum(router_mode_east_1_psum)


//     test signal for tb   //
		// .west_data_o_west_0_psum_tb(west_data_o_west_0_psum_tb),
		// .west_enable_o_west_0_psum_tb(west_enable_o_west_0_psum_tb),
		// .west_data_i_west_0_psum_tb(west_data_i_west_0_psum_tb),
		// .east_data_o_west_0_psum_tb(east_data_o_west_0_psum_tb),
		// .west_addr_o_west_0_psum_tb(west_addr_o_west_0_psum_tb),
		// .east_data_i_west_0_psum_tb(east_data_i_west_0_psum_tb)
		);

	integer clk_prd = 10;
	integer i,j,a,m,n;
	localparam size=510;
	integer handle_west_0,handle_west_1,handle_east_0,handle_east_1;
	integer desc_west_0,desc_west_1,desc_east_0,desc_east_1;
	reg [DATA_BITWIDTH-1:0] cluster_out_1[0:8];
	reg [DATA_BITWIDTH-1:0] mem[0:size*size-1];
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
	for(m=0;m<size/6;m=m+1) begin
			for(n=0;n<size/6;n=n+1) begin
		reset = 1; #30;
		reset = 0;
		start = 0;
		west_enable_i_west_0_wght = 0;
		west_enable_i_west_1_wght = 0;
		west_enable_i_east_0_wght = 0;
		west_enable_i_east_1_wght = 0;
		west_enable_i_east_0_iact = 0;
		west_enable_i_east_1_iact = 0;
		west_enable_i_west_0_iact = 0;
		west_enable_i_west_1_iact = 0;
		router_mode_west_0_wght = CLOSED;
		router_mode_east_0_wght = CLOSED;		
		router_mode_west_1_wght = CLOSED;		
		router_mode_east_1_wght = CLOSED;
		router_mode_east_0_iact = CLOSED;
		router_mode_east_1_iact = CLOSED;	
		router_mode_west_0_iact = CLOSED;
		router_mode_west_1_iact = CLOSED;
		router_mode_west_0_psum = CLOSED;
		router_mode_west_1_psum = CLOSED;
		router_mode_east_0_psum = CLOSED;
		router_mode_east_1_psum = CLOSED;

		// router_mode = 0;
		

		#100;
		$readmemb("F:\\study_files\\Master\\low power design\\eyeriss\\lena_pixel.txt",mem);
		// $display("memory 0 is %b",mem[0]);
		// $readmemb("..\\lena_pixel.txt",mem);
		handle_west_0=$fopen("..\\lena_mf_west_0.txt");
		handle_west_1=$fopen("..\\lena_mf_west_1.txt");
		handle_east_0=$fopen("..\\lena_mf_east_0.txt");
		handle_east_1=$fopen("..\\lena_mf_east_1.txt");
		desc_west_0=handle_west_0|1;
		desc_west_1=handle_west_1|1;
		desc_east_0=handle_east_0|1;
		desc_east_1=handle_east_1|1;
		// pe_before=0;
		//writing weights to glb_wght
		write_en_wght_west_0 = 1;		
		for(i=0; i<kernel_size**2;i=i+1) begin
			w_data_wght_west_0 = 1;
			w_addr_wght_west_0 = W_LOAD_ADDR+i;
			#(clk_prd);
		end
		write_en_wght_west_0 = 0;
		
		//writing activations to  glb_iact
		write_en_iact_west_0 = 1;
		write_en_iact_west_1 = 1;
		write_en_iact_east_0 = 1;
		write_en_iact_east_1 = 1;
		for(i=0; i<act_size;i=i+1) begin
			for(j=0;j<act_size;j=j+1) begin
			w_data_iact_west_0 = mem[size*(3*m+i)+(3*n+j)];
			w_data_iact_west_1 = mem[size*(3*m+i+size/2-2)+(3*n+j)];
			w_data_iact_east_0 = mem[size*(3*m+i)+(3*n+j+size/2-2)];
			w_data_iact_east_1 = mem[size*(3*m+i+size/2-2)+(3*n+j+size/2-2)];
			// w_data_iact_west_0=0;
			// w_data_iact_west_1=128;
			// w_data_iact_east_0=255;
			// w_data_iact_east_1=0;
			w_addr_iact_west_0 = A_LOAD_ADDR + i*act_size+j;
			w_addr_iact_west_1 = A_LOAD_ADDR + i*act_size+j;
			w_addr_iact_east_0 = A_LOAD_ADDR + i*act_size+j;
			w_addr_iact_east_1 = A_LOAD_ADDR + i*act_size+j;
			// $display("west_0 data iact is %16b",w_data_iact_west_0);
			#(clk_prd);

			end
		end
		write_en_iact_west_0 = 0;
		write_en_iact_west_1 = 0;
		write_en_iact_east_0 = 0;
		write_en_iact_east_1 = 0;
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

		// router_mode_west_0_wght = WEST;

		router_mode_west_0_wght = ALL;

		router_mode_east_0_wght = EASTSOUTH;
		
		router_mode_west_1_wght = WEST;
		
		router_mode_east_1_wght = EAST;
		
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

		router_mode_east_0_wght = CLOSED;
		
		router_mode_west_1_wght = CLOSED;
		
		router_mode_east_1_wght = CLOSED;
		
				wait(load_done==1);

		$display("\n\nLoading Begins: Iacts.....\n\n");
		// read_req_iact = 1;
		// r_addr_iact	= 0;
		#(clk_prd);
		west_enable_i_west_0_iact = 1;
		west_enable_i_west_1_iact = 1;
		west_enable_i_east_0_iact = 1;
		west_enable_i_east_1_iact = 1;
		router_mode_west_0_iact = WEST;
		router_mode_west_1_iact = WEST;
		router_mode_east_0_iact = WEST;
		router_mode_east_1_iact = WEST;
		
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
		west_enable_i_west_1_iact = 0;
		west_enable_i_east_0_iact = 0;
		west_enable_i_east_1_iact = 0;
		router_mode_west_0_iact = CLOSED;
		router_mode_west_1_iact = CLOSED;
		router_mode_east_0_iact = CLOSED;
		router_mode_east_1_iact = CLOSED;

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
			r_req_psum_west_0=1;
			r_addr_psum_west_0=PSUM_LOAD_ADDR+i;
			r_req_psum_west_1=1;
			r_addr_psum_west_1=PSUM_LOAD_ADDR+i;
			r_req_psum_east_0=1;
			r_addr_psum_east_0=PSUM_LOAD_ADDR+i;
			r_req_psum_east_1=1;
			r_addr_psum_east_1=PSUM_LOAD_ADDR+i;
			#(clk_prd);
			// $display("\npsum from column %d on west_0 is:%d",i+1,r_data_psum_west_0);
			// $display("\npsum from column %d on west_1 is:%d",i+1,r_data_psum_west_1);
			// $display("\npsum from column %d on east_0 is:%d",i+1,r_data_psum_east_0);
			// $display("\npsum from column %d on east_1 is:%d",i+1,r_data_psum_east_1);
			$fdisplay(desc_west_0,"%b",r_data_psum_west_0);
			$fdisplay(desc_west_1,"%b",r_data_psum_west_1);
			$fdisplay(desc_east_0,"%b",r_data_psum_east_0);
			$fdisplay(desc_east_1,"%b",r_data_psum_east_1);
			
		end
		r_req_psum_west_0=0;
		r_req_psum_west_1=0;
		r_req_psum_east_0=0;
		r_req_psum_east_1=0;

		start = 1; #25; 
		$display("\n\nReading & Computing Begins for iter 2.....\n\n");
		start = 0;

		// r_req_psum_inter_west_0=1;
		// r_addr_psum_inter_west_0=PSUM_LOAD_ADDR;
		// router_mode_west_0_psum =EAST;
		



		wait (compute_done == 1);	
		$display("\n\nFinal PSUM of Iteration 2:");
		#10;
		router_mode_west_0_psum=CLOSED;
		r_req_psum_inter_west_0=0;
		#(8*clk_prd);

		for(i=0;i<X_dim;i=i+1)
		begin
			r_req_psum_west_0=1;
			r_addr_psum_west_0=PSUM_LOAD_ADDR+1*X_dim+i;
			r_req_psum_west_1=1;
			r_addr_psum_west_1=PSUM_LOAD_ADDR+1*X_dim+i;
			r_req_psum_east_0=1;
			r_addr_psum_east_0=PSUM_LOAD_ADDR+1*X_dim+i;
			r_req_psum_east_1=1;
			r_addr_psum_east_1=PSUM_LOAD_ADDR+1*X_dim+i;
			#(clk_prd);
			// $display("\npsum from column %d on west_0 is:%d",i+1,r_data_psum_west_0);
			// $display("\npsum from column %d on west_1 is:%d",i+1,r_data_psum_west_1);
			// $display("\npsum from column %d on east_0 is:%d",i+1,r_data_psum_east_0);
			// $display("\npsum from column %d on east_1 is:%d",i+1,r_data_psum_east_1);
			$fdisplay(desc_west_0,"%b",r_data_psum_west_0);
			$fdisplay(desc_west_1,"%b",r_data_psum_west_1);
			$fdisplay(desc_east_0,"%b",r_data_psum_east_0);
			$fdisplay(desc_east_1,"%b",r_data_psum_east_1);
		end
		
		r_req_psum_west_0=0;
		r_req_psum_west_1=0;
		r_req_psum_east_0=0;
		r_req_psum_east_1=0;
 	// 	for(i=0; i<X_dim; i=i+1) begin
		// 	cluster_out_1[i+X_dim] = pe_out_west_0[i];
		// 	$display("\npsum from column %d is:%d",i+1,pe_out_west_0[i]);
		// end
		
		#40;
		start = 1; #25; 
		$display("\n\nReading & Computing Begins for iter 3.....\n\n");
		start = 0;
		// r_req_psum_inter_west_0=1;
		// r_addr_psum_inter_west_0=PSUM_LOAD_ADDR;
		// router_mode_west_0_psum=SOUTH;
		// router_mode_west_1_psum =EAST;



		wait (compute_done == 1);	
		#10;
		// router_mode_west_0_psum=CLOSED;
		// router_mode_west_1_psum=CLOSED;
		// r_req_psum_inter_west_0=0;
		#(8*clk_prd);
		for(i=0;i<X_dim;i=i+1)
		begin
			r_req_psum_west_0=1;
			r_addr_psum_west_0=PSUM_LOAD_ADDR+2*X_dim+i;
			r_req_psum_west_1=1;
			r_addr_psum_west_1=PSUM_LOAD_ADDR+2*X_dim+i;
			r_req_psum_east_0=1;
			r_addr_psum_east_0=PSUM_LOAD_ADDR+2*X_dim+i;
			r_req_psum_east_1=1;
			r_addr_psum_east_1=PSUM_LOAD_ADDR+2*X_dim+i;
			#(clk_prd);
			// $display("\npsum from column %d on west_0 is:%d",i+1,r_data_psum_west_0);
			// $display("\npsum from column %d on west_1 is:%d",i+1,r_data_psum_west_1);
			// $display("\npsum from column %d on east_0 is:%d",i+1,r_data_psum_east_0);
			// $display("\npsum from column %d on east_1 is:%d",i+1,r_data_psum_east_1);
			$fdisplay(desc_west_0,"%b",r_data_psum_west_0);
			$fdisplay(desc_west_1,"%b",r_data_psum_west_1);
			$fdisplay(desc_east_0,"%b",r_data_psum_east_0);
			$fdisplay(desc_east_1,"%b",r_data_psum_east_1);
			
		end
		r_req_psum_west_0=0;
		r_req_psum_west_1=0;
		r_req_psum_east_0=0;
		r_req_psum_east_1=0;
		end
		end

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