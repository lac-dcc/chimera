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

`define MAJOR_VERSION             1
`define MINOR_VERSION             0
`define REVISION                  0

`define MAJOR_RANGE               31:28
`define MINOR_RANGE               27:20
`define REVISION_RANGE            19:16

module axi_nes #(
  parameter ADDR_WIDTH          = 8,
  parameter DATA_WIDTH          = 32,
  parameter AXIS_WIDTH          = 24,
  parameter STROBE_WIDTH        = (DATA_WIDTH / 8),
  parameter INVERT_AXI_RESET    = 1,
  parameter INVERT_AXIS_RESET   = 1,
  parameter CLOCK_RATE          = 100000000,
  parameter FPS                 = 60,
  parameter FRAME_WIDTH         = 480,
  parameter FRAME_HEIGHT        = 272,
  parameter X_OFFSET            = 112,
  parameter Y_OFFSET            = 6,
  parameter BG_COLOR            = 0
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


  //AXI Stream Output
  input                               i_axis_clk,
  input                               i_axis_rst,
  output      [3:0]                   o_axis_user,
  output      [AXIS_WIDTH - 1:0]      o_axis_data,
  input                               i_axis_ready,
  output                              o_axis_last,
  output                              o_axis_valid


);
//local parameters

//Address Map
localparam      REG_CONTROL                   =  0;
localparam      REG_STATUS                    =  1;
localparam      REG_USER_INPUT                =  2;
localparam      REG_HCI_OPCODE_COUNT          =  3;
localparam      REG_HCI_OPCODE_ADDR           =  4;
localparam      REG_HCI_OPCODE                =  5;
localparam      REG_HCI_OPCODE_DATA           =  6;
localparam      REG_HCI_READ_STB              =  7;
localparam      REG_IMAGE_WIDTH               =  8;
localparam      REG_IMAGE_HEIGHT              =  9;
localparam      REG_IMAGE_SIZE                = 10;
localparam      REG_VERSION                   = 11;


//Control
localparam      CONTROL_HCI_RESET             = 0;
localparam      CONTROL_CONSOLE_RESET         = 1;

//Status
localparam      STATUS_CLOCK_LOCKED           = 0;
localparam      STATUS_HCI_READY              = 1;
localparam      STATUS_HCI_NEW_STATUS         = 2;
localparam      STATUS_HCI_S_BOT              = 16;
localparam      STATUS_HCI_S_TOP              = STATUS_HCI_S_BOT + 15;


//Register/Wire

//AXI Signals
reg   [31:0]                        control;
wire  [31:0]                        status;

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

//NES Signals
reg                                 r_console_reset;
wire  [3:0]                         w_mute_control;
reg   [7:0]                         r_jp1_state;
reg   [7:0]                         r_jp2_state;

wire                                w_video_act;
wire                                w_sof_stb;
wire                                w_sol_stb;
wire  [2:0]                         w_red;
wire  [2:0]                         w_green;
wire  [1:0]                         w_blue;

//HCI Interface
reg                                 r_hci_reset;
reg   [7:0]                         r_hci_opcode;
reg                                 r_hci_opcode_strobe;

wire  [15:0]                        w_hci_opcode_status;
reg   [15:0]                        r_hci_opcode_status;
wire                                w_hci_opcode_ack;
reg                                 r_hci_opcode_new_status;

reg   [15:0]                        r_hci_address;
reg   [31:0]                        r_hci_count;

reg                                 r_hci_din_strobe;
wire                                w_hci_sm_ready;
reg   [7:0]                         r_hci_din;

wire                                w_hci_dout_strobe;
reg                                 r_hci_host_ready;
wire  [7:0]                         w_hci_dout;
reg   [7:0]                         r_hci_dout;

wire  [23:0]                        w_rfifo_size;
wire  [24:0]                        w_rfifo_data;
wire                                w_rfifo_act;
wire                                w_rfifo_stb;
wire                                w_rfifo_rdy;

wire  [7:0]                         w_video_red;
wire  [7:0]                         w_video_green;
wire  [7:0]                         w_video_blue;

wire                                w_audio;

wire                                w_axis_rst;


//Submodules
/*
image_to_block_fifo i2bf (
  .clk                  (clk                      ),
  .axis_clk             (i_axis_clk               ),
  .rst                  (w_axi_rst                ),
  .i_enable             (w_enable_dma             ),

  .i_video_hsync        (w_video_act              ),
  .i_sof_stb            (w_sof_stb                ),
  .i_red                (w_red                    ),
  .i_green              (w_green                  ),
  .i_blue               (w_blue                   ),

  .o_rfifo_ready        (w_rfifo_rdy              ),
  .i_rfifo_activate     (w_rfifo_activate         ),
  .i_rfifo_strobe       (w_rfifo_strobe           ),
  .o_rfifo_data         (w_rfifo_data             ),
  .o_rfifo_size         (w_rfifo_size             )
);
*/


video_to_block_fifo #(
  .BUFFER_SIZE        (AXIS_WIDTH           )
)v2bf(
  //universal input
  .clk                  (clk                  ),
  .rst                  (w_axi_rst            ),

  //.i_enable             (w_enable_dma         ),
  .i_enable             (1'b1                 ),

  //Video In
  .i_video_hsync        (w_video_act          ),
  .i_video_sof_stb      (w_sof_stb            ),
  .i_red                (w_video_red          ),
  .i_green              (w_video_green        ),
  .i_blue               (w_video_blue         ),

  //Read Path
  .i_rfifo_clk          (i_axis_clk           ),
  .i_rfifo_rst          (w_axis_rst           ),
  .o_rfifo_ready        (w_rfifo_rdy          ),
  .i_rfifo_activate     (w_rfifo_act          ),
  .i_rfifo_strobe       (w_rfifo_stb          ),
  .o_rfifo_data         (w_rfifo_data         ),
  .o_rfifo_size         (w_rfifo_size         )

);

//Take in an PPFIFO incomming video data and output an AXI Stream
adapter_ppfifo_2_axi_stream #(
  .DATA_WIDTH         (AXIS_WIDTH           )
) as2p (
  .rst                (w_axis_rst           ),

  //Incomming PPFIFO
  .i_ppfifo_rdy       (w_rfifo_rdy          ),
  .o_ppfifo_act       (w_rfifo_act          ),
  .i_ppfifo_size      (w_rfifo_size         ),
  .o_ppfifo_stb       (w_rfifo_stb          ),
  .i_ppfifo_data      (w_rfifo_data         ),

  //AXI Stream Output
  .i_axi_clk          (i_axis_clk           ),
  .i_axi_ready        (i_axis_ready         ),
  .o_axi_data         (o_axis_data          ),
  .o_axi_last         (o_axis_last          ),
  .o_axi_valid        (o_axis_valid         ),
  .o_axi_user         (o_axis_user          )
);

nes_top #(
  .CLOCK_RATE           (CLOCK_RATE         ),
  .FPS                  (FPS                ),

  //Should be at the center of the screen
  .FRAME_WIDTH          (FRAME_WIDTH        ),
  .FRAME_HEIGHT         (FRAME_HEIGHT       ),
  .X_OFFSET             (X_OFFSET           ),
  .Y_OFFSET             (Y_OFFSET           ),
  .BG_COLOR             (BG_COLOR           )
)nes (
  .clk                  (clk                 ),
  .rst                  (w_axi_rst           ),

  .i_console_reset      (r_console_reset     ),
  .i_mute_control       (w_mute_control      ),

  .i_jp1_state          (r_jp1_state         ),
  .i_jp2_state          (r_jp2_state         ),

  .o_audio              (w_audio             ),

  //Video
  .o_video_hsync        (w_video_act         ),
  .o_sof_stb            (w_sof_stb           ),
  .o_red                (w_red               ),
  .o_green              (w_green             ),
  .o_blue               (w_blue              ),

  //HCI Interface
  .i_hci_reset          (r_hci_reset         ),
  .i_hci_opcode         (r_hci_opcode        ),
  .i_hci_opcode_strobe  (r_hci_opcode_strobe ),

  .o_hci_opcode_status  (w_hci_opcode_status ),
  .o_hci_opcode_ack     (w_hci_opcode_ack    ),

  .i_hci_address        (r_hci_address       ),
  .i_hci_count          (r_hci_count         ),

  .i_hci_data_strobe    (r_hci_din_strobe    ),
  .o_hci_sm_ready       (w_hci_sm_ready      ),
  .i_hci_data           (r_hci_din           ),

  .o_hci_data_strobe    (w_hci_dout_strobe   ),
  .i_hci_host_ready     (r_hci_host_ready    ),
  .o_hci_data           (w_hci_dout          )
);


//Convert AXI Slave signals to a simple register/address strobe
axi_lite_slave #(
  .ADDR_WIDTH         (ADDR_WIDTH           ),
  .DATA_WIDTH         (DATA_WIDTH           )

) axi_lite_reg_interface (
  .clk                (clk                  ),
  .rst                (w_axis_rst           ),

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

//assign  status[STATUS_CLOCK_LOCKED]               = clk_locked;
assign  status[STATUS_CLOCK_LOCKED]               = 1'b0;
assign  status[STATUS_HCI_READY]                  = w_hci_sm_ready;
//assign  status[STATUS_HCI_NEW_STATUS]             = r_hci_opcode_new_status;
assign  status[STATUS_HCI_NEW_STATUS]             = 1'b0;
assign  status[STATUS_HCI_S_TOP:STATUS_HCI_S_BOT] = r_hci_opcode_status;
assign  status[15:3]                              = 0;

assign  w_mute_control                            = 4'h0;

assign  w_video_red                               = {w_red,     5'h0};
assign  w_video_blue                              = {w_blue,    5'h0};
assign  w_video_green                             = {w_green,   6'h0};


//Asynchronous Logic
assign  w_axi_rst                                 = (INVERT_AXI_RESET)    ? ~rst         : rst;
assign  w_axis_rst                                = (INVERT_AXIS_RESET)   ? ~i_axis_rst   : i_axis_rst;
assign  w_reg_32bit_address                       = w_reg_address[(ADDR_WIDTH - 1): 2];

//blocks
always @ (posedge clk) begin
  //De-assert Strobes
  r_reg_in_ack_stb                        <=  0;
  r_reg_out_rdy_stb                       <=  0;
  r_reg_invalid_addr                      <=  0;
  r_hci_opcode_strobe                     <=  0;
  r_hci_din_strobe                        <=  0;
  r_hci_host_ready                        <=  0;

  if (w_axi_rst) begin
    control                               <=  0;
    r_reg_out_data                        <=  0;
    r_console_reset                       <=  1;
    r_hci_reset                           <=  1;

    //HCI
    r_hci_address                         <=  0;
    r_hci_count                           <=  0;
    r_hci_dout                            <=  0;

    r_hci_opcode_status                   <=  0;
    r_hci_opcode                          <=  0;

    r_hci_din_strobe                      <=  0;
    r_hci_din                             <=  0;

    r_jp1_state                           <=  0;
    r_jp2_state                           <=  0;

  end
  else begin

    if (w_hci_opcode_ack) begin
      r_hci_opcode_status                 <=  w_hci_opcode_status;
    end
    if (w_hci_dout_strobe) begin
      r_hci_dout                          <=  w_hci_dout;
    end


    if (w_reg_in_rdy && !r_reg_in_ack_stb) begin
      //From master
      case (w_reg_32bit_address)
        REG_CONTROL: begin
          r_hci_reset                     <= w_reg_in_data[CONTROL_HCI_RESET];
          r_console_reset                 <= w_reg_in_data[CONTROL_CONSOLE_RESET];
        end
        REG_USER_INPUT: begin
          r_jp1_state                     <= w_reg_in_data[7:0];
          r_jp2_state                     <= w_reg_in_data[15:8];
        end
        REG_HCI_OPCODE_COUNT: begin
          r_hci_count                     <= w_reg_in_data;
        end
        REG_HCI_OPCODE_ADDR: begin
          r_hci_address                   <= w_reg_in_data;
        end
        REG_HCI_OPCODE: begin
          r_hci_opcode                    <= w_reg_in_data;
          r_hci_opcode_strobe             <= 1;
        end
        REG_HCI_OPCODE_DATA: begin
          r_hci_din                       <= w_reg_in_data[7:0];
          r_hci_din_strobe                <= 1;
        end
        REG_HCI_READ_STB: begin
          r_hci_host_ready                <= w_reg_in_data[0];
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
          r_reg_out_data                        <= 32'h0;
          r_reg_out_data[CONTROL_HCI_RESET]     <=  r_hci_reset;
          r_reg_out_data[CONTROL_CONSOLE_RESET] <=  r_console_reset;

        end
        REG_STATUS: begin
          r_reg_out_data                  <= status;
        end
        REG_HCI_OPCODE_COUNT: begin
          r_reg_out_data                  <= r_hci_count;
        end
        REG_HCI_OPCODE_ADDR: begin
          r_reg_out_data                  <= r_hci_address;
        end
        REG_HCI_OPCODE: begin
          r_reg_out_data                  <= r_hci_opcode;
        end
        REG_HCI_OPCODE_DATA: begin
          r_reg_out_data                  <= {24'h000000, r_hci_dout};
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
