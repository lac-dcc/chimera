// icache.v - Direct Mapped Instruction Cache
//
// Copyright (c) 2014, 2015, 2016, 2017  Anthony Green
//
// The above named program is free software; you can redistribute it
// and/or modify it under the terms of the GNU General Public License
// version 2 as published by the Free Software Foundation.
//
// The above named program is distributed in the hope that it will be
// useful, but WITHOUT ANY WARRANTY; without even the implied warranty
// of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this work; if not, write to the Free Software
// Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA
// 02110-1301, USA.

`timescale 1ns / 1ps

// Moxie instruction cache.
//
// Moxie instructions are 16 bits in length with an optional immediate
// value of either 16 or 32 bits.  This simple direct mapped cache
// provides all 48 bits even if they may not all be required.  This
// means that there may be times when we load a redundant cache line
// from RAM.
//
// Does not latch output from cache!
//
// Note, also.. rst_i does not clear the cache!

module icache (/*AUTOARG*/
               // Outputs
               hit_o, inst_o, data_o, wb_adr_o, wb_sel_o, wb_cyc_o, wb_stb_o,
               // Inputs
               rst_i, clk_i, adr_i, stb_i, wb_dat_i, wb_ack_i
               );

  input         rst_i,     clk_i;

  // Address to read from
  input [31:0]  adr_i;
  input         stb_i;

  // Cache hit indicator, instruction, data.
  output        hit_o;
  output [15:0] inst_o;
  output [31:0] data_o;

  // Interface to external memory.
  output reg [31:0] wb_adr_o;
  input [15:0]      wb_dat_i;
  output [1:0]      wb_sel_o;
  output            wb_cyc_o;
  output reg        wb_stb_o;
  input             wb_ack_i;

  assign wb_cyc_o = wb_stb_o;
  assign wb_sel_o = 2'b11;

  // We have an 8k instruction cache with cache lines that are 32
  // bytes long.
  // (/ 8196 32) = 256 cache lines.
  // 8-bit index for 256 cache lines.
  // 4-bit offset into 32 byte cache line since all accesses are
  //   16-bit aligned (drop 1 bit).
  // (- 32 8 4 1) = 19 bit tag.

  // tttttttttttttttttttssssssssoooox

  // (- 32 6)

  reg               valid[0:255];
  reg [18:0]        tags[0:255];
  reg [15:0]        line[0:4095];

  wire [18:0]       tag;
  assign tag[18:0]  = adr_i[31:13];

  // The 48-bit cache read may possibly be split across two cachelines.
  // set0 represents the cacheline for the first 16-bits.
  // The next 16 bits from cacheline set1.
  // set1 is the same as set0 if we're indexed less than 30 bytes
  //   into the cacheline, otherwise it is set0+1.
  // set2 is the same as set0 if we're indexed less than 28 bytes
  //   into the cacheline, otherwise it is set0+1.

  wire              is_at_least_28 = (adr_i[4:2] == 3'b111) ? 1'd1 : 1'd0;
  wire              is_at_least_30 = is_at_least_28 & adr_i[1];
  wire [7:0]        set0 = adr_i[12:5];
  wire [7:0]        set1 = adr_i[12:5] + { 7'b0, is_at_least_30 };
  wire [7:0]        set2 = adr_i[12:5] + { 7'b0, is_at_least_28 };

  reg [7:0]         hold_set0;
  reg [7:0]         hold_set1;
  reg [7:0]         hold_set2;
  reg [18:0]        hold_tag;

  wire              hit0, hit1, hit2;

  assign hit0 = valid[set0] & (tags[set0] == tag);
  assign hit1 = valid[set1] & (tags[set1] == tag);
  assign hit2 = valid[set2] & (tags[set2] == tag);
  assign hit_o = (!rst_i) & (hit0 & hit1 & hit2);

  assign inst_o = line[(set0 * 16) + {12'b0,adr_i[4:1]}];
  assign data_o[31:16] = line[(set0 * 16) + {12'b0,adr_i[4:1]} + 1];
  assign data_o[15:0] = line[(set0 * 16) + {12'b0,adr_i[4:1]} + 2];

  // --- State machine states -----------------------------------------
  parameter         ICACHE_IDLE = 4'd0;
  parameter         ICACHE_FILL0 = 4'd1;
  parameter         ICACHE_FILL1 = 4'd2;
  parameter         ICACHE_FILL2 = 4'd5;
  parameter         ICACHE_FILL0_WAIT = 4'd3;
  parameter         ICACHE_FILL1_WAIT = 4'd4;
  parameter         ICACHE_FILL2_WAIT = 4'd6;

  reg [3:0]         state = ICACHE_IDLE;
  reg [3:0]         count = 0;

  integer           i;
  always @(posedge clk_i) begin
    if (rst_i)
	    begin
	      state <= ICACHE_IDLE;
	      count <= 0;
	      wb_stb_o <= 0;
        for (i=0; i<256; i=i+1) valid[i] = 1'b0;
	    end
    else
	    begin
	      case (state)

	        ICACHE_IDLE:
	          begin
		          state <= (stb_i ?
			                  (!hit0 ? ICACHE_FILL0_WAIT
			                   : (! hit1 ? ICACHE_FILL1_WAIT
				                    : (! hit2 ? ICACHE_FILL2_WAIT : ICACHE_IDLE)))
			                  : ICACHE_IDLE);
		          count <= 0;
		          wb_stb_o <= (stb_i & !(hit0 & hit1 & hit2));
		          wb_adr_o <= { adr_i[31:13],
                            !hit0 ? set0 : (!hit1 ? set1 : set2), 5'b00000 };

		          hold_set0 <= set0;
		          hold_set1 <= set1;
		          hold_set2 <= set2;
		          hold_tag  <= tag;
	          end

	        ICACHE_FILL0:
	          begin
		          if (wb_ack_i)
		            begin
		              line[(hold_set0 * 16) + {4'b0, count}] <= wb_dat_i;
		              wb_adr_o <= wb_adr_o + 2;
		              count <= count + 1;
		              if (count == 15)
			              begin
			                tags[hold_set0] <= hold_tag;
			                valid[hold_set0] <= 1;
			                count <= 0;
                      //			    state <= (hold_set0 == hold_set1) | (hit1 & hit2) ? ICACHE_IDLE : ICACHE_FILL1_WAIT;
			                state <= ICACHE_IDLE;
			              end
			            else
			              state <= ICACHE_FILL0_WAIT;
		            end // if (wb_ack_i)
	          end // case: ICACHE_FILL0

	        ICACHE_FILL0_WAIT:
	          begin
		          state <= ICACHE_FILL0;
	          end

	        ICACHE_FILL1:
	          begin
		          if (wb_ack_i)
		            begin
		              line[(hold_set1 * 16) + {4'b0, count}] <= wb_dat_i;
		              wb_adr_o <= wb_adr_o + 2;
		              count <= count + 1;
		              if (count == 15)
			              begin
			                tags[hold_set1] <= hold_tag;
			                valid[hold_set1] <= 1;
			                // tags[hold_set2] <= hold_tag;
			                // valid[hold_set2] <= 1;
			                count <= 0;
                      //			    state <= hit2 ? ICACHE_IDLE : ICACHE_FILL2_WAIT;
			                state <= ICACHE_IDLE;
			              end
		              else
			              state <= ICACHE_FILL1_WAIT;
		            end // if (wb_ack_i)
	          end // case: ICACHE_FILL1

	        ICACHE_FILL1_WAIT:
	          begin
		          state <= ICACHE_FILL1;
	          end

	        ICACHE_FILL2:
	          begin
		          if (wb_ack_i)
		            begin
		              line[(hold_set2 * 16) + {4'b0, count}] <= wb_dat_i;
		              wb_adr_o <= wb_adr_o + 2;
		              count <= count + 1;
		              if (count == 15)
			              begin
			                tags[hold_set2] <= tag;
			                valid[hold_set2] <= 1;
			                count <= 0;
			                state <= ICACHE_IDLE;
			              end
		              else
			              state <= ICACHE_FILL2_WAIT;
		            end // if (wb_ack_i)
	          end // case: ICACHE_FILL2

	        ICACHE_FILL2_WAIT:
	          begin
		          state <= ICACHE_FILL2;
	          end

	        default:
	          begin
	          end

	      endcase

	    end // else: !if(rst_i)

  end // always @ (posedge clk_i)

endmodule
