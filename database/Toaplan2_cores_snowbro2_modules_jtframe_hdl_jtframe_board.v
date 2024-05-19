// This program was cloned from: https://github.com/atrac17/Toaplan2
// License: GNU General Public License v3.0

/*  This file is part of JT_FRAME.
    JTFRAME program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    JTFRAME program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with JTFRAME.  If not, see <http://www.gnu.org/licenses/>.

    Author: Jose Tejada Gomez. Twitter: @topapate
    Version: 1.0
    Date: 25-9-2019 */

module jtframe_board #(parameter
    BUTTONS                 = 2, // number of buttons used by the game
    // coin and start buttons will be mapped.
    GAME_INPUTS_ACTIVE_LOW  = 1'b1,
    COLORW                  = 4,
    SDRAMW                  = 22,
    VIDEO_WIDTH             = 384,
    VIDEO_HEIGHT            = 224,
    MISTER                  = 1
)(
    output              rst,
    output              rst_n,
    output              game_rst,
    output              game_rst_n,
    output              sdram_init,
    // reset forcing signals:
    input               rst_req,
    input               pll_locked,

    input               clk_sys,
    input               clk_rom,
    input               clk_pico,

    input        [ 6:0] core_mod,
    // LED
    input               osd_shown,
    input        [ 1:0] game_led,
    output              led,
    // Audio
    input  signed [15:0] snd_lin,
    input  signed [15:0] snd_rin,
    output signed [15:0] snd_lout,
    output signed [15:0] snd_rout,
    input                snd_sample,
    // ROM access from game
    input  [SDRAMW-1:0] ba0_addr,
    input  [SDRAMW-1:0] ba1_addr,
    input  [SDRAMW-1:0] ba2_addr,
    input  [SDRAMW-1:0] ba3_addr,
    input         [3:0] ba_rd,
    input         [3:0] ba_wr,
    output        [3:0] ba_ack,
    output        [3:0] ba_rdy,
    output        [3:0] ba_dst,
    output        [3:0] ba_dok,
    input        [15:0] ba0_din,
    input        [ 1:0] ba0_din_m,  // write mask

    output       [15:0] sdram_dout,
    // ROM programming
    input  [SDRAMW-1:0] prog_addr,
    input        [15:0] prog_data,
    input        [ 1:0] prog_mask,
    input        [ 1:0] prog_ba,
    input               prog_we,
    input               prog_rd,
    output              prog_dok,
    output              prog_rdy,
    output              prog_dst,
    output              prog_ack,
    input               downloading,
    // SDRAM interface
    inout  [15:0]     SDRAM_DQ,       // SDRAM Data bus 16 Bits
    output [12:0]     SDRAM_A,        // SDRAM Address bus 13 Bits
    output            SDRAM_DQML,     // SDRAM Low-byte Data Mask
    output            SDRAM_DQMH,     // SDRAM High-byte Data Mask
    output            SDRAM_nWE,      // SDRAM Write Enable
    output            SDRAM_nCAS,     // SDRAM Column Address Strobe
    output            SDRAM_nRAS,     // SDRAM Row Address Strobe
    output            SDRAM_nCS,      // SDRAM Chip Select
    output [1:0]      SDRAM_BA,       // SDRAM Bank Address
    output            SDRAM_CKE,      // SDRAM Clock Enable
    // keyboard
    input             ps2_kbd_clk,
    input             ps2_kbd_data,
    // UART
    input             uart_rx,
    output            uart_tx,
    // joystick
    input     [15:0]  board_joystick1,
    input     [15:0]  board_joystick2,
    input     [15:0]  board_joystick3,
    input     [15:0]  board_joystick4,
    input     [15:0]  joyana_l1,
    input     [15:0]  joyana_r1,
    input     [15:0]  joyana_l2,
    input     [15:0]  joyana_r2,
    input     [ 3:0]  board_start,
    input     [ 3:0]  board_coin,
    output    [ 9:0]  game_joystick1,
    output    [ 9:0]  game_joystick2,
    output    [ 9:0]  game_joystick3,
    output    [ 9:0]  game_joystick4,
    output    [ 3:0]  game_coin,
    output    [ 3:0]  game_start,
    output            game_service,

    // Mouse & Paddle
    input      [ 8:0] bd_mouse_dx,
    input      [ 8:0] bd_mouse_dy,
    input      [ 7:0] bd_mouse_f,       // flags
    input             bd_mouse_idx,
    input             bd_mouse_st,

    output     [ 7:0] paddle_0,
    output     [15:0] mouse_1p,
    output     [15:0] mouse_2p,

    // DIP and OSD settings
    input     [63:0]  status,
    output    [12:0]  hdmi_arx,
    output    [12:0]  hdmi_ary,
    output    [ 1:0]  rotate,

    output            enable_fm,
    output            enable_psg,

    output            dip_test,
    // non standard:
    output            dip_pause,
    inout             dip_flip,     // A change in dip_flip implies a reset if JTFRAME_FLIP_RESET is defined
    output    [ 1:0]  dip_fxlevel,
    output    [ 1:0]  dip_fmlevel,
    // Base video
    input       [ 1:0] osd_rotate,
    input [COLORW-1:0] game_r,
    input [COLORW-1:0] game_g,
    input [COLORW-1:0] game_b,
    input             LHBL,
    input             LVBL,
    input             hs,
    input             vs,
    input             pxl_cen,
    input             pxl2_cen,
    // HDMI outputs (only for MiSTer)
    inout     [21:0]  gamma_bus,
    input             direct_video,

    // ROM downloading (cheat engine)
    input             prog_cheat,
    input             prog_lock,
    input             ioctl_wr,
    input       [7:0] ioctl_dout,
    input       [7:0] ioctl_addr,

    // scan doubler
    input             scan2x_enb,
    output     [7:0]  scan2x_r,
    output     [7:0]  scan2x_g,
    output     [7:0]  scan2x_b,
    output            scan2x_hs,
    output            scan2x_vs,
    output            scan2x_clk,
    output            scan2x_cen,
    output            scan2x_de,
    output     [2:0]  scan2x_sl,

    // Cheat Engine
    input      [31:0] cheat,
    output     [ 7:0] st_addr,
    input      [ 7:0] st_dout,
    input      [31:0] timestamp,
    // GFX enable
    output     [3:0]  gfx_en,
    output     [7:0]  debug_bus,
    input      [7:0]  debug_view
);

`ifdef JTFRAME_BA0_AUTOPRECH
    localparam BA0_AUTOPRECH = `JTFRAME_BA0_AUTOPRECH;
`elsif JTFRAME_SDRAM_BANKS
    localparam BA0_AUTOPRECH = 0;
`else
    // if only one bank is used, it makes to precharge as default option
    localparam BA0_AUTOPRECH = 1;
`endif

`ifdef JTFRAME_BA1_AUTOPRECH
    localparam BA1_AUTOPRECH = `JTFRAME_BA1_AUTOPRECH;
`else
    localparam BA1_AUTOPRECH = 0;
`endif

`ifdef JTFRAME_BA2_AUTOPRECH
    localparam BA2_AUTOPRECH = `JTFRAME_BA2_AUTOPRECH;
`else
    localparam BA2_AUTOPRECH = 0;
`endif

`ifdef JTFRAME_BA3_AUTOPRECH
    localparam BA3_AUTOPRECH = `JTFRAME_BA3_AUTOPRECH;
`else
    localparam BA3_AUTOPRECH = 0;
`endif

// sdram bank lengths
localparam
`ifdef JTFRAME_BA0_LEN
    BA0_LEN                 = `JTFRAME_BA0_LEN,
`else
    BA0_LEN                 = 32,
`endif

`ifdef JTFRAME_BA1_LEN
    BA1_LEN                 = `JTFRAME_BA1_LEN,
`else
    BA1_LEN                 = 32,
`endif

`ifdef JTFRAME_BA2_LEN
    BA2_LEN                 = `JTFRAME_BA2_LEN,
`else
    BA2_LEN                 = 32,
`endif

`ifdef JTFRAME_BA3_LEN
    BA3_LEN                 = `JTFRAME_BA3_LEN,
`else
    BA3_LEN                 = 32,
`endif
    PROG_LEN = 32;


wire  [ 2:0] scanlines;
wire         bw_en, blend_en;
wire         en_mixing;
wire         osd_pause;
wire         debug_plus, debug_minus, key_shift, key_ctrl;

wire         key_reset, key_pause, key_test, rot_control;
wire         game_pause, soft_rst, game_test;
wire         cheat_led, pre_pause;

wire   [9:0] key_joy1, key_joy2, key_joy3;
wire   [7:0] key_digit;
wire   [3:0] key_start, key_coin;
wire   [3:0] key_gfx;
wire         key_service;
wire         lock;
wire         autofire0;

wire [COLORW-1:0] pre2x_r, pre2x_g, pre2x_b,
                  dbg_r, dbg_g, dbg_b;
wire              pre2x_LHBL, pre2x_LVBL;

`ifdef JTFRAME_AUTOFIRE0
    assign autofire0=status[18];
`else
    assign autofire0=0;
`endif

jtframe_reset u_reset(
    .clk_sys    ( clk_sys       ),
    .clk_rom    ( clk_rom       ),
    .pxl_cen    ( pxl_cen       ),

    .sdram_init ( sdram_init    ),
    .downloading( downloading   ),
    .dip_flip   ( dip_flip      ),
    .soft_rst   ( soft_rst      ),
    .rst_req    ( rst_req       ),
    .pll_locked ( pll_locked    ),

    .rst        ( rst           ),
    .rst_n      ( rst_n         ),
    .game_rst   ( game_rst      ),
    .game_rst_n ( game_rst_n    )
);

jtframe_led u_led(
    .rst        ( rst           ),
    .clk        ( clk_sys       ),
    .LVBL       ( LVBL          ),
    .downloading( downloading   ),
    .osd_shown  ( osd_shown     ),
    .gfx_en     ( gfx_en        ),
    .game_led   ( game_led      ),
    .cheat_led  ( cheat_led     ),
    .led        ( led           )
);

`ifndef SIMULATION
jtframe_keyboard u_keyboard(
    .clk         ( clk_sys       ),
    .rst         ( rst           ),
    // ps2 interface
    .ps2_clk     ( ps2_kbd_clk   ),
    .ps2_data    ( ps2_kbd_data  ),
    // decoded keys
    .key_joy1    ( key_joy1      ),
    .key_joy2    ( key_joy2      ),
    .key_joy3    ( key_joy3      ),
    .key_start   ( key_start     ),
    .key_coin    ( key_coin      ),
    .key_reset   ( key_reset     ),
    .key_test    ( key_test      ),
    .key_pause   ( key_pause     ),
    .key_service ( key_service   ),
    .key_digit   ( key_digit     ),

    .shift       ( key_shift     ),
    .ctrl        ( key_ctrl      ),
    .key_gfx     ( key_gfx       ),
    .debug_plus  ( debug_plus    ),
    .debug_minus ( debug_minus   )
);

    `ifndef JTFRAME_RELEASE
        jtframe_debug #(.COLORW(COLORW)) u_debug(
            .clk         ( clk_sys       ),
            .rst         ( rst           ),

            .shift       ( key_shift     ),
            .ctrl        ( key_ctrl      ),
            .key_gfx     ( key_gfx       ),
            .key_digit   ( key_digit     ),
            .debug_plus  ( debug_plus    ),
            .debug_minus ( debug_minus   ),

            // overlay the value on video
            .pxl_cen     ( pxl_cen       ),
            .rin         ( pre2x_r       ),
            .gin         ( pre2x_g       ),
            .bin         ( pre2x_b       ),
            .lhbl        ( pre2x_LHBL    ),
            .lvbl        ( pre2x_LVBL    ),
            .rout        ( dbg_r         ),
            .gout        ( dbg_g         ),
            .bout        ( dbg_b         ),

            .gfx_en      ( gfx_en        ),
            .debug_bus   ( debug_bus     ),
            .debug_view  ( debug_view    )
        );
    `else
        assign gfx_en    = 4'b1111;
        assign debug_bus =  0;
        assign dbg_r = pre2x_r;
        assign dbg_g = pre2x_g;
        assign dbg_b = pre2x_b;
    `endif
`else
    `ifndef JTFRAME_SIM_GFXEN
    `define JTFRAME_SIM_GFXEN 4'hf
    `endif
    assign key_joy3    = 10'h0;
    assign key_joy2    = 10'h0;
    assign key_joy1    = 10'h0;
    assign key_start   = 2'd0;
    assign key_coin    = 2'd0;
    assign key_reset   = 1'b0;
    assign key_pause   = 1'b0;
    assign key_service = 1'b0;
    assign key_test    = 1'b0;
    assign gfx_en      = `JTFRAME_SIM_GFXEN;
    assign debug_bus   = 0;
    assign key_gfx     = 0;
`endif

jtframe_inputs #(
    .BUTTONS   ( BUTTONS                ),
    .ACTIVE_LOW( GAME_INPUTS_ACTIVE_LOW )
) u_inputs(
    .rst            ( rst             ),
    .clk            ( clk_sys         ),
    .vs             ( vs              ),
    .downloading    ( downloading     ),
    .dip_flip       ( dip_flip        ),
    .autofire0      ( autofire0       ),

    .soft_rst       ( soft_rst        ),

    .board_joy1     ( board_joystick1 ),
    .board_joy2     ( board_joystick2 ),
    .board_joy3     ( board_joystick3 ),
    .board_joy4     ( board_joystick4 ),
    .board_start    ( board_start     ),
    .board_coin     ( board_coin      ),

    .key_joy1       ( key_joy1        ),
    .key_joy2       ( key_joy2        ),
    .key_joy3       ( key_joy3        ),
    .key_start      ( key_start       ),
    .key_coin       ( key_coin        ),
    .key_service    ( key_service     ),
    .key_pause      ( key_pause       ),
    .key_test       ( key_test        ),
    .osd_pause      ( osd_pause       ),
    .key_reset      ( key_reset       ),
    .rot_control    ( rot_control     ),

    .game_joy1      ( game_joystick1  ),
    .game_joy2      ( game_joystick2  ),
    .game_joy3      ( game_joystick3  ),
    .game_joy4      ( game_joystick4  ),
    .game_coin      ( game_coin       ),
    .game_start     ( game_start      ),
    .game_service   ( game_service    ),
    .game_test      ( game_test       ),
    .lock           ( lock            ),

    // Mouse & Paddle
    .bd_mouse_dx    ( bd_mouse_dx     ),
    .bd_mouse_idx   ( bd_mouse_idx    ),
    .bd_mouse_dy    ( bd_mouse_dy     ),
    .bd_mouse_f     ( bd_mouse_f      ),
    .bd_mouse_st    ( bd_mouse_st     ),

    .paddle         ( paddle_0        ),
    .mouse_1p       ( mouse_1p        ),
    .mouse_2p       ( mouse_2p        ),

    // Simulation helpers
    .game_pause     ( game_pause      )
);

jtframe_dip u_dip(
    .clk        ( clk_sys       ),
    .status     ( status        ),
    .core_mod   ( core_mod      ),
    .game_pause ( game_pause    ),
    .hdmi_arx   ( hdmi_arx      ),
    .hdmi_ary   ( hdmi_ary      ),
    .rotate     ( rotate        ),
    .rot_control( rot_control   ),
    .en_mixing  ( en_mixing     ),
    .scanlines  ( scanlines     ),
    .blend_en   ( blend_en      ),
    .bw_en      ( bw_en         ),
    .enable_fm  ( enable_fm     ),
    .enable_psg ( enable_psg    ),
    .osd_pause  ( osd_pause     ),
    .game_test  ( game_test     ),
    .dip_test   ( dip_test      ),
    .dip_pause  ( pre_pause     ),
    .dip_flip   ( dip_flip      ),
    .dip_fxlevel( dip_fxlevel   ),
    .dip_fmlevel( dip_fmlevel   )
);

wire [ 3:0] bax_rd, bax_wr, bax_ack;
wire [15:0] bax_din;
wire [ 1:0] bax_din_m;
wire [ 3:0] bax_rdy, bax_dst;
wire [SDRAMW-1:0] bax_addr;


`ifdef JTFRAME_CHEAT
    wire       cheat_rd, cheat_ack, cheat_dst, cheat_rdy, cheat_wr;
    // jtframe_credits video control
    wire [7:0] vram_dout, vram_din;
    wire [9:0] vram_addr;
    wire       vram_we;
    wire [2:0] vram_ctrl;

    jtframe_cheat #(
        .AW         (  SDRAMW   )
    ) u_cheat(
        .rst        ( game_rst  ),
        .clk_pico   ( clk_pico  ),
        .clk_rom    ( clk_rom   ),

        .LVBL       ( LVBL      ),
        .status     ( status    ),

        // From/to game
        .game_addr  ( ba0_addr  ),
        .game_rd    ( ba_rd[0]  ),
        .game_wr    ( ba_wr[0]  ),
        .game_din   ( ba0_din   ),
        .game_din_m ( ba0_din_m ),
        .game_ack   ( cheat_ack ),
        .game_dst   ( cheat_dst ),
        .game_rdy   ( cheat_rdy ),

        // From/to SDRAM bank 0
        .ba0_addr   ( bax_addr  ),
        .ba0_rd     ( cheat_rd  ),
        .ba0_wr     ( cheat_wr  ),
        .ba0_dst    ( bax_dst[0]),
        .ba0_rdy    ( bax_rdy[0]),
        .ba0_ack    ( bax_ack[0]),
        .ba0_din    ( bax_din   ),
        .ba0_din_m  ( bax_din_m ),
        .data_read  ( sdram_dout),

        .flags      ( cheat     ),
        .joy1       ( game_joystick1[7:0] ),
        .joy2       ( game_joystick2[7:0] ),
        .joyana_l1  ( joyana_l1 ),
        .joyana_r1  ( joyana_r1 ),
        .joyana_l2  ( joyana_l2 ),
        .joyana_r2  ( joyana_r2 ),

        .led        ( cheat_led ),
        .lock       ( lock      ),
        .timestamp  ( timestamp ),

        .pause_in   ( pre_pause ),
        .pause_out  ( dip_pause ),

        // Game module
        .st_addr    ( st_addr   ),
        .st_dout    ( st_dout   ),
        .debug_bus  ( debug_bus ),

        // UART
        .uart_rx    ( uart_rx   ),
        .uart_tx    ( uart_tx   ),

        // Video
        .vram_addr  ( vram_addr ),
        .vram_din   ( vram_din  ),
        .vram_dout  ( vram_dout ),
        .vram_we    ( vram_we   ),
        .vram_ctrl  ( vram_ctrl ),

        // Program
        .prog_en    ( prog_cheat),
        .prog_lock  ( prog_lock ),
        .prog_addr  ( ioctl_addr[7:0] ),
        .prog_wr    ( ioctl_wr  ),
        .prog_data  ( ioctl_dout)
    );
    assign bax_rd = { ba_rd[3:1], cheat_rd };
    assign bax_wr = { ba_wr[3:1], cheat_wr };
    assign ba_ack = { bax_ack[3:1], cheat_ack };
    assign ba_rdy = { bax_rdy[3:1], cheat_rdy };
    assign ba_dst = { bax_dst[3:1], cheat_dst };
    // always enable credits for compilations with JTFRAME_CHEAT
    `define JTFRAME_CREDITS
`else
    assign bax_rd    = ba_rd;
    assign bax_wr    = ba_wr;
    assign bax_din   = ba0_din;
    assign bax_din_m = ba0_din_m;
    assign bax_addr  = ba0_addr;
    assign ba_ack    = bax_ack;
    assign ba_rdy    = bax_rdy;
    assign ba_dst    = bax_dst;
    assign uart_tx   = 1; // no signal out
    assign cheat_led = 0;
    assign dip_pause = pre_pause;
    assign st_addr   = debug_bus;
`endif

// Audio
`ifndef JTFRAME_INTERPOL2
    // bypass the sound signals if the interpolator is not used
    assign snd_rout = snd_rin;
    assign snd_lout = snd_lin;
`else
    jtframe_uprate2_fir u_uprate2(
        .rst        ( rst       ),
        .clk        ( clk_sys   ),
        .sample     ( snd_sample),
        .upsample   (           ),
        .l_in       ( snd_lin   ),
        .r_in       ( snd_rin   ),
        .l_out      ( snd_lout  ),
        .r_out      ( snd_rout  )
    );
`endif

// support for 48MHz
// Above 64MHz HF should be 1. SHIFTED depends on whether the SDRAM
// clock is shifted or not.
jtframe_sdram64 #(
    .AW           ( SDRAMW        ),
    .BA0_LEN      ( BA0_LEN       ),
    .BA1_LEN      ( BA1_LEN       ),
    .BA2_LEN      ( BA2_LEN       ),
    .BA3_LEN      ( BA3_LEN       ),
    .BA0_AUTOPRECH( BA0_AUTOPRECH ),
    .BA1_AUTOPRECH( BA1_AUTOPRECH ),
    .BA2_AUTOPRECH( BA2_AUTOPRECH ),
    .BA3_AUTOPRECH( BA3_AUTOPRECH ),
    .PROG_LEN     ( PROG_LEN      ),
    .MISTER       ( MISTER        ),
`ifdef JTFRAME_SDRAM96
    .HF(1),
    .SHIFTED(0)
`else
    .HF(0),
    `ifdef JTFRAME_180SHIFT
        .SHIFTED(0)
    `else
        .SHIFTED(1)
    `endif
`endif
) u_sdram(
    .rst        ( rst           ),
    .clk        ( clk_rom       ), // 96MHz = 32 * 6 MHz -> CL=2
    .init       ( sdram_init    ),

    .ba0_addr   ( bax_addr      ),
    .ba1_addr   ( ba1_addr      ),
    .ba2_addr   ( ba2_addr      ),
    .ba3_addr   ( ba3_addr      ),

    .rd         ( bax_rd        ),
    .wr         ( bax_wr        ),
    .din        ( bax_din       ),
    .din_m      ( bax_din_m     ),  // write mask

    .rdy        ( bax_rdy       ),
    .ack        ( bax_ack       ),
    .dok        ( ba_dok        ),
    .dst        ( bax_dst       ),

    // ROM-load interface
    .prog_en    ( downloading   ),
    .prog_addr  ( prog_addr     ),
    .prog_ba    ( prog_ba       ),
    .prog_rd    ( prog_rd       ),
    .prog_wr    ( prog_we       ),
    .prog_din   ( prog_data     ),
    .prog_din_m ( prog_mask     ),
    .prog_rdy   ( prog_rdy      ),
    .prog_dst   ( prog_dst      ),
    .prog_dok   ( prog_dok      ),
    .prog_ack   ( prog_ack      ),
    // SDRAM interface
    .sdram_dq   ( SDRAM_DQ      ),
`ifdef VERILATOR // to avoid a warning
    .sdram_din  (               ),
`endif
    .sdram_a    ( SDRAM_A       ),
    .sdram_dqml ( SDRAM_DQML    ),
    .sdram_dqmh ( SDRAM_DQMH    ),
    .sdram_nwe  ( SDRAM_nWE     ),
    .sdram_ncas ( SDRAM_nCAS    ),
    .sdram_nras ( SDRAM_nRAS    ),
    .sdram_ncs  ( SDRAM_nCS     ),
    .sdram_ba   ( SDRAM_BA      ),
    .sdram_cke  ( SDRAM_CKE     ),

    // Common signals
    .dout       ( sdram_dout    ),
    .rfsh       ( ~LHBL         )
);

`ifdef SIMULATION
    jtframe_romrq_rdy_check u_rdy_check(
        .rst       ( rst        ),
        .clk       ( clk_rom    ),
        .ba_rd     ( ba_rd      ),
        .ba_wr     ( ba_wr      ),
        .ba_ack    ( ba_ack     ),
        .ba_rdy    ( ba_rdy     )
    );

    `ifdef JTFRAME_SDRAM_STATS
    jtframe_sdram_stats #(.AW(SDRAMW)) u_stats(
        .rst        ( rst           ),
        .clk        ( clk_rom       ),
        // SDRAM interface
        .sdram_a    ( SDRAM_A       ),
        .sdram_ba   ( SDRAM_BA      ),
        .sdram_nwe  ( SDRAM_nWE     ),
        .sdram_ncas ( SDRAM_nCAS    ),
        .sdram_nras ( SDRAM_nRAS    ),
        .sdram_ncs  ( SDRAM_nCS     )
    );
    `endif
`endif

`ifdef JTFRAME_CREDITS
    `ifndef JTFRAME_CREDITS_PAGES
    `define JTFRAME_CREDITS_PAGES 3
    `endif
    wire invert_inputs = GAME_INPUTS_ACTIVE_LOW[0];
    wire toggle = |(game_start ^ {4{invert_inputs}});
    wire fast_scroll = |({game_joystick1[2], game_joystick2[2]} ^ {2{invert_inputs}});
    wire show_credits, hide_credits;

    `ifdef JTFRAME_CREDITS_HIDEVERT
        assign hide_credits = core_mod[0];
    `else
        assign hide_credits = 0;
    `endif

    `ifdef MISTER
        assign show_credits = ~dip_pause & ~status[12] & ~hide_credits;
    `else
        assign show_credits = ~dip_pause & ~hide_credits;
    `endif

    // To do: HS and VS should actually be delayed inside jtframe_credits too
    jtframe_credits #(
        .PAGES  ( `JTFRAME_CREDITS_PAGES ),
        .COLW   ( COLORW                 ),
        .BLKPOL (      0                 ) // 0 for active low signals
    ) u_credits(
        .rst        ( rst           ),
        .clk        ( clk_sys       ),
        .pxl_cen    ( pxl_cen       ),

        // input image
        .HB         ( LHBL          ),
        .VB         ( LVBL          ),
        .rgb_in     ( { game_r, game_g, game_b } ),
        `ifdef JTFRAME_CREDITS_NOROTATE
            .rotate ( 2'd0          ),
        `else
            .rotate ( { ~rotate[1], core_mod[0] }  ),
        `endif
        .toggle     ( toggle        ),
        .fast_scroll( fast_scroll   ),

        `ifdef JTFRAME_CHEAT
            // Cheat CPU can controll the video
            .vram_din   ( vram_dout  ),
            .vram_dout  ( vram_din   ),
            .vram_addr  ( vram_addr  ),
            .vram_we    ( vram_we    ),
            .vram_ctrl  ( vram_ctrl  ),
            .enable     ( vram_ctrl[0] | show_credits ),
        `else
            .vram_din   ( 8'h0  ),
            .vram_dout  (       ),
            .vram_addr  ( 8'h0  ),
            .vram_we    ( 1'b0  ),
            .vram_ctrl  ( 3'b0  ),
            `ifdef JTFRAME_CREDITS_AON
                .enable ( 1'b1          ),
            `else
                .enable ( show_credits  ),
            `endif
        `endif

        // output image
        .HB_out     ( pre2x_LHBL      ),
        .VB_out     ( pre2x_LVBL      ),
        .rgb_out    ( {pre2x_r, pre2x_g, pre2x_b } )
    );
`else
    assign { pre2x_r, pre2x_g, pre2x_b } = { game_r, game_g, game_b };
    assign { pre2x_LHBL, pre2x_LVBL    } = { LHBL, LVBL };
`endif

// By pass scan2x in simulation by default
// enable it by defining JTFRAME_SIM_SCAN2X

`ifdef SIMULATION
    `ifdef NOVIDEO
    `define JTFRAME_DONTSIM_SCAN2X
    `endif
    `ifndef JTFRAME_SIM_SCAN2X
    `define JTFRAME_DONTSIM_SCAN2X
    `endif
`endif


`ifdef JTFRAME_DONTSIM_SCAN2X
initial $display("INFO: Scan2x simulation bypassed");
assign scan2x_r    = pre2x_r;
assign scan2x_g    = pre2x_g;
assign scan2x_b    = pre2x_b;
assign scan2x_hs   = hs;
assign scan2x_vs   = vs;
assign scan2x_clk  = clk_sys;
assign scan2x_cen  = pxl_cen;
assign scan2x_de   = LVBL && LHBL;
assign scan2x_sl   = 2'd0;
`else

// Limited bandwidth for video signal
localparam CLROUTW = COLORW < 5 ? COLORW+1 : COLORW;

wire [CLROUTW-1:0] r_ana, g_ana, b_ana;
wire               hs_ana, vs_ana, lhbl_ana, lvbl_ana;
wire               pxl_ana;

jtframe_wirebw #(.WIN(COLORW), .WOUT(CLROUTW)) u_wirebw(
    .clk        ( clk_sys   ),
    .spl_in     ( pxl_cen   ),
    .r_in       ( dbg_r     ),
    .g_in       ( dbg_g     ),
    .b_in       ( dbg_b     ),
    .HS_in      ( hs        ),
    .VS_in      ( vs        ),
    .LHB_in     ( pre2x_LHBL),
    .LVB_in     ( pre2x_LVBL),
    .enable     ( bw_en     ),
    // filtered video
    .HS_out     ( hs_ana    ),
    .VS_out     ( vs_ana    ),
    .LHB_out    ( lhbl_ana  ),
    .LVB_out    ( lvbl_ana  ),
    .r_out      ( r_ana     ),
    .g_out      ( g_ana     ),
    .b_out      ( b_ana     )
);

function [7:0] extend8;
    input [CLROUTW-1:0] a;
    case( CLROUTW )
        3: extend8 = { a, a, a[2:1] };
        4: extend8 = { a, a         };
        5: extend8 = { a, a[4:2]    };
        6: extend8 = { a, a[5:4]    };
        7: extend8 = { a, a[6]      };
        8: extend8 = a;
    endcase
endfunction

`ifndef MISTER
    // This scan doubler takes very little memory. Some games in MiST
    // can only use this
    wire [CLROUTW*3-1:0] rgbx2;
    wire [CLROUTW*3-1:0] game_rgb = { r_ana, g_ana, b_ana };
    wire scan2x_hsin = bw_en ? hs_ana : hs;

    // Note that VIDEO_WIDTH must include blanking for jtframe_scan2x
    jtframe_scan2x #(.COLORW(CLROUTW), .HLEN(VIDEO_WIDTH)) u_scan2x(
        .rst_n      ( rst_n          ),
        .clk        ( clk_sys        ),
        .pxl_cen    ( pxl_cen        ),
        // settings
        .sl_mode    ( scanlines[2:0] ),
        .blend_en   ( blend_en       ),
        // video inputs
        .pxl2_cen   ( pxl2_cen       ),
        .base_pxl   ( game_rgb       ),
        .HS         ( scan2x_hsin    ),
        // outputs
        .x2_pxl     ( rgbx2          ),
        .x2_HS      ( scan2x_hs      )
    );
    assign scan2x_vs    = bw_en ? vs_ana : vs;
    assign scan2x_r     = extend8( rgbx2[CLROUTW*3-1:CLROUTW*2] );
    assign scan2x_g     = extend8( rgbx2[CLROUTW*2-1:CLROUTW] );
    assign scan2x_b     = extend8( rgbx2[CLROUTW-1:0] );
    assign scan2x_de    = ~(scan2x_vs | scan2x_hs);
    assign scan2x_cen   = pxl2_cen;
    assign scan2x_clk   = clk_sys;
    assign scan2x_sl    = scanlines[2:0];
    // unused in MiST
    assign gamma_bus    = 22'd0;
`else
    localparam VIDEO_DW = CLROUTW!=5 ? 3*CLROUTW : 24;

    wire [VIDEO_DW-1:0] game_rgb;

    // arcade video does not support 15bpp colour, so for that
    // case we need to convert it to 24bpp
    generate
        if( CLROUTW!=5 ) begin
            assign game_rgb = {r_ana, g_ana, b_ana };
        end else begin
            assign game_rgb = {
                r_ana, r_ana[4:2],
                g_ana, g_ana[4:2],
                b_ana, b_ana[4:2]
            };
        end
    endgenerate

    // VIDEO_WIDTH does not include blanking:
    arcade_video #(.WIDTH(VIDEO_WIDTH),.DW(VIDEO_DW))
    u_arcade_video(
        .clk_video  ( clk_sys       ),
        .ce_pix     ( pxl_cen       ),

        .RGB_in     ( game_rgb      ),
        .HBlank     ( ~lhbl_ana     ),
        .VBlank     ( ~lvbl_ana     ),
        .HSync      ( hs_ana        ),
        .VSync      ( vs_ana        ),

        .CLK_VIDEO  ( scan2x_clk    ),
        .CE_PIXEL   ( scan2x_cen    ),
        .VGA_R      ( scan2x_r      ),
        .VGA_G      ( scan2x_g      ),
        .VGA_B      ( scan2x_b      ),
        .VGA_HS     ( scan2x_hs     ),
        .VGA_VS     ( scan2x_vs     ),
        .VGA_DE     ( scan2x_de     ),
        .VGA_SL     ( scan2x_sl     ),

        .gamma_bus  ( gamma_bus     ),
        .fx         ( scanlines     ),
        .forced_scandoubler( ~scan2x_enb )
    );

`endif
`endif

endmodule
