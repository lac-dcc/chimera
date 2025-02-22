// This program was cloned from: https://github.com/jotego/jtcores
// License: GNU General Public License v3.0

/*  This file is part of JTCORES.
    JTCORES program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    JTCORES program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with JTCORES.  If not, see <http://www.gnu.org/licenses/>.

    Author: Jose Tejada Gomez. Twitter: @topapate
    Version: 1.0
    Date: 4-4-2020 */

module jtsectnz_video#(
    parameter SCRW = 18,
    parameter OBJW = 17
)(
    input               rst,
    input               clk,
    input               cen12,
    input               cen6,
    input               cen3,
    input               cpu_cen,
    input       [11:0]  cpu_AB,
    input               game_sel,
    output      [ 8:0]  V,
    output      [ 8:0]  H,
    input               RnW,
    input               flip,
    input       [ 7:0]  cpu_dout,
    // CHAR
    input               char_cs,
    output      [ 7:0]  char_dout,
    input               char_ok,
    output              char_busy,
    output      [13:0]  char_addr,
    input       [15:0]  char_data,
    // SCROLL - ROM
    input               scr_cs,
    output      [ 7:0]  scr_dout,
    output  [SCRW-1:0]  scr_addr,
    input       [15:0]  scr_data,
    input               scr_ok,
    output              scr_busy,
    input       [ 8:0]  scr_hpos,
    input       [ 8:0]  scr_vpos,
    // OBJ
    output      [ 8:0]  obj_AB,
    input       [ 7:0]  main_ram,
    input               OKOUT,
    output              bus_req, // Request bus
    input               bus_ack, // bus acknowledge
    output              blcnten, // bus line counter enable
    output  [OBJW-1:0]  obj_addr,
    input       [15:0]  obj_data,
    input               obj_ok,
    // Color Mix
    output              LHBL,
    output              LVBL,
    output              HS,
    output              VS,
    // Palette RAM
    input               blue_cs,
    input               redgreen_cs,
    input       [3:0]   gfx_en,
    // Pixel output
    output      [3:0]   red,
    output      [3:0]   green,
    output      [3:0]   blue
);

localparam LAYOUT     = 5;

localparam PXL_CHRW=6;

wire [PXL_CHRW-1:0] char_pxl;
wire [6:0] obj_pxl;
wire [6:0] scr_pxl;
wire [3:0] cc;
wire       LHBL_obj, LVBL_obj, HINIT, preLVBL, preLHBL;

jtgng_timer #(.LAYOUT(5)) u_timer(
    .clk       ( clk      ),
    .cen6      ( cen6     ),
    .V         ( V        ),
    .H         ( H        ),
    .Hinit     ( HINIT    ),
    .LHBL      ( preLHBL  ),
    .LVBL      ( preLVBL  ),
    .LHBL_obj  ( LHBL_obj ),
    .LVBL_obj  ( LVBL_obj ),
    .HS        ( HS       ),
    .VS        ( VS       ),
    .Vinit     (          )
);

jtgng_char #(
    .HOFFSET ( 7),
    .ROM_AW  (14),
    .PALW    ( 4)
) u_char (
    .clk        ( clk           ),
    .pxl_cen    ( cen6          ),
    .AB         ( cpu_AB[10:0]  ),
    .V          ( V[7:0]        ),
    .H          ( H[7:0]        ),
    .flip       ( flip          ),
    .din        ( cpu_dout      ),
    .dout       ( char_dout     ),
    // Bus arbitrion
    .char_cs    ( char_cs       ),
    .wr_n       ( RnW           ),
    .busy       ( char_busy     ),
    // ROM
    .char_addr  ( char_addr     ),
    .rom_data   ( char_data     ),
    .rom_ok     ( char_ok       ),
    // Pixel output
    .char_on    ( 1'b1          ),
    .char_pxl   ( char_pxl      ),
    // unused
    .dseln      (               ),
    .prog_addr  (               ),
    .prog_din   (               ),
    .prom_we    (               )
);

`ifndef NOSCR
jtgng_scroll #(
    .HOFFSET( 1    ),
    .ROM_AW ( SCRW  ),
    .TILE4  ( 1     ),
    .LAYOUT (LAYOUT ),
    .PALW   ( 3     )
) u_scroll (
    .clk        ( clk           ),
    .pxl_cen    ( cen6          ),
    // screen position
    .H          ( H             ),
    .V          ( V[7:0]        ),
    .hpos       ( scr_hpos      ),
    .vpos       ( scr_vpos      ),
    .flip       ( flip          ),
    // bus arbitrion
    .Asel       ( cpu_AB[10]    ),
    .AB         ( cpu_AB[9:0]   ),
    .scr_cs     ( scr_cs        ),
    .din        ( cpu_dout      ),
    .dout       ( scr_dout      ),
    .wr_n       ( RnW           ),
    .busy       ( scr_busy      ),
    // ROM
    .scr_addr   ( scr_addr      ),
    .rom_data   ( scr_data      ),
    .rom_ok     ( scr_ok        ),
    // pixel output
    .scr_pal    ( scr_pxl[6:4]  ),
    .scr_col    ( scr_pxl[3:0]  )
);
`else
assign scr_busy   = 1'b0;
assign scr_pxl    = 7'h7f;
assign scr_addr   = 17'd0;
assign scr_dout   = 8'd0;
`endif

`ifndef NOOBJ
jtgng_obj #(
    .ROM_AW       ( OBJW        ),
    .PALW         (  3          ),
    .PXL_DLY      (  2          ),
    .LAYOUT       ( LAYOUT      ))
u_obj (
    .rst        ( rst         ),
    .clk        ( clk         ),
    .draw_cen   ( cen12       ),
    .dma_cen    ( cen6        ),
    .pxl_cen    ( cen6        ),
    .AB         ( obj_AB      ),
    .DB         ( main_ram    ),
    .OKOUT      ( OKOUT       ),
    .bus_req    ( bus_req     ),
    .bus_ack    ( bus_ack     ),
    .blen       ( blcnten     ),
    .LHBL       ( LHBL_obj    ),
    .LVBL       ( LVBL        ),
    .LVBL_obj   ( LVBL_obj    ),
    .HINIT      ( HINIT       ),
    .flip       ( flip        ),
    .V          ( V[7:0]      ),
    .H          ( H           ),
    // SDRAM interface
    .obj_addr   ( obj_addr    ),
    .obj_data   ( obj_data    ),
    .rom_ok     ( obj_ok      ),
    // pixel data
    .obj_pxl    ( obj_pxl     ),
    // unused
    .prog_addr  (             ),
    .prog_din   (             ),
    .prom_hi_we ( 1'b0        ),
    .prom_lo_we ( 1'b0        ),
    .OBJON      ( 1'b1        )
);
`else
assign blcnten = 1'b0;
assign bus_req = 1'b0;
assign obj_pxl = ~6'd0;
`endif

`ifndef NOCOLMIX
jtsectnz_colmix #(
    .CHARW  (   PXL_CHRW    )
)
u_colmix (
    .rst          ( rst           ),
    .clk          ( clk           ),
    .cen12        ( cen12         ),
    .pxl_cen      ( cen6          ),
    .cpu_cen      ( cpu_cen       ),

    .char_pxl     ( char_pxl      ),
    .scr_pxl      ( scr_pxl       ),
    .obj_pxl      ( obj_pxl       ),
    .preLHBL      ( preLHBL       ),
    .preLVBL      ( preLVBL       ),
    .LVBL         ( LVBL          ),
    .LHBL         ( LHBL          ),

    // Priority PROM
    // .prog_addr    ( prog_addr     ),
    // .prom_prior_we( prom_prior_we ),
    // .prom_din     ( prom_din      ),

    // DEBUG
    .gfx_en       ( gfx_en        ),

    // CPU interface
    .AB           ( cpu_AB[9:0]   ),
    .blue_cs      ( blue_cs       ),
    .redgreen_cs  ( redgreen_cs   ),
    .DB           ( cpu_dout      ),
    .cpu_wrn      ( RnW           ),

    // colour output
    .red          ( red           ),
    .green        ( green         ),
    .blue         ( blue          )
);
`else
assign  red = 4'd0;
assign blue = 4'd0;
assign green= 4'd0;
`endif

endmodule