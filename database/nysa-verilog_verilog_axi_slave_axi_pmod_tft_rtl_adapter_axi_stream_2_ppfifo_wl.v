// This program was cloned from: https://github.com/CospanDesign/nysa-verilog
// License: MIT License

/*
Distributed under the MIT license.
Copyright (c) 2015 Dave McCoy (dave.mccoy@cospandesign.com)

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
of the Software, and to permit persons to whom the Software is furnished to do
so, subject to the following conditions:

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

/*
 * Author: Dave McCoy (dave.mccoy@cospandesign.com)
 * Description:
 *  Translates data from an AXI stream interface to a Ping Pong FIFO
 *
 *
 * Changes      Who?  What?
 *  12/26/2015: DFM   Initial Checkin
 *  04/06/2017: DFM   Modified documentation, there is no need for the
 *                    data of either the PPFIFO or AXI Stream to be the same
 *                    size
 */

module adapter_axi_stream_2_ppfifo_wl #(
  parameter                         DATA_WIDTH    = 32,
  parameter                         STROBE_WIDTH  = DATA_WIDTH / 8,
  parameter                         USE_KEEP      = 0
)(
  input                             rst,

  input                             i_tear_effect,
  input                             i_fsync,
  input       [31:0]                i_pixel_count,

  //AXI Stream Input
  input                             i_axi_clk,
  output                            o_axi_ready,
  input       [DATA_WIDTH - 1:0]    i_axi_data,
  input       [STROBE_WIDTH - 1:0]  i_axi_keep,
  input                             i_axi_last,
  input                             i_axi_valid,

  //Ping Pong FIFO Write Controller
  output                            o_ppfifo_clk,
  input       [1:0]                 i_ppfifo_rdy,
  output  reg [1:0]                 o_ppfifo_act,
  input       [23:0]                i_ppfifo_size,
  output  reg                       o_ppfifo_stb,
  output  reg [DATA_WIDTH:0]        o_ppfifo_data
);
//local parameters
localparam      WAIT_FOR_TEAR_EFFECT  = 0;
localparam      WAIT_FOR_FRAME        = 1;
localparam      READ_FRAME            = 2;
localparam      WAIT_FOR_END_TEAR     = 3;

localparam      TEAR_WINDOW_COUNT     = 100;

//registes/wires
wire                        clk;  //Convenience Signal
reg           [3:0]         state;
reg           [23:0]        r_count;
reg                         r_last;
reg           [31:0]        r_pixel_count;
reg                         r_prev_tear;
reg                         r_pos_edge_tear;
//submodules
//asynchronous logic

//This is a little strange to just connect the output clock with the input clock but if this is done
//Users do not need to figure out how to hook up the clocks
assign  o_ppfifo_clk    = i_axi_clk;
assign  clk             = i_axi_clk;
assign  o_axi_ready     = (o_ppfifo_act > 0) &&
                          (r_count < i_ppfifo_size) &&
                          !r_last &&
                          (state == READ_FRAME);
//synchronous logic

always @ (posedge clk) begin
  o_ppfifo_stb                                <=  0;
  r_last                                      <=  0;

  if (rst) begin
    r_count                                   <=  0;
    o_ppfifo_act                              <=  0;
    o_ppfifo_data                             <=  0;
    r_pos_edge_tear                           <=  0;
    r_pixel_count                             <=  0;
    state                                     <=  WAIT_FOR_TEAR_EFFECT;
  end
  else begin
    if ((i_ppfifo_rdy > 0) && (o_ppfifo_act == 0)) begin
      r_count                                 <=  0;
      if (i_ppfifo_rdy[0]) begin
        o_ppfifo_act[0]                       <=  1;
      end
      else begin
        o_ppfifo_act[1]                       <=  1;
      end
    end

    case (state)
      WAIT_FOR_TEAR_EFFECT: begin
        if (r_pos_edge_tear) begin
          r_pos_edge_tear                     <=  0;
          r_pixel_count                       <=  0;
          state                               <=  WAIT_FOR_FRAME;
        end
      end
      WAIT_FOR_FRAME: begin
        r_pixel_count                         <=  0;
        if (i_fsync) begin
          state                               <= READ_FRAME;
          r_pixel_count                       <= 0;
        end
        else if (r_pixel_count < TEAR_WINDOW_COUNT) begin
          r_pixel_count                       <= r_pixel_count + 1;
        end
        else begin
          state                               <= WAIT_FOR_TEAR_EFFECT;  
        end
      end
      READ_FRAME: begin
        if (o_ppfifo_act) begin
          if (r_last) begin
            o_ppfifo_act                      <=  0;
            if (r_pixel_count >= i_pixel_count) begin
              state                           <=  WAIT_FOR_END_TEAR;
            end
          end
          else if (r_count < i_ppfifo_size) begin
            if (i_axi_valid && o_axi_ready) begin
              o_ppfifo_stb                      <=  1;
              r_pixel_count                     <=  r_pixel_count + 1;
              o_ppfifo_data[DATA_WIDTH - 1: 0]  <=  i_axi_data;
              o_ppfifo_data[DATA_WIDTH]         <=  i_axi_last;
              r_last                            <=  i_axi_last;
              r_count                           <=  r_count + 1;
            end
          end
          else begin
            o_ppfifo_act                        <=  0;
          end
        end
      end
      WAIT_FOR_END_TEAR: begin
        if (!i_tear_effect) begin
          state                                 <=  WAIT_FOR_TEAR_EFFECT;
        end
      end
    endcase

    //Detect the positive edge of a tear effect
    if (!r_prev_tear && i_tear_effect) begin
      r_pos_edge_tear                           <=  1;
    end
    r_prev_tear                                 <=  i_tear_effect;
  end
end

endmodule
