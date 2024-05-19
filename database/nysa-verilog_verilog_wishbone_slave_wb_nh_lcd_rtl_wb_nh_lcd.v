// This program was cloned from: https://github.com/CospanDesign/nysa-verilog
// License: MIT License

//wb_nh_lcd.v
/*
Distributed under the MIT license.
Copyright (c) 2011 Dave McCoy (dave.mccoy@cospandesign.com)

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
  Self Defining Bus (SDB)

  Set the Vendor ID (Hexidecimal 64-bit Number)
  SDB_VENDOR_ID:0x800000000000C594

  Set the Device ID (Hexcidecimal 32-bit Number)
  SDB_DEVICE_ID:0x00000007

  Set the version of the Core XX.XXX.XXX Example: 01.000.000
  SDB_CORE_VERSION:00.000.001

  Set the Device Name: (19 UNICODE characters)
  SDB_NAME:wb_nh_lcd

  Set the class of the device (16 bits) Set as 0
  SDB_ABI_CLASS:0

  Set the ABI Major Version: (8-bits)
  SDB_ABI_VERSION_MAJOR:0x10

  Set the ABI Minor Version (8-bits)
  SDB_ABI_VERSION_MINOR:0x01

  Set the Module URL (63 Unicode Characters)
  SDB_MODULE_URL:http://www.example.com

  Set the date of module YYYY/MM/DD
  SDB_DATE:2015/01/07

  Device is executable (True/False)
  SDB_EXECUTABLE:True

  Device is readable (True/False)
  SDB_READABLE:True

  Device is writeable (True/False)
  SDB_WRITEABLE:True

  Device Size: Number of Registers
  SDB_SIZE:8
*/

`define DEFAULT_MEMORY_TIMEOUT  300

`include "project_defines.v"
`include "nh_lcd_defines.v"

`define CONTROL_ENABLE            0
`define CONTROL_ENABLE_INTERRUPT  1
`define CONTROL_COMMAND_MODE      2
`define CONTROL_BACKLIGHT_ENABLE  3
`define CONTROL_RESET_DISPLAY     4
`define CONTROL_COMMAND_WRITE     5
`define CONTROL_COMMAND_READ      6
`define CONTROL_COMMAND_PARAMETER 7
`define CONTROL_WRITE_OVERRIDE    8
`define CONTROL_CHIP_SELECT       9
`define CONTROL_ENABLE_TEARING    10

//status bit definition
`define STATUS_MEMORY_0_EMPTY     0
`define STATUS_MEMORY_1_EMPTY     1



module wb_nh_lcd #(
  parameter           BUFFER_SIZE = 12
)(
  input               clk,
  input               rst,

  output      [31:0]  debug,

  //wishbone slave signals
  input               i_wbs_we,
  input               i_wbs_stb,
  input               i_wbs_cyc,
  input       [3:0]   i_wbs_sel,
  input       [31:0]  i_wbs_adr,
  input       [31:0]  i_wbs_dat,
  output reg  [31:0]  o_wbs_dat,
  output reg          o_wbs_ack,
  output reg          o_wbs_int,

  //master control signal for memory arbitration
  output              mem_o_we,
  output              mem_o_stb,
  output              mem_o_cyc,
  output      [3:0]   mem_o_sel,
  output      [31:0]  mem_o_adr,
  output      [31:0]  mem_o_dat,
  input       [31:0]  mem_i_dat,
  input               mem_i_ack,
  input               mem_i_int,

  output              o_backlight_enable,
  output              o_register_data_sel,
  output              o_write_n,
  output              o_read_n,
  inout       [7:0]   io_data,
  output              o_cs_n,
  output              o_reset_n,
  input               i_tearing_effect,
  output              o_display_on
);

//Local Parameters
localparam           REG_CONTROL        = 32'h00000000;
localparam           REG_STATUS         = 32'h00000001;
localparam           REG_COMMAND_DATA   = 32'h00000002;
localparam           REG_PIXEL_COUNT    = 32'h00000003;
localparam           REG_MEM_0_BASE     = 32'h00000004;
localparam           REG_MEM_0_SIZE     = 32'h00000005;
localparam           REG_MEM_1_BASE     = 32'h00000006;
localparam           REG_MEM_1_SIZE     = 32'h00000007;

//Reg/Wire
wire                timeout_elapsed;
reg                 timeout_enable;
reg         [31:0]  timeout_count;
reg         [31:0]  timeout_value;

reg                 enable_mem_read;

reg                 memory_data_strobe;
reg                 enable_strobe;


reg         [31:0]  control;
wire        [31:0]  status;
reg         [31:0]  clock_divider = 1;


reg         [23:0]  request_count;

reg                 memory_ready;
reg                 active_bank;

//Mem 2 PPFIFO
reg         [31:0]  r_memory_0_base;
reg         [31:0]  r_memory_0_size;
wire        [31:0]  w_memory_0_count;
reg                 r_memory_0_new_data;
wire                w_memory_0_empty;

wire        [31:0]  w_default_mem_0_base;

reg         [31:0]  r_memory_1_base;
reg         [31:0]  r_memory_1_size;
wire        [31:0]  w_memory_1_count;
reg                 r_memory_1_new_data;
wire                w_memory_1_empty;

wire        [31:0]  w_default_mem_1_base;

wire                w_read_finished;

//control
wire                w_enable;
wire                w_enable_interrupt;
wire                w_reset_display;
wire                w_command_mode;
wire                w_backlight_enable;
wire                w_cmd_write_stb;
wire                w_cmd_read_stb;
wire                w_cmd_parameter;
wire                w_write_override;
wire                w_chip_select;
wire                w_enable_tearing;

wire                w_cmd_finished;
reg         [7:0]   r_cmd_data_out;
wire        [7:0]   w_cmd_data_in;

reg         [31:0]  r_num_pixels;

//status

wire        [23:0]  wfifo_size;
wire        [1:0]   wfifo_ready;
wire        [1:0]   wfifo_activate;
wire                wfifo_strobe;
wire        [31:0]  wfifo_data;

reg         [3:0]   state;


nh_lcd #(
  .BUFFER_SIZE         (BUFFER_SIZE         )
) lcd (
  .rst                 (rst                 ),
  .clk                 (clk                 ),

  .debug               (debug               ),


  .i_enable            (w_enable            ),
  .i_enable_tearing    (w_enable_tearing    ),
  .i_reset_display     (w_reset_display     ),
  .i_data_command_mode (~w_command_mode     ),
  .i_cmd_parameter     (w_cmd_parameter     ),
  .i_cmd_write_stb     (w_cmd_write_stb     ),
  .i_cmd_read_stb      (w_cmd_read_stb      ),
  .i_cmd_data          (r_cmd_data_out      ),
  .o_cmd_data          (w_cmd_data_in       ),
  .o_cmd_finished      (w_cmd_finished      ),
  .i_backlight_enable  (w_backlight_enable  ),
  .i_write_override    (w_write_override    ),
  .i_chip_select       (w_chip_select       ),
  .i_num_pixels        (r_num_pixels        ),

  .o_fifo_rdy          (wfifo_ready         ),
  .i_fifo_act          (wfifo_activate      ),
  .i_fifo_stb          (wfifo_strobe        ),
  .o_fifo_size         (wfifo_size          ),
  .i_fifo_data         (wfifo_data          ),


  .o_backlight_enable  (o_backlight_enable  ),
  .o_register_data_sel (o_register_data_sel ),
  .o_write_n           (o_write_n           ),
  .o_read_n            (o_read_n            ),
  .io_data             (io_data             ),
  .o_cs_n              (o_cs_n              ),
  .o_reset_n           (o_reset_n           ),
  .i_tearing_effect    (i_tearing_effect    ),
  .o_display_on        (o_display_on        )
);

wb_mem_2_ppfifo m2p(

  .clk                  (clk                      ),
  .rst                  (rst                      ),
  //.debug                (debug                    ),

  //Control
  .i_enable             (w_enable                 ),

  .i_memory_0_base      (r_memory_0_base          ),
  .i_memory_0_size      (r_memory_0_size          ),
  .o_memory_0_count     (w_memory_0_count         ),
  .i_memory_0_new_data  (r_memory_0_new_data      ),
  .o_memory_0_empty     (w_memory_0_empty         ),

  .o_default_mem_0_base (w_default_mem_0_base     ),

  .i_memory_1_base      (r_memory_1_base          ),
  .i_memory_1_size      (r_memory_1_size          ),
  .o_memory_1_count     (w_memory_1_count         ),
  .i_memory_1_new_data  (r_memory_1_new_data      ),
  .o_memory_1_empty     (w_memory_1_empty         ),

  .o_default_mem_1_base (w_default_mem_1_base     ),

  .o_read_finished      (w_read_finished          ),

  //master control signal for memory arbitration
  .o_mem_we             (mem_o_we                 ),
  .o_mem_stb            (mem_o_stb                ),
  .o_mem_cyc            (mem_o_cyc                ),
  .o_mem_sel            (mem_o_sel                ),
  .o_mem_adr            (mem_o_adr                ),
  .o_mem_dat            (mem_o_dat                ),
  .i_mem_dat            (mem_i_dat                ),
  .i_mem_ack            (mem_i_ack                ),
  .i_mem_int            (mem_i_int                ),

  //Ping Pong FIFO Interface
  .i_ppfifo_rdy         (wfifo_ready              ),
  .o_ppfifo_act         (wfifo_activate           ),
  .i_ppfifo_size        (wfifo_size               ),
  .o_ppfifo_stb         (wfifo_strobe             ),
  .o_ppfifo_data        (wfifo_data               )
);


//Asynchronous Logic
assign        w_enable                = control[`CONTROL_ENABLE];
assign        w_enable_interrupt      = control[`CONTROL_ENABLE_INTERRUPT];
assign        w_command_mode          = control[`CONTROL_COMMAND_MODE];
assign        w_backlight_enable      = control[`CONTROL_BACKLIGHT_ENABLE];
assign        w_reset_display         = control[`CONTROL_RESET_DISPLAY];
assign        w_cmd_write_stb         = control[`CONTROL_COMMAND_WRITE];
assign        w_cmd_read_stb          = control[`CONTROL_COMMAND_READ];
assign        w_cmd_parameter         = control[`CONTROL_COMMAND_PARAMETER];
assign        w_write_override        = control[`CONTROL_WRITE_OVERRIDE];
assign        w_chip_select           = control[`CONTROL_CHIP_SELECT];
assign        w_enable_tearing        = control[`CONTROL_ENABLE_TEARING];


assign        status[`STATUS_MEMORY_0_EMPTY]  = w_memory_0_empty;
assign        status[`STATUS_MEMORY_1_EMPTY]  = w_memory_1_empty;
assign        status[31:2]          = 0;

//assign        debug[1:0]            = wfifo_ready;
//assign        debug[3:2]            = wfifo_activate;
//assign        debug[4]              = wfifo_strobe;
//assign        debug[5]              = wfifo_data[31];
//assign        debug[31:16]          = wfifo_data[23:8];

//blocks
always @ (posedge clk) begin
  if (rst) begin
    o_wbs_dat       <=  32'h0;
    o_wbs_ack       <=  0;
    timeout_enable  <=  0;
    timeout_value   <=  `DEFAULT_MEMORY_TIMEOUT;

    control         <=  0;

    r_cmd_data_out  <=  0;

    //Default base, user can change this from the API
    r_memory_0_base <=  w_default_mem_0_base;
    r_memory_1_base <=  w_default_mem_1_base;

    //Nothing in the memory initially
    r_memory_0_size <=  0;
    r_memory_1_size <=  0;

    r_memory_0_new_data <=  0;
    r_memory_1_new_data <=  0;

  end

  else begin
    r_memory_0_new_data <=  0;
    r_memory_1_new_data <=  0;

    //Reset bits that need resetting
    if (w_cmd_write_stb) begin
      control[`CONTROL_COMMAND_WRITE] <=  0;
    end
    if (w_cmd_read_stb) begin
      control[`CONTROL_COMMAND_READ] <=  0;
    end

    //when the master acks our ack, then put our ack down
    if (o_wbs_ack & ~i_wbs_stb)begin
      o_wbs_ack <= 0;
    end

    if (i_wbs_stb & i_wbs_cyc) begin
      //master is requesting somethign
      if (i_wbs_we) begin
        //write request
        case (i_wbs_adr)
          REG_CONTROL: begin
            control               <=  i_wbs_dat;
            if (i_wbs_dat[`CONTROL_ENABLE] && !w_enable) begin
              $display ("-----------------------------------------------------------");
              $display ("WB_NH_LCD: Core Enable");
              $display ("-----------------------------------------------------------");
            end
          end
          REG_COMMAND_DATA: begin
            r_cmd_data_out        <=  i_wbs_dat[7:0];
          end
          REG_PIXEL_COUNT: begin
            r_num_pixels          <=  i_wbs_dat;
          end
          REG_MEM_0_BASE: begin
            r_memory_0_base       <=  i_wbs_dat;
          end
          REG_MEM_0_SIZE: begin
            r_memory_0_size       <=  i_wbs_dat;
            if (i_wbs_dat > 0) begin
              r_memory_0_new_data <=  1;
            end
          end
          REG_MEM_1_BASE: begin
            r_memory_1_base       <=  i_wbs_dat;
          end
          REG_MEM_1_SIZE: begin
            r_memory_1_size       <=  i_wbs_dat;
            if (i_wbs_dat > 0) begin
              r_memory_1_new_data <=  1;
            end
          end
          default: begin
          end
        endcase
      end

      else begin
        //read request
        case (i_wbs_adr)
          REG_CONTROL: begin
            o_wbs_dat <= control;
          end
          REG_STATUS: begin
            o_wbs_dat <= status;
          end
          REG_COMMAND_DATA: begin
            //This will probably be read so fast that I won't have to check
            //the ready flag
            o_wbs_dat <= w_cmd_data_in;
          end
          REG_PIXEL_COUNT: begin
            o_wbs_dat <=  r_num_pixels;
          end
          REG_MEM_0_BASE: begin
            o_wbs_dat <=  r_memory_0_base;
          end
          REG_MEM_0_SIZE: begin
            o_wbs_dat <=  w_memory_0_count;
          end
          REG_MEM_1_BASE: begin
            o_wbs_dat <=  r_memory_1_base;
          end
          REG_MEM_1_SIZE: begin
            o_wbs_dat <=  w_memory_1_count;
          end
          //add as many ADDR_X you need here
          default: begin
            o_wbs_dat <=  32'h00;
          end
        endcase
      end
      o_wbs_ack <= 1;
    end
  end
end

//initerrupt controller
always @ (posedge clk) begin
  if (rst) begin
    o_wbs_int <=  0;
  end
  else if (w_enable) begin
    if (!w_memory_0_empty && !w_memory_1_empty) begin
      o_wbs_int <=  0;
    end
    if (i_wbs_stb) begin
      //de-assert the interrupt on wbs transactions so I can launch another
      //interrupt when the wbs is de-asserted
      o_wbs_int <=  0;
    end
    else if (w_memory_0_empty || w_memory_1_empty) begin
      o_wbs_int <=  1;
    end
  end
  else begin
    //if we're not enable de-assert interrupt
    o_wbs_int <=  0;
  end
end

always @ (posedge clk) begin
  if (wfifo_strobe) begin
    $display ("\tI2S MEM CONTROLLER: Wrote: %h: Request: %h", wfifo_data, wfifo_size);
  end
end
endmodule
