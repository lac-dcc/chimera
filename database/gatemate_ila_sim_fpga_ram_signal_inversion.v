// This program was cloned from: https://github.com/colognechip/gatemate_ila
// License: GNU General Public License v3.0

// Company           :   racyics
// Author            :   winter
// E-Mail            :   <email>
//
// Filename          :   signal_inversion.v
// Project Name      :   p_cc
// Subproject Name   :   s_fpga, dpsram_block_4x512x20
// Description       :   <short description>
//
// Create Date       :   
// Last Change       :   $Date: 2015-03-26 09:25:47 +0100 (Thu, 26 Mar 2015) $
// by                :   $Author: winter $
//------------------------------------------------------------

`timescale 1 ns / 1 ps

module signal_inversion
  (input  wire [2:0]  cfg_inversion_a0_i,
   input  wire [2:0]  cfg_inversion_a1_i,
   input  wire [2:0]  cfg_inversion_b0_i,
   input  wire [2:0]  cfg_inversion_b1_i,

   
   // forward port A0
   input  wire        a0_clk_i,
   input  wire        a0_en_i,
   input  wire        a0_we_i,
   input  wire [15:0] a0_addr_i,
   input  wire [19:0] a0_data_i,
   input  wire [19:0] a0_bitmask_i,
   
   // forward port A1
   input  wire        a1_clk_i,
   input  wire        a1_en_i,
   input  wire        a1_we_i,
   input  wire [15:0] a1_addr_i,
   input  wire [19:0] a1_data_i,
   input  wire [19:0] a1_bitmask_i,
   
   // forward port B0
   input  wire        b0_clk_i,
   input  wire        b0_en_i,
   input  wire        b0_we_i,
   input  wire [15:0] b0_addr_i,
   input  wire [19:0] b0_data_i,
   input  wire [19:0] b0_bitmask_i,
   
   // forward port B1
   input  wire        b1_clk_i,
   input  wire        b1_en_i,
   input  wire        b1_we_i,
   input  wire [15:0] b1_addr_i,
   input  wire [19:0] b1_data_i,
   input  wire [19:0] b1_bitmask_i,

   
   // post-inverted port A0
   output wire        a0_clk_o,
   output wire        a0_en_o,
   output wire        a0_we_o,
   output wire [15:0] a0_addr_o,
   output wire [19:0] a0_data_o,
   output wire [19:0] a0_bitmask_o,
   
   // post-inverted port A1
   output wire        a1_clk_o,
   output wire        a1_en_o,
   output wire        a1_we_o,
   output wire [15:0] a1_addr_o,
   output wire [19:0] a1_data_o,
   output wire [19:0] a1_bitmask_o,
   
   // post-inverted port B0
   output wire        b0_clk_o,
   output wire        b0_en_o,
   output wire        b0_we_o,
   output wire [15:0] b0_addr_o,
   output wire [19:0] b0_data_o,
   output wire [19:0] b0_bitmask_o,
   
   // post-inverted port B1
   output wire        b1_clk_o,
   output wire        b1_en_o,
   output wire        b1_we_o,
   output wire [15:0] b1_addr_o,
   output wire [19:0] b1_data_o,
   output wire [19:0] b1_bitmask_o
   );

   
   // post-inverted port A0
   wire               a0_clk_ninv, a0_clk_inv;

   // 6th stage of clk-tree
   common_clkbuf
     clkbuf_a0(.I(a0_clk_i),
               .Z(a0_clk_ninv));
   common_clkinv
     clkinv_a0(.I(a0_clk_i),
               .ZN(a0_clk_inv));
   
   // 7th stage of clk-tree
   common_clkmux
     clkmux_a0(.I0(a0_clk_ninv),
               .I1(a0_clk_inv),
               .S (cfg_inversion_a0_i[2]),
               .Z (a0_clk_o));
   
   assign a0_en_o      = (cfg_inversion_a0_i[0]==1'b0) ? a0_en_i : ~a0_en_i;
   assign a0_we_o      = (cfg_inversion_a0_i[1]==1'b0) ? a0_we_i : ~a0_we_i;
   assign a0_addr_o    = a0_addr_i;
   assign a0_data_o    = a0_data_i;
   assign a0_bitmask_o = a0_bitmask_i;



   
   // post-inverted port A1
   wire               a1_clk_ninv, a1_clk_inv;

   // 6th stage of clk-tree
   common_clkbuf
     clkbuf_a1(.I(a1_clk_i),
               .Z(a1_clk_ninv));
   common_clkinv
     clkinv_a1(.I(a1_clk_i),
               .ZN(a1_clk_inv));
   
   // 7th stage of clk-tree
   common_clkmux
     clkmux_a1(.I0(a1_clk_ninv),
               .I1(a1_clk_inv),
               .S (cfg_inversion_a1_i[2]),
               .Z (a1_clk_o));
   
   assign a1_en_o      = (cfg_inversion_a1_i[0]==1'b0) ? a1_en_i : ~a1_en_i;
   assign a1_we_o      = (cfg_inversion_a1_i[1]==1'b0) ? a1_we_i : ~a1_we_i;
   assign a1_addr_o    = a1_addr_i;
   assign a1_data_o    = a1_data_i;
   assign a1_bitmask_o = a1_bitmask_i;
   
   

   
   // post-inverted port B0
   wire               b0_clk_ninv, b0_clk_inv;

   // 6th stage of clk-tree
   common_clkbuf
     clkbuf_b0(.I(b0_clk_i),
               .Z(b0_clk_ninv));
   common_clkinv
     clkinv_b0(.I(b0_clk_i),
               .ZN(b0_clk_inv));
   
   // 7th stage of clk-tree
   common_clkmux
     clkmux_b0(.I0(b0_clk_ninv),
               .I1(b0_clk_inv),
               .S (cfg_inversion_b0_i[2]),
               .Z (b0_clk_o));
   
   assign b0_en_o      = (cfg_inversion_b0_i[0]==1'b0) ? b0_en_i : ~b0_en_i;
   assign b0_we_o      = (cfg_inversion_b0_i[1]==1'b0) ? b0_we_i : ~b0_we_i;
   assign b0_addr_o    = b0_addr_i;
   assign b0_data_o    = b0_data_i;
   assign b0_bitmask_o = b0_bitmask_i;


   
   
   // post-inverted port B1
   wire               b1_clk_ninv, b1_clk_inv;

   // 6th stage of clk-tree
   common_clkbuf
     clkbuf_b1(.I(b1_clk_i),
               .Z(b1_clk_ninv));
   common_clkinv
     clkinv_b1(.I(b1_clk_i),
               .ZN(b1_clk_inv));
   
   // 7th stage of clk-tree
   common_clkmux
     clkmux_b1(.I0(b1_clk_ninv),
               .I1(b1_clk_inv),
               .S (cfg_inversion_b1_i[2]),
               .Z (b1_clk_o));
   
   assign b1_en_o      = (cfg_inversion_b1_i[0]==1'b0) ? b1_en_i : ~b1_en_i;
   assign b1_we_o      = (cfg_inversion_b1_i[1]==1'b0) ? b1_we_i : ~b1_we_i;
   assign b1_addr_o    = b1_addr_i;
   assign b1_data_o    = b1_data_i;
   assign b1_bitmask_o = b1_bitmask_i;

endmodule // signal_inversion

