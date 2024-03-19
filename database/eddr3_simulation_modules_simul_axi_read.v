/*******************************************************************************
 * Module: simul_axi_read
 * Date:2014-04-06  
 * Author: Andrey Filippov
 * Description: simulation of read data through maxi channel
 *
 * Copyright (c) 2014 Elphel, Inc.
 * simul_axi_read.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  simul_axi_read.v is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/> .
 *******************************************************************************/
`timescale 1ns/1ps

module  simul_axi_read(
  input         clk,
  input         reset,
  input         last,      // last data word in burst
  input         data_stb,  // data strobe (RVALID & RREADY) genearted externally
  input  [ 9:0] raddr,     // read burst address as written by axi master, 10 significant bits [11:2], valid at rcmd 
  input  [ 3:0] rlen,      // burst length  as written by axi master, valid at rcmd
  input         rcmd,      // read command (address+length) strobe
  output [ 9:0] addr_out,  // output address
  output        burst,     // burst in progress
  output reg    err_out);  // data last does not match predicted or FIFO over/under run

  wire   [ 9:0] raddr_fifo; // raddr after fifo
  wire   [ 3:0] rlen_fifo;  // rlen after fifo
  wire          fifo_valid; // fifo out valid
//  wire          fifo_re;    // fifo read strobe
  reg           burst_r=0;
  reg    [ 3:0] left_plus_1;
//  wire          start_burst=fifo_valid && (!burst_r || (last && data_stb));
//  wire          start_burst=fifo_valid && data_stb && (!burst_r || last );
  wire          start_burst=fifo_valid && data_stb && !burst_r;
  wire          generated_last= burst?(left_plus_1==1): ( fifo_valid && (rlen_fifo==0)) ;
  wire          fifo_in_rdy;
  wire          error_w= (data_stb && (last != generated_last)) || (rcmd && !fifo_in_rdy) || (start_burst && !fifo_valid);
  reg    [ 9:0] adr_out_r;
//  reg           was_last;

  assign  burst=burst_r || start_burst;
  assign  addr_out=start_burst?raddr_fifo:adr_out_r;
  always @ (posedge reset or posedge clk) begin
      if (reset)                 burst_r <= 0;
      else if (start_burst)      burst_r <= rlen_fifo!=0;
//      else if (last && data_stb) burst_r <= 0;
      else if (generated_last && data_stb) burst_r <= 0;
      if (reset)                 left_plus_1 <= 0;
      else if (start_burst)      left_plus_1 <= rlen_fifo;
      else if (data_stb)         left_plus_1 <= left_plus_1-1;
      if (reset)                 err_out <= 0;
      else                       err_out <= error_w;
//      if (reset)                 was_last <= 0;
//      else if (data_stb)         was_last <= last;

  end
  always @ (posedge clk) begin
      if   (start_burst) adr_out_r <= raddr_fifo+1; // simulating only address incremental mode
      else if (data_stb) adr_out_r <= adr_out_r + 1;
  
  end
simul_fifo
#(
  .WIDTH(14),
  .DEPTH(64)
)simmul_fifo_i(
     .clk(clk),
     .reset(reset),
//     .data_in({rlen[3:0],raddr[11:2]}), // did not detect raddr[11:2] for  input  [ 9:0] raddr 
     .data_in({rlen[3:0],raddr}),
     .load(rcmd),
     .input_ready(fifo_in_rdy),
     .data_out({rlen_fifo, raddr_fifo}),
     .valid(fifo_valid),
     .ready(start_burst));
endmodule

