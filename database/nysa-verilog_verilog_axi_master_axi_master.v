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


`define CLOG2(x) \
   (x <= 2)     ? 1 :  \
   (x <= 4)     ? 2 :  \
   (x <= 8)     ? 3 :  \
   (x <= 16)    ? 4 :  \
   (x <= 32)    ? 5 :  \
   (x <= 64)    ? 6 :  \
   (x <= 128)   ? 7 :  \
   (x <= 256)   ? 8 :  \
   (x <= 512)   ? 9 :  \
   (x <= 1024)  ? 10 : \
   (x <= 2048)  ? 11 : \
   (x <= 4096)  ? 12 : \
   -1


module axi_master #(
  //Parameters
  parameter           INVERT_AXI_RESET        = 1,
  parameter           MAX_PACKET_SIZE         = 4096,
  parameter           MAX_PACKET_WIDTH        = `CLOG2(MAX_PACKET_SIZE),
  parameter           DATA_WIDTH              = 32,
  parameter           FIFO_DEPTH              = 8,  //256 (This works well with Xilinx tools)
  parameter           ADDR_WIDTH              = 32,
  parameter           INTERRUPT_WIDTH         = 32,
  parameter           ENABLE_NACK             = 0, //Enable timeout
  parameter           DEFAULT_TIMEOUT         = 32'd100000000  //1 Second at 100MHz
//  parameter           USE_IDS               = 0;

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
input                               i_cmd_adr_fixed_en,
input                               i_cmd_adr_wrap_en,

input       [ADDR_WIDTH - 1:0]      i_cmd_addr,
input                               i_cmd_wr_rd,        //1 = Write, 0 = Read
input       [MAX_PACKET_WIDTH - 1: 0]i_cmd_data_count,


//Data FIFOs
input                               i_ingress_clk,
output      [1:0]                   o_ingress_rdy,
input       [1:0]                   i_ingress_act,
input                               i_ingress_stb,
input       [DATA_WIDTH - 1:0]      i_ingress_data,
output      [23:0]                  o_ingress_size,

input                               i_egress_clk,
output                              o_egress_rdy,
input                               i_egress_act,
input                               i_egress_stb,
output      [DATA_WIDTH - 1:0]      o_egress_data,
output      [23:0]                  o_egress_size,


  //NOT IMPLEMENTED YET
/*
  input       [2:0]                   i_cmd_txrx_width, //0 = 8-bit, 1 = 16-bit, 16-bit, 2 = 32-bit...
  input       [3:0]                   i_cmd_aw_id,  //Add an ide to the write/command paths
  input       [3:0]                   i_cmd_w_id,
  input       [3:0]                   i_cmd_ar_id,
  output  reg [3:0]                   o_cmd_r_id,
  output  reg [3:0]                   o_cmd_b_id,
*/


//***************** AXI Bus ************************************************
input                               clk,
input                               rst,

//bus write addr path
output  reg [3:0]                   o_awid,         //Write ID
output      [ADDR_WIDTH - 1:0]      o_awaddr,       //Write Addr Path Address
output  reg [7:0]                   o_awlen,        //Write Addr Path Burst Length
output      [2:0]                   o_awsize,       //Write Addr Path Burst Size (Byte with (00 = 8 bits wide, 01 = 16 bits wide)
output      [1:0]                   o_awburst,      //Write Addr Path Burst Type
                                                        //  0 = Fixed
                                                        //  1 = Incrementing
                                                        //  2 = wrap
output      [1:0]                   o_awlock,       //Write Addr Path Lock (atomic) information
                                                        //  0 = Normal
                                                        //  1 = Exclusive
                                                        //  2 = Locked
output      [3:0]                   o_awcache,      //Write Addr Path Cache Type
output      [2:0]                   o_awprot,       //Write Addr Path Protection Type
output  reg                         o_awvalid,      //Write Addr Path Address Valid
input                               i_awready,      //Write Addr Path Slave Ready
                                                        //  1 = Slave Ready
                                                        //  0 = Slave Not Ready

//bus write data
output  reg [3:0]                   o_wid,          //Write ID
//output  reg [DATA_WIDTH - 1: 0]     o_wdata,        //Write Data (this size is set with the DATA_WIDTH Parameter
output      [DATA_WIDTH - 1: 0]     o_wdata,        //Write Data (this size is set with the DATA_WIDTH Parameter
                                                      //Valid values are: 8, 16, 32, 64, 128, 256, 512, 1024
output  reg [DATA_WIDTH >> 3:0]     o_wstrobe,      //Write Strobe (a 1 in the write is associated with the byte to write)
//output  reg                         o_wlast,        //Write Last transfer in a write burst
output                              o_wlast,        //Write Last transfer in a write burst
//output  reg                         o_wvalid,       //Data through this bus is valid
output                              o_wvalid,       //Data through this bus is valid
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
output  reg  [3:0]                  o_arid,         //Read ID
output       [ADDR_WIDTH - 1:0]     o_araddr,       //Read Addr Path Address
output  reg  [7:0]                  o_arlen,        //Read Addr Path Burst Length
output  reg  [2:0]                  o_arsize,       //Read Addr Path Burst Size (Byte with (00 = 8 bits wide, 01 = 16 bits wide)
output       [1:0]                  o_arburst,      //Read Addr Path Burst Type
output       [1:0]                  o_arlock,       //Read Addr Path Lock (atomic) information
output       [3:0]                  o_arcache,      //Read Addr Path Cache Type
output       [2:0]                  o_arprot,       //Read Addr Path Protection Type
output  reg                         o_arvalid,      //Read Addr Path Address Valid
input                               i_arready,      //Read Addr Path Slave Ready
                                                        //  1 = Slave Ready
                                                        //  0 = Slave Not Ready
//bus read data
input       [3:0]                   i_rid,          //Write ID
input       [DATA_WIDTH - 1: 0]     i_rdata,        //Read Data (this size is set with the DATA_WIDTH Parameter
                                                    //Valid values are: 8, 16, 32, 64, 128, 256, 512, 1024
input       [1:0]                   i_rresp,        //Read Response
                                                        //  0 = OKAY
                                                        //  1 = EXOKAY
                                                        //  2 = SLVERR
                                                        //  3 = DECERR
input       [DATA_WIDTH >> 3:0]     i_rstrobe,      //Read Strobe (a 1 in the write is associated with the byte to write)
input                               i_rlast,        //Read Last transfer in a write burst
input                               i_rvalid,       //Data through this bus is valid
//output  reg                         o_rready,       //WBM is ready for data
output                              o_rready,       //WBM is ready for data
                                                        //  1 = WBM Ready
                                                        //  0 = Slave Ready

input     [INTERRUPT_WIDTH - 1:0]   i_interrupts
);

//local parameters
localparam        DATA_WORD_SIZE        = (DATA_WIDTH / 8);
localparam        DATA_WORD_ALL_EN      = ((1 << DATA_WORD_SIZE) - 1);

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

wire  [31:0]                    w_status;

reg   [31:0]                    r_data_count; //Techinically this should go all the way up to DATA_COUNT - 1: 0
reg   [31:0]                    r_interrupts;

wire                            w_writing_data;
reg   [1:0]                     r_bus_status;


wire                            w_rst;
reg   [INTERRUPT_WIDTH - 1:0]   r_prev_int;
reg                             r_bad_command = 0;
reg                             r_bad_txrx_width;

reg   [32:0]                    r_nack_timeout;

reg   [23:0]                    r_ingress_count;
reg   [23:0]                    r_egress_count;

wire                            w_ingress_rdy;
reg                             r_ingress_act;
wire  [23:0]                    w_ingress_size;
wire  [DATA_WIDTH - 1:0]        w_ingress_data;
//reg                             r_ingress_stb;
wire                            w_ingress_stb;

wire  [1:0]                     w_egress_rdy;
reg   [1:0]                     r_egress_act;
//reg                             r_egress_stb;
wire                            w_egress_stb;
wire  [23:0]                    w_egress_size;
wire  [DATA_WIDTH - 1:0]        w_egress_data;


//Some Features are not supported at this time

assign  o_awlock            = 0;
assign  o_awprot            = {`AXI_PROT_DATA, `AXI_PROT_SECURE, `AXI_PROT_NORMAL};
assign  o_arprot            = {`AXI_PROT_DATA, `AXI_PROT_SECURE, `AXI_PROT_NORMAL};
assign  o_arlock            = 0;
assign  o_awcache           = {`AXI_CACHE_NON_WA, `AXI_CACHE_NON_RA, `AXI_CACHE_CACHE, `AXI_CACHE_BUF};
assign  o_arcache           = {`AXI_CACHE_NON_WA, `AXI_CACHE_NON_RA, `AXI_CACHE_CACHE, `AXI_CACHE_BUF};

assign  o_cmd_status[`BIT_STATUS_BUSY]            = (state != IDLE);
assign  o_cmd_status[3:1]                         = 0;
assign  o_cmd_status[`BIT_STATUS_BAD_COMMAND]     = r_bad_command;
assign  o_cmd_status[`BIT_STATUS_BAD_TXRX_WIDTH]  = r_bad_txrx_width;
assign  o_cmd_status[7:6]                         = 0;
assign  o_cmd_status[`BIT_BUS_STATUS_RANGE]       = r_bus_status;
assign  o_cmd_status[9:8]                         = 0;
assign  o_cmd_status[31:6]                        = 0;

assign  o_awsize      = (DATA_WIDTH == 8    ) ? `AXI_BURST_SIZE_8BIT    :
                        (DATA_WIDTH == 16   ) ? `AXI_BURST_SIZE_16BIT   :
                        (DATA_WIDTH == 32   ) ? `AXI_BURST_SIZE_32BIT   :
                        (DATA_WIDTH == 64   ) ? `AXI_BURST_SIZE_64BIT   :
                        (DATA_WIDTH == 128  ) ? `AXI_BURST_SIZE_128BIT  :
                        (DATA_WIDTH == 256  ) ? `AXI_BURST_SIZE_256BIT  :
                        (DATA_WIDTH == 512  ) ? `AXI_BURST_SIZE_512BIT  :
                        (DATA_WIDTH == 1024 ) ? `AXI_BURST_SIZE_1024BIT :
                        3'bxxx; //Shouldn't get here


assign o_wvalid       = ((state == WRITE_DATA) && r_ingress_act && (r_ingress_count < w_ingress_size));
assign o_rready       = ((state == READ_DATA)  && r_egress_act && (r_data_count < i_cmd_data_count));
assign w_ingress_stb  = (o_wvalid & i_wready);
//Submodules
ppfifo #(
  .DATA_WIDTH       (DATA_WIDTH           ),
  .ADDRESS_WIDTH    (FIFO_DEPTH           )
) ingress (
  .reset            (rst                  ),

  //write side
  .write_clock     (i_ingress_clk         ),
  .write_data      (i_ingress_data        ),
  .write_ready     (o_ingress_rdy         ),
  .write_activate  (i_ingress_act         ),
  .write_fifo_size (o_ingress_size        ),
  .write_strobe    (i_ingress_stb         ),
//  .starved         (                      ),

  //read side
  .read_clock      (clk                   ),
  //.read_strobe     (r_ingress_stb         ),
  .read_strobe     (w_ingress_stb         ),
  .read_ready      (w_ingress_rdy         ),
  .read_activate   (r_ingress_act         ),
  .read_count      (w_ingress_size        ),
  .read_data       (w_ingress_data        )
//  .inactive        (                      )
);

ppfifo #(
  .DATA_WIDTH       (DATA_WIDTH           ),
  .ADDRESS_WIDTH    (FIFO_DEPTH           )
) egress (
  .reset           (rst                   ),

  //write side
  .write_clock     (clk                   ),
  .write_data      (w_egress_data         ),
  .write_ready     (w_egress_rdy          ),
  .write_activate  (r_egress_act          ),
  .write_fifo_size (w_egress_size         ),
//  .write_strobe    (r_egress_stb          ),
  .write_strobe    (w_egress_stb          ),
//  .starved         (  ),

  //read side
  .read_clock      (i_egress_clk          ),
  .read_strobe     (i_egress_stb          ),
  .read_ready      (o_egress_rdy          ),
  .read_activate   (i_egress_act          ),
  .read_count      (o_egress_size         ),
  .read_data       (o_egress_data         )
//  .inactive        (                      )
);



//asynchronous logic
assign  o_wdata           = w_ingress_data;
assign  w_rst             = (INVERT_AXI_RESET)    ? ~rst : rst;
assign  o_awburst         = (i_cmd_adr_fixed_en)  ? `AXI_BURST_FIXED :
                            (i_cmd_adr_wrap_en)   ? `AXI_BURST_WRAP  :
                            `AXI_BURST_INCR;

assign  o_arburst         = (i_cmd_adr_fixed_en)  ? `AXI_BURST_FIXED :
                            (i_cmd_adr_wrap_en)   ? `AXI_BURST_WRAP  :
                            `AXI_BURST_INCR;

assign  o_awaddr          = r_address;
assign  o_araddr          = r_address;
assign  o_wlast           = ((state == WRITE_DATA) && r_data_count == o_awlen);
assign  w_egress_stb      = (i_rvalid & o_rready);
assign  w_egress_data     = i_rdata;

//synchronous logic
always @ (posedge clk) begin
  //De-assert Strobes

  //AXI Strobes
  o_awvalid                 <= 0;

  //o_wvalid                  <= 0;
  //o_wlast                   <= 0;
  o_bready                  <= 0;
  o_arvalid                 <= 0;
//  o_rready                  <= 0;

//  r_ingress_stb             <=  0;
//  r_egress_stb              <=  0;

  if (w_rst) begin
    o_cmd_error             <= 0;
    r_bad_command           <= 0;
    r_bad_txrx_width        <= 0;

    r_address               <= 0;
    r_data_count            <= 32'h0;
    r_nack_timeout          <= DEFAULT_TIMEOUT;
    r_prev_int              <= 0;

    //AXI
    //Write Address Path
    o_awid                  <= 0;
    o_awlen                 <= 0;

    //Write Data Path
    o_wid                   <= 0;
//    o_wdata                 <= 0;


    r_ingress_count         <= 24'h0;
    r_ingress_act           <= 1'b0;

    //Read Address Path
    o_arid                  <= 0;
    o_arlen                 <= 0;
    o_arsize                <= 0;

    r_bus_status            <= 0;
    o_cmd_ack               <= 0;
    o_cmd_interrupt         <= 0;
    o_wstrobe               <= 0;

    r_egress_act            <= 2'b0;
    r_egress_count          <= 0;

  end
  else begin

    //Grab a data FIFO if available
    if (w_ingress_rdy && !r_ingress_act) begin
      r_ingress_act           <=  1'h1;
      r_ingress_count            <=  0;
    end

    //Always get a free FIFO
    if ((w_egress_rdy > 0) && r_egress_act == 0) begin
      r_egress_count          <=  0;
      if (w_egress_rdy[0])
        r_egress_act[0]       <=  1'h1;
      else
        r_egress_act[1]       <=  1'h1;
    end

    case (state)
      IDLE: begin
        r_bad_command         <=  0;
        r_bad_txrx_width      <=  0;
        r_address             <=  32'h0;
        r_data_count          <=  32'h0;

        //Strobe in a command
//XXX: Start Here
        if (i_cmd_en) begin
          o_awlen             <=  i_cmd_data_count - 1;
          o_arlen             <=  i_cmd_data_count - 1;
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
        //o_awid                    <=  i_cmd_aw_id;
        //o_wid                     <=  i_cmd_w_id;
        o_awid                    <=  0;
        o_wid                     <=  0;

        o_awvalid                 <=  1;
        if (i_awready && o_awvalid) begin
          o_awvalid               <=  0;
          state                   <=  WRITE_DATA;
        end
      end
      WRITE_DATA: begin
//        o_wdata                   <= w_ingress_data;
        if (r_data_count < i_cmd_data_count) begin
          if (r_ingress_act) begin
            if (r_ingress_count  < w_ingress_size) begin
              o_wstrobe               <=  DATA_WORD_ALL_EN;
              if (i_wready) begin
//                r_ingress_stb         <= 1;
                r_ingress_count       <=  r_ingress_count + 1;
                r_data_count          <=  r_data_count + 1;
              end
            end
            else begin
              r_ingress_act           <=  0;
            end
          end
        end
        else begin
          r_ingress_act               <=  0;
          state                       <=  WRITE_RESP;
        end
      end
      WRITE_RESP: begin
        o_bready                  <=  1;
        if ((o_awid == i_bid) && i_bvalid)begin
          //Incomming ID matches the one we sent out
          r_bus_status            <=  i_bresp;
          if (r_bus_status != 0) begin
            o_cmd_error           <=  1;
          end
          state                   <=  IDLE;
        end
      end

      //Read Path
      READ_CMD: begin
        //o_arid                    <=  i_cmd_ar_id;
        o_arid                    <=  0;
        o_arvalid                 <=  1;
        if (i_arready && o_arvalid) begin
          o_arvalid               <=  0;
          state                   <=  READ_DATA;
        end
      end
      READ_DATA: begin
        if (i_rid == o_arid) begin
          //Need to pull data in
          //  Ready should be tied to activate
          //  Valid should be tied to strobe  (strobe = (valid & activate))
          //  Increment Address when I get a strobe
          if (r_data_count < i_cmd_data_count) begin
            if (r_egress_act > 0) begin
              if (r_egress_count < w_egress_size) begin
                if (i_rvalid && o_rready) begin
//                  r_egress_stb    <= 1;
                  r_egress_count  <= r_egress_count + 1;
                  r_data_count    <= r_data_count + 1;
                end
              end
              else begin
                r_egress_act  <=  0;
              end
            end
          end
          else begin
            r_egress_act  <=  0;
            state                 <=  COMMAND_FINISHED;
          end
        end
      end

      COMMAND_FINISHED: begin
        o_cmd_ack <=  1;
        if (!i_cmd_en) begin
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
