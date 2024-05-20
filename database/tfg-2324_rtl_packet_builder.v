// This program was cloned from: https://github.com/p-ariza/tfg-2324
// License: MIT License

/*

Copyright (c) 2024 Pablo Ariza García

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

*/

`resetall
`timescale 1ns / 1ps
`default_nettype none

module packet_builder #(
		parameter DATA_WIDTH=512
	)
	(
		input wire clk,
		input wire rst,

		//FIFO Communication
		input  wire fifo_rd_valid,
        output wire fifo_rd_enable,

		//Command inputs
		input wire [10:0]	size,
		input wire [47:0]	d_mac,
		input wire [47:0]	s_mac,
		input wire [15:0]	ethertype,
        input wire [7 :0]   payload,

		//AXI Stream
		output wire [DATA_WIDTH-1:0]		axis_tdata,
		output wire [DATA_WIDTH/8-1:0]		axis_tkeep,
		output wire 						axis_tvalid,
		output wire 						axis_tlast
	);

	localparam N_BYTES = DATA_WIDTH/8;
	integer i;

	reg [DATA_WIDTH-1:0]		axis_tdata_reg;
	reg [DATA_WIDTH/8-1:0]		axis_tkeep_reg;
	reg 						axis_tvalid_reg;
	reg 						axis_tlast_reg;
	assign axis_tdata  = axis_tdata_reg;
	assign axis_tkeep  = axis_tkeep_reg;
	assign axis_tvalid = axis_tvalid_reg;
	assign axis_tlast  = axis_tlast_reg;

	//FIFO
	reg fifo_rd_enable_reg;

	assign fifo_rd_enable = fifo_rd_enable_reg;

	//Packet related info
	reg [10:0] byte_count = 0;
	reg [10:0] packet_size = 0;
	reg [47:0] dest_mac = 0;
	reg [47:0] sour_mac = 0;
	reg [15:0] etype = 0;
    reg [7 :0] filler = 0;

    //FSM
    reg [1:0] state;

    localparam IDLE = 0;
    localparam SEND_START = 1;
    localparam SEND = 2;
    localparam SEND_LAST = 3;

	//FIFO Communication
	always@(*) begin
		case (state)
			IDLE: begin
				// Idle, so always request a new command from FIFO
				fifo_rd_enable_reg <= 1;
			end
			SEND_START: begin
				// Request new command if a one transfer packet is being sent
				if(packet_size <= N_BYTES) begin
					fifo_rd_enable_reg <= 1;
				end else begin
					fifo_rd_enable_reg <= 0;
				end
			end
			SEND: begin
				// Never request a new command from the FIFO
				// Next state is always SEND or SEND_LAST and will never need a new command from the FIFO
				fifo_rd_enable_reg <= 0;
			end
			SEND_LAST: begin
				// Always requiest a new command from the FIFO
				// Frame transmission is ending, either start a new one or wait idle	
				fifo_rd_enable_reg <= 1;
			end
		endcase
	end

	//FSM Output
	always@(posedge clk) begin
		case (state)
			IDLE: begin
				//Not sending data
				axis_tdata_reg  <= 0;
				axis_tkeep_reg  <= 0;
				axis_tvalid_reg <= 0;
				axis_tlast_reg  <= 0;

				byte_count  <= 0;

				if(fifo_rd_valid) begin
					//Save command arguments
					packet_size <= size;
					dest_mac <= d_mac;
					sour_mac <= s_mac;
					etype <= ethertype;
                    filler <= payload;
				end
			end
			SEND_START: begin
				//Start with Header
				axis_tdata_reg[47:0  ] <= dest_mac;
				axis_tdata_reg[95:48 ] <= sour_mac;
				axis_tdata_reg[111:96] <= etype;
				axis_tdata_reg[DATA_WIDTH-1:112] <= {(N_BYTES-14){filler}};

				axis_tkeep_reg  <= ~0;
				axis_tvalid_reg <= 1;
				

				if(N_BYTES >= packet_size) begin
					//One transfer packet
					if(fifo_rd_valid) begin
						//Save next transfer command arguments
						packet_size <= size;
						dest_mac <= d_mac;
						sour_mac <= s_mac;
						etype <= ethertype;
						filler <= payload;
					end 
					axis_tlast_reg  <= 1;
					byte_count <= 0;
				end else begin
					axis_tlast_reg  <= 0;
					byte_count <= byte_count + N_BYTES;
				end
			end
			SEND: begin
				//Send full transfer
				axis_tdata_reg  <= {N_BYTES{filler}};
				axis_tkeep_reg  <= ~0;
				axis_tvalid_reg <= 1;
				axis_tlast_reg  <= 0;

				byte_count <= byte_count + N_BYTES;
			end
			SEND_LAST: begin
				//Last transfer could be incomplete
				axis_tdata_reg <= {N_BYTES{filler}};

				//Update tkeep accordingly
				for(i = 0; i < N_BYTES; i = i + 1) begin
					if(packet_size - byte_count >= i+1) begin
						axis_tkeep_reg[i] <= 1;
					end else begin
						axis_tkeep_reg[i] <= 0;
					end
				end
				axis_tvalid_reg <= 1;
				axis_tlast_reg  <= 1;

				byte_count <= 0;

				if(fifo_rd_valid) begin
					//Save command arguments
					packet_size <= size;
					dest_mac <= d_mac;
					sour_mac <= s_mac;
					etype <= ethertype;
                    filler <= payload;
				end
				
			end
		endcase
	end
    
	//FSM State Transition
    always @(posedge clk) begin
		if(rst) begin
			state <= IDLE;
		end else begin
			case (state)
				IDLE: begin
					if(fifo_rd_valid) begin
						state <= SEND_START;
					end else begin
						state <= IDLE;
					end
				end
				SEND_START: begin
					if(N_BYTES >= packet_size) begin
						//One transfer packet
						if(fifo_rd_valid) begin
							state <= SEND_START;
						end else begin
							state <= IDLE;
						end
					end else if (byte_count + 2*N_BYTES < packet_size) begin
						//Next transfer isn't last, keep sending full transfers
						state <= SEND;
					end else begin
						//Next transfer is the last one
						state <= SEND_LAST;
					end
				end
				SEND: begin
					//Check if next transfer is last
					if(byte_count + 2*N_BYTES < packet_size) begin
						//Next transfer isn't last, keep sending full transfers
						state <= SEND;
					end else begin
						//Next transfer is the last one
						state <= SEND_LAST;
					end
				end
				SEND_LAST: begin
					if(fifo_rd_valid == 1) begin
						state <= SEND_START;
					end else begin
						state <= IDLE;
					end
				end
			endcase
		end
    end

endmodule