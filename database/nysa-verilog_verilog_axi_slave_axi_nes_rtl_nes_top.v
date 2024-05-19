// This program was cloned from: https://github.com/CospanDesign/nysa-verilog
// License: MIT License

/***************************************************************************************************
** fpga_nes/hw/src/nes_top.v
*
*  Copyright (c) 2012, Brian Bennett
*  All rights reserved.
*
*  Redistribution and use in source and binary forms, with or without modification, are permitted
*  provided that the following conditions are met:
*
*  1. Redistributions of source code must retain the above copyright notice, this list of conditions
*     and the following disclaimer.
*  2. Redistributions in binary form must reproduce the above copyright notice, this list of
*     conditions and the following disclaimer in the documentation and/or other materials provided
*     with the distribution.
*
*  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR
*  IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND
*  FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
*  CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
*  DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
*  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
*  WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY
*  WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*
*  Top level module for an fpga-based Nintendo Entertainment System emulator.
***************************************************************************************************/
`timescale 1 ns/1 ps

module nes_top #(
  parameter           CLOCK_RATE    = 100000000,

  // Video Configuration
  parameter           FPS           = 60,
  parameter           FRAME_WIDTH   = 480,
  parameter           FRAME_HEIGHT  = 272,
  parameter           X_OFFSET      = 112,
  parameter           Y_OFFSET      = 6,
  parameter           BG_COLOR      = 8'h00
)(
  input               clk,                  // 100MHz system clock signal
  input               rst,                  // reset push button
  input               i_console_reset,      // console reset
  input       [3:0]   i_mute_control,       // switches

  // Video Interface
  output              o_video_hsync,          // Video Active
  output              o_sof_stb,            // Start of frame strobe
  output      [2:0]   o_red,                // vga red signal
  output      [2:0]   o_green,              // vga green signal
  output      [1:0]   o_blue,               // vga blue signal

  // Joypad signals.
  input       [7:0]   i_jp1_state,          // State of joypad 1
  input       [7:0]   i_jp2_state,          // State of joypad 2

  // Audio Interface
  output              o_audio,              // pwm output audio channel

  // Host Controller Interface
  input               i_hci_reset,
  input       [7:0]   i_hci_opcode,
  input               i_hci_opcode_strobe,

  output      [15:0]  o_hci_opcode_status,
  output              o_hci_opcode_ack,

  input       [15:0]  i_hci_address,
  input       [31:0]  i_hci_count,

  input               i_hci_data_strobe,
  output              o_hci_sm_ready,
  input       [7:0]   i_hci_data,

  output              o_hci_data_strobe,
  input               i_hci_host_ready,
  output      [7:0]   o_hci_data
);

//
// System Memory Buses
//
wire [ 7:0] cpumc_din;
wire [15:0] cpumc_a;
wire        cpumc_r_nw;

wire [ 7:0] ppumc_din;
wire [13:0] ppumc_a;
wire        ppumc_wr;

//
// RP2A03: Main processing chip including CPU, APU, joypad control, and sprite DMA control.
//
wire        rp2a03_rdy;
wire [ 7:0] rp2a03_din;
wire        rp2a03_nnmi;
wire [ 7:0] rp2a03_dout;
wire [15:0] rp2a03_a;
wire        rp2a03_r_nw;
wire        rp2a03_brk;
wire [ 3:0] rp2a03_dbgreg_sel;
wire [ 7:0] rp2a03_dbgreg_din;
wire        rp2a03_dbgreg_wr;
wire [ 7:0] rp2a03_dbgreg_dout;

rp2a03 rp2a03_blk(
  .clk_in         (clk                ),
  .rst_in         (rst                ),
  .rdy_in         (rp2a03_rdy         ),
  .nres_in        (~i_console_reset   ),
  .nnmi_in        (rp2a03_nnmi        ),

  .r_nw_out       (rp2a03_r_nw        ),
  .a_out          (rp2a03_a           ),

  .d_in           (rp2a03_din         ),
  .d_out          (rp2a03_dout        ),
  .brk_out        (rp2a03_brk         ),

  .i_jp1_state    (i_jp1_state        ),
  .i_jp2_state    (i_jp2_state        ),
  .mute_in        (i_mute_control     ),

  .audio_out      (o_audio            ),
  .dbgreg_sel_in  (rp2a03_dbgreg_sel  ),
  .dbgreg_d_in    (rp2a03_dbgreg_din  ),
  .dbgreg_wr_in   (rp2a03_dbgreg_wr   ),
  .dbgreg_d_out   (rp2a03_dbgreg_dout )
);

//
// CART: cartridge emulator
//
wire        cart_prg_nce;
wire [ 7:0] cart_prg_dout;
wire [ 7:0] cart_chr_dout;
wire        cart_ciram_nce;
wire        cart_ciram_a10;
wire [39:0] cart_cfg;
wire        cart_cfg_upd;

cart cart_blk(
  .clk_in        (clk            ),
  .cfg_in        (cart_cfg       ),
  .cfg_upd_in    (cart_cfg_upd   ),
  .prg_nce_in    (cart_prg_nce   ),
  .prg_a_in      (cpumc_a[14:0]  ),
  .prg_r_nw_in   (cpumc_r_nw     ),
  .prg_d_in      (cpumc_din      ),
  .prg_d_out     (cart_prg_dout  ),
  .chr_a_in      (ppumc_a        ),
  .chr_r_nw_in   (~ppumc_wr      ),
  .chr_d_in      (ppumc_din      ),
  .chr_d_out     (cart_chr_dout  ),
  .ciram_nce_out (cart_ciram_nce ),
  .ciram_a10_out (cart_ciram_a10 )
);

assign cart_prg_nce = ~cpumc_a[15];

//
// WRAM: internal work ram
//
wire       wram_en;
wire [7:0] wram_dout;

wram wram_blk(
  .clk_in  (clk           ),
  .en_in   (wram_en       ),
  .r_nw_in (cpumc_r_nw    ),
  .a_in    (cpumc_a[10:0] ),
  .d_in    (cpumc_din     ),
  .d_out   (wram_dout     )
);

assign wram_en = (cpumc_a[15:13] == 0);

//
// VRAM: internal video ram
//
wire [10:0] vram_a;
wire [ 7:0] vram_dout;

vram vram_blk(
  .clk_in  (clk             ),
  .en_in   (~cart_ciram_nce ),
  .r_nw_in (~ppumc_wr       ),
  .a_in    (vram_a          ),
  .d_in    (ppumc_din       ),
  .d_out   (vram_dout       )
);

//
// PPU: picture processing unit block.
//
wire [ 2:0] ppu_ri_sel;     // ppu register interface reg select
wire        ppu_ri_ncs;     // ppu register interface enable
wire        ppu_ri_r_nw;    // ppu register interface read/write select
wire [ 7:0] ppu_ri_din;     // ppu register interface data input
wire [ 7:0] ppu_ri_dout;    // ppu register interface data output

wire [13:0] ppu_vram_a;     // ppu video ram address bus
wire        ppu_vram_wr;    // ppu video ram read/write select
wire [ 7:0] ppu_vram_din;   // ppu video ram data bus (input)
wire [ 7:0] ppu_vram_dout;  // ppu video ram data bus (output)

wire        ppu_nvbl;       // ppu /VBL signal.

// PPU snoops the CPU address bus for register reads/writes.  Addresses 0x2000-0x2007
// are mapped to the PPU register space, with every 8 bytes mirrored through 0x3FFF.
assign ppu_ri_sel  = cpumc_a[2:0];
assign ppu_ri_ncs  = (cpumc_a[15:13] == 3'b001) ? 1'b0 : 1'b1;
assign ppu_ri_r_nw = cpumc_r_nw;
assign ppu_ri_din  = cpumc_din;

ppu #(
  .CLOCK_RATE           (CLOCK_RATE         ),
  .FPS                  (FPS                ),

  //Should be at the center of the screen
  .FRAME_WIDTH          (FRAME_WIDTH        ),
  .FRAME_HEIGHT         (FRAME_HEIGHT       ),
  .X_OFFSET             (X_OFFSET           ),
  .Y_OFFSET             (Y_OFFSET           ),
  .BG_COLOR             (BG_COLOR           )
)ppu_blk(
  .clk_in               (clk                ),
  .rst_in               (rst                ),
  .ri_sel_in            (ppu_ri_sel         ),
  .ri_ncs_in            (ppu_ri_ncs         ),
  .ri_r_nw_in           (ppu_ri_r_nw        ),
  .ri_d_in              (ppu_ri_din         ),

  //Video
  .o_video_hsync        (o_video_hsync      ),
  .o_sof_stb            (o_sof_stb          ),
  .o_r_out              (o_red              ),
  .o_g_out              (o_green            ),
  .o_b_out              (o_blue             ),

  //VRAM
  .ri_d_out             (ppu_ri_dout        ),
  .nvbl_out             (ppu_nvbl           ),
  .vram_a_out           (ppu_vram_a         ),
  .vram_d_in            (ppu_vram_din       ),
  .vram_d_out           (ppu_vram_dout      ),
  .vram_wr_out          (ppu_vram_wr        )
);

assign vram_a = { cart_ciram_a10, ppumc_a[9:0] };

//
// HCI: host communication interface block.  Interacts with NesDbg software through serial port.
//
wire        hci_active;
wire [ 7:0] hci_cpu_din;
wire [ 7:0] hci_cpu_dout;
wire [15:0] hci_cpu_a;
wire        hci_cpu_r_nw;
wire [ 7:0] hci_ppu_vram_din;
wire [ 7:0] hci_ppu_vram_dout;
wire [15:0] hci_ppu_vram_a;
wire        hci_ppu_vram_wr;

nes_hci hci_blk(
  .clk                  (clk                  ),
  .rst                  (rst                  ),

  //Host Interface
  .i_reset_sm           (i_hci_reset          ),
  .i_opcode             (i_hci_opcode         ),
  .i_opcode_strobe      (i_hci_opcode_strobe  ),

  .o_opcode_status      (o_hci_opcode_status  ),
  .o_opcode_ack         (o_hci_opcode_ack     ),

  .i_address            (i_hci_address        ),
  .i_count              (i_hci_count          ),


  .i_data_strobe        (i_hci_data_strobe    ),
  .o_hci_ready          (o_hci_sm_ready       ),
  .i_data               (i_hci_data           ),


  .o_data_strobe        (o_hci_data_strobe    ),
  .i_host_ready         (i_hci_host_ready     ),
  .o_data               (o_hci_data           ),

  //NES Interface
  .i_cpu_break          (rp2a03_brk           ),
  .o_cpu_r_nw           (hci_cpu_r_nw         ),     //CPU Read/!Write Pin
  .o_cpu_address        (hci_cpu_a            ),
  .i_cpu_din            (hci_cpu_din          ),
  .o_cpu_dout           (hci_cpu_dout         ),

  .o_dbg_active         (hci_active           ),
  .o_cpu_dbg_reg_wr     (rp2a03_dbgreg_wr     ),
  .o_cpu_dbg_reg_sel    (rp2a03_dbgreg_sel    ),
  .i_cpu_dbg_reg_din    (rp2a03_dbgreg_dout   ),
  .o_cpu_dbg_reg_dout   (rp2a03_dbgreg_din    ),

  .o_ppu_vram_wr        (hci_ppu_vram_wr      ),
  .o_ppu_vram_address   (hci_ppu_vram_a       ),
  .i_ppu_vram_din       (hci_ppu_vram_din     ),
  .o_ppu_vram_dout      (hci_ppu_vram_dout    ),

  .o_cart_cfg           (cart_cfg             ),
  .o_cart_cfg_update    (cart_cfg_upd         )

);

// Mux cpumc signals from rp2a03 or hci blk, depending on debug break state (hci_active).
assign rp2a03_rdy       = (hci_active) ? 1'b0         : 1'b1;
assign cpumc_a          = (hci_active) ? hci_cpu_a    : rp2a03_a;
assign cpumc_r_nw       = (hci_active) ? hci_cpu_r_nw : rp2a03_r_nw;
assign cpumc_din        = (hci_active) ? hci_cpu_dout : rp2a03_dout;

assign rp2a03_din       = cart_prg_dout | wram_dout | ppu_ri_dout;
assign hci_cpu_din      = cart_prg_dout | wram_dout | ppu_ri_dout;

// Mux ppumc signals from ppu or hci blk, depending on debug break state (hci_active).
assign ppumc_a          = (hci_active) ? hci_ppu_vram_a[13:0] : ppu_vram_a;
assign ppumc_wr         = (hci_active) ? hci_ppu_vram_wr      : ppu_vram_wr;
assign ppumc_din        = (hci_active) ? hci_ppu_vram_dout    : ppu_vram_dout;

assign ppu_vram_din     = cart_chr_dout | vram_dout;
assign hci_ppu_vram_din = cart_chr_dout | vram_dout;

// Issue NMI interupt on PPU vertical blank.
assign rp2a03_nnmi      = ppu_nvbl;


endmodule

