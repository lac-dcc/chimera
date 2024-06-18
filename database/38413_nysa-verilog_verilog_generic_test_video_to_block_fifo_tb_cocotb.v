// This program was cloned from: https://github.com/CospanDesign/nysa-verilog
// License: MIT License

`timescale 1ns/1ps

module tb_cocotb #(
  parameter INVERT_AXI_RESET    = 1,
  parameter FIFO_WIDTH          = 9,
  parameter INVERT_RST          = 1,
  parameter AXIS_WIDTH          = 24,
  parameter AXIS_STROBE_WIDTH   = (AXIS_WIDTH / 8),

  parameter CLOCK_RATE          = 1,
  parameter FRAME_WIDTH         = 270,
  parameter FRAME_HEIGHT        = 270,
  parameter X_OFFSET            = 5,
  parameter Y_OFFSET            = 3,
  parameter BG_COLOR            = 8'h00,
  parameter HBLANK              = 10,
  parameter VBLANK              = 10
)(

  input       [31:0]                      test_id,

  input                                   clk,
  input                                   rst,
  input                                   rd_clk,

  input                                   i_enable,

  //PPU Interface
  output      [9:0]                       PPU_X_OUT,
  output      [9:0]                       PPU_Y_OUT,
  output      [9:0]                       PPU_Y_NEXT_OUT,
  output                                  PPU_PULSE_OUT,
  output                                  PPU_VBLANK,
  input       [5:0]                       PPU_SYS_PALETTE,

  //AXI Stream Output
  output      [AXIS_WIDTH - 1:0]          AXISS_TDATA,
  input                                   AXISS_TREADY,
  output                                  AXISS_TVALID,
  output                                  AXISS_TLAST,
  output      [AXIS_STROBE_WIDTH - 1: 0]  AXISS_TKEEP,
  output      [AXIS_STROBE_WIDTH - 1: 0]  AXISS_TSTRB,
  output      [3:0]                       AXISS_TID,
  output      [31:0]                      AXISS_TDEST,
  output      [3:0]                       AXISS_TUSER
);

//Local Parameters

//Registers/Wires
reg                   r_rst;

wire                  w_rst;
wire                  w_rst_invert = INVERT_AXI_RESET;

//write side
wire                  w_video_hsync;
wire                  w_video_sof_stb;
wire  [7:0]           w_video_red;
wire  [7:0]           w_video_green;
wire  [7:0]           w_video_blue;

wire  [2:0]           w_ppu_red;
wire  [2:0]           w_ppu_green;
wire  [1:0]           w_ppu_blue;

wire                  w_ppfifo_rdy;
wire                  w_ppfifo_act;
wire                  w_ppfifo_stb;
wire  [AXIS_WIDTH:0]  w_ppfifo_data;
wire  [23:0]          w_ppfifo_size;

//Submodules
rgb_generator #(
  //.CLOCK_RATE           (9480000            ),
  .CLOCK_RATE           (CLOCK_RATE           ),
  .FPS                  (60                   ),

  .FRAME_WIDTH          (FRAME_WIDTH          ),
  .FRAME_HEIGHT         (FRAME_HEIGHT         ),
  .X_OFFSET             (X_OFFSET             ),
  .Y_OFFSET             (Y_OFFSET             ),
  .BG_COLOR             (BG_COLOR             ),
  .HBLANK               (HBLANK               ),
  .VBLANK               (VBLANK               )

)rgbg (
  .clk                  (clk                  ),
  .rst                  (w_rst                ),

  .o_nes_x_out          (PPU_X_OUT            ),
  .o_nes_y_out          (PPU_Y_OUT            ),
  .o_nes_y_next_out     (PPU_Y_NEXT_OUT       ),
  .o_pix_pulse_out      (PPU_PULSE_OUT        ),
  .o_vblank             (PPU_VBLANK           ),

  .i_sys_palette_idx_in (PPU_SYS_PALETTE      ),

  .o_video_hsync        (w_video_hsync        ),
  .o_sof_stb            (w_video_sof_stb      ),
  .o_r_out              (w_ppu_red            ),
  .o_g_out              (w_ppu_green          ),
  .o_b_out              (w_ppu_blue           )

);

video_to_block_fifo #(
  .BUFFER_SIZE          (FIFO_WIDTH           )
)v2bf(
  //universal input
  .clk                  (clk                  ),
  .rst                  (w_rst                ),

  .i_enable             (i_enable             ),

  //Video In
  .i_video_sof_stb      (w_video_sof_stb      ),
  .i_video_hsync        (w_video_hsync        ),
  .i_red                (w_video_red          ),
  .i_green              (w_video_green        ),
  .i_blue               (w_video_blue         ),

  //Read Path
  .i_rfifo_clk          (rd_clk               ),
  .i_rfifo_rst          (w_rst                ),
  .o_rfifo_ready        (w_ppfifo_rdy         ),
  .i_rfifo_activate     (w_ppfifo_act         ),
  .i_rfifo_strobe       (w_ppfifo_stb         ),
  .o_rfifo_data         (w_ppfifo_data        ),
  .o_rfifo_size         (w_ppfifo_size        )
);


adapter_ppfifo_2_axi_stream #(
  .DATA_WIDTH           (AXIS_WIDTH           )
) ap2as (

  .rst                  (w_rst                ),

  //Ping Poing FIFO Read Interface
  .i_ppfifo_rdy         (w_ppfifo_rdy         ),
  .o_ppfifo_act         (w_ppfifo_act         ),
  .o_ppfifo_stb         (w_ppfifo_stb         ),
  .i_ppfifo_data        (w_ppfifo_data        ),
  .i_ppfifo_size        (w_ppfifo_size        ),

  .i_axi_clk            (rd_clk               ),
  .o_axi_user           (AXISS_TUSER          ),
  .i_axi_ready          (AXISS_TREADY         ),
  .o_axi_data           (AXISS_TDATA          ),
  .o_axi_last           (AXISS_TLAST          ),
  .o_axi_valid          (AXISS_TVALID         )
);


//There is a timing thing in COCOTB when stiumlating a signal, sometimes it can be corrupted if not registered
always @ (*) r_rst          = rst;
assign  w_rst               = w_rst_invert ? ~r_rst: r_rst;

assign  w_video_red         = {w_ppu_red,   5'h0};
assign  w_video_blue        = {w_ppu_blue,  5'h0};
assign  w_video_green       = {w_ppu_green, 6'h0};

//Submodules
//Asynchronous Logic
//Synchronous Logic
//Simulation Control
initial begin
  $dumpfile ("design.vcd");
  $dumpvars(0, tb_cocotb);
end

endmodule
