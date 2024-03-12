`timescale 1ns / 1ps

module GLB_cluster_wpsum 
			#( 
			parameter DATA_BITWIDTH = 16,
			parameter ADDR_BITWIDTH = 10,
			parameter X_dim = 3,
			parameter Y_dim = 3,
			parameter NUM_GLB_IACT = 1,
			parameter NUM_GLB_PSUM = 1,
			parameter NUM_GLB_WGHT = 1
			)
		   ( input clk,
			 input reset,
			 
			 input read_req_iact, 
			 input read_req_psum,
			 input read_req_wght,
			 input read_req_psum_inter,

			 input write_en_iact, 
			 input write_en_psum,
			 input write_en_wght,

			 
			 input [ADDR_BITWIDTH-1 : 0] r_addr_iact,
			 input [ADDR_BITWIDTH-1 : 0] r_addr_psum,
			 input [ADDR_BITWIDTH-1 : 0] r_addr_wght,
			 input [ADDR_BITWIDTH-1 : 0] r_addr_psum_inter,
			 input [ADDR_BITWIDTH-1 : 0] w_addr_iact,
			 input [ADDR_BITWIDTH-1 : 0] w_addr_psum,
			 input [ADDR_BITWIDTH-1 : 0] w_addr_wght,
			 
			 input [DATA_BITWIDTH-1 : 0] w_data_iact,
			 input [DATA_BITWIDTH-1 : 0] w_data_psum,
			 input [DATA_BITWIDTH-1 : 0] w_data_wght,
			 
			 output  [DATA_BITWIDTH-1 : 0] r_data_iact,
			 output  [DATA_BITWIDTH-1 : 0] r_data_psum,
			 output  [DATA_BITWIDTH-1 : 0] r_data_wght,
			 output  [DATA_BITWIDTH*X_dim-1 : 0] r_data_psum_inter,
			 output  read_en_psum_inter
			);
			
			//Instantiate iact global buffer
			generate
			genvar i;
			for(i=0; i<NUM_GLB_IACT; i=i+1) 
				begin:glb_iact_gen
					glb_iact	#( .ADDR_BITWIDTH(ADDR_BITWIDTH),
								 .DATA_BITWIDTH(DATA_BITWIDTH)
								)
					glb_iact_inst ( .clk(clk), 
									.reset(reset),
									.read_req(read_req_iact),
									.write_en(write_en_iact), 
									.r_addr(r_addr_iact), 
									.w_data(w_data_iact),
									.r_data(r_data_iact), 
									.w_addr(w_addr_iact)
									);
				end
			endgenerate
			
			
			// Instantiate psum global buffer
			generate
			genvar j;
			for(j=0; j<NUM_GLB_PSUM; j=j+1) 
				begin:glb_psum_gen
					glb_psum #( .ADDR_BITWIDTH(ADDR_BITWIDTH),
							.DATA_BITWIDTH(DATA_BITWIDTH),
							.X_dim(X_dim),
							.Y_dim(Y_dim)
							) 
					glb_psum_inst ( .clk(clk), 
									.reset(reset), 
									.read_req(read_req_psum),
									.write_en(write_en_psum), 
									.r_addr(r_addr_psum), 
									.w_data(w_data_psum),
									.r_data(r_data_psum), 
									.w_addr(w_addr_psum),
									.r_addr_inter(r_addr_psum_inter),
									.read_req_inter(read_req_psum_inter),
									.r_data_inter(r_data_psum_inter),
									.read_en_inter(read_en_psum_inter)
									);
				end
			endgenerate
	
			//Instantiate weight global buffer
			generate
			genvar k;
			for(k=0; k<NUM_GLB_WGHT; k=k+1) 
				begin:glb_wght_gen
					glb_weight #( .ADDR_BITWIDTH(ADDR_BITWIDTH),
							.DATA_BITWIDTH(DATA_BITWIDTH)
							) 
					glb_weight_inst ( .clk(clk), 
									.reset(reset), 
									.read_req(read_req_wght),
									.write_en(write_en_wght), 
									.r_addr(r_addr_wght), 
									.w_data(w_data_wght),
									.r_data(r_data_wght), 
									.w_addr(w_addr_wght)
									);
				end
			endgenerate
endmodule
