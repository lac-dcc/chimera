// This program was cloned from: https://github.com/CospanDesign/nysa-verilog
// License: MIT License

/*
Distributed under the MIT licesnse.
Copyright (c) 2011 Dave McCoy (dave.mccoy@cospandesign.com)

Permission is hereby granted, free of charge, to any person obtaining a copy of
this start_of_frametware and associated documentation files (the "Software"),
to deal in the Software without restriction, including without limitation the
rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is furnished
to do so, subject to the following conditions:

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

//ft_fifo_interface.v

`timescale 1ns/1ps

`define IN_FIFO_DATA_SIZE       9
`define IN_FIFO_ADDRESS_WIDTH   10

`define OUT_FIFO_DATA_SIZE      8
`define OUT_FIFO_ADDRESS_WIDTH  10

`define BUFFER_SIZE             2

module ft_fifo_interface (
  //boilerplate
  rst,
  clk,

  //incomming FIFO
  in_fifo_read,
  in_fifo_count,
  in_fifo_ready,
  in_fifo_activate,
  in_fifo_data,
  start_of_frame,

  //outgoing FIFO
  out_fifo_write,
  out_fifo_write_size,
  out_fifo_ready,
  out_fifo_activate,
  out_fifo_starved,
  out_fifo_data,

  //FTDI FIFO interface
  ftdi_clk,
  ftdi_data,
  ftdi_txe_n,
  ftdi_wr_n,
  ftdi_rd_n,
  ftdi_rde_n,
  ftdi_oe_n,
  ftdi_siwu,

  debug
);

//boilerplate
input               rst;
input               clk;

//in fifo
input               in_fifo_read;
output  [23:0]      in_fifo_count;
output              in_fifo_ready;
input               in_fifo_activate;
output  [7:0]       in_fifo_data;
output              start_of_frame;

//out fifo
input               out_fifo_write;
output  [23:0]      out_fifo_write_size;
output  [1:0]       out_fifo_ready;
input   [1:0]       out_fifo_activate;
output              out_fifo_starved;
input   [7:0]       out_fifo_data;

//FTDI interface
input               ftdi_clk;
inout   [7:0]       ftdi_data;
input               ftdi_txe_n;
output              ftdi_wr_n;
input               ftdi_rde_n;
output              ftdi_oe_n;
output              ftdi_rd_n;
output              ftdi_siwu;

//Debug
output  [15:0]      debug;


//local wires/registers
wire                ftdi_transmit_ready;
wire                ftdi_read_available;
reg                 ftdi_output_enable;
//PART OF THE ASYNCHRONOUS WRITE APPROACH
wire                ftdi_write_strobe;
//reg                 ftdi_write_strobe;
wire                ftdi_read_strobe;
reg                 ftdi_send_immediately;

reg                 prev_ftdi_read_available;
reg                 ftdi_start_of_frame;

//read state machine
parameter                           IDLE                = 0;
parameter                           WAIT_FOR_FTDI       = 1;
parameter                           FTDI_ENABLE_OUTPUT  = 2;
parameter                           FTDI_READ           = 3;

reg   [1:0]                         read_state;
wire                                read_busy;
reg   [23:0]                        if_write_count;
reg                                 enable_reading;
//reg   [(`OUT_FIFO_DATA_SIZE - 1):0] ftdi_out_data;
wire  [(`OUT_FIFO_DATA_SIZE - 1):0] ftdi_out_data;

//write state machine
parameter                           PRESTROBE_FIFO      = 1;
parameter                           FIFO_READY          = 2;
parameter                           SEND_TO_FTDI        = 3;

reg   [1:0]                         write_state;
wire                                write_busy;
reg   [23:0]                        out_data_count;
reg                                 prestrobe;
//reg   [(`OUT_FIFO_DATA_SIZE) -1 :0] data_buffer [(`BUFFER_SIZE) - 1: 0];

//ping pong FIFO wires/registers
wire  [(`IN_FIFO_DATA_SIZE) - 1: 0] if_write_data;
wire  [1:0]                         if_write_ready;
reg   [1:0]                         if_write_activate;
wire  [23:0]                        if_write_fifo_size;
wire                                if_write_strobe;

wire                                if_read_strobe;
wire                                if_read_ready;
wire                                if_read_activate;
wire  [(`IN_FIFO_DATA_SIZE) - 1: 0] if_read_data;
wire  [23:0]                        if_read_count;

wire  [(`OUT_FIFO_DATA_SIZE) - 1: 0]of_write_data;
wire  [1:0]                         of_write_ready;
wire  [1:0]                         of_write_activate;
wire  [23:0]                        of_write_fifo_size;
wire                                of_write_strobe;

//PART OF THE ASYNCHRONOUS FTDI WRITE APPROACH
wire                                of_read_strobe;
//reg                                 of_read_strobe;
wire                                of_read_ready;
reg                                 of_read_activate;
wire  [23:0]                        of_read_count;
wire  [(`OUT_FIFO_DATA_SIZE) - 1: 0]of_read_data;


wire  [15:0]                        wdebug;

//ping pong FIFO
//Input FIFO
ppfifo # (
  .DATA_WIDTH(`IN_FIFO_DATA_SIZE),
  .ADDRESS_WIDTH(`IN_FIFO_ADDRESS_WIDTH)
) fifo_in (
  .reset           (rst                ),

  //write side
  .write_clock     (ftdi_clk           ),
  .write_data      (if_write_data      ),
  .write_ready     (if_write_ready     ),
  .write_activate  (if_write_activate  ),
  .write_fifo_size (if_write_fifo_size ),
  .write_strobe    (if_write_strobe    ),
  .starved         (                   ),

  //read side
  .read_clock      (clk                ),
  .read_strobe     (if_read_strobe     ),
  .read_ready      (if_read_ready      ),
  .read_activate   (if_read_activate   ),
  .read_count      (if_read_count      ),
  .read_data       (if_read_data       ),
  .inactive        (                   )
);


//Output FIFO
ppfifo # (
  .DATA_WIDTH(`OUT_FIFO_DATA_SIZE),
  .ADDRESS_WIDTH(`OUT_FIFO_ADDRESS_WIDTH)
) fifo_out (
  .reset           (rst                                  ),

  //write side
  .write_clock     (clk                                  ),
  .write_data      (of_write_data                        ),
  .write_ready     (of_write_ready                       ),
  .write_activate  (of_write_activate                    ),
  .write_fifo_size (of_write_fifo_size                   ),
  .write_strobe    (of_write_strobe                      ),
  .starved         (out_fifo_starved                     ),

  //read side
  .read_clock      (ftdi_clk                             ),
  .read_strobe     (of_read_strobe & ftdi_transmit_ready ),
  .read_ready      (of_read_ready                        ),
  .read_activate   (of_read_activate                     ),
  .read_count      (of_read_count                        ),
  .read_data       (of_read_data                         ),
  .inactive        (                                     )
);


//asynchronous logic

//this is just for readibility
assign  ftdi_transmit_ready = ~ftdi_txe_n;
assign  ftdi_read_available = ~ftdi_rde_n;
assign  ftdi_oe_n           = ~ftdi_output_enable;
assign  ftdi_wr_n           = ~ftdi_write_strobe;
assign  ftdi_rd_n           = ~ftdi_read_strobe;
assign  ftdi_siwu           = ~ftdi_send_immediately;

//local wires for input FIFO to the external interface
assign  if_read_strobe      = in_fifo_read;
assign  if_read_activate    = in_fifo_activate;
assign  in_fifo_count       = if_read_count;
assign  in_fifo_ready       = if_read_ready;

assign  start_of_frame      = if_read_data[8];
assign  in_fifo_data        = if_read_data[7:0];

//tieing FTDI data directly to the input FIFO
assign  if_write_data[8]    = ftdi_start_of_frame;
assign  if_write_data[7:0]  = ftdi_data;
assign  if_write_strobe     = ftdi_read_strobe;

//output ppfifo
assign  of_write_data       = out_fifo_data[7:0];
assign  out_fifo_ready      = of_write_ready;
assign  of_write_activate   = out_fifo_activate;
assign  out_fifo_write_size = of_write_fifo_size;
assign  of_write_strobe     = out_fifo_write;


//busy signals
assign  read_busy           = (read_state  != IDLE) && (read_state != WAIT_FOR_FTDI);
assign  write_busy          = (write_state  != IDLE);

//logic to stop writing to the FIFO when the FTDI chip is empty
assign  ftdi_read_strobe    = (if_write_activate != 0) &&
                              enable_reading &&
                              ftdi_read_available;
//NOTE ftdi_read_strobe is tied to if_write_strobe

//SYNCHRONOUS WRITE TO FTDI STATEMENTS
assign  ftdi_data           = (ftdi_output_enable) ? 8'hZZ : ftdi_out_data;

//ASYNCHRONOUS WRITE TO FTDI STATEMENTS
assign  ftdi_out_data       = of_read_data;
assign  ftdi_write_strobe   = of_read_strobe;
assign  of_read_strobe      = (!read_busy && ftdi_transmit_ready && (out_data_count > 0) && (write_state == SEND_TO_FTDI));

assign  debug               =  wdebug;
//synchronous logic

assign  wdebug[1:0]           =   read_state[1:0];
assign  wdebug[3:2]           =   if_write_ready[1:0];
assign  wdebug[5:4]           =   if_write_activate[1:0];
assign  wdebug[6]             =   (if_write_count > 0);
assign  wdebug[7]             =   if_write_strobe;
assign  wdebug[9:8]           =   write_state[1:0];
assign  wdebug[10]            =   of_read_ready;
assign  wdebug[11]            =   of_read_activate;
assign  wdebug[12]            =   (out_data_count > 0);
assign  wdebug[13]            =   read_busy;
assign  wdebug[14]            =   write_busy;
assign  wdebug[15]            =   ftdi_start_of_frame;


//logic for detecting the start of a frame detect
always @ (posedge ftdi_clk) begin
  if (rst) begin
    prev_ftdi_read_available  <=  0;
    ftdi_start_of_frame       <=  0;
  end
  else begin
    if (ftdi_read_available && ~prev_ftdi_read_available) begin
      //just transitioned to the start of a frame
      ftdi_start_of_frame     <=  1;
    end
    //lower the start of frame when I see the write strobe
    if (if_write_strobe) begin
      ftdi_start_of_frame     <=  0;
    end
    prev_ftdi_read_available  <=  ftdi_read_available;
  end
end

always @ (posedge ftdi_clk) begin
  if (rst) begin
    read_state                <=  IDLE;
    ftdi_output_enable        <=  0;
    if_write_count            <=  0;
    if_write_activate         <=  0;
    enable_reading            <=  0;

  end
  else begin
    enable_reading            <=  0;
    case (read_state)
      IDLE: begin
        //get a FIFO
        if (if_write_ready > 0) begin
          if (if_write_ready[0]) begin
            if_write_activate[0]  <=  1;
          end
          else begin
            if_write_activate[1]  <=  1;
          end
          if_write_count          <=  if_write_fifo_size - 24'h1;
          read_state              <=  WAIT_FOR_FTDI;
        end
      end
      WAIT_FOR_FTDI: begin
        if (!write_busy && ftdi_read_available) begin
          read_state          <=  FTDI_ENABLE_OUTPUT;
        end
      end
      FTDI_ENABLE_OUTPUT: begin
        //pass through state
        ftdi_output_enable    <=  1;
        read_state            <=  FTDI_READ;
      end
      FTDI_READ: begin
        //see if the read is starved and we have at least 9 bytes
        //enough for a minimum transaction
        enable_reading        <=  1;
        if (if_write_count == 0) begin
          //filled up the in FIFO
          enable_reading        <=  0;
          if_write_activate     <=  0;
          ftdi_output_enable    <=  0;
          read_state            <=  IDLE;
        end
        else if (if_write_strobe) begin
          if_write_count  <=  if_write_count - 24'h1;
        end
        //if the FTDI chip is empty release the write FIFO and disable the output enable
        if (!ftdi_read_available) begin
          ftdi_output_enable  <=  0;
          read_state          <=  IDLE;
          //deactivate any currently used FIFOs
          if_write_activate   <=  0;
        end
      end
      default: begin
        ftdi_output_enable    <=  0;
        read_state            <=  IDLE;
      end
    endcase
  end
end

integer i;

always @ (posedge ftdi_clk) begin
  if (rst) begin
    //of_read_strobe          <=  0;
    of_read_activate        <=  0;
    ftdi_send_immediately   <=  0;
    out_data_count          <=  0;
    write_state             <=  IDLE;
  end
  else begin
    //of_read_strobe          <=  0;
    ftdi_send_immediately   <=  0;
    case (write_state)
      IDLE: begin
        if (of_read_ready) begin
          out_data_count    <=  of_read_count;
          write_state       <=  FIFO_READY;
          of_read_activate  <=  1;
        end
      end
      FIFO_READY: begin
        write_state         <=  SEND_TO_FTDI;
      end
      SEND_TO_FTDI: begin
        if (out_data_count  == 0) begin
          of_read_activate  <=  0;
          write_state       <=  IDLE;
        end
        else if (of_read_strobe) begin
          //of_read_strobe    <=  1;
          out_data_count    <=  out_data_count  - 24'h1;
        end
      end
      default: begin
        of_read_activate    <=  0;
        write_state         <=  IDLE;
      end
    endcase
  end
end

endmodule

