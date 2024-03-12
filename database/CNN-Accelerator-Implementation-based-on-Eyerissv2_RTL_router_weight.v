`timescale 1ns / 1ps

module router_weight #( parameter DATA_BITWIDTH = 16,
						parameter ADDR_BITWIDTH_GLB = 10,
						parameter ADDR_BITWIDTH_SPAD = 9,
						
						parameter X_dim = 5,
                        parameter Y_dim = 3,
                        parameter kernel_size = 3,
                        parameter act_size = 5,
						
						parameter W_READ_ADDR = 0, 
                        
                        parameter W_LOAD_ADDR = 0
					)
					
					(	input clk,
						input reset,
						
						//for reading glb
						input [DATA_BITWIDTH-1 : 0] r_data_glb_wght,
						output reg [ADDR_BITWIDTH_GLB-1 : 0] r_addr_glb_wght,
						output reg read_req_glb_wght,
						
						//for writing to spad
						output reg [DATA_BITWIDTH-1 : 0] w_data_spad,
						output reg load_en_spad,
						
						//Input from control unit to load weights to spad
						input load_spad_ctrl
			
					);
				
		reg [2:0] state;		
		// enum reg [2:0] {IDLE=3'b000, READ_GLB=3'b001, WRITE_SPAD=3'b010, READ_GLB_0=3'b011} state;
		localparam IDLE=3'b000;
		localparam READ_GLB=3'b001;
		localparam WRITE_SPAD=3'b010;
		localparam READ_GLB_0=3'b011;
		reg [4:0] filt_count;
		
		always@(posedge clk) begin
//			$display("State: %s", state.name());
			if(reset) begin
				read_req_glb_wght <= 0;
				r_addr_glb_wght <= 0;
				load_en_spad <= 0;
				filt_count <= 0;
				state <= IDLE;
			end else begin
				case(state)
					IDLE:begin
						if(load_spad_ctrl) begin
							read_req_glb_wght <= 1;
							r_addr_glb_wght <= W_READ_ADDR;
							load_en_spad <= 0;
							state <= READ_GLB;
						end else begin
							read_req_glb_wght <= 0;
							load_en_spad <= 0;
							state <= IDLE;
						end
					end
					
					READ_GLB:begin
						
						filt_count <= filt_count + 1;
						r_addr_glb_wght <= r_addr_glb_wght + 1;
						w_data_spad <= r_data_glb_wght;
						state <= WRITE_SPAD;
					end
					
					WRITE_SPAD:begin
						load_en_spad <= 1;
						if(filt_count == (kernel_size**2)) begin
							w_data_spad <= r_data_glb_wght;
							filt_count <= 0;
							r_addr_glb_wght <= W_READ_ADDR;
							
							state <= IDLE;
						end else begin
							w_data_spad <= r_data_glb_wght;
							filt_count <= filt_count + 1;
							r_addr_glb_wght <= r_addr_glb_wght + 1;
							state <= WRITE_SPAD;
						end
					end
				endcase
			end
		end
 
endmodule
