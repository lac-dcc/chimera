// Company           :   RacyICs GmbH
// Author            :   winter
// E-Mail            :   <email>
//
// Filename          :   output_registering.v
// Project Name      :   p_cc
// Subproject Name   :   s_fpga
// Description       :   <short description>
//
// Create Date       :   Tue Aug  6 12:47:52 2013
// Last Change       :   $Date: 2017-02-17 08:13:17 +0100 (Fri, 17 Feb 2017) $
// by                :   $Author: glueck $
//------------------------------------------------------------

`timescale 1 ns / 1 ps

module output_registering
  #(parameter  CONFIG_TDP_NONSPLIT = 3'd0,
    parameter  CONFIG_TDP_SPLIT    = 3'd1,
    parameter  CONFIG_SDP_NONSPLIT = 3'd2,
    parameter  CONFIG_SDP_SPLIT    = 3'd3,
    parameter  CONFIG_FIFO_ASYNC   = 3'd7,
    parameter  CONFIG_FIFO_SYNC    = 3'd6,
    parameter  CONFIG_CASCADE_UP   = 3'd5,
    parameter  CONFIG_CASCADE_LOW  = 3'd4
    )
   (input  wire [2:0]  cfg_sram_mode_i,
    input wire         cfg_set_outputreg_a0_i,
    input wire         cfg_set_outputreg_a1_i,
    input wire         cfg_set_outputreg_b0_i,
    input wire         cfg_set_outputreg_b1_i,
    input wire         cfg_fifo_enable_i,

    // port clocks coming from signal_inversion with 7 stages up to now
    input wire         a0_clk_i,
    input wire         a1_clk_i,
    input wire         b0_clk_i,
    input wire         b1_clk_i,

    // signals from mode_deselection/ECC
    input wire [19:0]  a0_rddata_i,
    input wire [19:0]  a1_rddata_i,
    input wire [19:0]  b0_rddata_i,
    input wire [19:0]  b1_rddata_i,

    // signals to DPSRAM-output ports
    output wire [19:0] a0_rddata_o,
    output wire [19:0] a1_rddata_o,
    output wire [19:0] b0_rddata_o,
    output wire [19:0] b1_rddata_o,

    input wire [1:0]   ecc_single_error_flag_i,
    input wire [1:0]   ecc_double_error_flag_i,
    output wire [1:0]  ecc_single_error_flag_o,
    output wire [1:0]  ecc_double_error_flag_o
    );

   wire               a0_clk, a1_clk, b0_clk, b1_clk;
   wire               a0_reg_clk, a1_reg_clk, b0_reg_clk, b1_reg_clk;
   wire               ecc0_clk, ecc1_clk;

   // ECC-0: a0_clk_i -> TDP_NONSPLIT (port A)
   //        b0_clk_i -> SDP_NONSPLIT (B read port)
   //                 -> SDP_SPLIT (B0 read port)
   //
   // ECC-1: b0_clk_i -> TDP_NONSPLIT (port B)
   //        b1_clk_i -> SDP_SPLIT (B1 read port)

   // 8th stage of clk-tree: selects clocks according to SPLIT/NONSPLIT mode
   common_clkbuf
     clkbuf_a0(.I(a0_clk_i),
               .Z(a0_clk));
   common_clkmux
     clkmux_a1(.I0(a0_clk_i),
               .I1(a1_clk_i),
               .S ((cfg_sram_mode_i==CONFIG_TDP_SPLIT) ||
                   (cfg_sram_mode_i==CONFIG_SDP_SPLIT)),
               .Z (a1_clk));
   common_clkbuf
     clkbuf_b0(.I(b0_clk_i),
               .Z(b0_clk));
   common_clkmux
     clkmux_b1(.I0(b0_clk_i),
               .I1(b1_clk_i),
               .S ((cfg_sram_mode_i==CONFIG_TDP_SPLIT) ||
                   (cfg_sram_mode_i==CONFIG_SDP_SPLIT)),
               .Z (b1_clk));

   // 9th stage of clk-tree: selects according to TDP/SDP
   common_clkmux
     clkmux_a0_reg(.I0(a0_clk),
                   .I1(b0_clk),
                   .S ((cfg_sram_mode_i==CONFIG_SDP_NONSPLIT || cfg_sram_mode_i==CONFIG_SDP_SPLIT) && (!cfg_fifo_enable_i)),// B/B0 is read port
                   .Z (a0_reg_clk));
   common_clkmux
     clkmux_a1_reg(.I0(a1_clk),
                   .I1(b1_clk),
                   .S ((cfg_sram_mode_i==CONFIG_SDP_NONSPLIT || cfg_sram_mode_i==CONFIG_SDP_SPLIT) && (!cfg_fifo_enable_i)),// B/B1 is read port
                   .Z (a1_reg_clk));
   common_clkmux
     clkmux_b0_reg(.I0(a0_clk),
                   .I1(b0_clk),
                   .S ((!cfg_fifo_enable_i)),// B/B0 is read port
                   .Z (b0_reg_clk));
   // common_clkbuf
   //   clkbuf_b0_reg(.I(b0_clk),
   //                 .Z(b0_reg_clk));
   common_clkmux
     clkmux_b1_reg(.I0(a1_clk),
                   .I1(b1_clk),
                   .S ((!cfg_fifo_enable_i)),// B/B0 is read port
                   .Z (b1_reg_clk));
   // common_clkbuf
   //   clkbuf_b1_reg(.I(b1_clk),
   //                 .Z(b1_reg_clk));
   common_clkmux
     clkmux_ecc0(.I0(a0_clk),
                 .I1(b0_clk),
                 .S ((cfg_sram_mode_i==CONFIG_SDP_NONSPLIT || cfg_sram_mode_i==CONFIG_SDP_SPLIT) && (!cfg_fifo_enable_i)),// B/B0 is read port
                 .Z (ecc0_clk));
   common_clkmux
     clkmux_ecc1_reg(.I0(b0_clk),
                     .I1(b1_clk),
                     .S (cfg_sram_mode_i==CONFIG_SDP_SPLIT),
                     .Z (ecc1_clk));

   reg [19:0]         r_a0_rddata;
   reg [19:0]         r_a1_rddata;
   reg [19:0]         r_b0_rddata;
   reg [19:0]         r_b1_rddata;
   reg [1:0]          r_ecc_single_error_flag;
   reg [1:0]          r_ecc_double_error_flag;
   always@(posedge a0_reg_clk)  r_a0_rddata <= a0_rddata_i;
   always@(posedge a1_reg_clk)  r_a1_rddata <= a1_rddata_i;
   always@(posedge b0_reg_clk)  r_b0_rddata <= b0_rddata_i;
   always@(posedge b1_reg_clk)  r_b1_rddata <= b1_rddata_i;
   always@(posedge ecc0_clk)    r_ecc_single_error_flag[0] <= ecc_single_error_flag_i[0];
   always@(posedge ecc1_clk)    r_ecc_single_error_flag[1] <= ecc_single_error_flag_i[1];
   always@(posedge ecc0_clk)    r_ecc_double_error_flag[0] <= ecc_double_error_flag_i[0];
   always@(posedge ecc1_clk)    r_ecc_double_error_flag[1] <= ecc_double_error_flag_i[1];

   assign a0_rddata_o = (cfg_set_outputreg_a0_i) ? r_a0_rddata : a0_rddata_i;
   assign a1_rddata_o = (cfg_set_outputreg_a1_i) ? r_a1_rddata : a1_rddata_i;
   assign b0_rddata_o = (cfg_set_outputreg_b0_i) ? r_b0_rddata : b0_rddata_i;
   assign b1_rddata_o = (cfg_set_outputreg_b1_i) ? r_b1_rddata : b1_rddata_i;
   assign ecc_single_error_flag_o[0] = (cfg_set_outputreg_a0_i) ? r_ecc_single_error_flag[0] : ecc_single_error_flag_i[0];
   assign ecc_single_error_flag_o[1] = ((cfg_sram_mode_i==CONFIG_TDP_NONSPLIT && cfg_set_outputreg_b0_i) ||
                                        (cfg_sram_mode_i==CONFIG_SDP_SPLIT    && cfg_set_outputreg_b1_i)) ? r_ecc_single_error_flag[1] : ecc_single_error_flag_i[1];
   assign ecc_double_error_flag_o[0] = (cfg_set_outputreg_a0_i) ? r_ecc_double_error_flag[0] : ecc_double_error_flag_i[0];
   assign ecc_double_error_flag_o[1] = ((cfg_sram_mode_i==CONFIG_TDP_NONSPLIT && cfg_set_outputreg_b0_i) ||
                                        (cfg_sram_mode_i==CONFIG_SDP_SPLIT    && cfg_set_outputreg_b1_i)) ? r_ecc_double_error_flag[1] : ecc_double_error_flag_i[1];

endmodule // output_registering
