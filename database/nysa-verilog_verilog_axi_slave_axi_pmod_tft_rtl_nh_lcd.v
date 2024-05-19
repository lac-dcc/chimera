// This program was cloned from: https://github.com/CospanDesign/nysa-verilog
// License: MIT License


module nh_lcd #(
  parameter                       DATAS_WIDTH = 24,
  parameter                       BUFFER_SIZE = 12
)(
  input                           rst,
  input                           clk,

  output      [31:0]              debug,

  //Control Signals
  input                           i_enable,
  input                           i_reset_display,
  input                           i_cmd_mode,
  input                           i_enable_tearing,
  input                           i_cmd_parameter,
  input                           i_cmd_write_stb,
  input                           i_cmd_read_stb,
  input       [7:0]               i_cmd_data,
  output      [7:0]               o_cmd_data,
  output                          o_cmd_finished,
  input                           i_write_override,
  input                           i_chip_select,
  input       [31:0]              i_image_width,
  input       [31:0]              i_image_height,

  //FIFO Signals
  input                           i_fifo_clk,
  input                           i_fifo_rst,
  output      [1:0]               o_fifo_rdy,
  input       [1:0]               i_fifo_act,
  input                           i_fifo_stb,
  output      [23:0]              o_fifo_size,
  input       [DATAS_WIDTH:0]     i_fifo_data,

  //Physical Signals
  output                          o_read_en,
  output                          o_register_data_sel,
  output                          o_write_n,
  output                          o_read_n,
  input       [7:0]               i_data,
  output      [7:0]               o_data,
  output                          o_cs_n,
  output                          o_reset_n,
  input                           i_tearing_effect,

  input                           i_tp_red,
  input                           i_tp_green,
  input                           i_tp_blue
);

//Local Parameters
//Registers/Wires
wire  [7:0]           w_data_out;

wire                  w_cmd_write;
wire                  w_cmd_read;
wire  [7:0]           w_cmd_data;
wire                  w_cmd_cmd_mode;

wire                  w_cmd_data_out_en;


wire                  w_data_cmd_mode;
wire  [7:0]           w_data_data;
wire                  w_data_write;
wire                  w_data_read;
wire                  w_data_data_out_en;

//Submodules
nh_lcd_command lcd_commander (

  .rst                  (rst                  ),
  .clk                  (clk                  ),

//  .debug              (debug                ),

  .i_enable             (i_enable             ),
  .i_cmd_parameter      (i_cmd_parameter      ),
  .i_cmd_write_stb      (i_cmd_write_stb      ),
  .i_cmd_read_stb       (i_cmd_read_stb       ),
  .i_cmd_data           (i_cmd_data           ),
  .o_cmd_data           (o_cmd_data           ),

  //Control Signals
  .o_data_out_en        (w_cmd_data_out_en    ),
  .o_cmd_finished       (o_cmd_finished       ),
  .o_cmd_mode           (w_cmd_cmd_mode       ),
  .o_write              (w_cmd_write          ),
  .o_read               (w_cmd_read           ),
  .o_data_out           (w_cmd_data           ),
  .i_data_in            (i_data               )
);

nh_lcd_data_writer #(
  .DATAS_WIDTH          (DATAS_WIDTH          ),
  .BUFFER_SIZE          (BUFFER_SIZE          )
)lcd_data_writer(
  .rst                  (rst                  ),
  .clk                  (clk                  ),

  .debug                (debug                ),

  .i_enable             (i_enable             ),
  .i_enable_tearing     (i_enable_tearing     ),
  .i_image_width        (i_image_width        ),
  .i_image_height       (i_image_height       ),

  .i_fifo_clk           (i_fifo_clk           ),
  .i_fifo_rst           (i_fifo_rst           ),
  .o_fifo_rdy           (o_fifo_rdy           ),
  .i_fifo_act           (i_fifo_act           ),
  .i_fifo_stb           (i_fifo_stb           ),
  .o_fifo_size          (o_fifo_size          ),
  .i_fifo_data          (i_fifo_data          ),

  .o_cmd_mode           (w_data_cmd_mode      ),
  .o_data_out           (w_data_data          ),
  .i_data_in            (i_data               ),
  .o_write              (w_data_write         ),
  .o_read               (w_data_read          ),
  .o_data_out_en        (w_data_data_out_en   ),
  .i_tearing_effect     (i_tearing_effect     ),

  //Test Generator
  .i_tp_red             (i_tp_red             ),
  .i_tp_blue            (i_tp_blue            ),
  .i_tp_green           (i_tp_green           )
);

//Asynchronous Logic
assign  o_reset_n           = ~i_reset_display;
assign  o_cs_n              = ~i_chip_select;

//Select control between the Command controller and the Data Controller
assign  o_register_data_sel = (i_cmd_mode) ? w_cmd_cmd_mode     : w_data_cmd_mode;
assign  o_write_n           = (i_cmd_mode) ? ~w_cmd_write       : ~w_data_write;
assign  o_read_n            = (i_cmd_mode) ? ~w_cmd_read        : ~w_data_read;
assign  o_read_en           = (i_cmd_mode) ? w_cmd_data_out_en  : w_data_data_out_en;
assign  o_data              = (i_cmd_mode) ? w_cmd_data         : w_data_data;

//Synchronous Logic
endmodule
