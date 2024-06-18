// This program was cloned from: https://github.com/CospanDesign/nysa-verilog
// License: MIT License

//wb_nh_lcd.v
/*
Distributed under the MIT license.
Copyright (c) 2017 Dave McCoy (dave.mccoy@cospandesign.com)

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

`timescale 1ps / 1ps

`define DEFAULT_MEMORY_TIMEOUT  300

`define MAJOR_VERSION             1
`define MINOR_VERSION             0
`define REVISION                  0

`include "nh_lcd_defines.v"

`define CONTROL_ENABLE            0
`define CONTROL_ENABLE_INTERRUPT  1
`define CONTROL_COMMAND_MODE      2
`define CONTROL_RESET_DISPLAY     4
`define CONTROL_COMMAND_WRITE     5
`define CONTROL_COMMAND_READ      6
`define CONTROL_COMMAND_PARAMETER 7
`define CONTROL_WRITE_OVERRIDE    8
`define CONTROL_CHIP_SELECT       9
`define CONTROL_ENABLE_TEARING    10
`define CONTROL_TP_RED            12
`define CONTROL_TP_GREEN          13
`define CONTROL_TP_BLUE           14

`define MAJOR_RANGE               31:28
`define MINOR_RANGE               27:20
`define REVISION_RANGE            19:16


//status bit definition

/*
 * Rev A Notes:
 *  Pinmap
 *
 *  CS_N:       PMOD 1
 *  DATA_REG:   PMOD 2
 *  READ_N:     PMOD 3
 *  WRITE_N:    PMOD 4
 *  RESET_N:    PMOD 7
 *  TEAR_EF:    PMOD 10
 *
 *  DATA0:      PMOD 3
 *  DATA1:      PMOD 8
 *  DATA2:      PMOD 2
 *  DATA3:      PMOD 1
 *  DATA4:      PMOD 7
 *  DATA5:      PMOD 9
 *  DATA6:      PMOD 4
 *  DATA7:      PMOD 10
 */


module axi_pmod_tft #(
  parameter           ADDR_WIDTH          = 5,
  parameter           DATA_WIDTH          = 32,
  parameter           STROBE_WIDTH        = (DATA_WIDTH / 8),
  parameter           AXIS_WIDTH           = 24,
  parameter           INVERT_AXI_RESET    = 1,
  parameter           INVERT_AXIS_RESET   = 1,
  parameter           IMAGE_WIDTH         = 480,
  parameter           IMAGE_HEIGHT        = 272,
  parameter           BUFFER_SIZE         = 10
)(
  input                               clk,
  input                               rst,

  output                              o_fsync,

  output                              o_register_data_sel,
  output                              o_write_n,
  output                              o_read_n,
  output                              o_cs_n,
  output                              o_reset_n,
  input                               i_tearing_effect,

  //PMOD Data
  output                              o_pmod_out_tft_data1,
  output                              o_pmod_out_tft_data2,
  output                              o_pmod_out_tft_data3,
  output                              o_pmod_out_tft_data4,
  output                              o_pmod_out_tft_data7,
  output                              o_pmod_out_tft_data8,
  output                              o_pmod_out_tft_data9,
  output                              o_pmod_out_tft_data10,

  output                              o_pmod_tri_tft_data1,
  output                              o_pmod_tri_tft_data2,
  output                              o_pmod_tri_tft_data3,
  output                              o_pmod_tri_tft_data4,
  output                              o_pmod_tri_tft_data7,
  output                              o_pmod_tri_tft_data8,
  output                              o_pmod_tri_tft_data9,
  output                              o_pmod_tri_tft_data10,

  input                               i_pmod_in_tft_data1,
  input                               i_pmod_in_tft_data2,
  input                               i_pmod_in_tft_data3,
  input                               i_pmod_in_tft_data4,
  input                               i_pmod_in_tft_data7,
  input                               i_pmod_in_tft_data8,
  input                               i_pmod_in_tft_data9,
  input                               i_pmod_in_tft_data10,

  //AXI Lite Interface

  //Write Address Channel
  input                               i_awvalid,
  input       [ADDR_WIDTH - 1: 0]     i_awaddr,
  output                              o_awready,

  //Write Data Channel
  input                               i_wvalid,
  output                              o_wready,
  input       [STROBE_WIDTH - 1:0]    i_wstrb,
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

  //AXI Stream Input
  input                               i_axis_clk,
  input       [3:0]                   i_axis_user,
  input                               i_axis_rst,
  input       [AXIS_WIDTH - 1:0]      i_axis_data,
  output                              o_axis_ready,
  input                               i_axis_last,
  input                               i_axis_valid
);

//Local Parameters

//AXI Lite States
localparam                  REG_CONTROL        = 0;
localparam                  REG_STATUS         = 1;
localparam                  REG_COMMAND_DATA   = 2;
localparam                  REG_IMAGE_WIDTH    = 3;
localparam                  REG_IMAGE_HEIGHT   = 4;
localparam                  REG_IMAGE_SIZE     = 5;
localparam                  REG_VERSION        = 6;

//Reg/Wire

//AXI Signals
reg         [31:0]          control;
wire        [31:0]          status;

//control
wire                        w_enable;
wire                        w_enable_interrupt;
wire                        w_reset_display;
wire                        w_cmd_mode;
wire                        w_cmd_write_stb;
wire                        w_cmd_read_stb;
wire                        w_cmd_parameter;
wire                        w_write_override;
wire                        w_chip_select;
wire                        w_enable_tearing;

wire                        w_cmd_finished;
reg         [7:0]           r_cmd_data_out;
wire        [7:0]           w_cmd_data_in;

reg         [31:0]          r_image_width;
reg         [31:0]          r_image_height;
reg         [31:0]          r_image_size;

//status

wire                        wfifo_clk;
wire        [23:0]          wfifo_size;
wire        [1:0]           wfifo_ready;
wire        [1:0]           wfifo_activate;
wire                        wfifo_strobe;
wire        [AXIS_WIDTH:0]  wfifo_data;

//Simple User Interface
wire [ADDR_WIDTH - 1: 0]        w_reg_address;
wire [((ADDR_WIDTH - 1) - 2): 0]w_reg_32bit_address;
reg                         r_reg_invalid_addr;

wire                        w_reg_in_rdy;
reg                         r_reg_in_ack_stb;
wire [DATA_WIDTH - 1: 0]    w_reg_in_data;

wire                        w_reg_out_req;
reg                         r_reg_out_rdy_stb;
reg [DATA_WIDTH - 1: 0]     r_reg_out_data;

//Handle Inversion
wire                        w_axi_rst;
wire                        w_axis_rst;
wire  [31:0]                w_debug;


wire  [7:0]                 w_tft_data_out;
wire  [7:0]                 w_tft_data_in;
wire                        w_read_en;

wire                        w_tp_red;
wire                        w_tp_blue;
wire                        w_tp_green;


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
  .i_wstrb            (i_wstrb              ),
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

//Take in an AXI video stream and output the data into a PPFIFO
adapter_axi_stream_2_ppfifo_wl #(
  .DATA_WIDTH         (AXIS_WIDTH           )
) as2p (
  .rst                (w_axis_rst || ~w_enable ),

  .i_tear_effect      (i_tearing_effect     ),
  .i_fsync            (i_axis_user[0]       ),
  .i_pixel_count      (r_image_size         ),

  //AXI Stream Input
  .i_axi_clk          (i_axis_clk           ),
  .o_axi_ready        (o_axis_ready         ),
  .i_axi_data         (i_axis_data          ),
  .i_axi_last         (i_axis_last          ),
  .i_axi_valid        (i_axis_valid         ),

  //Ping Pong FIFO Write Controller
  .o_ppfifo_clk       (wfifo_clk            ),
  .i_ppfifo_rdy       (wfifo_ready          ),
  .o_ppfifo_act       (wfifo_activate       ),
  .i_ppfifo_size      (wfifo_size           ),
  .o_ppfifo_stb       (wfifo_strobe         ),
  .o_ppfifo_data      (wfifo_data           )
);

nh_lcd #(
  .BUFFER_SIZE         (BUFFER_SIZE         ),
  .DATAS_WIDTH         (AXIS_WIDTH          )
) lcd (
  .rst                 (w_axi_rst || ~w_enable ),
  .clk                 (clk                 ),

  .debug               (w_debug             ),

  .i_enable            (w_enable            ),
  .i_enable_tearing    (w_enable_tearing    ),
  .i_reset_display     (w_reset_display     ),
  .i_cmd_mode          (w_cmd_mode          ),
  .i_cmd_parameter     (w_cmd_parameter     ),
  .i_cmd_write_stb     (w_cmd_write_stb     ),
  .i_cmd_read_stb      (w_cmd_read_stb      ),
  .i_cmd_data          (r_cmd_data_out      ),
  .o_cmd_data          (w_cmd_data_in       ),
  .o_cmd_finished      (w_cmd_finished      ),
  .i_write_override    (w_write_override    ),
  .i_chip_select       (w_chip_select       ),
  .i_image_width       (r_image_width       ),
  .i_image_height      (r_image_height      ),

  .i_fifo_clk          (wfifo_clk           ),
  .i_fifo_rst          (w_axis_rst          ),
  .o_fifo_rdy          (wfifo_ready         ),
  .i_fifo_act          (wfifo_activate      ),
  .i_fifo_stb          (wfifo_strobe        ),
  .o_fifo_size         (wfifo_size          ),
  .i_fifo_data         (wfifo_data          ),


  .o_register_data_sel (o_register_data_sel ),
  .o_write_n           (o_write_n           ),
  .o_read_n            (o_read_n            ),
  //.io_data             (w_tft_data          ),
  .o_read_en           (w_read_en           ),
  .o_data              (w_tft_data_out      ),
  .i_data              (w_tft_data_in       ),
  .o_cs_n              (o_cs_n              ),
  .o_reset_n           (o_reset_n           ),
  .i_tearing_effect    (i_tearing_effect    ),

  //Test Pattern Interface
  .i_tp_red            (w_tp_red            ),
  .i_tp_blue           (w_tp_blue           ),
  .i_tp_green          (w_tp_green          )

);

//Asynchronous Logic
assign        w_enable                = control[`CONTROL_ENABLE];
assign        w_enable_interrupt      = control[`CONTROL_ENABLE_INTERRUPT];
assign        w_cmd_mode              = control[`CONTROL_COMMAND_MODE];
assign        w_reset_display         = control[`CONTROL_RESET_DISPLAY];
assign        w_cmd_write_stb         = control[`CONTROL_COMMAND_WRITE];
assign        w_cmd_read_stb          = control[`CONTROL_COMMAND_READ];
assign        w_cmd_parameter         = control[`CONTROL_COMMAND_PARAMETER];
assign        w_write_override        = control[`CONTROL_WRITE_OVERRIDE];
assign        w_chip_select           = control[`CONTROL_CHIP_SELECT];
assign        w_enable_tearing        = control[`CONTROL_ENABLE_TEARING];
assign        w_tp_red                = control[`CONTROL_TP_RED];
assign        w_tp_green              = control[`CONTROL_TP_GREEN];
assign        w_tp_blue               = control[`CONTROL_TP_BLUE];

assign        status[31:0]            = 0;

assign        w_axi_rst               = (INVERT_AXI_RESET)   ? ~rst         : rst;
assign        w_axis_rst              = (INVERT_AXIS_RESET)  ? ~i_axis_rst  : i_axis_rst;

//Attach the PMODs (All the line scrambling happens here
assign        o_pmod_out_tft_data3    = w_tft_data_out[0];
assign        o_pmod_out_tft_data8    = w_tft_data_out[1];
assign        o_pmod_out_tft_data2    = w_tft_data_out[2];
assign        o_pmod_out_tft_data1    = w_tft_data_out[3];
assign        o_pmod_out_tft_data7    = w_tft_data_out[4];
assign        o_pmod_out_tft_data9    = w_tft_data_out[5];
assign        o_pmod_out_tft_data4    = w_tft_data_out[6];
assign        o_pmod_out_tft_data10   = w_tft_data_out[7];

assign        o_pmod_tri_tft_data1    = !w_read_en;
assign        o_pmod_tri_tft_data2    = !w_read_en;
assign        o_pmod_tri_tft_data3    = !w_read_en;
assign        o_pmod_tri_tft_data4    = !w_read_en;
assign        o_pmod_tri_tft_data7    = !w_read_en;
assign        o_pmod_tri_tft_data8    = !w_read_en;
assign        o_pmod_tri_tft_data9    = !w_read_en;
assign        o_pmod_tri_tft_data10   = !w_read_en;

assign        w_tft_data_in[0]        =  i_pmod_in_tft_data3;
assign        w_tft_data_in[1]        =  i_pmod_in_tft_data8;
assign        w_tft_data_in[2]        =  i_pmod_in_tft_data2;
assign        w_tft_data_in[3]        =  i_pmod_in_tft_data1;
assign        w_tft_data_in[4]        =  i_pmod_in_tft_data7;
assign        w_tft_data_in[5]        =  i_pmod_in_tft_data9;
assign        w_tft_data_in[6]        =  i_pmod_in_tft_data4;
assign        w_tft_data_in[7]        =  i_pmod_in_tft_data10;

assign        o_fsync                 = ~i_tearing_effect;
assign        w_reg_32bit_address     = w_reg_address[(ADDR_WIDTH - 1): 2];

//blocks
always @ (posedge clk) begin
  //De-assert Strobes
  r_reg_in_ack_stb                        <=  0;
  r_reg_out_rdy_stb                       <=  0;
  r_reg_invalid_addr                      <=  0;

  if (w_axi_rst) begin
    control                               <=  0;
    r_reg_out_data                        <=  0;
    r_cmd_data_out                        <=  0;
    r_image_width                         <=  IMAGE_WIDTH;
    r_image_height                        <=  IMAGE_HEIGHT;
    r_image_size                          <=  (IMAGE_WIDTH * IMAGE_HEIGHT);
  end
  else begin

    //Reset bits that need resetting
    if (w_cmd_write_stb) begin
      control[`CONTROL_COMMAND_WRITE]     <=  0;
    end
    if (w_cmd_read_stb) begin
      control[`CONTROL_COMMAND_READ]      <=  0;
    end
    if (w_tp_red) begin
      control[`CONTROL_TP_RED]            <=  0;
    end
    if (w_tp_green) begin
      control[`CONTROL_TP_GREEN]          <=  0;
    end
    if (w_tp_blue) begin
      control[`CONTROL_TP_BLUE]           <=  0;
    end




    if (w_reg_in_rdy) begin
      //From master
      case (w_reg_32bit_address)
        REG_CONTROL: begin
          control                         <= w_reg_in_data;
        end
        REG_COMMAND_DATA: begin
          r_cmd_data_out                  <= w_reg_in_data[7:0];
        end
        REG_IMAGE_WIDTH: begin
          r_image_width                   <= w_reg_in_data;
        end
        REG_IMAGE_HEIGHT: begin
          r_image_height                  <= w_reg_in_data;
        end
        REG_IMAGE_SIZE: begin
          r_image_size                    <= w_reg_in_data;
        end
        default: begin
        end
      endcase
      if (w_reg_32bit_address > REG_VERSION) begin
        r_reg_invalid_addr                <= 1;
      end
      r_reg_in_ack_stb                    <= 1;
    end
    else if (w_reg_out_req) begin
      //To master
      case (w_reg_32bit_address)
        REG_CONTROL: begin
          r_reg_out_data                  <= control;
        end
        REG_STATUS: begin
          r_reg_out_data                  <= status;
        end
        REG_COMMAND_DATA: begin
          r_reg_out_data                  <= w_cmd_data_in;
        end
        REG_IMAGE_WIDTH: begin
          r_reg_out_data                  <= r_image_width;
        end
        REG_IMAGE_HEIGHT: begin
          r_reg_out_data                  <= r_image_height;
        end
        REG_IMAGE_SIZE: begin
          r_reg_out_data                  <= r_image_size;
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
  end
end

endmodule
