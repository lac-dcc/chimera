// This program was cloned from: https://github.com/MiSTer-devel/Apogee_MiSTer
// License: BSD 2-Clause "Simplified" License

//
// K580VI53 timer implementation
// 
// Copyright (c) 2016 Sorgelig
//
// 
// This source file is free software: you can redistribute it and/or modify 
// it under the terms of the GNU General Public License as published 
// by the Free Software Foundation, either version 3 of the License, or 
// (at your option) any later version. 
// 
// This source file is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of 
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the 
// GNU General Public License for more details.
// 
// You should have received a copy of the GNU General Public License 
// along with this program.  If not, see <http://www.gnu.org/licenses/>. 
//
// altera message_off 10240


`default_nettype none

module k580vi53
(
	// CPU bus
	input        reset,
	input        clk_sys,
	input  [1:0] addr,
	input  [7:0] din,
	output [7:0] dout,
	input        wr,
	input        rd,
	
	// Timer signals
	input  [2:0] clk_timer,
	input  [2:0] gate,
	output [2:0] out,
	output [2:0] sound_active
);

wire	[7:0] dout0;
wire	[7:0]	dout1;
wire	[7:0]	dout2;

assign dout = dout0 & dout1 & dout2;

timer t0(reset, clk_sys, clk_timer[0], din, dout0, wr && (addr == 3) && (din[7:6] == 0), wr && (addr == 0), rd && (addr == 0), gate[0], out[0], sound_active[0]);
timer t1(reset, clk_sys, clk_timer[1], din, dout1, wr && (addr == 3) && (din[7:6] == 1), wr && (addr == 1), rd && (addr == 1), gate[1], out[1], sound_active[1]);
timer t2(reset, clk_sys, clk_timer[2], din, dout2, wr && (addr == 3) && (din[7:6] == 2), wr && (addr == 2), rd && (addr == 2), gate[2], out[2], sound_active[2]);

endmodule

module timer
(
	input        reset,
	input        clk_sys,
	input	       clk_timer,
	input	 [7:0] din,
	output [7:0] dout,
	input	       wr_cw,
	input	       wr,
	input	       rd,
	input	       gate,
	output reg   out,
	output reg   sound_active
);

reg  [7:0] q;
reg  [7:0] cw;
reg [15:0] counter;
reg [15:0] ld_count;
reg  [7:0] load;
reg        pause;
reg        stop1;


assign dout = q;

always @(posedge clk_sys) begin
	reg [15:0] l_counter;
	reg msbw, msbr; // according to Siemens doc, read and write have indepenent msb flag.
	reg latched;
	
	reg old_wr_cw, old_wr, old_rd;
	old_wr_cw <= wr_cw;
	old_wr <= wr;
	old_rd <= rd;

	if(!old_wr_cw && wr_cw) begin
		msbw <=0;
		msbr <=0;
		if(!din[5:4]) begin
			if(!latched) begin 
				latched <=1;
				l_counter <= counter;
			end
		end else begin
			cw <= din;
			latched <=0;
			stop1 <=1;
			pause<=1;
		end
	end
	
	if(!old_wr && wr) begin
		case(cw[5:4]) 
			1: begin // high speed mode
					ld_count[7:0]  <= check(din);
					ld_count[15:8] <= 0;
					stop1  <=0;
					load  <=load + 1'd1;
					pause <=0;
				end
			2: begin // low precision mode
					ld_count[7:0]  <= 0;
					ld_count[15:8] <= check(din);
					stop1  <=0;
					load  <=load + 1'd1;
					pause <=0;
				end
			default: begin // full mode
					if(msbw) ld_count[15:8] <= check(din);
						else  ld_count[7:0]  <= check(din);
					msbw  <= ~msbw;
					pause <= ~msbw;
					if(msbw) begin
						stop1  <=0;
						load  <=load + 1'd1;
					end
				end
		endcase
	end
	
	if(!old_rd && rd) begin
		casex({latched, msbr, cw[5:4]})
			4'b0X01: q <=counter[7:0];
			4'b0X10: q <=counter[15:8];
			4'b0011: q <=counter[7:0];
			4'b0111: q <=counter[15:8];
			4'b1X01: begin q <=l_counter[7:0];  latched <=0; end
			4'b1X10: begin q <=l_counter[15:8]; latched <=0; end
			4'b1011: q <=l_counter[7:0];
			4'b1111: begin q <=l_counter[15:8]; latched <=0; end
		endcase
		msbr <= ~msbr;
	end
	
	if(!rd || reset) q <= 255;

	if(reset) begin
		stop1 <=1;
		ld_count  <=0;
		cw <= 0;
	end
end

function [15:0] minus1;
	input [15:0] value;
	begin
		if(!cw[0]) minus1 = value-1'd1;
		else begin
			minus1 = value;
			if(!minus1[3:0]) begin
				minus1[3:0] = 9;
				if(!minus1[7:4]) begin
					minus1[7:4] = 9;
					if(!minus1[11:8]) begin
						minus1[11:8] = 9;
						if(!minus1[15:12]) begin
							minus1[15:12] = 9;
						end else minus1[15:12] = minus1[15:12]-1'd1;
					end else minus1[11:8] = minus1[11:8]-1'd1;
				end else minus1[7:4] = minus1[7:4]-1'd1;
			end else minus1[3:0] = minus1[3:0]-1'd1;
		end
	end
endfunction

function [7:0] check;
	input [7:0] value;
	begin
		if(!cw[0]) check = value;
		else begin
			check[3:0] = (value[3:0]>9) ? 4'd9 : value[3:0];
			check[7:4] = (value[7:4]>9) ? 4'd9 : value[7:4];
		end;
	end
endfunction

reg  stop2;
wire stop = stop1 | stop2;

//
// With bugs implemented:
//
// M0,M1,M4,M5 - counter doesn't stop at the end but wrap around instead.
//
// M1,M5 - setting of Control Word doesn't reset counter. 
//         Counter continue to count old value after ccounter register is set.
//
always @(posedge clk_sys) begin
	reg  [7:0] old_load;
	reg        old_gate;
	reg start, count_en, m3state;
	reg  [7:0] stop_delay;
	reg        old_clk;

	// cannot treat it as clock enable because timer clock
	// can be fed from output of other timer
	old_clk <= clk_timer;
	if(old_clk & ~clk_timer) begin
		stop2 <= stop1;

		old_load <= load;
		old_gate <= gate;
		start <= stop;
	
		// Assume sound is generated by mode 3 and mode 0(DAC emulation).
		sound_active <= (!cw[3:1] || (cw[2:1] == 2'b11)) && !stop;

		casex(cw[3:1])
			3'b000: 	if(stop) begin out <=0; count_en <=0; end
						else begin
							if(start || (old_load != load)) begin
								counter <= ld_count;
								out <=0;
								count_en <=1;
							end else if(!pause && gate) begin
								counter <= minus1(counter);
								if(counter == 1) begin 
									out <=1;
									count_en <=0;
								end
							end
						end

			3'b001: 	if(stop) begin out <=1; count_en <=0; end
						else begin
							if(!old_gate & gate) begin
								counter <= ld_count;
								out <=0;
								count_en <=1;
							end else begin
								counter <= minus1(counter);
								if((counter == 1) && count_en) begin 
									out <=1;
									count_en <=0;
								end
							end
						end

			3'bX10: 	if(stop || !gate) out <=1;
						else begin
							if(start || (!old_gate & gate) || (counter <= 1)) begin
								counter <=ld_count;
								out <=1;
							end else begin
								counter <= minus1(counter);
								if(counter == 2) out <=0;
							end
						end

			3'bX11: 	if(stop || !gate) begin out <=1; m3state <=1; end
						else begin
							if(start || (!old_gate & gate) || (counter <= 2)) begin
								counter <=ld_count;
								out <= m3state;
								m3state <= ~m3state;
							end else begin 
								counter <= !counter[0] ? minus1(minus1(counter)) : out ? minus1(counter) : minus1(minus1(minus1(counter)));
							end
						end

			3'b100: 	if(stop) begin out <=1; count_en <=0; end
						else begin
							out <=1;
							if(start) begin 
								counter  <=ld_count;
								count_en <=1;
							end else if(gate) begin
								counter <= minus1(counter);
								if((counter == 1) && count_en) begin 
									out <=0;
									count_en <=0;
								end
							end
						end

			3'b101: 	if(stop) begin out <=1; count_en <=0; end
						else begin
							out <=1;
							if(!old_gate & gate) begin
								counter <=ld_count;
								out <=1;
								count_en <=1;
							end else begin
								counter <= minus1(counter);
								if((counter == 1) && count_en) begin 
									out <=0;
									count_en <=0;
								end
							end
						end
		endcase
	end
end

endmodule
