// This program was cloned from: https://github.com/CospanDesign/nysa-verilog
// License: MIT License

/*
Distributed under the MIT licesnse.
Copyright (c) 2015 Dave McCoy (dave.mccoy@cospandesign.com)

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

`define ID_DWORD          32'hCD15DBE5
`define ID_RESP           (~`ID_DWORD)

`define STANDARD_RESPONSE 5
`define PING_RESPONSE     2

module ppfifo_host_interface (
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

  input       [31:0]  i_out_status,
  input       [31:0]  i_out_address,
  input       [31:0]  i_out_data,
  input       [27:0]  i_out_data_count,

  input               i_ing_en,
  output  reg         o_ing_fin,

  input               i_egr_en,
  output  reg         o_egr_fin,

  //Ingress Ping Pong FIFO
  input               i_ingress_rdy,
  output  reg         o_ingress_act,
  output  reg         o_ingress_stb,
  input       [23:0]  i_ingress_size,
  input       [31:0]  i_ingress_data,

  //Egress Ping Pong FIFO
  input       [1:0]   i_egress_rdy,
  output  reg [1:0]   o_egress_act,
  output  reg         o_egress_stb,
  input       [23:0]  i_egress_size,
  output  reg [31:0]  o_egress_data
);

//local wires/registers
localparam           IDLE            = 0;

//XXX: Don't know what to do with this signal yet
reg     [23:0]      data_count;

reg     [23:0]      in_data_count;
reg     [31:0]      id;

//input handler specific states
localparam            WAIT_FOR_START  = 4'h1;
localparam            READ_ID         = 4'h2;
localparam            READ_COMMAND    = 4'h3;
localparam            READ_DATA_COUNT = 4'h4;
localparam            READ_ADDRESS    = 4'h5;
localparam            PROCESS_COMMAND = 4'h6;
localparam            WAIT_FOR_DATA   = 4'h7;
localparam            NOTIFY_MASTER   = 4'h8;
localparam            FLUSH_FIFO      = 4'h9;

reg     [3:0]       ih_state;
reg     [23:0]      local_data_count;

//output handler specific states
localparam           WAIT_FOR_STATUS   = 1;
localparam           WRITE_TO_FIFO     = 2;
localparam           WRITE_DATA        = 3;
localparam           FINISHED          = 4;

reg     [3:0]       oh_state;
reg     [23:0]      out_fifo_count;
wire    [31:0]      out_packet  [0:4];
reg     [3:0]       out_packet_pos;
reg     [7:0]       out_packet_count;
reg     [23:0]      out_data_count;
reg     [23:0]      out_data_pos;
reg     [3:0]       oh_status;
wire                in_fifo_has_data;


//modules
//asynchronous logic
assign  in_fifo_has_data    = (o_ingress_act && (in_data_count < i_ingress_size));
assign  out_packet[0]       = `ID_RESP;
assign  out_packet[1]       = i_out_status;
assign  out_packet[2]       = i_out_data_count + 1;
assign  out_packet[3]       = i_out_address;
assign  out_packet[4]       = i_out_data;

assign  o_ih_reset          = 0;

//synchronous logic
//state machine to assemble 32 bit words from the incomming 8 bit words
//Assembler

//state machine to read data from the in FIFO and send it to the master
//dissassembler
always @ (posedge clk ) begin
  //Deassert Strobes
  o_ingress_stb                 <=  0;
  o_ih_ready                    <=  0;

  if (rst) begin
    ih_state                    <=  IDLE;
    o_in_command                <=  0;
    o_in_address                <=  0;
    o_in_data                   <=  0;
    o_in_data_count             <=  0;
    local_data_count            <=  0;

    o_ingress_act               <=  0;
    in_data_count               <=  0;
    o_ing_fin                   <=  0;
  end
  else begin
    //Look for available Ping Pong FIFO
    if (i_ingress_rdy && !o_ingress_act) begin
      in_data_count             <=  0;
      o_ingress_act             <=  1;
    end
    case (ih_state)
      IDLE: begin
        o_ing_fin               <=  0;
        if (i_ing_en) begin
          ih_state              <=  WAIT_FOR_START;
        end
      end
      WAIT_FOR_START: begin
        if (in_fifo_has_data) begin
          o_ingress_stb         <=  1;
          in_data_count         <=  in_data_count + 1;
          ih_state              <=  READ_ID;
          id                    <=  i_ingress_data;
        end
      end
      READ_ID: begin
        if (id == `ID_DWORD) begin
          ih_state              <= READ_COMMAND;
          o_ingress_stb         <=  1;
        end
        else begin
          ih_state              <=  WAIT_FOR_START;
        end
      end
      READ_COMMAND: begin
        if (in_fifo_has_data) begin
          in_data_count         <=  in_data_count + 1;
          o_ingress_stb         <=  1;
        end
        if (o_ingress_stb) begin
          o_in_command          <=  i_ingress_data;
          ih_state              <=  READ_DATA_COUNT;
        end
      end
      READ_DATA_COUNT: begin
        if (in_fifo_has_data) begin
          in_data_count         <=  in_data_count + 1;
          o_ingress_stb         <=  1;
        end
        if (o_ingress_stb) begin
          o_in_data_count       <=  i_ingress_data;
          ih_state              <=  READ_ADDRESS;
        end
      end
      READ_ADDRESS: begin
        if (in_fifo_has_data) begin
          local_data_count      <=  0;
          in_data_count         <=  in_data_count + 1;
          o_ingress_stb         <=  1;
        end
        if (o_ingress_stb) begin
          o_in_address          <=  i_ingress_data;
          o_ingress_stb         <=  0;
          ih_state              <=  PROCESS_COMMAND;
        end
      end
      PROCESS_COMMAND: begin
        if (o_in_command[3:0] == `COMMAND_PING) begin
          $display("Reading PING command");
          ih_state <=  NOTIFY_MASTER;
        end
        else if (o_in_command[3:0] == `COMMAND_RESET) begin
          $display("Reading RESET command");
          ih_state <=  IDLE;
        end
        else if (o_in_command[3:0] == `COMMAND_READ) begin
          $display("Reading READ command");
          ih_state <=  NOTIFY_MASTER;
        end
        else if (o_in_command[3:0] == `COMMAND_WRITE) begin
          $display("Reading WRITE command");
          ih_state <=  WAIT_FOR_DATA;
        end
        else begin
          $display("Reading OTHER command (Not supported right now)");
          ih_state <= FLUSH_FIFO;
        end
      end
      WAIT_FOR_DATA: begin
        if (!o_ih_ready && i_master_ready) begin
          if (in_fifo_has_data) begin
            o_in_data             <=  i_ingress_data;
            if(local_data_count < o_in_data_count) begin
              local_data_count    <=  local_data_count + 1;
              o_ingress_stb       <=  1;
              in_data_count       <=  in_data_count + 1;
            end
            //$display ("Go to Notify Master!");
            ih_state              <=  NOTIFY_MASTER;
            o_ih_ready            <=  1;
          end
          else if (o_ingress_act)begin
            o_ingress_act         <=  0;
          end
        end
      end
      NOTIFY_MASTER: begin
        //$display("In Notify Master!");
        if (i_master_ready) begin
          o_ih_ready              <=  1;
          if ((o_in_command[3:0] == `COMMAND_WRITE) && (local_data_count < o_in_data_count)) begin
            ih_state              <=  WAIT_FOR_DATA;
          end
          else begin
            ih_state              <=  FLUSH_FIFO;
          end
        end
      end
      FLUSH_FIFO: begin
        o_ing_fin                 <=  1;
        if (in_fifo_has_data) begin
          o_ingress_stb           <=  1;
          in_data_count           <=  in_data_count + 1;
        end
        else begin
          o_ingress_act           <=  0;
          ih_state                <=  WAIT_FOR_START;
        end
      end
      default: begin
        ih_state                  <=  IDLE;
      end
    endcase
  end
end

integer i;

//state machine to read data from the master and send it to the out FIFO
always @ (posedge clk ) begin
  o_egress_stb                <=  0;
  o_oh_ready                  <=  0;
  if (rst) begin
    //Output handler
    oh_state                  <=  IDLE;

    //Output FIFO
    out_fifo_count            <=  0;
    o_egress_act              <=  0;
    o_egress_data             <=  0;
    out_packet_count          <=  0;
    oh_status                 <=  0;
    out_packet_pos            <=  0;
    out_data_count            <=  0;
    out_data_pos              <=  0;
    o_egr_fin                 <=  0;
  end
  else begin

    //Get an Output FIFO
    if ((i_egress_rdy > 0) && (o_egress_act == 0)) begin
      out_fifo_count          <=  0;
      if (i_egress_rdy[0]) begin
        o_egress_act[0]          <=  1;
      end
      else begin
        o_egress_act[1]          <=  1;
      end
    end

    case (oh_state)
      IDLE: begin
        //Wait for status
        //It is strange to have this fall through state right now but later I might find a reason to NOT
        //  Leave this state
        o_egr_fin                 <=  0;
        if (i_egr_en) begin
          oh_state                <= WAIT_FOR_STATUS;
        end
      end
      WAIT_FOR_STATUS: begin
        if (o_egress_act > 0) begin
          o_oh_ready              <=  1;
          if (i_oh_en) begin
            out_data_count        <=  i_out_data_count[23:0] + 1;
            out_data_pos          <=  1;  //Account for the first piece of data sent out with the first packet
            out_packet_pos        <=  0;
            o_oh_ready            <=  0;
            if ( (i_out_status[3:0] == `READ_RESP)        ||
                 (i_out_status[3:0] == `PERIPH_INTERRUPT)) begin
              $display ("Standard Response!");
              out_packet_count    <=  `STANDARD_RESPONSE;
              oh_state            <=  WRITE_TO_FIFO;
            end
            else begin
              $display ("No Response");
              out_packet_count    <=  0;
              //oh_state            <=  IDLE;
            end
          end
        end
        if (i_egress_size == 0) begin
          o_oh_ready              <=  0;
          o_egress_act            <=  0;
        end
      end
      WRITE_TO_FIFO: begin
        if ((o_egress_act > 0) && (out_fifo_count < i_egress_size)) begin
          if (out_packet_pos < out_packet_count) begin
            o_egress_data         <= out_packet[out_packet_pos];
            out_packet_pos        <= out_packet_pos + 1;
            out_fifo_count        <= out_fifo_count + 1;
            o_egress_stb          <= 1;
          end
          else begin
            //were done sending the initial packet, check to see if there is more data to send
            //release this FIFO because the output FIFO is starving
            if (out_data_pos < out_data_count) begin
              oh_state            <= WRITE_DATA;
            end
            else begin
              o_egress_act        <= 0;
              oh_state            <= FINISHED;
            end
          end
        end
        else begin
          o_egress_act            <= 0;
        end
      end
      WRITE_DATA: begin
        if (o_egress_act > 0) begin
          if (out_fifo_count < i_egress_size) begin
            o_oh_ready              <=  1;
            if (i_oh_en && o_oh_ready) begin
              o_oh_ready            <=  0;
              o_egress_data         <=  i_out_data;
              out_fifo_count        <=  out_fifo_count + 1;
              o_egress_stb          <=  1;
              out_data_pos          <=  out_data_pos + 1;
              if ((out_fifo_count + 1) < i_egress_size) begin
                o_oh_ready          <=  0;
              end
            end
          end
          else begin
            o_egress_act               <=  0;
          end
        end

        if (out_data_pos >= out_data_count) begin
          oh_state                      <=  FINISHED;
          o_egress_act                  <=  0;
        end
      end
      FINISHED: begin
        o_egr_fin                       <=  1;
        if (!i_egr_en) begin
          o_egr_fin                     <=  0;
          oh_state                      <=  IDLE;
        end
      end
      default: begin
        //Should not have gotten here
        o_egress_act                  <=  0;
        oh_state                      <=  IDLE;
      end
    endcase
  end
end

endmodule
