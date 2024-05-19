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
 * Description: AXI Master
 *
 * Changes:
 *  10/2/2016: Initial Commit
 */

`timescale 1 ns/1 ps

`include "axi_defines.v"

`define BIT_STATUS_BUSY           0
`define BIT_STATUS_BAD_COMMAND    4
`define BIT_STATUS_BAD_TXRX_WIDTH 5
`define BIT_BUS_STATUS_RANGE      9:8


module axi_lite_master #(
  //Parameters
  parameter           INVERT_AXI_RESET        = 1,
  parameter           ADDR_WIDTH              = 32,
  parameter           INTERRUPT_WIDTH         = 32,
  parameter           DEFAULT_TIMEOUT         = 32'd100000000  //1 Second at 100MHz
)(

//************* User Facing Side *******************************************
//User Facing Interface end
//indicate to the input that we are ready
output      [31:0]                  o_cmd_status,
output  reg                         o_cmd_interrupt,

input                               i_cmd_en,
output  reg                         o_cmd_error,
output  reg                         o_cmd_ack,

//Modifier flags, these will be used to change the way address are modified when reading/writing
input       [ADDR_WIDTH - 1:0]      i_cmd_addr,
input                               i_cmd_wr_rd,        //1 = Write, 0 = Read
input       [3:0]                   i_cmd_byte_en,
input       [31:0]                  i_cmd_data,
output  reg [31:0]                  o_cmd_data,

//***************** AXI Bus ************************************************
input                               clk,
input                               rst,

//bus write addr path
output      [3:0]                   o_awid,         //Write ID
output      [ADDR_WIDTH - 1:0]      o_awaddr,       //Write Addr Path Address
output      [2:0]                   o_awsize,       //Write Addr Path Burst Size (Byte with (00 = 8 bits wide, 01 = 16 bits wide)

output  reg                         o_awvalid,      //Write Addr Path Address Valid
input                               i_awready,      //Write Addr Path Slave Ready
                                                        //  1 = Slave Ready
                                                        //  0 = Slave Not Ready

//bus write data
output      [3:0]                   o_wid,          //Write ID
output  reg [31:0]                  o_wdata,        //Write Data (this size is set with the 32 Parameter
                                                      //Valid values are: 8, 16, 32, 64, 128, 256, 512, 1024
output  reg [3:0]                   o_wstrobe,      //Write Strobe (a 1 in the write is associated with the byte to write)
output                              o_wlast,        //Write Last transfer in a write burst
output  reg                         o_wvalid,       //Data through this bus is valid
input                               i_wready,       //Slave is ready for data

//Write Response Channel
input       [3:0]                   i_bid,          //Response ID (this must match awid)
input       [1:0]                   i_bresp,        //Write Response
                                                        //  0 = OKAY
                                                        //  1 = EXOKAY
                                                        //  2 = SLVERR
                                                        //  3 = DECERR
input                               i_bvalid,       //Write Response is:
                                                        //  1 = Available
                                                        //  0 = Not Available
output  reg                         o_bready,       //WBM Ready

//bus read addr path
output       [3:0]                  o_arid,         //Read ID
output       [ADDR_WIDTH - 1:0]     o_araddr,       //Read Addr Path Address
output  reg  [7:0]                  o_arlen,        //Read Addr Path Burst Length
output       [2:0]                  o_arsize,       //Read Addr Path Burst Size (Byte with (00 = 8 bits wide, 01 = 16 bits wide)
output  reg                         o_arvalid,      //Read Addr Path Address Valid
input                               i_arready,      //Read Addr Path Slave Ready
                                                        //  1 = Slave Ready
                                                        //  0 = Slave Not Ready
//bus read data
input       [3:0]                   i_rid,          //Write ID
input       [31: 0]                 i_rdata,        //Read Data (this size is set with the 32 Parameter)
input       [1:0]                   i_rresp,        //Read Response
                                                        //  0 = OKAY
                                                        //  1 = EXOKAY
                                                        //  2 = SLVERR
                                                        //  3 = DECERR
input       [3:0]                   i_rstrobe,      //Read Strobe (a 1 in the write is associated with the byte to write)
input                               i_rlast,        //Read Last transfer in a write burst
input                               i_rvalid,       //Data through this bus is valid
output  reg                         o_rready,       //WBM is ready for data
                                                        //  1 = WBM Ready
                                                        //  0 = Slave Ready
input       [INTERRUPT_WIDTH - 1:0] i_interrupts
);

//local parameters

//States
localparam        IDLE                  = 4'h0;

localparam        WRITE_CMD             = 4'h1; //Write Command and Address to Slave
localparam        WRITE_DATA            = 4'h2; //Write Data to Slave
localparam        WRITE_RESP            = 4'h3; //Receive Response from device

localparam        READ_CMD              = 4'h4; //Send Read Command and Address to Slave
localparam        READ_DATA             = 4'h5; //Receive Read Response from Slave (including data)
localparam        READ_RESP             = 4'h6;
localparam        COMMAND_FINISHED      = 4'h7;

localparam        SEND_RESPONSE         = 4'h8;
localparam        SEND_INTERRUPT        = 5'h9;

//registes/wires
reg   [3:0]                     state = IDLE;
wire  [15:0]                    w_flags;
wire  [31:0]                    w_data_size;
reg   [ADDR_WIDTH - 1:0]        r_address;
reg   [31:0]                    r_output_data;

wire  [31:0]                    w_status;

reg   [31:0]                    r_data_count; //Techinically this should go all the way up to DATA_COUNT - 1: 0
reg   [31:0]                    r_interrupts;

wire                            w_writing_data;
reg   [1:0]                     r_bus_status;

wire                            w_rst;
reg   [INTERRUPT_WIDTH - 1:0]   r_prev_int;
reg                             r_bad_command = 0;
reg                             r_bad_txrx_width;

reg   [31:0]                    r_nack_timeout;

//Some Features are not supported at this time
assign  o_cmd_status[`BIT_STATUS_BUSY]            = (state != IDLE);
assign  o_cmd_status[3:1]                         = 0;
assign  o_cmd_status[`BIT_STATUS_BAD_COMMAND]     = r_bad_command;
assign  o_cmd_status[`BIT_STATUS_BAD_TXRX_WIDTH]  = r_bad_txrx_width;
assign  o_cmd_status[7:6]                         = 0;
assign  o_cmd_status[`BIT_BUS_STATUS_RANGE]       = r_bus_status;
assign  o_cmd_status[9:8]                         = 0;
assign  o_cmd_status[31:6]                        = 0;

assign  o_awsize                                  = `AXI_BURST_SIZE_32BIT;
assign  o_arsize                                  = `AXI_BURST_SIZE_32BIT;
//Submodules

//asynchronous logic
assign  w_rst                                     = (INVERT_AXI_RESET)    ? ~rst : rst;

assign  o_awaddr                                  = r_address;
assign  o_araddr                                  = r_address;
assign  o_wlast                                   = 1'b1;
assign  o_arid                                    = 4'h0;
assign  o_awid                                    = 4'h0;
assign  o_wid                                     = 4'h0;

//synchronous logic
always @ (posedge clk) begin
  //De-assert Strobes

  //AXI Strobes
  o_awvalid                 <= 0;
  o_bready                  <= 0;
  o_arvalid                 <= 0;

  if (w_rst) begin
    o_cmd_error             <= 0;
    r_output_data           <= 0;
    r_bad_command           <= 0;
    r_bad_txrx_width        <= 0;

    r_address               <= 0;
    r_data_count            <= 32'h0;
    r_nack_timeout          <= DEFAULT_TIMEOUT;
    r_prev_int              <= 0;

    //AXI
    //Write Address Path

    //Write Data Path

    //Read Address Path
    o_arlen                 <= 0;

    r_bus_status            <= 0;
    o_cmd_ack               <= 0;
    o_cmd_interrupt         <= 0;
    o_wstrobe               <= 0;

    o_cmd_data              <= 0;
    o_wvalid                <= 0;
    o_rready                <= 0;
    o_wdata                 <= 0;

  end
  else begin

    case (state)
      IDLE: begin
        r_bad_command         <=  0;
        r_bad_txrx_width      <=  0;
        o_rready              <=  0;
        o_wvalid              <=  0;
        r_address             <=  32'h0;
        r_data_count          <=  32'h0;
        o_wdata               <=  i_cmd_data;
        o_wstrobe             <=  i_cmd_byte_en;

        //Strobe in a command
        if (i_cmd_en) begin
          o_arlen             <=  1;
          r_bus_status        <=  0;
          //Something new from host
          r_data_count        <=  0;
          r_address           <=  i_cmd_addr;
          if (i_cmd_wr_rd) begin
            //Write Path
            state             <=  WRITE_CMD;
          end
          else begin
            //Read Path
            state             <=  READ_CMD;
          end
        end

        else if (((!r_prev_int) & i_interrupts) > 0) begin
          //Something new from interrupts
          state               <=  SEND_INTERRUPT;
          r_interrupts        <=  0;
        end
      end
      //Write Path
      WRITE_CMD: begin
        //Wait for the slave to acknowledge my request to write data to the specified address
        o_awvalid                 <=  1;
        if (i_awready && o_awvalid) begin
          o_awvalid               <=  0;
          state                   <=  WRITE_DATA;
        end
      end
      WRITE_DATA: begin
        o_wvalid                  <=  1;
        if (i_wready && o_wvalid) begin
          o_wvalid                <=  0;
          state                   <=  WRITE_RESP;
        end
      end
      WRITE_RESP: begin
        o_bready                  <=  1;
        if (i_bvalid)begin
          //Incomming ID matches the one we sent out
          r_bus_status            <=  i_bresp;
          if (r_bus_status != 0) begin
            o_cmd_error           <=  1;
          end
          state                   <=  COMMAND_FINISHED;
        end
      end
      //Read Path
      READ_CMD: begin
        o_arvalid                 <=  1;
        if (i_arready && o_arvalid) begin
          o_arvalid               <=  0;
          state                   <=  READ_DATA;
        end
      end
      READ_DATA: begin
        o_rready                  <=  1;
        if (i_rvalid && o_rready) begin
          o_rready                <=  0;
          o_cmd_data              <=  i_rdata;
          r_bus_status            <=  i_rresp;
          state                   <=  COMMAND_FINISHED;
        end
      end
      COMMAND_FINISHED: begin
        o_cmd_ack <=  1;
        if (!i_cmd_en && o_cmd_ack) begin
          state                   <=  IDLE;
        end
      end
      SEND_INTERRUPT: begin
      end
      default: begin
      end
    endcase
  end
end

endmodule
