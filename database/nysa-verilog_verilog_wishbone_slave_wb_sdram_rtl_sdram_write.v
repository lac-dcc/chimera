// This program was cloned from: https://github.com/CospanDesign/nysa-verilog
// License: MIT License

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
`include "sdram_include.v"

module sdram_write (
input               rst,
input               clk,
output      [31:0]  debug,

//RAM control
output  reg [2:0]   command,
output  reg [11:0]  address,
output  reg [1:0]   bank,
output  reg [15:0]  data_out,
output  reg [1:0]   data_mask,

//sdram controller
output              idle,
input               enable,
input       [21:0]  app_address,
input               auto_refresh,
output  reg         wait_for_refresh,

//FIFO
input       [35:0]  fifo_data,
output  reg         fifo_read,
input               fifo_ready,
output  reg         fifo_activate,
input       [23:0]  fifo_size,
input               fifo_inactive


);

localparam           IDLE            = 4'h0;
localparam           WAIT            = 4'h1;
localparam           ACTIVATE        = 4'h2;
localparam           WRITE_COMMAND   = 4'h3;
localparam           WRITE_TOP       = 4'h4;
localparam           WRITE_BOTTOM    = 4'h5;
localparam           BURST_TERMINATE = 4'h6;
localparam           PRECHARGE       = 4'h7;

reg                 empty;

reg     [3:0]       state;
reg     [15:0]      delay;

//this address gets latched in when the user initiates a write
reg		  [21:0]			write_address;

wire    [11:0]      row;
wire    [7:0]       column;
wire                continue_writing;
reg     [23:0]      fifo_count;
reg     [15:0]      top_data;
reg     [1:0]       top_mask;
reg     [15:0]      bottom_data;
reg     [1:0]       bottom_mask;

//assign  bank          =   write_address[21:20];
assign  row           =   write_address[19:8];
assign  column        =   write_address[7:0]; //4 Byte Boundary

assign  debug[15:0]   =   fifo_data[15:0];
assign  debug[18:16]  =   state[2:0];
assign  debug[19]     =   fifo_read;
assign  debug[20]     =   enable;
assign  debug[23:21]  =   command;
assign  debug[25:24]  =   write_address[3:1];
assign  debug[26]     =   fifo_inactive;
assign  debug[28]     =   fifo_activate;


//assign idle
assign  idle          =   ((delay == 0) && ((state == IDLE) || (state == WAIT)));


always @(posedge clk) begin
  //Always reset FIFO Read
  fifo_read <=  0;

  if (rst) begin
    command           <=  `SDRAM_CMD_NOP;
    state             <=  IDLE;
    delay             <=  0;
    write_address     <=  22'h000000;
    bank              <=  2'b00;
    data_out          <=  16'h0000;
    data_mask         <=  2'b0;
    address           <=  12'h000;
    wait_for_refresh  <=  0;
    empty             <=  0;
    fifo_count        <=  0;
    fifo_activate     <=  0;
    top_data          <=  0;
    top_mask          <=  0;
    bottom_data       <=  0;
    bottom_mask       <=  0;

  end
  else begin
    data_out  <=  16'h0000;
    wait_for_refresh  <=  0;
    if (delay > 0) begin
      command     <=  `SDRAM_CMD_NOP;
      delay       <=  delay - 1;
    end
    else begin
      case (state)
        IDLE: begin
          if (enable || fifo_ready) begin
            //$display ("SDRAM WRITE: IDLE New Data!");
            state           <=  WAIT;
            write_address   <=  app_address;
          end
          wait_for_refresh  <=  1;
        end
        WAIT: begin
          if (auto_refresh) begin
            wait_for_refresh  <=  1;
          end
          else begin
            if (!fifo_activate) begin
              //if the FIFO is not activated
              if (fifo_ready) begin
                //A FIFO is ready
                fifo_activate <=  1;
                fifo_count    <=  0;
              end
              else if (fifo_inactive && !enable) begin
                //DONE!
                state         <=  IDLE;
              end
            end
            else begin
              if (fifo_count < fifo_size) begin
                //everything is good to go
                state         <=  ACTIVATE;
                fifo_count    <=  fifo_count + 1;
                top_data      <=  fifo_data[31:16];
                bottom_data   <=  fifo_data[15:0];
                top_mask      <=  fifo_data[35:34];
                bottom_mask   <=  fifo_data[33:32];
                fifo_read     <=  1;
              end
              else begin
                //we have an enabled FIFO
                //there is no data in this FIFO
                fifo_activate <=  0;
                delay         <=  1;
              end
            end
          end
        end
        ACTIVATE: begin
          //$display ("SDRAM_WRITE: ACTIVATE ROW %h", row);
          command       <=  `SDRAM_CMD_ACT;
          delay         <=  `T_RCD;
          bank          <=  write_address[21:20];
          address       <=  row;
          state         <=  WRITE_COMMAND;
        end
        WRITE_COMMAND: begin
          //$display ("SDRAM_WRITE: Issue the write command");
          empty         <=  0;
          command       <=  `SDRAM_CMD_WRITE;
          address       <=  {4'b0000, column};
          data_out      <=  top_data;
          data_mask     <=  top_mask;
          state         <=  WRITE_BOTTOM;
        end
        WRITE_TOP: begin
          empty         <=  0;
          command       <=  `SDRAM_CMD_NOP;
          data_out      <=  top_data;
          data_mask     <=  top_mask;
          state         <=  WRITE_BOTTOM;
          //fifo_count    <=  fifo_count + 1;
        end
        WRITE_BOTTOM: begin
          command       <=  `SDRAM_CMD_NOP;
          write_address <=  write_address + 2;
          data_out      <=  bottom_data;
          data_mask     <=  bottom_mask;
          //if there is more data to write then continue on with the write
          //and issue a command to the AFIFO to grab more data
          if ((column == 8'hFE) || auto_refresh) begin
            //we could have reached the end of a row here
            state       <=  BURST_TERMINATE;
            write_address[7:0]  <=  write_address + 2;

          end
          else if (fifo_count < fifo_size) begin
            state         <=  WRITE_TOP;
            fifo_count    <=  fifo_count + 1;
            top_data      <=  fifo_data[31:16];
            bottom_data   <=  fifo_data[15:0];
            top_mask      <=  fifo_data[35:34];
            bottom_mask   <=  fifo_data[33:32];
            fifo_read   <=  1;

          end
          else begin
            //There is no more data left in the FIFO
            state       <=  BURST_TERMINATE;
          end
        end
        BURST_TERMINATE: begin
          command       <=  `SDRAM_CMD_TERM;
          delay         <=  `T_WR;
          state         <=  PRECHARGE;
        end
        PRECHARGE: begin
          command       <=  `SDRAM_CMD_PRE;
          delay         <=  `T_RP;
          state         <=  WAIT;
        end
        default: begin
          //$display ("SDRAM_WRITE: Shouldn't have gotten here");
          state <=  IDLE;
        end
      endcase
    end
  end
end


endmodule
