// This program was cloned from: https://github.com/CospanDesign/nysa-verilog
// License: MIT License

/*
Distributed under the MIT license.
Copyright (c) 2016 Dave McCoy (dave.mccoy@cospandesign.com)

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

`define DATA_SIZE 32

module ft245_host_interface (
  input                           clk,
  input                           rst,

  //FT245 Interface
  input                           i_ft245_clk,
  inout     [7:0]                 io_ft245_data,
  input                           i_ft245_txe_n,
  output                          o_ft245_wr_n,
  input                           i_ft245_rde_n,
  output                          o_ft245_rd_n,
  output                          o_ft245_oe_n,
  output                          o_ft245_siwu,

  //Ingress
  output                          ingress_clk,
  input       [1:0]               ingress_rdy,
  output  reg [1:0]               ingress_act,
  output  reg                     ingress_stb,
  input       [23:0]              ingress_size,
  output  reg [`DATA_SIZE - 1: 0] ingress_data,

  //Egress
  output                          egress_clk,
  input                           egress_rdy,
  output  reg                     egress_act,
  output  reg                     egress_stb,
  input       [23:0]              egress_size,
  input       [`DATA_SIZE - 1: 0] egress_data,

  output      [31:0]              ftdi_debug
);

//local parameters
localparam      BYTE_COUNT    = `DATA_SIZE / 8;

localparam      IDLE                    = 0;
localparam      INGRESS_READ            = 1;
localparam      EGRESS_PREPARE          = 2;
localparam      EGRESS_SEND             = 3;
localparam      EGRESS_SEND_TEMP_DATA   = 4;
localparam      EGRESS_SEND_IMMEDIATELY = 5;

//registes/wires

reg   [3:0]state = IDLE;
reg   [23:0]                    count = 0;
reg   [7:0]                     byte_count = 0;


reg   [`DATA_SIZE - 1: 0]       r_ft245_ingress_data_dword;
reg   [`DATA_SIZE - 1: 0]       r_ft245_egress_data_dword;
reg   [7:0]                     r_ft245_egress_data = 8'h0;
reg   [7:0]                     r_ft245_egress_tmp_data = 8'h0;
reg                             r_ft245_read_tmp_data;

wire                            w_ft245_ingress_avail;
reg                             r_ft245_ingress_stb = 0;
reg                             r_ft245_output_enable = 0;

wire                            w_ft245_egress_avail;
reg                             r_ft245_egress_stb = 0;
reg                             r_ft245_egress_send_now = 0;


wire                            w_ingress_ready;

wire                            ft245_clk;

//submodules
//asynchronous logic
assign  ft245_clk             = i_ft245_clk;
//IBUFG ft245_clock_buf(.I(i_ft245_clk), .O(ft245_clk));
assign  ingress_clk           = ft245_clk;
assign  egress_clk            = ft245_clk;

assign  w_ft245_ingress_avail = !i_ft245_rde_n;
assign  w_ft245_egress_avail  = !i_ft245_txe_n;

assign  o_ft245_wr_n          = !r_ft245_egress_stb;
assign  o_ft245_rd_n          = !r_ft245_ingress_stb;
assign  o_ft245_oe_n          = !r_ft245_output_enable;
assign  o_ft245_siwu          = !r_ft245_egress_send_now;


assign  io_ft245_data         = r_ft245_output_enable ? 8'hZZ         : (r_ft245_read_tmp_data) ? r_ft245_egress_tmp_data: r_ft245_egress_data;


assign  w_ingress_ready       = (count < ingress_size) && !((count + 1 == ingress_size) && (byte_count == 3));

//assign  ftdi_debug            = 32'h0;

assign  ftdi_debug[3:0]       = state;
assign  ftdi_debug[5:4]       = ingress_rdy;
assign  ftdi_debug[7:6]       = ingress_act;
assign  ftdi_debug[8]         = ingress_stb;
assign  ftdi_debug[9]         = egress_rdy;
assign  ftdi_debug[10]        = egress_act;
assign  ftdi_debug[11]        = w_ingress_ready;
assign  ftdi_debug[13:12]     = ingress_data[1:0];
assign  ftdi_debug[15:14]     = egress_data[1:0];
assign  ftdi_debug[31:16]     = 16'h0;


//synchronous logic

always @ (posedge i_ft245_clk) begin
  r_ft245_egress_stb            <=  0;
  r_ft245_ingress_stb           <=  0;
  r_ft245_egress_send_now       <=  0;

  ingress_stb                   <=  0;
  egress_stb                    <=  0;

  if (rst) begin
    state                       <=  IDLE;
    count                       <=  0;
    byte_count                  <=  0;

    ingress_data                <=  0;
    r_ft245_output_enable       <=  0;
    r_ft245_egress_data         <=  0;
    r_ft245_egress_data_dword   <=  0;
    r_ft245_ingress_data_dword  <=  0;

    r_ft245_egress_tmp_data     <=  0;
    r_ft245_read_tmp_data       <=  0;

    ingress_act                 <=  0;

    egress_act                  <=  0;
  end
  else begin
    case (state)
      IDLE: begin
        count                   <=  0;
        byte_count              <=  0;
        egress_act              <=  1'b0;
        r_ft245_output_enable   <=  1'b0;
        r_ft245_read_tmp_data   <= 0;

        //If you can grab an incomming FIFO get one
        if ((ingress_rdy > 0) && (ingress_act == 2'b00)) begin
          if (ingress_rdy[0]) begin
            ingress_act[0]      <=  1;
          end
          else begin
            ingress_act[1]      <=  1;
          end
        end

        //Incomming Data and we have room for it
        if (w_ft245_ingress_avail && (ingress_act > 0)) begin
          r_ft245_output_enable   <=  1;
          state                   <=  INGRESS_READ;
        end
        //Outgoing Data
        else if (egress_rdy && !egress_act) begin    //Will the chip lock up when it wants to send and I want to send?
          egress_act              <=  1;
          state                   <=  EGRESS_PREPARE;
        end
      end
      INGRESS_READ: begin
        if (count < ingress_size) begin
          if (r_ft245_ingress_stb && w_ft245_ingress_avail) begin
            byte_count            <=  byte_count + 1;
            r_ft245_ingress_data_dword  <=  {r_ft245_ingress_data_dword[23:0], io_ft245_data};
            if (byte_count >= (BYTE_COUNT - 1)) begin
              ingress_data        <=  {r_ft245_ingress_data_dword[23:0], io_ft245_data};
              byte_count          <=  0;
              count               <=  count + 1;
              ingress_stb         <=  1;
            end
          end
          if (w_ft245_ingress_avail && !(((count + 1) == ingress_size) && (byte_count == 3))) begin
            r_ft245_ingress_stb   <=  1;
          end
        end
        else begin
          ingress_act             <=  0;
          state                   <=  IDLE;
        end

        if (!w_ft245_ingress_avail && (byte_count == 0)) begin
          ingress_act             <=  0;
          state                   <=  IDLE;
        end
      end
      EGRESS_PREPARE: begin
        r_ft245_egress_data_dword <=  egress_data;
        //count                     <=  count + 1;
        byte_count                <=  0;
        if (w_ft245_egress_avail) begin
            state                 <=  EGRESS_SEND;
            egress_stb            <=  1;
        end
      end
      EGRESS_SEND: begin
        r_ft245_read_tmp_data     <=  0;
        r_ft245_egress_data       <=  r_ft245_egress_data_dword[31:24];
        if (w_ft245_egress_avail) begin
          if (byte_count < (BYTE_COUNT - 1)) begin
            r_ft245_egress_stb        <=  1;
            r_ft245_egress_data_dword <=  {r_ft245_egress_data_dword[23:0], 8'h00};
            byte_count                <=  byte_count + 1;
          end
          else if (count < egress_size) begin
            //Last get the next piece of data
            if (count == (egress_size - 1)) begin
              egress_act              <=  0;
              state                   <=  EGRESS_SEND_IMMEDIATELY;
            end
            r_ft245_egress_data_dword <=  egress_data;
            count                     <=  count + 1;
            byte_count                <=  0;
            egress_stb                <=  1;
            r_ft245_egress_stb        <=  1;
         end
        end
        else if (!r_ft245_read_tmp_data && egress_act && r_ft245_egress_stb) begin
          r_ft245_read_tmp_data   <=  1;
          r_ft245_egress_tmp_data <=  r_ft245_egress_data;
          state                   <= EGRESS_SEND_TEMP_DATA;
        end
        if (count >= egress_size) begin
          egress_act              <=  0;
          byte_count              <=  0;
          r_ft245_egress_stb      <=  1;
          state                   <=  EGRESS_SEND_IMMEDIATELY;
        end
      end
      EGRESS_SEND_TEMP_DATA: begin
        if (w_ft245_egress_avail) begin
            r_ft245_egress_stb      <=  1;
            state                   <=  EGRESS_SEND;
        end
      end
      EGRESS_SEND_IMMEDIATELY: begin
        if (w_ft245_egress_avail) begin
          r_ft245_egress_send_now   <=  1;
        end
        state                       <=  IDLE;
      end
      default: begin
        state                       <=  IDLE;
      end
    endcase
  end
end

endmodule
