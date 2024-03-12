`timescale 1ns / 1ps

module PE_cluster_new #(parameter DATA_BITWIDTH = 16,
					parameter ADDR_BITWIDTH = 9,
					
					parameter X_dim = 5,
					parameter Y_dim = 3,
   
					parameter kernel_size = 3,
					parameter act_size = 5,
					
					parameter W_READ_ADDR = 0,  
					parameter A_READ_ADDR = 100,
					
					parameter W_LOAD_ADDR = 0,  
					parameter A_LOAD_ADDR = 100,
					
					parameter PSUM_ADDR = 500
					)
					( 
					input clk, reset,
					input [DATA_BITWIDTH-1:0] act_in,
					input [DATA_BITWIDTH-1:0] filt_in,
					input [DATA_BITWIDTH*X_dim-1:0] pe_before,
					// output [7:0] filt_count_n,
//					input load_en, 
					input load_en_wght, load_en_act,
					input start,
					output reg [DATA_BITWIDTH*X_dim-1:0] pe_out,
					output  compute_done,
					output  load_done
					
		//extra 
		//			output reg [DATA_BITWIDTH-1:0] psum_out[0 : X_dim*Y_dim-1]
					);
		
		wire [DATA_BITWIDTH-1:0] psum_out[0 : X_dim*Y_dim-1];
		
		wire cluster_done[0 : X_dim*Y_dim-1];
		wire cluster_load_done[0 : X_dim*Y_dim-1];
		
		generate
		genvar i;
		for(i=0; i<X_dim; i=i+1) 
			begin:gen_X
				genvar j;
				for(j=0; j<Y_dim; j=j+1)
					begin:gen_Y
					
						PE_new #( 	.DATA_BITWIDTH(DATA_BITWIDTH),
								.ADDR_BITWIDTH(ADDR_BITWIDTH),
								.kernel_size(kernel_size),
								.act_size(act_size),
								.W_READ_ADDR(W_READ_ADDR + kernel_size*j),  
								.A_READ_ADDR(A_READ_ADDR + act_size*j + i),
								.W_LOAD_ADDR(W_LOAD_ADDR),  
								.A_LOAD_ADDR(A_LOAD_ADDR),
								.PSUM_ADDR(PSUM_ADDR)
							)
						pe (	
								.clk(clk),
								.reset(reset),
								.act_in(act_in),
								.filt_in(filt_in),
								// .filt_count_n(filt_count_n),
//								.load_en(load_en),
								.load_en_wght(load_en_wght),
								.load_en_act(load_en_act),
								// .pe_before(pe_before),
								.start(start),
								.pe_out(psum_out[i*Y_dim+j]),
								.compute_done(cluster_done[i*Y_dim+j]),
								.load_done(cluster_load_done[i*Y_dim+j])
							);
					
					end
			end
		endgenerate
		
		
/*  		virtual class psum_adder_class #(parameter X_dim, parameter Y_dim, parameter DATA_BITWIDTH);
			static function reg [DATA_BITWIDTH-1 : 0] psum_adder 
				(
					input reg [DATA_BITWIDTH-1:0] psum_out[X_dim*Y_dim-1 : 0]
				);
				begin
					psum_adder = {(DATA_BITWIDTH){1'b0}};
					for(i=0; i<Y_dim; i++) begin
						psum_adder = psum_adder + psum_out[Y_dim*X_dim+i];
					end
				end
			endfunction
		endclass  */
					
		


 		// 	function reg [DATA_BITWIDTH-1 : 0] psum_adder 
			// 	(
			// 		input reg [DATA_BITWIDTH-1:0] pe_before_i,
			// 		input reg [DATA_BITWIDTH-1:0] psum_out[0 : X_dim*Y_dim-1],
			// 		input reg [3:0] X_dim,
			// 		input reg [3:0] Y_dim
			// 	);
			// 	begin
			// 		psum_adder = pe_before_i+psum_out[Y_dim*X_dim]+psum_out[Y_dim*X_dim+1]+psum_out[Y_dim*X_dim+2];
			// 		// generate
			// 		// 	genvar i;
			// 		// 	for(i=0; i<Y_dim; i=i+1) begin
			// 		// 	psum_adder = psum_adder + psum_out[Y_dim*X_dim+i];
			// 		// 	end
			// 		// endgenerate
					
			// 	end
			// endfunction
				
				
			
		
		
		// Add partial sums and register at pe_out
		always@(posedge clk) begin
			if(reset)
			begin
					pe_out <= 0;
			end 
			else
			begin
				// pe_out=0;
				// pe_out<={psum_adder(pe_before[DATA_BITWIDTH-1:0],psum_out,0,Y_dim),psum_adder(pe_before[2*DATA_BITWIDTH-1:DATA_BITWIDTH],psum_out,1,Y_dim),psum_adder(pe_before[3*DATA_BITWIDTH-1:2*DATA_BITWIDTH],psum_out,2,Y_dim)};
				pe_out[DATA_BITWIDTH-1:0] <= pe_before[DATA_BITWIDTH-1:0]+psum_out[0]+psum_out[1]+psum_out[2];
				pe_out[2*DATA_BITWIDTH-1:DATA_BITWIDTH] <= pe_before[2*DATA_BITWIDTH-1 -:DATA_BITWIDTH]+psum_out[1*Y_dim+0]+psum_out[1*Y_dim+1]+psum_out[1*Y_dim+2];
				pe_out[3*DATA_BITWIDTH-1:2*DATA_BITWIDTH] <= pe_before[3*DATA_BITWIDTH-1 -:DATA_BITWIDTH]+psum_out[2*Y_dim+0]+psum_out[2*Y_dim+1]+psum_out[2*Y_dim+2];
				// generate
				// 	genvar i;
				// 	for(i=0; i<X_dim; i=i+1) begin
				// 	pe_out[i*DATA_BITWIDTH:(i+1)*DATA_BITWIDTH-1] <= psum_adder(pe_before[i],psum_out,i,Y_dim);
				// end
				// endgenerate
				
			end
			
		end
		
		
		assign compute_done = cluster_done[0];
		assign load_done = cluster_load_done[0];
		
	//	assign pe_out[X_dim-1:0] = psum_out[X_dim*Y_dim-1 : 0]
			  
endmodule
				   
				   
				   
				   
				   
				   
				   
				   
				   
				   