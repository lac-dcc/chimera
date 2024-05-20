// This program was cloned from: https://github.com/CospanDesign/nysa-verilog
// License: MIT License

//i2s_mem_controllerv
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
`timescale 1 ns/1 ps

module i2s_mem_controller (
  input               rst,
  input               clk,

  //control
  input               enable,
  input               post_fifo_wave_en,

  //clock divider
  input               i2s_clock,

  //memory interface
  output      [23:0]  wfifo_size,
  output      [1:0]   wfifo_ready,
  input       [1:0]   wfifo_activate,
  input               wfifo_strobe,
  input       [31:0]  wfifo_data,

  //i2s writer
  input               audio_data_request,
  output  reg         audio_data_ack,
  output  reg [23:0]  audio_data,
  output  reg         audio_lr_bit
);

//registers/wires

//input side
wire                starved;

//output side
reg                 read_strobe = 0;
wire                read_ready;
reg                 read_activate = 0;
wire        [23:0]  read_size;
wire        [31:0]  read_data;


//i2s writer interface
reg         [23:0]  read_count = 0;
reg         [3:0]   state = 0;


//waveform
reg         [31:0]  write_count = 0;
reg         [7:0]   test_pre_pos = 0;
wire        [7:0]   test_pre_wavelength;
wire        [15:0]  test_pre_value;
reg         [31:0]  test_pre_data;
reg                 test_pre_write_strobe;
wire        [31:0]  fifo_data;
wire                fifo_write_strobe;

reg         [7:0]   test_pos = 0;
wire        [7:0]   test_wavelength;
wire        [15:0]  test_value;

//parameters
parameter   READ_STROBE     = 4'h0;
parameter   DELAY           = 4'h1;
parameter   READ            = 4'h2;

//generate a Ping Pong FIFO to cross the clock domain
ppfifo #(
  .DATA_WIDTH(32),
`ifndef SIMULATION
  .ADDRESS_WIDTH(12)
  //.ADDRESS_WIDTH(4)
`else
  .ADDRESS_WIDTH(2)
`endif
)ping_pong (

  .reset           (rst || !enable    ),

  //write
  .write_clock     (clk               ),
  .write_ready     (wfifo_ready       ),
  .write_activate  (wfifo_activate    ),
  .write_fifo_size (wfifo_size        ),
  .write_strobe    (wfifo_strobe      ),
  .write_data      (wfifo_data        ),

  //.starved         (starved           ),

  //read
  .read_clock      (i2s_clock         ),
  .read_strobe     (read_strobe       ),
  .read_ready      (read_ready        ),
  .read_activate   (read_activate     ),
  .read_count      (read_size         ),
  .read_data       (read_data         )
);


waveform wave_post (
  .clk(clk),
  .rst(rst),
  .wavelength(test_wavelength),
  .pos(test_pos),
  .value(test_value)
);

//asynchronous logic

//prepare the data for the i2s writer
`ifdef SIMULATION
always @(posedge i2s_clock or posedge rst) begin
`else
always @(posedge i2s_clock) begin
`endif
  read_strobe     <=  0;
  if (rst) begin
    audio_data_ack  <=  0;
    audio_data      <=  0;
    audio_lr_bit    <=  0;
    read_count      <=  0;
    read_activate   <=  0;
    state           <=  READ_STROBE;
    test_pos        <=  0;
  end
  else if (enable) begin

    //got an ack from the writer
    if (~audio_data_request && audio_data_ack) begin
      //de-assert the ack
      audio_data_ack      <=  0;
    end

    if (post_fifo_wave_en) begin
      if (audio_data_request && ~audio_data_ack) begin
        audio_lr_bit    <=  ~audio_lr_bit;

        if (test_pos >= test_wavelength - 1) begin
          test_pos  <=  0;
        end
        else begin
          test_pos  <=  test_pos + 1;
        end

        audio_data        <=  {test_value, 8'h0};
        audio_data_ack    <=  1;
      end
    end

    else begin
      if (read_ready && !read_activate) begin
        read_count        <=  0;
        read_activate     <=  1;
      end
      else if (read_activate) begin
        if (read_count < read_size) begin
          if (audio_data_request && !audio_data_ack) begin
            audio_data    <=  read_data[23:0];
            audio_lr_bit  <=  read_data[31];
            audio_data_ack<=  1;
            read_count    <=  read_count + 1;
            read_strobe   <=  1;
          end
        end
        else begin
          read_activate   <=  0;
        end
      end
    end
  end
end

endmodule
