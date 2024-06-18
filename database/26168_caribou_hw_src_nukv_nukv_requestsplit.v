// This program was cloned from: https://github.com/fpgasystems/caribou
// License: GNU General Public License v3.0

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


module nukv_RequestSplit #(	
	parameter META_WIDTH = 96,
	parameter VALUE_WIDTH = 512,
	parameter SPECIAL_ARE_UPDATES = 1
)
(
	// Clock
	input wire         clk,
	input wire         rst,

	input  wire [127:0] s_axis_tdata,
	input  wire         s_axis_tvalid,
	input  wire			s_axis_tlast, 
	output wire         s_axis_tready,


	output reg [63:0]  key_data,
	output reg     	key_valid,
	output reg         key_last,
	input  wire         key_ready,

	output reg [META_WIDTH-1:0]  meta_data,
	output reg         meta_valid,
	input  wire         meta_ready,

	output reg [VALUE_WIDTH-1:0] value_data,
	output reg         value_valid,
	output reg [15:0]  value_length,
	output reg         value_last,
	input  wire         value_ready,
	input wire 			value_almost_full,

	output reg [15:0]  malloc_data,
	output reg         malloc_valid,
	input  wire         malloc_ready,

	output reg [3:0]   _debug
);

reg ERRCHECK = 1;

localparam [2:0]
	ST_IDLE   = 0,
	ST_META = 1,
	ST_THROW = 4,
	ST_KEY  = 2,
	ST_VALUE  = 3,
	ST_DROP_FIRST = 5,
	ST_DROP_REST = 6;
reg [2:0] state;

reg [7:0] opcode;
reg [7:0] keylen;
reg [15:0] vallen;
reg [7:0] partialpos = VALUE_WIDTH/64;

reg [63:0] net_meta;

wire outready;
assign outready = meta_ready & key_ready & value_ready;
assign readyfornew = meta_ready & key_ready & value_ready & ~value_almost_full;

reg inready;

reg force_throw;
reg[31:0] throw_length_left;

assign s_axis_tready = (state!=ST_IDLE) ? ((inready & outready) | force_throw): 0;

always @ (posedge clk)
	if(rst)   
	begin

		state <= ST_IDLE;
		_debug <= 0;

		meta_valid <= 0;
		malloc_valid <= 0;
		key_valid <= 0;
		value_valid <= 0;
		value_last <= 0; 
		force_throw <= 0;

	end else begin
		_debug[1:0] <= 0;
		_debug[3:2] <= state;
	

		if (meta_valid==1 && meta_ready==1) begin
			meta_valid <= 0;
		end

		if (malloc_valid==1 && malloc_ready==1) begin
			malloc_valid <= 0;
		end

		if (key_valid==1 && key_ready==1) begin
			key_valid <= 0;
			key_last <= 0;
		end

		if (value_valid==1 && value_ready==1) begin
			value_valid <= 0;
			value_last <= 0;
		end
		
		case (state) 

			ST_IDLE: begin
				if (s_axis_tvalid==1 && readyfornew==1 && malloc_ready==1) begin
					// outputs are clear, let's figure out what operation is this

					if (ERRCHECK==1 && s_axis_tdata[15:0]!=16'hFFFF) begin
						_debug[1:0] <= 1;
					end

					opcode <= s_axis_tdata[63:64-8];
					keylen <= s_axis_tdata[64-8-1:64-16];
					vallen <= s_axis_tdata[32+15:32]-s_axis_tdata[64-8-1:64-16];
					net_meta <= s_axis_tdata[127:64];

					state <= ST_META;

					if (s_axis_tdata[16 +: 8]!=0 && s_axis_tdata[16+8 +: 8]==0) begin
						opcode <= SPECIAL_ARE_UPDATES==1 ? 3 : 1; // whether special inputs are treated as updates or inserts
						keylen <= 1;
						vallen <= s_axis_tdata[32 +: 8]-1;
					end

					inready <= 1;

				end else if (s_axis_tvalid==1) begin
					force_throw <= 1;
					throw_length_left <= s_axis_tdata[32+15:32];
					state <= ST_DROP_FIRST;				
				end

			end

			ST_META: begin
				if (s_axis_tvalid==1 && s_axis_tready==1)  begin
					if (ERRCHECK==1 && (opcode>5 || keylen>2 || vallen>2000 )) begin
						_debug[1:0] <= 1;
					end

					meta_data <= {opcode,keylen,vallen,net_meta};
					meta_valid <= 1;

					malloc_data <= vallen*8; //=bytes
					malloc_valid <= (opcode==8'h01) ? 1 : 0;

					value_length <= vallen*8; //=bytes

					state <= ST_THROW;
					keylen <= keylen-1;										

				end
			end

			ST_THROW: begin
				if (s_axis_tvalid==1 && s_axis_tready==1) begin
					state <= ST_KEY;
				end
			end

			ST_KEY: begin
				if (s_axis_tvalid==1 && s_axis_tready==1) begin
					keylen <= keylen-1;

					if (keylen==0 || s_axis_tlast==1) begin

						if (vallen>0) begin
							state <= ST_VALUE;
							vallen <= vallen-1;
							key_last <= 1;
							partialpos <= 0;

							if (ERRCHECK==1 && s_axis_tlast==1 && keylen>0) begin
								_debug[1:0] <= 2;
							end
						end else begin
							state <= ST_IDLE;
							key_last <= 1;
						end
					end

					key_valid <= 1;
					key_data <= s_axis_tdata[63:0];

				end
			end

			ST_VALUE: begin
				if (s_axis_tvalid==1 && s_axis_tready==1) begin
					vallen <= vallen-1;
					partialpos <= partialpos+1;

					if (vallen==0 || s_axis_tlast==1) begin
						state <= ST_IDLE;						
						value_last <= 1;
						value_valid <= 1;
						inready <= 0;


						if (ERRCHECK==1 && s_axis_tlast==1 && vallen>0) begin
							_debug[1:0] <= 2;
						end						
					end

					if (partialpos==VALUE_WIDTH/64 -1) begin
						partialpos <= 0;
						//value_data <= 0;
						value_valid <= 1;
					end


					if (partialpos==0) begin
						value_data[511:64] <= 0;
						//value_data[63:0] <= s_axis_tdata[63:0];
					end
					//end else begin
					//	value_data <= {value_data[VALUE_WIDTH-64-1:0], s_axis_tdata[63:0]};
					//end

					value_data[(partialpos)*64 +: 64] <= s_axis_tdata;
				end
			end

			ST_DROP_FIRST: begin
				if (s_axis_tvalid==1 && s_axis_tready==1)  begin
					state <= ST_DROP_REST;
				end

			end

			ST_DROP_REST: begin

				if (s_axis_tvalid==1 && s_axis_tready==1) begin
					throw_length_left <= throw_length_left-1;					
				end

				if (s_axis_tvalid==1 && s_axis_tready==1 && throw_length_left==0)  begin
					state <= ST_IDLE;
					inready <= 0;
				end

			end



		endcase


	end



endmodule

