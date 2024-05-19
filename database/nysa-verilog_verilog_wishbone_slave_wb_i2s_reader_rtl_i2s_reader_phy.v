// This program was cloned from: https://github.com/CospanDesign/nysa-verilog
// License: MIT License

//Phy layer of the I2S Reader
/*
Distributed under the MIT license.
Copyright (c) 2011 Dave McCoy (dave.mccoy@cospandesign.com)

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

//Attach these signals to the pins

`include "project_defines.v"
`include "i2s_reader_defines.v"


`timescale 1 ns/1 ps
module i2s_reader_phy (
  input               rst,
  /*This signal is connected to the i2s clock (driven either internally or
  externally)*/
  input               clk,

  output      [31:0]  debug,
  input               i_enable,
  input       [23:0]  i_min_read_size,

  //memory interface
  input       [23:0]  i_wfifo_size,
  input       [1:0]   i_wfifo_ready,
  output  reg [1:0]   o_wfifo_activate  = 2'b0,
  output  reg         o_wfifo_strobe    = 1'b0,
  output  reg [31:0]  o_wfifo_data      = 32'h0,

  //These signals are connected to the phy signals
  input               i_i2s_lr,
  input               i_i2s_data
);

//Local Parameters
localparam            IDLE          = 4'h0;
localparam            READ          = 4'h1;

//Registers/Wires
reg           [3:0]   state         = IDLE;
reg           [31:0]  read_word     = 32'h0;
reg           [23:0]  r_count       = 24'h0;
reg                   r_prev_i2s_lr = 1'b0;

//Submodules

//Asynchronous Logic
assign  debug[0]      = i_i2s_lr;
assign  debug[1]      = i_i2s_data;
assign  debug[2]      = i_enable;
assign  debug[4:3]    = i_wfifo_ready;
assign  debug[6:5]    = o_wfifo_activate;
assign  debug[7]      = o_wfifo_strobe;
assign  debug[11:8]   = state;

//Synchronous Logic
always @ (posedge clk) begin
  if (rst) begin
    state                     <=  IDLE;
    o_wfifo_activate          <=  2'b0;
    o_wfifo_strobe            <=  1'b0;
    o_wfifo_data              <=  32'h0;
    r_count                   <=  0;
    r_prev_i2s_lr             <=  0;
  end
  else begin
    o_wfifo_strobe            <=  0;
    if ((state == READ) && ((i_wfifo_ready > 0) && (o_wfifo_activate == 0))) begin
      r_count                 <=  0;
      if (i_wfifo_ready[0]) begin
        o_wfifo_activate[0]   <=  1;
      end                     
      else begin              
        o_wfifo_activate[1]   <=  1;
      end                     
    end                       
    case (state)              
      IDLE: begin             
        if (i_enable) begin  
          state               <=  READ;
          o_wfifo_activate    <=  0;
        end
      end
      READ: begin
        if (!i_enable) begin
          state               <=  IDLE;
        end
        else begin
          if (r_count < i_wfifo_size) begin
            if (i_i2s_lr != r_prev_i2s_lr) begin
              //A word is ready to write to memory
              o_wfifo_data    <=  {r_prev_i2s_lr, 7'h0, read_word[23:0]};
              o_wfifo_strobe  <=  1;
              r_count         <=  r_count + 1;
            end
          end
          else begin
            o_wfifo_activate  <=  0;
          end
          read_word           <=  {read_word[30:0] << 1, i_i2s_data};
        end
      end
      default: begin
        state                 <=  IDLE;
      end
    endcase
  end
  r_prev_i2s_lr               <=  i_i2s_lr;
end

endmodule
