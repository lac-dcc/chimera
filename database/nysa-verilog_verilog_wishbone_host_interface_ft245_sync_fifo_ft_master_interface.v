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

//ft_master_interface.v

/*
 * Change log
 * 10/23/2013
 *  -Fixed a bug in the response where the full response is always sent even
 *  when a Ping was returned
 *  -Added interrupts to the full 13 charater response type
 *
 */

`timescale 1ns/1ps

`include "cbuilder_defines.v"

`define PING_RESP         ((~`COMMAND_PING)         & (4'hF))
`define WRITE_RESP        ((~`COMMAND_WRITE)        & (4'hF))
`define READ_RESP         ((~`COMMAND_READ)         & (4'hF))
`define RESET_RESP        ((~`COMMAND_RESET)        & (4'hF))
`define MASTER_ADDR_RESP  ((~`COMMAND_MASTER_ADDR)  & (4'hF))
`define CORE_DUMP_RESP    ((~`COMMAND_CORE_DUMP)    & (4'hF))

module ft_master_interface (
  //boilerplate
  input               rst,
  input               clk,

  //master interface
  input               i_master_ready,
  output              o_ih_reset,
  output reg          o_ih_ready,

  output  reg [31:0]  o_in_command,
  output  reg [31:0]  o_in_address,
  output  reg [31:0]  o_in_data,
  output  reg [27:0]  o_in_data_count,

  output  reg         o_oh_ready,
  input               i_oh_en,

  input   [31:0]      i_out_status,
  input   [31:0]      i_out_address,
  input   [31:0]      i_out_data,
  input   [27:0]      i_out_data_count,

  //FTDI interface
  input               i_ftdi_clk,
  inout   [7:0]       io_ftdi_data,
  input               i_ftdi_txe_n,
  output              o_ftdi_wr_n,
  input               i_ftdi_rde_n,
  output              o_ftdi_oe_n,
  output              o_ftdi_rd_n,
  input               i_ftdi_suspend_n,
  output              o_ftdi_siwu,

  //debug
  output  [15:0]      o_ftdi_debug


);


wire ftdi_clk;
BUFGP ftdi_bufg(
  .I    (i_ftdi_clk   ),
  .O    (ftdi_clk     )
);

//local wires/registers
localparam           IDLE            = 0;

//wires/registers for the ft_fifo_interface
reg                 in_fifo_read;
wire    [23:0]      in_fifo_count;
wire                in_fifo_ready;
reg                 in_fifo_activate;
wire    [7:0]       in_fifo_data;
wire                start_of_frame;

reg                 out_fifo_write;
wire    [23:0]      out_fifo_write_size;
wire    [1:0]       out_fifo_ready;
reg     [1:0]       out_fifo_activate;
reg     [7:0]       out_fifo_data;
reg     [23:0]      data_count;

wire                waiting_for_id;

//assembler specific states
localparam           WAIT_FOR_ID_BYTE        = 1;
localparam           PROCESS_DATA            = 2;
localparam           WAIT_FOR_INPUT_HANDLER  = 3;
reg     [3:0]       assembler_state;
reg     [23:0]      read_count;
reg     [1:0]       packet_count;
reg                 found_id_byte;
reg     [31:0]      input_dword;
wire                dword_ready;

//input handler specific states
localparam           WAIT_FOR_COMMAND        = 1;
localparam           READ_COMMAND            = 2;
localparam           WAIT_FOR_ADDRESS        = 3;
localparam           READ_ADDRESS            = 4;
localparam           WAIT_FOR_DATA           = 5;
localparam           NOTIFY_MASTER           = 6;
reg     [3:0]       input_handler_state;
reg                 read_dword;
reg     [23:0]      local_data_count;

//output handler specific states
localparam           WAIT_FOR_STATUS         = 1;
localparam           WRITE_TO_FIFO           = 2;
localparam           WRITE_MORE_DATA         = 3;
reg     [3:0]       output_handler_state;
reg     [31:0]      output_dword;
reg                 output_dword_en;
reg     [23:0]      out_fifo_count;
reg     [7:0]       out_packet  [12:0];
reg     [3:0]       position;
reg     [7:0]       out_packet_count;
reg     [3:0]       oh_status;

//debug interface
wire    [15:0]      ftdi_debug;
wire    [15:0]      wdebug;
//reg     [15:0]      rdebug;
assign  o_ftdi_debug = wdebug;
//assign  o_ftdi_debug = ftdi_debug;
assign              o_ih_reset  = 0;

//modules
ft_fifo_interface ft (
  .rst                  (rst                 ),
  .clk                  (clk                 ),

  //incomming FIFO
  .in_fifo_read         (in_fifo_read        ),
  .in_fifo_count        (in_fifo_count       ),
  .in_fifo_ready        (in_fifo_ready       ),
  .in_fifo_activate     (in_fifo_activate    ),
  .in_fifo_data         (in_fifo_data        ),
  .start_of_frame       (start_of_frame      ),

  //outgoing FIFO
  .out_fifo_write       (out_fifo_write      ),
  .out_fifo_write_size  (out_fifo_write_size ),
  .out_fifo_ready       (out_fifo_ready      ),
  .out_fifo_activate    (out_fifo_activate   ),
  .out_fifo_starved     (                    ),
  .out_fifo_data        (out_fifo_data       ),

  //FTDI FIFO interface
  .ftdi_clk             (ftdi_clk            ),
  .ftdi_data            (io_ftdi_data        ),
  .ftdi_txe_n           (i_ftdi_txe_n        ),
  .ftdi_wr_n            (o_ftdi_wr_n         ),
  .ftdi_rd_n            (o_ftdi_rd_n         ),
  .ftdi_rde_n           (i_ftdi_rde_n        ),
  .ftdi_oe_n            (o_ftdi_oe_n         ),
  .ftdi_siwu            (o_ftdi_siwu         ),

  .debug                (ftdi_debug          )
);
//asynchronous logic

assign  waiting_for_id      = (input_handler_state == IDLE);
assign  dword_ready         = (assembler_state == WAIT_FOR_INPUT_HANDLER);


//debug connections
//assign  wdebug[1:0]         = assembler_state[1:0];
assign  wdebug[0]           = (input_handler_state == NOTIFY_MASTER);
assign  wdebug[1]           = (output_handler_state == WAIT_FOR_STATUS);
//assign  wdebug[2]           = dword_ready;
assign  wdebug[2]           = in_fifo_ready;
assign  wdebug[3]           = (waiting_for_id);
assign  wdebug[4]           = in_fifo_activate;
assign  wdebug[5]           = in_fifo_read;
assign  wdebug[7:6]         = packet_count[1:0];
assign  wdebug[15:8]        = in_fifo_data;

//synchronous logic

//state machine to assemble 32 bit words from the incomming 8 bit words
//Assembler
always @ (posedge clk ) begin
  if (rst) begin
    assembler_state       <=  IDLE;
    read_count            <=  0;
    in_fifo_read          <=  0;
    in_fifo_activate      <=  0;
    packet_count          <=  0;
    found_id_byte         <=  0;
    input_dword           <=  32'h0000;
  end
  else begin
    in_fifo_read          <=  0;
    found_id_byte         <=  0;

    case (assembler_state)
      IDLE: begin
        //get a FIFO
        if (in_fifo_ready) begin
          read_count        <=  in_fifo_count - 24'h1;
          in_fifo_activate  <=  1;
          in_fifo_read      <=  1;

          if (waiting_for_id) begin
            assembler_state <=  WAIT_FOR_ID_BYTE;
          end
          else begin
            assembler_state <=  PROCESS_DATA;
          end
        end
      end
      WAIT_FOR_ID_BYTE: begin
        packet_count          <=  0;
        if (start_of_frame && in_fifo_data == 8'hCD) begin
          //found it!
          found_id_byte       <=  1;
          assembler_state     <=  PROCESS_DATA;
          in_fifo_read        <=  1;
          read_count            <=  read_count - 24'h1;
        end
        else begin
          in_fifo_read          <=  1;
          read_count            <=  read_count - 24'h1;
        end
        if (read_count == 0) begin
          in_fifo_activate    <=  0;
          assembler_state     <=  IDLE;
        end
      end
      PROCESS_DATA: begin
        input_dword             <= {input_dword[23:0], in_fifo_data};
        if (packet_count == 2'h3) begin
          assembler_state       <=  WAIT_FOR_INPUT_HANDLER;
        end
        else begin
          packet_count          <= packet_count + 2'h1;
          if (read_count == 0) begin
            in_fifo_activate    <=  0;
            assembler_state     <=  IDLE;
          end
          else begin
            in_fifo_read        <=  1;
            read_count          <= read_count - 24'h1;
          end
        end
      end
      WAIT_FOR_INPUT_HANDLER: begin
        if (read_dword) begin
          packet_count          <=  0;
          if (read_count > 0) begin
            in_fifo_read        <=  1;
            read_count          <= read_count - 24'h1;
            assembler_state     <=  PROCESS_DATA;
          end
          else begin
            in_fifo_activate    <=  0;
            assembler_state     <=  IDLE;
          end
        end
        if (input_handler_state == IDLE) begin
          in_fifo_activate      <=  0;
          assembler_state       <=  IDLE;
        end
      end
      default: begin
        in_fifo_activate        <=  0;
        assembler_state         <=  IDLE;
      end
    endcase
  end
end

//state machine to read data from the in FIFO and send it to the master
//dissassembler
always @ (posedge clk ) begin
  if (rst) begin
    input_handler_state   <=  IDLE;
    read_dword            <=  1;
    o_in_command          <=  0;
    o_in_address          <=  0;
    o_in_data             <=  0;
    o_in_data_count       <=  0;
    local_data_count      <=  0;
    o_ih_ready            <=  0;
  end
  else begin
    read_dword            <=  0;
    o_ih_ready            <=  0;
    case (input_handler_state)
      IDLE: begin
        if (found_id_byte) begin
          input_handler_state <=  WAIT_FOR_COMMAND;
        end
      end
      WAIT_FOR_COMMAND: begin
        if (dword_ready) begin
          read_dword  <=  1;
          input_handler_state <=  READ_COMMAND;
          o_in_command        <=  {12'h000, input_dword[31:28], 12'h000, input_dword[27:24]};
          o_in_data_count     <=  {8'h00, input_dword[23:0]};
          local_data_count    <=  input_dword[23:0];
        end
      end
      READ_COMMAND: begin
        if (o_in_command[3:0] == `COMMAND_PING) begin
          $display("Reading PING command");
          input_handler_state <=  NOTIFY_MASTER;
        end
        else if (o_in_command[3:0] == `COMMAND_RESET) begin
          $display("Reading RESET command");
          input_handler_state <=  IDLE;
        end
        else if (o_in_command[3:0] == `COMMAND_READ) begin
          $display("Reading READ command");
          input_handler_state <=  WAIT_FOR_ADDRESS;
        end
        else if (o_in_command[3:0] == `COMMAND_WRITE) begin
          $display("Reading WRITE command");
          input_handler_state <=  WAIT_FOR_ADDRESS;
        end
        else begin
          $display("Reading OTHER command");
          input_handler_state <=  WAIT_FOR_ADDRESS;
        end
      end
      WAIT_FOR_ADDRESS: begin
        if (dword_ready) begin
          read_dword          <=  1;
          o_in_address          <=  input_dword;
          input_handler_state <=  READ_ADDRESS;
        end
      end
      READ_ADDRESS: begin
        if (  (o_in_command[3:0]  ==  `COMMAND_WRITE)        ||
              (o_in_command[3:0]  ==  `COMMAND_MASTER_ADDR)  ||
              (o_in_command[3:0]  ==  `COMMAND_CORE_DUMP)) begin
          input_handler_state <=  WAIT_FOR_DATA;
        end
        else begin
          input_handler_state <=  NOTIFY_MASTER;
        end
      end
      WAIT_FOR_DATA: begin
        if (dword_ready && !o_ih_ready && i_master_ready) begin
          read_dword              <=  1;
          o_in_data               <=  input_dword;
          if(local_data_count > 0) begin
              local_data_count    <=  local_data_count - 24'h1;
          end
          input_handler_state     <=  NOTIFY_MASTER;
        end
      end
      NOTIFY_MASTER: begin
        if (i_master_ready) begin
          o_ih_ready              <=  1;
          if (o_in_command[3:0] == `COMMAND_WRITE && local_data_count > 0) begin
            input_handler_state   <=  WAIT_FOR_DATA;
          end
          else begin
            input_handler_state   <=  IDLE;
          end
        end
      end
      default: begin
        input_handler_state       <=  IDLE;
      end
    endcase
  end
end

/*
assign  wdebug[1:0]         = output_handler_state;
assign  wdebug[3:2]         = out_fifo_ready[1:0];
assign  wdebug[5:4]         = out_fifo_activate[1:0];
assign  wdebug[6]           = out_fifo_write;
assign  wdebug[7]           = (oh_status == 4'hD);
assign  wdebug[11:8]        = i_out_data_count[3:0];
assign  wdebug[12]          = (out_packet_count == 0);
assign  wdebug[13]          = (out_packet[position][7:0] == 0);
assign  wdebug[14]          = o_oh_ready;
assign  wdebug[15]          = i_oh_en;
*/

//assign  wdebug[15:8]        = in_fifo_data;

integer i;

//state machine to read data from the master and send it to the out FIFO
always @ (posedge clk ) begin
  if (rst) begin

  //Output handler
  output_handler_state          <=  IDLE;

  //Output FIFO
  out_fifo_count                <=  0;
  out_fifo_activate             <=  0;
  out_fifo_data                 <=  0;
  out_fifo_write                <=  0;
  out_packet_count              <=  0;

  for (i = 0; i < 13; i = i + 1) begin
    out_packet[i]               <=  0;
  end
  oh_status                     <=  0;

  position                      <=  0;
  data_count                    <=  0;

  end
  else begin
    o_oh_ready                  <=  0;
    out_fifo_write              <=  0;
    case (output_handler_state)
      IDLE: begin
        //get a FIFO
        if (out_fifo_ready[1:0] != 0) begin
          if (out_fifo_ready[0]) begin
            out_fifo_activate[0]  <=  1;
          end
          else begin
            out_fifo_activate[1]  <=  1;
          end
          out_fifo_count        <=  out_fifo_write_size - 24'h1;
          if ((     (oh_status == `READ_RESP) ||
                    (oh_status == `CORE_DUMP_RESP)
             ) && (data_count > 0)) begin

            output_handler_state <=  WRITE_MORE_DATA;
            out_packet_count     <=  0;
            data_count           <= data_count - 24'h1;
          end
          else begin
            //send all data to the host
            oh_status             <=  0;
            output_handler_state  <=  WAIT_FOR_STATUS;
          end
        end
      end
      WAIT_FOR_STATUS: begin
        o_oh_ready                <=  1;
        if (i_oh_en) begin
          o_oh_ready              <=  0;
          out_packet[0]         <=  8'hDC;
          out_packet[1]         <=  i_out_status[7:0];
          oh_status             <=  i_out_status[3:0];
          if (  (i_out_status[3:0] == `READ_RESP)        ||
                (i_out_status[3:0] == `WRITE_RESP)       ||
                (i_out_status[3:0] == `MASTER_ADDR_RESP) ||
                (i_out_status[3:0] == `PERIPH_INTERRUPT) ||
                (i_out_status[3:0] == `CORE_DUMP_RESP) ) begin

            out_packet[2]       <=  i_out_data_count[23:16];
            out_packet[3]       <=  i_out_data_count[15:8];
            out_packet[4]       <=  i_out_data_count[7:0];
            out_packet[5]       <=  i_out_address[31:24];
            out_packet[6]       <=  i_out_address[23:16];
            out_packet[7]       <=  i_out_address[15:8];
            out_packet[8]       <=  i_out_address[7:0];
            out_packet[9]       <=  i_out_data[31:24];
            out_packet[10]      <=  i_out_data[23:16];
            out_packet[11]      <=  i_out_data[15:8];
            out_packet[12]      <=  i_out_data[7:0];
            out_packet_count    <=  13;
          end
          else begin
            out_packet[2]       <=  7'h00;
            out_packet[3]       <=  7'h00;
            out_packet[4]       <=  7'h00;
            out_packet_count    <=  5;

            //get the count for the data going out
          end
          data_count            <=  i_out_data_count[23:0];
          position              <=  0;
          output_handler_state  <=  WRITE_TO_FIFO;
        end
      end
      WRITE_TO_FIFO: begin
        out_fifo_data           <=  out_packet[position];
        position                <=  position + 4'h1;
        out_fifo_write          <=  1;
        out_fifo_count          <=  out_fifo_count - 24'h1;
        if(position == out_packet_count) begin
          //were done sending the initial packet, check to see if there is more data to send
          //release this FIFO because the output FIFO is starving
          out_fifo_activate[0]  <=  0;
          out_fifo_activate[1]  <=  0;
          output_handler_state  <=  IDLE;
        end
      end
      WRITE_MORE_DATA: begin
        o_oh_ready                <=  1;
        if (i_oh_en) begin
          o_oh_ready              <=  0;
          out_packet[0]         <=  i_out_data[31:24];
          out_packet[1]         <=  i_out_data[23:16];
          out_packet[2]         <=  i_out_data[15:8];
          out_packet[3]         <=  i_out_data[7:0];
          output_handler_state  <=  WRITE_TO_FIFO;
          out_packet_count      <=  4;
          position              <=  0;
        end
      end
      default: begin
        out_fifo_activate       <=  0;
        output_handler_state    <=  IDLE;
      end
    endcase
  end
end

endmodule
