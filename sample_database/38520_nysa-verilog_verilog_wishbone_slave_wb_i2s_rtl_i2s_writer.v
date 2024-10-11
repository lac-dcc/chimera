// This program was cloned from: https://github.com/CospanDesign/nysa-verilog
// License: MIT License

//i2s_writer.v
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


`timescale 1 ns/1 ps
module i2s_writer (
  rst,
  clk,

  //control/status
  enable,
  starved,

  //clock
  i2s_clock,

  //mem controller interface
  audio_data_request,
  audio_data_ack,
  audio_data,
  audio_lr_bit,

  //physical connections
  i2s_data,
  i2s_lr
);

parameter           DATA_SIZE = 32;

input               rst;
input               clk;

input               enable;

input               i2s_clock;

output  reg         audio_data_request;
input               audio_data_ack;
input       [23:0]  audio_data;
input               audio_lr_bit;

output  reg         i2s_data;
output  reg         i2s_lr;

output  reg         starved;

//parameter
parameter           START         = 4'h0;
parameter           REQUEST_DATA  = 4'h1;
parameter           DATA_READY    = 4'h2;

//registers/wires
reg         [7:0]   bit_count;
reg         [23:0]  new_audio_data;
reg                 new_audio_lr_bit;
reg         [23:0]  audio_shifter;

//writer state machine
reg         [3:0]   state;

//asynchronous logic

//synchronous logic
always @ (posedge rst or negedge i2s_clock) begin
  if (rst) begin
    bit_count           <=  DATA_SIZE -1;
    new_audio_data      <=  0;
    new_audio_lr_bit    <=  0;
    audio_shifter       <=  0;
    state               <=  START;
    starved             <=  0;
    i2s_data            <=  0;
    i2s_lr              <=  0;
    audio_data_request  <=  0;
  end
  else if (enable) begin
    starved           <=  0;
    case (state)
      START: begin
         audio_data_request       <=  1;
        if (audio_data_ack) begin
          audio_data_request     <=  0;
          state             <=  DATA_READY;
          new_audio_data    <=  {1'b0, audio_data[23:1]};
          //new_audio_data    <=  audio_data[23:0];
          new_audio_lr_bit  <=  audio_lr_bit;
        end
      end
      REQUEST_DATA: begin
        audio_data_request       <=  1;
        if (audio_data_ack) begin
          audio_data_request     <=  0;
          state             <=  DATA_READY;
          new_audio_data    <=  audio_data;
          new_audio_lr_bit  <=  audio_lr_bit;
        end
      end
      DATA_READY: begin
        //wait for the bit count to reach 0
        if (bit_count == DATA_SIZE - 2) begin
          state       <=  REQUEST_DATA;
        end
      end
      default: begin
        state       <=  REQUEST_DATA;
      end
    endcase

    //continusously shift data out
    if (bit_count == 0) begin
      if (state == DATA_READY) begin
        //put the new data into the shifter and reset the bit_count
        bit_count       <=  DATA_SIZE - 1;
        audio_shifter   <=  new_audio_data;
        i2s_lr          <=  new_audio_lr_bit;
        new_audio_data  <=  0;
        new_audio_lr_bit<=  0;
      end
      else begin
        //starved, can't do anything
        starved         <=  1;
        i2s_data        <=  0;
      end
    end
    else begin
      //shift out data
      bit_count         <=  bit_count - 1;
      i2s_data          <=  audio_shifter[23];
      audio_shifter     <=  {audio_shifter[22:0], 1'b0};
    end
  end
end

endmodule
