// This program was cloned from: https://github.com/atrac17/Toaplan2
// License: GNU General Public License v3.0

/*
* <-- pr4m0d -->
* https://pram0d.com
* https://twitter.com/pr4m0d
* https://github.com/psomashekar
*
* Copyright (c) 2022 Pramod Somashekar
*
* <-- atrac17 -->
* https://coinopcollection.org
* https://twitter.com/_atrac17
* https://github.com/atrac17
*
* Copyright (c) 2022 atrac17
*
* This program is free software: you can redistribute it and/or modify
* it under the terms of the GNU General Public License as published by
* the Free Software Foundation, either version 3 of the License, or
* (at your option) any later version.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
* GNU General Public License for more details.
*
* You should have received a copy of the GNU General Public License
* along with this program.  If not, see <https://www.gnu.org/licenses/>.
*/
module pipibibs_game(
    //clock and reset
    input rst,
    input rst48,
    input rst96,
    input rst24,
    input rst6,
    input clk,
    input clk48,
    input clk96,
    input clk24,
    input clk6,
    output pxl_cen,
    output pxl2_cen,

    //video outputs
    output [7:0] red,
    output [7:0] green,
    output [7:0] blue,
    output       LHBL,
    output       LVBL,
    output       HS,
    output       VS,

    // Control I/O
    input [3:0] start_button,
    input [3:0] coin_input,
    input [9:0] joystick1,
    input [9:0] joystick2,

    // SDRAM interface
    output [21:0] ba0_addr,
    output [21:0] ba1_addr,
    output [21:0] ba2_addr,
    output [21:0] ba3_addr,
    output  [3:0] ba_rd,
    output        ba_wr,
    output [15:0] ba0_din,
    output  [1:0] ba0_din_m,
    input   [3:0] ba_ack,
    input   [3:0] ba_dst,
    input   [3:0] ba_dok,
    input   [3:0] ba_rdy,
    input  [15:0] data_read,

    //ROM loader
    input         downloading,
    output        dwnld_busy,
    input  [25:0] ioctl_addr,
    input   [7:0] ioctl_dout,
    input         ioctl_wr,
    output  [7:0] ioctl_din,
    input         ioctl_ram,
    output [21:0] prog_addr,
    output [15:0] prog_data,
    output  [1:0] prog_mask,
    output  [1:0] prog_ba,
    output        prog_we,
    output        prog_rd,
    input         prog_ack,
    input         prog_dok,
    input         prog_dst,
    input         prog_rdy,

    //dip switches
    input [63:0] status,
    input        service,
    input        dip_pause,
    inout        dip_flip,
    input        dip_test,
    input  [1:0] dip_fxlevel,
    input  [1:0] dip_fmlevel,
    input [31:0] dipsw,

    //sound
    output signed [15:0] snd_left,
    output signed [15:0] snd_right,
    output               sample,
    input                enable_psg,
    input                enable_fm,

    //misc
    output       game_led,
    output       user_led,
    input        gfx_en
);


/*MAIN GLOBALS*/

localparam PIPIBIBS = 3;

wire RESET = rst48;
wire CLK = clk48;
wire CLK96 = clk;
wire CLK24 = clk24;
wire CLK6 = clk6;
wire RESET96 = rst;
wire RESET24 = rst24;
wire RESET6 = rst6;

//GAME selector
wire [7:0] GAME;

wire CEN10;
wire CEN10B;

wire FLIP = GAME==PIPIBIBS ? dipsw[1]: // Screen inversion
            0;

// assign game_led = downloading ? 1'b0 : 1'b1;

/*CLOCKS*/

wire CEN675;
wire CEN675B;
wire CEN1350;
wire CEN1350B;
wire CEN3p375;
wire CEN3p375B;
wire CEN1p6875;
wire CEN1p6875B;

pipibibs_clock u_clocken (
    .CLK(CLK),
    .CLK96(CLK96),
    .CLK24(CLK24),
    .CLK6(CLK6),
    .CEN675(CEN675),
    .CEN675B(CEN675B),
    .CEN3p375(CEN3p375),
    .CEN3p375B(CEN3p375B),
    .CEN1p6875(CEN1p6875),
    .CEN1p6875B(CEN1p6875B),
    .CEN1350(CEN1350),
    .CEN1350B(CEN1350B)
);

assign pxl_cen = CEN675;
assign pxl2_cen = CEN1350;

/*MEMORY CONNECTS*/

//68K ROM
wire        ROM68K_CS;
wire        ROM68K_OK;
wire [16:0] ROM68K_ADDR;
wire [15:0] ROM68K_DOUT;

//sound
wire        YM3812_CS;
wire        YM3812_WE;
wire        YM3812_WR_CMD;
wire  [7:0] YM3812_DIN;
wire  [7:0] YM3812_DOUT;

//Z80 ROM
wire        ROMZ80_CS;
wire        ROMZ80_OK;
wire [14:0] ROMZ80_ADDR;
wire  [7:0] ROMZ80_DOUT;

//TILE GFX ROM
wire        GFX_CS;
wire        GFX_OK;
wire [21:0] GFX0_ADDR;
wire [31:0] GFX0_DOUT;

wire        GFXSCR0_CS;
wire        GFXSCR0_OK;
wire [21:0] GFX0SCR0_ADDR;
wire [31:0] GFX0SCR0_DOUT;

wire        GFXSCR1_CS;
wire        GFXSCR1_OK;
wire [21:0] GFX0SCR1_ADDR;
wire [31:0] GFX0SCR1_DOUT;

wire        GFXSCR2_CS;
wire        GFXSCR2_OK;
wire [21:0] GFX0SCR2_ADDR;
wire [31:0] GFX0SCR2_DOUT;

//EEPROM
wire EEPROM_SCLK;
wire EEPROM_SCS;
wire EEPROM_SDI;
wire EEPROM_SDO;

/*EXTERNAL DEVICES*/

//gp9001
wire GP9001ACK;
wire GP9001CS, VINT;
wire GP9001_OP_SELECT_REG, GP9001_OP_WRITE_REG, GP9001_OP_WRITE_RAM, GP9001_OP_READ_RAM_H, GP9001_OP_READ_RAM_L, GP9001_OP_SET_RAM_PTR, GP9001_OP_OBJECTBANK_WR;
wire [2:0] GP9001_OBJECTBANK_SLOT;
wire [15:0] CPU_DOUT;
wire [15:0] GCU_DOUT;
wire [10:0] GP9001OUT;

//bus sharing
wire BUSACK;
wire BR = 1'b0;

//dip switch
wire [23:0] DIPSW = GAME == PIPIBIBS ? {dipsw[23:2], 1'b0, dipsw[0]} :   // Screen inversion
                    dipsw[23:0];

wire       DIP_TEST = dip_test;
wire       DIP_PAUSE = dip_pause;
wire [7:0] DIPSW_A;
wire [7:0] DIPSW_B;
wire [7:0] DIPSW_C;

assign { DIPSW_C, DIPSW_B, DIPSW_A } = DIPSW[23:0];

//video timings
wire       HSYNC;
wire       VSYNC;
wire       FBLANK;
wire       LHBLL;
wire       LVBLL;
wire [8:0] V;

//vrams
wire [10:0] PALRAM_ADDR;
wire [15:0] PALRAM_DATA;
wire [10:0] SRAM_ADDR;
wire [7:0] SRAM_DATA;
wire [7:0] SRAM_DIN;
wire SRAM_WE;

    //cpu
pipibibs_cpu u_cpu (
    .CLK(CLK),
    .CLK96(CLK96),
    .CEN10(CEN10),
    .CEN10B(CEN10B),
    .BUSACK(BUSACK),
    .BR(BR),
    .RESET(RESET),
    .RESET96(RESET96),
    .DOUT(CPU_DOUT),
    .LVBL(LVBLL), //this is low active to the CPU
    .V(V),
    .FLIP(FLIP),

    //inputs
    .JOYMODE(0),
    .JOYSTICK1(joystick1),
    .JOYSTICK2(joystick2),
    .START_BUTTON(start_button),
    .COIN_INPUT(coin_input),
    .SERVICE(service),
    .TILT(1'b0),

    //dip switches
    .DIPSW_A(DIPSW_A),
    .DIPSW_B(DIPSW_B),
    .DIPSW_C(DIPSW_C),
    .DIP_TEST(DIP_TEST),
    .DIP_PAUSE(DIP_PAUSE),

    //68k program
    .CPU_PRG_CS(ROM68K_CS),
    .CPU_PRG_OK(ROM68K_OK),
    .CPU_PRG_ADDR(ROM68K_ADDR), //16bit addressing
    .CPU_PRG_DATA(ROM68K_DOUT),

    //gcu communications
    .GP9001CS(GP9001CS),
    .GP9001ACK(GP9001ACK),
    .VINT(VINT),
    .GP9001_OP_SELECT_REG(GP9001_OP_SELECT_REG),
    .GP9001_OP_WRITE_REG(GP9001_OP_WRITE_REG),
    .GP9001_OP_WRITE_RAM(GP9001_OP_WRITE_RAM),
    .GP9001_OP_READ_RAM_H(GP9001_OP_READ_RAM_H),
    .GP9001_OP_READ_RAM_L(GP9001_OP_READ_RAM_L),
    .GP9001_OP_SET_RAM_PTR(GP9001_OP_SET_RAM_PTR),
    .GP9001_DOUT(GCU_DOUT),
    .HSYNC(HSYNC),
    .VSYNC(VSYNC),
    .FBLANK(FBLANK),

    //z80 communications
    .SRAM_ADDR(SRAM_ADDR),
    .SRAM_DATA(SRAM_DATA),
    .SRAM_DIN(SRAM_DIN),
    .SRAM_WE(SRAM_WE),

    //VRAMs
    .PALRAM_ADDR(PALRAM_ADDR),
    .PALRAM_DATA(PALRAM_DATA),

    .GAME(GAME),

    //sound communications
    .YM3812_CS(YM3812_CS),
    .YM3812_WE(YM3812_WE),
    .YM3812_WR_CMD(YM3812_WR_CMD),
    .YM3812_DIN(YM3812_DIN),
    .YM3812_DOUT(YM3812_DOUT)
);

raizing_video u_video(
    .CLK(CLK),
    .CLK96(CLK96),
    .PIXEL_CEN(pxl_cen),
    .RESET(RESET),
    .RESET96(RESET96),
    .SHIFT_SPRITE_PRI(1'b0),
    .FAST_OBJ_QUEUE(1'b0),

    //graphics ROM
    .GFX_CS(GFX_CS),
    .GFX_OK(GFX_OK),
    .GFX0_ADDR(GFX0_ADDR),
    .GFX0_DOUT(GFX0_DOUT),

    .GFXSCR0_CS(GFXSCR0_CS),
    .GFXSCR0_OK(GFXSCR0_OK),
    .GFX0SCR0_ADDR(GFX0SCR0_ADDR),
    .GFX0SCR0_DOUT(GFX0SCR0_DOUT),

    .GFXSCR1_CS(GFXSCR1_CS),
    .GFXSCR1_OK(GFXSCR1_OK),
    .GFX0SCR1_ADDR(GFX0SCR1_ADDR),
    .GFX0SCR1_DOUT(GFX0SCR1_DOUT),

    .GFXSCR2_CS(GFXSCR2_CS),
    .GFXSCR2_OK(GFXSCR2_OK),
    .GFX0SCR2_ADDR(GFX0SCR2_ADDR),
    .GFX0SCR2_DOUT(GFX0SCR2_DOUT),

    //gp9001
    .GP9001CS(GP9001CS),
    .GP9001ACK(GP9001ACK),
    .VINT(VINT),
    .GP9001DIN(CPU_DOUT),
    .GP9001DOUT(GCU_DOUT),
    .GP9001_OP_SELECT_REG(GP9001_OP_SELECT_REG),
    .GP9001_OP_WRITE_REG(GP9001_OP_WRITE_REG),
    .GP9001_OP_WRITE_RAM(GP9001_OP_WRITE_RAM),
    .GP9001_OP_READ_RAM_H(GP9001_OP_READ_RAM_H),
    .GP9001_OP_READ_RAM_L(GP9001_OP_READ_RAM_L),
    .GP9001_OP_SET_RAM_PTR(GP9001_OP_SET_RAM_PTR),
    .GP9001OUT(GP9001OUT),

    //video signal
    .LVBL_DLY(LVBL),
    .LHBL_DLY(LHBL),
    .LVBL(LVBLL),
    .LHBL(LHBLL),
    .HS(HS),
    .VS(VS),
    .CPU_HSYNC(HSYNC),
    .CPU_VSYNC(VSYNC),
    .CPU_FBLANK(FBLANK),
    .V(V),
    .RED(red),
    .GREEN(green),
    .BLUE(blue),

    .PALRAM_ADDR(PALRAM_ADDR),
    .PALRAM_DATA(PALRAM_DATA),

    .GAME(GAME),
    .FLIP(FLIP)
);

wire YM3812_cen;
assign YM3812_cen = CEN3p375;

pipibibs_sound u_sound(
    .CLK(CLK),
    .CLK96(CLK96),
    .RESET(RESET),
    .RESET96(RESET96),
    .YM3812_CEN(YM3812_cen),
    .Z80_CEN(CEN3p375),
    .ROMZ80_CS(ROMZ80_CS),
    .ROMZ80_OK(ROMZ80_OK),
    .ROMZ80_ADDR(ROMZ80_ADDR),
    .ROMZ80_DOUT(ROMZ80_DOUT),
    .left(snd_left),
    .right(snd_right),
    .sample(sample),
    .peak(peak),
    .YM3812_CS(YM3812_CS),
    .YM3812_WE(YM3812_WE),
    .YM3812_WR_CMD(YM3812_WR_CMD),
    .YM3812_DIN(YM3812_DIN),
    .YM3812_DOUT(YM3812_DOUT),
    .GAME(GAME),
    .FX_LEVEL(dip_fxlevel),
    .FM_LEVEL(dip_fmlevel),
    .PSG_EN(enable_psg),
    .FM_EN(enable_fm),
    .DIP_PAUSE(DIP_PAUSE),
    .SRAM_ADDR(SRAM_ADDR),
    .SRAM_DATA(SRAM_DATA),
    .SRAM_DIN(SRAM_DIN),
    .SRAM_WE(SRAM_WE)
);

//sdram
pipibibs_sdram u_sdram (
    .RESET(RESET96),
    .CLK(CLK96),
    .RESET48(RESET),
    .CLK48(CLK),
    .CLK_GFX(pxl_cen),

    //ROM loader
    .IOCTL_ADDR(ioctl_addr),
    .IOCTL_DOUT(ioctl_dout),
    .IOCTL_DIN(ioctl_din),
    .IOCTL_WR(ioctl_wr),
    .IOCTL_RAM(ioctl_ram),
    .PROG_ADDR(prog_addr),
    .PROG_DATA(prog_data),
    .PROG_MASK(prog_mask),
    .PROG_BA(prog_ba),
    .PROG_WE(prog_we),
    .PROG_RD(prog_rd),
    .PROG_RDY(prog_rdy),
    .DOWNLOADING(downloading),
    .DWNLD_BUSY(dwnld_busy),

    // Banks
    .BA0_ADDR(ba0_addr),
    .BA1_ADDR(ba1_addr),
    .BA2_ADDR(ba2_addr),
    .BA3_ADDR(ba3_addr),
    .BA_RD(ba_rd),
    .BA_WR(ba_wr),
    .BA0_DIN(ba0_din),
    .BA0_DIN_M(ba0_din_m),  // write mask
    .BA_ACK(ba_ack),
    .BA_DST(ba_dst),
    .BA_DOK(ba_dok),
    .BA_RDY(ba_rdy),
    .DATA_READ(data_read),

    //tiles
    .GFX_CS(GFX_CS),
    .GFX_OK(GFX_OK),
    .GFX0_ADDR(GFX0_ADDR),
    .GFX0_DOUT(GFX0_DOUT),

    .GFXSCR0_CS(GFXSCR0_CS),
    .GFXSCR0_OK(GFXSCR0_OK),
    .GFX0SCR0_ADDR(GFX0SCR0_ADDR),
    .GFX0SCR0_DOUT(GFX0SCR0_DOUT),

    .GFXSCR1_CS(GFXSCR1_CS),
    .GFXSCR1_OK(GFXSCR1_OK),
    .GFX0SCR1_ADDR(GFX0SCR1_ADDR),
    .GFX0SCR1_DOUT(GFX0SCR1_DOUT),

    .GFXSCR2_CS(GFXSCR2_CS),
    .GFXSCR2_OK(GFXSCR2_OK),
    .GFX0SCR2_ADDR(GFX0SCR2_ADDR),
    .GFX0SCR2_DOUT(GFX0SCR2_DOUT),

    //68k program
    .ROM68K_CS(ROM68K_CS),
    .ROM68K_OK(ROM68K_OK),
    .ROM68K_ADDR(ROM68K_ADDR),
    .ROM68K_DOUT(ROM68K_DOUT),

    //z80 program
    .ROMZ80_CS(ROMZ80_CS),
    .ROMZ80_OK(ROMZ80_OK),
    .ROMZ80_ADDR(ROMZ80_ADDR),
    .ROMZ80_DOUT(ROMZ80_DOUT),

    .GAME(GAME)
);

endmodule
