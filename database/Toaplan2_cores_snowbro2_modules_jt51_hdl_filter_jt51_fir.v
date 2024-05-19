// This program was cloned from: https://github.com/atrac17/Toaplan2
// License: GNU General Public License v3.0

/*  This file is part of jt51.

    jt51 is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    jt51 is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with jt51.  If not, see <http://www.gnu.org/licenses/>.

	Author: Jose Tejada Gomez. Twitter: @topapate
	Version: 1.0
	Date: March, 7th 2017
	*/

`timescale 1ns / 1ps

module jt51_fir
#(parameter data_width=9, output_width=12, coeff_width=9,
	addr_width=7, stages=81, acc_extra=1)
(
	input	clk,
	input	rst,
	input	sample,
	input	signed [data_width-1:0] left_in,
	input	signed [data_width-1:0] right_in,
	input	signed [coeff_width-1:0] coeff,
	output	reg 	[addr_width-1:0] cnt,
	output	reg signed [output_width-1:0] left_out,
	output	reg signed [output_width-1:0] right_out,
	output	reg sample_out
);

wire signed [data_width-1:0] mem_left, mem_right;

// pointers
reg [addr_width-1:0] addr_left, addr_right, 
	forward, rev, in_pointer;


reg update, last_sample;

reg	[1:0]	state;
parameter IDLE=2'b00, LEFT=2'b01, RIGHT=2'b10;

jt51_fir_ram #(.data_width(data_width),.addr_width(addr_width)) chain_left(
	.clk	( clk		),
	.data	( left_in 	),
	.addr	( addr_left ),
	.we		( update	),
	.q		( mem_left	)
);

jt51_fir_ram #(.data_width(data_width),.addr_width(addr_width)) chain_right(
	.clk	( clk		),
	.data	( right_in 	),
	.addr	( addr_right),
	.we		( update	),
	.q		( mem_right)
);
	

always @(posedge clk)
	if( rst )
		{ update, last_sample } <= 2'b00;
	else begin
		last_sample <= sample;
		update <= sample && !last_sample;
	end

parameter mac_width=(data_width+1)+coeff_width;
parameter acc_width=output_width; // mac_width+3;
reg	signed [acc_width-1:0] acc_left, acc_right;

//integer acc,mac;
wire [addr_width-1:0]  next = cnt+1'b1;

reg signed [data_width:0] sum;

wire last_stage = cnt==(stages-1)/2;

reg signed [data_width-1:0] buffer_left, buffer_right;

always @(*) begin
	if( state==LEFT) begin	
		if( last_stage )
			sum = buffer_left;
		else
			sum = buffer_left + mem_left;
		end
	else begin
		if( last_stage )
			sum = buffer_right;
		else
			sum = buffer_right + mem_right;
	end
end

wire signed [mac_width-1:0] mac = coeff*sum;
wire signed [acc_width-1:0] mac_trim = mac[mac_width-1:mac_width-acc_width];
//wire signed [acc_width-1:0] mac_trimx = (coeff*sum)>>>(mac_width-acc_width);

wire [addr_width-1:0]
	in_pointer_next = in_pointer - 1'b1,
	forward_next = forward+1'b1,
	rev_next = rev-1'b1;

always @(*)  begin
	case( state )
		default: begin
			addr_left = update ? rev : in_pointer;
			addr_right= in_pointer;
		end
		LEFT: begin
			addr_left = forward_next;
			addr_right= rev;
		end
		RIGHT: begin
			if( cnt==(stages-1)/2 ) begin
				addr_left = in_pointer_next;
				addr_right= in_pointer_next;
			end
			else begin
				addr_left = rev_next;
				addr_right= forward;
			end
		end
	endcase
end

always @(posedge clk)
if( rst ) begin
	sample_out <= 1'b0;
	state	<= IDLE;
	in_pointer <= 7'd0;	
	//addr_left <= in_pointer;
	//addr_right<= in_pointer;
end else begin
	case(state)
		default: begin
			if( update ) begin
				state <= LEFT;
				buffer_left <= left_in;
				//addr_left <= rev;
			end
			cnt <= 6'd0;
			acc_left <= {acc_width{1'b0}};
			acc_right <= {acc_width{1'b0}};	
			rev <= in_pointer+stages-1'b1;
			forward <= in_pointer;			
			sample_out <= 1'b0;
		end
		LEFT: begin
				acc_left <= acc_left + mac_trim;
				//addr_left <= forward_next;
				
				buffer_right <= mem_right;
				//addr_right <= rev;
				
				forward<=forward_next;
				state <= RIGHT;
			end
		RIGHT:
			if( cnt==(stages-1)/2 ) begin
				left_out  <= acc_left;
				right_out <= acc_right + mac_trim;
				sample_out <= 1'b1;
				in_pointer  <= in_pointer_next;
				//addr_left <= in_pointer_next;
				//addr_right<= in_pointer_next;
				state <= IDLE;
			end else begin
				acc_right <= acc_right + mac_trim;
				//addr_right <= forward;
				
				buffer_left <= mem_left;
				//addr_left <= rev_next;
				cnt<=next;
				rev<=rev-1'b1;
				state <= LEFT;
			end
	endcase
end
endmodule // jt51_fir8