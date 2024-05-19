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


`define MAX_DWORD 512
`define THRESHOLD 4

module sdram_read (

input               rst,
input               clk,

//RAM control
output  reg [2:0]   command,
output  reg [11:0]  address,
output  reg [1:0]   bank,
input       [15:0]  data_in,


input               enable,
output              idle,
input               auto_refresh,
output  reg         wait_for_refresh,

input       [21:0]  app_address,

//FIFO
output  reg         fifo_reset,
output  reg [31:0]  fifo_data,
output  reg         fifo_write,
input       [1:0]   fifo_ready,
output  reg [1:0]   fifo_activate,
input       [23:0]  fifo_size,
input               starved,

output      [31:0]  debug

);


localparam           IDLE            = 4'h0;
localparam           ACTIVATE        = 4'h1;
localparam           READ_COMMAND    = 4'h2;
localparam           READ_TOP        = 4'h3;
localparam           READ_BOTTOM     = 4'h4;
localparam           BURST_TERMINATE = 4'h5;
localparam           PRECHARGE       = 4'h6;
localparam           WAIT            = 4'h7;

reg         [3:0]   state = IDLE;
reg         [15:0]  delay;

reg         [21:0]  read_address;
reg                 read_top;
reg                 read_bottom;
reg         [23:0]  fifo_count;

wire        [11:0]  row;
wire        [7:0]   column;

wire                read_threshold;


//edge detection
wire                neg_edge_enable;
reg                 prev_enable;

//assign      bank    = read_address[21:20];
assign              row         = read_address[19:8];
assign              column      = read_address[7:0];

assign              debug[2:0]  = state[2:0];
assign              debug[3]    = read_top;
assign              debug[4]    = read_bottom;
assign              debug[12:5] = column;
assign              debug[13]   = (command == `SDRAM_CMD_TERM);
assign              debug[14]   = fifo_data[31];
assign              debug[15]   = fifo_write;
assign              debug[31:16]= fifo_data[23:8];


//assign idle
assign              idle            = ((delay == 0) && ((state == IDLE) || (state == WAIT)));
assign              neg_edge_enable = !enable & prev_enable;

assign              read_threshold  = ((fifo_count + `THRESHOLD) <= fifo_size);

reg         [31:0]  ram_data;

always @ (posedge clk) begin
  if (rst) begin
    command             <=  `SDRAM_CMD_NOP;
    delay               <=  0;
    state               <=  IDLE;
    address             <=  12'h000;
    bank                <=  2'b0;
    read_top            <=  0;
    read_bottom         <=  0;

    //TEST: Putting the read in this state machine
    fifo_write          <=  0;
    fifo_data           <=  32'h0000;
    ram_data            <=  32'h0000;
    fifo_reset          <=  0;
    wait_for_refresh    <=  0;
    fifo_count          <=  0;

  end
  else begin
    fifo_write          <=  0;
    fifo_reset          <=  0;
    wait_for_refresh    <=  0;

    //if (neg_edge_enable) begin
    //  fifo_reset        <=  1;
    //end

    //read the data
    if (read_top) begin
      fifo_data[31:16]  <=  data_in;
      //fifo_data[31:16]  <=  16'h3C4D;
    end
    else if (read_bottom) begin
      fifo_data[15:0]   <=  data_in;
      //fifo_data[15:0] <=  16'h1A2B;
      //send a write pulse to the FIFO
      fifo_write        <=  1;
      fifo_count        <=  fifo_count - 1;
    end
    if (fifo_write) begin
      $display ("SDRAM_READ: Read in: %h", fifo_data);
    end

    //reading the top and bottom should always be a pulse to the other state machine
    //so always reset them
    read_top            <=  0;
    read_bottom         <=  0;


    if (delay > 0) begin
      command           <=  `SDRAM_CMD_NOP;
      delay             <=  delay - 1;
    end
    else begin
      case (state)
        IDLE: begin
          fifo_activate         <=  0;
          if (enable && (fifo_ready > 0)) begin
            //$display ("SDRAM_READ: IDLE: Read request");
            state               <=  WAIT;
            read_address        <=  app_address;
            fifo_count          <=  fifo_size - 1;
            if (fifo_ready[0] == 1) begin
              fifo_activate[0]  <=  1;
            end
            else begin
              fifo_activate[1]  <=  1;
            end
          end
          else if (!enable) begin
            fifo_reset          <=  1;
          end
          wait_for_refresh      <=  1;
        end
        WAIT: begin
          if (auto_refresh) begin
            wait_for_refresh    <=  1;
          end
          else if (~enable) begin
            state               <=  IDLE;
            fifo_activate       <=  0;
          end
          else begin
            if (fifo_activate == 0) begin
              //we don't have a FIFO to work with right now
              if (fifo_ready > 0) begin
                //there is a FIFO available
                fifo_count        <=  fifo_size - 1;
                if (fifo_ready[0]) begin
                  fifo_activate[0]<=  1;
                end
                else begin
                  fifo_activate[1] <=  1;
                end
              end
            end
            else begin
              //we have a FIFO to work with
              if ((fifo_count < fifo_size - 1) && starved) begin
                //the user is starved for data so deactivate this
                //current FIFO
                fifo_activate     <=  0;
                fifo_count        <=  0;
              end
              else if ((fifo_count == 0) && (fifo_activate > 0)) begin
                //FIFO is full
                fifo_activate     <=  0;
                fifo_count        <=  0;
              end
              else begin
                state             <=  ACTIVATE;
              end
            end
          end
        end
        ACTIVATE: begin
          //$display ("SDRAM_READ: Activate row");
          if (auto_refresh) begin
            state         <=  WAIT;
          end
          else begin
            command       <=  `SDRAM_CMD_ACT;
            state         <=  READ_COMMAND;
            address       <=  row;
            bank          <=  read_address[21:20];
            delay         <=  `T_RCD;
          end
        end
        READ_COMMAND: begin
          //$display ("SDRAM_READ: Start reading");
          command       <=  `SDRAM_CMD_READ;
          state         <=  READ_TOP;
          address       <=  {4'b0000, column};
          delay         <=  `T_CAS - 1;
        end
        READ_TOP: begin
          //$display ("SDRAM_READ: Reading top word");
          command       <=  `SDRAM_CMD_NOP;
          read_top      <=  1;
          state         <=  READ_BOTTOM;
          read_address  <=  read_address + 2;
        end
        READ_BOTTOM: begin
          //$display ("SDRAM_READ: Reading bottom word");
          command       <=  `SDRAM_CMD_NOP;
          read_bottom   <=  1;
          if ((fifo_count == 1) ||
              !enable           ||
              (column == 8'h00) ||
              auto_refresh      ||
              (starved && read_threshold)) begin

            state       <=  BURST_TERMINATE;
          end
          else begin
            state       <=  READ_TOP;
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
          if (!enable) begin
            state       <=  IDLE;
          end
          else begin
            state       <=  WAIT;
          end
        end
        default: begin
          $display ("SDRAM_READ: Entered Illegal state");
          state         <=  IDLE;
        end
      endcase
    end
  end
  prev_enable           <=  enable;
end

endmodule
