// This program was cloned from: https://github.com/CospanDesign/nysa-verilog
// License: MIT License

/*
Distributed under the MIT license.
Copyright (c) 2017 Dave McCoy (dave.mccoy@cospandesign.com)

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
 * Author:
 * Description:
 *
 * Changes:
 */

`timescale 1ps / 1ps

//Need a buffer depth of at least 512 (address width = 9)

module adapter_rgb_2_ppfifo #(
  parameter                 DATA_WIDTH = 24
)(
  input                             clk,
  input                             rst,

  input         [23:0]              i_rgb,
  input                             i_h_sync,
  input                             i_h_blank,
  input                             i_v_sync,
  input                             i_v_blank,
  input                             i_data_en,

  //Ping Pong FIFO Write Controller
  output                            o_ppfifo_clk,
  input       [1:0]                 i_ppfifo_rdy,
  output  reg [1:0]                 o_ppfifo_act,
  input       [23:0]                i_ppfifo_size,
  output  reg                       o_ppfifo_stb,
  output  reg [DATA_WIDTH - 1:0]    o_ppfifo_data


);
//local parameters
localparam      IDLE        = 0;
localparam      READY       = 1;
localparam      RELEASE     = 2;

//registes/wires

reg           [23:0]        r_count;
reg           [2:0]         state;
//submodules
//asynchronous logic
assign  o_ppfifo_clk    = clk;
//synchronous logic
always @ (posedge clk) begin
  o_ppfifo_stb          <=  0;
  if (rst) begin
    r_count             <=  0;
    o_ppfifo_act        <=  0;
    o_ppfifo_data       <=  0;
    state               <=  IDLE;
  end
  else begin
    case (state)
      IDLE: begin
        o_ppfifo_act    <=  0;
        if ((i_ppfifo_rdy > 0) && (o_ppfifo_act == 0)) begin
          r_count           <=  0;
          if (i_ppfifo_rdy[0]) begin
            o_ppfifo_act[0] <=  1;
          end
          else begin
            o_ppfifo_act[1] <=  1;
          end
          state             <=  READY;
        end
      end
      READY: begin
        if (r_count < i_ppfifo_size) begin
          if (!i_h_blank) begin
            o_ppfifo_stb    <=  1;
            o_ppfifo_data   <=  i_rgb;

            r_count         <=  r_count + 1;
          end
        end
        //Conditions to release the FIFO or stop a transaction
        else begin
          state             <=  RELEASE;
        end
        if (r_count > 0 && i_h_blank) begin
          state             <=  RELEASE;
        end
      end
      RELEASE: begin
        o_ppfifo_act        <=  0;
        state               <=  IDLE;
      end
      default: begin
      end
    endcase
  end
end



endmodule
