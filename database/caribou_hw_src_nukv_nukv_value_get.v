//---------------------------------------------------------------------------
//--  Copyright 2015 - 2017 Systems Group, ETH Zurich
//-- 
//--  This hardware module is free software: you can redistribute it and/or
//--  modify it under the terms of the GNU General Public License as published
//--  by the Free Software Foundation, either version 3 of the License, or
//--  (at your option) any later version.
//-- 
//--  This program is distributed in the hope that it will be useful,
//--  but WITHOUT ANY WARRANTY; without even the implied warranty of
//--  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//--  GNU General Public License for more details.
//-- 
//--  You should have received a copy of the GNU General Public License
//--  along with this program.  If not, see <http://www.gnu.org/licenses/>.
//---------------------------------------------------------------------------


module nukv_Value_Get #(
	parameter KEY_WIDTH = 128,
	parameter HEADER_WIDTH = 42, //vallen + val addr
	parameter META_WIDTH = 96,
	parameter MEMORY_WIDTH = 512,
	parameter SUPPORT_SCANS = 0
	)
    (
	// Clock
	input wire         clk,
	input wire         rst,

	input  wire [KEY_WIDTH+HEADER_WIDTH+META_WIDTH-1:0] input_data,
	input  wire         input_valid,
	output reg         input_ready,

	input  wire        cond_drop,
	input  wire        cond_valid,
	output reg         cond_ready,

	input  wire [MEMORY_WIDTH-1:0] value_data,
	input  wire         value_valid,
	output wire         value_ready,

	output wire [META_WIDTH+64-1:0] output_data,
	output reg         output_valid,
	output reg 			output_last,
	input  wire         output_ready,

	input wire 			scan_mode

);

localparam [2:0]
	ST_IDLE   = 0,
	ST_HEADER = 1,
	ST_KEY = 2,
	ST_VALUE = 3,
	ST_DROP = 4;
reg [2:0] state;

reg [9:0] toread;
reg [3:0] idx;
reg hasvalue;
reg [63:0] meta_data;
reg [63:0] output_word;
reg flush;

reg dropit;

reg scanning;

reg[9:0] words_since_last;
reg must_last;

reg first_value_word;

wire[11:0] actual_value_len;

assign actual_value_len = (value_data[11:0]+7)/8;

assign value_ready = (idx==7 && output_valid==1 && output_ready==1 && state==ST_VALUE) ? 1 : flush;

assign output_data = {meta_data,output_word};

always @(posedge clk) begin
	if (rst) begin
		// reset
		output_valid <= 0;				
		output_last <= 0;
		input_ready <= 0;
		flush <= 0;
		cond_ready <= 0;
		dropit <= 0;

		scanning <= 0;

		state <= ST_IDLE;

		words_since_last <= 0;
		must_last <= 0;
	end
	else begin

		if (output_valid==1 && output_ready==1) begin
			output_valid <= 0;
			output_last <= 0;
		end		

		if (SUPPORT_SCANS==1) begin
			if (output_last==1 && output_valid==1 && output_ready==1) begin
				words_since_last <= 1;
			end else if (output_valid==1 && output_ready==1) begin
				words_since_last <= words_since_last+1;					
			end

			if (words_since_last>127) begin
				must_last <= 1;
			end else begin
				must_last <= 0;
			end

			if  (scanning==1 && scan_mode==0 && (output_valid!=1 || output_last!=1)) begin
				output_valid <= 1;
				output_last <= 1;
				must_last <= 1;
				words_since_last <= 128;
				output_word <= 64'h00000000FEEBDAED;
			end
		end		


		input_ready <= 0;
		cond_ready <= 0;

		case (state)

			ST_IDLE: begin

				flush <= 0;

				dropit <= 0;

				scanning <= scan_mode;

				if (flush==0 && output_ready==1) begin

					if (input_valid==1 && (input_data[KEY_WIDTH+HEADER_WIDTH+META_WIDTH-7:KEY_WIDTH+HEADER_WIDTH+META_WIDTH-8]==2'b01 || input_data[KEY_WIDTH+HEADER_WIDTH+META_WIDTH-7:KEY_WIDTH+HEADER_WIDTH+META_WIDTH-8]==2'b10) ) begin
						
						hasvalue <= 0;
						state <= ST_HEADER;
						meta_data <= input_data[KEY_WIDTH+HEADER_WIDTH +: META_WIDTH];
						input_ready <= 1;
						if (input_data[KEY_WIDTH +: 30]==0) begin
							output_word <= {32'h0, 32'h0, 16'h0, 16'hffff};
						end else begin
							output_word <= {32'h0, 32'h0, 16'h1, 16'hffff};
						end
						output_valid <= 1;		


					end else if (input_valid==1 && (input_data[KEY_WIDTH+HEADER_WIDTH+META_WIDTH-7:KEY_WIDTH+HEADER_WIDTH+META_WIDTH-8]==2'b00 || (SUPPORT_SCANS==1 && input_data[KEY_WIDTH+HEADER_WIDTH+META_WIDTH-8 +: 4]==4'b1111))) begin

						if (input_data[KEY_WIDTH+HEADER_WIDTH+META_WIDTH-8 +: 4]==4'b1000 || cond_valid==1 || input_data[KEY_WIDTH+31 +: 10]==0) begin							

							hasvalue <= (input_data[KEY_WIDTH+31 +: 10]==0) ? 0 : 1;
							state <= ST_HEADER;
							meta_data <= input_data[KEY_WIDTH+HEADER_WIDTH +: META_WIDTH];



							if (SUPPORT_SCANS==1 && input_data[KEY_WIDTH+HEADER_WIDTH+META_WIDTH-8 +: 4]==4'b1111 && cond_drop==1) begin
								output_word <= {32'h0, 32'h0, 16'h2, 16'hffff};													
								output_valid <= 0;
								input_ready <= 1;

								//jump over the header state to make sure we can process the input in two cycles, especially if it is a drop!
								output_valid <= 1;
								output_word <= 0;

								first_value_word <= 1;

								if (input_data[KEY_WIDTH+31 +: 10]!=0 && cond_drop==0) begin
									state <= ST_VALUE;					
								end else if (input_data[KEY_WIDTH+31 +: 10]!=0 && cond_drop==1) begin							
									state <= ST_DROP;
									output_valid <= 0;
									flush <= 1;
									output_last <= (SUPPORT_SCANS==1 && scanning==1) ? must_last : 1;
								end else begin
									output_last <= (SUPPORT_SCANS==1 && scanning==1) ? must_last : 1;
									state <= ST_IDLE;
								end

							end else begin												
								if (input_data[KEY_WIDTH+31 +: 10]==0) begin
									output_word <= {32'h0, 22'h0, input_data[KEY_WIDTH+31 +: 10], 16'h0, 16'hffff};
								end else begin
									output_word <= {32'h0, 22'h0, actual_value_len[9:0], 16'h1, 16'hffff};
								end


								if (input_data[KEY_WIDTH+31 +: 10]!=0) begin
									//if (value_valid==1) begin
										input_ready <= 1;								
										output_valid <= 1;
									//end
								end else begin
									input_ready <= 1;						
									output_valid <= 1;
								end
						
							end

							if (input_data[KEY_WIDTH+HEADER_WIDTH+META_WIDTH-8 +: 4]!=4'b1000 && input_data[KEY_WIDTH+31 +: 10]!=0) begin
								cond_ready <= 1;
								dropit <= cond_drop;
								if (cond_drop==1) begin
									output_word[32 +: 10] <= 0;	

									if (scanning==0) begin
										output_last <= 1;
									end
								end
							end

							toread <= input_data[KEY_WIDTH+31 +: 10];			
							idx <= 0;

						end

					end else if (input_valid==1) begin

						output_valid <= 1;		
						hasvalue <= 0;
						state <= ST_HEADER;
						meta_data <= input_data[KEY_WIDTH+HEADER_WIDTH +: META_WIDTH];
						input_ready <= 1;
						output_word <= {32'h0, 32'h0, 16'h0, 16'hffff};

					end
				end 
			end

			ST_HEADER: begin
				if (output_ready==1) begin
					output_valid <= 1;
					output_word <= 0;

					first_value_word <= 1;

					if (hasvalue==1 && toread>0 && dropit==0) begin
						state <= ST_VALUE;					
					end else if (hasvalue==1 && toread>0 && dropit==1) begin							
						state <= ST_DROP;
						output_valid <= 0;
						output_last <= 0;
						flush <= 1;
					end else begin
						output_last <= (SUPPORT_SCANS==1 && scanning==1) ? must_last : 1;
						state <= ST_IDLE;
					end
					
				end
			end


			ST_VALUE: begin
				if (output_ready==1 && value_valid==1) begin

					first_value_word <= 0;

					idx <= idx+1;

					if (idx==7) begin
						toread <= toread-8;
						idx <= 0;
					end

					output_valid <= 1;
					output_word <= value_data[idx*64 +: 64];
					
					if (first_value_word==1 && value_data[15:0]<1024) begin
						toread <= (value_data[15:0]+7)/8;
					end else
					if (toread<=8 && idx==toread-1) begin						
						state <= ST_IDLE;	
						output_last <= (SUPPORT_SCANS==1 && scanning==1) ? must_last : 1;

						if (toread<8) begin
							flush <= 1;
						end
					end
				end
			end

			ST_DROP: begin
				if (value_valid==1 && value_ready==1) begin
					toread <= toread-8;

					first_value_word <= 0;

					if (first_value_word==1 && value_data[15:0]<1024) begin
						toread <= (value_data[15:0]+7)/8-8;

						if (((value_data[15:0]+7)/8)<=8) begin
							flush <= 0;
							state <= ST_IDLE;
						end
					end
					else if (toread<=8) begin
						flush <= 0;
						state <= ST_IDLE;
					end
				end

			end

		endcase

	end
end


endmodule