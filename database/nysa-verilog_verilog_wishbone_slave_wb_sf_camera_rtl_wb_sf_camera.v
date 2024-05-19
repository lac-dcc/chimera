// This program was cloned from: https://github.com/CospanDesign/nysa-verilog
// License: MIT License

//wb_sf_camera.v
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
  SDB_DEVICE_ID:0x00000006

  Set the version of the Core XX.XXX.XXX Example: 01.000.000
  SDB_CORE_VERSION:00.000.001

  Set the Device Name: (19 UNICODE characters)
  SDB_NAME:wb_sf_camera

  Set the class of the device (16 bits) Set as 0
  SDB_ABI_CLASS:0

  Set the ABI Major Version: (8-bits)
  SDB_ABI_VERSION_MAJOR:0x0E

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

`include "sf_camera_defines.v"

module wb_sf_camera #(
  parameter           BUFFER_SIZE = 12
)(
  input               clk,
  input               rst,

  //Add signals to control your device here
  output      [31:0]  debug,

  //Wishbone Bus Signals
  input               i_wbs_we,
  input               i_wbs_cyc,
  input       [3:0]   i_wbs_sel,
  input       [31:0]  i_wbs_dat,
  input               i_wbs_stb,
  output  reg         o_wbs_ack,
  output  reg [31:0]  o_wbs_dat,
  input       [31:0]  i_wbs_adr,
  output  reg         o_wbs_int,

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


  output              o_cam_rst,
  output              o_flash,

  output              o_cam_in_clk,
  input               i_pix_clk,
  input               i_flash_strobe,
  input               i_vsync,
  input               i_hsync,
  input       [7:0]   i_pix_data

);


//Local Parameters
localparam          CONTROL             = 32'h00000000;
localparam          STATUS              = 32'h00000001;
localparam          PIXEL_COUNT         = 32'h00000002;
localparam          ROW_COUNT           = 32'h00000003;
localparam          REG_MEM_0_BASE      = 32'h00000004;
localparam          REG_MEM_0_SIZE      = 32'h00000005;
localparam          REG_MEM_1_BASE      = 32'h00000006;
localparam          REG_MEM_1_SIZE      = 32'h00000007;



//Local Registers/Wires

//Control
reg         [31:0]  control;
wire        [31:0]  status;

wire                w_auto_flash;
wire                w_enable;
wire                w_enable_interrupt;
wire                w_manual_flash_on;
wire                w_camera_reset;
wire                w_reset_counts;


//Get the Memory write controller
//nysa/cbuilder/verilog/wishbone/wb_ppfifo_2_mem/sim/test_wb_ppfifo_2_mem.v
reg         [31:0]  r_memory_0_base;
reg         [31:0]  r_memory_0_size;
wire        [31:0]  w_memory_0_count;
reg                 r_memory_0_ready;
wire                w_memory_0_finished;
wire                w_memory_0_empty;

wire        [31:0]  w_default_mem_0_base;

reg         [31:0]  r_memory_1_base;
reg         [31:0]  r_memory_1_size;
wire        [31:0]  w_memory_1_count;
reg                 r_memory_1_ready;
wire                w_memory_1_finished;
wire                w_memory_1_empty;

wire        [31:0]  w_default_mem_1_base;

wire                w_write_finished;

wire                w_rfifo_ready;
wire                w_rfifo_activate;
wire                w_rfifo_strobe;
wire        [31:0]  w_rfifo_data;
wire        [23:0]  w_rfifo_size;
wire                w_captured;
wire                w_busy;
wire                w_locked;

wire        [31:0]  w_row_count;
wire        [31:0]  w_pixel_count;
reg                 r_flush_memory;
wire                w_inactive;

wire                w_memory_idle;
wire                w_image_debug_en;



//Submodules
wb_ppfifo_2_mem p2m(

  .clk                  (clk                      ),
  .rst                  (rst  || !w_camera_reset  ),
  .debug                (debug                    ),

  //Control
  .i_enable             (w_enable                 ),
  .i_flush              (r_flush_memory           ),

  .i_memory_0_base      (r_memory_0_base          ),
  .i_memory_0_size      (r_memory_0_size          ),
  .o_memory_0_count     (w_memory_0_count         ),
  .i_memory_0_ready     (r_memory_0_ready         ),
  .o_memory_0_finished  (w_memory_0_finished      ),
  .o_memory_0_empty     (w_memory_0_empty         ),

  .o_default_mem_0_base (w_default_mem_0_base     ),

  .i_memory_1_base      (r_memory_1_base          ),
  .i_memory_1_size      (r_memory_1_size          ),
  .o_memory_1_count     (w_memory_1_count         ),
  .i_memory_1_ready     (r_memory_1_ready         ),
  .o_memory_1_finished  (w_memory_1_finished      ),
  .o_memory_1_empty     (w_memory_1_empty         ),

  .o_default_mem_1_base (w_default_mem_1_base     ),

  .o_write_finished     (w_write_finished         ),

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

  //Ping Pong FIFO Interface (Read)
  .i_ppfifo_rdy         (w_rfifo_ready            ),
  .o_ppfifo_act         (w_rfifo_activate         ),
  .i_ppfifo_size        (w_rfifo_size             ),
  .o_ppfifo_stb         (w_rfifo_strobe           ),
  .i_ppfifo_data        (w_rfifo_data             )
);

sf_camera#(
  .BUFFER_SIZE          (BUFFER_SIZE              )
) camera(
  .clk                  (clk                      ),
  .rst                  (rst                      ),
  //.debug                (debug                    ),

  //Ping Pong FIFO Signals
  .o_rfifo_ready        (w_rfifo_ready            ),
  .i_rfifo_activate     (w_rfifo_activate         ),
  .i_rfifo_strobe       (w_rfifo_strobe           ),
  .o_rfifo_data         (w_rfifo_data             ),
  .o_rfifo_size         (w_rfifo_size             ),

  //Control
  .i_camera_reset       (w_camera_reset           ),
  .i_auto_flash         (w_auto_flash             ),
  .i_manual_flash_on    (w_manual_flash_on        ),
  .i_enable             (w_enable                 ),
  .i_reset_counts       (w_reset_counts           ),
  .i_memory_ready       (w_memory_ready           ),
  .o_inactive           (w_inactive               ),
  .i_image_debug_en     (w_image_debug_en         ),

  //Status
  .o_captured           (w_captured               ),
  .o_busy               (w_busy                   ),
  .o_row_count          (w_row_count              ),
  .o_pixel_count        (w_pixel_count            ),
  .o_clk_locked         (w_locked                 ),

  //Physical Interface
  .o_cam_rst            (o_cam_rst                ),
  .o_flash              (o_flash                  ),

  .o_cam_in_clk         (o_cam_in_clk             ),
  .i_pix_clk            (i_pix_clk                ),
  .i_flash_strobe       (i_flash_strobe           ),
  .i_vsync              (i_vsync                  ),
  .i_hsync              (i_hsync                  ),
  .i_pix_data           (i_pix_data               )
);





//Asynchronous Logic
assign  w_enable            = control[`CONTROL_ENABLE];
assign  w_enable_interrupt  = control[`CONTROL_ENABLE_INTERRUPT];
assign  w_auto_flash        = control[`CONTROL_AUTO_FLASH];
assign  w_manual_flash_on   = control[`CONTROL_MANUAL_FLASH_ON];
assign  w_camera_reset      = control[`CONTROL_CAMERA_RESET];
assign  w_reset_counts      = control[`CONTROL_RESET_COUNTS];
assign  w_image_debug_en    = control[`CONTROL_IMAGE_DEBUG];


//assign  status[`STATUS_MEMORY_0_FINISHED]   = w_memory_0_finished;
//assign  status[`STATUS_MEMORY_1_FINISHED]   = w_memory_1_finished;
//assign  status[`STATUS_IMAGE_CAPTURED]      = w_captured;
//assign  status[`STATUS_BUSY]                = w_busy;
//assign  status[`STATUS_DCM_LOCKED]          = w_locked;
//assign  status[`STATUS_ENABLE]              = w_enable;
//assign  status[`STATUS_MEMORY_0_EMPTY]      = w_memory_0_empty;
//assign  status[`STATUS_MEMORY_1_EMPTY]      = w_memory_1_empty;
assign  status                              = { 24'h0,
                                                (r_memory_1_size == 0),
                                                (r_memory_0_size == 0),
                                                w_captured,
                                                w_busy,
                                                w_locked,
                                                w_enable,
                                                w_memory_1_finished,
                                                w_memory_0_finished
                                              };

assign w_memory_ready                       = (!w_memory_0_empty) || (!w_memory_1_empty);


//assign w_default_mem_0_base                 = `DEFAULT_MEM_0_BASE;
//assign w_default_mem_1_base                 = `DEFAULT_MEM_1_BASE;

//Synchronous Logic
always @ (posedge clk) begin
  if (rst) begin
    o_wbs_int           <=  0;
  end
  else if (w_enable) begin
    if (i_wbs_stb) begin
      o_wbs_int         <=  0;
    end
    else if (w_memory_0_finished || w_memory_1_finished) begin
      o_wbs_int         <=  1;
    end
    else if (!w_memory_0_finished && !w_memory_1_finished) begin
      o_wbs_int         <=  0;
    end
  end
  else begin
    o_wbs_int           <=  0;
  end
end
always @ (posedge clk) begin
  if (rst) begin
    o_wbs_dat           <= 32'h0;
    o_wbs_ack           <= 0;
    control             <=  0;

    //Default base, user can change this from the API
    r_memory_0_base     <=  w_default_mem_0_base;
    r_memory_1_base     <=  w_default_mem_1_base;

    //Nothing in the memory initially
    r_memory_0_size     <=  0;
    r_memory_1_size     <=  0;

    r_memory_0_ready    <=  0;
    r_memory_1_ready    <=  0;

  end
  else begin
    r_memory_0_ready    <=  0;
    r_memory_1_ready    <=  0;

    //when the master acks our ack, then put our ack down
    if (o_wbs_ack && ~i_wbs_stb)begin
      o_wbs_ack <= 0;
    end

    if (i_wbs_stb && i_wbs_cyc) begin
      //master is requesting somethign
      if (i_wbs_we) begin
        //write request
        case (i_wbs_adr)
          CONTROL: begin
            $display("ADDR: %h user wrote %h", i_wbs_adr, i_wbs_dat);
            control               <=  i_wbs_dat;
          end
          STATUS: begin
            $display("ADDR: %h user wrote %h", i_wbs_adr, i_wbs_dat);
          end
          REG_MEM_0_BASE: begin
            r_memory_0_base       <=  i_wbs_dat;
          end
          REG_MEM_0_SIZE: begin
            r_memory_0_size       <=  i_wbs_dat;
            if (i_wbs_dat > 0) begin
              r_memory_0_ready    <=  1;
            end
          end
          REG_MEM_1_BASE: begin
            r_memory_1_base       <=  i_wbs_dat;
          end
          REG_MEM_1_SIZE: begin
            r_memory_1_size       <=  i_wbs_dat;
            if (i_wbs_dat > 0) begin
              r_memory_1_ready    <=  1;
            end
          end

          default: begin
          end
        endcase
      end
      else begin
        if (!o_wbs_ack) begin //Fix double reads
          //read request
          case (i_wbs_adr)
            CONTROL: begin
              $display("user read %h", CONTROL);
              o_wbs_dat           <= control;
            end
            STATUS: begin
              $display("user read %h", STATUS);
              o_wbs_dat           <= status;
              if (w_memory_0_finished) begin
                $display ("Reset size 0");
                r_memory_0_size   <=  0;
              end
              if (w_memory_1_finished) begin
                $display ("Reset size 1");
                r_memory_1_size   <=  0;
              end
            end
            PIXEL_COUNT: begin
              o_wbs_dat <=  w_pixel_count;
            end
            ROW_COUNT: begin
              o_wbs_dat <=  w_row_count;
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
            default: begin
              o_wbs_dat <=  32'h00;
            end
          endcase
        end
      end
      o_wbs_ack <= 1;
    end
  end
end

reg r_captured_en;

assign w_memory_idle = (r_memory_0_size > 32'h0) ? (w_memory_0_count == 32'h0):
                       (r_memory_1_size > 32'h0) ? (w_memory_1_count == 32'h0):
                       1;


always @ (posedge clk) begin
  if (rst) begin
    r_flush_memory      <=  0;
    r_captured_en       <=  0;
  end
  else begin
    r_flush_memory      <=  0;
    if (w_captured) begin
      r_captured_en     <=  1;
    end
    //Find the conditions in which we need to strobe r_flush_memory
    if (w_inactive && r_captured_en) begin
      r_flush_memory      <=  1;
      if (w_memory_idle) begin
        r_flush_memory    <=  1;
        r_captured_en     <=  0;
      end
    end
  end
end

//Wishbone Memory Master
endmodule
