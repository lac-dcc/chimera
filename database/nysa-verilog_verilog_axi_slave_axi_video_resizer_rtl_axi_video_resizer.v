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

`define BIT_CONTROL_ENABLE        0
`define BIT_CONTROL_RESET         1

`define BIT_STATUS_ACTIVE         0
`define DEFAULT_FILL_PIXEL        0

`define MAJOR_RANGE               31:28
`define MINOR_RANGE               27:20
`define REVISION_RANGE            19:16



module axi_video_resizer #(
  parameter           INVERT_AXI_RESET    = 1,
  parameter           INVERT_AXIS_RESET   = 1,
  parameter           BUFFER_SIZE         = 9,
  parameter           ADDR_WIDTH          = 4,
  parameter           DATA_WIDTH          = 32,
  parameter           STROBE_WIDTH        = (DATA_WIDTH / 8),
  parameter           AXIS_WIDTH          = 24,
  parameter           VIDEO_IN_WIDTH      = 1280,
  parameter           VIDEO_IN_HEIGHT     = 720,
  parameter           VIDEO_IN_SIZE       = VIDEO_IN_WIDTH * VIDEO_IN_HEIGHT,
  parameter           VIDEO_OUT_WIDTH     = 1280,
  parameter           VIDEO_OUT_HEIGHT    = 720,
  parameter           VIDEO_OUT_SIZE      = VIDEO_OUT_WIDTH * VIDEO_OUT_HEIGHT,
  parameter           VIDEO_START_X       = 0,
  parameter           VIDEO_START_Y       = 0
)(
  input                               clk,
  input                               rst,

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

  //AXI Stream
  input                               i_axis_clk,
  input                               i_axis_rst,

  //AXI Video Stream Input
  input       [AXIS_WIDTH - 1:0]      i_axis_video_in_data,
  output                              o_axis_video_in_ready,
  input                               i_axis_video_in_last,
  input                               i_axis_video_in_valid,

  //AXI Video Stream Output
  output       [AXIS_WIDTH - 1:0]     o_axis_video_out_data,
  input                               i_axis_video_out_ready,
  output                              o_axis_video_out_last,
  output                              o_axis_video_out_valid

);
//local parameters


//Address Map
localparam                      REG_CONTROL           = 0;
localparam                      REG_STATUS            = 1;
localparam                      REG_VERSION           = 2;

localparam                      REG_VIDEO_IN_SIZE     = 4;
localparam                      REG_VIDEO_IN_WIDTH    = 5;
localparam                      REG_VIDEO_IN_HEIGHT   = 6;

localparam                      REG_VIDEO_OUT_SIZE    = 8;
localparam                      REG_VIDEO_OUT_WIDTH   = 9;
localparam                      REG_VIDEO_OUT_HEIGHT  = 10;

localparam                      REG_VIDEO_IN_START_X  = 12;
localparam                      REG_VIDEO_IN_START_Y  = 13;
localparam                      REG_IN_FILL_PIXEL     = 14;

localparam                      REG_LAST_REG = REG_IN_FILL_PIXEL;

//registes/wires

//Simple User Interface
wire  [ADDR_WIDTH - 1: 0]       w_reg_address;
reg                             r_reg_invalid_addr;

wire                            w_reg_in_rdy;
reg                             r_reg_in_ack_stb;
wire  [DATA_WIDTH - 1: 0]       w_reg_in_data;

wire                            w_reg_out_req;
reg                             r_reg_out_rdy_stb;
reg   [DATA_WIDTH - 1: 0]       r_reg_out_data;


reg                             r_enable;
reg                             r_reset;
reg   [31:0]                    r_video_in_size;
reg   [31:0]                    r_video_in_width;
reg   [31:0]                    r_video_in_height;

reg   [31:0]                    r_video_out_width;
reg   [31:0]                    r_video_out_height;
reg   [31:0]                    r_video_out_size;

reg   [31:0]                    r_video_in_start_x;
reg   [31:0]                    r_video_in_start_y;
reg   [AXIS_WIDTH - 1:0]        r_fill_pixel_value;

wire                            w_axi_rst;
wire                            w_axis_rst;


wire  [1:0]                     w_fifo_in_rdy;
wire  [1:0]                     w_fifo_in_act;
wire                            w_fifo_in_stb;
wire  [23:0]                    w_fifo_in_size;
wire  [AXIS_WIDTH - 1:0]        w_fifo_in_data;

wire                            w_fifo_out_rdy;
wire                            w_fifo_out_act;
wire                            w_fifo_out_stb;
wire  [23:0]                    w_fifo_out_size;
wire  [AXIS_WIDTH - 1:0]        w_fifo_out_data;



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
adapter_axi_stream_2_ppfifo #(
  .DATA_WIDTH         (AXIS_WIDTH           )
) as2p (
  .rst                (w_axis_rst           ),

  //AXI Stream Input
  .i_axi_clk          (i_axis_clk           ),
  .o_axi_ready        (o_axis_video_in_ready),
  .i_axi_data         (i_axis_video_in_data ),
  .i_axi_last         (i_axis_video_in_last ),
  .i_axi_valid        (i_axis_video_in_valid),

  //Ping Pong FIFO Write Controller
  .o_ppfifo_clk       (                     ),
  .i_ppfifo_rdy       (w_fifo_in_rdy        ),
  .o_ppfifo_act       (w_fifo_in_act        ),
  .i_ppfifo_size      (w_fifo_in_size       ),
  .o_ppfifo_stb       (w_fifo_in_stb        ),
  .o_ppfifo_data      (w_fifo_in_data       )
);


adapter_ppfifo_2_axi_stream #(
  .DATA_WIDTH         (AXIS_WIDTH             )
) p2as (
  .rst                (w_axis_rst             ),

  .i_total_out_size   (r_video_out_size[23:0] ),

  //Ping Poing FIFO Read Interface
  .i_ppfifo_clk       (i_axis_clk             ),
  .i_ppfifo_rdy       (w_fifo_out_rdy         ),
  .o_ppfifo_act       (w_fifo_out_act         ),
  .i_ppfifo_size      (w_fifo_out_size        ),
  .i_ppfifo_data      (w_fifo_out_data        ),
  .o_ppfifo_stb       (w_fifo_out_stb         ),

  //AXI Stream Output
  .o_axi_clk          (                       ),
  .i_axi_ready        (i_axis_video_out_ready ),
  .o_axi_data         (o_axis_video_out_data  ),
//  .o_axi_keep         (  ),
  .o_axi_last         (o_axis_video_out_last  ),
  .o_axi_valid        (o_axis_video_out_valid )
);


video_resizer #(
  .AXIS_WIDTH        (AXIS_WIDTH           ),
  .PPFIFO_WIDTH       (BUFFER_SIZE          )
) vr (
  .clk                (i_axis_clk           ),
  .rst                (w_axis_rst           ),

  //Configuration Ports
  .i_enable           (r_enable             ),
  .i_reset            (r_reset              ),
  .i_video_in_size    (r_video_in_size      ),
  .i_video_in_width   (r_video_in_width     ),
  .i_video_in_height  (r_video_in_height    ),

  .i_video_out_size   (r_video_out_size     ),
  .i_video_out_width  (r_video_out_width    ),
  .i_video_out_height (r_video_out_height   ),

  .i_video_in_start_x (r_video_in_start_x   ),
  .i_video_in_start_y (r_video_in_start_y   ),
  .i_fill_pixel_value (r_fill_pixel_value   ),

  //FIFO in Signals
  .o_fifo_in_rdy      (w_fifo_in_rdy        ),
  .i_fifo_in_act      (w_fifo_in_act        ),
  .i_fifo_in_stb      (w_fifo_in_stb        ),
  .o_fifo_in_size     (w_fifo_in_size       ),
  .i_fifo_in_data     (w_fifo_in_data       ),

  .o_fifo_out_rdy     (w_fifo_out_rdy       ),
  .i_fifo_out_act     (w_fifo_out_act       ),
  .i_fifo_out_stb     (w_fifo_out_stb       ),
  .o_fifo_out_size    (w_fifo_out_size      ),
  .o_fifo_out_data    (w_fifo_out_data      )

);




//submodules
//asynchronous logic

assign  w_axi_rst                         = (INVERT_AXI_RESET)   ? ~rst         : rst;
assign  w_axis_rst                        = (INVERT_AXIS_RESET)  ? ~i_axis_rst  : i_axis_rst;


//synchronous logic
always @ (posedge clk) begin
  //De-assert Strobes
  r_reg_in_ack_stb                        <=  0;
  r_reg_out_rdy_stb                       <=  0;
  r_reg_invalid_addr                      <=  0;

  r_reset                                 <=  0;

  if (w_axi_rst) begin
    r_reg_out_data                        <=  0;
    r_enable                              <=  0;

    r_video_in_width                      <=  VIDEO_IN_WIDTH;
    r_video_in_height                     <=  VIDEO_IN_HEIGHT;
    r_video_in_size                       <=  VIDEO_IN_SIZE;

    r_video_out_width                     <=  VIDEO_OUT_WIDTH;
    r_video_out_height                    <=  VIDEO_OUT_HEIGHT;
    r_video_out_size                      <=  VIDEO_OUT_SIZE;

    r_video_in_start_x                    <=  VIDEO_START_X;
    r_video_in_start_y                    <=  VIDEO_START_Y;

    r_fill_pixel_value                    <=  `DEFAULT_FILL_PIXEL;
  end
  else begin

    if (w_reg_in_rdy) begin
      //From master
      case (w_reg_address)
        REG_CONTROL: begin
          r_enable                        <= w_reg_in_data[`BIT_CONTROL_ENABLE];
          r_reset                         <= w_reg_in_data[`BIT_CONTROL_RESET];
        end
        REG_VIDEO_IN_SIZE: begin
          r_video_in_size                 <= w_reg_in_data;
        end
        REG_VIDEO_IN_WIDTH: begin
          r_video_in_width                <= w_reg_in_data;
        end
        REG_VIDEO_IN_HEIGHT: begin
          r_video_in_height               <= w_reg_in_data;
        end
        REG_VIDEO_OUT_SIZE: begin
          r_video_out_size                <= w_reg_in_data;
        end
        REG_VIDEO_OUT_WIDTH: begin
          r_video_out_width               <= w_reg_in_data;
        end
        REG_VIDEO_OUT_HEIGHT: begin
          r_video_out_height              <= w_reg_in_data;
        end
        REG_VIDEO_IN_START_X: begin
          r_video_in_start_x              <= w_reg_in_data;
        end
        REG_VIDEO_IN_START_Y: begin
          r_video_in_start_y              <= w_reg_in_data;
        end
        REG_IN_FILL_PIXEL: begin
          r_fill_pixel_value              <= w_reg_in_data[AXIS_WIDTH - 1: 0];
        end
        default: begin
        end
      endcase
      if (w_reg_address > REG_LAST_REG) begin
        r_reg_invalid_addr                <= 1;
      end
      r_reg_in_ack_stb                    <= 1;
    end
    else if (w_reg_out_req) begin
      //To master
      case (w_reg_address)
        REG_CONTROL: begin
          r_reg_out_data[`BIT_CONTROL_ENABLE] <=  r_enable;
          r_reg_out_data[`BIT_CONTROL_RESET]  <=  r_reset;
        end
        REG_STATUS: begin
          r_reg_out_data                  <= 32'h0;
          r_reg_out_data[0]               <= r_enable;
        end
        REG_VERSION: begin
          r_reg_out_data                  <= 32'h00;
          r_reg_out_data[`MAJOR_RANGE]    <= `MAJOR_VERSION;
          r_reg_out_data[`MINOR_RANGE]    <= `MINOR_VERSION;
          r_reg_out_data[`REVISION_RANGE] <= `REVISION;
        end
        REG_VIDEO_IN_SIZE: begin
          r_reg_out_data                  <= r_video_in_size;
        end
        REG_VIDEO_IN_WIDTH: begin
          r_reg_out_data                  <= r_video_in_width;
        end
        REG_VIDEO_IN_HEIGHT: begin
          r_reg_out_data                  <= r_video_in_height;
        end
        REG_VIDEO_OUT_SIZE: begin
          r_reg_out_data                  <= r_video_out_size;
        end
        REG_VIDEO_OUT_WIDTH: begin
          r_reg_out_data                  <= r_video_out_width;
        end
        REG_VIDEO_OUT_HEIGHT: begin
          r_reg_out_data                  <= r_video_out_height;
        end
        REG_VIDEO_IN_START_X: begin
          r_reg_out_data                  <= r_video_in_start_x;
        end
        REG_VIDEO_IN_START_Y: begin
          r_reg_out_data                  <= r_video_in_start_y;
        end
        REG_IN_FILL_PIXEL: begin
          r_reg_out_data                  <= r_fill_pixel_value;
        end
        default: begin
          r_reg_out_data                  <= 32'h00;
        end
      endcase
      if (w_reg_address > REG_LAST_REG) begin
        r_reg_invalid_addr                <= 1;
      end
      r_reg_out_rdy_stb                   <= 1;
    end
  end
end



endmodule
