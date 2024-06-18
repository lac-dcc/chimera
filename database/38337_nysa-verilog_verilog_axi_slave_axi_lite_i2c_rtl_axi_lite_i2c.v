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
 * Author: Dave McCoy (dave.mccoy@cospandesign.com)
 * Description: AXI Interface for I2C
 *
 * Changes:
 *  2/10/2018: Initial Commit
 */

`timescale 1ps / 1ps

`define MAJOR_VERSION             1
`define MINOR_VERSION             0
`define REVISION                  0

`define MAJOR_RANGE               31:28
`define MINOR_RANGE               27:20
`define REVISION_RANGE            19:16

module axi_lite_i2c #(
  parameter ADDR_WIDTH          = 8,
  parameter DATA_WIDTH          = 32,
  parameter STROBE_WIDTH        = (DATA_WIDTH / 8),
  parameter INVERT_AXI_RESET    = 1,

  parameter CLOCK_RATE          = 50000000

)(
  input                               clk,
  input                               rst,

  //AXI Lite Interface

  //Write Address Channel
  input                               i_awvalid,
  input       [ADDR_WIDTH - 1: 0]     i_awaddr,
  output                              o_awready,

  //Write Data Channel
  input                               i_wvalid,
  output                              o_wready,
  input       [DATA_WIDTH - 1: 0]     i_wdata,

  //Write Response Channel
  output                              o_bvalid,
  input                               i_bready,
  output      [1:0]                   o_bresp,

  //Read Address Channel
  input                               i_arvalid,
  output                              o_arready,
  input       [ADDR_WIDTH - 1: 0]     i_araddr,

  //Read Data Channel
  output                              o_rvalid,
  input                               i_rready,
  output      [1:0]                   o_rresp,
  output      [DATA_WIDTH - 1: 0]     o_rdata,

  //I2C Signals
  /*
  inout                               io_scl,
  inout                               io_sda,
  */

  output                              o_scl_out,
  output                              o_scl_tri,
  input                               i_scl_in,

  output                              o_sda_out,
  output                              o_sda_tri,
  input                               i_sda_in,



  output                              o_interrupt

);


//local parameters
localparam CLK_DIVIDE_100KHZ        = (CLOCK_RATE/(5 * 100000) - 1);
localparam CLK_DIVIDE_400KHZ        = (CLOCK_RATE/(5 * 400000) - 1);

//Address Map
localparam    REG_CONTROL           = 0;
localparam    REG_STATUS            = 1;
localparam    REG_INTERRUPT         = 2;
localparam    REG_INTERRUPT_EN      = 3;
localparam    REG_CLOCK_RATE        = 4;
localparam    REG_CLOCK_DIVIDER     = 5;
localparam    REG_COMMAND           = 6;
localparam    REG_TRANSMIT          = 7;
localparam    REG_RECEIVE           = 8;
localparam    REG_VERSION           = 9;

localparam    INT_TRANSFER_FINISHED = 0;
localparam    INT_ARBITRATION_LOST  = 1;
localparam    INT_RXACK             = 2;


localparam    CMD_START_BIT         = 0;
localparam    CMD_STOP_BIT          = 1;
localparam    CMD_READ_BIT          = 2;
localparam    CMD_WRITE_BIT         = 3;
localparam    CMD_ACK_BIT           = 4;


localparam    CTRL_CORE_EN_BIT      = 0;
localparam    CTRL_IEN_BIT          = 1;
localparam    CTRL_400KHZ_BIT       = 2;
localparam    CTRL_100KHZ_BIT       = 3;
localparam    CTRL_RST_BIT          = 7;



//Register/Wire
reg   [15:0]                        clock_divider;
reg   [7:0]                         transmit;
wire  [7:0]                         receive;
wire  [7:0]                         status;
reg   [7:0]                         r_interrupt_enable;
reg   [7:0]                         r_interrupt;

wire                                done;

/*
wire                                o_scl_tri;
wire                                o_sda_tri;

wire                                o_scl_out;
wire                                o_sda_out;

wire                                i_scl_in;
wire                                i_sda_in;
*/


//core enable signal
reg                                 core_en;
reg                                 ien;
reg                                 set_100khz;
reg                                 set_400khz;

//Control Register bits
(* KEEP *) reg                      start;
(* KEEP *) reg                      stop;
(* KEEP *) reg                      read;
(* KEEP *) reg                      write;
reg                                 nack;
reg                                 core_reset;


//Status Register
wire                                irxack;
reg                                 rxack;      //Received acknowledge from slave
reg                                 tip;        //Tranfer in progress
wire                                i2c_busy;   //busy (start sigal detected)
wire                                i2c_al;     //arbitration lost
reg                                 al;         //arbitration lost


//Simple User Interface
wire  [ADDR_WIDTH - 1: 0]           w_reg_address;
wire  [((ADDR_WIDTH - 1) - 2): 0]   w_reg_32bit_address;
reg                                 r_reg_invalid_addr;

wire                                w_reg_in_rdy;
reg                                 r_reg_in_ack_stb;
wire  [DATA_WIDTH - 1: 0]           w_reg_in_data;

wire                                w_reg_out_req;
reg                                 r_reg_out_rdy_stb;
reg   [DATA_WIDTH - 1: 0]           r_reg_out_data;

wire                                w_axi_rst;


//Submodules
//Convert AXI Slave signals to a simple register/address strobe
axi_lite_slave #(
  .ADDR_WIDTH         (ADDR_WIDTH           ),
  .DATA_WIDTH         (DATA_WIDTH           )

) axi_lite_reg_interface (
  .clk                (clk                  ),
  .rst                (w_axi_rst            ),


  .i_awvalid          (i_awvalid            ),
  .i_awaddr           (i_awaddr             ),
  .o_awready          (o_awready            ),

  .i_wvalid           (i_wvalid             ),
  .o_wready           (o_wready             ),
  .i_wdata            (i_wdata              ),

  .o_bvalid           (o_bvalid             ),
  .i_bready           (i_bready             ),
  .o_bresp            (o_bresp              ),

  .i_arvalid          (i_arvalid            ),
  .o_arready          (o_arready            ),
  .i_araddr           (i_araddr             ),

  .o_rvalid           (o_rvalid             ),
  .i_rready           (i_rready             ),
  .o_rresp            (o_rresp              ),
  .o_rdata            (o_rdata              ),


  .o_reg_address      (w_reg_address        ),
  .i_reg_invalid_addr (r_reg_invalid_addr   ),

  .o_reg_in_rdy       (w_reg_in_rdy         ),
  .i_reg_in_ack_stb   (r_reg_in_ack_stb     ),
  .o_reg_in_data      (w_reg_in_data        ),

  .o_reg_out_req      (w_reg_out_req        ),
  .i_reg_out_rdy_stb  (r_reg_out_rdy_stb    ),
  .i_reg_out_data     (r_reg_out_data       )
);

i2c_master_byte_ctrl byte_controller (
  .clk                (clk                  ),
  .rst                (core_reset           ),
  .nReset             (~w_axi_rst           ),
  .ena                (core_en              ),
  .clk_cnt            (clock_divider        ),
  .start              (start                ),
  .stop               (stop                 ),
  .read               (read                 ),
  .write              (write                ),
  .din                (transmit             ),
  .cmd_ack            (done                 ),
  .ack_out            (irxack               ),
  .ack_in             (nack                 ),
  .dout               (receive              ),
  .i2c_busy           (i2c_busy             ),
  .i2c_al             (i2c_al               ),
  .scl_i              (i_scl_in             ),
  //.scl_i              (io_scl               ),
  .scl_o              (o_scl_out            ),
  .scl_oen            (o_scl_tri            ),
  .sda_i              (i_sda_in             ),
  //.sda_i              (io_sda               ),
  .sda_o              (o_sda_out            ),
  .sda_oen            (o_sda_tri            )
);


//Asynchronous Logic
assign        w_axi_rst               = (INVERT_AXI_RESET)   ? ~rst         : rst;
assign        w_reg_32bit_address     = w_reg_address[(ADDR_WIDTH - 1): 2];

// assign status register bits
assign status[7]                      = rxack;
assign status[6]                      = i2c_busy;
assign status[5]                      = al;
assign status[4:2]                    = 3'h0; // reserved
assign status[1]                      = tip;
assign status[0]                      = 1'b0;

//assign  io_scl                        = o_scl_tri ? 1'hZ : o_scl_out;
//assign  io_sda                        = o_sda_tri ? 1'hZ : o_sda_out;


assign o_interrupt                    = ien & ((r_interrupt & r_interrupt_enable) > 0);

//blocks
always @ (posedge clk) begin
  //De-assert Strobes
  r_reg_in_ack_stb                        <=  0;
  r_reg_out_rdy_stb                       <=  0;
  r_reg_invalid_addr                      <=  0;
  set_400khz                              <=  0;
  set_100khz                              <=  0;
  core_reset                              <=  0;

  if (w_axi_rst) begin
    r_reg_out_data                        <=  0;

    clock_divider                         <=  CLK_DIVIDE_100KHZ;
    transmit                              <=  8'h00;

    al                                    <=  0;
    rxack                                 <=  0;
    tip                                   <=  0;

    r_interrupt_enable                    <=  0;
    r_interrupt                           <=  0;

    core_en                               <=  1;
    core_reset                            <=  1;
    ien                                   <=  0;

    start                                 <=  0;
    stop                                  <=  0;
    read                                  <=  0;
    write                                 <=  0;
    nack                                  <=  0;
  end
  else begin

    //Communication with master
    if (w_reg_in_rdy && !r_reg_in_ack_stb) begin
      //From master
      case (w_reg_32bit_address)
        REG_CONTROL: begin
          core_en                         <= w_reg_in_data[CTRL_CORE_EN_BIT];
          ien                             <= w_reg_in_data[CTRL_IEN_BIT];
          set_100khz                      <= w_reg_in_data[CTRL_400KHZ_BIT];
          set_400khz                      <= w_reg_in_data[CTRL_100KHZ_BIT];
          core_reset                      <= w_reg_in_data[CTRL_RST_BIT];
        end
        REG_INTERRUPT: begin
          r_interrupt                     <= r_interrupt & (~w_reg_in_data[7:0]);
        end
        REG_INTERRUPT_EN: begin
          r_interrupt_enable              <=  w_reg_in_data;
        end
        REG_CLOCK_DIVIDER: begin
          clock_divider                   <= w_reg_in_data[7:0];
        end
        REG_COMMAND: begin
          start                           <= w_reg_in_data[CMD_START_BIT];
          stop                            <= w_reg_in_data[CMD_STOP_BIT];
          read                            <= w_reg_in_data[CMD_READ_BIT];
          write                           <= w_reg_in_data[CMD_WRITE_BIT];
          nack                            <= w_reg_in_data[CMD_ACK_BIT];
        end
        REG_TRANSMIT: begin
          transmit                        <= w_reg_in_data[7:0];
        end
        default: begin
        end
      endcase
      if (w_reg_32bit_address > REG_VERSION) begin
        r_reg_invalid_addr                <= 1;
      end
      r_reg_in_ack_stb                    <= 1;
    end
    else if (w_reg_out_req && !r_reg_out_rdy_stb) begin
      //To master
      case (w_reg_32bit_address)
        REG_CONTROL: begin
          r_reg_out_data                  <= {32'h000000};
          r_reg_out_data[CTRL_CORE_EN_BIT]<=  core_en;
          r_reg_out_data[CTRL_IEN_BIT]    <=  ien;
          r_reg_out_data[CTRL_400KHZ_BIT] <=  set_400khz;
          r_reg_out_data[CTRL_100KHZ_BIT] <=  set_100khz;
          r_reg_out_data[CTRL_RST_BIT]    <=  core_reset;
        end
        REG_STATUS: begin
          r_reg_out_data                  <= {24'h000000, status};
        end
        REG_INTERRUPT: begin
          r_reg_out_data                  <= {24'h000000, r_interrupt};
        end
        REG_INTERRUPT_EN: begin
          r_reg_out_data                  <= {24'h000000, r_interrupt_enable};
        end
        REG_CLOCK_RATE: begin
          r_reg_out_data                  <= CLOCK_RATE;
        end
        REG_CLOCK_DIVIDER: begin
          r_reg_out_data                  <= {16'h0000, clock_divider};
        end
        REG_COMMAND: begin
          //r_reg_out_data                  <= {24'h000000, control};
          r_reg_out_data                  <= {32'h00000000};
          r_reg_out_data[CMD_START_BIT]   <=  start;
          r_reg_out_data[CMD_STOP_BIT]    <=  stop;
          r_reg_out_data[CMD_READ_BIT]    <=  read;
          r_reg_out_data[CMD_WRITE_BIT]   <=  write;
          r_reg_out_data[CMD_ACK_BIT]     <=  nack;
        end
        REG_TRANSMIT: begin
          r_reg_out_data                  <= {24'h000000, transmit};
        end
        REG_RECEIVE: begin
          r_reg_out_data                  <= {24'h000000, receive};
        end
        REG_VERSION: begin
          r_reg_out_data                  <= 32'h00;
          r_reg_out_data[`MAJOR_RANGE]    <= `MAJOR_VERSION;
          r_reg_out_data[`MINOR_RANGE]    <= `MINOR_VERSION;
          r_reg_out_data[`REVISION_RANGE] <= `REVISION;
        end
        default: begin
          r_reg_out_data                  <= 32'h00;
        end
      endcase
      if (w_reg_32bit_address > REG_VERSION) begin
        r_reg_invalid_addr                <= 1;
      end
      r_reg_out_rdy_stb                   <= 1;
    end


    //Interrupts
    if (ien) begin
      if (done) begin
        r_interrupt[INT_TRANSFER_FINISHED]<=  1;
      end
      if (al) begin
        r_interrupt[INT_ARBITRATION_LOST] <=  1;
      end
      if (irxack & !rxack) begin
        r_interrupt[INT_RXACK]            <=  1;
      end
    end


    //Set Bus Speed
    if (set_100khz) begin
      clock_divider                       <= CLK_DIVIDE_100KHZ;
    end
    if (set_400khz) begin
      clock_divider                       <= CLK_DIVIDE_400KHZ;
    end

    al                                    <=  i2c_al | (al & ~start);
    rxack                                 <=  irxack;
    tip                                   <=  (read | write | stop);
    //if (i2c_busy) begin
    //  start                               <=  0;
    //end
    if (done | i2c_al) begin
      start                               <=  0;
      tip                                 <=  0;
      stop                                <=  0;
      nack                                <=  0;
      read                                <=  0;
      write                               <=  0;
    end
  end
end

endmodule
