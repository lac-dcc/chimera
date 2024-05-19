// This program was cloned from: https://github.com/CospanDesign/nysa-verilog
// License: MIT License

//i2s_controllerv
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

`include "project_defines.v"
`include "i2s_defines.v"


`timescale 1 ns/1 ps
module i2s_controller (
  input               rst,
  input               clk,

  input               enable,
  input               post_fifo_wave_en,

  input       [31:0]  clock_divider,

  //memory interface
  output      [23:0]  wfifo_size,
  output      [1:0]   wfifo_ready,
  input       [1:0]   wfifo_activate,
  input               wfifo_strobe,
  input       [31:0]  wfifo_data,

  output  reg         i2s_mclock,
  output  reg         i2s_clock,
  output              i2s_data,
  output              i2s_lr
);

`define DEFAULT_MCLOCK_DIVISOR `CLOCK_RATE / (`AUDIO_RATE) / 256

//registers/wires
reg         [31:0]  clock_count = 0;
reg         [31:0]  mclock_count = 0;

wire                audio_data_request;
wire                audio_data_ack;
wire        [23:0]  audio_data;
wire                audio_lr_bit;

//sub modules
i2s_mem_controller mcontroller (
  .rst                  (rst                ),
  .clk                  (clk                ),

  //control
  .enable               (enable             ),
  .post_fifo_wave_en    (post_fifo_wave_en  ),

  //clock
  .i2s_clock            (i2s_clock          ),

  .wfifo_size           (wfifo_size         ),
  .wfifo_ready          (wfifo_ready        ),
  .wfifo_activate       (wfifo_activate     ),
  .wfifo_strobe         (wfifo_strobe       ),
  .wfifo_data           (wfifo_data         ),

  //i2s writer
  .audio_data_request   (audio_data_request ),
  .audio_data_ack       (audio_data_ack     ),
  .audio_data           (audio_data         ),
  .audio_lr_bit         (audio_lr_bit       )
);

i2s_writer writer       (
  .rst                  (rst                ),
  .clk                  (clk                ),

  //control/clock
  .enable               (enable             ),
  .starved              (starved            ),

  //i2s clock
  .i2s_clock            (i2s_clock          ),

  //i2s writer
  .audio_data_request   (audio_data_request ),
  .audio_data_ack       (audio_data_ack     ),
  .audio_data           (audio_data         ),
  .audio_lr_bit         (audio_lr_bit       ),

  //i2s audio interface
  .i2s_data             (i2s_data           ),
  .i2s_lr               (i2s_lr             )
);

//asynchronous logic
//`define DEFAULT_MCLOCK_DIVISOR (`CLOCK_RATE / (`AUDIO_RATE * 256)) / 2
`define DEFAULT_MCLOCK_DIVISOR 1

//synchronous logic
//clock generator
always @(posedge clk) begin
  if (rst) begin
    i2s_clock     <=  0;
    clock_count   <=  0;
  end
  if (clock_count >= clock_divider) begin
    i2s_clock     <=  ~i2s_clock;
    clock_count   <= 0;
  end
  else begin
    clock_count   <=  clock_count + 1;
  end
end

always @(posedge clk) begin
  if (mclock_count >= `DEFAULT_MCLOCK_DIVISOR) begin
    i2s_mclock     <=  ~i2s_mclock;
    mclock_count   <= 0;
  end
  else begin
    mclock_count   <=  mclock_count + 1;
  end
end

endmodule
