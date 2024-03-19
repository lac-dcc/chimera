// Company           :   RacyICs GmbH
// Author            :   winter
// E-Mail            :   <email>
//
// Filename          :   dpsram_block_4x512x20.v
// Project Name      :   p_cc
// Subproject Name   :   s_fpga
// Description       :   <short description>
//
// Create Date       :   Tue Aug  6 12:47:52 2013
// Last Change       :   $Date: 2017-02-17 08:13:17 +0100 (Fri, 17 Feb 2017) $
// by                :   $Author: glueck $
//------------------------------------------------------------

`timescale 1 ns / 1 ps

module dpsram_block_4x512x20
  #(parameter CONFIG_1BIT  = 3'd1, //non-split-->32k x 1 bit; split-->16K x 1 bit
    parameter CONFIG_2BIT  = 3'd2, //non-split-->16k x 2 bit; split-->8K x 2 bit
    parameter CONFIG_5BIT  = 3'd3, //non-split-->8k  x 5 bit; split-->4K x 5 bit
    parameter CONFIG_10BIT = 3'd4, //non-split-->4k  x 10 bit; split-->2K x 10 bit
    parameter CONFIG_20BIT = 3'd5, //non-split-->2k  x 20 bit; split-->1K x 20 bit
    parameter CONFIG_40BIT = 3'd6, //non-split-->1K  x 40 bit; split (SPR)-->512 x 40 bit
    parameter CONFIG_80BIT = 3'd7, //non-split(SPR)-->512 x 80 bit; split-->NA

    parameter  CONFIG_TDP_NONSPLIT = 3'd0,
    parameter  CONFIG_TDP_SPLIT    = 3'd1,
    parameter  CONFIG_SDP_NONSPLIT = 3'd2,
    parameter  CONFIG_SDP_SPLIT    = 3'd3,
    parameter  CONFIG_FIFO_ASYNC   = 3'd7,
    parameter  CONFIG_FIFO_SYNC    = 3'd6,
    parameter  CONFIG_CASCADE_UP   = 3'd5,
    parameter  CONFIG_CASCADE_LOW  = 3'd4
    )
  (
   // testmode
   testmode_i,
   testmode_o,
   // Configuration interface
   ram_cfg,
   cfg_gx_i,
   cfg_addr_i,
   cfg_data_i,
   cfg_set_all_i,
   cfg_gx_o,
   cfg_addr_o,
   cfg_data_o,
   cfg_set_all_o,

//   cdyn_almost_empty_offset_i,
//   cdyn_almost_full_offset_i,
   cdyn_cfg_forward_a_addr_i,
   cdyn_cfg_forward_b_addr_i,

   // Interface for BIST and preloading
   bist_enable_i,
   bist_wrdata_i,
   bist_rddata_i,
   bist_enable_o,
   bist_wrdata_o,
   bist_rddata_o,


   // Global clocks
   global_clk_x1_i,
   global_clk_x2_i,
   global_clk_y1_i,
   global_clk_y2_i,

   // outputs of global clocks on left side
   left_clock1_o,
   left_clock2_o,
   left_clock3_o,
   left_clock4_o,
   // outputs of global clocks on rightt side
   right_clock1_o,
   right_clock2_o,
   right_clock3_o,
   right_clock4_o,


   // DPSRAM-block port A0
   a0_clk1_i,
   a0_clk2_i,
   a0_en1_i,
   a0_en2_i,
   a0_we1_i,
   a0_we2_i,
   a0_addr1_i,
   a0_addr2_dblin_i,
   a0_wrdata_i,
   a0_bitmask_i,
   a0_rddata_o,

   // DPSRAM-block port A1
   a1_clk1_i,
   a1_clk2_i,
   a1_en1_i,
   a1_en2_i,
   a1_we1_i,
   a1_we2_i,
   a1_addr1_i,
   a1_addr2_dblin_i,
   a1_wrdata_i,
   a1_bitmask_i,
   a1_rddata_o,

   // DPSRAM-block port B0
   b0_clk1_i,
   b0_clk2_i,
   b0_en1_i,
   b0_en2_i,
   b0_we1_i,
   b0_we2_i,
   b0_addr1_i,
   b0_addr2_dblin_i,
   b0_wrdata_i,
   b0_bitmask_i,
   b0_rddata_o,

   // DPSRAM-block port B1
   b1_clk1_i,
   b1_clk2_i,
   b1_en1_i,
   b1_en2_i,
   b1_we1_i,
   b1_we2_i,
   b1_addr1_i,
   b1_addr2_dblin_i,
   b1_wrdata_i,
   b1_bitmask_i,
   b1_rddata_o,


   // forward signals cascade mode
   forward_cascade_wrdata_a_i,
   forward_cascade_wrdata_b_i,
   forward_cascade_wrdata_a_o,
   forward_cascade_wrdata_b_o,
   forward_cascade_bitmask_a_i,
   forward_cascade_bitmask_b_i,
   forward_cascade_bitmask_a_o,
   forward_cascade_bitmask_b_o,
   forward_cascade_rddata_a_i,
   forward_cascade_rddata_b_i,
   forward_cascade_rddata_a_o,
   forward_cascade_rddata_b_o,


   // forward signals addr
   forward_low_a_addr_i,
   forward_up_a_addr_i,
   forward_low_a_addr_o,
   forward_up_a_addr_o,
   forward_low_b_addr_i,
   forward_up_b_addr_i,
   forward_low_b_addr_o,
   forward_up_b_addr_o,

   // forward signals port A0
   forward_low_a0_clk_i,
   forward_low_a0_en_i,
   forward_low_a0_we_i,
   forward_up_a0_clk_i,
   forward_up_a0_en_i,
   forward_up_a0_we_i,
   forward_low_a0_clk_o,
   forward_low_a0_en_o,
   forward_low_a0_we_o,
   forward_up_a0_clk_o,
   forward_up_a0_en_o,
   forward_up_a0_we_o,

   // forward signals port A1
   forward_low_a1_clk_i,
   forward_low_a1_en_i,
   forward_low_a1_we_i,
   forward_up_a1_clk_i,
   forward_up_a1_en_i,
   forward_up_a1_we_i,
   forward_low_a1_clk_o,
   forward_low_a1_en_o,
   forward_low_a1_we_o,
   forward_up_a1_clk_o,
   forward_up_a1_en_o,
   forward_up_a1_we_o,

   // forward signals port B0
   forward_low_b0_clk_i,
   forward_low_b0_en_i,
   forward_low_b0_we_i,
   forward_up_b0_clk_i,
   forward_up_b0_en_i,
   forward_up_b0_we_i,
   forward_low_b0_clk_o,
   forward_low_b0_en_o,
   forward_low_b0_we_o,
   forward_up_b0_clk_o,
   forward_up_b0_en_o,
   forward_up_b0_we_o,

   // forward signals port B1
   forward_low_b1_clk_i,
   forward_low_b1_en_i,
   forward_low_b1_we_i,
   forward_up_b1_clk_i,
   forward_up_b1_en_i,
   forward_up_b1_we_i,
   forward_low_b1_clk_o,
   forward_low_b1_en_o,
   forward_low_b1_we_o,
   forward_up_b1_clk_o,
   forward_up_b1_en_o,
   forward_up_b1_we_o,


   // ECC status signal
   lo_left_ecc_single_error_flag_o,
   up_left_ecc_single_error_flag_o,
   lo_right_ecc_single_error_flag_o,
   up_right_ecc_single_error_flag_o,

   lo_left_ecc_double_error_flag_o,
   up_left_ecc_double_error_flag_o,
   lo_right_ecc_double_error_flag_o,
   up_right_ecc_double_error_flag_o,

   //`include "con_ram_left.ports.V"
   //`include "con_ram_right.ports.V"


   // FIFO status data
   fifo_rstn_i,
   left1_fifo_full_o,
   left2_fifo_full_o,
   left1_fifo_empty_o,
   left2_fifo_empty_o,
   left1_fifo_almost_full_o,
   left2_fifo_almost_full_o,
   left1_fifo_almost_empty_o,
   left2_fifo_almost_empty_o,
   left1_fifo_write_error_o,
   left2_fifo_write_error_o,
   left1_fifo_read_error_o,
   left2_fifo_read_error_o,
   fifo_write_address_o,
   fifo_read_address_o,
   
   //CC_DIRTY_FIX
   lo_y1CFG_GLOBAL_DEC_Y_i
   
   );

input lo_y1CFG_GLOBAL_DEC_Y_i;

   //`include "con_ram_left.ios.V"
   //`include "con_ram_right.ios.V"

    //testmode
    input wire testmode_i;
    output wire testmode_o;

// Configuration interface
   input  wire [215:0] ram_cfg;
   input  wire        cfg_gx_i;
   input  wire [4:0]  cfg_addr_i;
   input  wire [7:0]  cfg_data_i;
   input  wire        cfg_set_all_i;

   output  wire       cfg_gx_o;
   output  wire [4:0] cfg_addr_o;
   output  wire [7:0] cfg_data_o;
   output  wire       cfg_set_all_o;

//   input  wire [14:0] cdyn_almost_empty_offset_i;
//   input  wire [14:0] cdyn_almost_full_offset_i;
   input  wire [7:0]  cdyn_cfg_forward_a_addr_i;
   input  wire [7:0]  cdyn_cfg_forward_b_addr_i;

   // Interface for BIST and preloading
   input  wire        bist_enable_i;
   input  wire [39:0] bist_wrdata_i;
   input  wire [39:0] bist_rddata_i;
   output wire        bist_enable_o;
   output wire [39:0] bist_wrdata_o;
   output wire [39:0] bist_rddata_o;


   // Global clocks
   input  wire        global_clk_x1_i;
   input  wire        global_clk_x2_i;
   input  wire        global_clk_y1_i;
   input  wire        global_clk_y2_i;
   // outputs of global clocks on left side
   output  wire        left_clock1_o;
   output  wire        left_clock2_o;
   output  wire        left_clock3_o;
   output  wire        left_clock4_o;
   // outputs of global clocks on rightt side
   output  wire        right_clock1_o;
   output  wire        right_clock2_o;
   output  wire        right_clock3_o;
   output  wire        right_clock4_o;

   // DPSRAM-block port A0
   input  wire        a0_clk1_i;
   input  wire        a0_clk2_i;
   input  wire        a0_en1_i;
   input  wire        a0_en2_i;
   input  wire        a0_we1_i;
   input  wire        a0_we2_i;
   input  wire [15:0] a0_addr1_i;
   input  wire [7:0] a0_addr2_dblin_i;
   input  wire [19:0] a0_wrdata_i;
   input  wire [19:0] a0_bitmask_i;
   output wire [19:0] a0_rddata_o;

   // DPSRAM-block port A1
   input  wire        a1_clk1_i;
   input  wire        a1_clk2_i;
   input  wire        a1_en1_i;
   input  wire        a1_en2_i;
   input  wire        a1_we1_i;
   input  wire        a1_we2_i;
   input  wire [15:0] a1_addr1_i;
   input  wire [7:0] a1_addr2_dblin_i;
   input  wire [19:0] a1_wrdata_i;
   input  wire [19:0] a1_bitmask_i;
   output wire [19:0] a1_rddata_o;

   // DPSRAM-block port B0
   input  wire        b0_clk1_i;
   input  wire        b0_clk2_i;
   input  wire        b0_en1_i;
   input  wire        b0_en2_i;
   input  wire        b0_we1_i;
   input  wire        b0_we2_i;
   input  wire [15:0] b0_addr1_i;
   input  wire [7:0] b0_addr2_dblin_i;
   input  wire [19:0] b0_wrdata_i;
   input  wire [19:0] b0_bitmask_i;
   output wire [19:0] b0_rddata_o;

   // DPSRAM-block port B1
   input  wire        b1_clk1_i;
   input  wire        b1_clk2_i;
   input  wire        b1_en1_i;
   input  wire        b1_en2_i;
   input  wire        b1_we1_i;
   input  wire        b1_we2_i;
   input  wire [15:0] b1_addr1_i;
   input  wire [7:0] b1_addr2_dblin_i;
   input  wire [19:0] b1_wrdata_i;
   input  wire [19:0] b1_bitmask_i;
   output wire [19:0] b1_rddata_o;


   // forward signals cascade mode
   input  wire        forward_cascade_wrdata_a_i;
   input  wire        forward_cascade_wrdata_b_i;
   output wire        forward_cascade_wrdata_a_o;
   output wire        forward_cascade_wrdata_b_o;
   input  wire        forward_cascade_bitmask_a_i;
   input  wire        forward_cascade_bitmask_b_i;
   output wire        forward_cascade_bitmask_a_o;
   output wire        forward_cascade_bitmask_b_o;
   input  wire        forward_cascade_rddata_a_i;
   input  wire        forward_cascade_rddata_b_i;
   output wire        forward_cascade_rddata_a_o;
   output wire        forward_cascade_rddata_b_o;


   // forward signals addr
   input  wire [15:0] forward_low_a_addr_i;
   input  wire [15:0] forward_up_a_addr_i;
   output wire [15:0] forward_low_a_addr_o;
   output wire [15:0] forward_up_a_addr_o;
   input  wire [15:0] forward_low_b_addr_i;
   input  wire [15:0] forward_up_b_addr_i;
   output wire [15:0] forward_low_b_addr_o;
   output wire [15:0] forward_up_b_addr_o;

   // forward signals port A0
   input  wire        forward_low_a0_clk_i;
   input  wire        forward_low_a0_en_i;
   input  wire        forward_low_a0_we_i;
   input  wire        forward_up_a0_clk_i;
   input  wire        forward_up_a0_en_i;
   input  wire        forward_up_a0_we_i;
   output wire        forward_low_a0_clk_o;
   output wire        forward_low_a0_en_o;
   output wire        forward_low_a0_we_o;
   output wire        forward_up_a0_clk_o;
   output wire        forward_up_a0_en_o;
   output wire        forward_up_a0_we_o;

   // forward signals port A1
   input  wire        forward_low_a1_clk_i;
   input  wire        forward_low_a1_en_i;
   input  wire        forward_low_a1_we_i;
   input  wire        forward_up_a1_clk_i;
   input  wire        forward_up_a1_en_i;
   input  wire        forward_up_a1_we_i;
   output wire        forward_low_a1_clk_o;
   output wire        forward_low_a1_en_o;
   output wire        forward_low_a1_we_o;
   output wire        forward_up_a1_clk_o;
   output wire        forward_up_a1_en_o;
   output wire        forward_up_a1_we_o;

   // forward signals port B0
   input  wire        forward_low_b0_clk_i;
   input  wire        forward_low_b0_en_i;
   input  wire        forward_low_b0_we_i;
   input  wire        forward_up_b0_clk_i;
   input  wire        forward_up_b0_en_i;
   input  wire        forward_up_b0_we_i;
   output wire        forward_low_b0_clk_o;
   output wire        forward_low_b0_en_o;
   output wire        forward_low_b0_we_o;
   output wire        forward_up_b0_clk_o;
   output wire        forward_up_b0_en_o;
   output wire        forward_up_b0_we_o;

   // forward signals port B1
   input  wire        forward_low_b1_clk_i;
   input  wire        forward_low_b1_en_i;
   input  wire        forward_low_b1_we_i;
   input  wire        forward_up_b1_clk_i;
   input  wire        forward_up_b1_en_i;
   input  wire        forward_up_b1_we_i;
   output wire        forward_low_b1_clk_o;
   output wire        forward_low_b1_en_o;
   output wire        forward_low_b1_we_o;
   output wire        forward_up_b1_clk_o;
   output wire        forward_up_b1_en_o;
   output wire        forward_up_b1_we_o;


   // ECC status signal
   output wire [1:0]  lo_left_ecc_single_error_flag_o;
   output wire [1:0]  up_left_ecc_single_error_flag_o;
   output wire [1:0]  lo_right_ecc_single_error_flag_o;
   output wire [1:0]  up_right_ecc_single_error_flag_o;
   output wire [1:0]  lo_left_ecc_double_error_flag_o;
   output wire [1:0]  up_left_ecc_double_error_flag_o;
   output wire [1:0]  lo_right_ecc_double_error_flag_o;
   output wire [1:0]  up_right_ecc_double_error_flag_o;


   // FIFO status data
   input  wire        fifo_rstn_i;
   output wire        left1_fifo_full_o;
   output wire        left2_fifo_full_o;
   output wire        left1_fifo_empty_o;
   output wire        left2_fifo_empty_o;
   output wire        left1_fifo_almost_full_o;
   output wire        left2_fifo_almost_full_o;
   output wire        left1_fifo_almost_empty_o;
   output wire        left2_fifo_almost_empty_o;
   output wire        left1_fifo_write_error_o;
   output wire        left2_fifo_write_error_o;
   output wire        left1_fifo_read_error_o;
   output wire        left2_fifo_read_error_o;
   output wire [15:0] fifo_write_address_o;
   output wire [15:0] fifo_read_address_o;


    wire [14:0]       cdyn_almost_empty_offset_i;
    wire [14:0]       cdyn_almost_full_offset_i;
    wire [15:0]       int_a0_addr2;
    wire [15:0]       int_a1_addr2;
    wire [15:0]       int_b0_addr2;
    wire [15:0]       int_b1_addr2;


    wire              cfg_gy;

   wire [7:0]         cfg_forward_a_addr;
   wire [7:0]         cfg_forward_b_addr;
   wire [7:0]         cfg_forward_a0_clk;
   wire [7:0]         cfg_forward_a0_en;
   wire [7:0]         cfg_forward_a0_we;
   wire [7:0]         cfg_forward_a1_clk;
   wire [7:0]         cfg_forward_a1_en;
   wire [7:0]         cfg_forward_a1_we;
   wire [7:0]         cfg_forward_b0_clk;
   wire [7:0]         cfg_forward_b0_en;
   wire [7:0]         cfg_forward_b0_we;
   wire [7:0]         cfg_forward_b1_clk;
   wire [7:0]         cfg_forward_b1_en;
   wire [7:0]         cfg_forward_b1_we;

   wire [2:0]         cfg_sram_mode;
   wire [2:0]         cfg_input_config_a0;
   wire [2:0]         cfg_input_config_a1;
   wire [2:0]         cfg_input_config_b0;
   wire [2:0]         cfg_input_config_b1;
   wire [2:0]         cfg_output_config_a0;
   wire [2:0]         cfg_output_config_a1;
   wire [2:0]         cfg_output_config_b0;
   wire [2:0]         cfg_output_config_b1;
   wire               cfg_writemode_a0;
   wire               cfg_writemode_a1;
   wire               cfg_writemode_b0;
   wire               cfg_writemode_b1;
   wire               cfg_set_outputreg_a0;
   wire               cfg_set_outputreg_a1;
   wire               cfg_set_outputreg_b0;
   wire               cfg_set_outputreg_b1;

   wire [2:0]         cfg_inversion_a0;
   wire [2:0]         cfg_inversion_a1;
   wire [2:0]         cfg_inversion_b0;
   wire [2:0]         cfg_inversion_b1;

   wire [1:0]         cfg_ecc_enable;
   wire [1:0]         cfg_dyn_stat_select;
   wire [1:0]         cfg_cascade_enable;

   wire [1:0]         cfg_fifo_sync_enable;
   wire [1:0]         cfg_fifo_async_enable;
   wire [14:0]        cfg_almost_empty_offset;
   wire [14:0]        cfg_almost_full_offset;

   wire [5:0]         cfg_sram_delay;
   wire [3:0]         cfg_datbm_sel;

    wire [27*8-1:0]    cfg;

//    wire               testmode_i;
//    assign testmode_i=1'b0;

    wire               test_se;
    common_and2 i_scan_en_gate (.A1(bist_enable_i),
                                .A2(testmode_i),
                                .Z(test_se)
                                );

    //multiplex scanclock to all clk inputs for DFT
    wire               global_clk_x2_dft;
   common_clkmux clkmux_global_clk_x2_dft (.I0(global_clk_x2_i),
                                           .I1(global_clk_x1_i),
                                           .S (testmode_i),
                                           .Z (global_clk_x2_dft));
    wire               global_clk_y1_dft;
   common_clkmux clkmux_global_clk_y1_dft (.I0(global_clk_y1_i),
                                           .I1(global_clk_x1_i),
                                           .S (testmode_i),
                                           .Z (global_clk_y1_dft));
    wire               global_clk_y2_dft;
   common_clkmux clkmux_global_clk_y2_dft (.I0(global_clk_y2_i),
                                           .I1(global_clk_x1_i),
                                           .S (testmode_i),
                                           .Z (global_clk_y2_dft));

    wire               a0_clk1_dft;
   common_clkmux clkmux_a0_clk1_dft (.I0(a0_clk1_i),
                                     .I1(global_clk_x1_i),
                                     .S (testmode_i),
                                     .Z (a0_clk1_dft));
    wire               a0_clk2_dft;
   common_clkmux clkmux_a0_clk2_dft (.I0(a0_clk2_i),
                                     .I1(global_clk_x1_i),
                                     .S (testmode_i),
                                     .Z (a0_clk2_dft));
    wire               a1_clk1_dft;
   common_clkmux clkmux_a1_clk1_dft (.I0(a1_clk1_i),
                                     .I1(global_clk_x1_i),
                                     .S (testmode_i),
                                     .Z (a1_clk1_dft));
    wire               a1_clk2_dft;
   common_clkmux clkmux_a1_clk2_dft (.I0(a1_clk2_i),
                                     .I1(global_clk_x1_i),
                                     .S (testmode_i),
                                     .Z (a1_clk2_dft));
    wire               b0_clk1_dft;
   common_clkmux clkmux_b0_clk1_dft (.I0(b0_clk1_i),
                                     .I1(global_clk_x1_i),
                                     .S (testmode_i),
                                     .Z (b0_clk1_dft));
    wire               b0_clk2_dft;
   common_clkmux clkmux_b0_clk2_dft (.I0(b0_clk2_i),
                                     .I1(global_clk_x1_i),
                                     .S (testmode_i),
                                     .Z (b0_clk2_dft));
    wire               b1_clk1_dft;
   common_clkmux clkmux_b1_clk1_dft (.I0(b1_clk1_i),
                                     .I1(global_clk_x1_i),
                                     .S (testmode_i),
                                     .Z (b1_clk1_dft));
    wire               b1_clk2_dft;
   common_clkmux clkmux_b1_clk2_dft (.I0(b1_clk2_i),
                                     .I1(global_clk_x1_i),
                                     .S (testmode_i),
                                     .Z (b1_clk2_dft));

    wire               forward_low_a0_clk_dft;
   common_clkmux clkmux_forward_low_a0_clk_dft (.I0(forward_low_a0_clk_i),
                                                .I1(global_clk_x1_i),
                                                .S (testmode_i),
                                                .Z (forward_low_a0_clk_dft));
    wire               forward_low_a1_clk_dft;
   common_clkmux clkmux_forward_low_a1_clk_dft (.I0(forward_low_a1_clk_i),
                                                .I1(global_clk_x1_i),
                                                .S (testmode_i),
                                                .Z (forward_low_a1_clk_dft));
    wire               forward_low_b0_clk_dft;
   common_clkmux clkmux_forward_low_b0_clk_dft (.I0(forward_low_b0_clk_i),
                                                .I1(global_clk_x1_i),
                                                .S (testmode_i),
                                                .Z (forward_low_b0_clk_dft));
    wire               forward_low_b1_clk_dft;
   common_clkmux clkmux_forward_low_b1_clk_dft (.I0(forward_low_b1_clk_i),
                                                .I1(global_clk_x1_i),
                                                .S (testmode_i),
                                                .Z (forward_low_b1_clk_dft));

    wire               forward_up_a0_clk_dft;
   common_clkmux clkmux_forward_up_a0_clk_dft (.I0(forward_up_a0_clk_i),
                                                .I1(global_clk_x1_i),
                                                .S (testmode_i),
                                                .Z (forward_up_a0_clk_dft));
    wire               forward_up_a1_clk_dft;
   common_clkmux clkmux_forward_up_a1_clk_dft (.I0(forward_up_a1_clk_i),
                                                .I1(global_clk_x1_i),
                                                .S (testmode_i),
                                                .Z (forward_up_a1_clk_dft));
    wire               forward_up_b0_clk_dft;
   common_clkmux clkmux_forward_up_b0_clk_dft (.I0(forward_up_b0_clk_i),
                                                .I1(global_clk_x1_i),
                                                .S (testmode_i),
                                                .Z (forward_up_b0_clk_dft));
    wire               forward_up_b1_clk_dft;
   common_clkmux clkmux_forward_up_b1_clk_dft (.I0(forward_up_b1_clk_i),
                                                .I1(global_clk_x1_i),
                                                .S (testmode_i),
                                                .Z (forward_up_b1_clk_dft));

    wire [27*8-1:0]    cfg_from_latches;
    assign cfg_from_latches = ram_cfg;
/*
    cfg_stack
      #(.BYTE_SIZE(27))
    CFG_LATCH_i (
                 .ADDR       ({3'd0,cfg_addr_i}),
                 .DATA_IN    (cfg_data_i),
                 .G          (cfg_gx_i && cfg_gy && !bist_enable_i),
                 .SEL_ALL    (cfg_set_all_i),
                 .DATA_OUT   (cfg_from_latches),
                 .DATA_OUTinv()
                 );
*/
    wire [27*8-1:0]     cfg_dft;
    assign cfg_dft=216'b0;
    
    genvar             geni;
    generate
        for (geni=0; geni<27*8; geni=geni+1) begin: mux_cfg_dft
            common_mux2 i_common_mux_cfg_dft (
                                              .I0(cfg_from_latches[geni]),
                                              .I1(cfg_dft[geni]),
                                              .S(testmode_i),
                                              .Z(cfg[geni])
                                              );
        end
    endgenerate
    assign cfg_gy   = lo_y1CFG_GLOBAL_DEC_Y_i;
    assign cfg_gx_o = cfg_gx_i;
    assign cfg_addr_o = cfg_addr_i;
    assign cfg_data_o = cfg_data_i;
    assign cfg_set_all_o = cfg_set_all_i;

   //forwarding of data for BIST and preloading
   assign bist_enable_o           = bist_enable_i;
   assign bist_wrdata_o           = bist_wrdata_i;

    assign testmode_o             = testmode_i;

    assign left_clock1_o    = global_clk_x1_i;
    assign left_clock2_o    = global_clk_x2_i;
    assign left_clock3_o    = global_clk_y1_i;
    assign left_clock4_o    = global_clk_y2_i;
    assign right_clock1_o   = global_clk_x1_i;
    assign right_clock2_o   = global_clk_x2_i;
    assign right_clock3_o   = global_clk_y1_i;
    assign right_clock4_o   = global_clk_y2_i;

   wire               bist_active = (bist_enable_i == 1'b1) && cfg_gy;

    wire              port_select = forward_low_a0_clk_i;

//  `include "con_ram_left.circuit.V"
//  `include "con_ram_right.circuit.V"

//  `include "./includes/dpsram.assign.v"
    assign cdyn_almost_empty_offset_i[0] = a0_bitmask_i[0];
    assign cdyn_almost_empty_offset_i[1] = a0_bitmask_i[1];
    assign cdyn_almost_empty_offset_i[2] = a0_bitmask_i[2];
    assign cdyn_almost_empty_offset_i[3] = a0_bitmask_i[3];
    assign cdyn_almost_empty_offset_i[4] = a0_bitmask_i[4];
    assign cdyn_almost_empty_offset_i[5] = a0_bitmask_i[5];
    assign cdyn_almost_empty_offset_i[6] = a0_bitmask_i[6];
    assign cdyn_almost_empty_offset_i[7] = a0_bitmask_i[7];
    assign cdyn_almost_empty_offset_i[8] = a0_bitmask_i[8];
    assign cdyn_almost_empty_offset_i[9] = a0_bitmask_i[9];
    assign cdyn_almost_empty_offset_i[10] = a0_bitmask_i[10];
    assign cdyn_almost_empty_offset_i[11] = a0_bitmask_i[11];
    assign cdyn_almost_empty_offset_i[12] = a0_bitmask_i[12];
    assign cdyn_almost_empty_offset_i[13] = a0_bitmask_i[13];
    assign cdyn_almost_empty_offset_i[14] = a0_bitmask_i[14];
    assign cdyn_almost_full_offset_i[0] = a1_bitmask_i[0];
    assign cdyn_almost_full_offset_i[1] = a1_bitmask_i[1];
    assign cdyn_almost_full_offset_i[2] = a1_bitmask_i[2];
    assign cdyn_almost_full_offset_i[3] = a1_bitmask_i[3];
    assign cdyn_almost_full_offset_i[4] = a1_bitmask_i[4];
    assign cdyn_almost_full_offset_i[5] = a1_bitmask_i[5];
    assign cdyn_almost_full_offset_i[6] = a1_bitmask_i[6];
    assign cdyn_almost_full_offset_i[7] = a1_bitmask_i[7];
    assign cdyn_almost_full_offset_i[8] = a1_bitmask_i[8];
    assign cdyn_almost_full_offset_i[9] = a1_bitmask_i[9];
    assign cdyn_almost_full_offset_i[10] = a1_bitmask_i[10];
    assign cdyn_almost_full_offset_i[11] = a1_bitmask_i[11];
    assign cdyn_almost_full_offset_i[12] = a1_bitmask_i[12];
    assign cdyn_almost_full_offset_i[13] = a1_bitmask_i[13];
    assign cdyn_almost_full_offset_i[14] = a1_bitmask_i[14];

    assign int_a0_addr2[0] = a0_addr1_i[0];
    assign int_a0_addr2[1] = a0_addr2_dblin_i[0];
    assign int_a0_addr2[2] = a0_addr1_i[2];
    assign int_a0_addr2[3] = a0_addr2_dblin_i[1];
    assign int_a0_addr2[4] = a0_addr1_i[4];
    assign int_a0_addr2[5] = a0_addr2_dblin_i[2];
    assign int_a0_addr2[6] = a0_addr1_i[6];
    assign int_a0_addr2[7] = a0_addr2_dblin_i[3];
    assign int_a0_addr2[8] = a0_addr1_i[8];
    assign int_a0_addr2[9] = a0_addr2_dblin_i[4];
    assign int_a0_addr2[10] = a0_addr1_i[10];
    assign int_a0_addr2[11] = a0_addr2_dblin_i[5];
    assign int_a0_addr2[12] = a0_addr2_dblin_i[6];
    assign int_a0_addr2[13] = a0_addr1_i[12];
    assign int_a0_addr2[14] = a0_addr2_dblin_i[7];
    assign int_a0_addr2[15] = a0_addr1_i[14];

    assign int_a1_addr2[0] = a1_addr1_i[0];
    assign int_a1_addr2[1] = a1_addr2_dblin_i[0];
    assign int_a1_addr2[2] = a1_addr1_i[2];
    assign int_a1_addr2[3] = a1_addr2_dblin_i[1];
    assign int_a1_addr2[4] = a1_addr1_i[4];
    assign int_a1_addr2[5] = a1_addr2_dblin_i[2];
    assign int_a1_addr2[6] = a1_addr1_i[6];
    assign int_a1_addr2[7] = a1_addr2_dblin_i[3];
    assign int_a1_addr2[8] = a1_addr1_i[8];
    assign int_a1_addr2[9] = a1_addr2_dblin_i[4];
    assign int_a1_addr2[10] = a1_addr1_i[10];
    assign int_a1_addr2[11] = a1_addr2_dblin_i[5];
    assign int_a1_addr2[12] = a1_addr2_dblin_i[6];
    assign int_a1_addr2[13] = a1_addr1_i[12];
    assign int_a1_addr2[14] = a1_addr2_dblin_i[7];
    assign int_a1_addr2[15] = a1_addr1_i[14];


    assign int_b0_addr2[0] = b0_addr2_dblin_i[0];
    assign int_b0_addr2[1] = b0_addr1_i[0];
    assign int_b0_addr2[2] = b0_addr2_dblin_i[1];
    assign int_b0_addr2[3] = b0_addr1_i[2];
    assign int_b0_addr2[4] = b0_addr2_dblin_i[2];
    assign int_b0_addr2[5] = b0_addr1_i[4];
    assign int_b0_addr2[6] = b0_addr2_dblin_i[3];
    assign int_b0_addr2[7] = b0_addr1_i[6];
    assign int_b0_addr2[8] = b0_addr2_dblin_i[4];
    assign int_b0_addr2[9] = b0_addr1_i[8];
    assign int_b0_addr2[10] = b0_addr2_dblin_i[5];
    assign int_b0_addr2[11] = b0_addr1_i[10];
    assign int_b0_addr2[12] = b0_addr1_i[12];
    assign int_b0_addr2[13] = b0_addr2_dblin_i[6];
    assign int_b0_addr2[14] = b0_addr1_i[14];
    assign int_b0_addr2[15] = b0_addr2_dblin_i[7];

    assign int_b1_addr2[0] = b1_addr2_dblin_i[0];
    assign int_b1_addr2[1] = b1_addr1_i[0];
    assign int_b1_addr2[2] = b1_addr2_dblin_i[1];
    assign int_b1_addr2[3] = b1_addr1_i[2];
    assign int_b1_addr2[4] = b1_addr2_dblin_i[2];
    assign int_b1_addr2[5] = b1_addr1_i[4];
    assign int_b1_addr2[6] = b1_addr2_dblin_i[3];
    assign int_b1_addr2[7] = b1_addr1_i[6];
    assign int_b1_addr2[8] = b1_addr2_dblin_i[4];
    assign int_b1_addr2[9] = b1_addr1_i[8];
    assign int_b1_addr2[10] = b1_addr2_dblin_i[5];
    assign int_b1_addr2[11] = b1_addr1_i[10];
    assign int_b1_addr2[12] = b1_addr1_i[12];
    assign int_b1_addr2[13] = b1_addr2_dblin_i[6];
    assign int_b1_addr2[14] = b1_addr1_i[14];
    assign int_b1_addr2[15] = b1_addr2_dblin_i[7];

    //multiplex input for BIST to port B if needed (input is fed in via forward_low_a_x)
    wire [15:0]       forward_low_b_addr_bist;
    wire              forward_low_b0_en_bist;
    wire              forward_low_b0_we_bist;

    assign forward_low_b_addr_bist = ((port_select=='b1) && bist_enable_i) ? forward_low_a_addr_i : forward_low_b_addr_i;
    assign forward_low_b0_en_bist  = ((port_select=='b1) && bist_enable_i) ? forward_low_a0_en_i : forward_low_b0_en_i;
    assign forward_low_b0_we_bist  = ((port_select=='b1) && bist_enable_i) ? forward_low_a0_we_i : forward_low_b0_we_i;


    // distribute config and multiplex if needed for BIST
   assign cfg_forward_a_addr      = (bist_enable_i) ? {8'b00100010} : (cfg_dyn_stat_select[0]) ? {cdyn_cfg_forward_a_addr_i} : cfg[7:0] ;     // byte 0
   assign cfg_forward_b_addr      = (bist_enable_i) ? {8'b00100010} : (cfg_dyn_stat_select[0]) ? {cdyn_cfg_forward_b_addr_i} : cfg[15:8];    // byte 1
   assign cfg_forward_a0_clk      = (bist_enable_i) ? 8'b10100011 : cfg[23:16];   //8'b10000001 : cfg[23:16];   // byte 2
   assign cfg_forward_a0_en       = (bist_active && (port_select == 'b0)) ? 8'b10000001 : (bist_enable_i) ? 8'b10000011 : cfg[31:24];   // byte 3
   assign cfg_forward_a0_we       = (bist_enable_i) ? 8'b10000001 : cfg[39:32];   // byte 4
   assign cfg_forward_a1_clk      = cfg[47:40];   // byte 5
   assign cfg_forward_a1_en       = cfg[55:48];   // byte 6
   assign cfg_forward_a1_we       = cfg[63:56];   // byte 7
   assign cfg_forward_b0_clk      = (bist_enable_i) ? 8'b10100011 : cfg[71:64];   // byte 8
   assign cfg_forward_b0_en       = (bist_active && (port_select == 'b1)) ? 8'b10000001 : (bist_enable_i) ? 8'b10000011 : cfg[79:72];   // byte 9
   assign cfg_forward_b0_we       = (bist_enable_i) ? 8'b10000001 :cfg[87:80];   // byte 10
   assign cfg_forward_b1_clk      = cfg[95:88];   // byte 11
   assign cfg_forward_b1_en       = cfg[103:96];  // byte 12
   assign cfg_forward_b1_we       = cfg[111:104]; // byte 13

   assign cfg_sram_mode           = (bist_enable_i) ?  CONFIG_TDP_NONSPLIT : {1'b0,cfg[113:112]}; // byte 14
   assign cfg_input_config_a0     = (bist_enable_i) ? 3'b110 : cfg[116:114]; // byte 14
   assign cfg_input_config_a1     = cfg[119:117]; // byte 14
   assign cfg_input_config_b0     = (bist_enable_i) ? 3'b110 : cfg[123:121]; // byte 15
   assign cfg_input_config_b1     = cfg[126:124]; // byte 15
   assign cfg_output_config_a0    = (bist_enable_i) ? 3'b110 : cfg[129:127]; // byte 15/16
   assign cfg_output_config_a1    = cfg[132:130]; // byte 16
   assign cfg_output_config_b0    = (bist_enable_i) ? 3'b110 : cfg[135:133]; // byte 16
   assign cfg_output_config_b1    = cfg[138:136]; // byte 17

   assign cfg_writemode_a0        = (bist_enable_i) ? 1'b0 : cfg[144];     // byte 18
   assign cfg_writemode_a1        = cfg[145];     // byte 18
   assign cfg_writemode_b0        = (bist_enable_i) ? 1'b0 : cfg[146];     // byte 18
   assign cfg_writemode_b1        = cfg[147];     // byte 18
   assign cfg_set_outputreg_a0    = (bist_enable_i) ? 1'b0 : cfg[148];     // byte 18
   assign cfg_set_outputreg_a1    = cfg[149];     // byte 18
   assign cfg_set_outputreg_b0    = (bist_enable_i) ? 1'b0 : cfg[150];     // byte 18
   assign cfg_set_outputreg_b1    = cfg[151];     // byte 18

   assign cfg_inversion_a0        = (bist_enable_i) ? 3'b000 : cfg[154:152]; // byte 19
   assign cfg_inversion_a1        = cfg[157:155]; // byte 19
   assign cfg_inversion_b0        = (bist_enable_i) ? 3'b000 :cfg[160:158]; // byte 19/20
   assign cfg_inversion_b1        = cfg[163:161]; // byte 20
   assign cfg_ecc_enable          = (bist_enable_i) ? 2'b00 : cfg[165:164]; // byte 20
   assign cfg_dyn_stat_select     = (bist_enable_i) ? 2'b00 : cfg[167:166]; // byte 20

   assign cfg_fifo_sync_enable    = (bist_enable_i) ? 2'b00 : {1'b0,cfg[183]};
   assign cfg_almost_empty_offset = (cfg_dyn_stat_select[1]) ? cdyn_almost_empty_offset_i : cfg[182:168]; // byte 21/22
   assign cfg_fifo_async_enable   = (bist_enable_i) ? 2'b00 : {1'b0,cfg[199]};
   assign cfg_almost_full_offset  = (cfg_dyn_stat_select[1]) ? cdyn_almost_full_offset_i  : cfg[198:184]; // byte 23/24

   assign cfg_sram_delay          = cfg[205:200]; // byte 25
   assign cfg_datbm_sel           = (bist_enable_i) ? 4'b0000 : cfg[211:208]; // byte 26
   assign cfg_cascade_enable      = (bist_enable_i) ? 2'b00 : cfg[213:212]; // byte 26


   // post-forward-selected signal A0
   wire               post_forward_a0_clk;
   wire               post_forward_a0_en;
   wire               post_forward_a0_we;
   wire [15:0]        post_forward_a0_addr;
   wire [19:0]        post_forward_a0_wrdata;
   wire [19:0]        post_forward_a0_bitmask;

   // post-forward-selected signal A1
   wire               post_forward_a1_clk;
   wire               post_forward_a1_en;
   wire               post_forward_a1_we;
   wire [15:0]        post_forward_a1_addr;
   wire [19:0]        post_forward_a1_wrdata;
   wire [19:0]        post_forward_a1_bitmask;

   // post-forward-selected signal B0
   wire               post_forward_b0_clk;
   wire               post_forward_b0_en;
   wire               post_forward_b0_we;
   wire [15:0]        post_forward_b0_addr;
   wire [19:0]        post_forward_b0_wrdata;
   wire [19:0]        post_forward_b0_bitmask;

   // post-forward-selected signal B1
   wire               post_forward_b1_clk;
   wire               post_forward_b1_en;
   wire               post_forward_b1_we;
   wire [15:0]        post_forward_b1_addr;
   wire [19:0]        post_forward_b1_wrdata;
   wire [19:0]        post_forward_b1_bitmask;


   forward_selection
     forward_selection_i
       (.cfg_forward_a_addr_i(cfg_forward_a_addr),
        .cfg_forward_b_addr_i(cfg_forward_b_addr),

        .cfg_forward_a0_clk_i(cfg_forward_a0_clk),
        .cfg_forward_a0_en_i (cfg_forward_a0_en ),
        .cfg_forward_a0_we_i (cfg_forward_a0_we ),
        .cfg_forward_a1_clk_i(cfg_forward_a1_clk),
        .cfg_forward_a1_en_i (cfg_forward_a1_en ),
        .cfg_forward_a1_we_i (cfg_forward_a1_we ),
        .cfg_forward_b0_clk_i(cfg_forward_b0_clk),
        .cfg_forward_b0_en_i (cfg_forward_b0_en ),
        .cfg_forward_b0_we_i (cfg_forward_b0_we ),
        .cfg_forward_b1_clk_i(cfg_forward_b1_clk),
        .cfg_forward_b1_en_i (cfg_forward_b1_en ),
        .cfg_forward_b1_we_i (cfg_forward_b1_we ),

        .cfg_datbm_sel_i     (cfg_datbm_sel     ),
        .cfg_cascade_enable_i(cfg_cascade_enable),


        // Global clocks
        .global_clk_x1_i(global_clk_x1_i),
        .global_clk_x2_i(global_clk_x2_dft),
        .global_clk_y1_i(global_clk_y1_dft),
        .global_clk_y2_i(global_clk_y2_dft),

        // DPSRAM-block port A0
        .a0_clk1_i   (a0_clk1_dft ),
        .a0_clk2_i   (a0_clk2_dft ),
        .a0_en1_i    (a0_en1_i    ),
        .a0_en2_i    (a0_en2_i    ),
        .a0_we1_i    (a0_we1_i    ),
        .a0_we2_i    (a0_we2_i    ),
        .a0_addr1_i  (a0_addr1_i   ),
        .a0_addr2_i  (int_a0_addr2   ),
        .a0_data_i   (a0_wrdata_i ),
        .a0_bitmask_i(a0_bitmask_i),

        // DPSRAM-block port A1
        .a1_clk1_i   (a1_clk1_dft ),
        .a1_clk2_i   (a1_clk2_dft ),
        .a1_en1_i    (a1_en1_i    ),
        .a1_en2_i    (a1_en2_i    ),
        .a1_we1_i    (a1_we1_i    ),
        .a1_we2_i    (a1_we2_i    ),
        .a1_addr1_i  (a1_addr1_i   ),
        .a1_addr2_i  (int_a1_addr2   ),
        .a1_data_i   (a1_wrdata_i ),
        .a1_bitmask_i(a1_bitmask_i),

        // DPSRAM-block port B0
        .b0_clk1_i   (b0_clk1_dft ),
        .b0_clk2_i   (b0_clk2_dft ),
        .b0_en1_i    (b0_en1_i    ),
        .b0_en2_i    (b0_en2_i    ),
        .b0_we1_i    (b0_we1_i    ),
        .b0_we2_i    (b0_we2_i    ),
        .b0_addr1_i  (b0_addr1_i   ),
        .b0_addr2_i  (int_b0_addr2   ),
        .b0_data_i   (b0_wrdata_i ),
        .b0_bitmask_i(b0_bitmask_i),

        // DPSRAM-block port B1
        .b1_clk1_i   (b1_clk1_dft ),
        .b1_clk2_i   (b1_clk2_dft ),
        .b1_en1_i    (b1_en1_i    ),
        .b1_en2_i    (b1_en2_i    ),
        .b1_we1_i    (b1_we1_i    ),
        .b1_we2_i    (b1_we2_i    ),
        .b1_addr1_i  (b1_addr1_i   ),
        .b1_addr2_i  (int_b1_addr2   ),
        .b1_data_i   (b1_wrdata_i ),
        .b1_bitmask_i(b1_bitmask_i),


        // forward signals addr
        .forward_low_a_addr_i(forward_low_a_addr_i),
        .forward_up_a_addr_i (forward_up_a_addr_i ),
        .forward_low_a_addr_o(forward_low_a_addr_o),
        .forward_up_a_addr_o (forward_up_a_addr_o ),
        .forward_low_b_addr_i(forward_low_b_addr_bist),
        .forward_up_b_addr_i (forward_up_b_addr_i ),
        .forward_low_b_addr_o(forward_low_b_addr_o),
        .forward_up_b_addr_o (forward_up_b_addr_o ),


        // forward signals cascade mode
        .forward_cascade_data_a_i   (forward_cascade_wrdata_a_i ),
        .forward_cascade_data_b_i   (forward_cascade_wrdata_b_i ),
        .forward_cascade_data_a_o   (forward_cascade_wrdata_a_o ),
        .forward_cascade_data_b_o   (forward_cascade_wrdata_b_o ),
        .forward_cascade_bitmask_a_i(forward_cascade_bitmask_a_i),
        .forward_cascade_bitmask_b_i(forward_cascade_bitmask_b_i),
        .forward_cascade_bitmask_a_o(forward_cascade_bitmask_a_o),
        .forward_cascade_bitmask_b_o(forward_cascade_bitmask_b_o),

        // forward signals port A0
        .forward_low_a0_clk_i(forward_low_a0_clk_dft),
        .forward_low_a0_en_i (forward_low_a0_en_i ),
        .forward_low_a0_we_i (forward_low_a0_we_i ),
        .forward_up_a0_clk_i (forward_up_a0_clk_dft ),
        .forward_up_a0_en_i  (forward_up_a0_en_i  ),
        .forward_up_a0_we_i  (forward_up_a0_we_i  ),
        .forward_low_a0_clk_o(forward_low_a0_clk_o),
        .forward_low_a0_en_o (forward_low_a0_en_o ),
        .forward_low_a0_we_o (forward_low_a0_we_o ),
        .forward_up_a0_clk_o (forward_up_a0_clk_o ),
        .forward_up_a0_en_o  (forward_up_a0_en_o  ),
        .forward_up_a0_we_o  (forward_up_a0_we_o  ),

        // forward signals port A1
        .forward_low_a1_clk_i(forward_low_a1_clk_dft),
        .forward_low_a1_en_i (forward_low_a1_en_i ),
        .forward_low_a1_we_i (forward_low_a1_we_i ),
        .forward_up_a1_clk_i (forward_up_a1_clk_dft ),
        .forward_up_a1_en_i  (forward_up_a1_en_i  ),
        .forward_up_a1_we_i  (forward_up_a1_we_i  ),
        .forward_low_a1_clk_o(forward_low_a1_clk_o),
        .forward_low_a1_en_o (forward_low_a1_en_o ),
        .forward_low_a1_we_o (forward_low_a1_we_o ),
        .forward_up_a1_clk_o (forward_up_a1_clk_o ),
        .forward_up_a1_en_o  (forward_up_a1_en_o  ),
        .forward_up_a1_we_o  (forward_up_a1_we_o  ),

        // forward signals port B0
        .forward_low_b0_clk_i(forward_low_b0_clk_dft),
        .forward_low_b0_en_i (forward_low_b0_en_bist),
        .forward_low_b0_we_i (forward_low_b0_we_bist),
        .forward_up_b0_clk_i (forward_up_b0_clk_dft ),
        .forward_up_b0_en_i  (forward_up_b0_en_i  ),
        .forward_up_b0_we_i  (forward_up_b0_we_i  ),
        .forward_low_b0_clk_o(forward_low_b0_clk_o),
        .forward_low_b0_en_o (forward_low_b0_en_o ),
        .forward_low_b0_we_o (forward_low_b0_we_o ),
        .forward_up_b0_clk_o (forward_up_b0_clk_o ),
        .forward_up_b0_en_o  (forward_up_b0_en_o  ),
        .forward_up_b0_we_o  (forward_up_b0_we_o  ),

        // forward signals port B1
        .forward_low_b1_clk_i(forward_low_b1_clk_dft),
        .forward_low_b1_en_i (forward_low_b1_en_i ),
        .forward_low_b1_we_i (forward_low_b1_we_i ),
        .forward_up_b1_clk_i (forward_up_b1_clk_dft ),
        .forward_up_b1_en_i  (forward_up_b1_en_i  ),
        .forward_up_b1_we_i  (forward_up_b1_we_i  ),
        .forward_low_b1_clk_o(forward_low_b1_clk_o),
        .forward_low_b1_en_o (forward_low_b1_en_o ),
        .forward_low_b1_we_o (forward_low_b1_we_o ),
        .forward_up_b1_clk_o (forward_up_b1_clk_o ),
        .forward_up_b1_en_o  (forward_up_b1_en_o  ),
        .forward_up_b1_we_o  (forward_up_b1_we_o  ),


        // post-forward-selected port A0
        .a0_clk_o    (post_forward_a0_clk    ),
        .a0_en_o     (post_forward_a0_en     ),
        .a0_we_o     (post_forward_a0_we     ),
        .a0_addr_o   (post_forward_a0_addr   ),
        .a0_data_o   (post_forward_a0_wrdata ),
        .a0_bitmask_o(post_forward_a0_bitmask),

        // post-forward-selected port A1
        .a1_clk_o    (post_forward_a1_clk    ),
        .a1_en_o     (post_forward_a1_en     ),
        .a1_we_o     (post_forward_a1_we     ),
        .a1_addr_o   (post_forward_a1_addr   ),
        .a1_data_o   (post_forward_a1_wrdata ),
        .a1_bitmask_o(post_forward_a1_bitmask),

        // post-forward-selected port B0
        .b0_clk_o    (post_forward_b0_clk    ),
        .b0_en_o     (post_forward_b0_en     ),
        .b0_we_o     (post_forward_b0_we     ),
        .b0_addr_o   (post_forward_b0_addr   ),
        .b0_data_o   (post_forward_b0_wrdata ),
        .b0_bitmask_o(post_forward_b0_bitmask),

        // post-forward-selected port B1
        .b1_clk_o    (post_forward_b1_clk    ),
        .b1_en_o     (post_forward_b1_en     ),
        .b1_we_o     (post_forward_b1_we     ),
        .b1_addr_o   (post_forward_b1_addr   ),
        .b1_data_o   (post_forward_b1_wrdata ),
        .b1_bitmask_o(post_forward_b1_bitmask)
        );


   // post-inversion signal A0
   wire               post_invert_a0_clk;
   wire               post_invert_a0_en;
   wire               post_invert_a0_we;
   wire [15:0]        post_invert_a0_addr;
   wire [19:0]        post_invert_a0_wrdata;
   wire [19:0]        post_invert_a0_bitmask;

   // post-inversion signal A1
   wire               post_invert_a1_clk;
   wire               post_invert_a1_en;
   wire               post_invert_a1_we;
   wire [15:0]        post_invert_a1_addr;
   wire [19:0]        post_invert_a1_wrdata;
   wire [19:0]        post_invert_a1_bitmask;

   // post-inversion signal B0
   wire               post_invert_b0_clk;
   wire               post_invert_b0_en;
   wire               post_invert_b0_we;
   wire [15:0]        post_invert_b0_addr;
   wire [19:0]        post_invert_b0_wrdata;
   wire [19:0]        post_invert_b0_bitmask;

   // post-inversion signal B1
   wire               post_invert_b1_clk;
   wire               post_invert_b1_en;
   wire               post_invert_b1_we;
   wire [15:0]        post_invert_b1_addr;
   wire [19:0]        post_invert_b1_wrdata;
   wire [19:0]        post_invert_b1_bitmask;



   signal_inversion
     signal_inversion_i
       (.cfg_inversion_a0_i  (cfg_inversion_a0  ),
        .cfg_inversion_a1_i  (cfg_inversion_a1  ),
        .cfg_inversion_b0_i  (cfg_inversion_b0  ),
        .cfg_inversion_b1_i  (cfg_inversion_b1  ),


        // forward port A0
        .a0_clk_i    (post_forward_a0_clk    ),
        .a0_en_i     (post_forward_a0_en     ),
        .a0_we_i     (post_forward_a0_we     ),
        .a0_addr_i   (post_forward_a0_addr   ),
        .a0_data_i   (post_forward_a0_wrdata ),
        .a0_bitmask_i(post_forward_a0_bitmask),

        // forward port A1
        .a1_clk_i    (post_forward_a1_clk    ),
        .a1_en_i     (post_forward_a1_en     ),
        .a1_we_i     (post_forward_a1_we     ),
        .a1_addr_i   (post_forward_a1_addr   ),
        .a1_data_i   (post_forward_a1_wrdata ),
        .a1_bitmask_i(post_forward_a1_bitmask),

        // forward port B0
        .b0_clk_i    (post_forward_b0_clk    ),
        .b0_en_i     (post_forward_b0_en     ),
        .b0_we_i     (post_forward_b0_we     ),
        .b0_addr_i   (post_forward_b0_addr   ),
        .b0_data_i   (post_forward_b0_wrdata ),
        .b0_bitmask_i(post_forward_b0_bitmask),

        // forward port B1
        .b1_clk_i    (post_forward_b1_clk    ),
        .b1_en_i     (post_forward_b1_en     ),
        .b1_we_i     (post_forward_b1_we     ),
        .b1_addr_i   (post_forward_b1_addr   ),
        .b1_data_i   (post_forward_b1_wrdata ),
        .b1_bitmask_i(post_forward_b1_bitmask),


        // post-inverted port A0
        .a0_clk_o    (post_invert_a0_clk    ),
        .a0_en_o     (post_invert_a0_en     ),
        .a0_we_o     (post_invert_a0_we     ),
        .a0_addr_o   (post_invert_a0_addr   ),
        .a0_data_o   (post_invert_a0_wrdata ),
        .a0_bitmask_o(post_invert_a0_bitmask),

        // post-inverted port A1
        .a1_clk_o    (post_invert_a1_clk    ),
        .a1_en_o     (post_invert_a1_en     ),
        .a1_we_o     (post_invert_a1_we     ),
        .a1_addr_o   (post_invert_a1_addr   ),
        .a1_data_o   (post_invert_a1_wrdata ),
        .a1_bitmask_o(post_invert_a1_bitmask),

        // post-inverted port B0
        .b0_clk_o    (post_invert_b0_clk    ),
        .b0_en_o     (post_invert_b0_en     ),
        .b0_we_o     (post_invert_b0_we     ),
        .b0_addr_o   (post_invert_b0_addr   ),
        .b0_data_o   (post_invert_b0_wrdata ),
        .b0_bitmask_o(post_invert_b0_bitmask),

        // post-inverted port B1
        .b1_clk_o    (post_invert_b1_clk    ),
        .b1_en_o     (post_invert_b1_en     ),
        .b1_we_o     (post_invert_b1_we     ),
        .b1_addr_o   (post_invert_b1_addr   ),
        .b1_data_o   (post_invert_b1_wrdata ),
        .b1_bitmask_o(post_invert_b1_bitmask)
        );


   // post-ecc signal A0
   wire               post_eccenc_a0_clk;
   wire               post_eccenc_a0_en;
   wire               post_eccenc_a0_we;
   wire [15:0]        post_eccenc_a0_addr;
   wire [19:0]        post_eccenc_a0_wrdata;
   wire [19:0]        post_eccenc_a0_bitmask;

   // post-ecc signal A1
   wire               post_eccenc_a1_clk;
   wire               post_eccenc_a1_en;
   wire               post_eccenc_a1_we;
   wire [15:0]        post_eccenc_a1_addr;
   wire [19:0]        post_eccenc_a1_wrdata;
   wire [19:0]        post_eccenc_a1_bitmask;

   // post-ecc signal B0
   wire               post_eccenc_b0_clk;
   wire               post_eccenc_b0_en;
   wire               post_eccenc_b0_we;
   wire [15:0]        post_eccenc_b0_addr;
   wire [19:0]        post_eccenc_b0_wrdata;
   wire [19:0]        post_eccenc_b0_bitmask;

   // post-ecc signal B1
   wire               post_eccenc_b1_clk;
   wire               post_eccenc_b1_en;
   wire               post_eccenc_b1_we;
   wire [15:0]        post_eccenc_b1_addr;
   wire [19:0]        post_eccenc_b1_wrdata;
   wire [19:0]        post_eccenc_b1_bitmask;


   ecc_encoding
     #(.CONFIG_1BIT (CONFIG_1BIT ),
       .CONFIG_2BIT (CONFIG_2BIT ),
       .CONFIG_5BIT (CONFIG_5BIT ),
       .CONFIG_10BIT(CONFIG_10BIT),
       .CONFIG_20BIT(CONFIG_20BIT),
       .CONFIG_40BIT(CONFIG_40BIT),
       .CONFIG_80BIT(CONFIG_80BIT),

       .CONFIG_TDP_NONSPLIT(CONFIG_TDP_NONSPLIT),
       .CONFIG_TDP_SPLIT   (CONFIG_TDP_SPLIT   ),
       .CONFIG_SDP_NONSPLIT(CONFIG_SDP_NONSPLIT),
       .CONFIG_SDP_SPLIT   (CONFIG_SDP_SPLIT   ),
       .CONFIG_FIFO_ASYNC  (CONFIG_FIFO_ASYNC  ),
       .CONFIG_FIFO_SYNC   (CONFIG_FIFO_SYNC   ),
       .CONFIG_CASCADE_UP  (CONFIG_CASCADE_UP  ),
       .CONFIG_CASCADE_LOW (CONFIG_CASCADE_LOW )
       )
   ecc_encoding_i0
     (.cfg_sram_mode_i (cfg_sram_mode ),
      .cfg_ecc_enable_i(cfg_ecc_enable),

      // forward and inverted port A0
      .a0_clk_i    (post_invert_a0_clk    ),
      .a0_en_i     (post_invert_a0_en     ),
      .a0_we_i     (post_invert_a0_we     ),
      .a0_addr_i   (post_invert_a0_addr   ),
      .a0_data_i   (post_invert_a0_wrdata ),
      .a0_bitmask_i(post_invert_a0_bitmask),

      // forward and inverted port A1
      .a1_clk_i    (post_invert_a1_clk    ),
      .a1_en_i     (post_invert_a1_en     ),
      .a1_we_i     (post_invert_a1_we     ),
      .a1_addr_i   (post_invert_a1_addr   ),
      .a1_data_i   (post_invert_a1_wrdata ),
      .a1_bitmask_i(post_invert_a1_bitmask),

      // forward and inverted port B0
      .b0_clk_i    (post_invert_b0_clk    ),
      .b0_en_i     (post_invert_b0_en     ),
      .b0_we_i     (post_invert_b0_we     ),
      .b0_addr_i   (post_invert_b0_addr   ),
      .b0_data_i   (post_invert_b0_wrdata ),
      .b0_bitmask_i(post_invert_b0_bitmask),

      // forward and inverted port B1
      .b1_clk_i    (post_invert_b1_clk    ),
      .b1_en_i     (post_invert_b1_en     ),
      .b1_we_i     (post_invert_b1_we     ),
      .b1_addr_i   (post_invert_b1_addr   ),
      .b1_data_i   (post_invert_b1_wrdata ),
      .b1_bitmask_i(post_invert_b1_bitmask),

      // signals to mode-selection port A0
      .a0_clk_o    (post_eccenc_a0_clk    ),
      .a0_en_o     (post_eccenc_a0_en     ),
      .a0_we_o     (post_eccenc_a0_we     ),
      .a0_addr_o   (post_eccenc_a0_addr   ),
      .a0_data_o   (post_eccenc_a0_wrdata ),
      .a0_bitmask_o(post_eccenc_a0_bitmask),

      // signals to mode-selection port A1
      .a1_clk_o    (post_eccenc_a1_clk    ),
      .a1_en_o     (post_eccenc_a1_en     ),
      .a1_we_o     (post_eccenc_a1_we     ),
      .a1_addr_o   (post_eccenc_a1_addr   ),
      .a1_data_o   (post_eccenc_a1_wrdata ),
      .a1_bitmask_o(post_eccenc_a1_bitmask),

      // signals to mode-selection port B0
      .b0_clk_o    (post_eccenc_b0_clk    ),
      .b0_en_o     (post_eccenc_b0_en     ),
      .b0_we_o     (post_eccenc_b0_we     ),
      .b0_addr_o   (post_eccenc_b0_addr   ),
      .b0_data_o   (post_eccenc_b0_wrdata ),
      .b0_bitmask_o(post_eccenc_b0_bitmask),

      // signals to mode-selection port B1
      .b1_clk_o    (post_eccenc_b1_clk    ),
      .b1_en_o     (post_eccenc_b1_en     ),
      .b1_we_o     (post_eccenc_b1_we     ),
      .b1_addr_o   (post_eccenc_b1_addr   ),
      .b1_data_o   (post_eccenc_b1_wrdata ),
      .b1_bitmask_o(post_eccenc_b1_bitmask)
    );


   // post-fifo signal A0
   wire               post_fifo_a0_clk;
   wire               post_fifo_a0_en;
   wire               post_fifo_a0_we;
   wire [15:0]        post_fifo_a0_addr;
   wire [19:0]        post_fifo_a0_wrdata;
   wire [19:0]        post_fifo_a0_bitmask;

   // post-fifo signal A1
   wire               post_fifo_a1_clk;
   wire               post_fifo_a1_en;
   wire               post_fifo_a1_we;
   wire [15:0]        post_fifo_a1_addr;
   wire [19:0]        post_fifo_a1_wrdata;
   wire [19:0]        post_fifo_a1_bitmask;

   // post-fifo signal B0
   wire               post_fifo_b0_clk;
   wire               post_fifo_b0_en;
   wire               post_fifo_b0_we;
   wire [15:0]        post_fifo_b0_addr;
   wire [19:0]        post_fifo_b0_wrdata;
   wire [19:0]        post_fifo_b0_bitmask;

   // post-fifo signal B1
   wire               post_fifo_b1_clk;
   wire               post_fifo_b1_en;
   wire               post_fifo_b1_we;
   wire [15:0]        post_fifo_b1_addr;
   wire [19:0]        post_fifo_b1_wrdata;
   wire [19:0]        post_fifo_b1_bitmask;

    wire              fifo_rstn_dft;
    assign fifo_rstn_dft = (testmode_i == 1'b1) ? bist_wrdata_i[0] : fifo_rstn_i;


   fifo_controller
     #(.CONFIG_1BIT (CONFIG_1BIT ),
       .CONFIG_2BIT (CONFIG_2BIT ),
       .CONFIG_5BIT (CONFIG_5BIT ),
       .CONFIG_10BIT(CONFIG_10BIT),
       .CONFIG_20BIT(CONFIG_20BIT),
       .CONFIG_40BIT(CONFIG_40BIT),
       .CONFIG_80BIT(CONFIG_80BIT),

       .CONFIG_TDP_NONSPLIT(CONFIG_TDP_NONSPLIT),
       .CONFIG_TDP_SPLIT   (CONFIG_TDP_SPLIT   ),
       .CONFIG_SDP_NONSPLIT(CONFIG_SDP_NONSPLIT),
       .CONFIG_SDP_SPLIT   (CONFIG_SDP_SPLIT   ),
       .CONFIG_FIFO_ASYNC  (CONFIG_FIFO_ASYNC  ),
       .CONFIG_FIFO_SYNC   (CONFIG_FIFO_SYNC   ),
       .CONFIG_CASCADE_UP  (CONFIG_CASCADE_UP  ),
       .CONFIG_CASCADE_LOW (CONFIG_CASCADE_LOW )
       )
   fifo_controller_i
     (.cfg_sram_mode_i          (cfg_sram_mode          ),
      .cfg_input_config_a0_i    (cfg_input_config_a0    ),
      .cfg_input_config_a1_i    (cfg_input_config_a1    ),
      .cfg_input_config_b0_i    (cfg_input_config_b0    ),
      .cfg_input_config_b1_i    (cfg_input_config_b1    ),
      .cfg_output_config_a0_i   (cfg_output_config_a0   ),
      .cfg_output_config_a1_i   (cfg_output_config_a1   ),
      .cfg_output_config_b0_i   (cfg_output_config_b0   ),
      .cfg_output_config_b1_i   (cfg_output_config_b1   ),
      .cfg_fifo_sync_enable_i   (cfg_fifo_sync_enable   ),
      .cfg_fifo_async_enable_i  (cfg_fifo_async_enable  ),
      .cfg_almost_full_offset_i (cfg_almost_full_offset ),
      .cfg_almost_empty_offset_i(cfg_almost_empty_offset),

      .fifo_reset_n_i (fifo_rstn_dft),

      // forward and inverted and ecc-encoded, port A0
      .a0_clk_i    (post_eccenc_a0_clk    ),
      .a0_en_i     (post_eccenc_a0_en     ),
      .a0_we_i     (post_eccenc_a0_we     ),
      .a0_addr_i   (post_eccenc_a0_addr   ),
      .a0_data_i   (post_eccenc_a0_wrdata ),
      .a0_bitmask_i(post_eccenc_a0_bitmask),

      // forward and inverted and ecc-encoded, port A1
      .a1_clk_i    (post_eccenc_a1_clk    ),
      .a1_en_i     (post_eccenc_a1_en     ),
      .a1_we_i     (post_eccenc_a1_we     ),
      .a1_addr_i   (post_eccenc_a1_addr   ),
      .a1_data_i   (post_eccenc_a1_wrdata ),
      .a1_bitmask_i(post_eccenc_a1_bitmask),

      // forward and inverted and ecc-encoded, port B0
      .b0_clk_i    (post_eccenc_b0_clk    ),
      .b0_en_i     (post_eccenc_b0_en     ),
      .b0_we_i     (post_eccenc_b0_we     ),
      .b0_addr_i   (post_eccenc_b0_addr   ),
      .b0_data_i   (post_eccenc_b0_wrdata ),
      .b0_bitmask_i(post_eccenc_b0_bitmask),

      // forward and inverted and ecc-encoded, port B1
      .b1_clk_i    (post_eccenc_b1_clk    ),
      .b1_en_i     (post_eccenc_b1_en     ),
      .b1_we_i     (post_eccenc_b1_we     ),
      .b1_addr_i   (post_eccenc_b1_addr   ),
      .b1_data_i   (post_eccenc_b1_wrdata ),
      .b1_bitmask_i(post_eccenc_b1_bitmask),


      // port A0
      .a0_clk_o    (post_fifo_a0_clk    ),
      .a0_en_o     (post_fifo_a0_en     ),
      .a0_we_o     (post_fifo_a0_we     ),
      .a0_addr_o   (post_fifo_a0_addr   ),
      .a0_data_o   (post_fifo_a0_wrdata ),
      .a0_bitmask_o(post_fifo_a0_bitmask),

      // port A1
      .a1_clk_o    (post_fifo_a1_clk    ),
      .a1_en_o     (post_fifo_a1_en     ),
      .a1_we_o     (post_fifo_a1_we     ),
      .a1_addr_o   (post_fifo_a1_addr   ),
      .a1_data_o   (post_fifo_a1_wrdata ),
      .a1_bitmask_o(post_fifo_a1_bitmask),

      // port B0
      .b0_clk_o    (post_fifo_b0_clk    ),
      .b0_en_o     (post_fifo_b0_en     ),
      .b0_we_o     (post_fifo_b0_we     ),
      .b0_addr_o   (post_fifo_b0_addr   ),
      .b0_data_o   (post_fifo_b0_wrdata ),
      .b0_bitmask_o(post_fifo_b0_bitmask),

      // port B1
      .b1_clk_o    (post_fifo_b1_clk    ),
      .b1_en_o     (post_fifo_b1_en     ),
      .b1_we_o     (post_fifo_b1_we     ),
      .b1_addr_o   (post_fifo_b1_addr   ),
      .b1_data_o   (post_fifo_b1_wrdata ),
      .b1_bitmask_o(post_fifo_b1_bitmask),


      // FIFO status data
      .fifo_full_o         (left1_fifo_full_o         ),
      .fifo_empty_o        (left1_fifo_empty_o        ),
      .fifo_almost_full_o  (left1_fifo_almost_full_o  ),
      .fifo_almost_empty_o (left1_fifo_almost_empty_o ),
      .fifo_write_error_o  (left1_fifo_write_error_o  ),
      .fifo_read_error_o   (left1_fifo_read_error_o   ),
      .fifo_write_address_o(fifo_write_address_o      ),
      .fifo_read_address_o (fifo_read_address_o       ),
      .testmode_i          (testmode_i                )
      );

    assign left2_fifo_full_o         = left1_fifo_full_o;
    assign left2_fifo_empty_o        = left1_fifo_empty_o;
    assign left2_fifo_almost_full_o  = left1_fifo_almost_full_o;
    assign left2_fifo_almost_empty_o = left1_fifo_almost_empty_o;
    assign left2_fifo_write_error_o  = left1_fifo_write_error_o;
    assign left2_fifo_read_error_o   = left1_fifo_read_error_o;


   // RAM to use for mode_deselection
   wire [1:0]         post_modesel_a0_ram_select;
   wire [1:0]         post_modesel_a1_ram_select;
   wire [1:0]         post_modesel_b0_ram_select;
   wire [1:0]         post_modesel_b1_ram_select;
   wire               post_modesel_a_cascade_select;
   wire               post_modesel_b_cascade_select;
   wire               post_modesel_a0_re;
   wire               post_modesel_a1_re;
   wire               post_modesel_b0_re;
   wire               post_modesel_b1_re;

   // signals from mode selection to RAM-macro 1
   wire [2:0]         post_modesel_RAM1_a_input_config;
   wire [2:0]         post_modesel_RAM1_a_output_config;
   wire               post_modesel_RAM1_a_set_outputreg;
   wire               post_modesel_RAM1_a_clk;
   wire               post_modesel_RAM1_a_en;
   wire               post_modesel_RAM1_a_we;
   wire               post_modesel_RAM1_a_re;
   wire [15:0]        post_modesel_RAM1_a_addr;
   wire [19:0]        post_modesel_RAM1_a_wrdata;
   wire [19:0]        post_modesel_RAM1_a_bitmask;
   wire [2:0]         post_modesel_RAM1_b_input_config;
   wire [2:0]         post_modesel_RAM1_b_output_config;
   wire               post_modesel_RAM1_b_set_outputreg;
   wire               post_modesel_RAM1_b_clk;
   wire               post_modesel_RAM1_b_en;
   wire               post_modesel_RAM1_b_we;
   wire               post_modesel_RAM1_b_re;
   wire [15:0]        post_modesel_RAM1_b_addr;
   wire [19:0]        post_modesel_RAM1_b_wrdata;
   wire [19:0]        post_modesel_RAM1_b_bitmask;

   // signals from mode selection to RAM-macro 2
   wire [2:0]         post_modesel_RAM2_a_input_config;
   wire [2:0]         post_modesel_RAM2_a_output_config;
   wire               post_modesel_RAM2_a_set_outputreg;
   wire               post_modesel_RAM2_a_clk;
   wire               post_modesel_RAM2_a_en;
   wire               post_modesel_RAM2_a_we;
   wire               post_modesel_RAM2_a_re;
   wire [15:0]        post_modesel_RAM2_a_addr;
   wire [19:0]        post_modesel_RAM2_a_wrdata;
   wire [19:0]        post_modesel_RAM2_a_bitmask;
   wire [2:0]         post_modesel_RAM2_b_input_config;
   wire [2:0]         post_modesel_RAM2_b_output_config;
   wire               post_modesel_RAM2_b_set_outputreg;
   wire               post_modesel_RAM2_b_clk;
   wire               post_modesel_RAM2_b_en;
   wire               post_modesel_RAM2_b_we;
   wire               post_modesel_RAM2_b_re;
   wire [15:0]        post_modesel_RAM2_b_addr;
   wire [19:0]        post_modesel_RAM2_b_wrdata;
   wire [19:0]        post_modesel_RAM2_b_bitmask;

   // signals from mode selection to RAM-macro 3
   wire [2:0]         post_modesel_RAM3_a_input_config;
   wire [2:0]         post_modesel_RAM3_a_output_config;
   wire               post_modesel_RAM3_a_set_outputreg;
   wire               post_modesel_RAM3_a_clk;
   wire               post_modesel_RAM3_a_en;
   wire               post_modesel_RAM3_a_we;
   wire               post_modesel_RAM3_a_re;
   wire [15:0]        post_modesel_RAM3_a_addr;
   wire [19:0]        post_modesel_RAM3_a_wrdata;
   wire [19:0]        post_modesel_RAM3_a_bitmask;
   wire [2:0]         post_modesel_RAM3_b_input_config;
   wire [2:0]         post_modesel_RAM3_b_output_config;
   wire               post_modesel_RAM3_b_set_outputreg;
   wire               post_modesel_RAM3_b_clk;
   wire               post_modesel_RAM3_b_en;
   wire               post_modesel_RAM3_b_we;
   wire               post_modesel_RAM3_b_re;
   wire [15:0]        post_modesel_RAM3_b_addr;
   wire [19:0]        post_modesel_RAM3_b_wrdata;
   wire [19:0]        post_modesel_RAM3_b_bitmask;

   // signals from mode selection to RAM-macro 4
   wire [2:0]         post_modesel_RAM4_a_input_config;
   wire [2:0]         post_modesel_RAM4_a_output_config;
   wire               post_modesel_RAM4_a_set_outputreg;
   wire               post_modesel_RAM4_a_clk;
   wire               post_modesel_RAM4_a_en;
   wire               post_modesel_RAM4_a_we;
   wire               post_modesel_RAM4_a_re;
   wire [15:0]        post_modesel_RAM4_a_addr;
   wire [19:0]        post_modesel_RAM4_a_wrdata;
   wire [19:0]        post_modesel_RAM4_a_bitmask;
   wire [2:0]         post_modesel_RAM4_b_input_config;
   wire [2:0]         post_modesel_RAM4_b_output_config;
   wire               post_modesel_RAM4_b_set_outputreg;
   wire               post_modesel_RAM4_b_clk;
   wire               post_modesel_RAM4_b_en;
   wire               post_modesel_RAM4_b_we;
   wire               post_modesel_RAM4_b_re;
   wire [15:0]        post_modesel_RAM4_b_addr;
   wire [19:0]        post_modesel_RAM4_b_wrdata;
   wire [19:0]        post_modesel_RAM4_b_bitmask;


   mode_selection
     #(.CONFIG_1BIT (CONFIG_1BIT ),
       .CONFIG_2BIT (CONFIG_2BIT ),
       .CONFIG_5BIT (CONFIG_5BIT ),
       .CONFIG_10BIT(CONFIG_10BIT),
       .CONFIG_20BIT(CONFIG_20BIT),
       .CONFIG_40BIT(CONFIG_40BIT),
       .CONFIG_80BIT(CONFIG_80BIT),

       .CONFIG_TDP_NONSPLIT(CONFIG_TDP_NONSPLIT),
       .CONFIG_TDP_SPLIT   (CONFIG_TDP_SPLIT   ),
       .CONFIG_SDP_NONSPLIT(CONFIG_SDP_NONSPLIT),
       .CONFIG_SDP_SPLIT   (CONFIG_SDP_SPLIT   ),
       .CONFIG_FIFO_ASYNC  (CONFIG_FIFO_ASYNC  ),
       .CONFIG_FIFO_SYNC   (CONFIG_FIFO_SYNC   ),
       .CONFIG_CASCADE_UP  (CONFIG_CASCADE_UP  ),
       .CONFIG_CASCADE_LOW (CONFIG_CASCADE_LOW )
       )
   mode_selection_i
     (.cfg_sram_mode_i       (cfg_sram_mode       ),
      .cfg_input_config_a0_i (cfg_input_config_a0 ),
      .cfg_input_config_a1_i (cfg_input_config_a1 ),
      .cfg_input_config_b0_i (cfg_input_config_b0 ),
      .cfg_input_config_b1_i (cfg_input_config_b1 ),
      .cfg_output_config_a0_i(cfg_output_config_a0),
      .cfg_output_config_a1_i(cfg_output_config_a1),
      .cfg_output_config_b0_i(cfg_output_config_b0),
      .cfg_output_config_b1_i(cfg_output_config_b1),
      .cfg_writemode_a0_i    (cfg_writemode_a0    ),
      .cfg_writemode_a1_i    (cfg_writemode_a1    ),
      .cfg_writemode_b0_i    (cfg_writemode_b0    ),
      .cfg_writemode_b1_i    (cfg_writemode_b1    ),
      .cfg_set_outputreg_a0_i(cfg_set_outputreg_a0),
      .cfg_set_outputreg_a1_i(cfg_set_outputreg_a1),
      .cfg_set_outputreg_b0_i(cfg_set_outputreg_b0),
      .cfg_set_outputreg_b1_i(cfg_set_outputreg_b1),
      .cfg_cascade_enable_i  (cfg_cascade_enable  ),


      // forward and inverted and ecc-encoded and fifo-selected, port A0
      .a0_clk_i    (post_fifo_a0_clk    ),
      .a0_en_i     (post_fifo_a0_en     ),
      .a0_we_i     (post_fifo_a0_we     ),
      .a0_addr_i   (post_fifo_a0_addr   ),
      .a0_data_i   (post_fifo_a0_wrdata ),
      .a0_bitmask_i(post_fifo_a0_bitmask),

      // forward and inverted and ecc-encoded and fifo-selected, port A1
      .a1_clk_i    (post_fifo_a1_clk    ),
      .a1_en_i     (post_fifo_a1_en     ),
      .a1_we_i     (post_fifo_a1_we     ),
      .a1_addr_i   (post_fifo_a1_addr   ),
      .a1_data_i   (post_fifo_a1_wrdata ),
      .a1_bitmask_i(post_fifo_a1_bitmask),

      // forward and inverted and ecc-encoded and fifo-selected, port B0
      .b0_clk_i    (post_fifo_b0_clk    ),
      .b0_en_i     (post_fifo_b0_en     ),
      .b0_we_i     (post_fifo_b0_we     ),
      .b0_addr_i   (post_fifo_b0_addr   ),
      .b0_data_i   (post_fifo_b0_wrdata ),
      .b0_bitmask_i(post_fifo_b0_bitmask),

      // forward and inverted and ecc-encoded and fifo-selected, port B1
      .b1_clk_i    (post_fifo_b1_clk    ),
      .b1_en_i     (post_fifo_b1_en     ),
      .b1_we_i     (post_fifo_b1_we     ),
      .b1_addr_i   (post_fifo_b1_addr   ),
      .b1_data_i   (post_fifo_b1_wrdata ),
      .b1_bitmask_i(post_fifo_b1_bitmask),


      // RAM to use for mode_deselection
      .a0_ram_select_o   (post_modesel_a0_ram_select),
      .a1_ram_select_o   (post_modesel_a1_ram_select),
      .b0_ram_select_o   (post_modesel_b0_ram_select),
      .b1_ram_select_o   (post_modesel_b1_ram_select),
      .a_cascade_select_o(post_modesel_a_cascade_select),
      .b_cascade_select_o(post_modesel_b_cascade_select),
      .a0_re_o           (post_modesel_a0_re),
      .a1_re_o           (post_modesel_a1_re),
      .b0_re_o           (post_modesel_b0_re),
      .b1_re_o           (post_modesel_b1_re),


      // signals to RAM-macro 1
      .RAM1_a_input_config_o (post_modesel_RAM1_a_input_config ),
      .RAM1_a_output_config_o(post_modesel_RAM1_a_output_config),
      .RAM1_a_set_outputreg_o(post_modesel_RAM1_a_set_outputreg),
      .RAM1_a_clk_o          (post_modesel_RAM1_a_clk          ),
      .RAM1_a_en_o           (post_modesel_RAM1_a_en           ),
      .RAM1_a_we_o           (post_modesel_RAM1_a_we           ),
      .RAM1_a_re_o           (post_modesel_RAM1_a_re           ),
      .RAM1_a_addr_o         (post_modesel_RAM1_a_addr         ),
      .RAM1_a_data_o         (post_modesel_RAM1_a_wrdata       ),
      .RAM1_a_bitmask_o      (post_modesel_RAM1_a_bitmask      ),
      .RAM1_b_input_config_o (post_modesel_RAM1_b_input_config ),
      .RAM1_b_output_config_o(post_modesel_RAM1_b_output_config),
      .RAM1_b_set_outputreg_o(post_modesel_RAM1_b_set_outputreg),
      .RAM1_b_clk_o          (post_modesel_RAM1_b_clk          ),
      .RAM1_b_en_o           (post_modesel_RAM1_b_en           ),
      .RAM1_b_we_o           (post_modesel_RAM1_b_we           ),
      .RAM1_b_re_o           (post_modesel_RAM1_b_re           ),
      .RAM1_b_addr_o         (post_modesel_RAM1_b_addr         ),
      .RAM1_b_data_o         (post_modesel_RAM1_b_wrdata       ),
      .RAM1_b_bitmask_o      (post_modesel_RAM1_b_bitmask      ),

      // signals to RAM-macro 2
      .RAM2_a_input_config_o (post_modesel_RAM2_a_input_config ),
      .RAM2_a_output_config_o(post_modesel_RAM2_a_output_config),
      .RAM2_a_set_outputreg_o(post_modesel_RAM2_a_set_outputreg),
      .RAM2_a_clk_o          (post_modesel_RAM2_a_clk          ),
      .RAM2_a_en_o           (post_modesel_RAM2_a_en           ),
      .RAM2_a_we_o           (post_modesel_RAM2_a_we           ),
      .RAM2_a_re_o           (post_modesel_RAM2_a_re           ),
      .RAM2_a_addr_o         (post_modesel_RAM2_a_addr         ),
      .RAM2_a_data_o         (post_modesel_RAM2_a_wrdata       ),
      .RAM2_a_bitmask_o      (post_modesel_RAM2_a_bitmask      ),
      .RAM2_b_input_config_o (post_modesel_RAM2_b_input_config ),
      .RAM2_b_output_config_o(post_modesel_RAM2_b_output_config),
      .RAM2_b_set_outputreg_o(post_modesel_RAM2_b_set_outputreg),
      .RAM2_b_clk_o          (post_modesel_RAM2_b_clk          ),
      .RAM2_b_en_o           (post_modesel_RAM2_b_en           ),
      .RAM2_b_we_o           (post_modesel_RAM2_b_we           ),
      .RAM2_b_re_o           (post_modesel_RAM2_b_re           ),
      .RAM2_b_addr_o         (post_modesel_RAM2_b_addr         ),
      .RAM2_b_data_o         (post_modesel_RAM2_b_wrdata       ),
      .RAM2_b_bitmask_o      (post_modesel_RAM2_b_bitmask      ),

      // signals to RAM-macro 3
      .RAM3_a_input_config_o (post_modesel_RAM3_a_input_config ),
      .RAM3_a_output_config_o(post_modesel_RAM3_a_output_config),
      .RAM3_a_set_outputreg_o(post_modesel_RAM3_a_set_outputreg),
      .RAM3_a_clk_o          (post_modesel_RAM3_a_clk          ),
      .RAM3_a_en_o           (post_modesel_RAM3_a_en           ),
      .RAM3_a_we_o           (post_modesel_RAM3_a_we           ),
      .RAM3_a_re_o           (post_modesel_RAM3_a_re           ),
      .RAM3_a_addr_o         (post_modesel_RAM3_a_addr         ),
      .RAM3_a_data_o         (post_modesel_RAM3_a_wrdata       ),
      .RAM3_a_bitmask_o      (post_modesel_RAM3_a_bitmask      ),
      .RAM3_b_input_config_o (post_modesel_RAM3_b_input_config ),
      .RAM3_b_output_config_o(post_modesel_RAM3_b_output_config),
      .RAM3_b_set_outputreg_o(post_modesel_RAM3_b_set_outputreg),
      .RAM3_b_clk_o          (post_modesel_RAM3_b_clk          ),
      .RAM3_b_en_o           (post_modesel_RAM3_b_en           ),
      .RAM3_b_we_o           (post_modesel_RAM3_b_we           ),
      .RAM3_b_re_o           (post_modesel_RAM3_b_re           ),
      .RAM3_b_addr_o         (post_modesel_RAM3_b_addr         ),
      .RAM3_b_data_o         (post_modesel_RAM3_b_wrdata       ),
      .RAM3_b_bitmask_o      (post_modesel_RAM3_b_bitmask      ),

      // signals to RAM-macro 4
      .RAM4_a_input_config_o (post_modesel_RAM4_a_input_config ),
      .RAM4_a_output_config_o(post_modesel_RAM4_a_output_config),
      .RAM4_a_set_outputreg_o(post_modesel_RAM4_a_set_outputreg),
      .RAM4_a_clk_o          (post_modesel_RAM4_a_clk          ),
      .RAM4_a_en_o           (post_modesel_RAM4_a_en           ),
      .RAM4_a_we_o           (post_modesel_RAM4_a_we           ),
      .RAM4_a_re_o           (post_modesel_RAM4_a_re           ),
      .RAM4_a_addr_o         (post_modesel_RAM4_a_addr         ),
      .RAM4_a_data_o         (post_modesel_RAM4_a_wrdata       ),
      .RAM4_a_bitmask_o      (post_modesel_RAM4_a_bitmask      ),
      .RAM4_b_input_config_o (post_modesel_RAM4_b_input_config ),
      .RAM4_b_output_config_o(post_modesel_RAM4_b_output_config),
      .RAM4_b_set_outputreg_o(post_modesel_RAM4_b_set_outputreg),
      .RAM4_b_clk_o          (post_modesel_RAM4_b_clk          ),
      .RAM4_b_en_o           (post_modesel_RAM4_b_en           ),
      .RAM4_b_we_o           (post_modesel_RAM4_b_we           ),
      .RAM4_b_re_o           (post_modesel_RAM4_b_re           ),
      .RAM4_b_addr_o         (post_modesel_RAM4_b_addr         ),
      .RAM4_b_data_o         (post_modesel_RAM4_b_wrdata       ),
      .RAM4_b_bitmask_o      (post_modesel_RAM4_b_bitmask      )
      );


   // signals from bit-selection to RAM-macro 1
   wire               post_bitsel_RAM1_a_clk;
   wire               post_bitsel_RAM1_a_en;
   wire               post_bitsel_RAM1_a_we;
   wire               post_bitsel_RAM1_a_re;
   wire [15:0]        post_bitsel_RAM1_a_addr;
   wire [19:0]        post_bitsel_RAM1_a_wrdata;
   wire [19:0]        post_bitsel_RAM1_a_bitmask;
   wire               post_bitsel_RAM1_b_clk;
   wire               post_bitsel_RAM1_b_en;
   wire               post_bitsel_RAM1_b_we;
   wire               post_bitsel_RAM1_b_re;
   wire [15:0]        post_bitsel_RAM1_b_addr;
   wire [19:0]        post_bitsel_RAM1_b_wrdata;
   wire [19:0]        post_bitsel_RAM1_b_bitmask;

   // signals from bit-selection to RAM-macro 2
   wire               post_bitsel_RAM2_a_clk;
   wire               post_bitsel_RAM2_a_en;
   wire               post_bitsel_RAM2_a_we;
   wire               post_bitsel_RAM2_a_re;
   wire [15:0]        post_bitsel_RAM2_a_addr;
   wire [19:0]        post_bitsel_RAM2_a_wrdata;
   wire [19:0]        post_bitsel_RAM2_a_bitmask;
   wire               post_bitsel_RAM2_b_clk;
   wire               post_bitsel_RAM2_b_en;
   wire               post_bitsel_RAM2_b_we;
   wire               post_bitsel_RAM2_b_re;
   wire [15:0]        post_bitsel_RAM2_b_addr;
   wire [19:0]        post_bitsel_RAM2_b_wrdata;
   wire [19:0]        post_bitsel_RAM2_b_bitmask;

   // signals from bit-selection to RAM-macro 3
   wire               post_bitsel_RAM3_a_clk;
   wire               post_bitsel_RAM3_a_en;
   wire               post_bitsel_RAM3_a_we;
   wire               post_bitsel_RAM3_a_re;
   wire [15:0]        post_bitsel_RAM3_a_addr;
   wire [19:0]        post_bitsel_RAM3_a_wrdata;
   wire [19:0]        post_bitsel_RAM3_a_bitmask;
   wire               post_bitsel_RAM3_b_clk;
   wire               post_bitsel_RAM3_b_en;
   wire               post_bitsel_RAM3_b_we;
   wire               post_bitsel_RAM3_b_re;
   wire [15:0]        post_bitsel_RAM3_b_addr;
   wire [19:0]        post_bitsel_RAM3_b_wrdata;
   wire [19:0]        post_bitsel_RAM3_b_bitmask;

   // signals from bit-selection to RAM-macro 4
   wire               post_bitsel_RAM4_a_clk;
   wire               post_bitsel_RAM4_a_en;
   wire               post_bitsel_RAM4_a_we;
   wire               post_bitsel_RAM4_a_re;
   wire [15:0]        post_bitsel_RAM4_a_addr;
   wire [19:0]        post_bitsel_RAM4_a_wrdata;
   wire [19:0]        post_bitsel_RAM4_a_bitmask;
   wire               post_bitsel_RAM4_b_clk;
   wire               post_bitsel_RAM4_b_en;
   wire               post_bitsel_RAM4_b_we;
   wire               post_bitsel_RAM4_b_re;
   wire [15:0]        post_bitsel_RAM4_b_addr;
   wire [19:0]        post_bitsel_RAM4_b_wrdata;
   wire [19:0]        post_bitsel_RAM4_b_bitmask;

   //here: generate bitmask from addr[4:0](is bytemask)
   //bist_active, wrdata_i
   bit_selection
     #(.CONFIG_1BIT (CONFIG_1BIT ),
       .CONFIG_2BIT (CONFIG_2BIT ),
       .CONFIG_5BIT (CONFIG_5BIT ),
       .CONFIG_10BIT(CONFIG_10BIT),
       .CONFIG_20BIT(CONFIG_20BIT),
       .CONFIG_40BIT(CONFIG_40BIT),
       .CONFIG_80BIT(CONFIG_80BIT)
       )
   bit_selection_i0
     (
      .bist_active_a_i      (bist_active && (port_select == 1'b0)),
      .bist_active_b_i      (bist_active && (port_select == 1'b1)),
      .bist_wrdata_i        (bist_wrdata_i),
      // signals from mode_selection for RAM-macro 1
      .RAM1_a_input_config_i (post_modesel_RAM1_a_input_config),
      .RAM1_a_output_config_i(post_modesel_RAM1_a_output_config),
      .RAM1_a_clk_i         (post_modesel_RAM1_a_clk         ),
      .RAM1_a_en_i          (post_modesel_RAM1_a_en          ),
      .RAM1_a_we_i          (post_modesel_RAM1_a_we          ),
      .RAM1_a_re_i          (post_modesel_RAM1_a_re          ),
      .RAM1_a_addr_i        (post_modesel_RAM1_a_addr        ),
      .RAM1_a_data_i        (post_modesel_RAM1_a_wrdata      ),
      .RAM1_a_bitmask_i     (post_modesel_RAM1_a_bitmask     ),
      .RAM1_b_input_config_i (post_modesel_RAM1_b_input_config),
      .RAM1_b_output_config_i(post_modesel_RAM1_b_output_config),
      .RAM1_b_clk_i         (post_modesel_RAM1_b_clk         ),
      .RAM1_b_en_i          (post_modesel_RAM1_b_en          ),
      .RAM1_b_we_i          (post_modesel_RAM1_b_we          ),
      .RAM1_b_re_i          (post_modesel_RAM1_b_re          ),
      .RAM1_b_addr_i        (post_modesel_RAM1_b_addr        ),
      .RAM1_b_data_i        (post_modesel_RAM1_b_wrdata      ),
      .RAM1_b_bitmask_i     (post_modesel_RAM1_b_bitmask     ),

      // signals from mode_selection for RAM-macro 2
      .RAM2_a_input_config_i (post_modesel_RAM2_a_input_config),
      .RAM2_a_output_config_i(post_modesel_RAM2_a_output_config),
      .RAM2_a_clk_i         (post_modesel_RAM2_a_clk         ),
      .RAM2_a_en_i          (post_modesel_RAM2_a_en          ),
      .RAM2_a_we_i          (post_modesel_RAM2_a_we          ),
      .RAM2_a_re_i          (post_modesel_RAM2_a_re          ),
      .RAM2_a_addr_i        (post_modesel_RAM2_a_addr        ),
      .RAM2_a_data_i        (post_modesel_RAM2_a_wrdata      ),
      .RAM2_a_bitmask_i     (post_modesel_RAM2_a_bitmask     ),
      .RAM2_b_input_config_i (post_modesel_RAM2_b_input_config),
      .RAM2_b_output_config_i(post_modesel_RAM2_b_output_config),
      .RAM2_b_clk_i         (post_modesel_RAM2_b_clk         ),
      .RAM2_b_en_i          (post_modesel_RAM2_b_en          ),
      .RAM2_b_we_i          (post_modesel_RAM2_b_we          ),
      .RAM2_b_re_i          (post_modesel_RAM2_b_re          ),
      .RAM2_b_addr_i        (post_modesel_RAM2_b_addr        ),
      .RAM2_b_data_i        (post_modesel_RAM2_b_wrdata      ),
      .RAM2_b_bitmask_i     (post_modesel_RAM2_b_bitmask     ),

      // signals from mode_selection for RAM-macro 3
      .RAM3_a_input_config_i (post_modesel_RAM3_a_input_config),
      .RAM3_a_output_config_i(post_modesel_RAM3_a_output_config),
      .RAM3_a_clk_i         (post_modesel_RAM3_a_clk         ),
      .RAM3_a_en_i          (post_modesel_RAM3_a_en          ),
      .RAM3_a_we_i          (post_modesel_RAM3_a_we          ),
      .RAM3_a_re_i          (post_modesel_RAM3_a_re          ),
      .RAM3_a_addr_i        (post_modesel_RAM3_a_addr        ),
      .RAM3_a_data_i        (post_modesel_RAM3_a_wrdata      ),
      .RAM3_a_bitmask_i     (post_modesel_RAM3_a_bitmask     ),
      .RAM3_b_input_config_i (post_modesel_RAM3_b_input_config),
      .RAM3_b_output_config_i(post_modesel_RAM3_b_output_config),
      .RAM3_b_clk_i         (post_modesel_RAM3_b_clk         ),
      .RAM3_b_en_i          (post_modesel_RAM3_b_en          ),
      .RAM3_b_we_i          (post_modesel_RAM3_b_we          ),
      .RAM3_b_re_i          (post_modesel_RAM3_b_re          ),
      .RAM3_b_addr_i        (post_modesel_RAM3_b_addr        ),
      .RAM3_b_data_i        (post_modesel_RAM3_b_wrdata      ),
      .RAM3_b_bitmask_i     (post_modesel_RAM3_b_bitmask     ),

      // signals from mode_selection for RAM-macro 4
      .RAM4_a_input_config_i (post_modesel_RAM4_a_input_config),
      .RAM4_a_output_config_i(post_modesel_RAM4_a_output_config),
      .RAM4_a_clk_i         (post_modesel_RAM4_a_clk         ),
      .RAM4_a_en_i          (post_modesel_RAM4_a_en          ),
      .RAM4_a_we_i          (post_modesel_RAM4_a_we          ),
      .RAM4_a_re_i          (post_modesel_RAM4_a_re          ),
      .RAM4_a_addr_i        (post_modesel_RAM4_a_addr        ),
      .RAM4_a_data_i        (post_modesel_RAM4_a_wrdata      ),
      .RAM4_a_bitmask_i     (post_modesel_RAM4_a_bitmask     ),
      .RAM4_b_input_config_i (post_modesel_RAM4_b_input_config),
      .RAM4_b_output_config_i(post_modesel_RAM4_b_output_config),
      .RAM4_b_clk_i         (post_modesel_RAM4_b_clk         ),
      .RAM4_b_en_i          (post_modesel_RAM4_b_en          ),
      .RAM4_b_we_i          (post_modesel_RAM4_b_we          ),
      .RAM4_b_re_i          (post_modesel_RAM4_b_re          ),
      .RAM4_b_addr_i        (post_modesel_RAM4_b_addr        ),
      .RAM4_b_data_i        (post_modesel_RAM4_b_wrdata      ),
      .RAM4_b_bitmask_i     (post_modesel_RAM4_b_bitmask     ),


      // signals to RAM-macro 1
      .RAM1_a_clk_o    (post_bitsel_RAM1_a_clk    ),
      .RAM1_a_en_o     (post_bitsel_RAM1_a_en     ),
      .RAM1_a_we_o     (post_bitsel_RAM1_a_we     ),
      .RAM1_a_re_o     (post_bitsel_RAM1_a_re     ),
      .RAM1_a_addr_o   (post_bitsel_RAM1_a_addr   ),
      .RAM1_a_data_o   (post_bitsel_RAM1_a_wrdata ),
      .RAM1_a_bitmask_o(post_bitsel_RAM1_a_bitmask),
      .RAM1_b_clk_o    (post_bitsel_RAM1_b_clk    ),
      .RAM1_b_en_o     (post_bitsel_RAM1_b_en     ),
      .RAM1_b_we_o     (post_bitsel_RAM1_b_we     ),
      .RAM1_b_re_o     (post_bitsel_RAM1_b_re     ),
      .RAM1_b_addr_o   (post_bitsel_RAM1_b_addr   ),
      .RAM1_b_data_o   (post_bitsel_RAM1_b_wrdata ),
      .RAM1_b_bitmask_o(post_bitsel_RAM1_b_bitmask),

      // signals to RAM-macro 2
      .RAM2_a_clk_o    (post_bitsel_RAM2_a_clk    ),
      .RAM2_a_en_o     (post_bitsel_RAM2_a_en     ),
      .RAM2_a_we_o     (post_bitsel_RAM2_a_we     ),
      .RAM2_a_re_o     (post_bitsel_RAM2_a_re     ),
      .RAM2_a_addr_o   (post_bitsel_RAM2_a_addr   ),
      .RAM2_a_data_o   (post_bitsel_RAM2_a_wrdata ),
      .RAM2_a_bitmask_o(post_bitsel_RAM2_a_bitmask),
      .RAM2_b_clk_o    (post_bitsel_RAM2_b_clk    ),
      .RAM2_b_en_o     (post_bitsel_RAM2_b_en     ),
      .RAM2_b_we_o     (post_bitsel_RAM2_b_we     ),
      .RAM2_b_re_o     (post_bitsel_RAM2_b_re     ),
      .RAM2_b_addr_o   (post_bitsel_RAM2_b_addr   ),
      .RAM2_b_data_o   (post_bitsel_RAM2_b_wrdata ),
      .RAM2_b_bitmask_o(post_bitsel_RAM2_b_bitmask),

      // signals to RAM-macro 3
      .RAM3_a_clk_o    (post_bitsel_RAM3_a_clk    ),
      .RAM3_a_en_o     (post_bitsel_RAM3_a_en     ),
      .RAM3_a_we_o     (post_bitsel_RAM3_a_we     ),
      .RAM3_a_re_o     (post_bitsel_RAM3_a_re     ),
      .RAM3_a_addr_o   (post_bitsel_RAM3_a_addr   ),
      .RAM3_a_data_o   (post_bitsel_RAM3_a_wrdata ),
      .RAM3_a_bitmask_o(post_bitsel_RAM3_a_bitmask),
      .RAM3_b_clk_o    (post_bitsel_RAM3_b_clk    ),
      .RAM3_b_en_o     (post_bitsel_RAM3_b_en     ),
      .RAM3_b_we_o     (post_bitsel_RAM3_b_we     ),
      .RAM3_b_re_o     (post_bitsel_RAM3_b_re     ),
      .RAM3_b_addr_o   (post_bitsel_RAM3_b_addr   ),
      .RAM3_b_data_o   (post_bitsel_RAM3_b_wrdata ),
      .RAM3_b_bitmask_o(post_bitsel_RAM3_b_bitmask),

      // signals to RAM-macro 4
      .RAM4_a_clk_o    (post_bitsel_RAM4_a_clk    ),
      .RAM4_a_en_o     (post_bitsel_RAM4_a_en     ),
      .RAM4_a_we_o     (post_bitsel_RAM4_a_we     ),
      .RAM4_a_re_o     (post_bitsel_RAM4_a_re     ),
      .RAM4_a_addr_o   (post_bitsel_RAM4_a_addr   ),
      .RAM4_a_data_o   (post_bitsel_RAM4_a_wrdata ),
      .RAM4_a_bitmask_o(post_bitsel_RAM4_a_bitmask),
      .RAM4_b_clk_o    (post_bitsel_RAM4_b_clk    ),
      .RAM4_b_en_o     (post_bitsel_RAM4_b_en     ),
      .RAM4_b_we_o     (post_bitsel_RAM4_b_we     ),
      .RAM4_b_re_o     (post_bitsel_RAM4_b_re     ),
      .RAM4_b_addr_o   (post_bitsel_RAM4_b_addr   ),
      .RAM4_b_data_o   (post_bitsel_RAM4_b_wrdata ),
      .RAM4_b_bitmask_o(post_bitsel_RAM4_b_bitmask)
    );

   wire [19:0]        RAM1_a_rddata;
   wire [19:0]        RAM1_b_rddata;
   wire [19:0]        RAM2_a_rddata;
   wire [19:0]        RAM2_b_rddata;
   wire [19:0]        RAM3_a_rddata;
   wire [19:0]        RAM3_b_rddata;
   wire [19:0]        RAM4_a_rddata;
   wire [19:0]        RAM4_b_rddata;

   //always@(posedge post_bitsel_RAM1_a_clk) begin
   //   if( (post_bitsel_RAM1_a_addr & 16'hff80) == (16'hf891 & 16'hff80) ) begin
   //      if(post_bitsel_RAM1_a_en && post_bitsel_RAM1_a_re)
   //        $write("INFO DUT-RAM1 %d: reading at port A at addr 0x%x!\n", $time, post_bitsel_RAM1_a_addr);
   //      if(post_bitsel_RAM1_a_en && post_bitsel_RAM1_a_we)
   //        $write("INFO DUT-RAM1 %d: writing at port A at addr 0x%x with data=0x%x, bitmask=0x%x!\n", $time, post_bitsel_RAM1_a_addr, post_bitsel_RAM1_a_wrdata, post_bitsel_RAM1_a_bitmask);
   //   end
   //end
   //always@(posedge post_bitsel_RAM1_b_clk) begin
   //   if( (post_bitsel_RAM1_b_addr & 16'hff80) == (16'hf891 & 16'hff80) ) begin
   //      if(post_bitsel_RAM1_b_en && post_bitsel_RAM1_b_re)
   //        $write("INFO DUT-RAM1 %d: reading at portB at addr 0x%x!\n", $time, post_bitsel_RAM1_b_addr);
   //      if(post_bitsel_RAM1_b_en && post_bitsel_RAM1_b_we)
   //        $write("INFO DUT-RAM1 %d: writing at portB at addr 0x%x with data=0x%x, bitmask=0x%x!\n", $time, post_bitsel_RAM1_b_addr, post_bitsel_RAM1_b_wrdata, post_bitsel_RAM1_b_bitmask);
   //   end
   //end
   RM_GF28SLP_2P_512x20_c2
   #(.P_DATA_WIDTH(20),
     .P_ADDR_WIDTH(9),
     .P_COUNT(512) )
   RAM_i1
     (.A_CLK_I (post_bitsel_RAM1_a_clk    ),
      .A_CS_I  (post_bitsel_RAM1_a_en     ),
      .A_ADDR_I(post_bitsel_RAM1_a_addr[15:7]   ),
      .A_DW_I  (post_bitsel_RAM1_a_wrdata ),
      .A_BM_I  (post_bitsel_RAM1_a_bitmask),
      .A_WE_I  (post_bitsel_RAM1_a_we     ),
      .A_RE_I  (post_bitsel_RAM1_a_re     ),

      //output port a0
      .A_DR_O  (RAM1_a_rddata),

      //inputs port a1
      .B_CLK_I (post_bitsel_RAM1_b_clk    ),
      .B_CS_I  (post_bitsel_RAM1_b_en     ),
      .B_ADDR_I(post_bitsel_RAM1_b_addr[15:7]   ),
      .B_DW_I  (post_bitsel_RAM1_b_wrdata ),
      .B_BM_I  (post_bitsel_RAM1_b_bitmask),
      .B_WE_I  (post_bitsel_RAM1_b_we     ),
      .B_RE_I  (post_bitsel_RAM1_b_re     ),

      //output port a1
      .B_DR_O  (RAM1_b_rddata),

      .A_DLYL_I  (cfg_sram_delay[5:4]),
      .A_DLYH_I  (cfg_sram_delay[3:2]),
      .A_DLYCLK_I(cfg_sram_delay[1:0]),
      .B_DLYL_I  (cfg_sram_delay[5:4]),
      .B_DLYH_I  (cfg_sram_delay[3:2]),
      .B_DLYCLK_I(cfg_sram_delay[1:0]));



   //always@(posedge post_bitsel_RAM2_a_clk) begin
   //   if( (post_bitsel_RAM2_a_addr & 16'hff80) == (16'h8cb8 & 16'hff80) ) begin
   //      if(post_bitsel_RAM2_a_en && post_bitsel_RAM2_a_re)
   //        $write("INFO DUT-RAM2 %d: reading at port A at addr 0x%x!\n", $time, post_bitsel_RAM2_a_addr);
   //      if(post_bitsel_RAM2_a_en && post_bitsel_RAM2_a_we)
   //        $write("INFO DUT-RAM2 %d: writing at port A at addr 0x%x with data=0x%x, bitmask=0x%x!\n", $time, post_bitsel_RAM2_a_addr, post_bitsel_RAM2_a_wrdata, post_bitsel_RAM2_a_bitmask);
   //   end
   //end
   //always@(posedge post_bitsel_RAM2_b_clk) begin
   //   if( (post_bitsel_RAM2_b_addr & 16'hff80) == (16'h8cb8 & 16'hff80) ) begin
   //      if(post_bitsel_RAM2_b_en && post_bitsel_RAM2_b_re)
   //        $write("INFO DUT-RAM2 %d: reading at portB at addr 0x%x!\n", $time, post_bitsel_RAM2_b_addr);
   //      if(post_bitsel_RAM2_b_en && post_bitsel_RAM2_b_we)
   //        $write("INFO DUT-RAM2 %d: writing at portB at addr 0x%x with data=0x%x, bitmask=0x%x!\n", $time, post_bitsel_RAM2_b_addr, post_bitsel_RAM2_b_wrdata, post_bitsel_RAM2_b_bitmask);
   //   end
   //end
   RM_GF28SLP_2P_512x20_c2
   #(.P_DATA_WIDTH(20),
     .P_ADDR_WIDTH(9),
     .P_COUNT(512) )
   RAM_i2
     (.A_CLK_I (post_bitsel_RAM2_a_clk    ),
      .A_CS_I  (post_bitsel_RAM2_a_en     ),
      .A_ADDR_I(post_bitsel_RAM2_a_addr[15:7]   ),
      .A_DW_I  (post_bitsel_RAM2_a_wrdata ),
      .A_BM_I  (post_bitsel_RAM2_a_bitmask),
      .A_WE_I  (post_bitsel_RAM2_a_we     ),
      .A_RE_I  (post_bitsel_RAM2_a_re     ),

      //output port a0
      .A_DR_O  (RAM2_a_rddata),

      //inputs port a1
      .B_CLK_I (post_bitsel_RAM2_b_clk    ),
      .B_CS_I  (post_bitsel_RAM2_b_en     ),
      .B_ADDR_I(post_bitsel_RAM2_b_addr[15:7]   ),
      .B_DW_I  (post_bitsel_RAM2_b_wrdata ),
      .B_BM_I  (post_bitsel_RAM2_b_bitmask),
      .B_WE_I  (post_bitsel_RAM2_b_we     ),
      .B_RE_I  (post_bitsel_RAM2_b_re     ),

      //output port a1
      .B_DR_O  (RAM2_b_rddata),

      .A_DLYL_I  (cfg_sram_delay[5:4]),
      .A_DLYH_I  (cfg_sram_delay[3:2]),
      .A_DLYCLK_I(cfg_sram_delay[1:0]),
      .B_DLYL_I  (cfg_sram_delay[5:4]),
      .B_DLYH_I  (cfg_sram_delay[3:2]),
      .B_DLYCLK_I(cfg_sram_delay[1:0]));


   RM_GF28SLP_2P_512x20_c2
   #(.P_DATA_WIDTH(20),
     .P_ADDR_WIDTH(9),
     .P_COUNT(512) )
   RAM_i3
     (.A_CLK_I (post_bitsel_RAM3_a_clk    ),
      .A_CS_I  (post_bitsel_RAM3_a_en     ),
      .A_ADDR_I(post_bitsel_RAM3_a_addr[15:7]   ),
      .A_DW_I  (post_bitsel_RAM3_a_wrdata ),
      .A_BM_I  (post_bitsel_RAM3_a_bitmask),
      .A_WE_I  (post_bitsel_RAM3_a_we     ),
      .A_RE_I  (post_bitsel_RAM3_a_re     ),

      //output port a0
      .A_DR_O  (RAM3_a_rddata),

      //inputs port a1
      .B_CLK_I (post_bitsel_RAM3_b_clk    ),
      .B_CS_I  (post_bitsel_RAM3_b_en     ),
      .B_ADDR_I(post_bitsel_RAM3_b_addr[15:7]   ),
      .B_DW_I  (post_bitsel_RAM3_b_wrdata ),
      .B_BM_I  (post_bitsel_RAM3_b_bitmask),
      .B_WE_I  (post_bitsel_RAM3_b_we     ),
      .B_RE_I  (post_bitsel_RAM3_b_re     ),

      //output port a1
      .B_DR_O  (RAM3_b_rddata),

      .A_DLYL_I  (cfg_sram_delay[5:4]),
      .A_DLYH_I  (cfg_sram_delay[3:2]),
      .A_DLYCLK_I(cfg_sram_delay[1:0]),
      .B_DLYL_I  (cfg_sram_delay[5:4]),
      .B_DLYH_I  (cfg_sram_delay[3:2]),
      .B_DLYCLK_I(cfg_sram_delay[1:0]));


   RM_GF28SLP_2P_512x20_c2
   #(.P_DATA_WIDTH(20),
     .P_ADDR_WIDTH(9),
     .P_COUNT(512) )
   RAM_i4
     (.A_CLK_I (post_bitsel_RAM4_a_clk    ),
      .A_CS_I  (post_bitsel_RAM4_a_en     ),
      .A_ADDR_I(post_bitsel_RAM4_a_addr[15:7]   ),
      .A_DW_I  (post_bitsel_RAM4_a_wrdata ),
      .A_BM_I  (post_bitsel_RAM4_a_bitmask),
      .A_WE_I  (post_bitsel_RAM4_a_we     ),
      .A_RE_I  (post_bitsel_RAM4_a_re     ),

      //output port a0
      .A_DR_O  (RAM4_a_rddata),

      //inputs port a1
      .B_CLK_I (post_bitsel_RAM4_b_clk    ),
      .B_CS_I  (post_bitsel_RAM4_b_en     ),
      .B_ADDR_I(post_bitsel_RAM4_b_addr[15:7]   ),
      .B_DW_I  (post_bitsel_RAM4_b_wrdata ),
      .B_BM_I  (post_bitsel_RAM4_b_bitmask),
      .B_WE_I  (post_bitsel_RAM4_b_we     ),
      .B_RE_I  (post_bitsel_RAM4_b_re     ),

      //output port a1
      .B_DR_O  (RAM4_b_rddata),

      .A_DLYL_I  (cfg_sram_delay[5:4]),
      .A_DLYH_I  (cfg_sram_delay[3:2]),
      .A_DLYCLK_I(cfg_sram_delay[1:0]),
      .B_DLYL_I  (cfg_sram_delay[5:4]),
      .B_DLYH_I  (cfg_sram_delay[3:2]),
      .B_DLYCLK_I(cfg_sram_delay[1:0]));


   // right-aligned data for mode-deselection
   wire [19:0] post_bitdesel_RAM1_a_rddata;
   wire [19:0] post_bitdesel_RAM1_b_rddata;
   wire [19:0] post_bitdesel_RAM2_a_rddata;
   wire [19:0] post_bitdesel_RAM2_b_rddata;
   wire [19:0] post_bitdesel_RAM3_a_rddata;
   wire [19:0] post_bitdesel_RAM3_b_rddata;
   wire [19:0] post_bitdesel_RAM4_a_rddata;
   wire [19:0] post_bitdesel_RAM4_b_rddata;

   bit_deselection
     #(.CONFIG_1BIT (CONFIG_1BIT ),
       .CONFIG_2BIT (CONFIG_2BIT ),
       .CONFIG_5BIT (CONFIG_5BIT ),
       .CONFIG_10BIT(CONFIG_10BIT),
       .CONFIG_20BIT(CONFIG_20BIT),
       .CONFIG_40BIT(CONFIG_40BIT),
       .CONFIG_80BIT(CONFIG_80BIT)
       )
   bit_deselection_i
     (// signals from RAM-macro 1
      .RAM1_a_output_config_i(post_modesel_RAM1_a_output_config),
      .RAM1_a_clk_i          (post_bitsel_RAM1_a_clk    ),
      .RAM1_a_re_i           (post_bitsel_RAM1_a_re     ),
      .RAM1_a_addr_i         (post_bitsel_RAM1_a_addr   ),
      .RAM1_a_rddata_i       (RAM1_a_rddata),
      .RAM1_b_output_config_i(post_modesel_RAM1_b_output_config),
      .RAM1_b_clk_i          (post_bitsel_RAM1_b_clk    ),
      .RAM1_b_re_i           (post_bitsel_RAM1_b_re     ),
      .RAM1_b_addr_i         (post_bitsel_RAM1_b_addr   ),
      .RAM1_b_rddata_i       (RAM1_b_rddata),

      // signals from RAM-macro 2
      .RAM2_a_output_config_i(post_modesel_RAM2_a_output_config),
      .RAM2_a_clk_i          (post_bitsel_RAM2_a_clk    ),
      .RAM2_a_re_i           (post_bitsel_RAM2_a_re     ),
      .RAM2_a_addr_i         (post_bitsel_RAM2_a_addr   ),
      .RAM2_a_rddata_i       (RAM2_a_rddata),
      .RAM2_b_output_config_i(post_modesel_RAM2_b_output_config),
      .RAM2_b_clk_i          (post_bitsel_RAM2_b_clk    ),
      .RAM2_b_re_i           (post_bitsel_RAM2_b_re     ),
      .RAM2_b_addr_i         (post_bitsel_RAM2_b_addr   ),
      .RAM2_b_rddata_i       (RAM2_b_rddata),

      // signals from RAM-macro 3
      .RAM3_a_output_config_i(post_modesel_RAM3_a_output_config),
      .RAM3_a_clk_i          (post_bitsel_RAM3_a_clk    ),
      .RAM3_a_re_i           (post_bitsel_RAM3_a_re     ),
      .RAM3_a_addr_i         (post_bitsel_RAM3_a_addr   ),
      .RAM3_a_rddata_i       (RAM3_a_rddata),
      .RAM3_b_output_config_i(post_modesel_RAM3_b_output_config),
      .RAM3_b_clk_i          (post_bitsel_RAM3_b_clk    ),
      .RAM3_b_re_i           (post_bitsel_RAM3_b_re     ),
      .RAM3_b_addr_i         (post_bitsel_RAM3_b_addr   ),
      .RAM3_b_rddata_i       (RAM3_b_rddata),

      // signals from RAM-macro 4
      .RAM4_a_output_config_i(post_modesel_RAM4_a_output_config),
      .RAM4_a_clk_i          (post_bitsel_RAM4_a_clk    ),
      .RAM4_a_re_i           (post_bitsel_RAM4_a_re     ),
      .RAM4_a_addr_i         (post_bitsel_RAM4_a_addr   ),
      .RAM4_a_rddata_i       (RAM4_a_rddata),
      .RAM4_b_output_config_i(post_modesel_RAM4_b_output_config),
      .RAM4_b_clk_i          (post_bitsel_RAM4_b_clk    ),
      .RAM4_b_re_i           (post_bitsel_RAM4_b_re     ),
      .RAM4_b_addr_i         (post_bitsel_RAM4_b_addr   ),
      .RAM4_b_rddata_i       (RAM4_b_rddata),



      // right-aligned data (potentially registered) for mode-deselction
      .RAM1_a_rddata_o(post_bitdesel_RAM1_a_rddata),
      .RAM1_b_rddata_o(post_bitdesel_RAM1_b_rddata),
      .RAM2_a_rddata_o(post_bitdesel_RAM2_a_rddata),
      .RAM2_b_rddata_o(post_bitdesel_RAM2_b_rddata),
      .RAM3_a_rddata_o(post_bitdesel_RAM3_a_rddata),
      .RAM3_b_rddata_o(post_bitdesel_RAM3_b_rddata),
      .RAM4_a_rddata_o(post_bitdesel_RAM4_a_rddata),
      .RAM4_b_rddata_o(post_bitdesel_RAM4_b_rddata)
      );

   wire [19:0] post_modedesel_a0_rddata;
   wire [19:0] post_modedesel_a1_rddata;
   wire [19:0] post_modedesel_b0_rddata;
   wire [19:0] post_modedesel_b1_rddata;

   mode_deselection
     #(.CONFIG_1BIT (CONFIG_1BIT ),
       .CONFIG_2BIT (CONFIG_2BIT ),
       .CONFIG_5BIT (CONFIG_5BIT ),
       .CONFIG_10BIT(CONFIG_10BIT),
       .CONFIG_20BIT(CONFIG_20BIT),
       .CONFIG_40BIT(CONFIG_40BIT),
       .CONFIG_80BIT(CONFIG_80BIT),

       .CONFIG_TDP_NONSPLIT(CONFIG_TDP_NONSPLIT),
       .CONFIG_TDP_SPLIT   (CONFIG_TDP_SPLIT   ),
       .CONFIG_SDP_NONSPLIT(CONFIG_SDP_NONSPLIT),
       .CONFIG_SDP_SPLIT   (CONFIG_SDP_SPLIT   ),
       .CONFIG_FIFO_ASYNC  (CONFIG_FIFO_ASYNC  ),
       .CONFIG_FIFO_SYNC   (CONFIG_FIFO_SYNC   ),
       .CONFIG_CASCADE_UP  (CONFIG_CASCADE_UP  ),
       .CONFIG_CASCADE_LOW (CONFIG_CASCADE_LOW )
       )
   mode_deselection_i
     (.cfg_sram_mode_i       (cfg_sram_mode       ),
      .cfg_output_config_a0_i(cfg_output_config_a0),
      .cfg_output_config_a1_i(cfg_output_config_a1),
      .cfg_output_config_b0_i(cfg_output_config_b0),
      .cfg_output_config_b1_i(cfg_output_config_b1),
      .cfg_cascade_enable_i  (cfg_cascade_enable  ),
      .cfg_fifo_enable_i     ((cfg_fifo_async_enable || cfg_fifo_sync_enable) && (cfg_sram_mode == CONFIG_SDP_NONSPLIT)),

      // from which RAM shall data be forwarded to DPSRAM output
      .a0_clk_i       (post_modesel_RAM1_a_clk),
      .a1_clk_i       (post_modesel_RAM3_a_clk),
      .b0_clk_i       (post_modesel_RAM1_b_clk),
      .b1_clk_i       (post_modesel_RAM3_b_clk),
      .a0_re_i        (post_modesel_a0_re),
      .a1_re_i        (post_modesel_a1_re),
      .b0_re_i        (post_modesel_b0_re),
      .b1_re_i        (post_modesel_b1_re),
      .a0_ram_select_i(post_modesel_a0_ram_select),
      .a1_ram_select_i(post_modesel_a1_ram_select),
      .b0_ram_select_i(post_modesel_b0_ram_select),
      .b1_ram_select_i(post_modesel_b1_ram_select),
      .a_cascade_select_i(post_modesel_a_cascade_select),
      .b_cascade_select_i(post_modesel_b_cascade_select),

      // right aligned rddata from RAM X, port X
      .RAM1_a_rddata_i(post_bitdesel_RAM1_a_rddata),
      .RAM1_b_rddata_i(post_bitdesel_RAM1_b_rddata),
      .RAM2_a_rddata_i(post_bitdesel_RAM2_a_rddata),
      .RAM2_b_rddata_i(post_bitdesel_RAM2_b_rddata),
      .RAM3_a_rddata_i(post_bitdesel_RAM3_a_rddata),
      .RAM3_b_rddata_i(post_bitdesel_RAM3_b_rddata),
      .RAM4_a_rddata_i(post_bitdesel_RAM4_a_rddata),
      .RAM4_b_rddata_i(post_bitdesel_RAM4_b_rddata),

      // forward signals cascade mode
      .forward_cascade_rddata_a_i(forward_cascade_rddata_a_i ),
      .forward_cascade_rddata_b_i(forward_cascade_rddata_b_i ),
      .forward_cascade_rddata_a_o(forward_cascade_rddata_a_o ),
      .forward_cascade_rddata_b_o(forward_cascade_rddata_b_o ),

      // signals to ECC
      .a0_rddata_o(post_modedesel_a0_rddata),
      .a1_rddata_o(post_modedesel_a1_rddata),
      .b0_rddata_o(post_modedesel_b0_rddata),
      .b1_rddata_o(post_modedesel_b1_rddata)
   );

   wire [19:0] post_eccdec_a0_rddata;
   wire [19:0] post_eccdec_a1_rddata;
   wire [19:0] post_eccdec_b0_rddata;
   wire [19:0] post_eccdec_b1_rddata;
   wire [1:0]  ecc_single_error_flag;
   wire [1:0]  ecc_double_error_flag;

   ecc_decoding
     #(.CONFIG_1BIT (CONFIG_1BIT ),
       .CONFIG_2BIT (CONFIG_2BIT ),
       .CONFIG_5BIT (CONFIG_5BIT ),
       .CONFIG_10BIT(CONFIG_10BIT),
       .CONFIG_20BIT(CONFIG_20BIT),
       .CONFIG_40BIT(CONFIG_40BIT),
       .CONFIG_80BIT(CONFIG_80BIT),

       .CONFIG_TDP_NONSPLIT(CONFIG_TDP_NONSPLIT),
       .CONFIG_TDP_SPLIT   (CONFIG_TDP_SPLIT   ),
       .CONFIG_SDP_NONSPLIT(CONFIG_SDP_NONSPLIT),
       .CONFIG_SDP_SPLIT   (CONFIG_SDP_SPLIT   ),
       .CONFIG_FIFO_ASYNC  (CONFIG_FIFO_ASYNC  ),
       .CONFIG_FIFO_SYNC   (CONFIG_FIFO_SYNC   ),
       .CONFIG_CASCADE_UP  (CONFIG_CASCADE_UP  ),
       .CONFIG_CASCADE_LOW (CONFIG_CASCADE_LOW )
       )
   ecc_decoding_i0
     (.cfg_sram_mode_i (cfg_sram_mode ),
      .cfg_ecc_enable_i(cfg_ecc_enable),

      .a0_data_i(post_modedesel_a0_rddata),
      .a1_data_i(post_modedesel_a1_rddata),
      .b0_data_i(post_modedesel_b0_rddata),
      .b1_data_i(post_modedesel_b1_rddata),
      .a0_data_o(post_eccdec_a0_rddata),
      .a1_data_o(post_eccdec_a1_rddata),
      .b0_data_o(post_eccdec_b0_rddata),
      .b1_data_o(post_eccdec_b1_rddata),

      .single_error_flag_o(ecc_single_error_flag),
      .double_error_flag_o(ecc_double_error_flag)
      );


    wire [39:0] rddata_for_bist;
    assign rddata_for_bist = (port_select == 'b1) ? {post_modedesel_b1_rddata,post_modedesel_b0_rddata} : {post_modedesel_a1_rddata,post_modedesel_a0_rddata};

  data_forwarding
   data_forwarding_i
     (
     .clk_i(global_clk_x1_i),
     .bist_enable_i(bist_enable_i),
     .y_select_i(cfg_gy),
     .rddata_i(rddata_for_bist),
     .bist_rddata_i(bist_rddata_i),
     .bist_rddata_o(bist_rddata_o)
      );


   output_registering
     #(.CONFIG_TDP_NONSPLIT(CONFIG_TDP_NONSPLIT),
       .CONFIG_TDP_SPLIT   (CONFIG_TDP_SPLIT   ),
       .CONFIG_SDP_NONSPLIT(CONFIG_SDP_NONSPLIT),
       .CONFIG_SDP_SPLIT   (CONFIG_SDP_SPLIT   ),
       .CONFIG_FIFO_ASYNC  (CONFIG_FIFO_ASYNC  ),
       .CONFIG_FIFO_SYNC   (CONFIG_FIFO_SYNC   ),
       .CONFIG_CASCADE_UP  (CONFIG_CASCADE_UP  ),
       .CONFIG_CASCADE_LOW (CONFIG_CASCADE_LOW )
       )
     output_registering_i
       (.cfg_sram_mode_i       (cfg_sram_mode),
        .cfg_set_outputreg_a0_i(cfg_set_outputreg_a0),
        .cfg_set_outputreg_a1_i(cfg_set_outputreg_a1),
        .cfg_set_outputreg_b0_i(cfg_set_outputreg_b0),
        .cfg_set_outputreg_b1_i(cfg_set_outputreg_b1),
        .cfg_fifo_enable_i     ((cfg_fifo_async_enable || cfg_fifo_sync_enable) && (cfg_sram_mode == CONFIG_SDP_NONSPLIT)),

        // port clocks coming from signal_inversion with 7 stages up to now
        .a0_clk_i(post_invert_a0_clk),
        .a1_clk_i(post_invert_a1_clk),
        .b0_clk_i(post_invert_b0_clk),
        .b1_clk_i(post_invert_b1_clk),

        // signals from mode_deselection/ECC
        .a0_rddata_i(post_eccdec_a0_rddata),
        .a1_rddata_i(post_eccdec_a1_rddata),
        .b0_rddata_i(post_eccdec_b0_rddata),
        .b1_rddata_i(post_eccdec_b1_rddata),

        // signals to DPSRAM-output ports
        .a0_rddata_o(a0_rddata_o),
        .a1_rddata_o(a1_rddata_o),
        .b0_rddata_o(b0_rddata_o),
        .b1_rddata_o(b1_rddata_o),


        .ecc_single_error_flag_i(ecc_single_error_flag),
        .ecc_double_error_flag_i(ecc_double_error_flag),
        .ecc_single_error_flag_o(lo_left_ecc_single_error_flag_o),
        .ecc_double_error_flag_o(lo_left_ecc_double_error_flag_o)
        );
    assign up_left_ecc_single_error_flag_o  = lo_left_ecc_single_error_flag_o;
    assign lo_right_ecc_single_error_flag_o = lo_left_ecc_single_error_flag_o;
    assign up_right_ecc_single_error_flag_o = lo_left_ecc_single_error_flag_o;

    assign up_left_ecc_double_error_flag_o  = lo_left_ecc_double_error_flag_o;
    assign lo_right_ecc_double_error_flag_o = lo_left_ecc_double_error_flag_o;
    assign up_right_ecc_double_error_flag_o = lo_left_ecc_double_error_flag_o;

endmodule // dpsram_block_4x512x20
