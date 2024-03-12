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


module nukv_Value_Set #(
	parameter KEY_WIDTH = 128,
	parameter HEADER_WIDTH = 42, //vallen + val addr
	parameter META_WIDTH = 96,
	parameter MEMORY_WIDTH = 512,
	parameter VAL_MEMADDR_WIDTH = 21,
	parameter SUPPORT_SCANS = 0
	)
    (
	// Clock
	input wire         clk,
	input wire         rst,

	input  wire [KEY_WIDTH+HEADER_WIDTH+META_WIDTH-1:0] input_data,
	input  wire         input_valid,
	output reg         input_ready,

	input  wire [MEMORY_WIDTH-1:0] value_data,
	input  wire         value_valid,
	output reg         value_ready,

	output reg [KEY_WIDTH+META_WIDTH+HEADER_WIDTH-1:0] output_data,
	output reg         output_valid,
	input  wire         output_ready,


	output reg [MEMORY_WIDTH-1:0] wr_data,
	output reg         wr_valid,
	input  wire         wr_ready,

	output reg [39:0] wrcmd_data,
	output reg         wrcmd_valid,
	input  wire         wrcmd_ready,

	output reg [39:0] rdcmd_data,
	output reg         rdcmd_valid,
	input  wire         rdcmd_ready,

	output reg [META_WIDTH+MEMORY_WIDTH-1:0] pe_data,
	output reg         pe_valid,
	output reg 			pe_scan,
	input  wire         pe_ready,

	output reg scan_start,
	input wire scan_mode

);

localparam [3:0]
	ST_IDLE   = 0,
	ST_WRITE = 1,
	ST_RDCMD = 4,
	ST_THROW = 2,
	ST_OUTPUT = 3,
	ST_PREDEVALCONF = 5,
	ST_RDCMDCONF = 7,
	ST_WAITSCAN = 6,
	ST_THROW_FIRST = 8;
reg [3:0] state;

reg [9:0] tothrow;
reg [9:0] towrite;
reg [31:0] writeaddr;

reg [9:0] toread;
reg [31:0] readaddr;
reg firstcommand;

reg [META_WIDTH+MEMORY_WIDTH-1:0] int_pe_data;
reg [META_WIDTH-1: 0] pred_meta;
reg int_pe_scan;

reg need_scan;

always @(posedge clk) begin
	if (rst) begin
		// reset
		output_valid <= 0;		
		wrcmd_valid <= 0;
		wr_valid <= 0;		

		input_ready <= 0;
		value_ready <= 0;
		rdcmd_valid <= 0;

		pe_valid <= 0;

		state <= ST_IDLE;

		scan_start <= 0;

		need_scan <= 0;
		pe_scan <= 0;

	end
	else begin

		

		if (output_valid==1 && output_ready==1) begin
			output_valid <= 0;
		end

		if (wr_valid==1 && wr_ready==1) begin
			wr_valid <= 0;
		end

		if (wrcmd_valid==1 && wrcmd_ready==1) begin
			wrcmd_valid <= 0;
		end

		if (rdcmd_valid==1 && rdcmd_ready==1) begin
			rdcmd_valid <= 0;
		end

		if (pe_valid==1 && pe_ready==1) begin
			pe_valid <= 0;
			pe_scan <= 0;
		end

		input_ready <= 0;

		case (state)

			ST_IDLE: begin
				if (input_valid==1 && input_data[KEY_WIDTH+HEADER_WIDTH+META_WIDTH-7:KEY_WIDTH+HEADER_WIDTH+META_WIDTH-8]==2'b01) begin
					if (input_data[KEY_WIDTH+29:KEY_WIDTH]!=0) begin
						// this is a succesful set
						state <= ST_WRITE;
						input_ready <= 1;
						output_data <= input_data;
						writeaddr <= {2'b0, input_data[KEY_WIDTH +: 31]};
						towrite <= input_data[KEY_WIDTH+31 +: 10];			
						firstcommand <= 1;
					end else begin
						// this is a failed set
						state <= ST_THROW_FIRST;
						input_ready <= 1;
						output_data <= input_data;
						tothrow <= input_data[KEY_WIDTH+31 +: 10];
						value_ready <= 1;						
					end
				end else if (input_valid==1 && input_data[KEY_WIDTH+HEADER_WIDTH+META_WIDTH-7:KEY_WIDTH+HEADER_WIDTH+META_WIDTH-8]==2'b00 && pe_ready==1) begin
					//this is a get, ignore the value input and issue read requests

					if (input_data[KEY_WIDTH+31 +: 10]==0) begin
						state <= ST_OUTPUT;
						input_ready <= 1;
						output_data <= input_data;

						if (SUPPORT_SCANS==1 && input_data[KEY_WIDTH+HEADER_WIDTH+META_WIDTH-8 +: 4]==4'b1100) 
						begin
							state <= ST_PREDEVALCONF;			
							pred_meta <= input_data[KEY_WIDTH+HEADER_WIDTH +: META_WIDTH];

							need_scan <= 1;
						end

						if (input_data[KEY_WIDTH+HEADER_WIDTH+META_WIDTH-5:KEY_WIDTH+HEADER_WIDTH+META_WIDTH-8]==4'b0100) begin
							state <= ST_THROW;
							tothrow <= 8;
							value_ready <= 1;	
						end
						
					end else 
					begin										
						state <= ST_RDCMD;
						firstcommand <= 1;
						input_ready <= 1;
						output_data <= input_data;
						readaddr <= {2'b0, input_data[KEY_WIDTH +: 31]};
						toread <= input_data[KEY_WIDTH+31 +: 10];			

						if (input_data[KEY_WIDTH+HEADER_WIDTH+META_WIDTH-8 +: 4]==4'b0100) begin														
							state <= ST_PREDEVALCONF;
							pred_meta <= input_data[KEY_WIDTH+HEADER_WIDTH +: META_WIDTH];

						end else if (SUPPORT_SCANS==1 && input_data[KEY_WIDTH+HEADER_WIDTH+META_WIDTH-8 +: 4]==4'b1100) begin
							state <= ST_PREDEVALCONF;			
							pred_meta <= input_data[KEY_WIDTH+HEADER_WIDTH +: META_WIDTH];

							need_scan <= 1;
						end else begin
							pe_valid <= 1;
							pe_data <= 0;
						end
					end
				end else if (input_valid==1) begin
					//this is not a set or a get, ignore
					state <= ST_OUTPUT;
					input_ready <= 1;
					output_data <= input_data;
				end
			end

			ST_OUTPUT: begin
				if (output_ready==1) begin
					output_valid <= 1;

					if (need_scan==0) begin
						state <= ST_IDLE;					
					end else begin
						need_scan <= 0;
						state <= ST_WAITSCAN;
						scan_start <= 1;
					end
				end
			end

			ST_THROW_FIRST: begin
				if (value_ready==1 && value_valid==1) begin

					tothrow <= tothrow-8;
					if (tothrow==0) begin
						tothrow <= (value_data[9:0]+7)/8-8;
					end

					if (tothrow<=8 && tothrow!=0) begin
						value_ready <= 0;
						state <= ST_OUTPUT;	
					end else begin
						if ((value_data[9:0]+7)/8<=8) begin
							value_ready <= 0;
							state <= ST_OUTPUT;
						end else begin
							state <= ST_THROW;	
						end
						
					end

				end
			end

			ST_THROW: begin
				if (value_ready==1 && value_valid==1) begin

					tothrow <= tothrow-8;

					if (tothrow<=8) begin
						value_ready <= 0;
						state <= ST_OUTPUT;	
					end
				end
			end


			ST_WRITE: begin
				if (value_ready==1 && value_valid==1 && wrcmd_ready==1 && wr_ready==1) begin 

					towrite <= towrite-8;
					//writeaddr <= writeaddr+1;

					firstcommand <= 0;
					wrcmd_valid <= firstcommand;
					wrcmd_data[31:0] <= writeaddr;
					wrcmd_data[39:32] <= (towrite+7)/8;

					wr_valid <= 1;
					wr_data <= value_data;

					value_ready <= 0;

					if (towrite<=8) begin						
						state <= ST_OUTPUT;	
					end
				end

				if (value_ready==0 && value_valid==1 && wrcmd_ready==1 && wr_ready==1) begin
					value_ready <= 1;
				end
			end

			ST_RDCMD: begin
				if (rdcmd_ready==1) begin

					firstcommand <= 0;

					//toread <= toread-8;
					//readaddr <= readaddr+1;

					rdcmd_valid <= firstcommand;
					rdcmd_data[31:0] <= readaddr;
					rdcmd_data[39:32] <= (toread+7)/8;
					
					//if (toread<=8) begin						
					state <= ST_OUTPUT;	
					//end
				end
				
			end

			ST_RDCMDCONF: begin
				if (rdcmd_ready==1) begin

					firstcommand <= 0;

					pe_valid <= 1;
					pe_data <= int_pe_data;
					pe_scan <= int_pe_scan;

					rdcmd_valid <= firstcommand;
					rdcmd_data[31:0] <= readaddr;
					rdcmd_data[39:32] <= (toread+7)/8;
					
					//if (toread<=8) begin						
					state <= ST_OUTPUT;	
					//end
				end
				
			end


			ST_WAITSCAN : begin
				if (scan_mode == 1 && scan_start==1) begin
					scan_start <= 0;					
				end

				if (scan_mode==0 && scan_start==0) begin
					state <= ST_IDLE;
				end
			end

			ST_PREDEVALCONF: begin
				if (value_ready==1 && value_valid==1 && pe_ready==1) begin 

					
					int_pe_data <= {value_data, pred_meta};
					int_pe_scan <= need_scan;

					value_ready <= 0;

					
					state <= ST_RDCMDCONF;	
					
				end

				if (value_ready==0 && value_valid==1 && pe_ready==1) begin
					value_ready <= 1;
				end
			end

		endcase

	end
end


endmodule