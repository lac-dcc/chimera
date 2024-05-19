// This program was cloned from: https://github.com/CospanDesign/nysa-verilog
// License: MIT License

//wishbone_master
/*
Distributed under the MIT licesnse.
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
  5/28/2016
    -Changing master to use ppfifo as interface, all commands will
      be parsed out from the master instead of the host interface
      this will remove more complexity from the host interface
      simplifying adaption to new platforms
  12/29/2015
    -Fixed very latent bug where the write command would not wait for
      the host interface to be ready before outputting a response
  10/14/2014
    -Made sure the interrupt data was getting the correct interrupt
      values from the peripheral bus
    -Added a way to resend interrupts in the case that a user transaction
      inadvertently deletes the pervious interrupt
  05/06/2013
    -Changed mg_defines to cbuilder_defines
  06/24/2012
    -added the i_ih_rst port to indicate that the input handler is resetting
    the incomming data state machine
  02/02/2012
    -changed the read state machine to use local_data_count instead of
      o_data_count
  11/12/2011
    -added support for burst read and writes
    -added support for nacks when the slave doesn't respond in time
  11/07/2011
    -added interrupt handling to the master
    -when the master is idle the interconnect will output the interrupt
      on the wbs data
  10/30/2011
    -fixed the memory bus issue where that master was not responding
      to a slave ack
    -changed the READ and WRITE command to call either the memory
      bus depending on the
    flags in the command sent from the user
  10/25/2011
    -added the interrupt input pin for both busses
  10/23/2011
    -commented out the debug message "GOT AN ACK!!", we're passed this
  10/26/2011
    -removed the stream commands, future versions will use flags instead of
      separate commands
*/

//`define MASTER_VERBOSE

`include "cbuilder_defines.v"

`define COMMAND_POS             0
`define DATA_COUNT_POS          1
`define ADDRESS_POS             2

`define HEADER_SIZE             3

`define MASTER_CFG_COUNT        2

`ifndef INTERRUPT_COUNT
`define INTERRUPT_COUNT         1
`endif

module wishbone_master #(
  parameter           INGRESS_FIFO_DEPTH    = 9, //512
  parameter           EGRESS_FIFO_DEPTH     = 9, //512
  parameter           ENABLE_WRITE_RESP     = 0, //Don't send a response when writing (Faster)
  parameter           ENABLE_NACK           = 0, //Enable timeout
  parameter           DEFAULT_TIMEOUT       = 32'd100000000  //1 Second at 100MHz
)(

  input               clk,
  input               rst,

  //indicate to the input that we are ready

  input               i_ingress_clk,
  output      [1:0]   o_ingress_rdy,
  input       [1:0]   i_ingress_act,
  input               i_ingress_stb,
  input       [31:0]  i_ingress_data,
  output      [23:0]  o_ingress_size,

  input               i_egress_clk,
  output              o_egress_rdy,
  input               i_egress_act,
  input               i_egress_stb,
  output      [31:0]  o_egress_data,
  output      [23:0]  o_egress_size,

  //General Control
  output reg          o_sync_rst,

  //wishbone peripheral bus
  output      [31:0]  o_per_adr,
  output      [31:0]  o_per_dat,
  input       [31:0]  i_per_dat,
  output              o_per_stb,
  output              o_per_cyc,
  output              o_per_we,
  output              o_per_msk,
  output      [3:0]   o_per_sel,
  input               i_per_ack,
  input               i_per_int,

  //wishbone memory bus
  output              o_mem_we,
  output      [31:0]  o_mem_adr,
  output      [31:0]  o_mem_dat,
  input       [31:0]  i_mem_dat,
  output              o_mem_stb,
  output              o_mem_cyc,
  output              o_mem_msk,
  output      [3:0]   o_mem_sel,
  input               i_mem_ack,
  input               i_mem_int

);
//debug output


//local parameters
localparam        IDLE                  = 4'h0;
localparam        READ_INGRESS_FIFO     = 4'h1;
localparam        PARSE_COMMAND         = 4'h2;
localparam        PING                  = 4'h3;
localparam        WRITE                 = 4'h4;
localparam        READ                  = 4'h5;
localparam        MASTER_CFG_WRITE      = 4'h6;
localparam        MASTER_CFG_READ       = 4'h7;
localparam        SEND_RESPONSE         = 4'h8;
localparam        SEND_INTERRUPT        = 5'h9;
localparam        FLUSH                 = 4'hA;


// registers
reg [3:0]           state             = IDLE;
reg [31:0]          local_address     = 32'h0;
reg [31:0]          local_data        = 32'h0;
reg [27:0]          local_data_count  = 28'h0;
reg                 mem_bus_select;


wire[31:0]          w_master_config[0:`MASTER_CFG_COUNT];

reg                 r_prev_int        = 0;

reg [31:0]          interrupt_mask    = 32'h00000000;

reg [31:0]          r_nack_timeout    = `DEF_NACK_TIMEOUT;
reg [31:0]          r_nack_count      = 0;

reg                 r_sync_rst = 0;

// wires
wire                w_ingress_rdy;
reg                 r_ingress_act;
wire  [23:0]        w_ingress_size;
wire  [31:0]        w_ingress_data;
reg                 r_ingress_stb;

wire  [1:0]         w_egress_rdy;
reg   [1:0]         r_egress_act;
reg                 r_egress_stb;
wire  [23:0]        w_egress_size;
reg   [31:0]        r_egress_data;


wire  [15:0]        w_command;
wire  [15:0]        w_flags;
wire  [31:0]        w_data_size;
wire  [31:0]        w_address;
reg   [31:0]        r_address;

wire  [31:0]        w_status;
reg                 r_unrec_cmd;

wire                w_mem_bus_select;
wire                w_auto_inc_addr;
wire                w_master_config_space;
wire  [31:0]        w_master_flags;


reg   [23:0]        r_ingress_count;
reg   [3:0]         r_hdr_count;
reg   [23:0]        r_egress_count;

reg   [31:0]        r_data_count;
reg   [31:0]        r_interrupts;

reg   [31:0]        r_header  [0:(`HEADER_SIZE - 1)];


reg                 r_wb_cyc;
reg                 r_wb_we;
reg   [31:0]        r_wb_adr;
reg   [31:0]        r_wb_dat;
reg                 r_wb_stb;
wire  [31:0]        w_wb_dat;
wire                w_wb_ack;

reg                 r_en_nack;

//Enable a Response from Write Transactions
reg                 r_en_wr_resp  = ENABLE_WRITE_RESP;

//Submodules
ppfifo #(
  .DATA_WIDTH       (32                   ),
  .ADDRESS_WIDTH    (INGRESS_FIFO_DEPTH   )
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
  .read_strobe     (r_ingress_stb         ),
  .read_ready      (w_ingress_rdy         ),
  .read_activate   (r_ingress_act         ),
  .read_count      (w_ingress_size        ),
  .read_data       (w_ingress_data        )
//  .inactive        (                      )
);

ppfifo #(
  .DATA_WIDTH      (32                    ),
  .ADDRESS_WIDTH   (EGRESS_FIFO_DEPTH     )
) egress (
  .reset           (rst                   ),

  //write side
  .write_clock     (clk                   ),
  .write_data      (r_egress_data         ),
  .write_ready     (w_egress_rdy          ),
  .write_activate  (r_egress_act          ),
  .write_fifo_size (w_egress_size         ),
  .write_strobe    (r_egress_stb          ),
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

//assign  r_command         = r_header[`COMMAND_POS][`COMMAND_RANGE];
//assign  r_flags           = r_header[`COMMAND_POS][`FLAG_RANGE];
//assign  r_data_size       = r_header[`DATA_COUNT_POS];
//assign  r_address         = r_header[`ADDRESS_POS];

//Asynchronous Logic
assign              o_data_count      = (state == READ) ? local_data_count : 31'h0;

assign              o_per_msk         = 0;
assign              o_per_sel         = 4'hF;

assign              o_mem_msk         = 0;
assign              o_mem_sel         = 4'hF;

assign  o_per_cyc = w_mem_bus_select  ? 1'b0          : r_wb_cyc;
assign  o_per_we  = w_mem_bus_select  ? 1'b0          : r_wb_we;
assign  o_per_stb = w_mem_bus_select  ? 1'b0          : r_wb_stb;
assign  o_per_adr = w_mem_bus_select  ? 32'h0         : (state == IDLE) ? 32'hFFFFFFFF: r_wb_adr; //When not used slect Interrupt
assign  o_per_dat = w_mem_bus_select  ? 32'b0         : r_wb_dat;

assign  o_mem_cyc = w_mem_bus_select  ? r_wb_cyc      : 1'b0;
assign  o_mem_we  = w_mem_bus_select  ? r_wb_we       : 1'b0;
assign  o_mem_stb = w_mem_bus_select  ? r_wb_stb      : 1'b0;
assign  o_mem_adr = w_mem_bus_select  ? r_wb_adr      : 32'h0;
assign  o_mem_dat = w_mem_bus_select  ? r_wb_dat      : 32'b0;

assign  w_wb_dat  = w_mem_bus_select  ? i_mem_dat     : i_per_dat;
assign  w_wb_ack  = w_mem_bus_select  ? i_mem_ack     : i_per_ack;

assign  w_master_flags[`MASTER_FLAG_UNUSED]         = 0;
assign  w_master_flags[`MASTER_FLAG_EN_WR_RESP]     = r_en_wr_resp;
assign  w_master_flags[`MASTER_FLAG_EN_NACK]        = r_en_nack;

assign  w_master_config[`MADDR_CTR_FLAGS]           = w_master_flags;
assign  w_master_config[`MADDR_NACK_TIMEOUT]        = r_nack_timeout;


assign  w_status[`STATUS_BIT_CMPLT]             = 1'h1;
/*
assign  w_status[`STATUS_BIT_PING]              = (w_command == `COMMAND_PING);
assign  w_status[`STATUS_BIT_WRITE]             = (w_command == `COMMAND_WRITE);
assign  w_status[`STATUS_BIT_READ]              = (w_command == `COMMAND_READ);
assign  w_status[`STATUS_BIT_RESET]             = (w_command == `COMMAND_RESET);
assign  w_status[`STATUS_BIT_MSTR_CFG_WR]       = (w_command == `COMMAND_MASTER_CFG_WRITE);
assign  w_status[`STATUS_BIT_MSTR_CFG_RD]       = (w_command == `COMMAND_MASTER_CFG_READ);
*/
assign  w_status[`STATUS_BIT_PING]              = (w_command == `COMMAND_PING);
assign  w_status[`STATUS_BIT_WRITE]             = (w_command == `COMMAND_WRITE & !w_master_config_space);
assign  w_status[`STATUS_BIT_READ]              = (w_command == `COMMAND_READ  & !w_master_config_space);
assign  w_status[`STATUS_BIT_RESET]             = (w_command == `COMMAND_RESET);
assign  w_status[`STATUS_BIT_MSTR_CFG_WR]       = (w_command == `COMMAND_WRITE &  w_master_config_space);
assign  w_status[`STATUS_BIT_MSTR_CFG_RD]       = (w_command == `COMMAND_READ  &  w_master_config_space);

assign  w_status[`STATUS_BIT_UNREC_CMD]         = r_unrec_cmd;
assign  w_status[`STATUS_BIT_UNUSED]            = 0;


assign  w_command         = r_header[`COMMAND_POS][`COMMAND_RANGE];
assign  w_flags           = r_header[`COMMAND_POS][`FLAG_RANGE];
assign  w_data_size       = r_header[`DATA_COUNT_POS];
assign  w_address         = r_header[`ADDRESS_POS];


assign  w_mem_bus_select      =  ((w_flags & `FLAG_MEM_BUS            ) >  0);
assign  w_auto_inc_addr       = !((w_flags | `FLAG_DISABLE_AUTO_INC   ) == 0);
assign  w_master_config_space =  ((w_flags & `FLAG_MASTER_ADDR_SPACE  ) >  0);

//Asynchronous Logic
assign              o_data_count      = (state == READ) ? local_data_count : 31'h0;

assign              o_per_msk         = 0;
assign              o_per_sel         = 4'hF;

assign              o_mem_msk         = 0;
assign              o_mem_sel         = 4'hF;

assign  o_per_cyc = w_mem_bus_select  ? 1'b0          : r_wb_cyc;
assign  o_per_we  = w_mem_bus_select  ? 1'b0          : r_wb_we;
assign  o_per_stb = w_mem_bus_select  ? 1'b0          : r_wb_stb;
assign  o_per_adr = w_mem_bus_select  ? 32'h0         : (state == IDLE) ? 32'hFFFFFFFF: r_wb_adr; //When not used slect Interrupt
assign  o_per_dat = w_mem_bus_select  ? 32'b0         : r_wb_dat;

assign  o_mem_cyc = w_mem_bus_select  ? r_wb_cyc      : 1'b0;
assign  o_mem_we  = w_mem_bus_select  ? r_wb_we       : 1'b0;
assign  o_mem_stb = w_mem_bus_select  ? r_wb_stb      : 1'b0;
assign  o_mem_adr = w_mem_bus_select  ? r_wb_adr      : 32'h0;
assign  o_mem_dat = w_mem_bus_select  ? r_wb_dat      : 32'b0;

assign  w_wb_dat  = w_mem_bus_select  ? i_mem_dat     : i_per_dat;
assign  w_wb_ack  = w_mem_bus_select  ? i_mem_ack     : i_per_ack;


integer i;
//Synchronous Logic
always @ (posedge clk) begin
  //De-assert Strobes
  r_ingress_stb       <= 0;
  r_egress_stb        <= 0;
  o_sync_rst          <= 0;

  if (rst) begin
    r_address         <= 32'h0;
    r_ingress_count   <= 24'h0;
    r_hdr_count       <= 4'h0;
    r_data_count      <= 32'h0;

    r_ingress_act     <= 1'b0;
    r_egress_act      <= 2'b0;
    r_egress_data     <= 32'h0;

    r_en_wr_resp      <= ENABLE_WRITE_RESP;
    r_en_nack         <= ENABLE_NACK;
    r_nack_timeout    <= DEFAULT_TIMEOUT;

    //r_sts_complte     <= 0;
    r_unrec_cmd       <= 0;
    r_prev_int        <= 0;

    for (i = 0; i < `HEADER_SIZE; i = i + 1)
      r_header[i]             <=  0;
    //w_command                 <=  16'h0;
    //w_flags                   <=  16'h0;
    //w_data_size               <=  32'h0;
    r_address                 <=  32'h0;

    //Wishbone Bus
    r_wb_we                   <= 1'b0;
    r_wb_cyc                  <= 1'b0;
    r_wb_adr                  <= 32'h0;
    r_wb_dat                  <= 32'h0;
    r_wb_stb                  <= 1'b0;
    r_interrupts              <= 32'h0;
  end
  else begin

    //Always get a free FIFO
    if (w_ingress_rdy && !r_ingress_act) begin
      r_ingress_count         <=  24'h0;
      r_ingress_act           <=  1'h1;
    end

    if ((w_egress_rdy > 0) && r_egress_act == 0) begin
      r_egress_count          <=  24'h0;
      if (w_egress_rdy[0])
        r_egress_act[0]       <=  1'h1;
      else
        r_egress_act[1]       <=  1'h1;
    end
    case (state)
      IDLE: begin
        r_wb_we               <= 1'b0;
        r_wb_cyc              <= 1'b0;
        r_wb_adr              <= 32'h0;
        r_wb_dat              <= 32'h0;
        r_wb_stb              <= 1'b0;

        r_address             <=  32'h0;
        r_ingress_count       <=  24'h0;
        r_egress_count        <=  24'h0;
        r_data_count          <=  32'h0;
        r_hdr_count           <=  4'h0;

        //r_sts_complte         <=  0;
        r_unrec_cmd           <=  0;

        if (r_ingress_act) begin
          state               <=  READ_INGRESS_FIFO;
        end
        else if (!r_prev_int && i_per_int) begin
            state             <=  SEND_INTERRUPT;
            r_interrupts      <=  w_wb_dat;
        end
      end
      READ_INGRESS_FIFO: begin
        r_ingress_stb         <=  1;
        r_ingress_count       <=  r_ingress_count + 1;
        r_header[r_hdr_count] <=  w_ingress_data;

        state                 <=  PARSE_COMMAND;
      end
      PARSE_COMMAND: begin
        if (r_ingress_act) begin
          if (r_ingress_count < `HEADER_SIZE) begin
            r_ingress_count       <=  r_ingress_count + 1;
            r_ingress_stb         <=  1;
          end
          else if (r_ingress_count >= w_ingress_size) begin
            r_ingress_act         <=  0;
          end
        end
        if (r_hdr_count < `HEADER_SIZE) begin
          if (r_ingress_stb) begin
            r_hdr_count           <=  r_hdr_count + 1;
            r_header[r_hdr_count] <=  w_ingress_data;
          end
        end
        else begin
        //if (r_hdr_count >= `HEADER_SIZE) begin
          r_address               <=  w_address;
          case (w_command)
            `COMMAND_PING: begin
              state               <=  SEND_RESPONSE;
            end
            `COMMAND_WRITE: begin
              r_wb_cyc            <=  1;
              r_wb_we             <=  1;
              r_wb_adr            <=  w_address;
              if (w_master_config_space) begin
                state             <=  MASTER_CFG_WRITE;
              end
              else begin
                state             <=  WRITE;
              end
            end
            `COMMAND_READ: begin
              r_wb_cyc            <=  1;
              r_wb_we             <=  0;
              r_wb_adr            <=  w_address;
              if (w_master_config_space) begin
                state             <=  MASTER_CFG_READ;
              end
              else begin
                state             <=  READ;
              end
            end
            `COMMAND_RESET: begin
              o_sync_rst          <=  1;
              state               <=  FLUSH;
            end
            default: begin
              r_unrec_cmd         <=  1;
              state               <=  SEND_RESPONSE;
            end
          endcase
        end
      end
      WRITE: begin
        if (w_wb_ack && r_wb_stb) begin
          r_wb_stb                    <=  0;
          if (w_auto_inc_addr) begin
            r_wb_adr                  <=  r_wb_adr + 1;
          end

        end
        else if (!r_wb_stb && !w_wb_ack) begin
          if (r_data_count < w_data_size) begin
            if (r_ingress_act && (r_ingress_count < w_ingress_size))begin
              r_wb_dat                <=  w_ingress_data;
              r_wb_stb                <=  1;
              r_ingress_stb           <=  1;
              r_data_count            <=  r_data_count + 1;
              r_ingress_count         <=  r_ingress_count + 1;
            end
            if (r_ingress_act && (r_ingress_count >= w_ingress_size)) begin
              r_ingress_act           <=  0;
            end
          end
          else begin
            r_wb_cyc                  <=  0;
            r_wb_we                   <=  0;
            //Send Response
            if (r_en_wr_resp) begin
              state                   <=  SEND_RESPONSE;
            end
            else begin
              state                   <=  FLUSH;
            end
          end
        end
      end
      READ: begin
        if (w_wb_ack && r_wb_stb) begin
          r_wb_stb                    <=  0;
          r_egress_data               <=  w_wb_dat;
          r_egress_stb                <=  1;
          r_egress_count              <=  r_egress_count + 1;
          r_data_count                <=  r_data_count + 1;
          if (w_auto_inc_addr) begin
            r_wb_adr                  <=  r_wb_adr + 1;
          end
        end
        else if (!r_wb_stb && !w_wb_ack) begin
          if (r_data_count < w_data_size) begin
            if (r_egress_act) begin
              if (r_egress_count < w_egress_size) begin
                //We are ready for data
                r_wb_stb                <=  1;
              end
              else begin
                r_egress_act            <=  0;
              end
            end
          end
          else begin
            r_egress_act                <=  0;
            r_wb_cyc                    <=  0;
            r_wb_we                     <=  0;
            state                       <=  IDLE;
          end
        end
      end
      MASTER_CFG_WRITE: begin
        if (r_ingress_act) begin
          if (r_ingress_count < w_ingress_size) begin
            r_data_count                <=  r_data_count + 1;
            r_ingress_count             <=  r_ingress_count + 1;
            r_ingress_stb               <=  1;
            if (r_data_count < w_data_size) begin
              case (r_address)
                `MADDR_CTR_FLAGS: begin
                  r_en_nack             <=  w_ingress_data[`MASTER_FLAG_EN_NACK];
                  r_en_wr_resp          <=  w_ingress_data[`MASTER_FLAG_EN_WR_RESP];
                end
                `MADDR_NACK_TIMEOUT: begin
                  r_nack_timeout        <=  w_ingress_data;
                end
                default: begin
                end
              endcase
              r_address                 <=  r_address + 1;
            end
          end
          else begin
            r_ingress_act               <=  0;
          end
        end
        if (r_data_count >= w_data_size) begin
          state                         <= SEND_RESPONSE;
        end
      end
      MASTER_CFG_READ: begin
        if (r_egress_act > 0) begin
          if (r_egress_count == 0) begin
            r_egress_data         <=  w_status;
            r_egress_count        <=  r_egress_count + 1;
          end
          else if (r_data_count < w_data_size) begin
            if (r_address < `MASTER_CFG_COUNT) begin
              r_egress_data         <=  w_master_config[r_address];
              r_egress_stb          <=  1;
            end
            else begin
              r_egress_data         <=  32'h0;
            end
            r_address               <=  r_address + 1;
            r_data_count            <=  r_data_count + 1;
          end
          else begin
            r_egress_act            <=  0;
            state                   <=  FLUSH;
          end
        end
      end
      SEND_RESPONSE: begin
        r_prev_int                  <=  0;  //Repeat interrupt after all communication to make sure host sees it is picked up
        if (r_egress_act > 0) begin
          if (r_egress_count == 0) begin
            r_egress_data         <=  w_status;
            r_egress_count        <=  r_egress_count + 1;
          end
          else begin
            state                 <=  FLUSH;
          end
        end
      end
      SEND_INTERRUPT: begin
        r_prev_int                <=  1;
        if (r_egress_act > 0) begin
          if (r_egress_count < `INTERRUPT_COUNT) begin
            r_egress_data         <=  r_interrupts;
            r_egress_count        <=  r_egress_count + 1;
            r_egress_stb          <=  1;
          end
          else begin
            r_egress_act          <=  0;
            state                 <=  IDLE;
          end
        end
      end
      FLUSH: begin
        //if (r_ingress_act && (r_ingress_count > 0) && (r_ingress_count < w_ingress_size)) begin
        //  r_ingress_count         <=  r_ingress_count + 1;
        //  r_ingress_stb           <=  1;
        //end
        //else begin
          if (r_ingress_act && (r_ingress_count > 0)) begin
            r_ingress_act         <=  0;
          end
          state                   <=  IDLE;
        //end
      end
      default: begin
      end
    endcase
  end
end

endmodule
