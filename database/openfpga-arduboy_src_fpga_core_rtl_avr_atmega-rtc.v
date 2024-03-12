/*
 * This IP is the RTC timmer implementation.
 * 
 * Copyright (C) 2018  Iulian Gheorghiu (morgoth@devboard.tech)
 * 
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 * 
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
 */

`timescale 1ns / 1ps

module rtc #(
	parameter PERIOD_STATIC = 0,
	parameter CNT_SIZE = 10
	)(
	input rst_i,
	input clk_i,
	input clk_cnt_i,
	input [CNT_SIZE - 1:0]top_i,
	output int_o,
	input int_ack_i
	);

reg int_rst_int_p;
reg int_rst_int_n;

reg [CNT_SIZE-1:0]CNT;

always @ (posedge clk_i or posedge rst_i)
begin
	if(rst_i)
		int_rst_int_n <= 'h0;
	else if(int_ack_i & int_o)
		int_rst_int_n <= ~int_rst_int_n;
end

always @ (posedge clk_cnt_i)
begin
	if(rst_i)
	begin
		CNT <= 'h00;
		int_rst_int_p <= 'h0;
	end
	else
	begin
		if(CNT >= (PERIOD_STATIC != 0 ? PERIOD_STATIC : top_i) - 1)
		begin
			CNT <= 'h0;
			if((PERIOD_STATIC != 0 ? PERIOD_STATIC : top_i))
			begin
				if(~int_o)
				begin
					int_rst_int_p <= ~int_rst_int_p;
				end
			end
		end
		else if((PERIOD_STATIC != 0 ? PERIOD_STATIC : top_i))
		begin
			CNT <= CNT + 1;
		end
	end
end
 
assign int_o = int_rst_int_n ^ int_rst_int_p;

endmodule
