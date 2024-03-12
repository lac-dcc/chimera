/*
ORSoC GFX accelerator core
Copyright 2012, ORSoC, Per Lenander, Anton Fosselius.

The Wishbone master component will interface with the video memory, writing outgoing pixels to it.

Loosely based on the vga lcds wishbone writer (LGPL) in orpsocv2 by Julius Baxter, julius@opencores.org

 This file is part of orgfx.

 orgfx is free software: you can redistribute it and/or modify
 it under the terms of the GNU Lesser General Public License as published by
 the Free Software Foundation, either version 3 of the License, or
 (at your option) any later version. 

 orgfx is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU Lesser General Public License for more details.

 You should have received a copy of the GNU Lesser General Public License
 along with orgfx.  If not, see <http://www.gnu.org/licenses/>.

*/

//synopsys translate_off
`include "timescale.v"
//synopsys translate_on

module gfx_wbm_write (clk_i, rst_i,
                      cyc_o, stb_o, cti_o, bte_o, we_o, adr_o, sel_o, ack_i, err_i, dat_o, sint_o,
                      write_i, ack_o,
                      render_addr_i, render_sel_i, render_dat_i);

  // wishbone signals
  input         clk_i;    // master clock input
  input         rst_i;    // Asynchronous active high reset
  output reg    cyc_o;    // cycle output
  output        stb_o;    // strobe ouput
  output [ 2:0] cti_o;    // cycle type id
  output [ 1:0] bte_o;    // burst type extension
  output        we_o;     // write enable output
  output [31:0] adr_o;    // address output
  output [ 3:0] sel_o;    // byte select outputs
  input         ack_i;    // wishbone cycle acknowledge
  input         err_i;    // wishbone cycle error
  output [31:0] dat_o;    // wishbone data out           /// TEMP reg ///

  output        sint_o;     // non recoverable error, interrupt host

  // Renderer stuff
  input         write_i;
  output reg    ack_o;

  input [31:2] render_addr_i;
  input [3:0]  render_sel_i;
  input [31:0] render_dat_i;

  //
  // module body
  //

  assign adr_o = {render_addr_i, 2'b00};
  assign dat_o = render_dat_i;
  assign sel_o = render_sel_i;
  assign sint_o = err_i;
  // We only write, these can be constant
  assign we_o  = 1'b1;
  assign stb_o = 1'b1;
  assign cti_o = 3'b000;
  assign bte_o = 2'b00;

  // Acknowledge when a command has completed
  always @(posedge clk_i or posedge rst_i)
  begin
    //  reset, init component
    if(rst_i)
    begin
      ack_o <= 1'b0;
      cyc_o <= 1'b0;
    end
    // Else, set outputs for next cycle
    else
    begin
      cyc_o <= ack_i   ? 1'b0 : // TODO: connect to pixel fifo rreq instead
               write_i ? 1'b1 :
               cyc_o;
      ack_o <= ack_i; // TODO: always set when fifo isn't full
    end
  end

// Pixel fifo for staging burst writes
/*
  // Fifo stuff
  wire pixel_fifo_full;
  wire pixel_fifo_empty;
  wire pixel_fifo_rreq;
  wire pixel_fifo_wreq;
  wire [31:0] pixel_fifo_d_adr;
  wire [31:0] pixel_fifo_d_data;
  wire [3:0]  pixel_fifo_d_sel;

  // fifo read & write
  assign pixel_fifo_wreq   = write_i & !pixel_fifo_full;// & vga_using_mem_i; //TODO: write directly if !vga_using_mem_i and pixel_fifo_empty
  assign pixel_fifo_rreq   = !pixel_fifo_empty & !vga_using_mem_i; // TODO: connect to ack_i
  assign pixel_fifo_d_adr  = {render_addr_i, 2'b00};
  assign pixel_fifo_d_data = render_dat_i;
  assign pixel_fifo_d_sel  = render_sel_i;
  basic_fifo #(68, 8) pixel_fifo(
  .clock     ( clk_i ),
  .reset     ( rst_i ),

  .data_in   ( {pixel_fifo_d_sel, pixel_fifo_d_adr, pixel_fifo_d_data} ),
  .enq       ( pixel_fifo_wreq ), // write request
  .full      ( pixel_fifo_full ),

//  .data_out  ( {sel_o, adr_o, dat_o} ), // TODO: multiple drivers
  .valid_out ( pixel_fifo_empty ),
  .deq       ( pixel_fifo_rreq ) // read request
  );
*/
endmodule
