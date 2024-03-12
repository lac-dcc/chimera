`timescale 1ns / 1ps

module router_psum #( parameter DATA_BITWIDTH = 16,
						parameter ADDR_BITWIDTH_GLB = 10,
						parameter ADDR_BITWIDTH_SPAD = 9,
						
						parameter X_dim = 5,
                        parameter Y_dim = 3,
                        parameter kernel_size = 3,
                        parameter act_size = 5,
						
//						parameter A_READ_ADDR =100, 
                        
//                        parameter A_LOAD_ADDR = 0,
						
						parameter PSUM_READ_ADDR = 0,
						parameter PSUM_LOAD_ADDR = 0
					)
					
					(	input clk,
						input reset,
						
						//for writing and reading glb
						input [DATA_BITWIDTH*X_dim-1 : 0] r_data_spad_psum,
						output reg [ADDR_BITWIDTH_GLB-1 : 0] w_addr_glb_psum,
						output reg write_en_glb_psum,
						
						//for writing to spad
						output reg [DATA_BITWIDTH-1 : 0] w_data_glb_psum,
//						output reg load_en_spad,
						
						//Input from PE cluster to write psums to glb
						input write_psum_ctrl
			
					);
				
					
		// enum reg [2:0] {IDLE=3'b000, WRITE_GLB=3'b001, READ_PSUM=3'b010} state;
		reg [2:0] state;		
		localparam IDLE=3'b000;
		localparam WRITE_GLB=3'b001;
		localparam READ_PSUM=3'b010;
		reg [4:0] psum_count;
		reg [DATA_BITWIDTH*X_dim-1 : 0] pe_psum;
		reg [2:0] iter;
		
		always@(posedge clk) begin
//			$display("State of router_psum: %s", state.name());
			if(reset) begin
				w_addr_glb_psum <= PSUM_LOAD_ADDR;
				psum_count <= 0;
				write_en_glb_psum <= 0;
				iter <= 0;
				state <= IDLE;
			end else begin
				case(state)
					IDLE:begin
						if(write_psum_ctrl) begin
							//write_en_glb_psum <= 1;
							state <= READ_PSUM;
						end else begin
							psum_count <= 0;
							write_en_glb_psum <= 0;
							w_addr_glb_psum <= PSUM_LOAD_ADDR;
							state <= IDLE;
						end
					end
					
					READ_PSUM:begin
						pe_psum <= r_data_spad_psum;
//						$display("Psum read in router:%d",pe_psum[0:kernel_size-1]);
						psum_count <= 0;
						state <= WRITE_GLB;
					end
					
					WRITE_GLB:begin
						write_en_glb_psum <= 1;
//						$display("Psum written to address %d; Iter is %d",w_addr_glb_psum, iter);
						if(psum_count == (X_dim-1)) begin
							w_data_glb_psum <= pe_psum[(psum_count+1)*DATA_BITWIDTH-1 -: DATA_BITWIDTH];
							psum_count <= 0;
							w_addr_glb_psum <= w_addr_glb_psum + 1;
							iter <= iter + 1;
							state <= IDLE;
						end else begin
							w_data_glb_psum <= pe_psum[(psum_count+1)*DATA_BITWIDTH-1 -: DATA_BITWIDTH];
							psum_count <= psum_count + 1;
							
							if(psum_count == (X_dim-1)) begin
								state <= IDLE;
							end else if(psum_count == 0) begin
								w_addr_glb_psum <= PSUM_LOAD_ADDR+iter*X_dim;
								state <= WRITE_GLB;
							end else begin
								w_addr_glb_psum <= w_addr_glb_psum + 1;
								state <= WRITE_GLB;
							end
							
						end
					end
				endcase
			end
		end
 
endmodule
