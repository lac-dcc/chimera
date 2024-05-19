// This program was cloned from: https://github.com/CospanDesign/nysa-verilog
// License: MIT License

//axi_on_screen_display.v
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

`define MAJOR_VERSION             1
`define MINOR_VERSION             1
`define REVISION                  0

`define BIT_CTRL_EN               0
`define BIT_CTRL_CLEAR_SCREEN_STB 1
`define BIT_CTRL_SCROLL_EN        4
`define BIT_CTRL_SCROLL_UP_STB    5
`define BIT_CTRL_SCROLL_DOWN_STB  6

`define MAJOR_RANGE               31:28
`define MINOR_RANGE               27:20
`define REVISION_RANGE            19:16


`define CHAR_ADDR_RANGE           7:0
`define BIT_CHAR_ALT_ENABLE       8

`define TAB_COUNT_RANGE           2:0


`define BIT_AXIS_RST              0
`define BIT_RANGE_COSD_STATE      7:4
`define BIT_PPFIFO_STB            8
`define BIT_PPFIFO_RDY            9
`define BIT_PPFIFO_ACT            10
`define BIT_AXIS_RDY              12
`define BIT_AXIS_VLD              13
`define BIT_AXIS_USR              14
`define BIT_AXIS_LST              15
`define BIT_RANGE_PCOUNT          31:16


//status bit definition

module axi_on_screen_display #(
  parameter                           CONSOLE_DEPTH       = 12,
  parameter                           ADDR_WIDTH          = 5,
  parameter                           DATA_WIDTH          = 32,
  parameter                           STROBE_WIDTH        = (DATA_WIDTH / 8),
  parameter                           AXIS_WIDTH          = 24,
  parameter                           INVERT_AXI_RESET    = 1,
  parameter                           INVERT_AXIS_RESET   = 1,
  parameter                           IMAGE_WIDTH         = 480,
  parameter                           IMAGE_HEIGHT        = 272,
  parameter                           BUFFER_DEPTH        = 9,
  parameter                           PIXEL_WIDTH         = 24,
  parameter                           FOREGROUND_COLOR    = 24'hFFFFFF,
  parameter                           BACKGROUND_COLOR    = 24'h000000,
  parameter                           FONT_WIDTH          = 5,
  parameter                           FONT_HEIGHT         = 7,
  parameter                           DEFAULT_TAB_COUNT   = 2,
  parameter                           DEFAULT_X_START     = 0,
  parameter                           DEFAULT_X_END       = IMAGE_WIDTH,
  parameter                           DEFAULT_Y_START     = 0,
  parameter                           DEFAULT_Y_END       = IMAGE_HEIGHT
)(
  input                               clk,
  input                               rst,

  //PMOD Data

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

//Local Parameters

//AXI Lite States
localparam                  REG_CONTROL         = 0;
localparam                  REG_STATUS          = 1;
localparam                  REG_IMAGE_WIDTH     = 2;
localparam                  REG_IMAGE_HEIGHT    = 3;
localparam                  REG_IMAGE_SIZE      = 4;
localparam                  REG_FG_COLOR        = 5;
localparam                  REG_BG_COLOR        = 6;
localparam                  REG_CONSOLE_CHAR    = 7;
localparam                  REG_CONSOLE_COMMAND = 8;
localparam                  REG_TAB_COUNT       = 9;
localparam                  REG_X_START         = 10;
localparam                  REG_X_END           = 11;
localparam                  REG_Y_START         = 12;
localparam                  REG_Y_END           = 13;
localparam                  REG_ADAPTER_DEBUG   = 14;
localparam                  REG_VERSION         = 15;

//Reg/Wire

//AXI Signals
wire        [31:0]              status;

//control
reg                             r_enable;
reg                             r_clear_screen_stb;
reg                             r_scroll_en;
reg                             r_scroll_up_stb;
reg                             r_scroll_down_stb;

reg         [31:0]              r_image_width;
reg         [31:0]              r_image_height;
reg         [31:0]              r_image_size;
reg         [31:0]              r_console_command;
reg         [7:0]               r_char_data;

//status

(* KEEP *) wire        [23:0]              wfifo_size;
(* KEEP *) wire                            wfifo_rdy;
(* KEEP *) wire                            wfifo_act;
(* KEEP *) wire                            wfifo_stb;
(* KEEP *) wire        [AXIS_WIDTH:0]      wfifo_data;
wire        [31:0]              w_adapter_debug;

//Simple User Interface
wire [ADDR_WIDTH - 1: 0]        w_reg_address;
reg                             r_reg_invalid_addr;

wire                            w_reg_in_rdy;
reg                             r_reg_in_ack_stb;
wire [DATA_WIDTH - 1: 0]        w_reg_in_data;

wire                            w_reg_out_req;
reg                             r_reg_out_rdy_stb;
reg [DATA_WIDTH - 1: 0]         r_reg_out_data;

//Handle Inversion
wire                            w_axi_rst;
wire                            w_axis_rst;
wire  [31:0]                    w_debug;
reg   [PIXEL_WIDTH - 1: 0]      r_fg_color;
reg   [PIXEL_WIDTH - 1: 0]      r_bg_color;
reg                             r_alt_char;
reg   [2:0]                     r_tab_count;

reg                             r_cmd_stb;
reg                             r_char_stb;
wire                            w_wr_char_rdy;
wire  [3:0]                     w_cosd_state;
wire  [15:0]                    w_pcount;

reg   [31:0]                    r_x_start;
reg   [31:0]                    r_x_end;
reg   [31:0]                    r_y_start;
reg   [31:0]                    r_y_end;

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

console_osd #(
  .CONSOLE_DEPTH      (CONSOLE_DEPTH        ),
  .IMAGE_WIDTH        (IMAGE_WIDTH          ),
  .IMAGE_HEIGHT       (IMAGE_HEIGHT         ),
  .BUFFER_DEPTH       (BUFFER_DEPTH         ),
  .PIXEL_WIDTH        (PIXEL_WIDTH          ),
  .FONT_WIDTH         (FONT_WIDTH           ),
  .FONT_HEIGHT        (FONT_HEIGHT          )
)cosd(
  .clk                (clk                  ),
  .rst                (w_axi_rst            ),
  .i_enable           (r_enable             ),

  .i_fg_color         (r_fg_color           ),
  .i_bg_color         (r_bg_color           ),

  .i_cmd_stb          (r_cmd_stb            ),
  .i_cmd              (r_console_command    ),

  .i_char_stb         (r_char_stb           ),
  .i_char             (r_char_data          ),
  .o_wr_char_rdy      (w_wr_char_rdy        ),

  .i_clear_screen_stb (r_clear_screen_stb   ),
  .i_alt_func_en      (r_alt_char           ),
  .i_tab_count        (r_tab_count          ),

  .i_scroll_en        (r_scroll_en          ),
  .i_scroll_up_stb    (r_scroll_up_stb      ),
  .i_scroll_down_stb  (r_scroll_down_stb    ),

  .i_x_start          (r_x_start            ),
  .i_x_end            (r_x_end              ),
  .i_y_start          (r_y_start            ),
  .i_y_end            (r_y_end              ),

  .i_ppfifo_clk       (i_axis_clk           ),
  .i_ppfifo_rst       (w_axis_rst           ),
  .o_ppfifo_rdy       (wfifo_rdy            ),
  .i_ppfifo_act       (wfifo_act            ),
  .o_ppfifo_size      (wfifo_size           ),
  .o_ppfifo_data      (wfifo_data           ),
  .i_ppfifo_stb       (wfifo_stb            ),


  //Debug Signals
  .o_state            (w_cosd_state         ),
  .o_pixel_count      (w_pcount             )
);


//Take in an AXI video stream and output the data into a PPFIFO
adapter_ppfifo_2_axi_stream #(
  .DATA_WIDTH         (AXIS_WIDTH           )
) as2p (
  .rst                (w_axis_rst           ),

  //AXI Stream Input
  .i_axi_clk          (i_axis_clk           ),
  .i_axi_ready        (i_axis_ready         ),
  .o_axi_data         (o_axis_data          ),
  .o_axi_last         (o_axis_last          ),
  .o_axi_valid        (o_axis_valid         ),
  .o_axi_user         (o_axis_user          ),

  //Ping Pong FIFO Write Controller
  .i_ppfifo_rdy       (wfifo_rdy            ),
  .o_ppfifo_act       (wfifo_act            ),
  .i_ppfifo_size      (wfifo_size           ),
  .o_ppfifo_stb       (wfifo_stb            ),
  .i_ppfifo_data      (wfifo_data           ),

  .o_debug            (w_adapter_debug      )
);


//Asynchronous Logic
assign        w_axi_rst               = (INVERT_AXI_RESET)   ? ~rst         : rst;
assign        w_axis_rst              = (INVERT_AXIS_RESET)  ? ~i_axis_rst  : i_axis_rst;

//blocks
always @ (posedge clk) begin
  //De-assert Strobes
  r_reg_in_ack_stb                        <=  0;
  r_reg_out_rdy_stb                       <=  0;
  r_reg_invalid_addr                      <=  0;
  r_cmd_stb                               <=  0;
  r_char_stb                              <=  0;
  r_alt_char                              <=  0;
  r_clear_screen_stb                      <=  0;
  r_scroll_up_stb                         <=  0;
  r_scroll_down_stb                       <=  0;

  if (w_axi_rst) begin
    r_enable                              <=  0;
    r_scroll_en                           <=  0;
    r_reg_out_data                        <=  0;
    r_image_width                         <=  IMAGE_WIDTH;
    r_image_height                        <=  IMAGE_HEIGHT;
    r_image_size                          <=  (IMAGE_WIDTH * IMAGE_HEIGHT);
    r_x_start                             <=  DEFAULT_X_START;
    r_x_end                               <=  DEFAULT_X_END;
    r_y_start                             <=  DEFAULT_Y_START;
    r_y_end                               <=  DEFAULT_Y_END;
    r_fg_color                            <=  FOREGROUND_COLOR;
    r_bg_color                            <=  BACKGROUND_COLOR;
    r_tab_count                           <=  DEFAULT_TAB_COUNT;
    r_char_data                           <=  0;
    r_console_command                     <=  0;
  end
  else begin

    if (w_reg_in_rdy) begin
      //From master
      case (w_reg_address)
        REG_CONTROL: begin
          r_enable                        <= w_reg_in_data[`BIT_CTRL_EN];
          r_clear_screen_stb              <= w_reg_in_data[`BIT_CTRL_CLEAR_SCREEN_STB];
          r_scroll_en                     <= w_reg_in_data[`BIT_CTRL_SCROLL_EN];
          r_scroll_up_stb                 <= w_reg_in_data[`BIT_CTRL_SCROLL_UP_STB];
          r_scroll_down_stb               <= w_reg_in_data[`BIT_CTRL_SCROLL_DOWN_STB];
        end
/*
///XXX: The Image Size Should be adjustable in the future
        REG_IMAGE_WIDTH: begin
          r_image_width                   <= w_reg_in_data;
        end
        REG_IMAGE_HEIGHT: begin
          r_image_height                  <= w_reg_in_data;
        end
        REG_IMAGE_SIZE: begin
          r_image_size                    <= w_reg_in_data;
        end
*/
        REG_FG_COLOR: begin
          r_fg_color                      <= w_reg_in_data[AXIS_WIDTH - 1: 0];
        end
        REG_BG_COLOR: begin
          r_bg_color                      <= w_reg_in_data[AXIS_WIDTH - 1: 0];
        end
        REG_CONSOLE_CHAR: begin
          r_char_data                     <= w_reg_in_data[`CHAR_ADDR_RANGE];
          r_alt_char                      <= w_reg_in_data[`BIT_CHAR_ALT_ENABLE];
          if (w_wr_char_rdy) begin
            r_char_stb                    <= 1;
          end
        end
        REG_CONSOLE_COMMAND: begin
          r_console_command               <= w_reg_in_data;
        end
        REG_X_START: begin
          r_x_start                       <= w_reg_in_data;
        end
        REG_X_END: begin
          r_x_end                         <= w_reg_in_data;
        end
        REG_Y_START: begin
          r_y_start                       <= w_reg_in_data;
        end
        REG_Y_END: begin
          r_y_end                         <= w_reg_in_data;
        end
        REG_TAB_COUNT: begin
          r_tab_count                     <= w_reg_in_data[`TAB_COUNT_RANGE];
        end
        default: begin
        end
      endcase

      if (w_reg_address > REG_VERSION) begin
        r_reg_invalid_addr                <= 1;
      end
      else if (w_reg_address == REG_CONSOLE_CHAR) begin
        if (w_wr_char_rdy) begin
          r_reg_in_ack_stb                <= 1;
        end
      end
      else begin
        r_reg_in_ack_stb                  <= 1;
      end
    end
    else if (w_reg_out_req) begin
      //To master
      case (w_reg_address)
        REG_CONTROL: begin
          r_reg_out_data                      <=  0;
          r_reg_out_data[`BIT_CTRL_EN]        <= r_enable;
          r_reg_out_data[`BIT_CTRL_SCROLL_EN] <= r_scroll_en;
        end
        REG_STATUS: begin
          r_reg_out_data                      <=  0;
          r_reg_out_data[`BIT_AXIS_RST]       <= w_axis_rst;
          r_reg_out_data[`BIT_RANGE_COSD_STATE]<= w_cosd_state;
          //r_reg_out_data[`BIT_PPFIFO_STB]     <= wfifo_stb;
          //r_reg_out_data[`BIT_PPFIFO_RDY]     <= wfifo_rdy;
          //r_reg_out_data[`BIT_PPFIFO_ACT]     <= wfifo_act;
          r_reg_out_data[`BIT_AXIS_RDY]       <= i_axis_ready;
          r_reg_out_data[`BIT_AXIS_VLD]       <= o_axis_valid;
          r_reg_out_data[`BIT_AXIS_USR]       <= o_axis_user[0];
          r_reg_out_data[`BIT_AXIS_LST]       <= o_axis_last;
          r_reg_out_data[`BIT_RANGE_PCOUNT]   <= w_pcount;
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
        REG_FG_COLOR: begin
          r_reg_out_data                  <= {8'h0, r_fg_color};
        end
        REG_BG_COLOR: begin
          r_reg_out_data                  <= {8'h0, r_bg_color};
        end
        REG_CONSOLE_CHAR: begin
          r_reg_out_data                  <= r_char_data;
        end
        REG_CONSOLE_COMMAND: begin
          r_reg_out_data                  <= r_console_command;
        end
        REG_X_START: begin
          r_reg_out_data                  <= r_x_start;
        end
        REG_X_END: begin
         r_reg_out_data                  <=  r_x_end;
        end
        REG_Y_START: begin
          r_reg_out_data                  <= r_y_start;
        end
        REG_Y_END: begin
          r_reg_out_data                  <= r_y_end;
        end
        REG_TAB_COUNT: begin
          r_reg_out_data[`TAB_COUNT_RANGE]<= r_tab_count;
        end
        REG_ADAPTER_DEBUG: begin
          r_reg_out_data                  <=  w_adapter_debug;
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
      if (w_reg_address > REG_VERSION) begin
        r_reg_invalid_addr                <= 1;
      end
      r_reg_out_rdy_stb                   <= 1;
    end
  end
end

endmodule
