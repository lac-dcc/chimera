// This program was cloned from: https://github.com/OpenCAPI/oc-accel
// License: Apache License 2.0

/*
 * Copyright 2020 International Business Machines
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
`include "snap_global_vars.v"

 module oc_action_core (
   input                                 clock_afu       ,
   input                                 reset_action_d  ,
   input                                 ocde            , //connected from top-level port
   output                                ocde_to_bsp     ,
   output                                int_req         ,
   output [`INT_BITS-1:0]                int_src         ,
   output [`CTXW-1:0]                    int_ctx         ,
   input                                 int_req_ack     ,
    // AXI Control Register interface connected to snap_core
   input [ `AXI_LITE_AW-1 : 0]           s_axil_awaddr   ,
   input                                 s_axil_awprot   ,
   input                                 s_axil_awvalid  ,
   output                                s_axil_awready  ,
   input [ `AXI_LITE_DW-1 : 0]           s_axil_wdata    ,
   input [(`AXI_LITE_DW/8)-1 : 0]        s_axil_wstrb    ,
   input                                 s_axil_wvalid   ,
   output                                s_axil_wready   ,
   output [ 1 : 0]                       s_axil_bresp    ,
   output                                s_axil_bvalid   ,
   input                                 s_axil_bready   ,
   input [ `AXI_LITE_AW-1 : 0]           s_axil_araddr   ,
   input                                 s_axil_arprot   ,
   input                                 s_axil_arvalid  ,
   output                                s_axil_arready  ,
   output [ `AXI_LITE_DW-1 : 0]          s_axil_rdata    ,
   output [ 1 : 0]                       s_axil_rresp    ,
   output                                s_axil_rvalid   ,
   input                                 s_axil_rready   ,
//================================================================
    // AXI Host Memory Slave interface connected to snap_core
   output [ `AXI_MM_AW-1 : 0]            m_aximm_awaddr      ,
   output [ `IDW-1 : 0]                  m_aximm_awid        ,
   output [ 7 : 0]                       m_aximm_awlen       ,
   output [ 2 : 0]                       m_aximm_awsize      ,
   output [ 1 : 0]                       m_aximm_awburst     ,
   output [ 1 : 0]                       m_aximm_awlock      ,
   output [ 3 : 0]                       m_aximm_awcache     ,
   output [ 2 : 0]                       m_aximm_awprot      ,
   output [ 3 : 0]                       m_aximm_awregion    ,
   output [ 3 : 0]                       m_aximm_awqos       ,
   output                                m_aximm_awvalid     ,
   input                                 m_aximm_awready     ,
   output [`AXI_MM_DW-1:0]               m_aximm_wdata       ,
   output [(`AXI_MM_DW/8)-1:0]           m_aximm_wstrb       ,
   output                                m_aximm_wlast       ,
   output                                m_aximm_wvalid      ,
   input                                 m_aximm_wready      ,
   input [ 1 : 0]                        m_aximm_bresp       ,
   input                                 m_aximm_bvalid      ,
   input [ `IDW-1 : 0]                   m_aximm_bid         ,
   output                                m_aximm_bready      ,
   output [ `AXI_MM_AW-1 : 0]            m_aximm_araddr      ,
   output [ `IDW-1 : 0]                  m_aximm_arid        ,
   output [ 7 : 0]                       m_aximm_arlen       ,
   output [ 2 : 0]                       m_aximm_arsize      ,
   output [ 1 : 0]                       m_aximm_arburst     ,
   output [ 1 : 0]                       m_aximm_arlock      ,
   output [ 3 : 0]                       m_aximm_arcache     ,
   output [ 2 : 0]                       m_aximm_arprot      ,
   output [ 3 : 0]                       m_aximm_arregion    ,
   output [ 3 : 0]                       m_aximm_arqos       ,
   output                                m_aximm_arvalid     ,
   input                                 m_aximm_arready     ,
   input [`AXI_MM_DW-1:0]                m_aximm_rdata       ,
   input [ `IDW-1 : 0]                   m_aximm_rid         ,
   input [ 1 : 0]                        m_aximm_rresp       ,
   input                                 m_aximm_rlast       ,
   input                                 m_aximm_rvalid      ,
   output                                m_aximm_rready      ,

   input                                 clock_hbm_ref       ,
   input                                 act_axi_card_mem0_apb_pclk

   , input  [`AXI_BUSER-1:0]               m_aximm_buser
   , input  [`AXI_RUSER-1:0]               m_aximm_ruser
   , output [`AXI_AWUSER-1:0]              m_aximm_aruser
   , output [`AXI_AWUSER-1:0]              m_aximm_awuser
   , output [`AXI_WUSER-1:0]               m_aximm_wuser

  `ifdef ENABLE_DDR 
  
  `ifdef AD9V3
   // DDR4 SDRAM Interface
    , input                  c0_sys_clk_p
    , input                  c0_sys_clk_n
    , output  [16 : 0]       c0_ddr4_adr
    , output  [1 : 0]        c0_ddr4_ba
    , output  [0 : 0]        c0_ddr4_cke
    , output  [0 : 0]        c0_ddr4_cs_n
    , inout   [8 : 0]        c0_ddr4_dm_dbi_n
    , inout   [71 : 0]       c0_ddr4_dq
    , inout   [8 : 0]        c0_ddr4_dqs_c
    , inout   [8 : 0]        c0_ddr4_dqs_t
    , output  [0 : 0]        c0_ddr4_odt
    , output  [1 : 0]        c0_ddr4_bg
    , output                 c0_ddr4_reset_n
    , output                 c0_ddr4_act_n
    , output  [0 : 0]        c0_ddr4_ck_c
    , output  [0 : 0]        c0_ddr4_ck_t
   `endif
  `ifdef BW250SOC
  
   // DDR4 SDRAM Interface
 // , output [511:0]       dbg_bus //Unused
    , input                  c0_sys_clk_p
    , input                  c0_sys_clk_n
    , output  [16 : 0]       c0_ddr4_adr
    , output  [1 : 0]        c0_ddr4_ba
    , output  [0 : 0]        c0_ddr4_cke
    , output  [0 : 0]        c0_ddr4_cs_n
    , inout   [8 : 0]        c0_ddr4_dm_dbi_n
    , inout   [71 : 0]       c0_ddr4_dq
    , inout   [8 : 0]        c0_ddr4_dqs_c
    , inout   [8 : 0]        c0_ddr4_dqs_t
    , output  [0 : 0]        c0_ddr4_odt
    , output  [0 : 0]        c0_ddr4_bg
    , output                 c0_ddr4_reset_n
    , output                 c0_ddr4_act_n
    , output  [0 : 0]        c0_ddr4_ck_c
    , output  [0 : 0]        c0_ddr4_ck_t
   `endif

   `endif

// ETHERNET
  `ifdef ENABLE_ETHERNET 
  `ifndef ENABLE_ETH_LOOP_BACK
    , input                  gt_ref_clk_n
    , input                  gt_ref_clk_p
    , input                  gt_rx_gt_port_0_n
    , input                  gt_rx_gt_port_0_p
    , input                  gt_rx_gt_port_1_n
    , input                  gt_rx_gt_port_1_p
    , input                  gt_rx_gt_port_2_n
    , input                  gt_rx_gt_port_2_p
    , input                  gt_rx_gt_port_3_n
    , input                  gt_rx_gt_port_3_p
    , output                 gt_tx_gt_port_0_n
    , output                 gt_tx_gt_port_0_p
    , output                 gt_tx_gt_port_1_n
    , output                 gt_tx_gt_port_1_p
    , output                 gt_tx_gt_port_2_n
    , output                 gt_tx_gt_port_2_p
    , output                 gt_tx_gt_port_3_n
    , output                 gt_tx_gt_port_3_p
   `endif
   `endif

   `ifdef ENABLE_9H3_LED
     , output                 user_led_a0
     , output                 user_led_a1
     , output                 user_led_g0
     , output                 user_led_g1
   `endif
   `ifdef ENABLE_9H3_EEPROM
     , inout                  eeprom_scl_io
     , inout                  eeprom_sda_io
     , output                 eeprom_wp
   `endif
   `ifdef ENABLE_9H3_AVR
    , input                  uc_avr_rx
    , output                 uc_avr_tx
    , input                  uc_avr_ck
   `endif

  );


// ocde IO is located in the same pad than HBM clk. As we want to have the HBM in dynamic area
// this ocde will be forced into the dynamic area. This is a trick to allow the ocde pin from
// top level to be part of the dynamic area. A decoupling has been added to ensure this ocde
// value never change during a dynamic programming.  
// IO Buffer used to move the ocde input IO to the dynamic part of PR  
// This is related only to AD9H3, AD9H335 and AD9H7 who have HBM memories
`ifdef AD9H3
   IBUF IBUF_inst (
      .O(ocde_to_bsp),     // Buffer output to send to BSP
      .I(ocde)             // Buffer input (connect directly from top-level port)
   );
`else
  `ifdef AD9H335
     IBUF IBUF_inst (
        .O(ocde_to_bsp),     // Buffer output to send to BSP
        .I(ocde)             // Buffer input (connect directly from top-level port)
     );
  `else
     `ifdef AD9H7
        IBUF IBUF_inst (
           .O(ocde_to_bsp),     // Buffer output to send to BSP
           .I(ocde)             // Buffer input (connect directly from top-level port)
        );
     `else
        assign ocde_to_bsp = ocde;
     `endif
  `endif
`endif
  // // ******************************************************************************
  // // wires
  // // ******************************************************************************

    `ifdef ENABLE_EMAC_V3_1
  wire [3:0]                 gt_grxn  ;
  wire [3:0]                 gt_grxp  ;
  wire [3:0]                 gt_gtxn  ;
  wire [3:0]                 gt_gtxp  ;
    `endif

  // // Interface between snap_core to (clock/dwidth) converter


`ifdef ENABLE_ODMA
    `ifndef ENABLE_ODMA_ST_MODE
        wire [`AXI_MM_AW-1:0]       axi_mm_awaddr   ;
        wire [`IDW-1:0]             axi_mm_awid     ;
        wire [7:0]                 axi_mm_awlen    ;
        wire [2:0]                 axi_mm_awsize   ;
        wire [1:0]                 axi_mm_awburst  ;
        wire [2:0]                 axi_mm_awprot   ;
        wire [3:0]                 axi_mm_awqos    ;
        wire [3:0]                 axi_mm_awregion ;
        wire [`AXI_AWUSER-1:0]      axi_mm_awuser   ;
        wire                       axi_mm_awvalid  ;
        wire [1:0]                 axi_mm_awlock   ;
        wire [3:0]                 axi_mm_awcache  ;
        wire                       axi_mm_awready  ;
        wire [`AXI_MM_DW-1:0]       axi_mm_wdata    ;
        wire                       axi_mm_wlast    ;
        wire [`AXI_MM_DW/8-1:0]     axi_mm_wstrb    ;
        wire                       axi_mm_wvalid   ;
        wire [`AXI_WUSER-1:0]       axi_mm_wuser    ;
        wire                       axi_mm_wready   ;
        wire                       axi_mm_bvalid   ;
        wire [1:0]                 axi_mm_bresp    ;
        wire [`IDW-1:0]             axi_mm_bid      ;
        wire [`AXI_BUSER-1:0]       axi_mm_buser    ;
        wire                       axi_mm_bready   ;
        wire [`AXI_MM_AW-1:0]       axi_mm_araddr   ;
        wire [1:0]                 axi_mm_arburst  ;
        wire [3:0]                 axi_mm_arcache  ;
        wire [`IDW-1:0]             axi_mm_arid     ;
        wire [7:0]                 axi_mm_arlen    ;
        wire [1:0]                 axi_mm_arlock   ;
        wire [2:0]                 axi_mm_arprot   ;
        wire [3:0]                 axi_mm_arqos    ;
        wire                       axi_mm_arready  ;
        wire [3:0]                 axi_mm_arregion ;
        wire [2:0]                 axi_mm_arsize   ;
        wire [`AXI_ARUSER-1:0]      axi_mm_aruser   ;
        wire                       axi_mm_arvalid  ;
        wire [`AXI_MM_DW-1:0]       axi_mm_rdata    ;
        wire [`IDW-1:0]             axi_mm_rid      ;
        wire                       axi_mm_rlast    ;
        wire                       axi_mm_rready   ;
        wire [1:0]                 axi_mm_rresp    ;
        wire [`AXI_RUSER-1:0]       axi_mm_ruser    ;
        wire                       axi_mm_rvalid   ;
    `else
        wire                        m_axis_tready    ; 
        wire                        m_axis_tlast     ; 
        wire [`AXI_ST_DW - 1:0]      m_axis_tdata     ; 
        wire [`AXI_ST_DW/8 - 1:0]    m_axis_tkeep     ; 
        wire                        m_axis_tvalid    ; 
        wire [`IDW - 1:0]           m_axis_tid        ; 
        wire [`AXI_ST_USER - 1:0]    m_axis_tuser     ; 
        wire                        s_axis_tready    ; 
        wire                        s_axis_tlast     ; 
        wire [`AXI_ST_DW - 1:0]      s_axis_tdata     ; 
        wire [`AXI_ST_DW/8 - 1:0]    s_axis_tkeep     ; 
        wire                        s_axis_tvalid    ; 
        wire [`IDW - 1:0]           s_axis_tid       ; 
        wire [`AXI_ST_USER - 1:0]    s_axis_tuser     ; 
    `endif
  //
  //ActionAXI-LiteslaveInterface
  wire                       a_s_axi_arvalid ;
  wire [`AXI_LITE_AW-1:0]     a_s_axi_araddr  ;
  wire                       a_s_axi_arready ;
  wire                       a_s_axi_rvalid  ;
  wire [`AXI_LITE_DW-1:0]     a_s_axi_rdata   ;
  wire [1:0]                 a_s_axi_rresp   ;
  wire                       a_s_axi_rready  ;
  wire                       a_s_axi_awvalid ;
  wire [`AXI_LITE_AW-1:0]     a_s_axi_awaddr  ;
  wire                       a_s_axi_awready ;
  wire                       a_s_axi_wvalid  ;
  wire [`AXI_LITE_DW-1:0]     a_s_axi_wdata   ;
  wire [`AXI_LITE_DW/8-1:0]   a_s_axi_wstrb   ;
  wire                       a_s_axi_wready  ;
  wire                       a_s_axi_bvalid  ;
  wire [1:0]                 a_s_axi_bresp   ;
  wire                       a_s_axi_bready  ;
  //ActionAXI-LitemasterInterface
  wire                       a_m_axi_arvalid ;
  wire [`AXI_LITE_AW-1:0]    a_m_axi_araddr  ;
  wire                       a_m_axi_arready ;
  wire                       a_m_axi_rvalid  ;
  wire [`AXI_LITE_DW-1:0]    a_m_axi_rdata   ;
  wire [1:0]                 a_m_axi_rresp   ;
  wire                       a_m_axi_rready  ;
  wire                       a_m_axi_awvalid ;
  wire [`AXI_LITE_AW-1:0]    a_m_axi_awaddr  ;
  wire                       a_m_axi_awready ;
  wire                       a_m_axi_wvalid  ;
  wire [`AXI_LITE_DW-1:0]    a_m_axi_wdata   ;
  wire [`AXI_LITE_DW/8-1:0]  a_m_axi_wstrb   ;
  wire                       a_m_axi_wready  ;
  wire                       a_m_axi_bvalid  ;
  wire [1:0]                 a_m_axi_bresp   ;
  wire                       a_m_axi_bready  ;
`endif

  // // Interface between action_wrapper and (clock/dwidth) converter
  wire [`AXI_LITE_AW-1:0]    lite_conv2act_awaddr  ;
  wire [2:0]                 lite_conv2act_awprot  ;
  wire                       lite_conv2act_awvalid ;
  wire [`AXI_LITE_DW-1:0]    lite_conv2act_wdata   ;
  wire [3:0]                 lite_conv2act_wstrb   ;
  wire                       lite_conv2act_wvalid  ;
  wire                       lite_conv2act_bready  ;
  wire [`AXI_LITE_AW-1:0]    lite_conv2act_araddr  ;
  wire [2:0]                 lite_conv2act_arprot  ;
  wire                       lite_conv2act_arvalid ;
  wire                       lite_conv2act_rready  ;

  wire                       lite_act2conv_awready ;
  wire                       lite_act2conv_wready  ;
  wire [1:0]                 lite_act2conv_bresp   ;
  wire                       lite_act2conv_bvalid  ;
  wire                       lite_act2conv_arready ;
  wire [`AXI_LITE_DW-1:0]    lite_act2conv_rdata   ;
  wire [1:0]                 lite_act2conv_rresp   ;
  wire                       lite_act2conv_rvalid  ;

  wire                       mm_conv2act_awready   ;
  wire                       mm_conv2act_wready    ;
  wire [`IDW-1:0]            mm_conv2act_bid       ;
  wire [`AXI_BUSER-1:0]      mm_conv2act_buser     ;
  wire [1:0]                 mm_conv2act_bresp     ;
  wire                       mm_conv2act_bvalid    ;
  wire [`IDW-1:0]            mm_conv2act_rid       ;
  wire [`AXI_RUSER-1:0]      mm_conv2act_ruser     ;
  wire [`AXI_ACT_DW-1:0]     mm_conv2act_rdata     ;
  wire [1:0]                 mm_conv2act_rresp     ;
  wire                       mm_conv2act_rlast     ;
  wire                       mm_conv2act_rvalid    ;
  wire                       mm_conv2act_arready   ;

  wire [`IDW-1:0]            mm_act2conv_awid      ;
  wire [`AXI_MM_AW-1:0]      mm_act2conv_awaddr    ;
  wire [7:0]                 mm_act2conv_awlen     ;
  wire [2:0]                 mm_act2conv_awsize    ;
  wire [1:0]                 mm_act2conv_awburst   ;
  wire                       mm_act2conv_awlock    ;
  wire [3:0]                 mm_act2conv_awcache   ;
  wire [2:0]                 mm_act2conv_awprot    ;
  wire [3:0]                 mm_act2conv_awqos     ;
  wire [3:0]                 mm_act2conv_awregion  ;
  wire [`AXI_AWUSER-1:0]     mm_act2conv_awuser    ;
  wire                       mm_act2conv_awvalid   ;
  wire [`AXI_ACT_DW-1:0]     mm_act2conv_wdata     ;
  wire [`AXI_WUSER-1:0]      mm_act2conv_wuser     ;
  wire [(`AXI_ACT_DW/8)-1:0]  mm_act2conv_wstrb     ;
  wire                       mm_act2conv_wlast     ;
  wire                       mm_act2conv_wvalid    ;
  wire                       mm_act2conv_bready    ;
  wire [`IDW-1:0]             mm_act2conv_arid      ;
  wire [`AXI_MM_AW-1:0]       mm_act2conv_araddr    ;
  wire [7:0]                 mm_act2conv_arlen     ;
  wire [2:0]                 mm_act2conv_arsize    ;
  wire [1:0]                 mm_act2conv_arburst   ;
  wire [`AXI_ARUSER-1:0]      mm_act2conv_aruser    ;
  wire                       mm_act2conv_arlock    ;
  wire [3:0]                 mm_act2conv_arcache   ;
  wire [2:0]                 mm_act2conv_arprot    ;
  wire [3:0]                 mm_act2conv_arqos     ;
  wire [3:0]                 mm_act2conv_arregion  ;
  wire                       mm_act2conv_arvalid   ;
  wire                       mm_act2conv_rready    ;

`ifdef ENABLE_AXI_CARD_MEM
  `ifndef ENABLE_HBM
// ifndef ENABLE_HBM => DDR or DDR replaced by BRAM
  wire [ `AXI_CARD_MEM_ADDR_WIDTH-1 : 0 ]  act_axi_card_mem0_awaddr    ;
  wire [ 7 : 0 ]                          act_axi_card_mem0_awlen     ;
  wire [ 2 : 0 ]                          act_axi_card_mem0_awsize    ;
  wire [ 1 : 0 ]                          act_axi_card_mem0_awburst   ;
  wire [ 1 : 0 ]                          act_axi_card_mem0_awlock    ;
  wire [ 3 : 0 ]                          act_axi_card_mem0_awcache   ;
  wire [ 2 : 0 ]                          act_axi_card_mem0_awprot    ;
  wire [ 3 : 0 ]                          act_axi_card_mem0_awregion  ;
  wire [ 3 : 0 ]                          act_axi_card_mem0_awqos     ;
  wire                                    act_axi_card_mem0_awvalid   ;
  wire                                    act_axi_card_mem0_awready   ;
  wire [ `AXI_CARD_MEM_DATA_WIDTH-1 : 0 ]  act_axi_card_mem0_wdata     ;
  wire [(`AXI_CARD_MEM_DATA_WIDTH/8)-1 : 0] act_axi_card_mem0_wstrb     ;
  wire                                    act_axi_card_mem0_wlast     ;
  wire                                    act_axi_card_mem0_wvalid    ;
  wire                                    act_axi_card_mem0_wready    ;
  wire [ 1 : 0 ]                          act_axi_card_mem0_bresp     ;
  wire                                    act_axi_card_mem0_bvalid    ;
  wire                                    act_axi_card_mem0_bready    ;
  wire [ `AXI_CARD_MEM_ADDR_WIDTH-1 : 0 ]  act_axi_card_mem0_araddr    ;
  wire [ 7 : 0 ]                          act_axi_card_mem0_arlen     ;
  wire [ 2 : 0 ]                          act_axi_card_mem0_arsize    ;
  wire [ 1 : 0 ]                          act_axi_card_mem0_arburst   ;
  wire [ 1 : 0 ]                          act_axi_card_mem0_arlock    ;
  wire [ 3 : 0 ]                          act_axi_card_mem0_arcache   ;
  wire [ 2 : 0 ]                          act_axi_card_mem0_arprot    ;
  wire [ 3 : 0 ]                          act_axi_card_mem0_arregion  ;
  wire [ 3 : 0 ]                          act_axi_card_mem0_arqos     ;
  wire                                    act_axi_card_mem0_arvalid   ;
  wire                                    act_axi_card_mem0_arready   ;
  wire [ `AXI_CARD_MEM_DATA_WIDTH-1 : 0 ]  act_axi_card_mem0_rdata     ;
  wire [ 1 : 0 ]                          act_axi_card_mem0_rresp     ;
  wire                                    act_axi_card_mem0_rlast     ;
  wire                                    act_axi_card_mem0_rvalid    ;
  wire                                    act_axi_card_mem0_rready    ;
  wire [ `AXI_CARD_MEM_ID_WIDTH-1 : 0 ]    act_axi_card_mem0_arid      ;
  wire [ `AXI_CARD_MEM_ID_WIDTH-1 : 0 ]    act_axi_card_mem0_awid      ;
  wire [ `AXI_CARD_MEM_ID_WIDTH-1 : 0 ]    act_axi_card_mem0_bid       ;
  wire [ `AXI_CARD_MEM_ID_WIDTH-1 : 0 ]    act_axi_card_mem0_rid       ;

  `else
// ifdef ENABLE_HBM => HBM
  wire                                    hbm_ctrl_apb_complete ;

  `ifdef HBM_AXI_IF_P0
  wire [ `AXI_CARD_HBM_ADDR_WIDTH-1 : 0 ]  act_axi_card_hbm_p0_awaddr    ;
  wire [ 7 : 0 ]                          act_axi_card_hbm_p0_awlen     ;
  wire [ 2 : 0 ]                          act_axi_card_hbm_p0_awsize    ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p0_awburst   ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p0_awlock    ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p0_awcache   ;
  wire [ 2 : 0 ]                          act_axi_card_hbm_p0_awprot    ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p0_awregion  ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p0_awqos     ;
  wire                                    act_axi_card_hbm_p0_awvalid   ;
  wire                                    act_axi_card_hbm_p0_awready   ;
  wire [ `AXI_CARD_HBM_DATA_WIDTH-1 : 0 ]  act_axi_card_hbm_p0_wdata     ;
  wire [(`AXI_CARD_HBM_DATA_WIDTH/8)-1 : 0] act_axi_card_hbm_p0_wstrb     ;
  wire                                    act_axi_card_hbm_p0_wlast     ;
  wire                                    act_axi_card_hbm_p0_wvalid    ;
  wire                                    act_axi_card_hbm_p0_wready    ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p0_bresp     ;
  wire                                    act_axi_card_hbm_p0_bvalid    ;
  wire                                    act_axi_card_hbm_p0_bready    ;
  wire [ `AXI_CARD_HBM_ADDR_WIDTH-1 : 0 ]  act_axi_card_hbm_p0_araddr    ;
  wire [ 7 : 0 ]                          act_axi_card_hbm_p0_arlen     ;
  wire [ 2 : 0 ]                          act_axi_card_hbm_p0_arsize    ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p0_arburst   ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p0_arlock    ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p0_arcache   ;
  wire [ 2 : 0 ]                          act_axi_card_hbm_p0_arprot    ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p0_arregion  ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p0_arqos     ;
  wire                                    act_axi_card_hbm_p0_arvalid   ;
  wire                                    act_axi_card_hbm_p0_arready   ;
  wire [ `AXI_CARD_HBM_DATA_WIDTH-1 : 0 ]  act_axi_card_hbm_p0_rdata     ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p0_rresp     ;
  wire                                    act_axi_card_hbm_p0_rlast     ;
  wire                                    act_axi_card_hbm_p0_rvalid    ;
  wire                                    act_axi_card_hbm_p0_rready    ;
  wire [ `AXI_CARD_HBM_ID_WIDTH-1 : 0 ]    act_axi_card_hbm_p0_arid      ;
  wire [ `AXI_CARD_HBM_ID_WIDTH-1 : 0 ]    act_axi_card_hbm_p0_awid      ;
  wire [ `AXI_CARD_HBM_ID_WIDTH-1 : 0 ]    act_axi_card_hbm_p0_bid       ;
  wire [ `AXI_CARD_HBM_ID_WIDTH-1 : 0 ]    act_axi_card_hbm_p0_rid       ;
  `endif

  `ifdef HBM_AXI_IF_P1
  wire [ `AXI_CARD_HBM_ADDR_WIDTH-1 : 0 ]  act_axi_card_hbm_p1_awaddr    ;
  wire [ 7 : 0 ]                          act_axi_card_hbm_p1_awlen     ;
  wire [ 2 : 0 ]                          act_axi_card_hbm_p1_awsize    ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p1_awburst   ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p1_awlock    ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p1_awcache   ;
  wire [ 2 : 0 ]                          act_axi_card_hbm_p1_awprot    ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p1_awregion  ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p1_awqos     ;
  wire                                    act_axi_card_hbm_p1_awvalid   ;
  wire                                    act_axi_card_hbm_p1_awready   ;
  wire [ `AXI_CARD_HBM_DATA_WIDTH-1 : 0 ]  act_axi_card_hbm_p1_wdata     ;
  wire [(`AXI_CARD_HBM_DATA_WIDTH/8)-1 : 0] act_axi_card_hbm_p1_wstrb     ;
  wire                                    act_axi_card_hbm_p1_wlast     ;
  wire                                    act_axi_card_hbm_p1_wvalid    ;
  wire                                    act_axi_card_hbm_p1_wready    ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p1_bresp     ;
  wire                                    act_axi_card_hbm_p1_bvalid    ;
  wire                                    act_axi_card_hbm_p1_bready    ;
  wire [ `AXI_CARD_HBM_ADDR_WIDTH-1 : 0 ]  act_axi_card_hbm_p1_araddr    ;
  wire [ 7 : 0 ]                          act_axi_card_hbm_p1_arlen     ;
  wire [ 2 : 0 ]                          act_axi_card_hbm_p1_arsize    ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p1_arburst   ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p1_arlock    ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p1_arcache   ;
  wire [ 2 : 0 ]                          act_axi_card_hbm_p1_arprot    ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p1_arregion  ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p1_arqos     ;
  wire                                    act_axi_card_hbm_p1_arvalid   ;
  wire                                    act_axi_card_hbm_p1_arready   ;
  wire [ `AXI_CARD_HBM_DATA_WIDTH-1 : 0 ]  act_axi_card_hbm_p1_rdata     ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p1_rresp     ;
  wire                                    act_axi_card_hbm_p1_rlast     ;
  wire                                    act_axi_card_hbm_p1_rvalid    ;
  wire                                    act_axi_card_hbm_p1_rready    ;
  wire [ `AXI_CARD_HBM_ID_WIDTH-1 : 0 ]    act_axi_card_hbm_p1_arid      ;
  wire [ `AXI_CARD_HBM_ID_WIDTH-1 : 0 ]    act_axi_card_hbm_p1_awid      ;
  wire [ `AXI_CARD_HBM_ID_WIDTH-1 : 0 ]    act_axi_card_hbm_p1_bid       ;
  wire [ `AXI_CARD_HBM_ID_WIDTH-1 : 0 ]    act_axi_card_hbm_p1_rid       ;
  `endif

  `ifdef HBM_AXI_IF_P2
  wire [ `AXI_CARD_HBM_ADDR_WIDTH-1 : 0 ]  act_axi_card_hbm_p2_awaddr    ;
  wire [ 7 : 0 ]                          act_axi_card_hbm_p2_awlen     ;
  wire [ 2 : 0 ]                          act_axi_card_hbm_p2_awsize    ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p2_awburst   ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p2_awlock    ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p2_awcache   ;
  wire [ 2 : 0 ]                          act_axi_card_hbm_p2_awprot    ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p2_awregion  ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p2_awqos     ;
  wire                                    act_axi_card_hbm_p2_awvalid   ;
  wire                                    act_axi_card_hbm_p2_awready   ;
  wire [ `AXI_CARD_HBM_DATA_WIDTH-1 : 0 ]  act_axi_card_hbm_p2_wdata     ;
  wire [(`AXI_CARD_HBM_DATA_WIDTH/8)-1 : 0] act_axi_card_hbm_p2_wstrb     ;
  wire                                    act_axi_card_hbm_p2_wlast     ;
  wire                                    act_axi_card_hbm_p2_wvalid    ;
  wire                                    act_axi_card_hbm_p2_wready    ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p2_bresp     ;
  wire                                    act_axi_card_hbm_p2_bvalid    ;
  wire                                    act_axi_card_hbm_p2_bready    ;
  wire [ `AXI_CARD_HBM_ADDR_WIDTH-1 : 0 ]  act_axi_card_hbm_p2_araddr    ;
  wire [ 7 : 0 ]                          act_axi_card_hbm_p2_arlen     ;
  wire [ 2 : 0 ]                          act_axi_card_hbm_p2_arsize    ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p2_arburst   ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p2_arlock    ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p2_arcache   ;
  wire [ 2 : 0 ]                          act_axi_card_hbm_p2_arprot    ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p2_arregion  ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p2_arqos     ;
  wire                                    act_axi_card_hbm_p2_arvalid   ;
  wire                                    act_axi_card_hbm_p2_arready   ;
  wire [ `AXI_CARD_HBM_DATA_WIDTH-1 : 0 ]  act_axi_card_hbm_p2_rdata     ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p2_rresp     ;
  wire                                    act_axi_card_hbm_p2_rlast     ;
  wire                                    act_axi_card_hbm_p2_rvalid    ;
  wire                                    act_axi_card_hbm_p2_rready    ;
  wire [ `AXI_CARD_HBM_ID_WIDTH-1 : 0 ]    act_axi_card_hbm_p2_arid      ;
  wire [ `AXI_CARD_HBM_ID_WIDTH-1 : 0 ]    act_axi_card_hbm_p2_awid      ;
  wire [ `AXI_CARD_HBM_ID_WIDTH-1 : 0 ]    act_axi_card_hbm_p2_bid       ;
  wire [ `AXI_CARD_HBM_ID_WIDTH-1 : 0 ]    act_axi_card_hbm_p2_rid       ;
  `endif

  `ifdef HBM_AXI_IF_P3
  wire [ `AXI_CARD_HBM_ADDR_WIDTH-1 : 0 ]  act_axi_card_hbm_p3_awaddr    ;
  wire [ 7 : 0 ]                          act_axi_card_hbm_p3_awlen     ;
  wire [ 2 : 0 ]                          act_axi_card_hbm_p3_awsize    ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p3_awburst   ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p3_awlock    ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p3_awcache   ;
  wire [ 2 : 0 ]                          act_axi_card_hbm_p3_awprot    ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p3_awregion  ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p3_awqos     ;
  wire                                    act_axi_card_hbm_p3_awvalid   ;
  wire                                    act_axi_card_hbm_p3_awready   ;
  wire [ `AXI_CARD_HBM_DATA_WIDTH-1 : 0 ]  act_axi_card_hbm_p3_wdata     ;
  wire [(`AXI_CARD_HBM_DATA_WIDTH/8)-1 : 0] act_axi_card_hbm_p3_wstrb     ;
  wire                                    act_axi_card_hbm_p3_wlast     ;
  wire                                    act_axi_card_hbm_p3_wvalid    ;
  wire                                    act_axi_card_hbm_p3_wready    ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p3_bresp     ;
  wire                                    act_axi_card_hbm_p3_bvalid    ;
  wire                                    act_axi_card_hbm_p3_bready    ;
  wire [ `AXI_CARD_HBM_ADDR_WIDTH-1 : 0 ]  act_axi_card_hbm_p3_araddr    ;
  wire [ 7 : 0 ]                          act_axi_card_hbm_p3_arlen     ;
  wire [ 2 : 0 ]                          act_axi_card_hbm_p3_arsize    ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p3_arburst   ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p3_arlock    ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p3_arcache   ;
  wire [ 2 : 0 ]                          act_axi_card_hbm_p3_arprot    ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p3_arregion  ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p3_arqos     ;
  wire                                    act_axi_card_hbm_p3_arvalid   ;
  wire                                    act_axi_card_hbm_p3_arready   ;
  wire [ `AXI_CARD_HBM_DATA_WIDTH-1 : 0 ]  act_axi_card_hbm_p3_rdata     ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p3_rresp     ;
  wire                                    act_axi_card_hbm_p3_rlast     ;
  wire                                    act_axi_card_hbm_p3_rvalid    ;
  wire                                    act_axi_card_hbm_p3_rready    ;
  wire [ `AXI_CARD_HBM_ID_WIDTH-1 : 0 ]    act_axi_card_hbm_p3_arid      ;
  wire [ `AXI_CARD_HBM_ID_WIDTH-1 : 0 ]    act_axi_card_hbm_p3_awid      ;
  wire [ `AXI_CARD_HBM_ID_WIDTH-1 : 0 ]    act_axi_card_hbm_p3_bid       ;
  wire [ `AXI_CARD_HBM_ID_WIDTH-1 : 0 ]    act_axi_card_hbm_p3_rid       ;
  `endif

  `ifdef HBM_AXI_IF_P4
  wire [ `AXI_CARD_HBM_ADDR_WIDTH-1 : 0 ]  act_axi_card_hbm_p4_awaddr    ;
  wire [ 7 : 0 ]                          act_axi_card_hbm_p4_awlen     ;
  wire [ 2 : 0 ]                          act_axi_card_hbm_p4_awsize    ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p4_awburst   ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p4_awlock    ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p4_awcache   ;
  wire [ 2 : 0 ]                          act_axi_card_hbm_p4_awprot    ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p4_awregion  ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p4_awqos     ;
  wire                                    act_axi_card_hbm_p4_awvalid   ;
  wire                                    act_axi_card_hbm_p4_awready   ;
  wire [ `AXI_CARD_HBM_DATA_WIDTH-1 : 0 ]  act_axi_card_hbm_p4_wdata     ;
  wire [(`AXI_CARD_HBM_DATA_WIDTH/8)-1 : 0] act_axi_card_hbm_p4_wstrb     ;
  wire                                    act_axi_card_hbm_p4_wlast     ;
  wire                                    act_axi_card_hbm_p4_wvalid    ;
  wire                                    act_axi_card_hbm_p4_wready    ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p4_bresp     ;
  wire                                    act_axi_card_hbm_p4_bvalid    ;
  wire                                    act_axi_card_hbm_p4_bready    ;
  wire [ `AXI_CARD_HBM_ADDR_WIDTH-1 : 0 ]  act_axi_card_hbm_p4_araddr    ;
  wire [ 7 : 0 ]                          act_axi_card_hbm_p4_arlen     ;
  wire [ 2 : 0 ]                          act_axi_card_hbm_p4_arsize    ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p4_arburst   ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p4_arlock    ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p4_arcache   ;
  wire [ 2 : 0 ]                          act_axi_card_hbm_p4_arprot    ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p4_arregion  ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p4_arqos     ;
  wire                                    act_axi_card_hbm_p4_arvalid   ;
  wire                                    act_axi_card_hbm_p4_arready   ;
  wire [ `AXI_CARD_HBM_DATA_WIDTH-1 : 0 ]  act_axi_card_hbm_p4_rdata     ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p4_rresp     ;
  wire                                    act_axi_card_hbm_p4_rlast     ;
  wire                                    act_axi_card_hbm_p4_rvalid    ;
  wire                                    act_axi_card_hbm_p4_rready    ;
  wire [ `AXI_CARD_HBM_ID_WIDTH-1 : 0 ]    act_axi_card_hbm_p4_arid      ;
  wire [ `AXI_CARD_HBM_ID_WIDTH-1 : 0 ]    act_axi_card_hbm_p4_awid      ;
  wire [ `AXI_CARD_HBM_ID_WIDTH-1 : 0 ]    act_axi_card_hbm_p4_bid       ;
  wire [ `AXI_CARD_HBM_ID_WIDTH-1 : 0 ]    act_axi_card_hbm_p4_rid       ;
  `endif

  `ifdef HBM_AXI_IF_P5
  wire [ `AXI_CARD_HBM_ADDR_WIDTH-1 : 0 ]  act_axi_card_hbm_p5_awaddr    ;
  wire [ 7 : 0 ]                          act_axi_card_hbm_p5_awlen     ;
  wire [ 2 : 0 ]                          act_axi_card_hbm_p5_awsize    ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p5_awburst   ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p5_awlock    ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p5_awcache   ;
  wire [ 2 : 0 ]                          act_axi_card_hbm_p5_awprot    ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p5_awregion  ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p5_awqos     ;
  wire                                    act_axi_card_hbm_p5_awvalid   ;
  wire                                    act_axi_card_hbm_p5_awready   ;
  wire [ `AXI_CARD_HBM_DATA_WIDTH-1 : 0 ]  act_axi_card_hbm_p5_wdata     ;
  wire [(`AXI_CARD_HBM_DATA_WIDTH/8)-1 : 0] act_axi_card_hbm_p5_wstrb     ;
  wire                                    act_axi_card_hbm_p5_wlast     ;
  wire                                    act_axi_card_hbm_p5_wvalid    ;
  wire                                    act_axi_card_hbm_p5_wready    ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p5_bresp     ;
  wire                                    act_axi_card_hbm_p5_bvalid    ;
  wire                                    act_axi_card_hbm_p5_bready    ;
  wire [ `AXI_CARD_HBM_ADDR_WIDTH-1 : 0 ]  act_axi_card_hbm_p5_araddr    ;
  wire [ 7 : 0 ]                          act_axi_card_hbm_p5_arlen     ;
  wire [ 2 : 0 ]                          act_axi_card_hbm_p5_arsize    ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p5_arburst   ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p5_arlock    ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p5_arcache   ;
  wire [ 2 : 0 ]                          act_axi_card_hbm_p5_arprot    ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p5_arregion  ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p5_arqos     ;
  wire                                    act_axi_card_hbm_p5_arvalid   ;
  wire                                    act_axi_card_hbm_p5_arready   ;
  wire [ `AXI_CARD_HBM_DATA_WIDTH-1 : 0 ]  act_axi_card_hbm_p5_rdata     ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p5_rresp     ;
  wire                                    act_axi_card_hbm_p5_rlast     ;
  wire                                    act_axi_card_hbm_p5_rvalid    ;
  wire                                    act_axi_card_hbm_p5_rready    ;
  wire [ `AXI_CARD_HBM_ID_WIDTH-1 : 0 ]    act_axi_card_hbm_p5_arid      ;
  wire [ `AXI_CARD_HBM_ID_WIDTH-1 : 0 ]    act_axi_card_hbm_p5_awid      ;
  wire [ `AXI_CARD_HBM_ID_WIDTH-1 : 0 ]    act_axi_card_hbm_p5_bid       ;
  wire [ `AXI_CARD_HBM_ID_WIDTH-1 : 0 ]    act_axi_card_hbm_p5_rid       ;
  `endif

  `ifdef HBM_AXI_IF_P6
  wire [ `AXI_CARD_HBM_ADDR_WIDTH-1 : 0 ]  act_axi_card_hbm_p6_awaddr    ;
  wire [ 7 : 0 ]                          act_axi_card_hbm_p6_awlen     ;
  wire [ 2 : 0 ]                          act_axi_card_hbm_p6_awsize    ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p6_awburst   ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p6_awlock    ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p6_awcache   ;
  wire [ 2 : 0 ]                          act_axi_card_hbm_p6_awprot    ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p6_awregion  ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p6_awqos     ;
  wire                                    act_axi_card_hbm_p6_awvalid   ;
  wire                                    act_axi_card_hbm_p6_awready   ;
  wire [ `AXI_CARD_HBM_DATA_WIDTH-1 : 0 ]  act_axi_card_hbm_p6_wdata     ;
  wire [(`AXI_CARD_HBM_DATA_WIDTH/8)-1 : 0] act_axi_card_hbm_p6_wstrb     ;
  wire                                    act_axi_card_hbm_p6_wlast     ;
  wire                                    act_axi_card_hbm_p6_wvalid    ;
  wire                                    act_axi_card_hbm_p6_wready    ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p6_bresp     ;
  wire                                    act_axi_card_hbm_p6_bvalid    ;
  wire                                    act_axi_card_hbm_p6_bready    ;
  wire [ `AXI_CARD_HBM_ADDR_WIDTH-1 : 0 ]  act_axi_card_hbm_p6_araddr    ;
  wire [ 7 : 0 ]                          act_axi_card_hbm_p6_arlen     ;
  wire [ 2 : 0 ]                          act_axi_card_hbm_p6_arsize    ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p6_arburst   ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p6_arlock    ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p6_arcache   ;
  wire [ 2 : 0 ]                          act_axi_card_hbm_p6_arprot    ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p6_arregion  ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p6_arqos     ;
  wire                                    act_axi_card_hbm_p6_arvalid   ;
  wire                                    act_axi_card_hbm_p6_arready   ;
  wire [ `AXI_CARD_HBM_DATA_WIDTH-1 : 0 ]  act_axi_card_hbm_p6_rdata     ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p6_rresp     ;
  wire                                    act_axi_card_hbm_p6_rlast     ;
  wire                                    act_axi_card_hbm_p6_rvalid    ;
  wire                                    act_axi_card_hbm_p6_rready    ;
  wire [ `AXI_CARD_HBM_ID_WIDTH-1 : 0 ]    act_axi_card_hbm_p6_arid      ;
  wire [ `AXI_CARD_HBM_ID_WIDTH-1 : 0 ]    act_axi_card_hbm_p6_awid      ;
  wire [ `AXI_CARD_HBM_ID_WIDTH-1 : 0 ]    act_axi_card_hbm_p6_bid       ;
  wire [ `AXI_CARD_HBM_ID_WIDTH-1 : 0 ]    act_axi_card_hbm_p6_rid       ;
  `endif

  `ifdef HBM_AXI_IF_P7
  wire [ `AXI_CARD_HBM_ADDR_WIDTH-1 : 0 ]  act_axi_card_hbm_p7_awaddr    ;
  wire [ 7 : 0 ]                          act_axi_card_hbm_p7_awlen     ;
  wire [ 2 : 0 ]                          act_axi_card_hbm_p7_awsize    ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p7_awburst   ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p7_awlock    ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p7_awcache   ;
  wire [ 2 : 0 ]                          act_axi_card_hbm_p7_awprot    ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p7_awregion  ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p7_awqos     ;
  wire                                    act_axi_card_hbm_p7_awvalid   ;
  wire                                    act_axi_card_hbm_p7_awready   ;
  wire [ `AXI_CARD_HBM_DATA_WIDTH-1 : 0 ]  act_axi_card_hbm_p7_wdata     ;
  wire [(`AXI_CARD_HBM_DATA_WIDTH/8)-1 : 0] act_axi_card_hbm_p7_wstrb     ;
  wire                                    act_axi_card_hbm_p7_wlast     ;
  wire                                    act_axi_card_hbm_p7_wvalid    ;
  wire                                    act_axi_card_hbm_p7_wready    ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p7_bresp     ;
  wire                                    act_axi_card_hbm_p7_bvalid    ;
  wire                                    act_axi_card_hbm_p7_bready    ;
  wire [ `AXI_CARD_HBM_ADDR_WIDTH-1 : 0 ]  act_axi_card_hbm_p7_araddr    ;
  wire [ 7 : 0 ]                          act_axi_card_hbm_p7_arlen     ;
  wire [ 2 : 0 ]                          act_axi_card_hbm_p7_arsize    ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p7_arburst   ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p7_arlock    ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p7_arcache   ;
  wire [ 2 : 0 ]                          act_axi_card_hbm_p7_arprot    ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p7_arregion  ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p7_arqos     ;
  wire                                    act_axi_card_hbm_p7_arvalid   ;
  wire                                    act_axi_card_hbm_p7_arready   ;
  wire [ `AXI_CARD_HBM_DATA_WIDTH-1 : 0 ]  act_axi_card_hbm_p7_rdata     ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p7_rresp     ;
  wire                                    act_axi_card_hbm_p7_rlast     ;
  wire                                    act_axi_card_hbm_p7_rvalid    ;
  wire                                    act_axi_card_hbm_p7_rready    ;
  wire [ `AXI_CARD_HBM_ID_WIDTH-1 : 0 ]    act_axi_card_hbm_p7_arid      ;
  wire [ `AXI_CARD_HBM_ID_WIDTH-1 : 0 ]    act_axi_card_hbm_p7_awid      ;
  wire [ `AXI_CARD_HBM_ID_WIDTH-1 : 0 ]    act_axi_card_hbm_p7_bid       ;
  wire [ `AXI_CARD_HBM_ID_WIDTH-1 : 0 ]    act_axi_card_hbm_p7_rid       ;
  `endif

  `ifdef HBM_AXI_IF_P8
  wire [ `AXI_CARD_HBM_ADDR_WIDTH-1 : 0 ]  act_axi_card_hbm_p8_awaddr    ;
  wire [ 7 : 0 ]                          act_axi_card_hbm_p8_awlen     ;
  wire [ 2 : 0 ]                          act_axi_card_hbm_p8_awsize    ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p8_awburst   ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p8_awlock    ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p8_awcache   ;
  wire [ 2 : 0 ]                          act_axi_card_hbm_p8_awprot    ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p8_awregion  ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p8_awqos     ;
  wire                                    act_axi_card_hbm_p8_awvalid   ;
  wire                                    act_axi_card_hbm_p8_awready   ;
  wire [ `AXI_CARD_HBM_DATA_WIDTH-1 : 0 ]  act_axi_card_hbm_p8_wdata     ;
  wire [(`AXI_CARD_HBM_DATA_WIDTH/8)-1 : 0] act_axi_card_hbm_p8_wstrb     ;
  wire                                    act_axi_card_hbm_p8_wlast     ;
  wire                                    act_axi_card_hbm_p8_wvalid    ;
  wire                                    act_axi_card_hbm_p8_wready    ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p8_bresp     ;
  wire                                    act_axi_card_hbm_p8_bvalid    ;
  wire                                    act_axi_card_hbm_p8_bready    ;
  wire [ `AXI_CARD_HBM_ADDR_WIDTH-1 : 0 ]  act_axi_card_hbm_p8_araddr    ;
  wire [ 7 : 0 ]                          act_axi_card_hbm_p8_arlen     ;
  wire [ 2 : 0 ]                          act_axi_card_hbm_p8_arsize    ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p8_arburst   ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p8_arlock    ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p8_arcache   ;
  wire [ 2 : 0 ]                          act_axi_card_hbm_p8_arprot    ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p8_arregion  ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p8_arqos     ;
  wire                                    act_axi_card_hbm_p8_arvalid   ;
  wire                                    act_axi_card_hbm_p8_arready   ;
  wire [ `AXI_CARD_HBM_DATA_WIDTH-1 : 0 ]  act_axi_card_hbm_p8_rdata     ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p8_rresp     ;
  wire                                    act_axi_card_hbm_p8_rlast     ;
  wire                                    act_axi_card_hbm_p8_rvalid    ;
  wire                                    act_axi_card_hbm_p8_rready    ;
  wire [ `AXI_CARD_HBM_ID_WIDTH-1 : 0 ]    act_axi_card_hbm_p8_arid      ;
  wire [ `AXI_CARD_HBM_ID_WIDTH-1 : 0 ]    act_axi_card_hbm_p8_awid      ;
  wire [ `AXI_CARD_HBM_ID_WIDTH-1 : 0 ]    act_axi_card_hbm_p8_bid       ;
  wire [ `AXI_CARD_HBM_ID_WIDTH-1 : 0 ]    act_axi_card_hbm_p8_rid       ;
  `endif

  `ifdef HBM_AXI_IF_P9
  wire [ `AXI_CARD_HBM_ADDR_WIDTH-1 : 0 ]  act_axi_card_hbm_p9_awaddr    ;
  wire [ 7 : 0 ]                          act_axi_card_hbm_p9_awlen     ;
  wire [ 2 : 0 ]                          act_axi_card_hbm_p9_awsize    ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p9_awburst   ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p9_awlock    ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p9_awcache   ;
  wire [ 2 : 0 ]                          act_axi_card_hbm_p9_awprot    ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p9_awregion  ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p9_awqos     ;
  wire                                    act_axi_card_hbm_p9_awvalid   ;
  wire                                    act_axi_card_hbm_p9_awready   ;
  wire [ `AXI_CARD_HBM_DATA_WIDTH-1 : 0 ]  act_axi_card_hbm_p9_wdata     ;
  wire [(`AXI_CARD_HBM_DATA_WIDTH/8)-1 : 0] act_axi_card_hbm_p9_wstrb     ;
  wire                                    act_axi_card_hbm_p9_wlast     ;
  wire                                    act_axi_card_hbm_p9_wvalid    ;
  wire                                    act_axi_card_hbm_p9_wready    ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p9_bresp     ;
  wire                                    act_axi_card_hbm_p9_bvalid    ;
  wire                                    act_axi_card_hbm_p9_bready    ;
  wire [ `AXI_CARD_HBM_ADDR_WIDTH-1 : 0 ]  act_axi_card_hbm_p9_araddr    ;
  wire [ 7 : 0 ]                          act_axi_card_hbm_p9_arlen     ;
  wire [ 2 : 0 ]                          act_axi_card_hbm_p9_arsize    ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p9_arburst   ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p9_arlock    ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p9_arcache   ;
  wire [ 2 : 0 ]                          act_axi_card_hbm_p9_arprot    ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p9_arregion  ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p9_arqos     ;
  wire                                    act_axi_card_hbm_p9_arvalid   ;
  wire                                    act_axi_card_hbm_p9_arready   ;
  wire [ `AXI_CARD_HBM_DATA_WIDTH-1 : 0 ]  act_axi_card_hbm_p9_rdata     ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p9_rresp     ;
  wire                                    act_axi_card_hbm_p9_rlast     ;
  wire                                    act_axi_card_hbm_p9_rvalid    ;
  wire                                    act_axi_card_hbm_p9_rready    ;
  wire [ `AXI_CARD_HBM_ID_WIDTH-1 : 0 ]    act_axi_card_hbm_p9_arid      ;
  wire [ `AXI_CARD_HBM_ID_WIDTH-1 : 0 ]    act_axi_card_hbm_p9_awid      ;
  wire [ `AXI_CARD_HBM_ID_WIDTH-1 : 0 ]    act_axi_card_hbm_p9_bid       ;
  wire [ `AXI_CARD_HBM_ID_WIDTH-1 : 0 ]    act_axi_card_hbm_p9_rid       ;
  `endif

  `ifdef HBM_AXI_IF_P10
  wire [ `AXI_CARD_HBM_ADDR_WIDTH-1 : 0 ]  act_axi_card_hbm_p10_awaddr    ;
  wire [ 7 : 0 ]                          act_axi_card_hbm_p10_awlen     ;
  wire [ 2 : 0 ]                          act_axi_card_hbm_p10_awsize    ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p10_awburst   ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p10_awlock    ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p10_awcache   ;
  wire [ 2 : 0 ]                          act_axi_card_hbm_p10_awprot    ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p10_awregion  ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p10_awqos     ;
  wire                                    act_axi_card_hbm_p10_awvalid   ;
  wire                                    act_axi_card_hbm_p10_awready   ;
  wire [ `AXI_CARD_HBM_DATA_WIDTH-1 : 0 ]  act_axi_card_hbm_p10_wdata     ;
  wire [(`AXI_CARD_HBM_DATA_WIDTH/8)-1 : 0] act_axi_card_hbm_p10_wstrb     ;
  wire                                    act_axi_card_hbm_p10_wlast     ;
  wire                                    act_axi_card_hbm_p10_wvalid    ;
  wire                                    act_axi_card_hbm_p10_wready    ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p10_bresp     ;
  wire                                    act_axi_card_hbm_p10_bvalid    ;
  wire                                    act_axi_card_hbm_p10_bready    ;
  wire [ `AXI_CARD_HBM_ADDR_WIDTH-1 : 0 ]  act_axi_card_hbm_p10_araddr    ;
  wire [ 7 : 0 ]                          act_axi_card_hbm_p10_arlen     ;
  wire [ 2 : 0 ]                          act_axi_card_hbm_p10_arsize    ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p10_arburst   ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p10_arlock    ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p10_arcache   ;
  wire [ 2 : 0 ]                          act_axi_card_hbm_p10_arprot    ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p10_arregion  ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p10_arqos     ;
  wire                                    act_axi_card_hbm_p10_arvalid   ;
  wire                                    act_axi_card_hbm_p10_arready   ;
  wire [ `AXI_CARD_HBM_DATA_WIDTH-1 : 0 ]  act_axi_card_hbm_p10_rdata     ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p10_rresp     ;
  wire                                    act_axi_card_hbm_p10_rlast     ;
  wire                                    act_axi_card_hbm_p10_rvalid    ;
  wire                                    act_axi_card_hbm_p10_rready    ;
  wire [ `AXI_CARD_HBM_ID_WIDTH-1 : 0 ]    act_axi_card_hbm_p10_arid      ;
  wire [ `AXI_CARD_HBM_ID_WIDTH-1 : 0 ]    act_axi_card_hbm_p10_awid      ;
  wire [ `AXI_CARD_HBM_ID_WIDTH-1 : 0 ]    act_axi_card_hbm_p10_bid       ;
  wire [ `AXI_CARD_HBM_ID_WIDTH-1 : 0 ]    act_axi_card_hbm_p10_rid       ;
  `endif

  `ifdef HBM_AXI_IF_P11
  wire [ `AXI_CARD_HBM_ADDR_WIDTH-1 : 0 ]  act_axi_card_hbm_p11_awaddr    ;
  wire [ 7 : 0 ]                          act_axi_card_hbm_p11_awlen     ;
  wire [ 2 : 0 ]                          act_axi_card_hbm_p11_awsize    ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p11_awburst   ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p11_awlock    ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p11_awcache   ;
  wire [ 2 : 0 ]                          act_axi_card_hbm_p11_awprot    ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p11_awregion  ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p11_awqos     ;
  wire                                    act_axi_card_hbm_p11_awvalid   ;
  wire                                    act_axi_card_hbm_p11_awready   ;
  wire [ `AXI_CARD_HBM_DATA_WIDTH-1 : 0 ]  act_axi_card_hbm_p11_wdata     ;
  wire [(`AXI_CARD_HBM_DATA_WIDTH/8)-1 : 0] act_axi_card_hbm_p11_wstrb     ;
  wire                                    act_axi_card_hbm_p11_wlast     ;
  wire                                    act_axi_card_hbm_p11_wvalid    ;
  wire                                    act_axi_card_hbm_p11_wready    ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p11_bresp     ;
  wire                                    act_axi_card_hbm_p11_bvalid    ;
  wire                                    act_axi_card_hbm_p11_bready    ;
  wire [ `AXI_CARD_HBM_ADDR_WIDTH-1 : 0 ]  act_axi_card_hbm_p11_araddr    ;
  wire [ 7 : 0 ]                          act_axi_card_hbm_p11_arlen     ;
  wire [ 2 : 0 ]                          act_axi_card_hbm_p11_arsize    ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p11_arburst   ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p11_arlock    ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p11_arcache   ;
  wire [ 2 : 0 ]                          act_axi_card_hbm_p11_arprot    ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p11_arregion  ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p11_arqos     ;
  wire                                    act_axi_card_hbm_p11_arvalid   ;
  wire                                    act_axi_card_hbm_p11_arready   ;
  wire [ `AXI_CARD_HBM_DATA_WIDTH-1 : 0 ]  act_axi_card_hbm_p11_rdata     ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p11_rresp     ;
  wire                                    act_axi_card_hbm_p11_rlast     ;
  wire                                    act_axi_card_hbm_p11_rvalid    ;
  wire                                    act_axi_card_hbm_p11_rready    ;
  wire [ `AXI_CARD_HBM_ID_WIDTH-1 : 0 ]    act_axi_card_hbm_p11_arid      ;
  wire [ `AXI_CARD_HBM_ID_WIDTH-1 : 0 ]    act_axi_card_hbm_p11_awid      ;
  wire [ `AXI_CARD_HBM_ID_WIDTH-1 : 0 ]    act_axi_card_hbm_p11_bid       ;
  wire [ `AXI_CARD_HBM_ID_WIDTH-1 : 0 ]    act_axi_card_hbm_p11_rid       ;
  `endif

  `ifdef HBM_AXI_IF_P12
  wire [ `AXI_CARD_HBM_ADDR_WIDTH-1 : 0 ]  act_axi_card_hbm_p12_awaddr    ;
  wire [ 7 : 0 ]                          act_axi_card_hbm_p12_awlen     ;
  wire [ 2 : 0 ]                          act_axi_card_hbm_p12_awsize    ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p12_awburst   ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p12_awlock    ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p12_awcache   ;
  wire [ 2 : 0 ]                          act_axi_card_hbm_p12_awprot    ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p12_awregion  ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p12_awqos     ;
  wire                                    act_axi_card_hbm_p12_awvalid   ;
  wire                                    act_axi_card_hbm_p12_awready   ;
  wire [ `AXI_CARD_HBM_DATA_WIDTH-1 : 0 ]  act_axi_card_hbm_p12_wdata     ;
  wire [(`AXI_CARD_HBM_DATA_WIDTH/8)-1 : 0] act_axi_card_hbm_p12_wstrb     ;
  wire                                    act_axi_card_hbm_p12_wlast     ;
  wire                                    act_axi_card_hbm_p12_wvalid    ;
  wire                                    act_axi_card_hbm_p12_wready    ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p12_bresp     ;
  wire                                    act_axi_card_hbm_p12_bvalid    ;
  wire                                    act_axi_card_hbm_p12_bready    ;
  wire [ `AXI_CARD_HBM_ADDR_WIDTH-1 : 0 ]  act_axi_card_hbm_p12_araddr    ;
  wire [ 7 : 0 ]                          act_axi_card_hbm_p12_arlen     ;
  wire [ 2 : 0 ]                          act_axi_card_hbm_p12_arsize    ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p12_arburst   ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p12_arlock    ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p12_arcache   ;
  wire [ 2 : 0 ]                          act_axi_card_hbm_p12_arprot    ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p12_arregion  ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p12_arqos     ;
  wire                                    act_axi_card_hbm_p12_arvalid   ;
  wire                                    act_axi_card_hbm_p12_arready   ;
  wire [ `AXI_CARD_HBM_DATA_WIDTH-1 : 0 ]  act_axi_card_hbm_p12_rdata     ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p12_rresp     ;
  wire                                    act_axi_card_hbm_p12_rlast     ;
  wire                                    act_axi_card_hbm_p12_rvalid    ;
  wire                                    act_axi_card_hbm_p12_rready    ;
  wire [ `AXI_CARD_HBM_ID_WIDTH-1 : 0 ]    act_axi_card_hbm_p12_arid      ;
  wire [ `AXI_CARD_HBM_ID_WIDTH-1 : 0 ]    act_axi_card_hbm_p12_awid      ;
  wire [ `AXI_CARD_HBM_ID_WIDTH-1 : 0 ]    act_axi_card_hbm_p12_bid       ;
  wire [ `AXI_CARD_HBM_ID_WIDTH-1 : 0 ]    act_axi_card_hbm_p12_rid       ;
  `endif

  `ifdef HBM_AXI_IF_P13
  wire [ `AXI_CARD_HBM_ADDR_WIDTH-1 : 0 ]  act_axi_card_hbm_p13_awaddr    ;
  wire [ 7 : 0 ]                          act_axi_card_hbm_p13_awlen     ;
  wire [ 2 : 0 ]                          act_axi_card_hbm_p13_awsize    ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p13_awburst   ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p13_awlock    ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p13_awcache   ;
  wire [ 2 : 0 ]                          act_axi_card_hbm_p13_awprot    ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p13_awregion  ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p13_awqos     ;
  wire                                    act_axi_card_hbm_p13_awvalid   ;
  wire                                    act_axi_card_hbm_p13_awready   ;
  wire [ `AXI_CARD_HBM_DATA_WIDTH-1 : 0 ]  act_axi_card_hbm_p13_wdata     ;
  wire [(`AXI_CARD_HBM_DATA_WIDTH/8)-1 : 0] act_axi_card_hbm_p13_wstrb     ;
  wire                                    act_axi_card_hbm_p13_wlast     ;
  wire                                    act_axi_card_hbm_p13_wvalid    ;
  wire                                    act_axi_card_hbm_p13_wready    ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p13_bresp     ;
  wire                                    act_axi_card_hbm_p13_bvalid    ;
  wire                                    act_axi_card_hbm_p13_bready    ;
  wire [ `AXI_CARD_HBM_ADDR_WIDTH-1 : 0 ]  act_axi_card_hbm_p13_araddr    ;
  wire [ 7 : 0 ]                          act_axi_card_hbm_p13_arlen     ;
  wire [ 2 : 0 ]                          act_axi_card_hbm_p13_arsize    ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p13_arburst   ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p13_arlock    ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p13_arcache   ;
  wire [ 2 : 0 ]                          act_axi_card_hbm_p13_arprot    ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p13_arregion  ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p13_arqos     ;
  wire                                    act_axi_card_hbm_p13_arvalid   ;
  wire                                    act_axi_card_hbm_p13_arready   ;
  wire [ `AXI_CARD_HBM_DATA_WIDTH-1 : 0 ]  act_axi_card_hbm_p13_rdata     ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p13_rresp     ;
  wire                                    act_axi_card_hbm_p13_rlast     ;
  wire                                    act_axi_card_hbm_p13_rvalid    ;
  wire                                    act_axi_card_hbm_p13_rready    ;
  wire [ `AXI_CARD_HBM_ID_WIDTH-1 : 0 ]    act_axi_card_hbm_p13_arid      ;
  wire [ `AXI_CARD_HBM_ID_WIDTH-1 : 0 ]    act_axi_card_hbm_p13_awid      ;
  wire [ `AXI_CARD_HBM_ID_WIDTH-1 : 0 ]    act_axi_card_hbm_p13_bid       ;
  wire [ `AXI_CARD_HBM_ID_WIDTH-1 : 0 ]    act_axi_card_hbm_p13_rid       ;
  `endif

  `ifdef HBM_AXI_IF_P14
  wire [ `AXI_CARD_HBM_ADDR_WIDTH-1 : 0 ]  act_axi_card_hbm_p14_awaddr    ;
  wire [ 7 : 0 ]                          act_axi_card_hbm_p14_awlen     ;
  wire [ 2 : 0 ]                          act_axi_card_hbm_p14_awsize    ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p14_awburst   ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p14_awlock    ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p14_awcache   ;
  wire [ 2 : 0 ]                          act_axi_card_hbm_p14_awprot    ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p14_awregion  ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p14_awqos     ;
  wire                                    act_axi_card_hbm_p14_awvalid   ;
  wire                                    act_axi_card_hbm_p14_awready   ;
  wire [ `AXI_CARD_HBM_DATA_WIDTH-1 : 0 ]  act_axi_card_hbm_p14_wdata     ;
  wire [(`AXI_CARD_HBM_DATA_WIDTH/8)-1 : 0] act_axi_card_hbm_p14_wstrb     ;
  wire                                    act_axi_card_hbm_p14_wlast     ;
  wire                                    act_axi_card_hbm_p14_wvalid    ;
  wire                                    act_axi_card_hbm_p14_wready    ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p14_bresp     ;
  wire                                    act_axi_card_hbm_p14_bvalid    ;
  wire                                    act_axi_card_hbm_p14_bready    ;
  wire [ `AXI_CARD_HBM_ADDR_WIDTH-1 : 0 ]  act_axi_card_hbm_p14_araddr    ;
  wire [ 7 : 0 ]                          act_axi_card_hbm_p14_arlen     ;
  wire [ 2 : 0 ]                          act_axi_card_hbm_p14_arsize    ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p14_arburst   ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p14_arlock    ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p14_arcache   ;
  wire [ 2 : 0 ]                          act_axi_card_hbm_p14_arprot    ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p14_arregion  ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p14_arqos     ;
  wire                                    act_axi_card_hbm_p14_arvalid   ;
  wire                                    act_axi_card_hbm_p14_arready   ;
  wire [ `AXI_CARD_HBM_DATA_WIDTH-1 : 0 ]  act_axi_card_hbm_p14_rdata     ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p14_rresp     ;
  wire                                    act_axi_card_hbm_p14_rlast     ;
  wire                                    act_axi_card_hbm_p14_rvalid    ;
  wire                                    act_axi_card_hbm_p14_rready    ;
  wire [ `AXI_CARD_HBM_ID_WIDTH-1 : 0 ]    act_axi_card_hbm_p14_arid      ;
  wire [ `AXI_CARD_HBM_ID_WIDTH-1 : 0 ]    act_axi_card_hbm_p14_awid      ;
  wire [ `AXI_CARD_HBM_ID_WIDTH-1 : 0 ]    act_axi_card_hbm_p14_bid       ;
  wire [ `AXI_CARD_HBM_ID_WIDTH-1 : 0 ]    act_axi_card_hbm_p14_rid       ;
  `endif

  `ifdef HBM_AXI_IF_P15
  wire [ `AXI_CARD_HBM_ADDR_WIDTH-1 : 0 ]  act_axi_card_hbm_p15_awaddr    ;
  wire [ 7 : 0 ]                          act_axi_card_hbm_p15_awlen     ;
  wire [ 2 : 0 ]                          act_axi_card_hbm_p15_awsize    ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p15_awburst   ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p15_awlock    ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p15_awcache   ;
  wire [ 2 : 0 ]                          act_axi_card_hbm_p15_awprot    ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p15_awregion  ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p15_awqos     ;
  wire                                    act_axi_card_hbm_p15_awvalid   ;
  wire                                    act_axi_card_hbm_p15_awready   ;
  wire [ `AXI_CARD_HBM_DATA_WIDTH-1 : 0 ]  act_axi_card_hbm_p15_wdata     ;
  wire [(`AXI_CARD_HBM_DATA_WIDTH/8)-1 : 0] act_axi_card_hbm_p15_wstrb     ;
  wire                                    act_axi_card_hbm_p15_wlast     ;
  wire                                    act_axi_card_hbm_p15_wvalid    ;
  wire                                    act_axi_card_hbm_p15_wready    ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p15_bresp     ;
  wire                                    act_axi_card_hbm_p15_bvalid    ;
  wire                                    act_axi_card_hbm_p15_bready    ;
  wire [ `AXI_CARD_HBM_ADDR_WIDTH-1 : 0 ]  act_axi_card_hbm_p15_araddr    ;
  wire [ 7 : 0 ]                          act_axi_card_hbm_p15_arlen     ;
  wire [ 2 : 0 ]                          act_axi_card_hbm_p15_arsize    ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p15_arburst   ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p15_arlock    ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p15_arcache   ;
  wire [ 2 : 0 ]                          act_axi_card_hbm_p15_arprot    ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p15_arregion  ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p15_arqos     ;
  wire                                    act_axi_card_hbm_p15_arvalid   ;
  wire                                    act_axi_card_hbm_p15_arready   ;
  wire [ `AXI_CARD_HBM_DATA_WIDTH-1 : 0 ]  act_axi_card_hbm_p15_rdata     ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p15_rresp     ;
  wire                                    act_axi_card_hbm_p15_rlast     ;
  wire                                    act_axi_card_hbm_p15_rvalid    ;
  wire                                    act_axi_card_hbm_p15_rready    ;
  wire [ `AXI_CARD_HBM_ID_WIDTH-1 : 0 ]    act_axi_card_hbm_p15_arid      ;
  wire [ `AXI_CARD_HBM_ID_WIDTH-1 : 0 ]    act_axi_card_hbm_p15_awid      ;
  wire [ `AXI_CARD_HBM_ID_WIDTH-1 : 0 ]    act_axi_card_hbm_p15_bid       ;
  wire [ `AXI_CARD_HBM_ID_WIDTH-1 : 0 ]    act_axi_card_hbm_p15_rid       ;
  `endif

  `ifdef HBM_AXI_IF_P16
  wire [ `AXI_CARD_HBM_ADDR_WIDTH-1 : 0 ]  act_axi_card_hbm_p16_awaddr    ;
  wire [ 7 : 0 ]                          act_axi_card_hbm_p16_awlen     ;
  wire [ 2 : 0 ]                          act_axi_card_hbm_p16_awsize    ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p16_awburst   ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p16_awlock    ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p16_awcache   ;
  wire [ 2 : 0 ]                          act_axi_card_hbm_p16_awprot    ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p16_awregion  ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p16_awqos     ;
  wire                                    act_axi_card_hbm_p16_awvalid   ;
  wire                                    act_axi_card_hbm_p16_awready   ;
  wire [ `AXI_CARD_HBM_DATA_WIDTH-1 : 0 ]  act_axi_card_hbm_p16_wdata     ;
  wire [(`AXI_CARD_HBM_DATA_WIDTH/8)-1 : 0] act_axi_card_hbm_p16_wstrb     ;
  wire                                    act_axi_card_hbm_p16_wlast     ;
  wire                                    act_axi_card_hbm_p16_wvalid    ;
  wire                                    act_axi_card_hbm_p16_wready    ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p16_bresp     ;
  wire                                    act_axi_card_hbm_p16_bvalid    ;
  wire                                    act_axi_card_hbm_p16_bready    ;
  wire [ `AXI_CARD_HBM_ADDR_WIDTH-1 : 0 ]  act_axi_card_hbm_p16_araddr    ;
  wire [ 7 : 0 ]                          act_axi_card_hbm_p16_arlen     ;
  wire [ 2 : 0 ]                          act_axi_card_hbm_p16_arsize    ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p16_arburst   ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p16_arlock    ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p16_arcache   ;
  wire [ 2 : 0 ]                          act_axi_card_hbm_p16_arprot    ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p16_arregion  ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p16_arqos     ;
  wire                                    act_axi_card_hbm_p16_arvalid   ;
  wire                                    act_axi_card_hbm_p16_arready   ;
  wire [ `AXI_CARD_HBM_DATA_WIDTH-1 : 0 ]  act_axi_card_hbm_p16_rdata     ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p16_rresp     ;
  wire                                    act_axi_card_hbm_p16_rlast     ;
  wire                                    act_axi_card_hbm_p16_rvalid    ;
  wire                                    act_axi_card_hbm_p16_rready    ;
  wire [ `AXI_CARD_HBM_ID_WIDTH-1 : 0 ]    act_axi_card_hbm_p16_arid      ;
  wire [ `AXI_CARD_HBM_ID_WIDTH-1 : 0 ]    act_axi_card_hbm_p16_awid      ;
  wire [ `AXI_CARD_HBM_ID_WIDTH-1 : 0 ]    act_axi_card_hbm_p16_bid       ;
  wire [ `AXI_CARD_HBM_ID_WIDTH-1 : 0 ]    act_axi_card_hbm_p16_rid       ;
  `endif

  `ifdef HBM_AXI_IF_P17
  wire [ `AXI_CARD_HBM_ADDR_WIDTH-1 : 0 ]  act_axi_card_hbm_p17_awaddr    ;
  wire [ 7 : 0 ]                          act_axi_card_hbm_p17_awlen     ;
  wire [ 2 : 0 ]                          act_axi_card_hbm_p17_awsize    ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p17_awburst   ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p17_awlock    ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p17_awcache   ;
  wire [ 2 : 0 ]                          act_axi_card_hbm_p17_awprot    ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p17_awregion  ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p17_awqos     ;
  wire                                    act_axi_card_hbm_p17_awvalid   ;
  wire                                    act_axi_card_hbm_p17_awready   ;
  wire [ `AXI_CARD_HBM_DATA_WIDTH-1 : 0 ]  act_axi_card_hbm_p17_wdata     ;
  wire [(`AXI_CARD_HBM_DATA_WIDTH/8)-1 : 0] act_axi_card_hbm_p17_wstrb     ;
  wire                                    act_axi_card_hbm_p17_wlast     ;
  wire                                    act_axi_card_hbm_p17_wvalid    ;
  wire                                    act_axi_card_hbm_p17_wready    ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p17_bresp     ;
  wire                                    act_axi_card_hbm_p17_bvalid    ;
  wire                                    act_axi_card_hbm_p17_bready    ;
  wire [ `AXI_CARD_HBM_ADDR_WIDTH-1 : 0 ]  act_axi_card_hbm_p17_araddr    ;
  wire [ 7 : 0 ]                          act_axi_card_hbm_p17_arlen     ;
  wire [ 2 : 0 ]                          act_axi_card_hbm_p17_arsize    ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p17_arburst   ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p17_arlock    ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p17_arcache   ;
  wire [ 2 : 0 ]                          act_axi_card_hbm_p17_arprot    ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p17_arregion  ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p17_arqos     ;
  wire                                    act_axi_card_hbm_p17_arvalid   ;
  wire                                    act_axi_card_hbm_p17_arready   ;
  wire [ `AXI_CARD_HBM_DATA_WIDTH-1 : 0 ]  act_axi_card_hbm_p17_rdata     ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p17_rresp     ;
  wire                                    act_axi_card_hbm_p17_rlast     ;
  wire                                    act_axi_card_hbm_p17_rvalid    ;
  wire                                    act_axi_card_hbm_p17_rready    ;
  wire [ `AXI_CARD_HBM_ID_WIDTH-1 : 0 ]    act_axi_card_hbm_p17_arid      ;
  wire [ `AXI_CARD_HBM_ID_WIDTH-1 : 0 ]    act_axi_card_hbm_p17_awid      ;
  wire [ `AXI_CARD_HBM_ID_WIDTH-1 : 0 ]    act_axi_card_hbm_p17_bid       ;
  wire [ `AXI_CARD_HBM_ID_WIDTH-1 : 0 ]    act_axi_card_hbm_p17_rid       ;
  `endif

  `ifdef HBM_AXI_IF_P18
  wire [ `AXI_CARD_HBM_ADDR_WIDTH-1 : 0 ]  act_axi_card_hbm_p18_awaddr    ;
  wire [ 7 : 0 ]                          act_axi_card_hbm_p18_awlen     ;
  wire [ 2 : 0 ]                          act_axi_card_hbm_p18_awsize    ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p18_awburst   ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p18_awlock    ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p18_awcache   ;
  wire [ 2 : 0 ]                          act_axi_card_hbm_p18_awprot    ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p18_awregion  ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p18_awqos     ;
  wire                                    act_axi_card_hbm_p18_awvalid   ;
  wire                                    act_axi_card_hbm_p18_awready   ;
  wire [ `AXI_CARD_HBM_DATA_WIDTH-1 : 0 ]  act_axi_card_hbm_p18_wdata     ;
  wire [(`AXI_CARD_HBM_DATA_WIDTH/8)-1 : 0] act_axi_card_hbm_p18_wstrb     ;
  wire                                    act_axi_card_hbm_p18_wlast     ;
  wire                                    act_axi_card_hbm_p18_wvalid    ;
  wire                                    act_axi_card_hbm_p18_wready    ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p18_bresp     ;
  wire                                    act_axi_card_hbm_p18_bvalid    ;
  wire                                    act_axi_card_hbm_p18_bready    ;
  wire [ `AXI_CARD_HBM_ADDR_WIDTH-1 : 0 ]  act_axi_card_hbm_p18_araddr    ;
  wire [ 7 : 0 ]                          act_axi_card_hbm_p18_arlen     ;
  wire [ 2 : 0 ]                          act_axi_card_hbm_p18_arsize    ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p18_arburst   ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p18_arlock    ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p18_arcache   ;
  wire [ 2 : 0 ]                          act_axi_card_hbm_p18_arprot    ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p18_arregion  ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p18_arqos     ;
  wire                                    act_axi_card_hbm_p18_arvalid   ;
  wire                                    act_axi_card_hbm_p18_arready   ;
  wire [ `AXI_CARD_HBM_DATA_WIDTH-1 : 0 ]  act_axi_card_hbm_p18_rdata     ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p18_rresp     ;
  wire                                    act_axi_card_hbm_p18_rlast     ;
  wire                                    act_axi_card_hbm_p18_rvalid    ;
  wire                                    act_axi_card_hbm_p18_rready    ;
  wire [ `AXI_CARD_HBM_ID_WIDTH-1 : 0 ]    act_axi_card_hbm_p18_arid      ;
  wire [ `AXI_CARD_HBM_ID_WIDTH-1 : 0 ]    act_axi_card_hbm_p18_awid      ;
  wire [ `AXI_CARD_HBM_ID_WIDTH-1 : 0 ]    act_axi_card_hbm_p18_bid       ;
  wire [ `AXI_CARD_HBM_ID_WIDTH-1 : 0 ]    act_axi_card_hbm_p18_rid       ;
  `endif

  `ifdef HBM_AXI_IF_P19
  wire [ `AXI_CARD_HBM_ADDR_WIDTH-1 : 0 ]  act_axi_card_hbm_p19_awaddr    ;
  wire [ 7 : 0 ]                          act_axi_card_hbm_p19_awlen     ;
  wire [ 2 : 0 ]                          act_axi_card_hbm_p19_awsize    ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p19_awburst   ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p19_awlock    ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p19_awcache   ;
  wire [ 2 : 0 ]                          act_axi_card_hbm_p19_awprot    ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p19_awregion  ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p19_awqos     ;
  wire                                    act_axi_card_hbm_p19_awvalid   ;
  wire                                    act_axi_card_hbm_p19_awready   ;
  wire [ `AXI_CARD_HBM_DATA_WIDTH-1 : 0 ]  act_axi_card_hbm_p19_wdata     ;
  wire [(`AXI_CARD_HBM_DATA_WIDTH/8)-1 : 0] act_axi_card_hbm_p19_wstrb     ;
  wire                                    act_axi_card_hbm_p19_wlast     ;
  wire                                    act_axi_card_hbm_p19_wvalid    ;
  wire                                    act_axi_card_hbm_p19_wready    ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p19_bresp     ;
  wire                                    act_axi_card_hbm_p19_bvalid    ;
  wire                                    act_axi_card_hbm_p19_bready    ;
  wire [ `AXI_CARD_HBM_ADDR_WIDTH-1 : 0 ]  act_axi_card_hbm_p19_araddr    ;
  wire [ 7 : 0 ]                          act_axi_card_hbm_p19_arlen     ;
  wire [ 2 : 0 ]                          act_axi_card_hbm_p19_arsize    ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p19_arburst   ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p19_arlock    ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p19_arcache   ;
  wire [ 2 : 0 ]                          act_axi_card_hbm_p19_arprot    ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p19_arregion  ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p19_arqos     ;
  wire                                    act_axi_card_hbm_p19_arvalid   ;
  wire                                    act_axi_card_hbm_p19_arready   ;
  wire [ `AXI_CARD_HBM_DATA_WIDTH-1 : 0 ]  act_axi_card_hbm_p19_rdata     ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p19_rresp     ;
  wire                                    act_axi_card_hbm_p19_rlast     ;
  wire                                    act_axi_card_hbm_p19_rvalid    ;
  wire                                    act_axi_card_hbm_p19_rready    ;
  wire [ `AXI_CARD_HBM_ID_WIDTH-1 : 0 ]    act_axi_card_hbm_p19_arid      ;
  wire [ `AXI_CARD_HBM_ID_WIDTH-1 : 0 ]    act_axi_card_hbm_p19_awid      ;
  wire [ `AXI_CARD_HBM_ID_WIDTH-1 : 0 ]    act_axi_card_hbm_p19_bid       ;
  wire [ `AXI_CARD_HBM_ID_WIDTH-1 : 0 ]    act_axi_card_hbm_p19_rid       ;
  `endif

  `ifdef HBM_AXI_IF_P20
  wire [ `AXI_CARD_HBM_ADDR_WIDTH-1 : 0 ]  act_axi_card_hbm_p20_awaddr    ;
  wire [ 7 : 0 ]                          act_axi_card_hbm_p20_awlen     ;
  wire [ 2 : 0 ]                          act_axi_card_hbm_p20_awsize    ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p20_awburst   ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p20_awlock    ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p20_awcache   ;
  wire [ 2 : 0 ]                          act_axi_card_hbm_p20_awprot    ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p20_awregion  ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p20_awqos     ;
  wire                                    act_axi_card_hbm_p20_awvalid   ;
  wire                                    act_axi_card_hbm_p20_awready   ;
  wire [ `AXI_CARD_HBM_DATA_WIDTH-1 : 0 ]  act_axi_card_hbm_p20_wdata     ;
  wire [(`AXI_CARD_HBM_DATA_WIDTH/8)-1 : 0] act_axi_card_hbm_p20_wstrb     ;
  wire                                    act_axi_card_hbm_p20_wlast     ;
  wire                                    act_axi_card_hbm_p20_wvalid    ;
  wire                                    act_axi_card_hbm_p20_wready    ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p20_bresp     ;
  wire                                    act_axi_card_hbm_p20_bvalid    ;
  wire                                    act_axi_card_hbm_p20_bready    ;
  wire [ `AXI_CARD_HBM_ADDR_WIDTH-1 : 0 ]  act_axi_card_hbm_p20_araddr    ;
  wire [ 7 : 0 ]                          act_axi_card_hbm_p20_arlen     ;
  wire [ 2 : 0 ]                          act_axi_card_hbm_p20_arsize    ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p20_arburst   ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p20_arlock    ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p20_arcache   ;
  wire [ 2 : 0 ]                          act_axi_card_hbm_p20_arprot    ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p20_arregion  ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p20_arqos     ;
  wire                                    act_axi_card_hbm_p20_arvalid   ;
  wire                                    act_axi_card_hbm_p20_arready   ;
  wire [ `AXI_CARD_HBM_DATA_WIDTH-1 : 0 ]  act_axi_card_hbm_p20_rdata     ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p20_rresp     ;
  wire                                    act_axi_card_hbm_p20_rlast     ;
  wire                                    act_axi_card_hbm_p20_rvalid    ;
  wire                                    act_axi_card_hbm_p20_rready    ;
  wire [ `AXI_CARD_HBM_ID_WIDTH-1 : 0 ]    act_axi_card_hbm_p20_arid      ;
  wire [ `AXI_CARD_HBM_ID_WIDTH-1 : 0 ]    act_axi_card_hbm_p20_awid      ;
  wire [ `AXI_CARD_HBM_ID_WIDTH-1 : 0 ]    act_axi_card_hbm_p20_bid       ;
  wire [ `AXI_CARD_HBM_ID_WIDTH-1 : 0 ]    act_axi_card_hbm_p20_rid       ;
  `endif

  `ifdef HBM_AXI_IF_P21
  wire [ `AXI_CARD_HBM_ADDR_WIDTH-1 : 0 ]  act_axi_card_hbm_p21_awaddr    ;
  wire [ 7 : 0 ]                          act_axi_card_hbm_p21_awlen     ;
  wire [ 2 : 0 ]                          act_axi_card_hbm_p21_awsize    ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p21_awburst   ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p21_awlock    ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p21_awcache   ;
  wire [ 2 : 0 ]                          act_axi_card_hbm_p21_awprot    ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p21_awregion  ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p21_awqos     ;
  wire                                    act_axi_card_hbm_p21_awvalid   ;
  wire                                    act_axi_card_hbm_p21_awready   ;
  wire [ `AXI_CARD_HBM_DATA_WIDTH-1 : 0 ]  act_axi_card_hbm_p21_wdata     ;
  wire [(`AXI_CARD_HBM_DATA_WIDTH/8)-1 : 0] act_axi_card_hbm_p21_wstrb     ;
  wire                                    act_axi_card_hbm_p21_wlast     ;
  wire                                    act_axi_card_hbm_p21_wvalid    ;
  wire                                    act_axi_card_hbm_p21_wready    ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p21_bresp     ;
  wire                                    act_axi_card_hbm_p21_bvalid    ;
  wire                                    act_axi_card_hbm_p21_bready    ;
  wire [ `AXI_CARD_HBM_ADDR_WIDTH-1 : 0 ]  act_axi_card_hbm_p21_araddr    ;
  wire [ 7 : 0 ]                          act_axi_card_hbm_p21_arlen     ;
  wire [ 2 : 0 ]                          act_axi_card_hbm_p21_arsize    ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p21_arburst   ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p21_arlock    ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p21_arcache   ;
  wire [ 2 : 0 ]                          act_axi_card_hbm_p21_arprot    ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p21_arregion  ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p21_arqos     ;
  wire                                    act_axi_card_hbm_p21_arvalid   ;
  wire                                    act_axi_card_hbm_p21_arready   ;
  wire [ `AXI_CARD_HBM_DATA_WIDTH-1 : 0 ]  act_axi_card_hbm_p21_rdata     ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p21_rresp     ;
  wire                                    act_axi_card_hbm_p21_rlast     ;
  wire                                    act_axi_card_hbm_p21_rvalid    ;
  wire                                    act_axi_card_hbm_p21_rready    ;
  wire [ `AXI_CARD_HBM_ID_WIDTH-1 : 0 ]    act_axi_card_hbm_p21_arid      ;
  wire [ `AXI_CARD_HBM_ID_WIDTH-1 : 0 ]    act_axi_card_hbm_p21_awid      ;
  wire [ `AXI_CARD_HBM_ID_WIDTH-1 : 0 ]    act_axi_card_hbm_p21_bid       ;
  wire [ `AXI_CARD_HBM_ID_WIDTH-1 : 0 ]    act_axi_card_hbm_p21_rid       ;
  `endif

  `ifdef HBM_AXI_IF_P22
  wire [ `AXI_CARD_HBM_ADDR_WIDTH-1 : 0 ]  act_axi_card_hbm_p22_awaddr    ;
  wire [ 7 : 0 ]                          act_axi_card_hbm_p22_awlen     ;
  wire [ 2 : 0 ]                          act_axi_card_hbm_p22_awsize    ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p22_awburst   ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p22_awlock    ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p22_awcache   ;
  wire [ 2 : 0 ]                          act_axi_card_hbm_p22_awprot    ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p22_awregion  ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p22_awqos     ;
  wire                                    act_axi_card_hbm_p22_awvalid   ;
  wire                                    act_axi_card_hbm_p22_awready   ;
  wire [ `AXI_CARD_HBM_DATA_WIDTH-1 : 0 ]  act_axi_card_hbm_p22_wdata     ;
  wire [(`AXI_CARD_HBM_DATA_WIDTH/8)-1 : 0] act_axi_card_hbm_p22_wstrb     ;
  wire                                    act_axi_card_hbm_p22_wlast     ;
  wire                                    act_axi_card_hbm_p22_wvalid    ;
  wire                                    act_axi_card_hbm_p22_wready    ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p22_bresp     ;
  wire                                    act_axi_card_hbm_p22_bvalid    ;
  wire                                    act_axi_card_hbm_p22_bready    ;
  wire [ `AXI_CARD_HBM_ADDR_WIDTH-1 : 0 ]  act_axi_card_hbm_p22_araddr    ;
  wire [ 7 : 0 ]                          act_axi_card_hbm_p22_arlen     ;
  wire [ 2 : 0 ]                          act_axi_card_hbm_p22_arsize    ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p22_arburst   ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p22_arlock    ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p22_arcache   ;
  wire [ 2 : 0 ]                          act_axi_card_hbm_p22_arprot    ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p22_arregion  ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p22_arqos     ;
  wire                                    act_axi_card_hbm_p22_arvalid   ;
  wire                                    act_axi_card_hbm_p22_arready   ;
  wire [ `AXI_CARD_HBM_DATA_WIDTH-1 : 0 ]  act_axi_card_hbm_p22_rdata     ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p22_rresp     ;
  wire                                    act_axi_card_hbm_p22_rlast     ;
  wire                                    act_axi_card_hbm_p22_rvalid    ;
  wire                                    act_axi_card_hbm_p22_rready    ;
  wire [ `AXI_CARD_HBM_ID_WIDTH-1 : 0 ]    act_axi_card_hbm_p22_arid      ;
  wire [ `AXI_CARD_HBM_ID_WIDTH-1 : 0 ]    act_axi_card_hbm_p22_awid      ;
  wire [ `AXI_CARD_HBM_ID_WIDTH-1 : 0 ]    act_axi_card_hbm_p22_bid       ;
  wire [ `AXI_CARD_HBM_ID_WIDTH-1 : 0 ]    act_axi_card_hbm_p22_rid       ;
  `endif

  `ifdef HBM_AXI_IF_P23
  wire [ `AXI_CARD_HBM_ADDR_WIDTH-1 : 0 ]  act_axi_card_hbm_p23_awaddr    ;
  wire [ 7 : 0 ]                          act_axi_card_hbm_p23_awlen     ;
  wire [ 2 : 0 ]                          act_axi_card_hbm_p23_awsize    ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p23_awburst   ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p23_awlock    ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p23_awcache   ;
  wire [ 2 : 0 ]                          act_axi_card_hbm_p23_awprot    ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p23_awregion  ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p23_awqos     ;
  wire                                    act_axi_card_hbm_p23_awvalid   ;
  wire                                    act_axi_card_hbm_p23_awready   ;
  wire [ `AXI_CARD_HBM_DATA_WIDTH-1 : 0 ]  act_axi_card_hbm_p23_wdata     ;
  wire [(`AXI_CARD_HBM_DATA_WIDTH/8)-1 : 0] act_axi_card_hbm_p23_wstrb     ;
  wire                                    act_axi_card_hbm_p23_wlast     ;
  wire                                    act_axi_card_hbm_p23_wvalid    ;
  wire                                    act_axi_card_hbm_p23_wready    ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p23_bresp     ;
  wire                                    act_axi_card_hbm_p23_bvalid    ;
  wire                                    act_axi_card_hbm_p23_bready    ;
  wire [ `AXI_CARD_HBM_ADDR_WIDTH-1 : 0 ]  act_axi_card_hbm_p23_araddr    ;
  wire [ 7 : 0 ]                          act_axi_card_hbm_p23_arlen     ;
  wire [ 2 : 0 ]                          act_axi_card_hbm_p23_arsize    ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p23_arburst   ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p23_arlock    ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p23_arcache   ;
  wire [ 2 : 0 ]                          act_axi_card_hbm_p23_arprot    ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p23_arregion  ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p23_arqos     ;
  wire                                    act_axi_card_hbm_p23_arvalid   ;
  wire                                    act_axi_card_hbm_p23_arready   ;
  wire [ `AXI_CARD_HBM_DATA_WIDTH-1 : 0 ]  act_axi_card_hbm_p23_rdata     ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p23_rresp     ;
  wire                                    act_axi_card_hbm_p23_rlast     ;
  wire                                    act_axi_card_hbm_p23_rvalid    ;
  wire                                    act_axi_card_hbm_p23_rready    ;
  wire [ `AXI_CARD_HBM_ID_WIDTH-1 : 0 ]    act_axi_card_hbm_p23_arid      ;
  wire [ `AXI_CARD_HBM_ID_WIDTH-1 : 0 ]    act_axi_card_hbm_p23_awid      ;
  wire [ `AXI_CARD_HBM_ID_WIDTH-1 : 0 ]    act_axi_card_hbm_p23_bid       ;
  wire [ `AXI_CARD_HBM_ID_WIDTH-1 : 0 ]    act_axi_card_hbm_p23_rid       ;
  `endif

  `ifdef HBM_AXI_IF_P24
  wire [ `AXI_CARD_HBM_ADDR_WIDTH-1 : 0 ]  act_axi_card_hbm_p24_awaddr    ;
  wire [ 7 : 0 ]                          act_axi_card_hbm_p24_awlen     ;
  wire [ 2 : 0 ]                          act_axi_card_hbm_p24_awsize    ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p24_awburst   ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p24_awlock    ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p24_awcache   ;
  wire [ 2 : 0 ]                          act_axi_card_hbm_p24_awprot    ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p24_awregion  ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p24_awqos     ;
  wire                                    act_axi_card_hbm_p24_awvalid   ;
  wire                                    act_axi_card_hbm_p24_awready   ;
  wire [ `AXI_CARD_HBM_DATA_WIDTH-1 : 0 ]  act_axi_card_hbm_p24_wdata     ;
  wire [(`AXI_CARD_HBM_DATA_WIDTH/8)-1 : 0] act_axi_card_hbm_p24_wstrb     ;
  wire                                    act_axi_card_hbm_p24_wlast     ;
  wire                                    act_axi_card_hbm_p24_wvalid    ;
  wire                                    act_axi_card_hbm_p24_wready    ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p24_bresp     ;
  wire                                    act_axi_card_hbm_p24_bvalid    ;
  wire                                    act_axi_card_hbm_p24_bready    ;
  wire [ `AXI_CARD_HBM_ADDR_WIDTH-1 : 0 ]  act_axi_card_hbm_p24_araddr    ;
  wire [ 7 : 0 ]                          act_axi_card_hbm_p24_arlen     ;
  wire [ 2 : 0 ]                          act_axi_card_hbm_p24_arsize    ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p24_arburst   ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p24_arlock    ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p24_arcache   ;
  wire [ 2 : 0 ]                          act_axi_card_hbm_p24_arprot    ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p24_arregion  ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p24_arqos     ;
  wire                                    act_axi_card_hbm_p24_arvalid   ;
  wire                                    act_axi_card_hbm_p24_arready   ;
  wire [ `AXI_CARD_HBM_DATA_WIDTH-1 : 0 ]  act_axi_card_hbm_p24_rdata     ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p24_rresp     ;
  wire                                    act_axi_card_hbm_p24_rlast     ;
  wire                                    act_axi_card_hbm_p24_rvalid    ;
  wire                                    act_axi_card_hbm_p24_rready    ;
  wire [ `AXI_CARD_HBM_ID_WIDTH-1 : 0 ]    act_axi_card_hbm_p24_arid      ;
  wire [ `AXI_CARD_HBM_ID_WIDTH-1 : 0 ]    act_axi_card_hbm_p24_awid      ;
  wire [ `AXI_CARD_HBM_ID_WIDTH-1 : 0 ]    act_axi_card_hbm_p24_bid       ;
  wire [ `AXI_CARD_HBM_ID_WIDTH-1 : 0 ]    act_axi_card_hbm_p24_rid       ;
  `endif

  `ifdef HBM_AXI_IF_P25
  wire [ `AXI_CARD_HBM_ADDR_WIDTH-1 : 0 ]  act_axi_card_hbm_p25_awaddr    ;
  wire [ 7 : 0 ]                          act_axi_card_hbm_p25_awlen     ;
  wire [ 2 : 0 ]                          act_axi_card_hbm_p25_awsize    ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p25_awburst   ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p25_awlock    ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p25_awcache   ;
  wire [ 2 : 0 ]                          act_axi_card_hbm_p25_awprot    ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p25_awregion  ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p25_awqos     ;
  wire                                    act_axi_card_hbm_p25_awvalid   ;
  wire                                    act_axi_card_hbm_p25_awready   ;
  wire [ `AXI_CARD_HBM_DATA_WIDTH-1 : 0 ]  act_axi_card_hbm_p25_wdata     ;
  wire [(`AXI_CARD_HBM_DATA_WIDTH/8)-1 : 0] act_axi_card_hbm_p25_wstrb     ;
  wire                                    act_axi_card_hbm_p25_wlast     ;
  wire                                    act_axi_card_hbm_p25_wvalid    ;
  wire                                    act_axi_card_hbm_p25_wready    ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p25_bresp     ;
  wire                                    act_axi_card_hbm_p25_bvalid    ;
  wire                                    act_axi_card_hbm_p25_bready    ;
  wire [ `AXI_CARD_HBM_ADDR_WIDTH-1 : 0 ]  act_axi_card_hbm_p25_araddr    ;
  wire [ 7 : 0 ]                          act_axi_card_hbm_p25_arlen     ;
  wire [ 2 : 0 ]                          act_axi_card_hbm_p25_arsize    ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p25_arburst   ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p25_arlock    ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p25_arcache   ;
  wire [ 2 : 0 ]                          act_axi_card_hbm_p25_arprot    ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p25_arregion  ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p25_arqos     ;
  wire                                    act_axi_card_hbm_p25_arvalid   ;
  wire                                    act_axi_card_hbm_p25_arready   ;
  wire [ `AXI_CARD_HBM_DATA_WIDTH-1 : 0 ]  act_axi_card_hbm_p25_rdata     ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p25_rresp     ;
  wire                                    act_axi_card_hbm_p25_rlast     ;
  wire                                    act_axi_card_hbm_p25_rvalid    ;
  wire                                    act_axi_card_hbm_p25_rready    ;
  wire [ `AXI_CARD_HBM_ID_WIDTH-1 : 0 ]    act_axi_card_hbm_p25_arid      ;
  wire [ `AXI_CARD_HBM_ID_WIDTH-1 : 0 ]    act_axi_card_hbm_p25_awid      ;
  wire [ `AXI_CARD_HBM_ID_WIDTH-1 : 0 ]    act_axi_card_hbm_p25_bid       ;
  wire [ `AXI_CARD_HBM_ID_WIDTH-1 : 0 ]    act_axi_card_hbm_p25_rid       ;
  `endif

  `ifdef HBM_AXI_IF_P26
  wire [ `AXI_CARD_HBM_ADDR_WIDTH-1 : 0 ]  act_axi_card_hbm_p26_awaddr    ;
  wire [ 7 : 0 ]                          act_axi_card_hbm_p26_awlen     ;
  wire [ 2 : 0 ]                          act_axi_card_hbm_p26_awsize    ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p26_awburst   ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p26_awlock    ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p26_awcache   ;
  wire [ 2 : 0 ]                          act_axi_card_hbm_p26_awprot    ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p26_awregion  ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p26_awqos     ;
  wire                                    act_axi_card_hbm_p26_awvalid   ;
  wire                                    act_axi_card_hbm_p26_awready   ;
  wire [ `AXI_CARD_HBM_DATA_WIDTH-1 : 0 ]  act_axi_card_hbm_p26_wdata     ;
  wire [(`AXI_CARD_HBM_DATA_WIDTH/8)-1 : 0] act_axi_card_hbm_p26_wstrb     ;
  wire                                    act_axi_card_hbm_p26_wlast     ;
  wire                                    act_axi_card_hbm_p26_wvalid    ;
  wire                                    act_axi_card_hbm_p26_wready    ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p26_bresp     ;
  wire                                    act_axi_card_hbm_p26_bvalid    ;
  wire                                    act_axi_card_hbm_p26_bready    ;
  wire [ `AXI_CARD_HBM_ADDR_WIDTH-1 : 0 ]  act_axi_card_hbm_p26_araddr    ;
  wire [ 7 : 0 ]                          act_axi_card_hbm_p26_arlen     ;
  wire [ 2 : 0 ]                          act_axi_card_hbm_p26_arsize    ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p26_arburst   ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p26_arlock    ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p26_arcache   ;
  wire [ 2 : 0 ]                          act_axi_card_hbm_p26_arprot    ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p26_arregion  ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p26_arqos     ;
  wire                                    act_axi_card_hbm_p26_arvalid   ;
  wire                                    act_axi_card_hbm_p26_arready   ;
  wire [ `AXI_CARD_HBM_DATA_WIDTH-1 : 0 ]  act_axi_card_hbm_p26_rdata     ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p26_rresp     ;
  wire                                    act_axi_card_hbm_p26_rlast     ;
  wire                                    act_axi_card_hbm_p26_rvalid    ;
  wire                                    act_axi_card_hbm_p26_rready    ;
  wire [ `AXI_CARD_HBM_ID_WIDTH-1 : 0 ]    act_axi_card_hbm_p26_arid      ;
  wire [ `AXI_CARD_HBM_ID_WIDTH-1 : 0 ]    act_axi_card_hbm_p26_awid      ;
  wire [ `AXI_CARD_HBM_ID_WIDTH-1 : 0 ]    act_axi_card_hbm_p26_bid       ;
  wire [ `AXI_CARD_HBM_ID_WIDTH-1 : 0 ]    act_axi_card_hbm_p26_rid       ;
  `endif

  `ifdef HBM_AXI_IF_P27
  wire [ `AXI_CARD_HBM_ADDR_WIDTH-1 : 0 ]  act_axi_card_hbm_p27_awaddr    ;
  wire [ 7 : 0 ]                          act_axi_card_hbm_p27_awlen     ;
  wire [ 2 : 0 ]                          act_axi_card_hbm_p27_awsize    ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p27_awburst   ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p27_awlock    ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p27_awcache   ;
  wire [ 2 : 0 ]                          act_axi_card_hbm_p27_awprot    ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p27_awregion  ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p27_awqos     ;
  wire                                    act_axi_card_hbm_p27_awvalid   ;
  wire                                    act_axi_card_hbm_p27_awready   ;
  wire [ `AXI_CARD_HBM_DATA_WIDTH-1 : 0 ]  act_axi_card_hbm_p27_wdata     ;
  wire [(`AXI_CARD_HBM_DATA_WIDTH/8)-1 : 0] act_axi_card_hbm_p27_wstrb     ;
  wire                                    act_axi_card_hbm_p27_wlast     ;
  wire                                    act_axi_card_hbm_p27_wvalid    ;
  wire                                    act_axi_card_hbm_p27_wready    ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p27_bresp     ;
  wire                                    act_axi_card_hbm_p27_bvalid    ;
  wire                                    act_axi_card_hbm_p27_bready    ;
  wire [ `AXI_CARD_HBM_ADDR_WIDTH-1 : 0 ]  act_axi_card_hbm_p27_araddr    ;
  wire [ 7 : 0 ]                          act_axi_card_hbm_p27_arlen     ;
  wire [ 2 : 0 ]                          act_axi_card_hbm_p27_arsize    ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p27_arburst   ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p27_arlock    ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p27_arcache   ;
  wire [ 2 : 0 ]                          act_axi_card_hbm_p27_arprot    ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p27_arregion  ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p27_arqos     ;
  wire                                    act_axi_card_hbm_p27_arvalid   ;
  wire                                    act_axi_card_hbm_p27_arready   ;
  wire [ `AXI_CARD_HBM_DATA_WIDTH-1 : 0 ]  act_axi_card_hbm_p27_rdata     ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p27_rresp     ;
  wire                                    act_axi_card_hbm_p27_rlast     ;
  wire                                    act_axi_card_hbm_p27_rvalid    ;
  wire                                    act_axi_card_hbm_p27_rready    ;
  wire [ `AXI_CARD_HBM_ID_WIDTH-1 : 0 ]    act_axi_card_hbm_p27_arid      ;
  wire [ `AXI_CARD_HBM_ID_WIDTH-1 : 0 ]    act_axi_card_hbm_p27_awid      ;
  wire [ `AXI_CARD_HBM_ID_WIDTH-1 : 0 ]    act_axi_card_hbm_p27_bid       ;
  wire [ `AXI_CARD_HBM_ID_WIDTH-1 : 0 ]    act_axi_card_hbm_p27_rid       ;
  `endif

  `ifdef HBM_AXI_IF_P28
  wire [ `AXI_CARD_HBM_ADDR_WIDTH-1 : 0 ]  act_axi_card_hbm_p28_awaddr    ;
  wire [ 7 : 0 ]                          act_axi_card_hbm_p28_awlen     ;
  wire [ 2 : 0 ]                          act_axi_card_hbm_p28_awsize    ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p28_awburst   ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p28_awlock    ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p28_awcache   ;
  wire [ 2 : 0 ]                          act_axi_card_hbm_p28_awprot    ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p28_awregion  ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p28_awqos     ;
  wire                                    act_axi_card_hbm_p28_awvalid   ;
  wire                                    act_axi_card_hbm_p28_awready   ;
  wire [ `AXI_CARD_HBM_DATA_WIDTH-1 : 0 ]  act_axi_card_hbm_p28_wdata     ;
  wire [(`AXI_CARD_HBM_DATA_WIDTH/8)-1 : 0] act_axi_card_hbm_p28_wstrb     ;
  wire                                    act_axi_card_hbm_p28_wlast     ;
  wire                                    act_axi_card_hbm_p28_wvalid    ;
  wire                                    act_axi_card_hbm_p28_wready    ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p28_bresp     ;
  wire                                    act_axi_card_hbm_p28_bvalid    ;
  wire                                    act_axi_card_hbm_p28_bready    ;
  wire [ `AXI_CARD_HBM_ADDR_WIDTH-1 : 0 ]  act_axi_card_hbm_p28_araddr    ;
  wire [ 7 : 0 ]                          act_axi_card_hbm_p28_arlen     ;
  wire [ 2 : 0 ]                          act_axi_card_hbm_p28_arsize    ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p28_arburst   ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p28_arlock    ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p28_arcache   ;
  wire [ 2 : 0 ]                          act_axi_card_hbm_p28_arprot    ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p28_arregion  ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p28_arqos     ;
  wire                                    act_axi_card_hbm_p28_arvalid   ;
  wire                                    act_axi_card_hbm_p28_arready   ;
  wire [ `AXI_CARD_HBM_DATA_WIDTH-1 : 0 ]  act_axi_card_hbm_p28_rdata     ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p28_rresp     ;
  wire                                    act_axi_card_hbm_p28_rlast     ;
  wire                                    act_axi_card_hbm_p28_rvalid    ;
  wire                                    act_axi_card_hbm_p28_rready    ;
  wire [ `AXI_CARD_HBM_ID_WIDTH-1 : 0 ]    act_axi_card_hbm_p28_arid      ;
  wire [ `AXI_CARD_HBM_ID_WIDTH-1 : 0 ]    act_axi_card_hbm_p28_awid      ;
  wire [ `AXI_CARD_HBM_ID_WIDTH-1 : 0 ]    act_axi_card_hbm_p28_bid       ;
  wire [ `AXI_CARD_HBM_ID_WIDTH-1 : 0 ]    act_axi_card_hbm_p28_rid       ;
  `endif

  `ifdef HBM_AXI_IF_P29
  wire [ `AXI_CARD_HBM_ADDR_WIDTH-1 : 0 ]  act_axi_card_hbm_p29_awaddr    ;
  wire [ 7 : 0 ]                          act_axi_card_hbm_p29_awlen     ;
  wire [ 2 : 0 ]                          act_axi_card_hbm_p29_awsize    ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p29_awburst   ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p29_awlock    ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p29_awcache   ;
  wire [ 2 : 0 ]                          act_axi_card_hbm_p29_awprot    ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p29_awregion  ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p29_awqos     ;
  wire                                    act_axi_card_hbm_p29_awvalid   ;
  wire                                    act_axi_card_hbm_p29_awready   ;
  wire [ `AXI_CARD_HBM_DATA_WIDTH-1 : 0 ]  act_axi_card_hbm_p29_wdata     ;
  wire [(`AXI_CARD_HBM_DATA_WIDTH/8)-1 : 0] act_axi_card_hbm_p29_wstrb     ;
  wire                                    act_axi_card_hbm_p29_wlast     ;
  wire                                    act_axi_card_hbm_p29_wvalid    ;
  wire                                    act_axi_card_hbm_p29_wready    ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p29_bresp     ;
  wire                                    act_axi_card_hbm_p29_bvalid    ;
  wire                                    act_axi_card_hbm_p29_bready    ;
  wire [ `AXI_CARD_HBM_ADDR_WIDTH-1 : 0 ]  act_axi_card_hbm_p29_araddr    ;
  wire [ 7 : 0 ]                          act_axi_card_hbm_p29_arlen     ;
  wire [ 2 : 0 ]                          act_axi_card_hbm_p29_arsize    ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p29_arburst   ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p29_arlock    ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p29_arcache   ;
  wire [ 2 : 0 ]                          act_axi_card_hbm_p29_arprot    ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p29_arregion  ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p29_arqos     ;
  wire                                    act_axi_card_hbm_p29_arvalid   ;
  wire                                    act_axi_card_hbm_p29_arready   ;
  wire [ `AXI_CARD_HBM_DATA_WIDTH-1 : 0 ]  act_axi_card_hbm_p29_rdata     ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p29_rresp     ;
  wire                                    act_axi_card_hbm_p29_rlast     ;
  wire                                    act_axi_card_hbm_p29_rvalid    ;
  wire                                    act_axi_card_hbm_p29_rready    ;
  wire [ `AXI_CARD_HBM_ID_WIDTH-1 : 0 ]    act_axi_card_hbm_p29_arid      ;
  wire [ `AXI_CARD_HBM_ID_WIDTH-1 : 0 ]    act_axi_card_hbm_p29_awid      ;
  wire [ `AXI_CARD_HBM_ID_WIDTH-1 : 0 ]    act_axi_card_hbm_p29_bid       ;
  wire [ `AXI_CARD_HBM_ID_WIDTH-1 : 0 ]    act_axi_card_hbm_p29_rid       ;
  `endif

  `ifdef HBM_AXI_IF_P30
  wire [ `AXI_CARD_HBM_ADDR_WIDTH-1 : 0 ]  act_axi_card_hbm_p30_awaddr    ;
  wire [ 7 : 0 ]                          act_axi_card_hbm_p30_awlen     ;
  wire [ 2 : 0 ]                          act_axi_card_hbm_p30_awsize    ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p30_awburst   ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p30_awlock    ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p30_awcache   ;
  wire [ 2 : 0 ]                          act_axi_card_hbm_p30_awprot    ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p30_awregion  ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p30_awqos     ;
  wire                                    act_axi_card_hbm_p30_awvalid   ;
  wire                                    act_axi_card_hbm_p30_awready   ;
  wire [ `AXI_CARD_HBM_DATA_WIDTH-1 : 0 ]  act_axi_card_hbm_p30_wdata     ;
  wire [(`AXI_CARD_HBM_DATA_WIDTH/8)-1 : 0] act_axi_card_hbm_p30_wstrb     ;
  wire                                    act_axi_card_hbm_p30_wlast     ;
  wire                                    act_axi_card_hbm_p30_wvalid    ;
  wire                                    act_axi_card_hbm_p30_wready    ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p30_bresp     ;
  wire                                    act_axi_card_hbm_p30_bvalid    ;
  wire                                    act_axi_card_hbm_p30_bready    ;
  wire [ `AXI_CARD_HBM_ADDR_WIDTH-1 : 0 ]  act_axi_card_hbm_p30_araddr    ;
  wire [ 7 : 0 ]                          act_axi_card_hbm_p30_arlen     ;
  wire [ 2 : 0 ]                          act_axi_card_hbm_p30_arsize    ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p30_arburst   ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p30_arlock    ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p30_arcache   ;
  wire [ 2 : 0 ]                          act_axi_card_hbm_p30_arprot    ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p30_arregion  ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p30_arqos     ;
  wire                                    act_axi_card_hbm_p30_arvalid   ;
  wire                                    act_axi_card_hbm_p30_arready   ;
  wire [ `AXI_CARD_HBM_DATA_WIDTH-1 : 0 ]  act_axi_card_hbm_p30_rdata     ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p30_rresp     ;
  wire                                    act_axi_card_hbm_p30_rlast     ;
  wire                                    act_axi_card_hbm_p30_rvalid    ;
  wire                                    act_axi_card_hbm_p30_rready    ;
  wire [ `AXI_CARD_HBM_ID_WIDTH-1 : 0 ]    act_axi_card_hbm_p30_arid      ;
  wire [ `AXI_CARD_HBM_ID_WIDTH-1 : 0 ]    act_axi_card_hbm_p30_awid      ;
  wire [ `AXI_CARD_HBM_ID_WIDTH-1 : 0 ]    act_axi_card_hbm_p30_bid       ;
  wire [ `AXI_CARD_HBM_ID_WIDTH-1 : 0 ]    act_axi_card_hbm_p30_rid       ;
  `endif

  `ifdef HBM_AXI_IF_P31
  wire [ `AXI_CARD_HBM_ADDR_WIDTH-1 : 0 ]  act_axi_card_hbm_p31_awaddr    ;
  wire [ 7 : 0 ]                          act_axi_card_hbm_p31_awlen     ;
  wire [ 2 : 0 ]                          act_axi_card_hbm_p31_awsize    ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p31_awburst   ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p31_awlock    ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p31_awcache   ;
  wire [ 2 : 0 ]                          act_axi_card_hbm_p31_awprot    ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p31_awregion  ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p31_awqos     ;
  wire                                    act_axi_card_hbm_p31_awvalid   ;
  wire                                    act_axi_card_hbm_p31_awready   ;
  wire [ `AXI_CARD_HBM_DATA_WIDTH-1 : 0 ]  act_axi_card_hbm_p31_wdata     ;
  wire [(`AXI_CARD_HBM_DATA_WIDTH/8)-1 : 0] act_axi_card_hbm_p31_wstrb     ;
  wire                                    act_axi_card_hbm_p31_wlast     ;
  wire                                    act_axi_card_hbm_p31_wvalid    ;
  wire                                    act_axi_card_hbm_p31_wready    ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p31_bresp     ;
  wire                                    act_axi_card_hbm_p31_bvalid    ;
  wire                                    act_axi_card_hbm_p31_bready    ;
  wire [ `AXI_CARD_HBM_ADDR_WIDTH-1 : 0 ]  act_axi_card_hbm_p31_araddr    ;
  wire [ 7 : 0 ]                          act_axi_card_hbm_p31_arlen     ;
  wire [ 2 : 0 ]                          act_axi_card_hbm_p31_arsize    ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p31_arburst   ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p31_arlock    ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p31_arcache   ;
  wire [ 2 : 0 ]                          act_axi_card_hbm_p31_arprot    ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p31_arregion  ;
  wire [ 3 : 0 ]                          act_axi_card_hbm_p31_arqos     ;
  wire                                    act_axi_card_hbm_p31_arvalid   ;
  wire                                    act_axi_card_hbm_p31_arready   ;
  wire [ `AXI_CARD_HBM_DATA_WIDTH-1 : 0 ]  act_axi_card_hbm_p31_rdata     ;
  wire [ 1 : 0 ]                          act_axi_card_hbm_p31_rresp     ;
  wire                                    act_axi_card_hbm_p31_rlast     ;
  wire                                    act_axi_card_hbm_p31_rvalid    ;
  wire                                    act_axi_card_hbm_p31_rready    ;
  wire [ `AXI_CARD_HBM_ID_WIDTH-1 : 0 ]    act_axi_card_hbm_p31_arid      ;
  wire [ `AXI_CARD_HBM_ID_WIDTH-1 : 0 ]    act_axi_card_hbm_p31_awid      ;
  wire [ `AXI_CARD_HBM_ID_WIDTH-1 : 0 ]    act_axi_card_hbm_p31_bid       ;
  wire [ `AXI_CARD_HBM_ID_WIDTH-1 : 0 ]    act_axi_card_hbm_p31_rid       ;
  `endif
  `endif

  `ifndef ENABLE_HBM
// ifndef ENABLE_HBM => DDR or DDR replaced by BRAM
  wire [ `AXI_CARD_MEM_ADDR_WIDTH-1 : 0 ]  memctl0_axi_awaddr          ;
  wire [ 7 : 0 ]                          memctl0_axi_awlen           ;
  wire [ 2 : 0 ]                          memctl0_axi_awsize          ;
  wire [ 1 : 0 ]                          memctl0_axi_awburst         ;
  wire                                    memctl0_axi_awlock          ;
  wire [ 3 : 0 ]                          memctl0_axi_awcache         ;
  wire [ 2 : 0 ]                          memctl0_axi_awprot          ;
  wire [ 3 : 0 ]                          memctl0_axi_awregion        ;
  wire [ 3 : 0 ]                          memctl0_axi_awqos           ;
  wire                                    memctl0_axi_awvalid         ;
  wire                                    memctl0_axi_awready         ;
  wire [ `AXI_CARD_MEM_DATA_WIDTH-1 : 0 ]  memctl0_axi_wdata           ;
  wire [(`AXI_CARD_MEM_DATA_WIDTH/8)-1 : 0] memctl0_axi_wstrb           ;
  wire                                    memctl0_axi_wlast           ;
  wire                                    memctl0_axi_wvalid          ;
  wire                                    memctl0_axi_wready          ;
  wire [ 1 : 0 ]                          memctl0_axi_bresp           ;
  wire                                    memctl0_axi_bvalid          ;
  wire                                    memctl0_axi_bready          ;
  wire [ `AXI_CARD_MEM_ADDR_WIDTH-1 : 0 ]  memctl0_axi_araddr          ;
  wire [ 7 : 0 ]                          memctl0_axi_arlen           ;
  wire [ 2 : 0 ]                          memctl0_axi_arsize          ;
  wire [ 1 : 0 ]                          memctl0_axi_arburst         ;
  wire                                    memctl0_axi_arlock          ;
  wire [ 3 : 0 ]                          memctl0_axi_arcache         ;
  wire [ 2 : 0 ]                          memctl0_axi_arprot          ;
  wire [ 3 : 0 ]                          memctl0_axi_arregion        ;
  wire [ 3 : 0 ]                          memctl0_axi_arqos           ;
  wire                                    memctl0_axi_arvalid         ;
  wire                                    memctl0_axi_arready         ;
  wire [ `AXI_CARD_MEM_DATA_WIDTH-1 : 0 ]  memctl0_axi_rdata           ;
  wire [ 1 : 0 ]                          memctl0_axi_rresp           ;
  wire                                    memctl0_axi_rlast           ;
  wire                                    memctl0_axi_rvalid          ;
  wire                                    memctl0_axi_rready          ;
  wire [ `AXI_CARD_MEM_ID_WIDTH-1 : 0 ]    memctl0_axi_arid            ;
  wire [ `AXI_CARD_MEM_ID_WIDTH-1 : 0 ]    memctl0_axi_awid            ;
  wire [ `AXI_CARD_MEM_ID_WIDTH-1 : 0 ]    memctl0_axi_bid             ;
  wire [ `AXI_CARD_MEM_ID_WIDTH-1 : 0 ]    memctl0_axi_rid             ;
  wire                                    memctl0_init_calib_complete ;
  wire                                    memctl0_ui_clk              ;
  wire                                    memctl0_axi_ctrl_awvalid    ;
  wire                                    memctl0_axi_ctrl_awready    ;
  wire [31 : 0]                           memctl0_axi_ctrl_awaddr     ;
  wire                                    memctl0_axi_ctrl_wvalid     ;
  wire                                    memctl0_axi_ctrl_wready     ;
  wire [31 : 0]                           memctl0_axi_ctrl_wdata      ;
  wire                                    memctl0_axi_ctrl_bvalid     ;
  wire                                    memctl0_axi_ctrl_bready     ;
  wire [1 : 0]                            memctl0_axi_ctrl_bresp      ;
  wire                                    memctl0_axi_ctrl_arvalid    ;
  wire                                    memctl0_axi_ctrl_arready    ;
  wire [31 : 0]                           memctl0_axi_ctrl_araddr     ;
  wire                                    memctl0_axi_ctrl_rvalid     ;
  wire                                    memctl0_axi_ctrl_rready     ;
  wire [31 : 0]                           memctl0_axi_ctrl_rdata      ;
  wire [1 : 0]                            memctl0_axi_ctrl_rresp      ;
  wire                                    memctl0_interrupt           ;
  wire                                    memctl0_axi_rst_n           ;
  `endif
`endif

// if DDR on AD9V3 (No BRAM)
`ifdef ENABLE_DDR
  `ifdef AD9V3
  wire            ddr4_dbg_clk                   ;
  wire [511 : 0]  ddr4_dbg_bus                   ;
  wire            memctl0_ui_clk_sync_rst        ; //reset generated from DDR MIG
  `endif
  `ifdef BW250SOC
  wire            ddr4_dbg_clk                   ;
  wire [511 : 0]  ddr4_dbg_bus                   ;
  wire            memctl0_ui_clk_sync_rst        ; //reset generated from DDR MIG
  `endif

`endif


  // // Interface to AFU Descriptor table (interface is Read Only)
  wire [24*8-1:0] ro_name_space                       ;
  wire      [7:0] ro_afu_version_major                ;
  wire      [7:0] ro_afu_version_minor                ;
  wire      [2:0] ro_afuc_type                        ;
  wire      [2:0] ro_afum_type                        ;
  wire      [7:0] ro_profile                          ;
  wire    [63:16] ro_global_mmio_offset               ;
  wire      [2:0] ro_global_mmio_bar                  ;
  wire     [31:0] ro_global_mmio_size                 ;
  wire            ro_cmd_flag_x1_supported            ;
  wire            ro_cmd_flag_x3_supported            ;
  wire            ro_atc_2M_page_supported            ;
  wire            ro_atc_64K_page_supported           ;
  wire      [4:0] ro_max_host_tag_size                ;
  wire    [63:16] ro_per_pasid_mmio_offset            ;
  wire      [2:0] ro_per_pasid_mmio_bar               ;
  wire    [31:16] ro_per_pasid_mmio_stride            ;
  wire      [7:0] ro_mem_size                         ;
  wire     [63:0] ro_mem_start_addr                   ;
  wire    [127:0] ro_naa_wwid                         ;
  wire     [63:0] ro_system_memory_length             ;

  // ETHERNET
`ifdef ENABLE_ETHERNET 
`ifndef ENABLE_ETH_LOOP_BACK
  wire    [511:0] eth1_rx_tdata                       ;
  wire     [63:0] eth1_rx_tkeep                       ;
  wire            eth1_rx_tlast                       ;
  wire            eth1_rx_tvalid                      ;
  wire            eth1_rx_tready                      ;
  wire      [0:0] eth1_rx_tuser                       ;

  wire    [511:0] eth1_tx_tdata                       ;
  wire     [63:0] eth1_tx_tkeep                       ;
  wire            eth1_tx_tlast                       ;
  wire            eth1_tx_tvalid                      ;
  wire            eth1_tx_tready                      ;
  wire      [0:0] eth1_tx_tuser                       ;

  wire            eth_m_axis_rx_rst                   ;
  
  wire            gt_ref_clk_p_o                      ;
  wire            gt_ref_clk_n_o                      ;
  wire            gt_rx_gt_port_0_p_o                 ;
  wire            gt_rx_gt_port_0_n_o                 ;
  wire            gt_rx_gt_port_1_p_o                 ;
  wire            gt_rx_gt_port_1_n_o                 ;
  wire            gt_rx_gt_port_2_p_o                 ;
  wire            gt_rx_gt_port_2_n_o                 ;
  wire            gt_rx_gt_port_3_p_o                 ;
  wire            gt_rx_gt_port_3_n_o                 ;

  wire            gt_tx_gt_port_0_p_i                 ;
  wire            gt_tx_gt_port_0_n_i                 ;
  wire            gt_tx_gt_port_1_p_i                 ;
  wire            gt_tx_gt_port_1_n_i                 ;
  wire            gt_tx_gt_port_2_p_i                 ;
  wire            gt_tx_gt_port_2_n_i                 ;
  wire            gt_tx_gt_port_3_p_i                 ;
  wire            gt_tx_gt_port_3_n_i                 ;
`endif
`endif

  // // ******************************************************************************
  // // User clock
  // // ******************************************************************************
  `ifdef ACTION_USER_CLOCK
  wire clock_usr;
  wire user_clock_enabled;
  
  user_clock_gen muser_clock
  (
    .reset          ( reset    ),
    .clk_in1        ( clock_afu),
    .clk_out1       ( clock_usr),
    .locked         ( user_clock_enabled)
  );  
  `endif

  wire clock_act;
  `ifdef ACTION_USER_CLOCK
    assign clock_act = clock_usr;
  `else
    assign clock_act = clock_afu;
  `endif

  wire clock_mem;
  `ifdef ENABLE_DDR
    assign clock_mem = memctl0_ui_clk;
  `else
    assign clock_mem = clock_afu;
  `endif
  // // ******************************************************************************
  // // Reset signals
  // // ******************************************************************************


  //----------------------------------
  // Connections
  // To snap_core      (sampled by clock_afu)

  // To action_wrapper (sampled by clock_afu)
  reg  reset_action_tmp;
  wire reset_action_q;
  always @ (posedge clock_afu) 
        reset_action_tmp <= reset_action_d;
	

  // To mem controllers (sampled by clock_afu)
  // To Action attached converters

  reg reset_nest_q;
  always @ (posedge clock_afu)
    begin
        reset_nest_q <= reset_action_d;
    end

`ifdef ENABLE_AXI_CARD_MEM
  `ifdef ENABLE_DDR
     assign memctl0_axi_rst_n = ~memctl0_ui_clk_sync_rst;
  `else
     assign memctl0_axi_rst_n = ~reset_nest_q;
  `endif
`endif
`ifdef ENABLE_ETHERNET
  `ifndef ENABLE_ETH_LOOP_BACK
    wire eth_rst;
    assign eth_rst = reset_action_d;
  `endif
`endif

  // // ******************************************************************************
  // // AFU DESCRIPTOR TIES
  // // ******************************************************************************



  // // ******************************************************************************
  // // action_wrapper
  // // ******************************************************************************
// async clock handle for reset and interrupt signals
    wire                 action_int_req_ack;
    wire                 action_int_req;
    wire [`INT_BITS-1:0] action_int_src;
    wire [`CTXW-1:0]     action_int_ctx;
`ifdef ACTION_USER_CLOCK
    assign reset_action_q = reset_action_tmp || (!user_clock_enabled);

    reg                 action_int_req_level;
    reg [`INT_BITS-1:0] action_int_src_level;
    reg [`CTXW-1:0]     action_int_ctx_level;
    reg                 int_req_q1;
    reg                 int_req_q2;
    reg [`INT_BITS-1:0] int_src_q1;
    reg [`INT_BITS-1:0] int_src_q2;
    reg [`CTXW-1:0]     int_ctx_q1;
    reg [`CTXW-1:0]     int_ctx_q2;

    always@(posedge clock_act or posedge reset_action_q)
    begin
        if(reset_action_q)
            action_int_req_level <= 1'b0;
        else if(action_int_req_ack)
            action_int_req_level <= 1'b0;
        else if(action_int_req)
            action_int_req_level <= 1'b1;
    end

    always@(posedge clock_act)
    begin
        if(action_int_req)
        begin
            action_int_src_level <= action_int_src;
            action_int_ctx_level <= action_int_ctx;
        end
    end

    always@(posedge clock_afu)
    begin
        int_req_q1 <= action_int_req_level;
        int_req_q2 <= int_req_q1;
        int_src_q1 <= action_int_src_level;
        int_src_q2 <= int_src_q1;
        int_ctx_q1 <= action_int_ctx_level;
        int_ctx_q2 <= int_ctx_q1;
    end

    assign int_req = int_req_q2;
    assign int_src = int_src_q2;
    assign int_ctx = int_ctx_q2;
    assign action_int_req_ack = int_req_ack;
`else
    assign reset_action_q = reset_action_tmp;
    assign int_req = action_int_req;
    assign int_src = action_int_src;
    assign int_ctx = action_int_ctx;
    assign action_int_req_ack = int_req_ack;
`endif


  // //
  // ******************************************************************************
  // // Convertors for AXI lite path
  // //
  // ******************************************************************************
  
 `ifndef ENABLE_ODMA
 
 `ifdef ACTION_USER_CLOCK
 
  //
  // AXI_LITE_CLOCK_CONVERTER
  //
  axi_lite_clock_converter axi_lite_clock_converter_snap2act (
      .s_axi_aclk     (         clock_afu    ) ,
      .s_axi_aresetn  (         ~reset_nest_q ) ,
      .s_axi_awaddr   (         s_axil_awaddr  ) ,
      .s_axi_awprot   (         s_axil_awprot  ) ,
      .s_axi_awvalid  (         s_axil_awvalid ) ,
      .s_axi_awready  (         s_axil_awready ) ,
      .s_axi_wdata    (         s_axil_wdata   ) ,
      .s_axi_wstrb    (         s_axil_wstrb   ) ,
      .s_axi_wvalid   (         s_axil_wvalid  ) ,
      .s_axi_wready   (         s_axil_wready  ) ,
      .s_axi_bresp    (         s_axil_bresp   ) ,
      .s_axi_bvalid   (         s_axil_bvalid  ) ,
      .s_axi_bready   (         s_axil_bready  ) ,
      .s_axi_araddr   (         s_axil_araddr  ) ,
      .s_axi_arprot   (         s_axil_arprot  ) ,
      .s_axi_arvalid  (         s_axil_arvalid ) ,
      .s_axi_arready  (         s_axil_arready ) ,
      .s_axi_rdata    (         s_axil_rdata   ) ,
      .s_axi_rresp    (         s_axil_rresp   ) ,
      .s_axi_rvalid   (         s_axil_rvalid  ) ,
      .s_axi_rready   (         s_axil_rready  ) ,

      .m_axi_aclk     (        clock_act     ) ,
      .m_axi_aresetn  (        ~reset_action_q  ) ,
      .m_axi_awaddr   (        lite_conv2act_awaddr   ) ,
      .m_axi_awprot   (                        ) ,
      .m_axi_awvalid  (        lite_conv2act_awvalid  ) ,
      .m_axi_awready  (        lite_act2conv_awready  ) ,
      .m_axi_wdata    (        lite_conv2act_wdata    ) ,
      .m_axi_wstrb    (        lite_conv2act_wstrb    ) ,
      .m_axi_wvalid   (        lite_conv2act_wvalid   ) ,
      .m_axi_wready   (        lite_act2conv_wready   ) ,
      .m_axi_bresp    (        lite_act2conv_bresp    ) ,
      .m_axi_bvalid   (        lite_act2conv_bvalid   ) ,
      .m_axi_bready   (        lite_conv2act_bready   ) ,
      .m_axi_araddr   (        lite_conv2act_araddr   ) ,
      .m_axi_arprot   (                        ) ,
      .m_axi_arvalid  (        lite_conv2act_arvalid  ) ,
      .m_axi_arready  (        lite_act2conv_arready  ) ,
      .m_axi_rdata    (        lite_act2conv_rdata    ) ,
      .m_axi_rresp    (        lite_act2conv_rresp    ) ,
      .m_axi_rvalid   (        lite_act2conv_rvalid   ) ,
      .m_axi_rready   (        lite_conv2act_rready   )
    );
`else

    assign        lite_conv2act_awaddr             =         s_axil_awaddr            ;
    assign        lite_conv2act_awprot             =         s_axil_awprot            ;
    assign        lite_conv2act_awvalid            =         s_axil_awvalid           ;
    assign        lite_conv2act_wdata              =         s_axil_wdata             ;
    assign        lite_conv2act_wstrb              =         s_axil_wstrb             ;
    assign        lite_conv2act_wvalid             =         s_axil_wvalid            ;
    assign        lite_conv2act_bready             =         s_axil_bready            ;
    assign        lite_conv2act_araddr             =         s_axil_araddr            ;
    assign        lite_conv2act_arprot             =         s_axil_arprot            ;
    assign        lite_conv2act_arvalid            =         s_axil_arvalid           ;
    assign        lite_conv2act_rready             =         s_axil_rready            ;

    assign         s_axil_awready           =        lite_act2conv_awready            ;
    assign         s_axil_wready            =        lite_act2conv_wready             ;
    assign         s_axil_bresp             =        lite_act2conv_bresp              ;
    assign         s_axil_bvalid            =        lite_act2conv_bvalid             ;
    assign         s_axil_arready           =        lite_act2conv_arready            ;
    assign         s_axil_rdata             =        lite_act2conv_rdata              ;
    assign         s_axil_rresp             =        lite_act2conv_rresp              ;
    assign         s_axil_rvalid            =        lite_act2conv_rvalid             ;
`endif

 


  // ******************************************************************************
  // // Convertors for AXI MM Data Path
  // //
  // ******************************************************************************
  //
  // if HOST data bus width for snap action is 512 bits
`ifdef ACTION_HALF_WIDTH
  //
  // AXI_DWIDTH_CONVERTER
 axi_dwidth_converter axi_dwidth_converter_act2snap (
      .s_axi_aclk        (     clock_act      ) ,
      .s_axi_aresetn     (     ~reset_action_q   ) ,
      .s_axi_awaddr      (     mm_act2conv_awaddr    ) ,
      .s_axi_awid        (     mm_act2conv_awid      ) ,
      .s_axi_awlen       (     mm_act2conv_awlen     ) ,
      .s_axi_awsize      (     mm_act2conv_awsize    ) ,
      .s_axi_awburst     (     mm_act2conv_awburst   ) ,
      .s_axi_awlock      ( 1'b0                   ) ,
      .s_axi_awcache     (     mm_act2conv_awcache   ) ,
      .s_axi_awprot      (     mm_act2conv_awprot    ) ,
      .s_axi_awregion    ( 4'h0                ) ,
      .s_axi_awqos       (     mm_act2conv_awqos     ) ,
      .s_axi_awvalid     (     mm_act2conv_awvalid   ) ,
      .s_axi_awready     (     mm_conv2act_awready   ) ,
      .s_axi_wdata       (     mm_act2conv_wdata     ) ,
      .s_axi_wstrb       (     mm_act2conv_wstrb     ) ,
      .s_axi_wlast       (     mm_act2conv_wlast     ) ,
      .s_axi_wvalid      (     mm_act2conv_wvalid    ) ,
      .s_axi_wready      (     mm_conv2act_wready    ) ,
      .s_axi_bresp       (     mm_conv2act_bresp     ) ,
      .s_axi_bvalid      (     mm_conv2act_bvalid    ) ,
      .s_axi_bid         (     mm_conv2act_bid       ) ,
      .s_axi_bready      (     mm_act2conv_bready    ) ,
      .s_axi_araddr      (     mm_act2conv_araddr    ) ,
      .s_axi_arid        (     mm_act2conv_arid      ) ,
      .s_axi_arlen       (     mm_act2conv_arlen     ) ,
      .s_axi_arsize      (     mm_act2conv_arsize    ) ,
      .s_axi_arburst     (     mm_act2conv_arburst   ) ,
      .s_axi_arlock      ( 1'b0                   ) ,
      .s_axi_arcache     (     mm_act2conv_arcache   ) ,
      .s_axi_arprot      (     mm_act2conv_arprot    ) ,
      .s_axi_arregion    ( 4'h0                ) ,
      .s_axi_arqos       (     mm_act2conv_arqos     ) ,
      .s_axi_arvalid     (     mm_act2conv_arvalid   ) ,
      .s_axi_arready     (     mm_conv2act_arready   ) ,
      .s_axi_rdata       (     mm_conv2act_rdata     ) ,
      .s_axi_rid         (     mm_conv2act_rid       ) ,
      .s_axi_rresp       (     mm_conv2act_rresp     ) ,
      .s_axi_rlast       (     mm_conv2act_rlast     ) ,
      .s_axi_rvalid      (     mm_conv2act_rvalid    ) ,
      .s_axi_rready      (     mm_act2conv_rready    ) ,

      .m_axi_aclk        (      clock_afu     ) ,
      .m_axi_aresetn     (      ~reset_nest_q  ) ,
      .m_axi_awaddr      (      m_aximm_awaddr   ) ,
      .m_axi_awlen       (      m_aximm_awlen    ) ,
      .m_axi_awsize      (      m_aximm_awsize   ) ,
      .m_axi_awburst     (      m_aximm_awburst  ) ,
      .m_axi_awlock      (      m_axi_awlock     ) ,
      .m_axi_awcache     (      m_aximm_awcache  ) ,
      .m_axi_awprot      (      m_aximm_awprot   ) ,
      .m_axi_awregion    (      m_aximm_awregion ) ,
      .m_axi_awqos       (      m_aximm_awqos    ) ,
      .m_axi_awvalid     (      m_aximm_awvalid  ) ,
      .m_axi_awready     (      m_aximm_awready  ) ,
      .m_axi_wdata       (      m_aximm_wdata    ) ,
      .m_axi_wstrb       (      m_aximm_wstrb    ) ,
      .m_axi_wlast       (      m_aximm_wlast    ) ,
      .m_axi_wvalid      (      m_aximm_wvalid   ) ,
      .m_axi_wready      (      m_aximm_wready   ) ,
      .m_axi_bresp       (      m_aximm_bresp    ) ,
      .m_axi_bvalid      (      m_aximm_bvalid   ) ,
      .m_axi_bready      (      m_aximm_bready   ) ,
      .m_axi_araddr      (      m_aximm_araddr   ) ,
      .m_axi_arlen       (      m_aximm_arlen    ) ,
      .m_axi_arsize      (      m_aximm_arsize   ) ,
      .m_axi_arburst     (      m_aximm_arburst  ) ,
      .m_axi_arlock      (      m_axi_arlock     ) ,
      .m_axi_arcache     (      m_aximm_arcache  ) ,
      .m_axi_arprot      (      m_aximm_arprot   ) ,
      .m_axi_arregion    (      m_aximm_arregion ) ,
      .m_axi_arqos       (      m_aximm_arqos    ) ,
      .m_axi_arvalid     (      m_aximm_arvalid  ) ,
      .m_axi_arready     (      m_aximm_arready  ) ,
      .m_axi_rdata       (      m_aximm_rdata    ) ,
      .m_axi_rresp       (      m_aximm_rresp    ) ,
      .m_axi_rlast       (      m_aximm_rlast    ) ,
      .m_axi_rvalid      (      m_aximm_rvalid   ) ,
      .m_axi_rready      (      m_aximm_rready   )
) ; // axi_dwidth_converter
assign       m_aximm_aruser =     mm_act2conv_aruser;
assign       m_aximm_awuser =     mm_act2conv_awuser;
assign      mm_conv2act_buser =      m_aximm_buser;
assign      mm_conv2act_ruser =      m_aximm_ruser;
assign       m_aximm_awid =     mm_act2conv_awid;
assign       m_aximm_arid =     mm_act2conv_arid;
assign      mm_conv2act_bid =      m_aximm_bid;
assign      mm_conv2act_rid =      m_aximm_rid;

// if HOST data bus width for snap action is 1024 bits
`else
  `ifdef ACTION_USER_CLOCK
  //
  // AXI_CLOCK_CONVERTER_ACT2SNAP
  //
  axi_clock_converter_act2snap axi_clkconv_act2snap (
      .s_axi_aclk                         (     clock_act      ) ,
      .s_axi_aresetn                      (     ~reset_action_q   ) ,
      .m_axi_aclk                         (     clock_afu      ) ,
      .m_axi_aresetn                      (     ~reset_nest_q   ) ,
      //
      // FROM ACTION
      .s_axi_araddr                       (     mm_act2conv_araddr    ) ,
      .s_axi_aruser                       (     mm_act2conv_aruser    ) ,
      .s_axi_arburst                      (     mm_act2conv_arburst   ) ,
      .s_axi_arcache                      (     mm_act2conv_arcache   ) ,
      .s_axi_arid                         (     mm_act2conv_arid      ) ,
      .s_axi_arlen                        (     mm_act2conv_arlen     ) ,
      .s_axi_arlock                       ( 1'b0                  ) ,
      .s_axi_arprot                       (     mm_act2conv_arprot    ) ,
      .s_axi_arqos                        (     mm_act2conv_arqos     ) ,
      .s_axi_arready                      (     mm_conv2act_arready   ) ,
      .s_axi_arregion                     ( 4'h0                  ) ,
      .s_axi_arsize                       (     mm_act2conv_arsize    ) ,
      .s_axi_arvalid                      (     mm_act2conv_arvalid   ) ,
      .s_axi_awaddr                       (     mm_act2conv_awaddr    ) ,
      .s_axi_awuser                       (     mm_act2conv_awuser    ) ,
      .s_axi_awburst                      (     mm_act2conv_awburst   ) ,
      .s_axi_awcache                      (     mm_act2conv_awcache   ) ,
      .s_axi_awid                         (     mm_act2conv_awid      ) ,
      .s_axi_awlen                        (     mm_act2conv_awlen     ) ,
      .s_axi_awlock                       ( 1'b0                   ) ,
      .s_axi_awprot                       (     mm_act2conv_awprot    ) ,
      .s_axi_awqos                        (     mm_act2conv_awqos     ) ,
      .s_axi_awready                      (     mm_conv2act_awready   ) ,
      .s_axi_awregion                     ( 4'h0                ) ,
      .s_axi_awsize                       (     mm_act2conv_awsize    ) ,
      .s_axi_awvalid                      (     mm_act2conv_awvalid   ) ,
      .s_axi_bid                          (     mm_conv2act_bid       ) ,
      .s_axi_buser                        (     mm_conv2act_buser     ) ,
      .s_axi_bready                       (     mm_act2conv_bready    ) ,
      .s_axi_bresp                        (     mm_conv2act_bresp     ) ,
      .s_axi_bvalid                       (     mm_conv2act_bvalid    ) ,
      .s_axi_rdata                        (     mm_conv2act_rdata     ) ,
      .s_axi_rid                          (     mm_conv2act_rid       ) ,
      .s_axi_ruser                        (     mm_conv2act_ruser     ) ,
      .s_axi_rlast                        (     mm_conv2act_rlast     ) ,
      .s_axi_rready                       (     mm_act2conv_rready    ) ,
      .s_axi_rresp                        (     mm_conv2act_rresp     ) ,
      .s_axi_rvalid                       (     mm_conv2act_rvalid    ) ,
      .s_axi_wdata                        (     mm_act2conv_wdata     ) ,
      .s_axi_wuser                        (     mm_act2conv_wuser     ) ,
      .s_axi_wlast                        (     mm_act2conv_wlast     ) ,
      .s_axi_wready                       (     mm_conv2act_wready    ) ,
      .s_axi_wstrb                        (     mm_act2conv_wstrb     ) ,
      .s_axi_wvalid                       (     mm_act2conv_wvalid    ) ,
      //
      // TO SNAP
      .m_axi_araddr                       (      m_aximm_araddr   ) ,
      .m_axi_aruser                       (      m_aximm_aruser   ) ,
      .m_axi_arburst                      (      m_aximm_arburst  ) ,
      .m_axi_arcache                      (      m_aximm_arcache  ) ,
      .m_axi_arid                         (      m_aximm_arid     ) ,
      .m_axi_arlen                        (      m_aximm_arlen    ) ,
      .m_axi_arlock                       (                       ) ,
      .m_axi_arprot                       (      m_aximm_arprot   ) ,
      .m_axi_arqos                        (      m_aximm_arqos    ) ,
      .m_axi_arready                      (      m_aximm_arready  ) ,
      .m_axi_arregion                     (      m_aximm_arregion ) ,
      .m_axi_arsize                       (      m_aximm_arsize   ) ,
      .m_axi_arvalid                      (      m_aximm_arvalid  ) ,
      .m_axi_awaddr                       (      m_aximm_awaddr   ) ,
      .m_axi_awuser                       (      m_aximm_awuser   ) ,
      .m_axi_awburst                      (      m_aximm_awburst  ) ,
      .m_axi_awcache                      (      m_aximm_awcache  ) ,
      .m_axi_awid                         (      m_aximm_awid     ) ,
      .m_axi_awlen                        (      m_aximm_awlen    ) ,
      .m_axi_awlock                       (                       ) ,
      .m_axi_awprot                       (      m_aximm_awprot   ) ,
      .m_axi_awqos                        (      m_aximm_awqos    ) ,
      .m_axi_awready                      (      m_aximm_awready  ) ,
      .m_axi_awregion                     (      m_aximm_awregion ) ,
      .m_axi_awsize                       (      m_aximm_awsize   ) ,
      .m_axi_awvalid                      (      m_aximm_awvalid  ) ,
      .m_axi_bid                          (      m_aximm_bid      ) ,
      .m_axi_buser                        (      m_aximm_buser    ) ,
      .m_axi_bready                       (      m_aximm_bready   ) ,
      .m_axi_bresp                        (      m_aximm_bresp    ) ,
      .m_axi_bvalid                       (      m_aximm_bvalid   ) ,
      .m_axi_rdata                        (      m_aximm_rdata    ) ,
      .m_axi_rid                          (      m_aximm_rid      ) ,
      .m_axi_ruser                        (      m_aximm_ruser    ) ,
      .m_axi_rlast                        (      m_aximm_rlast    ) ,
      .m_axi_rready                       (      m_aximm_rready   ) ,
      .m_axi_rresp                        (      m_aximm_rresp    ) ,
      .m_axi_rvalid                       (      m_aximm_rvalid   ) ,
      .m_axi_wdata                        (      m_aximm_wdata    ) ,
      .m_axi_wuser                        (      m_aximm_wuser    ) ,
      .m_axi_wlast                        (      m_aximm_wlast    ) ,
      .m_axi_wready                       (      m_aximm_wready   ) ,
      .m_axi_wstrb                        (      m_aximm_wstrb    ) ,
      .m_axi_wvalid                       (      m_aximm_wvalid   )
 ) ;

  `else
  //No dwith converter, no clock convertor
  //direct connect
assign     mm_conv2act_awready              =      m_aximm_awready              ;
assign     mm_conv2act_wready               =      m_aximm_wready               ;
assign     mm_conv2act_bid                  =      m_aximm_bid                  ;
assign     mm_conv2act_bresp                =      m_aximm_bresp                ;
assign     mm_conv2act_bvalid               =      m_aximm_bvalid               ;
assign     mm_conv2act_rid                  =      m_aximm_rid                  ;
assign     mm_conv2act_rdata                =      m_aximm_rdata                ;
assign     mm_conv2act_rresp                =      m_aximm_rresp                ;
assign     mm_conv2act_rlast                =      m_aximm_rlast                ;
assign     mm_conv2act_rvalid               =      m_aximm_rvalid               ;
assign     mm_conv2act_arready              =      m_aximm_arready              ;
assign     mm_conv2act_buser                =      m_aximm_buser                ;
assign     mm_conv2act_ruser                =      m_aximm_ruser                ;

assign      m_aximm_awid                 =     mm_act2conv_awid                 ;
assign      m_aximm_awaddr               =     mm_act2conv_awaddr               ;
assign      m_aximm_awlen                =     mm_act2conv_awlen                ;
assign      m_aximm_awsize               =     mm_act2conv_awsize               ;
assign      m_aximm_awburst              =     mm_act2conv_awburst              ;
assign      m_aximm_awlock               =     mm_act2conv_awlock               ;
assign      m_aximm_awcache              =     mm_act2conv_awcache              ;
assign      m_aximm_awprot               =     mm_act2conv_awprot               ;
assign      m_aximm_awqos                =     mm_act2conv_awqos                ;
assign      m_aximm_awregion             =     mm_act2conv_awregion             ;
assign      m_aximm_awuser               =     mm_act2conv_awuser               ;
assign      m_aximm_awvalid              =     mm_act2conv_awvalid              ;
assign      m_aximm_wdata                =     mm_act2conv_wdata                ;
assign      m_aximm_wstrb                =     mm_act2conv_wstrb                ;
assign      m_aximm_wlast                =     mm_act2conv_wlast                ;
assign      m_aximm_wvalid               =     mm_act2conv_wvalid               ;
assign      m_aximm_bready               =     mm_act2conv_bready               ;
assign      m_aximm_arid                 =     mm_act2conv_arid                 ;
assign      m_aximm_araddr               =     mm_act2conv_araddr               ;
assign      m_aximm_arlen                =     mm_act2conv_arlen                ;
assign      m_aximm_arsize               =     mm_act2conv_arsize               ;
assign      m_aximm_arburst              =     mm_act2conv_arburst              ;
assign      m_aximm_aruser               =     mm_act2conv_aruser               ;
assign      m_aximm_arlock               =     mm_act2conv_arlock               ;
assign      m_aximm_arcache              =     mm_act2conv_arcache              ;
assign      m_aximm_arprot               =     mm_act2conv_arprot               ;
assign      m_aximm_arqos                =     mm_act2conv_arqos                ;
assign      m_aximm_arregion             =     mm_act2conv_arregion             ;
assign      m_aximm_arvalid              =     mm_act2conv_arvalid              ;
assign      m_aximm_rready               =     mm_act2conv_rready               ;
  `endif
`endif
`endif  // endif for ifndef ENABLE_ODMA

`ifndef ENABLE_ODMA
// Bridge Mode action_wrapper
//
  action_wrapper action_w
     (
      .ap_clk                             ( clock_act                  ) ,
      .ap_rst_n                           ( ~reset_action_q            ) ,
      .interrupt_ack                      ( action_int_req_ack         ) ,
      .interrupt                          ( action_int_req             ) ,
      .interrupt_src                      ( action_int_src             ) ,
      .interrupt_ctx                      ( action_int_ctx             ) ,

// If DDR or DDR replaced by BRAM 
`ifdef ENABLE_AXI_CARD_MEM
`ifndef ENABLE_HBM
      //
      // AXI card memory Interface
      .m_axi_card_mem0_araddr             ( act_axi_card_mem0_araddr   ) ,
      .m_axi_card_mem0_arburst            ( act_axi_card_mem0_arburst  ) ,
      .m_axi_card_mem0_arcache            ( act_axi_card_mem0_arcache  ) ,
      .m_axi_card_mem0_arid               ( act_axi_card_mem0_arid     ) ,
      .m_axi_card_mem0_arlen              ( act_axi_card_mem0_arlen    ) ,
      .m_axi_card_mem0_arlock             ( act_axi_card_mem0_arlock   ) ,
      .m_axi_card_mem0_arprot             ( act_axi_card_mem0_arprot   ) ,
      .m_axi_card_mem0_arqos              ( act_axi_card_mem0_arqos    ) ,
      .m_axi_card_mem0_arready            ( act_axi_card_mem0_arready  ) ,
      .m_axi_card_mem0_arregion           ( act_axi_card_mem0_arregion ) ,
      .m_axi_card_mem0_arsize             ( act_axi_card_mem0_arsize   ) ,
      .m_axi_card_mem0_aruser             (                            ) ,
      .m_axi_card_mem0_arvalid            ( act_axi_card_mem0_arvalid  ) ,
      .m_axi_card_mem0_awaddr             ( act_axi_card_mem0_awaddr   ) ,
      .m_axi_card_mem0_awburst            ( act_axi_card_mem0_awburst  ) ,
      .m_axi_card_mem0_awcache            ( act_axi_card_mem0_awcache  ) ,
      .m_axi_card_mem0_awid               ( act_axi_card_mem0_awid     ) ,
      .m_axi_card_mem0_awlen              ( act_axi_card_mem0_awlen    ) ,
      .m_axi_card_mem0_awlock             ( act_axi_card_mem0_awlock   ) ,
      .m_axi_card_mem0_awprot             ( act_axi_card_mem0_awprot   ) ,
      .m_axi_card_mem0_awqos              ( act_axi_card_mem0_awqos    ) ,
      .m_axi_card_mem0_awready            ( act_axi_card_mem0_awready  ) ,
      .m_axi_card_mem0_awregion           ( act_axi_card_mem0_awregion ) ,
      .m_axi_card_mem0_awsize             ( act_axi_card_mem0_awsize   ) ,
      .m_axi_card_mem0_awuser             (                            ) ,
      .m_axi_card_mem0_awvalid            ( act_axi_card_mem0_awvalid  ) ,
      .m_axi_card_mem0_bid                ( act_axi_card_mem0_bid      ) ,
      .m_axi_card_mem0_bready             ( act_axi_card_mem0_bready   ) ,
      .m_axi_card_mem0_bresp              ( act_axi_card_mem0_bresp    ) ,
      .m_axi_card_mem0_buser              (1'b0                        ) ,
      .m_axi_card_mem0_bvalid             ( act_axi_card_mem0_bvalid   ) ,
      .m_axi_card_mem0_rdata              ( act_axi_card_mem0_rdata    ) ,
      .m_axi_card_mem0_rid                ( act_axi_card_mem0_rid      ) ,
      .m_axi_card_mem0_rlast              ( act_axi_card_mem0_rlast    ) ,
      .m_axi_card_mem0_rready             ( act_axi_card_mem0_rready   ) ,
      .m_axi_card_mem0_rresp              ( act_axi_card_mem0_rresp    ) ,
      .m_axi_card_mem0_ruser              (1'b0                        ) ,
      .m_axi_card_mem0_rvalid             ( act_axi_card_mem0_rvalid   ) ,
      .m_axi_card_mem0_wdata              ( act_axi_card_mem0_wdata    ) ,
      .m_axi_card_mem0_wlast              ( act_axi_card_mem0_wlast    ) ,
      .m_axi_card_mem0_wready             ( act_axi_card_mem0_wready   ) ,
      .m_axi_card_mem0_wstrb              ( act_axi_card_mem0_wstrb    ) ,
      .m_axi_card_mem0_wuser              (                            ) ,
      .m_axi_card_mem0_wvalid             ( act_axi_card_mem0_wvalid   ) ,
`else
// If HBM
      //
      // AXI HBM memory Interface
      `ifdef HBM_AXI_IF_P0
      .m_axi_card_hbm_p0_araddr             ( act_axi_card_hbm_p0_araddr   ) ,
      .m_axi_card_hbm_p0_arburst            ( act_axi_card_hbm_p0_arburst  ) ,
      .m_axi_card_hbm_p0_arcache            ( act_axi_card_hbm_p0_arcache  ) ,
      .m_axi_card_hbm_p0_arid               ( act_axi_card_hbm_p0_arid     ) ,
      .m_axi_card_hbm_p0_arlen              ( act_axi_card_hbm_p0_arlen    ) ,
      .m_axi_card_hbm_p0_arlock             ( act_axi_card_hbm_p0_arlock   ) ,
      .m_axi_card_hbm_p0_arprot             ( act_axi_card_hbm_p0_arprot   ) ,
      .m_axi_card_hbm_p0_arqos              ( act_axi_card_hbm_p0_arqos    ) ,
      .m_axi_card_hbm_p0_arready            ( act_axi_card_hbm_p0_arready  ) ,
      .m_axi_card_hbm_p0_arregion           ( act_axi_card_hbm_p0_arregion ) ,
      .m_axi_card_hbm_p0_arsize             ( act_axi_card_hbm_p0_arsize   ) ,
      .m_axi_card_hbm_p0_aruser             (                            ) ,
      .m_axi_card_hbm_p0_arvalid            ( act_axi_card_hbm_p0_arvalid  ) ,
      .m_axi_card_hbm_p0_awaddr             ( act_axi_card_hbm_p0_awaddr   ) ,
      .m_axi_card_hbm_p0_awburst            ( act_axi_card_hbm_p0_awburst  ) ,
      .m_axi_card_hbm_p0_awcache            ( act_axi_card_hbm_p0_awcache  ) ,
      .m_axi_card_hbm_p0_awid               ( act_axi_card_hbm_p0_awid     ) ,
      .m_axi_card_hbm_p0_awlen              ( act_axi_card_hbm_p0_awlen    ) ,
      .m_axi_card_hbm_p0_awlock             ( act_axi_card_hbm_p0_awlock   ) ,
      .m_axi_card_hbm_p0_awprot             ( act_axi_card_hbm_p0_awprot   ) ,
      .m_axi_card_hbm_p0_awqos              ( act_axi_card_hbm_p0_awqos    ) ,
      .m_axi_card_hbm_p0_awready            ( act_axi_card_hbm_p0_awready  ) ,
      .m_axi_card_hbm_p0_awregion           ( act_axi_card_hbm_p0_awregion ) ,
      .m_axi_card_hbm_p0_awsize             ( act_axi_card_hbm_p0_awsize   ) ,
      .m_axi_card_hbm_p0_awuser             (                            ) ,
      .m_axi_card_hbm_p0_awvalid            ( act_axi_card_hbm_p0_awvalid  ) ,
      .m_axi_card_hbm_p0_bid                ( act_axi_card_hbm_p0_bid      ) ,
      .m_axi_card_hbm_p0_bready             ( act_axi_card_hbm_p0_bready   ) ,
      .m_axi_card_hbm_p0_bresp              ( act_axi_card_hbm_p0_bresp    ) ,
      .m_axi_card_hbm_p0_buser              (1'b0                        ) ,
      .m_axi_card_hbm_p0_bvalid             ( act_axi_card_hbm_p0_bvalid   ) ,
      .m_axi_card_hbm_p0_rdata              ( act_axi_card_hbm_p0_rdata    ) ,
      .m_axi_card_hbm_p0_rid                ( act_axi_card_hbm_p0_rid      ) ,
      .m_axi_card_hbm_p0_rlast              ( act_axi_card_hbm_p0_rlast    ) ,
      .m_axi_card_hbm_p0_rready             ( act_axi_card_hbm_p0_rready   ) ,
      .m_axi_card_hbm_p0_rresp              ( act_axi_card_hbm_p0_rresp    ) ,
      .m_axi_card_hbm_p0_ruser              (1'b0                        ) ,
      .m_axi_card_hbm_p0_rvalid             ( act_axi_card_hbm_p0_rvalid   ) ,
      .m_axi_card_hbm_p0_wdata              ( act_axi_card_hbm_p0_wdata    ) ,
      .m_axi_card_hbm_p0_wlast              ( act_axi_card_hbm_p0_wlast    ) ,
      .m_axi_card_hbm_p0_wready             ( act_axi_card_hbm_p0_wready   ) ,
      .m_axi_card_hbm_p0_wstrb              ( act_axi_card_hbm_p0_wstrb    ) ,
      .m_axi_card_hbm_p0_wuser              (                            ) ,
      .m_axi_card_hbm_p0_wvalid             ( act_axi_card_hbm_p0_wvalid   ) ,
      `endif

      `ifdef HBM_AXI_IF_P1
      .m_axi_card_hbm_p1_araddr             ( act_axi_card_hbm_p1_araddr   ) ,
      .m_axi_card_hbm_p1_arburst            ( act_axi_card_hbm_p1_arburst  ) ,
      .m_axi_card_hbm_p1_arcache            ( act_axi_card_hbm_p1_arcache  ) ,
      .m_axi_card_hbm_p1_arid               ( act_axi_card_hbm_p1_arid     ) ,
      .m_axi_card_hbm_p1_arlen              ( act_axi_card_hbm_p1_arlen    ) ,
      .m_axi_card_hbm_p1_arlock             ( act_axi_card_hbm_p1_arlock   ) ,
      .m_axi_card_hbm_p1_arprot             ( act_axi_card_hbm_p1_arprot   ) ,
      .m_axi_card_hbm_p1_arqos              ( act_axi_card_hbm_p1_arqos    ) ,
      .m_axi_card_hbm_p1_arready            ( act_axi_card_hbm_p1_arready  ) ,
      .m_axi_card_hbm_p1_arregion           ( act_axi_card_hbm_p1_arregion ) ,
      .m_axi_card_hbm_p1_arsize             ( act_axi_card_hbm_p1_arsize   ) ,
      .m_axi_card_hbm_p1_aruser             (                            ) ,
      .m_axi_card_hbm_p1_arvalid            ( act_axi_card_hbm_p1_arvalid  ) ,
      .m_axi_card_hbm_p1_awaddr             ( act_axi_card_hbm_p1_awaddr   ) ,
      .m_axi_card_hbm_p1_awburst            ( act_axi_card_hbm_p1_awburst  ) ,
      .m_axi_card_hbm_p1_awcache            ( act_axi_card_hbm_p1_awcache  ) ,
      .m_axi_card_hbm_p1_awid               ( act_axi_card_hbm_p1_awid     ) ,
      .m_axi_card_hbm_p1_awlen              ( act_axi_card_hbm_p1_awlen    ) ,
      .m_axi_card_hbm_p1_awlock             ( act_axi_card_hbm_p1_awlock   ) ,
      .m_axi_card_hbm_p1_awprot             ( act_axi_card_hbm_p1_awprot   ) ,
      .m_axi_card_hbm_p1_awqos              ( act_axi_card_hbm_p1_awqos    ) ,
      .m_axi_card_hbm_p1_awready            ( act_axi_card_hbm_p1_awready  ) ,
      .m_axi_card_hbm_p1_awregion           ( act_axi_card_hbm_p1_awregion ) ,
      .m_axi_card_hbm_p1_awsize             ( act_axi_card_hbm_p1_awsize   ) ,
      .m_axi_card_hbm_p1_awuser             (                            ) ,
      .m_axi_card_hbm_p1_awvalid            ( act_axi_card_hbm_p1_awvalid  ) ,
      .m_axi_card_hbm_p1_bid                ( act_axi_card_hbm_p1_bid      ) ,
      .m_axi_card_hbm_p1_bready             ( act_axi_card_hbm_p1_bready   ) ,
      .m_axi_card_hbm_p1_bresp              ( act_axi_card_hbm_p1_bresp    ) ,
      .m_axi_card_hbm_p1_buser              (1'b0                        ) ,
      .m_axi_card_hbm_p1_bvalid             ( act_axi_card_hbm_p1_bvalid   ) ,
      .m_axi_card_hbm_p1_rdata              ( act_axi_card_hbm_p1_rdata    ) ,
      .m_axi_card_hbm_p1_rid                ( act_axi_card_hbm_p1_rid      ) ,
      .m_axi_card_hbm_p1_rlast              ( act_axi_card_hbm_p1_rlast    ) ,
      .m_axi_card_hbm_p1_rready             ( act_axi_card_hbm_p1_rready   ) ,
      .m_axi_card_hbm_p1_rresp              ( act_axi_card_hbm_p1_rresp    ) ,
      .m_axi_card_hbm_p1_ruser              (1'b0                        ) ,
      .m_axi_card_hbm_p1_rvalid             ( act_axi_card_hbm_p1_rvalid   ) ,
      .m_axi_card_hbm_p1_wdata              ( act_axi_card_hbm_p1_wdata    ) ,
      .m_axi_card_hbm_p1_wlast              ( act_axi_card_hbm_p1_wlast    ) ,
      .m_axi_card_hbm_p1_wready             ( act_axi_card_hbm_p1_wready   ) ,
      .m_axi_card_hbm_p1_wstrb              ( act_axi_card_hbm_p1_wstrb    ) ,
      .m_axi_card_hbm_p1_wuser              (                            ) ,
      .m_axi_card_hbm_p1_wvalid             ( act_axi_card_hbm_p1_wvalid   ) ,
      `endif

      `ifdef HBM_AXI_IF_P2
      .m_axi_card_hbm_p2_araddr             ( act_axi_card_hbm_p2_araddr   ) ,
      .m_axi_card_hbm_p2_arburst            ( act_axi_card_hbm_p2_arburst  ) ,
      .m_axi_card_hbm_p2_arcache            ( act_axi_card_hbm_p2_arcache  ) ,
      .m_axi_card_hbm_p2_arid               ( act_axi_card_hbm_p2_arid     ) ,
      .m_axi_card_hbm_p2_arlen              ( act_axi_card_hbm_p2_arlen    ) ,
      .m_axi_card_hbm_p2_arlock             ( act_axi_card_hbm_p2_arlock   ) ,
      .m_axi_card_hbm_p2_arprot             ( act_axi_card_hbm_p2_arprot   ) ,
      .m_axi_card_hbm_p2_arqos              ( act_axi_card_hbm_p2_arqos    ) ,
      .m_axi_card_hbm_p2_arready            ( act_axi_card_hbm_p2_arready  ) ,
      .m_axi_card_hbm_p2_arregion           ( act_axi_card_hbm_p2_arregion ) ,
      .m_axi_card_hbm_p2_arsize             ( act_axi_card_hbm_p2_arsize   ) ,
      .m_axi_card_hbm_p2_aruser             (                            ) ,
      .m_axi_card_hbm_p2_arvalid            ( act_axi_card_hbm_p2_arvalid  ) ,
      .m_axi_card_hbm_p2_awaddr             ( act_axi_card_hbm_p2_awaddr   ) ,
      .m_axi_card_hbm_p2_awburst            ( act_axi_card_hbm_p2_awburst  ) ,
      .m_axi_card_hbm_p2_awcache            ( act_axi_card_hbm_p2_awcache  ) ,
      .m_axi_card_hbm_p2_awid               ( act_axi_card_hbm_p2_awid     ) ,
      .m_axi_card_hbm_p2_awlen              ( act_axi_card_hbm_p2_awlen    ) ,
      .m_axi_card_hbm_p2_awlock             ( act_axi_card_hbm_p2_awlock   ) ,
      .m_axi_card_hbm_p2_awprot             ( act_axi_card_hbm_p2_awprot   ) ,
      .m_axi_card_hbm_p2_awqos              ( act_axi_card_hbm_p2_awqos    ) ,
      .m_axi_card_hbm_p2_awready            ( act_axi_card_hbm_p2_awready  ) ,
      .m_axi_card_hbm_p2_awregion           ( act_axi_card_hbm_p2_awregion ) ,
      .m_axi_card_hbm_p2_awsize             ( act_axi_card_hbm_p2_awsize   ) ,
      .m_axi_card_hbm_p2_awuser             (                            ) ,
      .m_axi_card_hbm_p2_awvalid            ( act_axi_card_hbm_p2_awvalid  ) ,
      .m_axi_card_hbm_p2_bid                ( act_axi_card_hbm_p2_bid      ) ,
      .m_axi_card_hbm_p2_bready             ( act_axi_card_hbm_p2_bready   ) ,
      .m_axi_card_hbm_p2_bresp              ( act_axi_card_hbm_p2_bresp    ) ,
      .m_axi_card_hbm_p2_buser              (1'b0                        ) ,
      .m_axi_card_hbm_p2_bvalid             ( act_axi_card_hbm_p2_bvalid   ) ,
      .m_axi_card_hbm_p2_rdata              ( act_axi_card_hbm_p2_rdata    ) ,
      .m_axi_card_hbm_p2_rid                ( act_axi_card_hbm_p2_rid      ) ,
      .m_axi_card_hbm_p2_rlast              ( act_axi_card_hbm_p2_rlast    ) ,
      .m_axi_card_hbm_p2_rready             ( act_axi_card_hbm_p2_rready   ) ,
      .m_axi_card_hbm_p2_rresp              ( act_axi_card_hbm_p2_rresp    ) ,
      .m_axi_card_hbm_p2_ruser              (1'b0                        ) ,
      .m_axi_card_hbm_p2_rvalid             ( act_axi_card_hbm_p2_rvalid   ) ,
      .m_axi_card_hbm_p2_wdata              ( act_axi_card_hbm_p2_wdata    ) ,
      .m_axi_card_hbm_p2_wlast              ( act_axi_card_hbm_p2_wlast    ) ,
      .m_axi_card_hbm_p2_wready             ( act_axi_card_hbm_p2_wready   ) ,
      .m_axi_card_hbm_p2_wstrb              ( act_axi_card_hbm_p2_wstrb    ) ,
      .m_axi_card_hbm_p2_wuser              (                            ) ,
      .m_axi_card_hbm_p2_wvalid             ( act_axi_card_hbm_p2_wvalid   ) ,
      `endif

      `ifdef HBM_AXI_IF_P3
      .m_axi_card_hbm_p3_araddr             ( act_axi_card_hbm_p3_araddr   ) ,
      .m_axi_card_hbm_p3_arburst            ( act_axi_card_hbm_p3_arburst  ) ,
      .m_axi_card_hbm_p3_arcache            ( act_axi_card_hbm_p3_arcache  ) ,
      .m_axi_card_hbm_p3_arid               ( act_axi_card_hbm_p3_arid     ) ,
      .m_axi_card_hbm_p3_arlen              ( act_axi_card_hbm_p3_arlen    ) ,
      .m_axi_card_hbm_p3_arlock             ( act_axi_card_hbm_p3_arlock   ) ,
      .m_axi_card_hbm_p3_arprot             ( act_axi_card_hbm_p3_arprot   ) ,
      .m_axi_card_hbm_p3_arqos              ( act_axi_card_hbm_p3_arqos    ) ,
      .m_axi_card_hbm_p3_arready            ( act_axi_card_hbm_p3_arready  ) ,
      .m_axi_card_hbm_p3_arregion           ( act_axi_card_hbm_p3_arregion ) ,
      .m_axi_card_hbm_p3_arsize             ( act_axi_card_hbm_p3_arsize   ) ,
      .m_axi_card_hbm_p3_aruser             (                            ) ,
      .m_axi_card_hbm_p3_arvalid            ( act_axi_card_hbm_p3_arvalid  ) ,
      .m_axi_card_hbm_p3_awaddr             ( act_axi_card_hbm_p3_awaddr   ) ,
      .m_axi_card_hbm_p3_awburst            ( act_axi_card_hbm_p3_awburst  ) ,
      .m_axi_card_hbm_p3_awcache            ( act_axi_card_hbm_p3_awcache  ) ,
      .m_axi_card_hbm_p3_awid               ( act_axi_card_hbm_p3_awid     ) ,
      .m_axi_card_hbm_p3_awlen              ( act_axi_card_hbm_p3_awlen    ) ,
      .m_axi_card_hbm_p3_awlock             ( act_axi_card_hbm_p3_awlock   ) ,
      .m_axi_card_hbm_p3_awprot             ( act_axi_card_hbm_p3_awprot   ) ,
      .m_axi_card_hbm_p3_awqos              ( act_axi_card_hbm_p3_awqos    ) ,
      .m_axi_card_hbm_p3_awready            ( act_axi_card_hbm_p3_awready  ) ,
      .m_axi_card_hbm_p3_awregion           ( act_axi_card_hbm_p3_awregion ) ,
      .m_axi_card_hbm_p3_awsize             ( act_axi_card_hbm_p3_awsize   ) ,
      .m_axi_card_hbm_p3_awuser             (                            ) ,
      .m_axi_card_hbm_p3_awvalid            ( act_axi_card_hbm_p3_awvalid  ) ,
      .m_axi_card_hbm_p3_bid                ( act_axi_card_hbm_p3_bid      ) ,
      .m_axi_card_hbm_p3_bready             ( act_axi_card_hbm_p3_bready   ) ,
      .m_axi_card_hbm_p3_bresp              ( act_axi_card_hbm_p3_bresp    ) ,
      .m_axi_card_hbm_p3_buser              (1'b0                        ) ,
      .m_axi_card_hbm_p3_bvalid             ( act_axi_card_hbm_p3_bvalid   ) ,
      .m_axi_card_hbm_p3_rdata              ( act_axi_card_hbm_p3_rdata    ) ,
      .m_axi_card_hbm_p3_rid                ( act_axi_card_hbm_p3_rid      ) ,
      .m_axi_card_hbm_p3_rlast              ( act_axi_card_hbm_p3_rlast    ) ,
      .m_axi_card_hbm_p3_rready             ( act_axi_card_hbm_p3_rready   ) ,
      .m_axi_card_hbm_p3_rresp              ( act_axi_card_hbm_p3_rresp    ) ,
      .m_axi_card_hbm_p3_ruser              (1'b0                        ) ,
      .m_axi_card_hbm_p3_rvalid             ( act_axi_card_hbm_p3_rvalid   ) ,
      .m_axi_card_hbm_p3_wdata              ( act_axi_card_hbm_p3_wdata    ) ,
      .m_axi_card_hbm_p3_wlast              ( act_axi_card_hbm_p3_wlast    ) ,
      .m_axi_card_hbm_p3_wready             ( act_axi_card_hbm_p3_wready   ) ,
      .m_axi_card_hbm_p3_wstrb              ( act_axi_card_hbm_p3_wstrb    ) ,
      .m_axi_card_hbm_p3_wuser              (                            ) ,
      .m_axi_card_hbm_p3_wvalid             ( act_axi_card_hbm_p3_wvalid   ) ,
      `endif

      `ifdef HBM_AXI_IF_P4
      .m_axi_card_hbm_p4_araddr             ( act_axi_card_hbm_p4_araddr   ) ,
      .m_axi_card_hbm_p4_arburst            ( act_axi_card_hbm_p4_arburst  ) ,
      .m_axi_card_hbm_p4_arcache            ( act_axi_card_hbm_p4_arcache  ) ,
      .m_axi_card_hbm_p4_arid               ( act_axi_card_hbm_p4_arid     ) ,
      .m_axi_card_hbm_p4_arlen              ( act_axi_card_hbm_p4_arlen    ) ,
      .m_axi_card_hbm_p4_arlock             ( act_axi_card_hbm_p4_arlock   ) ,
      .m_axi_card_hbm_p4_arprot             ( act_axi_card_hbm_p4_arprot   ) ,
      .m_axi_card_hbm_p4_arqos              ( act_axi_card_hbm_p4_arqos    ) ,
      .m_axi_card_hbm_p4_arready            ( act_axi_card_hbm_p4_arready  ) ,
      .m_axi_card_hbm_p4_arregion           ( act_axi_card_hbm_p4_arregion ) ,
      .m_axi_card_hbm_p4_arsize             ( act_axi_card_hbm_p4_arsize   ) ,
      .m_axi_card_hbm_p4_aruser             (                            ) ,
      .m_axi_card_hbm_p4_arvalid            ( act_axi_card_hbm_p4_arvalid  ) ,
      .m_axi_card_hbm_p4_awaddr             ( act_axi_card_hbm_p4_awaddr   ) ,
      .m_axi_card_hbm_p4_awburst            ( act_axi_card_hbm_p4_awburst  ) ,
      .m_axi_card_hbm_p4_awcache            ( act_axi_card_hbm_p4_awcache  ) ,
      .m_axi_card_hbm_p4_awid               ( act_axi_card_hbm_p4_awid     ) ,
      .m_axi_card_hbm_p4_awlen              ( act_axi_card_hbm_p4_awlen    ) ,
      .m_axi_card_hbm_p4_awlock             ( act_axi_card_hbm_p4_awlock   ) ,
      .m_axi_card_hbm_p4_awprot             ( act_axi_card_hbm_p4_awprot   ) ,
      .m_axi_card_hbm_p4_awqos              ( act_axi_card_hbm_p4_awqos    ) ,
      .m_axi_card_hbm_p4_awready            ( act_axi_card_hbm_p4_awready  ) ,
      .m_axi_card_hbm_p4_awregion           ( act_axi_card_hbm_p4_awregion ) ,
      .m_axi_card_hbm_p4_awsize             ( act_axi_card_hbm_p4_awsize   ) ,
      .m_axi_card_hbm_p4_awuser             (                            ) ,
      .m_axi_card_hbm_p4_awvalid            ( act_axi_card_hbm_p4_awvalid  ) ,
      .m_axi_card_hbm_p4_bid                ( act_axi_card_hbm_p4_bid      ) ,
      .m_axi_card_hbm_p4_bready             ( act_axi_card_hbm_p4_bready   ) ,
      .m_axi_card_hbm_p4_bresp              ( act_axi_card_hbm_p4_bresp    ) ,
      .m_axi_card_hbm_p4_buser              (1'b0                        ) ,
      .m_axi_card_hbm_p4_bvalid             ( act_axi_card_hbm_p4_bvalid   ) ,
      .m_axi_card_hbm_p4_rdata              ( act_axi_card_hbm_p4_rdata    ) ,
      .m_axi_card_hbm_p4_rid                ( act_axi_card_hbm_p4_rid      ) ,
      .m_axi_card_hbm_p4_rlast              ( act_axi_card_hbm_p4_rlast    ) ,
      .m_axi_card_hbm_p4_rready             ( act_axi_card_hbm_p4_rready   ) ,
      .m_axi_card_hbm_p4_rresp              ( act_axi_card_hbm_p4_rresp    ) ,
      .m_axi_card_hbm_p4_ruser              (1'b0                        ) ,
      .m_axi_card_hbm_p4_rvalid             ( act_axi_card_hbm_p4_rvalid   ) ,
      .m_axi_card_hbm_p4_wdata              ( act_axi_card_hbm_p4_wdata    ) ,
      .m_axi_card_hbm_p4_wlast              ( act_axi_card_hbm_p4_wlast    ) ,
      .m_axi_card_hbm_p4_wready             ( act_axi_card_hbm_p4_wready   ) ,
      .m_axi_card_hbm_p4_wstrb              ( act_axi_card_hbm_p4_wstrb    ) ,
      .m_axi_card_hbm_p4_wuser              (                            ) ,
      .m_axi_card_hbm_p4_wvalid             ( act_axi_card_hbm_p4_wvalid   ) ,
      `endif

      `ifdef HBM_AXI_IF_P5
      .m_axi_card_hbm_p5_araddr             ( act_axi_card_hbm_p5_araddr   ) ,
      .m_axi_card_hbm_p5_arburst            ( act_axi_card_hbm_p5_arburst  ) ,
      .m_axi_card_hbm_p5_arcache            ( act_axi_card_hbm_p5_arcache  ) ,
      .m_axi_card_hbm_p5_arid               ( act_axi_card_hbm_p5_arid     ) ,
      .m_axi_card_hbm_p5_arlen              ( act_axi_card_hbm_p5_arlen    ) ,
      .m_axi_card_hbm_p5_arlock             ( act_axi_card_hbm_p5_arlock   ) ,
      .m_axi_card_hbm_p5_arprot             ( act_axi_card_hbm_p5_arprot   ) ,
      .m_axi_card_hbm_p5_arqos              ( act_axi_card_hbm_p5_arqos    ) ,
      .m_axi_card_hbm_p5_arready            ( act_axi_card_hbm_p5_arready  ) ,
      .m_axi_card_hbm_p5_arregion           ( act_axi_card_hbm_p5_arregion ) ,
      .m_axi_card_hbm_p5_arsize             ( act_axi_card_hbm_p5_arsize   ) ,
      .m_axi_card_hbm_p5_aruser             (                            ) ,
      .m_axi_card_hbm_p5_arvalid            ( act_axi_card_hbm_p5_arvalid  ) ,
      .m_axi_card_hbm_p5_awaddr             ( act_axi_card_hbm_p5_awaddr   ) ,
      .m_axi_card_hbm_p5_awburst            ( act_axi_card_hbm_p5_awburst  ) ,
      .m_axi_card_hbm_p5_awcache            ( act_axi_card_hbm_p5_awcache  ) ,
      .m_axi_card_hbm_p5_awid               ( act_axi_card_hbm_p5_awid     ) ,
      .m_axi_card_hbm_p5_awlen              ( act_axi_card_hbm_p5_awlen    ) ,
      .m_axi_card_hbm_p5_awlock             ( act_axi_card_hbm_p5_awlock   ) ,
      .m_axi_card_hbm_p5_awprot             ( act_axi_card_hbm_p5_awprot   ) ,
      .m_axi_card_hbm_p5_awqos              ( act_axi_card_hbm_p5_awqos    ) ,
      .m_axi_card_hbm_p5_awready            ( act_axi_card_hbm_p5_awready  ) ,
      .m_axi_card_hbm_p5_awregion           ( act_axi_card_hbm_p5_awregion ) ,
      .m_axi_card_hbm_p5_awsize             ( act_axi_card_hbm_p5_awsize   ) ,
      .m_axi_card_hbm_p5_awuser             (                            ) ,
      .m_axi_card_hbm_p5_awvalid            ( act_axi_card_hbm_p5_awvalid  ) ,
      .m_axi_card_hbm_p5_bid                ( act_axi_card_hbm_p5_bid      ) ,
      .m_axi_card_hbm_p5_bready             ( act_axi_card_hbm_p5_bready   ) ,
      .m_axi_card_hbm_p5_bresp              ( act_axi_card_hbm_p5_bresp    ) ,
      .m_axi_card_hbm_p5_buser              (1'b0                        ) ,
      .m_axi_card_hbm_p5_bvalid             ( act_axi_card_hbm_p5_bvalid   ) ,
      .m_axi_card_hbm_p5_rdata              ( act_axi_card_hbm_p5_rdata    ) ,
      .m_axi_card_hbm_p5_rid                ( act_axi_card_hbm_p5_rid      ) ,
      .m_axi_card_hbm_p5_rlast              ( act_axi_card_hbm_p5_rlast    ) ,
      .m_axi_card_hbm_p5_rready             ( act_axi_card_hbm_p5_rready   ) ,
      .m_axi_card_hbm_p5_rresp              ( act_axi_card_hbm_p5_rresp    ) ,
      .m_axi_card_hbm_p5_ruser              (1'b0                        ) ,
      .m_axi_card_hbm_p5_rvalid             ( act_axi_card_hbm_p5_rvalid   ) ,
      .m_axi_card_hbm_p5_wdata              ( act_axi_card_hbm_p5_wdata    ) ,
      .m_axi_card_hbm_p5_wlast              ( act_axi_card_hbm_p5_wlast    ) ,
      .m_axi_card_hbm_p5_wready             ( act_axi_card_hbm_p5_wready   ) ,
      .m_axi_card_hbm_p5_wstrb              ( act_axi_card_hbm_p5_wstrb    ) ,
      .m_axi_card_hbm_p5_wuser              (                            ) ,
      .m_axi_card_hbm_p5_wvalid             ( act_axi_card_hbm_p5_wvalid   ) ,
      `endif

      `ifdef HBM_AXI_IF_P6
      .m_axi_card_hbm_p6_araddr             ( act_axi_card_hbm_p6_araddr   ) ,
      .m_axi_card_hbm_p6_arburst            ( act_axi_card_hbm_p6_arburst  ) ,
      .m_axi_card_hbm_p6_arcache            ( act_axi_card_hbm_p6_arcache  ) ,
      .m_axi_card_hbm_p6_arid               ( act_axi_card_hbm_p6_arid     ) ,
      .m_axi_card_hbm_p6_arlen              ( act_axi_card_hbm_p6_arlen    ) ,
      .m_axi_card_hbm_p6_arlock             ( act_axi_card_hbm_p6_arlock   ) ,
      .m_axi_card_hbm_p6_arprot             ( act_axi_card_hbm_p6_arprot   ) ,
      .m_axi_card_hbm_p6_arqos              ( act_axi_card_hbm_p6_arqos    ) ,
      .m_axi_card_hbm_p6_arready            ( act_axi_card_hbm_p6_arready  ) ,
      .m_axi_card_hbm_p6_arregion           ( act_axi_card_hbm_p6_arregion ) ,
      .m_axi_card_hbm_p6_arsize             ( act_axi_card_hbm_p6_arsize   ) ,
      .m_axi_card_hbm_p6_aruser             (                            ) ,
      .m_axi_card_hbm_p6_arvalid            ( act_axi_card_hbm_p6_arvalid  ) ,
      .m_axi_card_hbm_p6_awaddr             ( act_axi_card_hbm_p6_awaddr   ) ,
      .m_axi_card_hbm_p6_awburst            ( act_axi_card_hbm_p6_awburst  ) ,
      .m_axi_card_hbm_p6_awcache            ( act_axi_card_hbm_p6_awcache  ) ,
      .m_axi_card_hbm_p6_awid               ( act_axi_card_hbm_p6_awid     ) ,
      .m_axi_card_hbm_p6_awlen              ( act_axi_card_hbm_p6_awlen    ) ,
      .m_axi_card_hbm_p6_awlock             ( act_axi_card_hbm_p6_awlock   ) ,
      .m_axi_card_hbm_p6_awprot             ( act_axi_card_hbm_p6_awprot   ) ,
      .m_axi_card_hbm_p6_awqos              ( act_axi_card_hbm_p6_awqos    ) ,
      .m_axi_card_hbm_p6_awready            ( act_axi_card_hbm_p6_awready  ) ,
      .m_axi_card_hbm_p6_awregion           ( act_axi_card_hbm_p6_awregion ) ,
      .m_axi_card_hbm_p6_awsize             ( act_axi_card_hbm_p6_awsize   ) ,
      .m_axi_card_hbm_p6_awuser             (                            ) ,
      .m_axi_card_hbm_p6_awvalid            ( act_axi_card_hbm_p6_awvalid  ) ,
      .m_axi_card_hbm_p6_bid                ( act_axi_card_hbm_p6_bid      ) ,
      .m_axi_card_hbm_p6_bready             ( act_axi_card_hbm_p6_bready   ) ,
      .m_axi_card_hbm_p6_bresp              ( act_axi_card_hbm_p6_bresp    ) ,
      .m_axi_card_hbm_p6_buser              (1'b0                        ) ,
      .m_axi_card_hbm_p6_bvalid             ( act_axi_card_hbm_p6_bvalid   ) ,
      .m_axi_card_hbm_p6_rdata              ( act_axi_card_hbm_p6_rdata    ) ,
      .m_axi_card_hbm_p6_rid                ( act_axi_card_hbm_p6_rid      ) ,
      .m_axi_card_hbm_p6_rlast              ( act_axi_card_hbm_p6_rlast    ) ,
      .m_axi_card_hbm_p6_rready             ( act_axi_card_hbm_p6_rready   ) ,
      .m_axi_card_hbm_p6_rresp              ( act_axi_card_hbm_p6_rresp    ) ,
      .m_axi_card_hbm_p6_ruser              (1'b0                        ) ,
      .m_axi_card_hbm_p6_rvalid             ( act_axi_card_hbm_p6_rvalid   ) ,
      .m_axi_card_hbm_p6_wdata              ( act_axi_card_hbm_p6_wdata    ) ,
      .m_axi_card_hbm_p6_wlast              ( act_axi_card_hbm_p6_wlast    ) ,
      .m_axi_card_hbm_p6_wready             ( act_axi_card_hbm_p6_wready   ) ,
      .m_axi_card_hbm_p6_wstrb              ( act_axi_card_hbm_p6_wstrb    ) ,
      .m_axi_card_hbm_p6_wuser              (                            ) ,
      .m_axi_card_hbm_p6_wvalid             ( act_axi_card_hbm_p6_wvalid   ) ,
      `endif

      `ifdef HBM_AXI_IF_P7
      .m_axi_card_hbm_p7_araddr             ( act_axi_card_hbm_p7_araddr   ) ,
      .m_axi_card_hbm_p7_arburst            ( act_axi_card_hbm_p7_arburst  ) ,
      .m_axi_card_hbm_p7_arcache            ( act_axi_card_hbm_p7_arcache  ) ,
      .m_axi_card_hbm_p7_arid               ( act_axi_card_hbm_p7_arid     ) ,
      .m_axi_card_hbm_p7_arlen              ( act_axi_card_hbm_p7_arlen    ) ,
      .m_axi_card_hbm_p7_arlock             ( act_axi_card_hbm_p7_arlock   ) ,
      .m_axi_card_hbm_p7_arprot             ( act_axi_card_hbm_p7_arprot   ) ,
      .m_axi_card_hbm_p7_arqos              ( act_axi_card_hbm_p7_arqos    ) ,
      .m_axi_card_hbm_p7_arready            ( act_axi_card_hbm_p7_arready  ) ,
      .m_axi_card_hbm_p7_arregion           ( act_axi_card_hbm_p7_arregion ) ,
      .m_axi_card_hbm_p7_arsize             ( act_axi_card_hbm_p7_arsize   ) ,
      .m_axi_card_hbm_p7_aruser             (                            ) ,
      .m_axi_card_hbm_p7_arvalid            ( act_axi_card_hbm_p7_arvalid  ) ,
      .m_axi_card_hbm_p7_awaddr             ( act_axi_card_hbm_p7_awaddr   ) ,
      .m_axi_card_hbm_p7_awburst            ( act_axi_card_hbm_p7_awburst  ) ,
      .m_axi_card_hbm_p7_awcache            ( act_axi_card_hbm_p7_awcache  ) ,
      .m_axi_card_hbm_p7_awid               ( act_axi_card_hbm_p7_awid     ) ,
      .m_axi_card_hbm_p7_awlen              ( act_axi_card_hbm_p7_awlen    ) ,
      .m_axi_card_hbm_p7_awlock             ( act_axi_card_hbm_p7_awlock   ) ,
      .m_axi_card_hbm_p7_awprot             ( act_axi_card_hbm_p7_awprot   ) ,
      .m_axi_card_hbm_p7_awqos              ( act_axi_card_hbm_p7_awqos    ) ,
      .m_axi_card_hbm_p7_awready            ( act_axi_card_hbm_p7_awready  ) ,
      .m_axi_card_hbm_p7_awregion           ( act_axi_card_hbm_p7_awregion ) ,
      .m_axi_card_hbm_p7_awsize             ( act_axi_card_hbm_p7_awsize   ) ,
      .m_axi_card_hbm_p7_awuser             (                            ) ,
      .m_axi_card_hbm_p7_awvalid            ( act_axi_card_hbm_p7_awvalid  ) ,
      .m_axi_card_hbm_p7_bid                ( act_axi_card_hbm_p7_bid      ) ,
      .m_axi_card_hbm_p7_bready             ( act_axi_card_hbm_p7_bready   ) ,
      .m_axi_card_hbm_p7_bresp              ( act_axi_card_hbm_p7_bresp    ) ,
      .m_axi_card_hbm_p7_buser              (1'b0                        ) ,
      .m_axi_card_hbm_p7_bvalid             ( act_axi_card_hbm_p7_bvalid   ) ,
      .m_axi_card_hbm_p7_rdata              ( act_axi_card_hbm_p7_rdata    ) ,
      .m_axi_card_hbm_p7_rid                ( act_axi_card_hbm_p7_rid      ) ,
      .m_axi_card_hbm_p7_rlast              ( act_axi_card_hbm_p7_rlast    ) ,
      .m_axi_card_hbm_p7_rready             ( act_axi_card_hbm_p7_rready   ) ,
      .m_axi_card_hbm_p7_rresp              ( act_axi_card_hbm_p7_rresp    ) ,
      .m_axi_card_hbm_p7_ruser              (1'b0                        ) ,
      .m_axi_card_hbm_p7_rvalid             ( act_axi_card_hbm_p7_rvalid   ) ,
      .m_axi_card_hbm_p7_wdata              ( act_axi_card_hbm_p7_wdata    ) ,
      .m_axi_card_hbm_p7_wlast              ( act_axi_card_hbm_p7_wlast    ) ,
      .m_axi_card_hbm_p7_wready             ( act_axi_card_hbm_p7_wready   ) ,
      .m_axi_card_hbm_p7_wstrb              ( act_axi_card_hbm_p7_wstrb    ) ,
      .m_axi_card_hbm_p7_wuser              (                            ) ,
      .m_axi_card_hbm_p7_wvalid             ( act_axi_card_hbm_p7_wvalid   ) ,
      `endif

      `ifdef HBM_AXI_IF_P8
      .m_axi_card_hbm_p8_araddr             ( act_axi_card_hbm_p8_araddr   ) ,
      .m_axi_card_hbm_p8_arburst            ( act_axi_card_hbm_p8_arburst  ) ,
      .m_axi_card_hbm_p8_arcache            ( act_axi_card_hbm_p8_arcache  ) ,
      .m_axi_card_hbm_p8_arid               ( act_axi_card_hbm_p8_arid     ) ,
      .m_axi_card_hbm_p8_arlen              ( act_axi_card_hbm_p8_arlen    ) ,
      .m_axi_card_hbm_p8_arlock             ( act_axi_card_hbm_p8_arlock   ) ,
      .m_axi_card_hbm_p8_arprot             ( act_axi_card_hbm_p8_arprot   ) ,
      .m_axi_card_hbm_p8_arqos              ( act_axi_card_hbm_p8_arqos    ) ,
      .m_axi_card_hbm_p8_arready            ( act_axi_card_hbm_p8_arready  ) ,
      .m_axi_card_hbm_p8_arregion           ( act_axi_card_hbm_p8_arregion ) ,
      .m_axi_card_hbm_p8_arsize             ( act_axi_card_hbm_p8_arsize   ) ,
      .m_axi_card_hbm_p8_aruser             (                            ) ,
      .m_axi_card_hbm_p8_arvalid            ( act_axi_card_hbm_p8_arvalid  ) ,
      .m_axi_card_hbm_p8_awaddr             ( act_axi_card_hbm_p8_awaddr   ) ,
      .m_axi_card_hbm_p8_awburst            ( act_axi_card_hbm_p8_awburst  ) ,
      .m_axi_card_hbm_p8_awcache            ( act_axi_card_hbm_p8_awcache  ) ,
      .m_axi_card_hbm_p8_awid               ( act_axi_card_hbm_p8_awid     ) ,
      .m_axi_card_hbm_p8_awlen              ( act_axi_card_hbm_p8_awlen    ) ,
      .m_axi_card_hbm_p8_awlock             ( act_axi_card_hbm_p8_awlock   ) ,
      .m_axi_card_hbm_p8_awprot             ( act_axi_card_hbm_p8_awprot   ) ,
      .m_axi_card_hbm_p8_awqos              ( act_axi_card_hbm_p8_awqos    ) ,
      .m_axi_card_hbm_p8_awready            ( act_axi_card_hbm_p8_awready  ) ,
      .m_axi_card_hbm_p8_awregion           ( act_axi_card_hbm_p8_awregion ) ,
      .m_axi_card_hbm_p8_awsize             ( act_axi_card_hbm_p8_awsize   ) ,
      .m_axi_card_hbm_p8_awuser             (                            ) ,
      .m_axi_card_hbm_p8_awvalid            ( act_axi_card_hbm_p8_awvalid  ) ,
      .m_axi_card_hbm_p8_bid                ( act_axi_card_hbm_p8_bid      ) ,
      .m_axi_card_hbm_p8_bready             ( act_axi_card_hbm_p8_bready   ) ,
      .m_axi_card_hbm_p8_bresp              ( act_axi_card_hbm_p8_bresp    ) ,
      .m_axi_card_hbm_p8_buser              (1'b0                        ) ,
      .m_axi_card_hbm_p8_bvalid             ( act_axi_card_hbm_p8_bvalid   ) ,
      .m_axi_card_hbm_p8_rdata              ( act_axi_card_hbm_p8_rdata    ) ,
      .m_axi_card_hbm_p8_rid                ( act_axi_card_hbm_p8_rid      ) ,
      .m_axi_card_hbm_p8_rlast              ( act_axi_card_hbm_p8_rlast    ) ,
      .m_axi_card_hbm_p8_rready             ( act_axi_card_hbm_p8_rready   ) ,
      .m_axi_card_hbm_p8_rresp              ( act_axi_card_hbm_p8_rresp    ) ,
      .m_axi_card_hbm_p8_ruser              (1'b0                        ) ,
      .m_axi_card_hbm_p8_rvalid             ( act_axi_card_hbm_p8_rvalid   ) ,
      .m_axi_card_hbm_p8_wdata              ( act_axi_card_hbm_p8_wdata    ) ,
      .m_axi_card_hbm_p8_wlast              ( act_axi_card_hbm_p8_wlast    ) ,
      .m_axi_card_hbm_p8_wready             ( act_axi_card_hbm_p8_wready   ) ,
      .m_axi_card_hbm_p8_wstrb              ( act_axi_card_hbm_p8_wstrb    ) ,
      .m_axi_card_hbm_p8_wuser              (                            ) ,
      .m_axi_card_hbm_p8_wvalid             ( act_axi_card_hbm_p8_wvalid   ) ,
      `endif

      `ifdef HBM_AXI_IF_P9
      .m_axi_card_hbm_p9_araddr             ( act_axi_card_hbm_p9_araddr   ) ,
      .m_axi_card_hbm_p9_arburst            ( act_axi_card_hbm_p9_arburst  ) ,
      .m_axi_card_hbm_p9_arcache            ( act_axi_card_hbm_p9_arcache  ) ,
      .m_axi_card_hbm_p9_arid               ( act_axi_card_hbm_p9_arid     ) ,
      .m_axi_card_hbm_p9_arlen              ( act_axi_card_hbm_p9_arlen    ) ,
      .m_axi_card_hbm_p9_arlock             ( act_axi_card_hbm_p9_arlock   ) ,
      .m_axi_card_hbm_p9_arprot             ( act_axi_card_hbm_p9_arprot   ) ,
      .m_axi_card_hbm_p9_arqos              ( act_axi_card_hbm_p9_arqos    ) ,
      .m_axi_card_hbm_p9_arready            ( act_axi_card_hbm_p9_arready  ) ,
      .m_axi_card_hbm_p9_arregion           ( act_axi_card_hbm_p9_arregion ) ,
      .m_axi_card_hbm_p9_arsize             ( act_axi_card_hbm_p9_arsize   ) ,
      .m_axi_card_hbm_p9_aruser             (                            ) ,
      .m_axi_card_hbm_p9_arvalid            ( act_axi_card_hbm_p9_arvalid  ) ,
      .m_axi_card_hbm_p9_awaddr             ( act_axi_card_hbm_p9_awaddr   ) ,
      .m_axi_card_hbm_p9_awburst            ( act_axi_card_hbm_p9_awburst  ) ,
      .m_axi_card_hbm_p9_awcache            ( act_axi_card_hbm_p9_awcache  ) ,
      .m_axi_card_hbm_p9_awid               ( act_axi_card_hbm_p9_awid     ) ,
      .m_axi_card_hbm_p9_awlen              ( act_axi_card_hbm_p9_awlen    ) ,
      .m_axi_card_hbm_p9_awlock             ( act_axi_card_hbm_p9_awlock   ) ,
      .m_axi_card_hbm_p9_awprot             ( act_axi_card_hbm_p9_awprot   ) ,
      .m_axi_card_hbm_p9_awqos              ( act_axi_card_hbm_p9_awqos    ) ,
      .m_axi_card_hbm_p9_awready            ( act_axi_card_hbm_p9_awready  ) ,
      .m_axi_card_hbm_p9_awregion           ( act_axi_card_hbm_p9_awregion ) ,
      .m_axi_card_hbm_p9_awsize             ( act_axi_card_hbm_p9_awsize   ) ,
      .m_axi_card_hbm_p9_awuser             (                            ) ,
      .m_axi_card_hbm_p9_awvalid            ( act_axi_card_hbm_p9_awvalid  ) ,
      .m_axi_card_hbm_p9_bid                ( act_axi_card_hbm_p9_bid      ) ,
      .m_axi_card_hbm_p9_bready             ( act_axi_card_hbm_p9_bready   ) ,
      .m_axi_card_hbm_p9_bresp              ( act_axi_card_hbm_p9_bresp    ) ,
      .m_axi_card_hbm_p9_buser              (1'b0                        ) ,
      .m_axi_card_hbm_p9_bvalid             ( act_axi_card_hbm_p9_bvalid   ) ,
      .m_axi_card_hbm_p9_rdata              ( act_axi_card_hbm_p9_rdata    ) ,
      .m_axi_card_hbm_p9_rid                ( act_axi_card_hbm_p9_rid      ) ,
      .m_axi_card_hbm_p9_rlast              ( act_axi_card_hbm_p9_rlast    ) ,
      .m_axi_card_hbm_p9_rready             ( act_axi_card_hbm_p9_rready   ) ,
      .m_axi_card_hbm_p9_rresp              ( act_axi_card_hbm_p9_rresp    ) ,
      .m_axi_card_hbm_p9_ruser              (1'b0                        ) ,
      .m_axi_card_hbm_p9_rvalid             ( act_axi_card_hbm_p9_rvalid   ) ,
      .m_axi_card_hbm_p9_wdata              ( act_axi_card_hbm_p9_wdata    ) ,
      .m_axi_card_hbm_p9_wlast              ( act_axi_card_hbm_p9_wlast    ) ,
      .m_axi_card_hbm_p9_wready             ( act_axi_card_hbm_p9_wready   ) ,
      .m_axi_card_hbm_p9_wstrb              ( act_axi_card_hbm_p9_wstrb    ) ,
      .m_axi_card_hbm_p9_wuser              (                            ) ,
      .m_axi_card_hbm_p9_wvalid             ( act_axi_card_hbm_p9_wvalid   ) ,
      `endif

      `ifdef HBM_AXI_IF_P10
      .m_axi_card_hbm_p10_araddr             ( act_axi_card_hbm_p10_araddr   ) ,
      .m_axi_card_hbm_p10_arburst            ( act_axi_card_hbm_p10_arburst  ) ,
      .m_axi_card_hbm_p10_arcache            ( act_axi_card_hbm_p10_arcache  ) ,
      .m_axi_card_hbm_p10_arid               ( act_axi_card_hbm_p10_arid     ) ,
      .m_axi_card_hbm_p10_arlen              ( act_axi_card_hbm_p10_arlen    ) ,
      .m_axi_card_hbm_p10_arlock             ( act_axi_card_hbm_p10_arlock   ) ,
      .m_axi_card_hbm_p10_arprot             ( act_axi_card_hbm_p10_arprot   ) ,
      .m_axi_card_hbm_p10_arqos              ( act_axi_card_hbm_p10_arqos    ) ,
      .m_axi_card_hbm_p10_arready            ( act_axi_card_hbm_p10_arready  ) ,
      .m_axi_card_hbm_p10_arregion           ( act_axi_card_hbm_p10_arregion ) ,
      .m_axi_card_hbm_p10_arsize             ( act_axi_card_hbm_p10_arsize   ) ,
      .m_axi_card_hbm_p10_aruser             (                            ) ,
      .m_axi_card_hbm_p10_arvalid            ( act_axi_card_hbm_p10_arvalid  ) ,
      .m_axi_card_hbm_p10_awaddr             ( act_axi_card_hbm_p10_awaddr   ) ,
      .m_axi_card_hbm_p10_awburst            ( act_axi_card_hbm_p10_awburst  ) ,
      .m_axi_card_hbm_p10_awcache            ( act_axi_card_hbm_p10_awcache  ) ,
      .m_axi_card_hbm_p10_awid               ( act_axi_card_hbm_p10_awid     ) ,
      .m_axi_card_hbm_p10_awlen              ( act_axi_card_hbm_p10_awlen    ) ,
      .m_axi_card_hbm_p10_awlock             ( act_axi_card_hbm_p10_awlock   ) ,
      .m_axi_card_hbm_p10_awprot             ( act_axi_card_hbm_p10_awprot   ) ,
      .m_axi_card_hbm_p10_awqos              ( act_axi_card_hbm_p10_awqos    ) ,
      .m_axi_card_hbm_p10_awready            ( act_axi_card_hbm_p10_awready  ) ,
      .m_axi_card_hbm_p10_awregion           ( act_axi_card_hbm_p10_awregion ) ,
      .m_axi_card_hbm_p10_awsize             ( act_axi_card_hbm_p10_awsize   ) ,
      .m_axi_card_hbm_p10_awuser             (                            ) ,
      .m_axi_card_hbm_p10_awvalid            ( act_axi_card_hbm_p10_awvalid  ) ,
      .m_axi_card_hbm_p10_bid                ( act_axi_card_hbm_p10_bid      ) ,
      .m_axi_card_hbm_p10_bready             ( act_axi_card_hbm_p10_bready   ) ,
      .m_axi_card_hbm_p10_bresp              ( act_axi_card_hbm_p10_bresp    ) ,
      .m_axi_card_hbm_p10_buser              (1'b0                        ) ,
      .m_axi_card_hbm_p10_bvalid             ( act_axi_card_hbm_p10_bvalid   ) ,
      .m_axi_card_hbm_p10_rdata              ( act_axi_card_hbm_p10_rdata    ) ,
      .m_axi_card_hbm_p10_rid                ( act_axi_card_hbm_p10_rid      ) ,
      .m_axi_card_hbm_p10_rlast              ( act_axi_card_hbm_p10_rlast    ) ,
      .m_axi_card_hbm_p10_rready             ( act_axi_card_hbm_p10_rready   ) ,
      .m_axi_card_hbm_p10_rresp              ( act_axi_card_hbm_p10_rresp    ) ,
      .m_axi_card_hbm_p10_ruser              (1'b0                        ) ,
      .m_axi_card_hbm_p10_rvalid             ( act_axi_card_hbm_p10_rvalid   ) ,
      .m_axi_card_hbm_p10_wdata              ( act_axi_card_hbm_p10_wdata    ) ,
      .m_axi_card_hbm_p10_wlast              ( act_axi_card_hbm_p10_wlast    ) ,
      .m_axi_card_hbm_p10_wready             ( act_axi_card_hbm_p10_wready   ) ,
      .m_axi_card_hbm_p10_wstrb              ( act_axi_card_hbm_p10_wstrb    ) ,
      .m_axi_card_hbm_p10_wuser              (                            ) ,
      .m_axi_card_hbm_p10_wvalid             ( act_axi_card_hbm_p10_wvalid   ) ,
      `endif

      `ifdef HBM_AXI_IF_P11
      .m_axi_card_hbm_p11_araddr             ( act_axi_card_hbm_p11_araddr   ) ,
      .m_axi_card_hbm_p11_arburst            ( act_axi_card_hbm_p11_arburst  ) ,
      .m_axi_card_hbm_p11_arcache            ( act_axi_card_hbm_p11_arcache  ) ,
      .m_axi_card_hbm_p11_arid               ( act_axi_card_hbm_p11_arid     ) ,
      .m_axi_card_hbm_p11_arlen              ( act_axi_card_hbm_p11_arlen    ) ,
      .m_axi_card_hbm_p11_arlock             ( act_axi_card_hbm_p11_arlock   ) ,
      .m_axi_card_hbm_p11_arprot             ( act_axi_card_hbm_p11_arprot   ) ,
      .m_axi_card_hbm_p11_arqos              ( act_axi_card_hbm_p11_arqos    ) ,
      .m_axi_card_hbm_p11_arready            ( act_axi_card_hbm_p11_arready  ) ,
      .m_axi_card_hbm_p11_arregion           ( act_axi_card_hbm_p11_arregion ) ,
      .m_axi_card_hbm_p11_arsize             ( act_axi_card_hbm_p11_arsize   ) ,
      .m_axi_card_hbm_p11_aruser             (                            ) ,
      .m_axi_card_hbm_p11_arvalid            ( act_axi_card_hbm_p11_arvalid  ) ,
      .m_axi_card_hbm_p11_awaddr             ( act_axi_card_hbm_p11_awaddr   ) ,
      .m_axi_card_hbm_p11_awburst            ( act_axi_card_hbm_p11_awburst  ) ,
      .m_axi_card_hbm_p11_awcache            ( act_axi_card_hbm_p11_awcache  ) ,
      .m_axi_card_hbm_p11_awid               ( act_axi_card_hbm_p11_awid     ) ,
      .m_axi_card_hbm_p11_awlen              ( act_axi_card_hbm_p11_awlen    ) ,
      .m_axi_card_hbm_p11_awlock             ( act_axi_card_hbm_p11_awlock   ) ,
      .m_axi_card_hbm_p11_awprot             ( act_axi_card_hbm_p11_awprot   ) ,
      .m_axi_card_hbm_p11_awqos              ( act_axi_card_hbm_p11_awqos    ) ,
      .m_axi_card_hbm_p11_awready            ( act_axi_card_hbm_p11_awready  ) ,
      .m_axi_card_hbm_p11_awregion           ( act_axi_card_hbm_p11_awregion ) ,
      .m_axi_card_hbm_p11_awsize             ( act_axi_card_hbm_p11_awsize   ) ,
      .m_axi_card_hbm_p11_awuser             (                            ) ,
      .m_axi_card_hbm_p11_awvalid            ( act_axi_card_hbm_p11_awvalid  ) ,
      .m_axi_card_hbm_p11_bid                ( act_axi_card_hbm_p11_bid      ) ,
      .m_axi_card_hbm_p11_bready             ( act_axi_card_hbm_p11_bready   ) ,
      .m_axi_card_hbm_p11_bresp              ( act_axi_card_hbm_p11_bresp    ) ,
      .m_axi_card_hbm_p11_buser              (1'b0                        ) ,
      .m_axi_card_hbm_p11_bvalid             ( act_axi_card_hbm_p11_bvalid   ) ,
      .m_axi_card_hbm_p11_rdata              ( act_axi_card_hbm_p11_rdata    ) ,
      .m_axi_card_hbm_p11_rid                ( act_axi_card_hbm_p11_rid      ) ,
      .m_axi_card_hbm_p11_rlast              ( act_axi_card_hbm_p11_rlast    ) ,
      .m_axi_card_hbm_p11_rready             ( act_axi_card_hbm_p11_rready   ) ,
      .m_axi_card_hbm_p11_rresp              ( act_axi_card_hbm_p11_rresp    ) ,
      .m_axi_card_hbm_p11_ruser              (1'b0                        ) ,
      .m_axi_card_hbm_p11_rvalid             ( act_axi_card_hbm_p11_rvalid   ) ,
      .m_axi_card_hbm_p11_wdata              ( act_axi_card_hbm_p11_wdata    ) ,
      .m_axi_card_hbm_p11_wlast              ( act_axi_card_hbm_p11_wlast    ) ,
      .m_axi_card_hbm_p11_wready             ( act_axi_card_hbm_p11_wready   ) ,
      .m_axi_card_hbm_p11_wstrb              ( act_axi_card_hbm_p11_wstrb    ) ,
      .m_axi_card_hbm_p11_wuser              (                            ) ,
      .m_axi_card_hbm_p11_wvalid             ( act_axi_card_hbm_p11_wvalid   ) ,
      `endif

      `ifdef HBM_AXI_IF_P12
      .m_axi_card_hbm_p12_araddr             ( act_axi_card_hbm_p12_araddr   ) ,
      .m_axi_card_hbm_p12_arburst            ( act_axi_card_hbm_p12_arburst  ) ,
      .m_axi_card_hbm_p12_arcache            ( act_axi_card_hbm_p12_arcache  ) ,
      .m_axi_card_hbm_p12_arid               ( act_axi_card_hbm_p12_arid     ) ,
      .m_axi_card_hbm_p12_arlen              ( act_axi_card_hbm_p12_arlen    ) ,
      .m_axi_card_hbm_p12_arlock             ( act_axi_card_hbm_p12_arlock   ) ,
      .m_axi_card_hbm_p12_arprot             ( act_axi_card_hbm_p12_arprot   ) ,
      .m_axi_card_hbm_p12_arqos              ( act_axi_card_hbm_p12_arqos    ) ,
      .m_axi_card_hbm_p12_arready            ( act_axi_card_hbm_p12_arready  ) ,
      .m_axi_card_hbm_p12_arregion           ( act_axi_card_hbm_p12_arregion ) ,
      .m_axi_card_hbm_p12_arsize             ( act_axi_card_hbm_p12_arsize   ) ,
      .m_axi_card_hbm_p12_aruser             (                            ) ,
      .m_axi_card_hbm_p12_arvalid            ( act_axi_card_hbm_p12_arvalid  ) ,
      .m_axi_card_hbm_p12_awaddr             ( act_axi_card_hbm_p12_awaddr   ) ,
      .m_axi_card_hbm_p12_awburst            ( act_axi_card_hbm_p12_awburst  ) ,
      .m_axi_card_hbm_p12_awcache            ( act_axi_card_hbm_p12_awcache  ) ,
      .m_axi_card_hbm_p12_awid               ( act_axi_card_hbm_p12_awid     ) ,
      .m_axi_card_hbm_p12_awlen              ( act_axi_card_hbm_p12_awlen    ) ,
      .m_axi_card_hbm_p12_awlock             ( act_axi_card_hbm_p12_awlock   ) ,
      .m_axi_card_hbm_p12_awprot             ( act_axi_card_hbm_p12_awprot   ) ,
      .m_axi_card_hbm_p12_awqos              ( act_axi_card_hbm_p12_awqos    ) ,
      .m_axi_card_hbm_p12_awready            ( act_axi_card_hbm_p12_awready  ) ,
      .m_axi_card_hbm_p12_awregion           ( act_axi_card_hbm_p12_awregion ) ,
      .m_axi_card_hbm_p12_awsize             ( act_axi_card_hbm_p12_awsize   ) ,
      .m_axi_card_hbm_p12_awuser             (                            ) ,
      .m_axi_card_hbm_p12_awvalid            ( act_axi_card_hbm_p12_awvalid  ) ,
      .m_axi_card_hbm_p12_bid                ( act_axi_card_hbm_p12_bid      ) ,
      .m_axi_card_hbm_p12_bready             ( act_axi_card_hbm_p12_bready   ) ,
      .m_axi_card_hbm_p12_bresp              ( act_axi_card_hbm_p12_bresp    ) ,
      .m_axi_card_hbm_p12_buser              (1'b0                        ) ,
      .m_axi_card_hbm_p12_bvalid             ( act_axi_card_hbm_p12_bvalid   ) ,
      .m_axi_card_hbm_p12_rdata              ( act_axi_card_hbm_p12_rdata    ) ,
      .m_axi_card_hbm_p12_rid                ( act_axi_card_hbm_p12_rid      ) ,
      .m_axi_card_hbm_p12_rlast              ( act_axi_card_hbm_p12_rlast    ) ,
      .m_axi_card_hbm_p12_rready             ( act_axi_card_hbm_p12_rready   ) ,
      .m_axi_card_hbm_p12_rresp              ( act_axi_card_hbm_p12_rresp    ) ,
      .m_axi_card_hbm_p12_ruser              (1'b0                        ) ,
      .m_axi_card_hbm_p12_rvalid             ( act_axi_card_hbm_p12_rvalid   ) ,
      .m_axi_card_hbm_p12_wdata              ( act_axi_card_hbm_p12_wdata    ) ,
      .m_axi_card_hbm_p12_wlast              ( act_axi_card_hbm_p12_wlast    ) ,
      .m_axi_card_hbm_p12_wready             ( act_axi_card_hbm_p12_wready   ) ,
      .m_axi_card_hbm_p12_wstrb              ( act_axi_card_hbm_p12_wstrb    ) ,
      .m_axi_card_hbm_p12_wuser              (                            ) ,
      .m_axi_card_hbm_p12_wvalid             ( act_axi_card_hbm_p12_wvalid   ) ,
      `endif

      `ifdef HBM_AXI_IF_P13
      .m_axi_card_hbm_p13_araddr             ( act_axi_card_hbm_p13_araddr   ) ,
      .m_axi_card_hbm_p13_arburst            ( act_axi_card_hbm_p13_arburst  ) ,
      .m_axi_card_hbm_p13_arcache            ( act_axi_card_hbm_p13_arcache  ) ,
      .m_axi_card_hbm_p13_arid               ( act_axi_card_hbm_p13_arid     ) ,
      .m_axi_card_hbm_p13_arlen              ( act_axi_card_hbm_p13_arlen    ) ,
      .m_axi_card_hbm_p13_arlock             ( act_axi_card_hbm_p13_arlock   ) ,
      .m_axi_card_hbm_p13_arprot             ( act_axi_card_hbm_p13_arprot   ) ,
      .m_axi_card_hbm_p13_arqos              ( act_axi_card_hbm_p13_arqos    ) ,
      .m_axi_card_hbm_p13_arready            ( act_axi_card_hbm_p13_arready  ) ,
      .m_axi_card_hbm_p13_arregion           ( act_axi_card_hbm_p13_arregion ) ,
      .m_axi_card_hbm_p13_arsize             ( act_axi_card_hbm_p13_arsize   ) ,
      .m_axi_card_hbm_p13_aruser             (                            ) ,
      .m_axi_card_hbm_p13_arvalid            ( act_axi_card_hbm_p13_arvalid  ) ,
      .m_axi_card_hbm_p13_awaddr             ( act_axi_card_hbm_p13_awaddr   ) ,
      .m_axi_card_hbm_p13_awburst            ( act_axi_card_hbm_p13_awburst  ) ,
      .m_axi_card_hbm_p13_awcache            ( act_axi_card_hbm_p13_awcache  ) ,
      .m_axi_card_hbm_p13_awid               ( act_axi_card_hbm_p13_awid     ) ,
      .m_axi_card_hbm_p13_awlen              ( act_axi_card_hbm_p13_awlen    ) ,
      .m_axi_card_hbm_p13_awlock             ( act_axi_card_hbm_p13_awlock   ) ,
      .m_axi_card_hbm_p13_awprot             ( act_axi_card_hbm_p13_awprot   ) ,
      .m_axi_card_hbm_p13_awqos              ( act_axi_card_hbm_p13_awqos    ) ,
      .m_axi_card_hbm_p13_awready            ( act_axi_card_hbm_p13_awready  ) ,
      .m_axi_card_hbm_p13_awregion           ( act_axi_card_hbm_p13_awregion ) ,
      .m_axi_card_hbm_p13_awsize             ( act_axi_card_hbm_p13_awsize   ) ,
      .m_axi_card_hbm_p13_awuser             (                            ) ,
      .m_axi_card_hbm_p13_awvalid            ( act_axi_card_hbm_p13_awvalid  ) ,
      .m_axi_card_hbm_p13_bid                ( act_axi_card_hbm_p13_bid      ) ,
      .m_axi_card_hbm_p13_bready             ( act_axi_card_hbm_p13_bready   ) ,
      .m_axi_card_hbm_p13_bresp              ( act_axi_card_hbm_p13_bresp    ) ,
      .m_axi_card_hbm_p13_buser              (1'b0                        ) ,
      .m_axi_card_hbm_p13_bvalid             ( act_axi_card_hbm_p13_bvalid   ) ,
      .m_axi_card_hbm_p13_rdata              ( act_axi_card_hbm_p13_rdata    ) ,
      .m_axi_card_hbm_p13_rid                ( act_axi_card_hbm_p13_rid      ) ,
      .m_axi_card_hbm_p13_rlast              ( act_axi_card_hbm_p13_rlast    ) ,
      .m_axi_card_hbm_p13_rready             ( act_axi_card_hbm_p13_rready   ) ,
      .m_axi_card_hbm_p13_rresp              ( act_axi_card_hbm_p13_rresp    ) ,
      .m_axi_card_hbm_p13_ruser              (1'b0                        ) ,
      .m_axi_card_hbm_p13_rvalid             ( act_axi_card_hbm_p13_rvalid   ) ,
      .m_axi_card_hbm_p13_wdata              ( act_axi_card_hbm_p13_wdata    ) ,
      .m_axi_card_hbm_p13_wlast              ( act_axi_card_hbm_p13_wlast    ) ,
      .m_axi_card_hbm_p13_wready             ( act_axi_card_hbm_p13_wready   ) ,
      .m_axi_card_hbm_p13_wstrb              ( act_axi_card_hbm_p13_wstrb    ) ,
      .m_axi_card_hbm_p13_wuser              (                            ) ,
      .m_axi_card_hbm_p13_wvalid             ( act_axi_card_hbm_p13_wvalid   ) ,
      `endif

      `ifdef HBM_AXI_IF_P14
      .m_axi_card_hbm_p14_araddr             ( act_axi_card_hbm_p14_araddr   ) ,
      .m_axi_card_hbm_p14_arburst            ( act_axi_card_hbm_p14_arburst  ) ,
      .m_axi_card_hbm_p14_arcache            ( act_axi_card_hbm_p14_arcache  ) ,
      .m_axi_card_hbm_p14_arid               ( act_axi_card_hbm_p14_arid     ) ,
      .m_axi_card_hbm_p14_arlen              ( act_axi_card_hbm_p14_arlen    ) ,
      .m_axi_card_hbm_p14_arlock             ( act_axi_card_hbm_p14_arlock   ) ,
      .m_axi_card_hbm_p14_arprot             ( act_axi_card_hbm_p14_arprot   ) ,
      .m_axi_card_hbm_p14_arqos              ( act_axi_card_hbm_p14_arqos    ) ,
      .m_axi_card_hbm_p14_arready            ( act_axi_card_hbm_p14_arready  ) ,
      .m_axi_card_hbm_p14_arregion           ( act_axi_card_hbm_p14_arregion ) ,
      .m_axi_card_hbm_p14_arsize             ( act_axi_card_hbm_p14_arsize   ) ,
      .m_axi_card_hbm_p14_aruser             (                            ) ,
      .m_axi_card_hbm_p14_arvalid            ( act_axi_card_hbm_p14_arvalid  ) ,
      .m_axi_card_hbm_p14_awaddr             ( act_axi_card_hbm_p14_awaddr   ) ,
      .m_axi_card_hbm_p14_awburst            ( act_axi_card_hbm_p14_awburst  ) ,
      .m_axi_card_hbm_p14_awcache            ( act_axi_card_hbm_p14_awcache  ) ,
      .m_axi_card_hbm_p14_awid               ( act_axi_card_hbm_p14_awid     ) ,
      .m_axi_card_hbm_p14_awlen              ( act_axi_card_hbm_p14_awlen    ) ,
      .m_axi_card_hbm_p14_awlock             ( act_axi_card_hbm_p14_awlock   ) ,
      .m_axi_card_hbm_p14_awprot             ( act_axi_card_hbm_p14_awprot   ) ,
      .m_axi_card_hbm_p14_awqos              ( act_axi_card_hbm_p14_awqos    ) ,
      .m_axi_card_hbm_p14_awready            ( act_axi_card_hbm_p14_awready  ) ,
      .m_axi_card_hbm_p14_awregion           ( act_axi_card_hbm_p14_awregion ) ,
      .m_axi_card_hbm_p14_awsize             ( act_axi_card_hbm_p14_awsize   ) ,
      .m_axi_card_hbm_p14_awuser             (                            ) ,
      .m_axi_card_hbm_p14_awvalid            ( act_axi_card_hbm_p14_awvalid  ) ,
      .m_axi_card_hbm_p14_bid                ( act_axi_card_hbm_p14_bid      ) ,
      .m_axi_card_hbm_p14_bready             ( act_axi_card_hbm_p14_bready   ) ,
      .m_axi_card_hbm_p14_bresp              ( act_axi_card_hbm_p14_bresp    ) ,
      .m_axi_card_hbm_p14_buser              (1'b0                        ) ,
      .m_axi_card_hbm_p14_bvalid             ( act_axi_card_hbm_p14_bvalid   ) ,
      .m_axi_card_hbm_p14_rdata              ( act_axi_card_hbm_p14_rdata    ) ,
      .m_axi_card_hbm_p14_rid                ( act_axi_card_hbm_p14_rid      ) ,
      .m_axi_card_hbm_p14_rlast              ( act_axi_card_hbm_p14_rlast    ) ,
      .m_axi_card_hbm_p14_rready             ( act_axi_card_hbm_p14_rready   ) ,
      .m_axi_card_hbm_p14_rresp              ( act_axi_card_hbm_p14_rresp    ) ,
      .m_axi_card_hbm_p14_ruser              (1'b0                        ) ,
      .m_axi_card_hbm_p14_rvalid             ( act_axi_card_hbm_p14_rvalid   ) ,
      .m_axi_card_hbm_p14_wdata              ( act_axi_card_hbm_p14_wdata    ) ,
      .m_axi_card_hbm_p14_wlast              ( act_axi_card_hbm_p14_wlast    ) ,
      .m_axi_card_hbm_p14_wready             ( act_axi_card_hbm_p14_wready   ) ,
      .m_axi_card_hbm_p14_wstrb              ( act_axi_card_hbm_p14_wstrb    ) ,
      .m_axi_card_hbm_p14_wuser              (                            ) ,
      .m_axi_card_hbm_p14_wvalid             ( act_axi_card_hbm_p14_wvalid   ) ,
      `endif

      `ifdef HBM_AXI_IF_P15
      .m_axi_card_hbm_p15_araddr             ( act_axi_card_hbm_p15_araddr   ) ,
      .m_axi_card_hbm_p15_arburst            ( act_axi_card_hbm_p15_arburst  ) ,
      .m_axi_card_hbm_p15_arcache            ( act_axi_card_hbm_p15_arcache  ) ,
      .m_axi_card_hbm_p15_arid               ( act_axi_card_hbm_p15_arid     ) ,
      .m_axi_card_hbm_p15_arlen              ( act_axi_card_hbm_p15_arlen    ) ,
      .m_axi_card_hbm_p15_arlock             ( act_axi_card_hbm_p15_arlock   ) ,
      .m_axi_card_hbm_p15_arprot             ( act_axi_card_hbm_p15_arprot   ) ,
      .m_axi_card_hbm_p15_arqos              ( act_axi_card_hbm_p15_arqos    ) ,
      .m_axi_card_hbm_p15_arready            ( act_axi_card_hbm_p15_arready  ) ,
      .m_axi_card_hbm_p15_arregion           ( act_axi_card_hbm_p15_arregion ) ,
      .m_axi_card_hbm_p15_arsize             ( act_axi_card_hbm_p15_arsize   ) ,
      .m_axi_card_hbm_p15_aruser             (                            ) ,
      .m_axi_card_hbm_p15_arvalid            ( act_axi_card_hbm_p15_arvalid  ) ,
      .m_axi_card_hbm_p15_awaddr             ( act_axi_card_hbm_p15_awaddr   ) ,
      .m_axi_card_hbm_p15_awburst            ( act_axi_card_hbm_p15_awburst  ) ,
      .m_axi_card_hbm_p15_awcache            ( act_axi_card_hbm_p15_awcache  ) ,
      .m_axi_card_hbm_p15_awid               ( act_axi_card_hbm_p15_awid     ) ,
      .m_axi_card_hbm_p15_awlen              ( act_axi_card_hbm_p15_awlen    ) ,
      .m_axi_card_hbm_p15_awlock             ( act_axi_card_hbm_p15_awlock   ) ,
      .m_axi_card_hbm_p15_awprot             ( act_axi_card_hbm_p15_awprot   ) ,
      .m_axi_card_hbm_p15_awqos              ( act_axi_card_hbm_p15_awqos    ) ,
      .m_axi_card_hbm_p15_awready            ( act_axi_card_hbm_p15_awready  ) ,
      .m_axi_card_hbm_p15_awregion           ( act_axi_card_hbm_p15_awregion ) ,
      .m_axi_card_hbm_p15_awsize             ( act_axi_card_hbm_p15_awsize   ) ,
      .m_axi_card_hbm_p15_awuser             (                            ) ,
      .m_axi_card_hbm_p15_awvalid            ( act_axi_card_hbm_p15_awvalid  ) ,
      .m_axi_card_hbm_p15_bid                ( act_axi_card_hbm_p15_bid      ) ,
      .m_axi_card_hbm_p15_bready             ( act_axi_card_hbm_p15_bready   ) ,
      .m_axi_card_hbm_p15_bresp              ( act_axi_card_hbm_p15_bresp    ) ,
      .m_axi_card_hbm_p15_buser              (1'b0                        ) ,
      .m_axi_card_hbm_p15_bvalid             ( act_axi_card_hbm_p15_bvalid   ) ,
      .m_axi_card_hbm_p15_rdata              ( act_axi_card_hbm_p15_rdata    ) ,
      .m_axi_card_hbm_p15_rid                ( act_axi_card_hbm_p15_rid      ) ,
      .m_axi_card_hbm_p15_rlast              ( act_axi_card_hbm_p15_rlast    ) ,
      .m_axi_card_hbm_p15_rready             ( act_axi_card_hbm_p15_rready   ) ,
      .m_axi_card_hbm_p15_rresp              ( act_axi_card_hbm_p15_rresp    ) ,
      .m_axi_card_hbm_p15_ruser              (1'b0                        ) ,
      .m_axi_card_hbm_p15_rvalid             ( act_axi_card_hbm_p15_rvalid   ) ,
      .m_axi_card_hbm_p15_wdata              ( act_axi_card_hbm_p15_wdata    ) ,
      .m_axi_card_hbm_p15_wlast              ( act_axi_card_hbm_p15_wlast    ) ,
      .m_axi_card_hbm_p15_wready             ( act_axi_card_hbm_p15_wready   ) ,
      .m_axi_card_hbm_p15_wstrb              ( act_axi_card_hbm_p15_wstrb    ) ,
      .m_axi_card_hbm_p15_wuser              (                            ) ,
      .m_axi_card_hbm_p15_wvalid             ( act_axi_card_hbm_p15_wvalid   ) ,
      `endif

      `ifdef HBM_AXI_IF_P16
      .m_axi_card_hbm_p16_araddr             ( act_axi_card_hbm_p16_araddr   ) ,
      .m_axi_card_hbm_p16_arburst            ( act_axi_card_hbm_p16_arburst  ) ,
      .m_axi_card_hbm_p16_arcache            ( act_axi_card_hbm_p16_arcache  ) ,
      .m_axi_card_hbm_p16_arid               ( act_axi_card_hbm_p16_arid     ) ,
      .m_axi_card_hbm_p16_arlen              ( act_axi_card_hbm_p16_arlen    ) ,
      .m_axi_card_hbm_p16_arlock             ( act_axi_card_hbm_p16_arlock   ) ,
      .m_axi_card_hbm_p16_arprot             ( act_axi_card_hbm_p16_arprot   ) ,
      .m_axi_card_hbm_p16_arqos              ( act_axi_card_hbm_p16_arqos    ) ,
      .m_axi_card_hbm_p16_arready            ( act_axi_card_hbm_p16_arready  ) ,
      .m_axi_card_hbm_p16_arregion           ( act_axi_card_hbm_p16_arregion ) ,
      .m_axi_card_hbm_p16_arsize             ( act_axi_card_hbm_p16_arsize   ) ,
      .m_axi_card_hbm_p16_aruser             (                            ) ,
      .m_axi_card_hbm_p16_arvalid            ( act_axi_card_hbm_p16_arvalid  ) ,
      .m_axi_card_hbm_p16_awaddr             ( act_axi_card_hbm_p16_awaddr   ) ,
      .m_axi_card_hbm_p16_awburst            ( act_axi_card_hbm_p16_awburst  ) ,
      .m_axi_card_hbm_p16_awcache            ( act_axi_card_hbm_p16_awcache  ) ,
      .m_axi_card_hbm_p16_awid               ( act_axi_card_hbm_p16_awid     ) ,
      .m_axi_card_hbm_p16_awlen              ( act_axi_card_hbm_p16_awlen    ) ,
      .m_axi_card_hbm_p16_awlock             ( act_axi_card_hbm_p16_awlock   ) ,
      .m_axi_card_hbm_p16_awprot             ( act_axi_card_hbm_p16_awprot   ) ,
      .m_axi_card_hbm_p16_awqos              ( act_axi_card_hbm_p16_awqos    ) ,
      .m_axi_card_hbm_p16_awready            ( act_axi_card_hbm_p16_awready  ) ,
      .m_axi_card_hbm_p16_awregion           ( act_axi_card_hbm_p16_awregion ) ,
      .m_axi_card_hbm_p16_awsize             ( act_axi_card_hbm_p16_awsize   ) ,
      .m_axi_card_hbm_p16_awuser             (                            ) ,
      .m_axi_card_hbm_p16_awvalid            ( act_axi_card_hbm_p16_awvalid  ) ,
      .m_axi_card_hbm_p16_bid                ( act_axi_card_hbm_p16_bid      ) ,
      .m_axi_card_hbm_p16_bready             ( act_axi_card_hbm_p16_bready   ) ,
      .m_axi_card_hbm_p16_bresp              ( act_axi_card_hbm_p16_bresp    ) ,
      .m_axi_card_hbm_p16_buser              (1'b0                        ) ,
      .m_axi_card_hbm_p16_bvalid             ( act_axi_card_hbm_p16_bvalid   ) ,
      .m_axi_card_hbm_p16_rdata              ( act_axi_card_hbm_p16_rdata    ) ,
      .m_axi_card_hbm_p16_rid                ( act_axi_card_hbm_p16_rid      ) ,
      .m_axi_card_hbm_p16_rlast              ( act_axi_card_hbm_p16_rlast    ) ,
      .m_axi_card_hbm_p16_rready             ( act_axi_card_hbm_p16_rready   ) ,
      .m_axi_card_hbm_p16_rresp              ( act_axi_card_hbm_p16_rresp    ) ,
      .m_axi_card_hbm_p16_ruser              (1'b0                        ) ,
      .m_axi_card_hbm_p16_rvalid             ( act_axi_card_hbm_p16_rvalid   ) ,
      .m_axi_card_hbm_p16_wdata              ( act_axi_card_hbm_p16_wdata    ) ,
      .m_axi_card_hbm_p16_wlast              ( act_axi_card_hbm_p16_wlast    ) ,
      .m_axi_card_hbm_p16_wready             ( act_axi_card_hbm_p16_wready   ) ,
      .m_axi_card_hbm_p16_wstrb              ( act_axi_card_hbm_p16_wstrb    ) ,
      .m_axi_card_hbm_p16_wuser              (                            ) ,
      .m_axi_card_hbm_p16_wvalid             ( act_axi_card_hbm_p16_wvalid   ) ,
      `endif

      `ifdef HBM_AXI_IF_P17
      .m_axi_card_hbm_p17_araddr             ( act_axi_card_hbm_p17_araddr   ) ,
      .m_axi_card_hbm_p17_arburst            ( act_axi_card_hbm_p17_arburst  ) ,
      .m_axi_card_hbm_p17_arcache            ( act_axi_card_hbm_p17_arcache  ) ,
      .m_axi_card_hbm_p17_arid               ( act_axi_card_hbm_p17_arid     ) ,
      .m_axi_card_hbm_p17_arlen              ( act_axi_card_hbm_p17_arlen    ) ,
      .m_axi_card_hbm_p17_arlock             ( act_axi_card_hbm_p17_arlock   ) ,
      .m_axi_card_hbm_p17_arprot             ( act_axi_card_hbm_p17_arprot   ) ,
      .m_axi_card_hbm_p17_arqos              ( act_axi_card_hbm_p17_arqos    ) ,
      .m_axi_card_hbm_p17_arready            ( act_axi_card_hbm_p17_arready  ) ,
      .m_axi_card_hbm_p17_arregion           ( act_axi_card_hbm_p17_arregion ) ,
      .m_axi_card_hbm_p17_arsize             ( act_axi_card_hbm_p17_arsize   ) ,
      .m_axi_card_hbm_p17_aruser             (                            ) ,
      .m_axi_card_hbm_p17_arvalid            ( act_axi_card_hbm_p17_arvalid  ) ,
      .m_axi_card_hbm_p17_awaddr             ( act_axi_card_hbm_p17_awaddr   ) ,
      .m_axi_card_hbm_p17_awburst            ( act_axi_card_hbm_p17_awburst  ) ,
      .m_axi_card_hbm_p17_awcache            ( act_axi_card_hbm_p17_awcache  ) ,
      .m_axi_card_hbm_p17_awid               ( act_axi_card_hbm_p17_awid     ) ,
      .m_axi_card_hbm_p17_awlen              ( act_axi_card_hbm_p17_awlen    ) ,
      .m_axi_card_hbm_p17_awlock             ( act_axi_card_hbm_p17_awlock   ) ,
      .m_axi_card_hbm_p17_awprot             ( act_axi_card_hbm_p17_awprot   ) ,
      .m_axi_card_hbm_p17_awqos              ( act_axi_card_hbm_p17_awqos    ) ,
      .m_axi_card_hbm_p17_awready            ( act_axi_card_hbm_p17_awready  ) ,
      .m_axi_card_hbm_p17_awregion           ( act_axi_card_hbm_p17_awregion ) ,
      .m_axi_card_hbm_p17_awsize             ( act_axi_card_hbm_p17_awsize   ) ,
      .m_axi_card_hbm_p17_awuser             (                            ) ,
      .m_axi_card_hbm_p17_awvalid            ( act_axi_card_hbm_p17_awvalid  ) ,
      .m_axi_card_hbm_p17_bid                ( act_axi_card_hbm_p17_bid      ) ,
      .m_axi_card_hbm_p17_bready             ( act_axi_card_hbm_p17_bready   ) ,
      .m_axi_card_hbm_p17_bresp              ( act_axi_card_hbm_p17_bresp    ) ,
      .m_axi_card_hbm_p17_buser              (1'b0                        ) ,
      .m_axi_card_hbm_p17_bvalid             ( act_axi_card_hbm_p17_bvalid   ) ,
      .m_axi_card_hbm_p17_rdata              ( act_axi_card_hbm_p17_rdata    ) ,
      .m_axi_card_hbm_p17_rid                ( act_axi_card_hbm_p17_rid      ) ,
      .m_axi_card_hbm_p17_rlast              ( act_axi_card_hbm_p17_rlast    ) ,
      .m_axi_card_hbm_p17_rready             ( act_axi_card_hbm_p17_rready   ) ,
      .m_axi_card_hbm_p17_rresp              ( act_axi_card_hbm_p17_rresp    ) ,
      .m_axi_card_hbm_p17_ruser              (1'b0                        ) ,
      .m_axi_card_hbm_p17_rvalid             ( act_axi_card_hbm_p17_rvalid   ) ,
      .m_axi_card_hbm_p17_wdata              ( act_axi_card_hbm_p17_wdata    ) ,
      .m_axi_card_hbm_p17_wlast              ( act_axi_card_hbm_p17_wlast    ) ,
      .m_axi_card_hbm_p17_wready             ( act_axi_card_hbm_p17_wready   ) ,
      .m_axi_card_hbm_p17_wstrb              ( act_axi_card_hbm_p17_wstrb    ) ,
      .m_axi_card_hbm_p17_wuser              (                            ) ,
      .m_axi_card_hbm_p17_wvalid             ( act_axi_card_hbm_p17_wvalid   ) ,
      `endif

      `ifdef HBM_AXI_IF_P18
      .m_axi_card_hbm_p18_araddr             ( act_axi_card_hbm_p18_araddr   ) ,
      .m_axi_card_hbm_p18_arburst            ( act_axi_card_hbm_p18_arburst  ) ,
      .m_axi_card_hbm_p18_arcache            ( act_axi_card_hbm_p18_arcache  ) ,
      .m_axi_card_hbm_p18_arid               ( act_axi_card_hbm_p18_arid     ) ,
      .m_axi_card_hbm_p18_arlen              ( act_axi_card_hbm_p18_arlen    ) ,
      .m_axi_card_hbm_p18_arlock             ( act_axi_card_hbm_p18_arlock   ) ,
      .m_axi_card_hbm_p18_arprot             ( act_axi_card_hbm_p18_arprot   ) ,
      .m_axi_card_hbm_p18_arqos              ( act_axi_card_hbm_p18_arqos    ) ,
      .m_axi_card_hbm_p18_arready            ( act_axi_card_hbm_p18_arready  ) ,
      .m_axi_card_hbm_p18_arregion           ( act_axi_card_hbm_p18_arregion ) ,
      .m_axi_card_hbm_p18_arsize             ( act_axi_card_hbm_p18_arsize   ) ,
      .m_axi_card_hbm_p18_aruser             (                            ) ,
      .m_axi_card_hbm_p18_arvalid            ( act_axi_card_hbm_p18_arvalid  ) ,
      .m_axi_card_hbm_p18_awaddr             ( act_axi_card_hbm_p18_awaddr   ) ,
      .m_axi_card_hbm_p18_awburst            ( act_axi_card_hbm_p18_awburst  ) ,
      .m_axi_card_hbm_p18_awcache            ( act_axi_card_hbm_p18_awcache  ) ,
      .m_axi_card_hbm_p18_awid               ( act_axi_card_hbm_p18_awid     ) ,
      .m_axi_card_hbm_p18_awlen              ( act_axi_card_hbm_p18_awlen    ) ,
      .m_axi_card_hbm_p18_awlock             ( act_axi_card_hbm_p18_awlock   ) ,
      .m_axi_card_hbm_p18_awprot             ( act_axi_card_hbm_p18_awprot   ) ,
      .m_axi_card_hbm_p18_awqos              ( act_axi_card_hbm_p18_awqos    ) ,
      .m_axi_card_hbm_p18_awready            ( act_axi_card_hbm_p18_awready  ) ,
      .m_axi_card_hbm_p18_awregion           ( act_axi_card_hbm_p18_awregion ) ,
      .m_axi_card_hbm_p18_awsize             ( act_axi_card_hbm_p18_awsize   ) ,
      .m_axi_card_hbm_p18_awuser             (                            ) ,
      .m_axi_card_hbm_p18_awvalid            ( act_axi_card_hbm_p18_awvalid  ) ,
      .m_axi_card_hbm_p18_bid                ( act_axi_card_hbm_p18_bid      ) ,
      .m_axi_card_hbm_p18_bready             ( act_axi_card_hbm_p18_bready   ) ,
      .m_axi_card_hbm_p18_bresp              ( act_axi_card_hbm_p18_bresp    ) ,
      .m_axi_card_hbm_p18_buser              (1'b0                        ) ,
      .m_axi_card_hbm_p18_bvalid             ( act_axi_card_hbm_p18_bvalid   ) ,
      .m_axi_card_hbm_p18_rdata              ( act_axi_card_hbm_p18_rdata    ) ,
      .m_axi_card_hbm_p18_rid                ( act_axi_card_hbm_p18_rid      ) ,
      .m_axi_card_hbm_p18_rlast              ( act_axi_card_hbm_p18_rlast    ) ,
      .m_axi_card_hbm_p18_rready             ( act_axi_card_hbm_p18_rready   ) ,
      .m_axi_card_hbm_p18_rresp              ( act_axi_card_hbm_p18_rresp    ) ,
      .m_axi_card_hbm_p18_ruser              (1'b0                        ) ,
      .m_axi_card_hbm_p18_rvalid             ( act_axi_card_hbm_p18_rvalid   ) ,
      .m_axi_card_hbm_p18_wdata              ( act_axi_card_hbm_p18_wdata    ) ,
      .m_axi_card_hbm_p18_wlast              ( act_axi_card_hbm_p18_wlast    ) ,
      .m_axi_card_hbm_p18_wready             ( act_axi_card_hbm_p18_wready   ) ,
      .m_axi_card_hbm_p18_wstrb              ( act_axi_card_hbm_p18_wstrb    ) ,
      .m_axi_card_hbm_p18_wuser              (                            ) ,
      .m_axi_card_hbm_p18_wvalid             ( act_axi_card_hbm_p18_wvalid   ) ,
      `endif

      `ifdef HBM_AXI_IF_P19
      .m_axi_card_hbm_p19_araddr             ( act_axi_card_hbm_p19_araddr   ) ,
      .m_axi_card_hbm_p19_arburst            ( act_axi_card_hbm_p19_arburst  ) ,
      .m_axi_card_hbm_p19_arcache            ( act_axi_card_hbm_p19_arcache  ) ,
      .m_axi_card_hbm_p19_arid               ( act_axi_card_hbm_p19_arid     ) ,
      .m_axi_card_hbm_p19_arlen              ( act_axi_card_hbm_p19_arlen    ) ,
      .m_axi_card_hbm_p19_arlock             ( act_axi_card_hbm_p19_arlock   ) ,
      .m_axi_card_hbm_p19_arprot             ( act_axi_card_hbm_p19_arprot   ) ,
      .m_axi_card_hbm_p19_arqos              ( act_axi_card_hbm_p19_arqos    ) ,
      .m_axi_card_hbm_p19_arready            ( act_axi_card_hbm_p19_arready  ) ,
      .m_axi_card_hbm_p19_arregion           ( act_axi_card_hbm_p19_arregion ) ,
      .m_axi_card_hbm_p19_arsize             ( act_axi_card_hbm_p19_arsize   ) ,
      .m_axi_card_hbm_p19_aruser             (                            ) ,
      .m_axi_card_hbm_p19_arvalid            ( act_axi_card_hbm_p19_arvalid  ) ,
      .m_axi_card_hbm_p19_awaddr             ( act_axi_card_hbm_p19_awaddr   ) ,
      .m_axi_card_hbm_p19_awburst            ( act_axi_card_hbm_p19_awburst  ) ,
      .m_axi_card_hbm_p19_awcache            ( act_axi_card_hbm_p19_awcache  ) ,
      .m_axi_card_hbm_p19_awid               ( act_axi_card_hbm_p19_awid     ) ,
      .m_axi_card_hbm_p19_awlen              ( act_axi_card_hbm_p19_awlen    ) ,
      .m_axi_card_hbm_p19_awlock             ( act_axi_card_hbm_p19_awlock   ) ,
      .m_axi_card_hbm_p19_awprot             ( act_axi_card_hbm_p19_awprot   ) ,
      .m_axi_card_hbm_p19_awqos              ( act_axi_card_hbm_p19_awqos    ) ,
      .m_axi_card_hbm_p19_awready            ( act_axi_card_hbm_p19_awready  ) ,
      .m_axi_card_hbm_p19_awregion           ( act_axi_card_hbm_p19_awregion ) ,
      .m_axi_card_hbm_p19_awsize             ( act_axi_card_hbm_p19_awsize   ) ,
      .m_axi_card_hbm_p19_awuser             (                            ) ,
      .m_axi_card_hbm_p19_awvalid            ( act_axi_card_hbm_p19_awvalid  ) ,
      .m_axi_card_hbm_p19_bid                ( act_axi_card_hbm_p19_bid      ) ,
      .m_axi_card_hbm_p19_bready             ( act_axi_card_hbm_p19_bready   ) ,
      .m_axi_card_hbm_p19_bresp              ( act_axi_card_hbm_p19_bresp    ) ,
      .m_axi_card_hbm_p19_buser              (1'b0                        ) ,
      .m_axi_card_hbm_p19_bvalid             ( act_axi_card_hbm_p19_bvalid   ) ,
      .m_axi_card_hbm_p19_rdata              ( act_axi_card_hbm_p19_rdata    ) ,
      .m_axi_card_hbm_p19_rid                ( act_axi_card_hbm_p19_rid      ) ,
      .m_axi_card_hbm_p19_rlast              ( act_axi_card_hbm_p19_rlast    ) ,
      .m_axi_card_hbm_p19_rready             ( act_axi_card_hbm_p19_rready   ) ,
      .m_axi_card_hbm_p19_rresp              ( act_axi_card_hbm_p19_rresp    ) ,
      .m_axi_card_hbm_p19_ruser              (1'b0                        ) ,
      .m_axi_card_hbm_p19_rvalid             ( act_axi_card_hbm_p19_rvalid   ) ,
      .m_axi_card_hbm_p19_wdata              ( act_axi_card_hbm_p19_wdata    ) ,
      .m_axi_card_hbm_p19_wlast              ( act_axi_card_hbm_p19_wlast    ) ,
      .m_axi_card_hbm_p19_wready             ( act_axi_card_hbm_p19_wready   ) ,
      .m_axi_card_hbm_p19_wstrb              ( act_axi_card_hbm_p19_wstrb    ) ,
      .m_axi_card_hbm_p19_wuser              (                            ) ,
      .m_axi_card_hbm_p19_wvalid             ( act_axi_card_hbm_p19_wvalid   ) ,
      `endif

      `ifdef HBM_AXI_IF_P20
      .m_axi_card_hbm_p20_araddr             ( act_axi_card_hbm_p20_araddr   ) ,
      .m_axi_card_hbm_p20_arburst            ( act_axi_card_hbm_p20_arburst  ) ,
      .m_axi_card_hbm_p20_arcache            ( act_axi_card_hbm_p20_arcache  ) ,
      .m_axi_card_hbm_p20_arid               ( act_axi_card_hbm_p20_arid     ) ,
      .m_axi_card_hbm_p20_arlen              ( act_axi_card_hbm_p20_arlen    ) ,
      .m_axi_card_hbm_p20_arlock             ( act_axi_card_hbm_p20_arlock   ) ,
      .m_axi_card_hbm_p20_arprot             ( act_axi_card_hbm_p20_arprot   ) ,
      .m_axi_card_hbm_p20_arqos              ( act_axi_card_hbm_p20_arqos    ) ,
      .m_axi_card_hbm_p20_arready            ( act_axi_card_hbm_p20_arready  ) ,
      .m_axi_card_hbm_p20_arregion           ( act_axi_card_hbm_p20_arregion ) ,
      .m_axi_card_hbm_p20_arsize             ( act_axi_card_hbm_p20_arsize   ) ,
      .m_axi_card_hbm_p20_aruser             (                            ) ,
      .m_axi_card_hbm_p20_arvalid            ( act_axi_card_hbm_p20_arvalid  ) ,
      .m_axi_card_hbm_p20_awaddr             ( act_axi_card_hbm_p20_awaddr   ) ,
      .m_axi_card_hbm_p20_awburst            ( act_axi_card_hbm_p20_awburst  ) ,
      .m_axi_card_hbm_p20_awcache            ( act_axi_card_hbm_p20_awcache  ) ,
      .m_axi_card_hbm_p20_awid               ( act_axi_card_hbm_p20_awid     ) ,
      .m_axi_card_hbm_p20_awlen              ( act_axi_card_hbm_p20_awlen    ) ,
      .m_axi_card_hbm_p20_awlock             ( act_axi_card_hbm_p20_awlock   ) ,
      .m_axi_card_hbm_p20_awprot             ( act_axi_card_hbm_p20_awprot   ) ,
      .m_axi_card_hbm_p20_awqos              ( act_axi_card_hbm_p20_awqos    ) ,
      .m_axi_card_hbm_p20_awready            ( act_axi_card_hbm_p20_awready  ) ,
      .m_axi_card_hbm_p20_awregion           ( act_axi_card_hbm_p20_awregion ) ,
      .m_axi_card_hbm_p20_awsize             ( act_axi_card_hbm_p20_awsize   ) ,
      .m_axi_card_hbm_p20_awuser             (                            ) ,
      .m_axi_card_hbm_p20_awvalid            ( act_axi_card_hbm_p20_awvalid  ) ,
      .m_axi_card_hbm_p20_bid                ( act_axi_card_hbm_p20_bid      ) ,
      .m_axi_card_hbm_p20_bready             ( act_axi_card_hbm_p20_bready   ) ,
      .m_axi_card_hbm_p20_bresp              ( act_axi_card_hbm_p20_bresp    ) ,
      .m_axi_card_hbm_p20_buser              (1'b0                        ) ,
      .m_axi_card_hbm_p20_bvalid             ( act_axi_card_hbm_p20_bvalid   ) ,
      .m_axi_card_hbm_p20_rdata              ( act_axi_card_hbm_p20_rdata    ) ,
      .m_axi_card_hbm_p20_rid                ( act_axi_card_hbm_p20_rid      ) ,
      .m_axi_card_hbm_p20_rlast              ( act_axi_card_hbm_p20_rlast    ) ,
      .m_axi_card_hbm_p20_rready             ( act_axi_card_hbm_p20_rready   ) ,
      .m_axi_card_hbm_p20_rresp              ( act_axi_card_hbm_p20_rresp    ) ,
      .m_axi_card_hbm_p20_ruser              (1'b0                        ) ,
      .m_axi_card_hbm_p20_rvalid             ( act_axi_card_hbm_p20_rvalid   ) ,
      .m_axi_card_hbm_p20_wdata              ( act_axi_card_hbm_p20_wdata    ) ,
      .m_axi_card_hbm_p20_wlast              ( act_axi_card_hbm_p20_wlast    ) ,
      .m_axi_card_hbm_p20_wready             ( act_axi_card_hbm_p20_wready   ) ,
      .m_axi_card_hbm_p20_wstrb              ( act_axi_card_hbm_p20_wstrb    ) ,
      .m_axi_card_hbm_p20_wuser              (                            ) ,
      .m_axi_card_hbm_p20_wvalid             ( act_axi_card_hbm_p20_wvalid   ) ,
      `endif

      `ifdef HBM_AXI_IF_P21
      .m_axi_card_hbm_p21_araddr             ( act_axi_card_hbm_p21_araddr   ) ,
      .m_axi_card_hbm_p21_arburst            ( act_axi_card_hbm_p21_arburst  ) ,
      .m_axi_card_hbm_p21_arcache            ( act_axi_card_hbm_p21_arcache  ) ,
      .m_axi_card_hbm_p21_arid               ( act_axi_card_hbm_p21_arid     ) ,
      .m_axi_card_hbm_p21_arlen              ( act_axi_card_hbm_p21_arlen    ) ,
      .m_axi_card_hbm_p21_arlock             ( act_axi_card_hbm_p21_arlock   ) ,
      .m_axi_card_hbm_p21_arprot             ( act_axi_card_hbm_p21_arprot   ) ,
      .m_axi_card_hbm_p21_arqos              ( act_axi_card_hbm_p21_arqos    ) ,
      .m_axi_card_hbm_p21_arready            ( act_axi_card_hbm_p21_arready  ) ,
      .m_axi_card_hbm_p21_arregion           ( act_axi_card_hbm_p21_arregion ) ,
      .m_axi_card_hbm_p21_arsize             ( act_axi_card_hbm_p21_arsize   ) ,
      .m_axi_card_hbm_p21_aruser             (                            ) ,
      .m_axi_card_hbm_p21_arvalid            ( act_axi_card_hbm_p21_arvalid  ) ,
      .m_axi_card_hbm_p21_awaddr             ( act_axi_card_hbm_p21_awaddr   ) ,
      .m_axi_card_hbm_p21_awburst            ( act_axi_card_hbm_p21_awburst  ) ,
      .m_axi_card_hbm_p21_awcache            ( act_axi_card_hbm_p21_awcache  ) ,
      .m_axi_card_hbm_p21_awid               ( act_axi_card_hbm_p21_awid     ) ,
      .m_axi_card_hbm_p21_awlen              ( act_axi_card_hbm_p21_awlen    ) ,
      .m_axi_card_hbm_p21_awlock             ( act_axi_card_hbm_p21_awlock   ) ,
      .m_axi_card_hbm_p21_awprot             ( act_axi_card_hbm_p21_awprot   ) ,
      .m_axi_card_hbm_p21_awqos              ( act_axi_card_hbm_p21_awqos    ) ,
      .m_axi_card_hbm_p21_awready            ( act_axi_card_hbm_p21_awready  ) ,
      .m_axi_card_hbm_p21_awregion           ( act_axi_card_hbm_p21_awregion ) ,
      .m_axi_card_hbm_p21_awsize             ( act_axi_card_hbm_p21_awsize   ) ,
      .m_axi_card_hbm_p21_awuser             (                            ) ,
      .m_axi_card_hbm_p21_awvalid            ( act_axi_card_hbm_p21_awvalid  ) ,
      .m_axi_card_hbm_p21_bid                ( act_axi_card_hbm_p21_bid      ) ,
      .m_axi_card_hbm_p21_bready             ( act_axi_card_hbm_p21_bready   ) ,
      .m_axi_card_hbm_p21_bresp              ( act_axi_card_hbm_p21_bresp    ) ,
      .m_axi_card_hbm_p21_buser              (1'b0                        ) ,
      .m_axi_card_hbm_p21_bvalid             ( act_axi_card_hbm_p21_bvalid   ) ,
      .m_axi_card_hbm_p21_rdata              ( act_axi_card_hbm_p21_rdata    ) ,
      .m_axi_card_hbm_p21_rid                ( act_axi_card_hbm_p21_rid      ) ,
      .m_axi_card_hbm_p21_rlast              ( act_axi_card_hbm_p21_rlast    ) ,
      .m_axi_card_hbm_p21_rready             ( act_axi_card_hbm_p21_rready   ) ,
      .m_axi_card_hbm_p21_rresp              ( act_axi_card_hbm_p21_rresp    ) ,
      .m_axi_card_hbm_p21_ruser              (1'b0                        ) ,
      .m_axi_card_hbm_p21_rvalid             ( act_axi_card_hbm_p21_rvalid   ) ,
      .m_axi_card_hbm_p21_wdata              ( act_axi_card_hbm_p21_wdata    ) ,
      .m_axi_card_hbm_p21_wlast              ( act_axi_card_hbm_p21_wlast    ) ,
      .m_axi_card_hbm_p21_wready             ( act_axi_card_hbm_p21_wready   ) ,
      .m_axi_card_hbm_p21_wstrb              ( act_axi_card_hbm_p21_wstrb    ) ,
      .m_axi_card_hbm_p21_wuser              (                            ) ,
      .m_axi_card_hbm_p21_wvalid             ( act_axi_card_hbm_p21_wvalid   ) ,
      `endif

      `ifdef HBM_AXI_IF_P22
      .m_axi_card_hbm_p22_araddr             ( act_axi_card_hbm_p22_araddr   ) ,
      .m_axi_card_hbm_p22_arburst            ( act_axi_card_hbm_p22_arburst  ) ,
      .m_axi_card_hbm_p22_arcache            ( act_axi_card_hbm_p22_arcache  ) ,
      .m_axi_card_hbm_p22_arid               ( act_axi_card_hbm_p22_arid     ) ,
      .m_axi_card_hbm_p22_arlen              ( act_axi_card_hbm_p22_arlen    ) ,
      .m_axi_card_hbm_p22_arlock             ( act_axi_card_hbm_p22_arlock   ) ,
      .m_axi_card_hbm_p22_arprot             ( act_axi_card_hbm_p22_arprot   ) ,
      .m_axi_card_hbm_p22_arqos              ( act_axi_card_hbm_p22_arqos    ) ,
      .m_axi_card_hbm_p22_arready            ( act_axi_card_hbm_p22_arready  ) ,
      .m_axi_card_hbm_p22_arregion           ( act_axi_card_hbm_p22_arregion ) ,
      .m_axi_card_hbm_p22_arsize             ( act_axi_card_hbm_p22_arsize   ) ,
      .m_axi_card_hbm_p22_aruser             (                            ) ,
      .m_axi_card_hbm_p22_arvalid            ( act_axi_card_hbm_p22_arvalid  ) ,
      .m_axi_card_hbm_p22_awaddr             ( act_axi_card_hbm_p22_awaddr   ) ,
      .m_axi_card_hbm_p22_awburst            ( act_axi_card_hbm_p22_awburst  ) ,
      .m_axi_card_hbm_p22_awcache            ( act_axi_card_hbm_p22_awcache  ) ,
      .m_axi_card_hbm_p22_awid               ( act_axi_card_hbm_p22_awid     ) ,
      .m_axi_card_hbm_p22_awlen              ( act_axi_card_hbm_p22_awlen    ) ,
      .m_axi_card_hbm_p22_awlock             ( act_axi_card_hbm_p22_awlock   ) ,
      .m_axi_card_hbm_p22_awprot             ( act_axi_card_hbm_p22_awprot   ) ,
      .m_axi_card_hbm_p22_awqos              ( act_axi_card_hbm_p22_awqos    ) ,
      .m_axi_card_hbm_p22_awready            ( act_axi_card_hbm_p22_awready  ) ,
      .m_axi_card_hbm_p22_awregion           ( act_axi_card_hbm_p22_awregion ) ,
      .m_axi_card_hbm_p22_awsize             ( act_axi_card_hbm_p22_awsize   ) ,
      .m_axi_card_hbm_p22_awuser             (                            ) ,
      .m_axi_card_hbm_p22_awvalid            ( act_axi_card_hbm_p22_awvalid  ) ,
      .m_axi_card_hbm_p22_bid                ( act_axi_card_hbm_p22_bid      ) ,
      .m_axi_card_hbm_p22_bready             ( act_axi_card_hbm_p22_bready   ) ,
      .m_axi_card_hbm_p22_bresp              ( act_axi_card_hbm_p22_bresp    ) ,
      .m_axi_card_hbm_p22_buser              (1'b0                        ) ,
      .m_axi_card_hbm_p22_bvalid             ( act_axi_card_hbm_p22_bvalid   ) ,
      .m_axi_card_hbm_p22_rdata              ( act_axi_card_hbm_p22_rdata    ) ,
      .m_axi_card_hbm_p22_rid                ( act_axi_card_hbm_p22_rid      ) ,
      .m_axi_card_hbm_p22_rlast              ( act_axi_card_hbm_p22_rlast    ) ,
      .m_axi_card_hbm_p22_rready             ( act_axi_card_hbm_p22_rready   ) ,
      .m_axi_card_hbm_p22_rresp              ( act_axi_card_hbm_p22_rresp    ) ,
      .m_axi_card_hbm_p22_ruser              (1'b0                        ) ,
      .m_axi_card_hbm_p22_rvalid             ( act_axi_card_hbm_p22_rvalid   ) ,
      .m_axi_card_hbm_p22_wdata              ( act_axi_card_hbm_p22_wdata    ) ,
      .m_axi_card_hbm_p22_wlast              ( act_axi_card_hbm_p22_wlast    ) ,
      .m_axi_card_hbm_p22_wready             ( act_axi_card_hbm_p22_wready   ) ,
      .m_axi_card_hbm_p22_wstrb              ( act_axi_card_hbm_p22_wstrb    ) ,
      .m_axi_card_hbm_p22_wuser              (                            ) ,
      .m_axi_card_hbm_p22_wvalid             ( act_axi_card_hbm_p22_wvalid   ) ,
      `endif

      `ifdef HBM_AXI_IF_P23
      .m_axi_card_hbm_p23_araddr             ( act_axi_card_hbm_p23_araddr   ) ,
      .m_axi_card_hbm_p23_arburst            ( act_axi_card_hbm_p23_arburst  ) ,
      .m_axi_card_hbm_p23_arcache            ( act_axi_card_hbm_p23_arcache  ) ,
      .m_axi_card_hbm_p23_arid               ( act_axi_card_hbm_p23_arid     ) ,
      .m_axi_card_hbm_p23_arlen              ( act_axi_card_hbm_p23_arlen    ) ,
      .m_axi_card_hbm_p23_arlock             ( act_axi_card_hbm_p23_arlock   ) ,
      .m_axi_card_hbm_p23_arprot             ( act_axi_card_hbm_p23_arprot   ) ,
      .m_axi_card_hbm_p23_arqos              ( act_axi_card_hbm_p23_arqos    ) ,
      .m_axi_card_hbm_p23_arready            ( act_axi_card_hbm_p23_arready  ) ,
      .m_axi_card_hbm_p23_arregion           ( act_axi_card_hbm_p23_arregion ) ,
      .m_axi_card_hbm_p23_arsize             ( act_axi_card_hbm_p23_arsize   ) ,
      .m_axi_card_hbm_p23_aruser             (                            ) ,
      .m_axi_card_hbm_p23_arvalid            ( act_axi_card_hbm_p23_arvalid  ) ,
      .m_axi_card_hbm_p23_awaddr             ( act_axi_card_hbm_p23_awaddr   ) ,
      .m_axi_card_hbm_p23_awburst            ( act_axi_card_hbm_p23_awburst  ) ,
      .m_axi_card_hbm_p23_awcache            ( act_axi_card_hbm_p23_awcache  ) ,
      .m_axi_card_hbm_p23_awid               ( act_axi_card_hbm_p23_awid     ) ,
      .m_axi_card_hbm_p23_awlen              ( act_axi_card_hbm_p23_awlen    ) ,
      .m_axi_card_hbm_p23_awlock             ( act_axi_card_hbm_p23_awlock   ) ,
      .m_axi_card_hbm_p23_awprot             ( act_axi_card_hbm_p23_awprot   ) ,
      .m_axi_card_hbm_p23_awqos              ( act_axi_card_hbm_p23_awqos    ) ,
      .m_axi_card_hbm_p23_awready            ( act_axi_card_hbm_p23_awready  ) ,
      .m_axi_card_hbm_p23_awregion           ( act_axi_card_hbm_p23_awregion ) ,
      .m_axi_card_hbm_p23_awsize             ( act_axi_card_hbm_p23_awsize   ) ,
      .m_axi_card_hbm_p23_awuser             (                            ) ,
      .m_axi_card_hbm_p23_awvalid            ( act_axi_card_hbm_p23_awvalid  ) ,
      .m_axi_card_hbm_p23_bid                ( act_axi_card_hbm_p23_bid      ) ,
      .m_axi_card_hbm_p23_bready             ( act_axi_card_hbm_p23_bready   ) ,
      .m_axi_card_hbm_p23_bresp              ( act_axi_card_hbm_p23_bresp    ) ,
      .m_axi_card_hbm_p23_buser              (1'b0                        ) ,
      .m_axi_card_hbm_p23_bvalid             ( act_axi_card_hbm_p23_bvalid   ) ,
      .m_axi_card_hbm_p23_rdata              ( act_axi_card_hbm_p23_rdata    ) ,
      .m_axi_card_hbm_p23_rid                ( act_axi_card_hbm_p23_rid      ) ,
      .m_axi_card_hbm_p23_rlast              ( act_axi_card_hbm_p23_rlast    ) ,
      .m_axi_card_hbm_p23_rready             ( act_axi_card_hbm_p23_rready   ) ,
      .m_axi_card_hbm_p23_rresp              ( act_axi_card_hbm_p23_rresp    ) ,
      .m_axi_card_hbm_p23_ruser              (1'b0                        ) ,
      .m_axi_card_hbm_p23_rvalid             ( act_axi_card_hbm_p23_rvalid   ) ,
      .m_axi_card_hbm_p23_wdata              ( act_axi_card_hbm_p23_wdata    ) ,
      .m_axi_card_hbm_p23_wlast              ( act_axi_card_hbm_p23_wlast    ) ,
      .m_axi_card_hbm_p23_wready             ( act_axi_card_hbm_p23_wready   ) ,
      .m_axi_card_hbm_p23_wstrb              ( act_axi_card_hbm_p23_wstrb    ) ,
      .m_axi_card_hbm_p23_wuser              (                            ) ,
      .m_axi_card_hbm_p23_wvalid             ( act_axi_card_hbm_p23_wvalid   ) ,
      `endif

      `ifdef HBM_AXI_IF_P24
      .m_axi_card_hbm_p24_araddr             ( act_axi_card_hbm_p24_araddr   ) ,
      .m_axi_card_hbm_p24_arburst            ( act_axi_card_hbm_p24_arburst  ) ,
      .m_axi_card_hbm_p24_arcache            ( act_axi_card_hbm_p24_arcache  ) ,
      .m_axi_card_hbm_p24_arid               ( act_axi_card_hbm_p24_arid     ) ,
      .m_axi_card_hbm_p24_arlen              ( act_axi_card_hbm_p24_arlen    ) ,
      .m_axi_card_hbm_p24_arlock             ( act_axi_card_hbm_p24_arlock   ) ,
      .m_axi_card_hbm_p24_arprot             ( act_axi_card_hbm_p24_arprot   ) ,
      .m_axi_card_hbm_p24_arqos              ( act_axi_card_hbm_p24_arqos    ) ,
      .m_axi_card_hbm_p24_arready            ( act_axi_card_hbm_p24_arready  ) ,
      .m_axi_card_hbm_p24_arregion           ( act_axi_card_hbm_p24_arregion ) ,
      .m_axi_card_hbm_p24_arsize             ( act_axi_card_hbm_p24_arsize   ) ,
      .m_axi_card_hbm_p24_aruser             (                            ) ,
      .m_axi_card_hbm_p24_arvalid            ( act_axi_card_hbm_p24_arvalid  ) ,
      .m_axi_card_hbm_p24_awaddr             ( act_axi_card_hbm_p24_awaddr   ) ,
      .m_axi_card_hbm_p24_awburst            ( act_axi_card_hbm_p24_awburst  ) ,
      .m_axi_card_hbm_p24_awcache            ( act_axi_card_hbm_p24_awcache  ) ,
      .m_axi_card_hbm_p24_awid               ( act_axi_card_hbm_p24_awid     ) ,
      .m_axi_card_hbm_p24_awlen              ( act_axi_card_hbm_p24_awlen    ) ,
      .m_axi_card_hbm_p24_awlock             ( act_axi_card_hbm_p24_awlock   ) ,
      .m_axi_card_hbm_p24_awprot             ( act_axi_card_hbm_p24_awprot   ) ,
      .m_axi_card_hbm_p24_awqos              ( act_axi_card_hbm_p24_awqos    ) ,
      .m_axi_card_hbm_p24_awready            ( act_axi_card_hbm_p24_awready  ) ,
      .m_axi_card_hbm_p24_awregion           ( act_axi_card_hbm_p24_awregion ) ,
      .m_axi_card_hbm_p24_awsize             ( act_axi_card_hbm_p24_awsize   ) ,
      .m_axi_card_hbm_p24_awuser             (                            ) ,
      .m_axi_card_hbm_p24_awvalid            ( act_axi_card_hbm_p24_awvalid  ) ,
      .m_axi_card_hbm_p24_bid                ( act_axi_card_hbm_p24_bid      ) ,
      .m_axi_card_hbm_p24_bready             ( act_axi_card_hbm_p24_bready   ) ,
      .m_axi_card_hbm_p24_bresp              ( act_axi_card_hbm_p24_bresp    ) ,
      .m_axi_card_hbm_p24_buser              (1'b0                        ) ,
      .m_axi_card_hbm_p24_bvalid             ( act_axi_card_hbm_p24_bvalid   ) ,
      .m_axi_card_hbm_p24_rdata              ( act_axi_card_hbm_p24_rdata    ) ,
      .m_axi_card_hbm_p24_rid                ( act_axi_card_hbm_p24_rid      ) ,
      .m_axi_card_hbm_p24_rlast              ( act_axi_card_hbm_p24_rlast    ) ,
      .m_axi_card_hbm_p24_rready             ( act_axi_card_hbm_p24_rready   ) ,
      .m_axi_card_hbm_p24_rresp              ( act_axi_card_hbm_p24_rresp    ) ,
      .m_axi_card_hbm_p24_ruser              (1'b0                        ) ,
      .m_axi_card_hbm_p24_rvalid             ( act_axi_card_hbm_p24_rvalid   ) ,
      .m_axi_card_hbm_p24_wdata              ( act_axi_card_hbm_p24_wdata    ) ,
      .m_axi_card_hbm_p24_wlast              ( act_axi_card_hbm_p24_wlast    ) ,
      .m_axi_card_hbm_p24_wready             ( act_axi_card_hbm_p24_wready   ) ,
      .m_axi_card_hbm_p24_wstrb              ( act_axi_card_hbm_p24_wstrb    ) ,
      .m_axi_card_hbm_p24_wuser              (                            ) ,
      .m_axi_card_hbm_p24_wvalid             ( act_axi_card_hbm_p24_wvalid   ) ,
      `endif

      `ifdef HBM_AXI_IF_P25
      .m_axi_card_hbm_p25_araddr             ( act_axi_card_hbm_p25_araddr   ) ,
      .m_axi_card_hbm_p25_arburst            ( act_axi_card_hbm_p25_arburst  ) ,
      .m_axi_card_hbm_p25_arcache            ( act_axi_card_hbm_p25_arcache  ) ,
      .m_axi_card_hbm_p25_arid               ( act_axi_card_hbm_p25_arid     ) ,
      .m_axi_card_hbm_p25_arlen              ( act_axi_card_hbm_p25_arlen    ) ,
      .m_axi_card_hbm_p25_arlock             ( act_axi_card_hbm_p25_arlock   ) ,
      .m_axi_card_hbm_p25_arprot             ( act_axi_card_hbm_p25_arprot   ) ,
      .m_axi_card_hbm_p25_arqos              ( act_axi_card_hbm_p25_arqos    ) ,
      .m_axi_card_hbm_p25_arready            ( act_axi_card_hbm_p25_arready  ) ,
      .m_axi_card_hbm_p25_arregion           ( act_axi_card_hbm_p25_arregion ) ,
      .m_axi_card_hbm_p25_arsize             ( act_axi_card_hbm_p25_arsize   ) ,
      .m_axi_card_hbm_p25_aruser             (                            ) ,
      .m_axi_card_hbm_p25_arvalid            ( act_axi_card_hbm_p25_arvalid  ) ,
      .m_axi_card_hbm_p25_awaddr             ( act_axi_card_hbm_p25_awaddr   ) ,
      .m_axi_card_hbm_p25_awburst            ( act_axi_card_hbm_p25_awburst  ) ,
      .m_axi_card_hbm_p25_awcache            ( act_axi_card_hbm_p25_awcache  ) ,
      .m_axi_card_hbm_p25_awid               ( act_axi_card_hbm_p25_awid     ) ,
      .m_axi_card_hbm_p25_awlen              ( act_axi_card_hbm_p25_awlen    ) ,
      .m_axi_card_hbm_p25_awlock             ( act_axi_card_hbm_p25_awlock   ) ,
      .m_axi_card_hbm_p25_awprot             ( act_axi_card_hbm_p25_awprot   ) ,
      .m_axi_card_hbm_p25_awqos              ( act_axi_card_hbm_p25_awqos    ) ,
      .m_axi_card_hbm_p25_awready            ( act_axi_card_hbm_p25_awready  ) ,
      .m_axi_card_hbm_p25_awregion           ( act_axi_card_hbm_p25_awregion ) ,
      .m_axi_card_hbm_p25_awsize             ( act_axi_card_hbm_p25_awsize   ) ,
      .m_axi_card_hbm_p25_awuser             (                            ) ,
      .m_axi_card_hbm_p25_awvalid            ( act_axi_card_hbm_p25_awvalid  ) ,
      .m_axi_card_hbm_p25_bid                ( act_axi_card_hbm_p25_bid      ) ,
      .m_axi_card_hbm_p25_bready             ( act_axi_card_hbm_p25_bready   ) ,
      .m_axi_card_hbm_p25_bresp              ( act_axi_card_hbm_p25_bresp    ) ,
      .m_axi_card_hbm_p25_buser              (1'b0                        ) ,
      .m_axi_card_hbm_p25_bvalid             ( act_axi_card_hbm_p25_bvalid   ) ,
      .m_axi_card_hbm_p25_rdata              ( act_axi_card_hbm_p25_rdata    ) ,
      .m_axi_card_hbm_p25_rid                ( act_axi_card_hbm_p25_rid      ) ,
      .m_axi_card_hbm_p25_rlast              ( act_axi_card_hbm_p25_rlast    ) ,
      .m_axi_card_hbm_p25_rready             ( act_axi_card_hbm_p25_rready   ) ,
      .m_axi_card_hbm_p25_rresp              ( act_axi_card_hbm_p25_rresp    ) ,
      .m_axi_card_hbm_p25_ruser              (1'b0                        ) ,
      .m_axi_card_hbm_p25_rvalid             ( act_axi_card_hbm_p25_rvalid   ) ,
      .m_axi_card_hbm_p25_wdata              ( act_axi_card_hbm_p25_wdata    ) ,
      .m_axi_card_hbm_p25_wlast              ( act_axi_card_hbm_p25_wlast    ) ,
      .m_axi_card_hbm_p25_wready             ( act_axi_card_hbm_p25_wready   ) ,
      .m_axi_card_hbm_p25_wstrb              ( act_axi_card_hbm_p25_wstrb    ) ,
      .m_axi_card_hbm_p25_wuser              (                            ) ,
      .m_axi_card_hbm_p25_wvalid             ( act_axi_card_hbm_p25_wvalid   ) ,
      `endif

      `ifdef HBM_AXI_IF_P26
      .m_axi_card_hbm_p26_araddr             ( act_axi_card_hbm_p26_araddr   ) ,
      .m_axi_card_hbm_p26_arburst            ( act_axi_card_hbm_p26_arburst  ) ,
      .m_axi_card_hbm_p26_arcache            ( act_axi_card_hbm_p26_arcache  ) ,
      .m_axi_card_hbm_p26_arid               ( act_axi_card_hbm_p26_arid     ) ,
      .m_axi_card_hbm_p26_arlen              ( act_axi_card_hbm_p26_arlen    ) ,
      .m_axi_card_hbm_p26_arlock             ( act_axi_card_hbm_p26_arlock   ) ,
      .m_axi_card_hbm_p26_arprot             ( act_axi_card_hbm_p26_arprot   ) ,
      .m_axi_card_hbm_p26_arqos              ( act_axi_card_hbm_p26_arqos    ) ,
      .m_axi_card_hbm_p26_arready            ( act_axi_card_hbm_p26_arready  ) ,
      .m_axi_card_hbm_p26_arregion           ( act_axi_card_hbm_p26_arregion ) ,
      .m_axi_card_hbm_p26_arsize             ( act_axi_card_hbm_p26_arsize   ) ,
      .m_axi_card_hbm_p26_aruser             (                            ) ,
      .m_axi_card_hbm_p26_arvalid            ( act_axi_card_hbm_p26_arvalid  ) ,
      .m_axi_card_hbm_p26_awaddr             ( act_axi_card_hbm_p26_awaddr   ) ,
      .m_axi_card_hbm_p26_awburst            ( act_axi_card_hbm_p26_awburst  ) ,
      .m_axi_card_hbm_p26_awcache            ( act_axi_card_hbm_p26_awcache  ) ,
      .m_axi_card_hbm_p26_awid               ( act_axi_card_hbm_p26_awid     ) ,
      .m_axi_card_hbm_p26_awlen              ( act_axi_card_hbm_p26_awlen    ) ,
      .m_axi_card_hbm_p26_awlock             ( act_axi_card_hbm_p26_awlock   ) ,
      .m_axi_card_hbm_p26_awprot             ( act_axi_card_hbm_p26_awprot   ) ,
      .m_axi_card_hbm_p26_awqos              ( act_axi_card_hbm_p26_awqos    ) ,
      .m_axi_card_hbm_p26_awready            ( act_axi_card_hbm_p26_awready  ) ,
      .m_axi_card_hbm_p26_awregion           ( act_axi_card_hbm_p26_awregion ) ,
      .m_axi_card_hbm_p26_awsize             ( act_axi_card_hbm_p26_awsize   ) ,
      .m_axi_card_hbm_p26_awuser             (                            ) ,
      .m_axi_card_hbm_p26_awvalid            ( act_axi_card_hbm_p26_awvalid  ) ,
      .m_axi_card_hbm_p26_bid                ( act_axi_card_hbm_p26_bid      ) ,
      .m_axi_card_hbm_p26_bready             ( act_axi_card_hbm_p26_bready   ) ,
      .m_axi_card_hbm_p26_bresp              ( act_axi_card_hbm_p26_bresp    ) ,
      .m_axi_card_hbm_p26_buser              (1'b0                        ) ,
      .m_axi_card_hbm_p26_bvalid             ( act_axi_card_hbm_p26_bvalid   ) ,
      .m_axi_card_hbm_p26_rdata              ( act_axi_card_hbm_p26_rdata    ) ,
      .m_axi_card_hbm_p26_rid                ( act_axi_card_hbm_p26_rid      ) ,
      .m_axi_card_hbm_p26_rlast              ( act_axi_card_hbm_p26_rlast    ) ,
      .m_axi_card_hbm_p26_rready             ( act_axi_card_hbm_p26_rready   ) ,
      .m_axi_card_hbm_p26_rresp              ( act_axi_card_hbm_p26_rresp    ) ,
      .m_axi_card_hbm_p26_ruser              (1'b0                        ) ,
      .m_axi_card_hbm_p26_rvalid             ( act_axi_card_hbm_p26_rvalid   ) ,
      .m_axi_card_hbm_p26_wdata              ( act_axi_card_hbm_p26_wdata    ) ,
      .m_axi_card_hbm_p26_wlast              ( act_axi_card_hbm_p26_wlast    ) ,
      .m_axi_card_hbm_p26_wready             ( act_axi_card_hbm_p26_wready   ) ,
      .m_axi_card_hbm_p26_wstrb              ( act_axi_card_hbm_p26_wstrb    ) ,
      .m_axi_card_hbm_p26_wuser              (                            ) ,
      .m_axi_card_hbm_p26_wvalid             ( act_axi_card_hbm_p26_wvalid   ) ,
      `endif

      `ifdef HBM_AXI_IF_P27
      .m_axi_card_hbm_p27_araddr             ( act_axi_card_hbm_p27_araddr   ) ,
      .m_axi_card_hbm_p27_arburst            ( act_axi_card_hbm_p27_arburst  ) ,
      .m_axi_card_hbm_p27_arcache            ( act_axi_card_hbm_p27_arcache  ) ,
      .m_axi_card_hbm_p27_arid               ( act_axi_card_hbm_p27_arid     ) ,
      .m_axi_card_hbm_p27_arlen              ( act_axi_card_hbm_p27_arlen    ) ,
      .m_axi_card_hbm_p27_arlock             ( act_axi_card_hbm_p27_arlock   ) ,
      .m_axi_card_hbm_p27_arprot             ( act_axi_card_hbm_p27_arprot   ) ,
      .m_axi_card_hbm_p27_arqos              ( act_axi_card_hbm_p27_arqos    ) ,
      .m_axi_card_hbm_p27_arready            ( act_axi_card_hbm_p27_arready  ) ,
      .m_axi_card_hbm_p27_arregion           ( act_axi_card_hbm_p27_arregion ) ,
      .m_axi_card_hbm_p27_arsize             ( act_axi_card_hbm_p27_arsize   ) ,
      .m_axi_card_hbm_p27_aruser             (                            ) ,
      .m_axi_card_hbm_p27_arvalid            ( act_axi_card_hbm_p27_arvalid  ) ,
      .m_axi_card_hbm_p27_awaddr             ( act_axi_card_hbm_p27_awaddr   ) ,
      .m_axi_card_hbm_p27_awburst            ( act_axi_card_hbm_p27_awburst  ) ,
      .m_axi_card_hbm_p27_awcache            ( act_axi_card_hbm_p27_awcache  ) ,
      .m_axi_card_hbm_p27_awid               ( act_axi_card_hbm_p27_awid     ) ,
      .m_axi_card_hbm_p27_awlen              ( act_axi_card_hbm_p27_awlen    ) ,
      .m_axi_card_hbm_p27_awlock             ( act_axi_card_hbm_p27_awlock   ) ,
      .m_axi_card_hbm_p27_awprot             ( act_axi_card_hbm_p27_awprot   ) ,
      .m_axi_card_hbm_p27_awqos              ( act_axi_card_hbm_p27_awqos    ) ,
      .m_axi_card_hbm_p27_awready            ( act_axi_card_hbm_p27_awready  ) ,
      .m_axi_card_hbm_p27_awregion           ( act_axi_card_hbm_p27_awregion ) ,
      .m_axi_card_hbm_p27_awsize             ( act_axi_card_hbm_p27_awsize   ) ,
      .m_axi_card_hbm_p27_awuser             (                            ) ,
      .m_axi_card_hbm_p27_awvalid            ( act_axi_card_hbm_p27_awvalid  ) ,
      .m_axi_card_hbm_p27_bid                ( act_axi_card_hbm_p27_bid      ) ,
      .m_axi_card_hbm_p27_bready             ( act_axi_card_hbm_p27_bready   ) ,
      .m_axi_card_hbm_p27_bresp              ( act_axi_card_hbm_p27_bresp    ) ,
      .m_axi_card_hbm_p27_buser              (1'b0                        ) ,
      .m_axi_card_hbm_p27_bvalid             ( act_axi_card_hbm_p27_bvalid   ) ,
      .m_axi_card_hbm_p27_rdata              ( act_axi_card_hbm_p27_rdata    ) ,
      .m_axi_card_hbm_p27_rid                ( act_axi_card_hbm_p27_rid      ) ,
      .m_axi_card_hbm_p27_rlast              ( act_axi_card_hbm_p27_rlast    ) ,
      .m_axi_card_hbm_p27_rready             ( act_axi_card_hbm_p27_rready   ) ,
      .m_axi_card_hbm_p27_rresp              ( act_axi_card_hbm_p27_rresp    ) ,
      .m_axi_card_hbm_p27_ruser              (1'b0                        ) ,
      .m_axi_card_hbm_p27_rvalid             ( act_axi_card_hbm_p27_rvalid   ) ,
      .m_axi_card_hbm_p27_wdata              ( act_axi_card_hbm_p27_wdata    ) ,
      .m_axi_card_hbm_p27_wlast              ( act_axi_card_hbm_p27_wlast    ) ,
      .m_axi_card_hbm_p27_wready             ( act_axi_card_hbm_p27_wready   ) ,
      .m_axi_card_hbm_p27_wstrb              ( act_axi_card_hbm_p27_wstrb    ) ,
      .m_axi_card_hbm_p27_wuser              (                            ) ,
      .m_axi_card_hbm_p27_wvalid             ( act_axi_card_hbm_p27_wvalid   ) ,
      `endif

      `ifdef HBM_AXI_IF_P28
      .m_axi_card_hbm_p28_araddr             ( act_axi_card_hbm_p28_araddr   ) ,
      .m_axi_card_hbm_p28_arburst            ( act_axi_card_hbm_p28_arburst  ) ,
      .m_axi_card_hbm_p28_arcache            ( act_axi_card_hbm_p28_arcache  ) ,
      .m_axi_card_hbm_p28_arid               ( act_axi_card_hbm_p28_arid     ) ,
      .m_axi_card_hbm_p28_arlen              ( act_axi_card_hbm_p28_arlen    ) ,
      .m_axi_card_hbm_p28_arlock             ( act_axi_card_hbm_p28_arlock   ) ,
      .m_axi_card_hbm_p28_arprot             ( act_axi_card_hbm_p28_arprot   ) ,
      .m_axi_card_hbm_p28_arqos              ( act_axi_card_hbm_p28_arqos    ) ,
      .m_axi_card_hbm_p28_arready            ( act_axi_card_hbm_p28_arready  ) ,
      .m_axi_card_hbm_p28_arregion           ( act_axi_card_hbm_p28_arregion ) ,
      .m_axi_card_hbm_p28_arsize             ( act_axi_card_hbm_p28_arsize   ) ,
      .m_axi_card_hbm_p28_aruser             (                            ) ,
      .m_axi_card_hbm_p28_arvalid            ( act_axi_card_hbm_p28_arvalid  ) ,
      .m_axi_card_hbm_p28_awaddr             ( act_axi_card_hbm_p28_awaddr   ) ,
      .m_axi_card_hbm_p28_awburst            ( act_axi_card_hbm_p28_awburst  ) ,
      .m_axi_card_hbm_p28_awcache            ( act_axi_card_hbm_p28_awcache  ) ,
      .m_axi_card_hbm_p28_awid               ( act_axi_card_hbm_p28_awid     ) ,
      .m_axi_card_hbm_p28_awlen              ( act_axi_card_hbm_p28_awlen    ) ,
      .m_axi_card_hbm_p28_awlock             ( act_axi_card_hbm_p28_awlock   ) ,
      .m_axi_card_hbm_p28_awprot             ( act_axi_card_hbm_p28_awprot   ) ,
      .m_axi_card_hbm_p28_awqos              ( act_axi_card_hbm_p28_awqos    ) ,
      .m_axi_card_hbm_p28_awready            ( act_axi_card_hbm_p28_awready  ) ,
      .m_axi_card_hbm_p28_awregion           ( act_axi_card_hbm_p28_awregion ) ,
      .m_axi_card_hbm_p28_awsize             ( act_axi_card_hbm_p28_awsize   ) ,
      .m_axi_card_hbm_p28_awuser             (                            ) ,
      .m_axi_card_hbm_p28_awvalid            ( act_axi_card_hbm_p28_awvalid  ) ,
      .m_axi_card_hbm_p28_bid                ( act_axi_card_hbm_p28_bid      ) ,
      .m_axi_card_hbm_p28_bready             ( act_axi_card_hbm_p28_bready   ) ,
      .m_axi_card_hbm_p28_bresp              ( act_axi_card_hbm_p28_bresp    ) ,
      .m_axi_card_hbm_p28_buser              (1'b0                        ) ,
      .m_axi_card_hbm_p28_bvalid             ( act_axi_card_hbm_p28_bvalid   ) ,
      .m_axi_card_hbm_p28_rdata              ( act_axi_card_hbm_p28_rdata    ) ,
      .m_axi_card_hbm_p28_rid                ( act_axi_card_hbm_p28_rid      ) ,
      .m_axi_card_hbm_p28_rlast              ( act_axi_card_hbm_p28_rlast    ) ,
      .m_axi_card_hbm_p28_rready             ( act_axi_card_hbm_p28_rready   ) ,
      .m_axi_card_hbm_p28_rresp              ( act_axi_card_hbm_p28_rresp    ) ,
      .m_axi_card_hbm_p28_ruser              (1'b0                        ) ,
      .m_axi_card_hbm_p28_rvalid             ( act_axi_card_hbm_p28_rvalid   ) ,
      .m_axi_card_hbm_p28_wdata              ( act_axi_card_hbm_p28_wdata    ) ,
      .m_axi_card_hbm_p28_wlast              ( act_axi_card_hbm_p28_wlast    ) ,
      .m_axi_card_hbm_p28_wready             ( act_axi_card_hbm_p28_wready   ) ,
      .m_axi_card_hbm_p28_wstrb              ( act_axi_card_hbm_p28_wstrb    ) ,
      .m_axi_card_hbm_p28_wuser              (                            ) ,
      .m_axi_card_hbm_p28_wvalid             ( act_axi_card_hbm_p28_wvalid   ) ,
      `endif

      `ifdef HBM_AXI_IF_P29
      .m_axi_card_hbm_p29_araddr             ( act_axi_card_hbm_p29_araddr   ) ,
      .m_axi_card_hbm_p29_arburst            ( act_axi_card_hbm_p29_arburst  ) ,
      .m_axi_card_hbm_p29_arcache            ( act_axi_card_hbm_p29_arcache  ) ,
      .m_axi_card_hbm_p29_arid               ( act_axi_card_hbm_p29_arid     ) ,
      .m_axi_card_hbm_p29_arlen              ( act_axi_card_hbm_p29_arlen    ) ,
      .m_axi_card_hbm_p29_arlock             ( act_axi_card_hbm_p29_arlock   ) ,
      .m_axi_card_hbm_p29_arprot             ( act_axi_card_hbm_p29_arprot   ) ,
      .m_axi_card_hbm_p29_arqos              ( act_axi_card_hbm_p29_arqos    ) ,
      .m_axi_card_hbm_p29_arready            ( act_axi_card_hbm_p29_arready  ) ,
      .m_axi_card_hbm_p29_arregion           ( act_axi_card_hbm_p29_arregion ) ,
      .m_axi_card_hbm_p29_arsize             ( act_axi_card_hbm_p29_arsize   ) ,
      .m_axi_card_hbm_p29_aruser             (                            ) ,
      .m_axi_card_hbm_p29_arvalid            ( act_axi_card_hbm_p29_arvalid  ) ,
      .m_axi_card_hbm_p29_awaddr             ( act_axi_card_hbm_p29_awaddr   ) ,
      .m_axi_card_hbm_p29_awburst            ( act_axi_card_hbm_p29_awburst  ) ,
      .m_axi_card_hbm_p29_awcache            ( act_axi_card_hbm_p29_awcache  ) ,
      .m_axi_card_hbm_p29_awid               ( act_axi_card_hbm_p29_awid     ) ,
      .m_axi_card_hbm_p29_awlen              ( act_axi_card_hbm_p29_awlen    ) ,
      .m_axi_card_hbm_p29_awlock             ( act_axi_card_hbm_p29_awlock   ) ,
      .m_axi_card_hbm_p29_awprot             ( act_axi_card_hbm_p29_awprot   ) ,
      .m_axi_card_hbm_p29_awqos              ( act_axi_card_hbm_p29_awqos    ) ,
      .m_axi_card_hbm_p29_awready            ( act_axi_card_hbm_p29_awready  ) ,
      .m_axi_card_hbm_p29_awregion           ( act_axi_card_hbm_p29_awregion ) ,
      .m_axi_card_hbm_p29_awsize             ( act_axi_card_hbm_p29_awsize   ) ,
      .m_axi_card_hbm_p29_awuser             (                            ) ,
      .m_axi_card_hbm_p29_awvalid            ( act_axi_card_hbm_p29_awvalid  ) ,
      .m_axi_card_hbm_p29_bid                ( act_axi_card_hbm_p29_bid      ) ,
      .m_axi_card_hbm_p29_bready             ( act_axi_card_hbm_p29_bready   ) ,
      .m_axi_card_hbm_p29_bresp              ( act_axi_card_hbm_p29_bresp    ) ,
      .m_axi_card_hbm_p29_buser              (1'b0                        ) ,
      .m_axi_card_hbm_p29_bvalid             ( act_axi_card_hbm_p29_bvalid   ) ,
      .m_axi_card_hbm_p29_rdata              ( act_axi_card_hbm_p29_rdata    ) ,
      .m_axi_card_hbm_p29_rid                ( act_axi_card_hbm_p29_rid      ) ,
      .m_axi_card_hbm_p29_rlast              ( act_axi_card_hbm_p29_rlast    ) ,
      .m_axi_card_hbm_p29_rready             ( act_axi_card_hbm_p29_rready   ) ,
      .m_axi_card_hbm_p29_rresp              ( act_axi_card_hbm_p29_rresp    ) ,
      .m_axi_card_hbm_p29_ruser              (1'b0                        ) ,
      .m_axi_card_hbm_p29_rvalid             ( act_axi_card_hbm_p29_rvalid   ) ,
      .m_axi_card_hbm_p29_wdata              ( act_axi_card_hbm_p29_wdata    ) ,
      .m_axi_card_hbm_p29_wlast              ( act_axi_card_hbm_p29_wlast    ) ,
      .m_axi_card_hbm_p29_wready             ( act_axi_card_hbm_p29_wready   ) ,
      .m_axi_card_hbm_p29_wstrb              ( act_axi_card_hbm_p29_wstrb    ) ,
      .m_axi_card_hbm_p29_wuser              (                            ) ,
      .m_axi_card_hbm_p29_wvalid             ( act_axi_card_hbm_p29_wvalid   ) ,
      `endif

      `ifdef HBM_AXI_IF_P30
      .m_axi_card_hbm_p30_araddr             ( act_axi_card_hbm_p30_araddr   ) ,
      .m_axi_card_hbm_p30_arburst            ( act_axi_card_hbm_p30_arburst  ) ,
      .m_axi_card_hbm_p30_arcache            ( act_axi_card_hbm_p30_arcache  ) ,
      .m_axi_card_hbm_p30_arid               ( act_axi_card_hbm_p30_arid     ) ,
      .m_axi_card_hbm_p30_arlen              ( act_axi_card_hbm_p30_arlen    ) ,
      .m_axi_card_hbm_p30_arlock             ( act_axi_card_hbm_p30_arlock   ) ,
      .m_axi_card_hbm_p30_arprot             ( act_axi_card_hbm_p30_arprot   ) ,
      .m_axi_card_hbm_p30_arqos              ( act_axi_card_hbm_p30_arqos    ) ,
      .m_axi_card_hbm_p30_arready            ( act_axi_card_hbm_p30_arready  ) ,
      .m_axi_card_hbm_p30_arregion           ( act_axi_card_hbm_p30_arregion ) ,
      .m_axi_card_hbm_p30_arsize             ( act_axi_card_hbm_p30_arsize   ) ,
      .m_axi_card_hbm_p30_aruser             (                            ) ,
      .m_axi_card_hbm_p30_arvalid            ( act_axi_card_hbm_p30_arvalid  ) ,
      .m_axi_card_hbm_p30_awaddr             ( act_axi_card_hbm_p30_awaddr   ) ,
      .m_axi_card_hbm_p30_awburst            ( act_axi_card_hbm_p30_awburst  ) ,
      .m_axi_card_hbm_p30_awcache            ( act_axi_card_hbm_p30_awcache  ) ,
      .m_axi_card_hbm_p30_awid               ( act_axi_card_hbm_p30_awid     ) ,
      .m_axi_card_hbm_p30_awlen              ( act_axi_card_hbm_p30_awlen    ) ,
      .m_axi_card_hbm_p30_awlock             ( act_axi_card_hbm_p30_awlock   ) ,
      .m_axi_card_hbm_p30_awprot             ( act_axi_card_hbm_p30_awprot   ) ,
      .m_axi_card_hbm_p30_awqos              ( act_axi_card_hbm_p30_awqos    ) ,
      .m_axi_card_hbm_p30_awready            ( act_axi_card_hbm_p30_awready  ) ,
      .m_axi_card_hbm_p30_awregion           ( act_axi_card_hbm_p30_awregion ) ,
      .m_axi_card_hbm_p30_awsize             ( act_axi_card_hbm_p30_awsize   ) ,
      .m_axi_card_hbm_p30_awuser             (                            ) ,
      .m_axi_card_hbm_p30_awvalid            ( act_axi_card_hbm_p30_awvalid  ) ,
      .m_axi_card_hbm_p30_bid                ( act_axi_card_hbm_p30_bid      ) ,
      .m_axi_card_hbm_p30_bready             ( act_axi_card_hbm_p30_bready   ) ,
      .m_axi_card_hbm_p30_bresp              ( act_axi_card_hbm_p30_bresp    ) ,
      .m_axi_card_hbm_p30_buser              (1'b0                        ) ,
      .m_axi_card_hbm_p30_bvalid             ( act_axi_card_hbm_p30_bvalid   ) ,
      .m_axi_card_hbm_p30_rdata              ( act_axi_card_hbm_p30_rdata    ) ,
      .m_axi_card_hbm_p30_rid                ( act_axi_card_hbm_p30_rid      ) ,
      .m_axi_card_hbm_p30_rlast              ( act_axi_card_hbm_p30_rlast    ) ,
      .m_axi_card_hbm_p30_rready             ( act_axi_card_hbm_p30_rready   ) ,
      .m_axi_card_hbm_p30_rresp              ( act_axi_card_hbm_p30_rresp    ) ,
      .m_axi_card_hbm_p30_ruser              (1'b0                        ) ,
      .m_axi_card_hbm_p30_rvalid             ( act_axi_card_hbm_p30_rvalid   ) ,
      .m_axi_card_hbm_p30_wdata              ( act_axi_card_hbm_p30_wdata    ) ,
      .m_axi_card_hbm_p30_wlast              ( act_axi_card_hbm_p30_wlast    ) ,
      .m_axi_card_hbm_p30_wready             ( act_axi_card_hbm_p30_wready   ) ,
      .m_axi_card_hbm_p30_wstrb              ( act_axi_card_hbm_p30_wstrb    ) ,
      .m_axi_card_hbm_p30_wuser              (                            ) ,
      .m_axi_card_hbm_p30_wvalid             ( act_axi_card_hbm_p30_wvalid   ) ,
      `endif

      `ifdef HBM_AXI_IF_P31
      .m_axi_card_hbm_p31_araddr             ( act_axi_card_hbm_p31_araddr   ) ,
      .m_axi_card_hbm_p31_arburst            ( act_axi_card_hbm_p31_arburst  ) ,
      .m_axi_card_hbm_p31_arcache            ( act_axi_card_hbm_p31_arcache  ) ,
      .m_axi_card_hbm_p31_arid               ( act_axi_card_hbm_p31_arid     ) ,
      .m_axi_card_hbm_p31_arlen              ( act_axi_card_hbm_p31_arlen    ) ,
      .m_axi_card_hbm_p31_arlock             ( act_axi_card_hbm_p31_arlock   ) ,
      .m_axi_card_hbm_p31_arprot             ( act_axi_card_hbm_p31_arprot   ) ,
      .m_axi_card_hbm_p31_arqos              ( act_axi_card_hbm_p31_arqos    ) ,
      .m_axi_card_hbm_p31_arready            ( act_axi_card_hbm_p31_arready  ) ,
      .m_axi_card_hbm_p31_arregion           ( act_axi_card_hbm_p31_arregion ) ,
      .m_axi_card_hbm_p31_arsize             ( act_axi_card_hbm_p31_arsize   ) ,
      .m_axi_card_hbm_p31_aruser             (                            ) ,
      .m_axi_card_hbm_p31_arvalid            ( act_axi_card_hbm_p31_arvalid  ) ,
      .m_axi_card_hbm_p31_awaddr             ( act_axi_card_hbm_p31_awaddr   ) ,
      .m_axi_card_hbm_p31_awburst            ( act_axi_card_hbm_p31_awburst  ) ,
      .m_axi_card_hbm_p31_awcache            ( act_axi_card_hbm_p31_awcache  ) ,
      .m_axi_card_hbm_p31_awid               ( act_axi_card_hbm_p31_awid     ) ,
      .m_axi_card_hbm_p31_awlen              ( act_axi_card_hbm_p31_awlen    ) ,
      .m_axi_card_hbm_p31_awlock             ( act_axi_card_hbm_p31_awlock   ) ,
      .m_axi_card_hbm_p31_awprot             ( act_axi_card_hbm_p31_awprot   ) ,
      .m_axi_card_hbm_p31_awqos              ( act_axi_card_hbm_p31_awqos    ) ,
      .m_axi_card_hbm_p31_awready            ( act_axi_card_hbm_p31_awready  ) ,
      .m_axi_card_hbm_p31_awregion           ( act_axi_card_hbm_p31_awregion ) ,
      .m_axi_card_hbm_p31_awsize             ( act_axi_card_hbm_p31_awsize   ) ,
      .m_axi_card_hbm_p31_awuser             (                            ) ,
      .m_axi_card_hbm_p31_awvalid            ( act_axi_card_hbm_p31_awvalid  ) ,
      .m_axi_card_hbm_p31_bid                ( act_axi_card_hbm_p31_bid      ) ,
      .m_axi_card_hbm_p31_bready             ( act_axi_card_hbm_p31_bready   ) ,
      .m_axi_card_hbm_p31_bresp              ( act_axi_card_hbm_p31_bresp    ) ,
      .m_axi_card_hbm_p31_buser              (1'b0                        ) ,
      .m_axi_card_hbm_p31_bvalid             ( act_axi_card_hbm_p31_bvalid   ) ,
      .m_axi_card_hbm_p31_rdata              ( act_axi_card_hbm_p31_rdata    ) ,
      .m_axi_card_hbm_p31_rid                ( act_axi_card_hbm_p31_rid      ) ,
      .m_axi_card_hbm_p31_rlast              ( act_axi_card_hbm_p31_rlast    ) ,
      .m_axi_card_hbm_p31_rready             ( act_axi_card_hbm_p31_rready   ) ,
      .m_axi_card_hbm_p31_rresp              ( act_axi_card_hbm_p31_rresp    ) ,
      .m_axi_card_hbm_p31_ruser              (1'b0                        ) ,
      .m_axi_card_hbm_p31_rvalid             ( act_axi_card_hbm_p31_rvalid   ) ,
      .m_axi_card_hbm_p31_wdata              ( act_axi_card_hbm_p31_wdata    ) ,
      .m_axi_card_hbm_p31_wlast              ( act_axi_card_hbm_p31_wlast    ) ,
      .m_axi_card_hbm_p31_wready             ( act_axi_card_hbm_p31_wready   ) ,
      .m_axi_card_hbm_p31_wstrb              ( act_axi_card_hbm_p31_wstrb    ) ,
      .m_axi_card_hbm_p31_wuser              (                            ) ,
      .m_axi_card_hbm_p31_wvalid             ( act_axi_card_hbm_p31_wvalid   ) ,
      `endif
`endif
`endif

`ifdef ENABLE_9H3_LED
      .user_led_a0                        ( user_led_a0                ),
      .user_led_a1                        ( user_led_a1                ),
      .user_led_g0                        ( user_led_g0                ),
      .user_led_g1                        ( user_led_g1                ),
`endif
`ifdef ENABLE_9H3_EEPROM
      .eeprom_scl_io                      ( eeprom_scl_io              ),
      .eeprom_sda_io                      ( eeprom_sda_io              ),
      .eeprom_wp                          ( eeprom_wp                  ),
`endif
`ifdef ENABLE_9H3_AVR
      .uc_avr_rx                          ( uc_avr_rx                  ),
      .uc_avr_tx                          ( uc_avr_tx                  ),
      .uc_avr_ck                          ( uc_avr_ck                  ),
 `endif

      //
      // AXI Control Register Interface
      .s_axi_ctrl_reg_araddr              ( lite_conv2act_araddr       ) ,
      .s_axi_ctrl_reg_arready             ( lite_act2conv_arready      ) ,
      .s_axi_ctrl_reg_arvalid             ( lite_conv2act_arvalid      ) ,
      .s_axi_ctrl_reg_awaddr              ( lite_conv2act_awaddr       ) ,
      .s_axi_ctrl_reg_awready             ( lite_act2conv_awready      ) ,
      .s_axi_ctrl_reg_awvalid             ( lite_conv2act_awvalid      ) ,
      .s_axi_ctrl_reg_bready              ( lite_conv2act_bready       ) ,
      .s_axi_ctrl_reg_bresp               ( lite_act2conv_bresp        ) ,
      .s_axi_ctrl_reg_bvalid              ( lite_act2conv_bvalid       ) ,
      .s_axi_ctrl_reg_rdata               ( lite_act2conv_rdata        ) ,
      .s_axi_ctrl_reg_rready              ( lite_conv2act_rready       ) ,
      .s_axi_ctrl_reg_rresp               ( lite_act2conv_rresp        ) ,
      .s_axi_ctrl_reg_rvalid              ( lite_act2conv_rvalid       ) ,
      .s_axi_ctrl_reg_wdata               ( lite_conv2act_wdata        ) ,
      .s_axi_ctrl_reg_wready              ( lite_act2conv_wready       ) ,
      .s_axi_ctrl_reg_wstrb               ( lite_conv2act_wstrb        ) ,
      .s_axi_ctrl_reg_wvalid              ( lite_conv2act_wvalid       ) ,
      //
      // AXI Host Memory Interface
      .m_axi_host_mem_araddr              ( mm_act2conv_araddr         ) ,
      .m_axi_host_mem_arburst             ( mm_act2conv_arburst        ) ,
      .m_axi_host_mem_arcache             ( mm_act2conv_arcache        ) ,
      .m_axi_host_mem_arid                ( mm_act2conv_arid           ) ,
      .m_axi_host_mem_arlen               ( mm_act2conv_arlen          ) ,
      .m_axi_host_mem_arlock              (                            ) ,
      .m_axi_host_mem_arprot              ( mm_act2conv_arprot         ) ,
      .m_axi_host_mem_arqos               ( mm_act2conv_arqos          ) ,
      .m_axi_host_mem_arready             ( mm_conv2act_arready        ) ,
      .m_axi_host_mem_arregion            (                            ) ,
      .m_axi_host_mem_arsize              ( mm_act2conv_arsize         ) ,
      .m_axi_host_mem_aruser              ( mm_act2conv_aruser         ) ,
      .m_axi_host_mem_arvalid             ( mm_act2conv_arvalid        ) ,
      .m_axi_host_mem_awaddr              ( mm_act2conv_awaddr         ) ,
      .m_axi_host_mem_awburst             ( mm_act2conv_awburst        ) ,
      .m_axi_host_mem_awcache             ( mm_act2conv_awcache        ) ,
      .m_axi_host_mem_awid                ( mm_act2conv_awid           ) ,
      .m_axi_host_mem_awlen               ( mm_act2conv_awlen          ) ,
      .m_axi_host_mem_awlock              (                            ) ,
      .m_axi_host_mem_awprot              ( mm_act2conv_awprot         ) ,
      .m_axi_host_mem_awqos               ( mm_act2conv_awqos          ) ,
      .m_axi_host_mem_awready             ( mm_conv2act_awready        ) ,
      .m_axi_host_mem_awregion            (                            ) ,
      .m_axi_host_mem_awsize              ( mm_act2conv_awsize         ) ,
      .m_axi_host_mem_awuser              ( mm_act2conv_awuser         ) ,
      .m_axi_host_mem_awvalid             ( mm_act2conv_awvalid        ) ,
      .m_axi_host_mem_bid                 ( mm_conv2act_bid            ) ,
      .m_axi_host_mem_bready              ( mm_act2conv_bready         ) ,
      .m_axi_host_mem_bresp               ( mm_conv2act_bresp          ) ,
      .m_axi_host_mem_buser               ( mm_conv2act_buser          ) ,
      .m_axi_host_mem_bvalid              ( mm_conv2act_bvalid         ) ,
      .m_axi_host_mem_rdata               ( mm_conv2act_rdata          ) ,
      .m_axi_host_mem_rid                 ( mm_conv2act_rid            ) ,
      .m_axi_host_mem_rlast               ( mm_conv2act_rlast          ) ,
      .m_axi_host_mem_rready              ( mm_act2conv_rready         ) ,
      .m_axi_host_mem_rresp               ( mm_conv2act_rresp          ) ,
      .m_axi_host_mem_ruser               ( mm_conv2act_ruser          ) ,
      .m_axi_host_mem_rvalid              ( mm_conv2act_rvalid         ) ,
      .m_axi_host_mem_wdata               ( mm_act2conv_wdata          ) ,
      .m_axi_host_mem_wlast               ( mm_act2conv_wlast          ) ,
      .m_axi_host_mem_wready              ( mm_conv2act_wready         ) ,
      .m_axi_host_mem_wstrb               ( mm_act2conv_wstrb          ) ,
      .m_axi_host_mem_wuser               (                            ) ,
      .m_axi_host_mem_wvalid              ( mm_act2conv_wvalid         )
 ) ;  // action_w: action_wrapper

`else  //`ifdef ENABLE_ODMA
    //TODO
    assign int_req_ack = 1'b0;
    // ODMA Mode action_wrapper
  action_wrapper action_w (
      .ap_clk                                ( clock_act               ) ,
      .ap_rst_n                              ( ~reset_action_q         ) ,
      .interrupt_ack                         ( int_req_ack             ) ,
      .interrupt                             ( int_req                 ) ,
      .interrupt_src                         ( int_src                 ) ,
      .interrupt_ctx                         ( int_ctx                 ) ,
`ifndef ENABLE_ODMA_ST_MODE
      .axi_mm_araddr                         ( axi_mm_araddr           ) ,
      .axi_mm_arburst                        ( axi_mm_arburst          ) ,
      .axi_mm_arcache                        ( axi_mm_arcache          ) ,
      .axi_mm_arid                           ( axi_mm_arid             ) ,
      .axi_mm_arlen                          ( axi_mm_arlen            ) ,
      .axi_mm_arlock                         ( axi_mm_arlock           ) ,
      .axi_mm_arprot                         ( axi_mm_arprot           ) ,
      .axi_mm_arqos                          ( axi_mm_arqos            ) ,
      .axi_mm_arready                        ( axi_mm_arready          ) ,
      .axi_mm_arregion                       ( axi_mm_arregion         ) ,
      .axi_mm_arsize                         ( axi_mm_arsize           ) ,
      .axi_mm_aruser                         ( axi_mm_aruser           ) ,
      .axi_mm_arvalid                        ( axi_mm_arvalid          ) ,
      .axi_mm_rdata                          ( axi_mm_rdata            ) ,
      .axi_mm_rid                            ( axi_mm_rid              ) ,
      .axi_mm_rlast                          ( axi_mm_rlast            ) ,
      .axi_mm_rready                         ( axi_mm_rready           ) ,
      .axi_mm_rresp                          ( axi_mm_rresp            ) ,
      .axi_mm_ruser                          ( axi_mm_ruser            ) ,
      .axi_mm_rvalid                         ( axi_mm_rvalid           ) ,
      .axi_mm_awaddr                         ( axi_mm_awaddr           ) ,
      .axi_mm_awburst                        ( axi_mm_awburst          ) ,
      .axi_mm_awcache                        ( axi_mm_awcache          ) ,
      .axi_mm_awid                           ( axi_mm_awid             ) ,
      .axi_mm_awlen                          ( axi_mm_awlen            ) ,
      .axi_mm_awlock                         ( axi_mm_awlock           ) ,
      .axi_mm_awprot                         ( axi_mm_awprot           ) ,
      .axi_mm_awqos                          ( axi_mm_awqos            ) ,
      .axi_mm_awready                        ( axi_mm_awready          ) ,
      .axi_mm_awregion                       ( axi_mm_awregion         ) ,
      .axi_mm_awsize                         ( axi_mm_awsize           ) ,
      .axi_mm_awuser                         ( axi_mm_awuser           ) ,
      .axi_mm_awvalid                        ( axi_mm_awvalid          ) ,
      .axi_mm_wdata                          ( axi_mm_wdata            ) ,
      .axi_mm_wstrb                          ( axi_mm_wstrb            ) ,
      .axi_mm_wlast                          ( axi_mm_wlast            ) ,
      .axi_mm_wuser                          ( axi_mm_wuser            ) ,
      .axi_mm_wvalid                         ( axi_mm_wvalid           ) ,
      .axi_mm_wready                         ( axi_mm_wready           ) ,
      .axi_mm_bvalid                         ( axi_mm_bvalid           ) ,
      .axi_mm_bresp                          ( axi_mm_bresp            ) ,
      .axi_mm_buser                          ( axi_mm_buser            ) ,
      .axi_mm_bid                            ( axi_mm_bid              ) ,
      .axi_mm_bready                         ( axi_mm_bready           ) ,
`else
      .m_axis_tready                         ( m_axis_tready           ) ,
      .m_axis_tlast                          ( m_axis_tlast            ) ,
      .m_axis_tdata                          ( m_axis_tdata            ) ,
      .m_axis_tkeep                          ( m_axis_tkeep            ) ,
      .m_axis_tvalid                         ( m_axis_tvalid           ) ,
      .m_axis_tid                            ( m_axis_tid              ) ,
      .m_axis_tuser                          ( m_axis_tuser            ) ,
      .s_axis_tready                         ( s_axis_tready           ) ,
      .s_axis_tlast                          ( s_axis_tlast            ) ,
      .s_axis_tdata                          ( s_axis_tdata            ) ,
      .s_axis_tkeep                          ( s_axis_tkeep            ) ,
      .s_axis_tvalid                         ( s_axis_tvalid           ) ,
      .s_axis_tid                            ( s_axis_tid              ) ,
      .s_axis_tuser                          ( s_axis_tuser            ) ,
`endif
      .a_s_axi_arvalid                       ( a_m_axi_arvalid         ) ,
      .a_s_axi_araddr                        ( a_m_axi_araddr          ) ,
      .a_s_axi_arready                       ( a_m_axi_arready         ) ,
      .a_s_axi_rvalid                        ( a_m_axi_rvalid          ) ,
      .a_s_axi_rdata                         ( a_m_axi_rdata           ) ,
      .a_s_axi_rresp                         ( a_m_axi_rresp           ) ,
      .a_s_axi_rready                        ( a_m_axi_rready          ) ,
      .a_s_axi_awvalid                       ( a_m_axi_awvalid         ) ,
      .a_s_axi_awaddr                        ( a_m_axi_awaddr          ) ,
      .a_s_axi_awready                       ( a_m_axi_awready         ) ,
      .a_s_axi_wvalid                        ( a_m_axi_wvalid          ) ,
      .a_s_axi_wdata                         ( a_m_axi_wdata           ) ,
      .a_s_axi_wstrb                         ( a_m_axi_wstrb           ) ,
      .a_s_axi_wready                        ( a_m_axi_wready          ) ,
      .a_s_axi_bvalid                        ( a_m_axi_bvalid          ) ,
      .a_s_axi_bresp                         ( a_m_axi_bresp           ) ,
      .a_s_axi_bready                        ( a_m_axi_bready          ) ,
      .a_m_axi_arvalid                       ( a_s_axi_arvalid         ) ,
      .a_m_axi_araddr                        ( a_s_axi_araddr          ) ,
      .a_m_axi_arready                       ( a_s_axi_arready         ) ,
      .a_m_axi_rvalid                        ( a_s_axi_rvalid          ) ,
      .a_m_axi_rdata                         ( a_s_axi_rdata           ) ,
      .a_m_axi_rresp                         ( a_s_axi_rresp           ) ,
      .a_m_axi_rready                        ( a_s_axi_rready          ) ,
      .a_m_axi_awvalid                       ( a_s_axi_awvalid         ) ,
      .a_m_axi_awaddr                        ( a_s_axi_awaddr          ) ,
      .a_m_axi_awready                       ( a_s_axi_awready         ) ,
      .a_m_axi_wvalid                        ( a_s_axi_wvalid          ) ,
      .a_m_axi_wdata                         ( a_s_axi_wdata           ) ,
      .a_m_axi_wstrb                         ( a_s_axi_wstrb           ) ,
      .a_m_axi_wready                        ( a_s_axi_wready          ) ,
      .a_m_axi_bvalid                        ( a_s_axi_bvalid          ) ,
      .a_m_axi_bresp                         ( a_s_axi_bresp           ) ,
      .a_m_axi_bready                        ( a_s_axi_bready          )
) ;  // action_w: action_wrapper
`endif

  // // ******************************************************************************
  // // Convertor for Action to Card mem controller
  // // ******************************************************************************

// if DDR or DDR replaced by BRAM
`ifdef ENABLE_AXI_CARD_MEM
`ifndef ENABLE_HBM
  //
  // AXI_CLOCK_CONVERTER_ACT2MEM
  //
  axi_clock_converter_act2mem axi_clkconv_act2mem (
      .s_axi_aclk                         ( clock_act                           ) ,
      .s_axi_aresetn                      ( ~reset_action_q                     ) ,
      .m_axi_aclk                         ( clock_mem                           ) ,
      .m_axi_aresetn                      ( memctl0_axi_rst_n                   ) ,
      //
      // FROM ACTION
      .s_axi_araddr                       ( act_axi_card_mem0_araddr            ) ,
      .s_axi_arburst                      ( act_axi_card_mem0_arburst           ) ,
      .s_axi_arcache                      ( act_axi_card_mem0_arcache           ) ,
      .s_axi_arid                         ( act_axi_card_mem0_arid              ) ,
      .s_axi_arlen                        ( act_axi_card_mem0_arlen             ) ,
      .s_axi_arlock                       ( act_axi_card_mem0_arlock[0]         ) ,
      .s_axi_arprot                       ( act_axi_card_mem0_arprot            ) ,
      .s_axi_arqos                        ( act_axi_card_mem0_arqos             ) ,
      .s_axi_arready                      ( act_axi_card_mem0_arready           ) ,
      .s_axi_arregion                     ( act_axi_card_mem0_arregion          ) ,
      .s_axi_arsize                       ( act_axi_card_mem0_arsize            ) ,
      .s_axi_arvalid                      ( act_axi_card_mem0_arvalid           ) ,
      .s_axi_awaddr                       ( act_axi_card_mem0_awaddr            ) ,
      .s_axi_awburst                      ( act_axi_card_mem0_awburst           ) ,
      .s_axi_awcache                      ( act_axi_card_mem0_awcache           ) ,
      .s_axi_awid                         ( act_axi_card_mem0_awid              ) ,
      .s_axi_awlen                        ( act_axi_card_mem0_awlen             ) ,
      .s_axi_awlock                       ( act_axi_card_mem0_awlock[0]         ) ,
      .s_axi_awprot                       ( act_axi_card_mem0_awprot            ) ,
      .s_axi_awqos                        ( act_axi_card_mem0_awqos             ) ,
      .s_axi_awready                      ( act_axi_card_mem0_awready           ) ,
      .s_axi_awregion                     ( act_axi_card_mem0_awregion          ) ,
      .s_axi_awsize                       ( act_axi_card_mem0_awsize            ) ,
      .s_axi_awvalid                      ( act_axi_card_mem0_awvalid           ) ,
      .s_axi_bid                          ( act_axi_card_mem0_bid               ) ,
      .s_axi_bready                       ( act_axi_card_mem0_bready            ) ,
      .s_axi_bresp                        ( act_axi_card_mem0_bresp             ) ,
      .s_axi_bvalid                       ( act_axi_card_mem0_bvalid            ) ,
      .s_axi_rdata                        ( act_axi_card_mem0_rdata             ) ,
      .s_axi_rid                          ( act_axi_card_mem0_rid               ) ,
      .s_axi_rlast                        ( act_axi_card_mem0_rlast             ) ,
      .s_axi_rready                       ( act_axi_card_mem0_rready            ) ,
      .s_axi_rresp                        ( act_axi_card_mem0_rresp             ) ,
      .s_axi_rvalid                       ( act_axi_card_mem0_rvalid            ) ,
      .s_axi_wdata                        ( act_axi_card_mem0_wdata             ) ,
      .s_axi_wlast                        ( act_axi_card_mem0_wlast             ) ,
      .s_axi_wready                       ( act_axi_card_mem0_wready            ) ,
      .s_axi_wstrb                        ( act_axi_card_mem0_wstrb             ) ,
      .s_axi_wvalid                       ( act_axi_card_mem0_wvalid            ) ,
      //
      // TO DDR MIG or BRAM
      .m_axi_araddr                       ( memctl0_axi_araddr                  ) ,
      .m_axi_arburst                      ( memctl0_axi_arburst                 ) ,
      .m_axi_arcache                      ( memctl0_axi_arcache                 ) ,
      .m_axi_arid                         ( memctl0_axi_arid                    ) ,
      .m_axi_arlen                        ( memctl0_axi_arlen                   ) ,
      .m_axi_arlock                       ( memctl0_axi_arlock                  ) ,
      .m_axi_arprot                       ( memctl0_axi_arprot                  ) ,
      .m_axi_arqos                        ( memctl0_axi_arqos                   ) ,
      .m_axi_arready                      ( memctl0_axi_arready                 ) ,
      .m_axi_arregion                     ( memctl0_axi_arregion                ) ,
      .m_axi_arsize                       ( memctl0_axi_arsize                  ) ,
      .m_axi_arvalid                      ( memctl0_axi_arvalid                 ) ,
      .m_axi_awaddr                       ( memctl0_axi_awaddr                  ) ,
      .m_axi_awburst                      ( memctl0_axi_awburst                 ) ,
      .m_axi_awcache                      ( memctl0_axi_awcache                 ) ,
      .m_axi_awid                         ( memctl0_axi_awid                    ) ,
      .m_axi_awlen                        ( memctl0_axi_awlen                   ) ,
      .m_axi_awlock                       ( memctl0_axi_awlock                  ) ,
      .m_axi_awprot                       ( memctl0_axi_awprot                  ) ,
      .m_axi_awqos                        ( memctl0_axi_awqos                   ) ,
      .m_axi_awready                      ( memctl0_axi_awready                 ) ,
      .m_axi_awregion                     ( memctl0_axi_awregion                ) ,
      .m_axi_awsize                       ( memctl0_axi_awsize                  ) ,
      .m_axi_awvalid                      ( memctl0_axi_awvalid                 ) ,
      .m_axi_bid                          ( memctl0_axi_bid                     ) ,
      .m_axi_bready                       ( memctl0_axi_bready                  ) ,
      .m_axi_bresp                        ( memctl0_axi_bresp                   ) ,
      .m_axi_bvalid                       ( memctl0_axi_bvalid                  ) ,
      .m_axi_rdata                        ( memctl0_axi_rdata                   ) ,
      .m_axi_rid                          ( memctl0_axi_rid                     ) ,
      .m_axi_rlast                        ( memctl0_axi_rlast                   ) ,
      .m_axi_rready                       ( memctl0_axi_rready                  ) ,
      .m_axi_rresp                        ( memctl0_axi_rresp                   ) ,
      .m_axi_rvalid                       ( memctl0_axi_rvalid                  ) ,
      .m_axi_wdata                        ( memctl0_axi_wdata                   ) ,
      .m_axi_wlast                        ( memctl0_axi_wlast                   ) ,
      .m_axi_wready                       ( memctl0_axi_wready                  ) ,
      .m_axi_wstrb                        ( memctl0_axi_wstrb                   ) ,
      .m_axi_wvalid                       ( memctl0_axi_wvalid                  )
    );  // axi_clkconv_act2mem: axi_clock_converter_act2mem

  //
  // SDRAM
  //
assign  memctl0_axi_ctrl_awvalid   = 0;
assign  memctl0_axi_ctrl_awaddr    = 0;
assign  memctl0_axi_ctrl_wvalid    = 0;
assign  memctl0_axi_ctrl_wdata     = 0;
assign  memctl0_axi_ctrl_bready    = 0;
assign  memctl0_axi_ctrl_arvalid   = 0;
assign  memctl0_axi_ctrl_araddr    = 0;
assign  memctl0_axi_ctrl_rready    = 0;

`endif
`endif



  // // ******************************************************************************
  // // Card mem controllers
  // // ******************************************************************************




// if DDR replaced by  BRAM
`ifndef ENABLE_HBM
`ifdef ENABLE_BRAM
  //
  // BLOCK RAM
  //
  block_RAM block_ram_i0
  (
      .s_aresetn                          ( memctl0_axi_rst_n                              ) ,
      .s_aclk                             ( clock_mem                                      ) ,
      .s_axi_araddr                       ( memctl0_axi_araddr[31 : 0]                     ) ,
      .s_axi_arburst                      ( memctl0_axi_arburst                            ) ,
      .s_axi_arid                         ( memctl0_axi_arid                               ) ,
      .s_axi_arlen                        ( memctl0_axi_arlen                              ) ,
      .s_axi_arready                      ( memctl0_axi_arready                            ) ,
      .s_axi_arsize                       ( 3'b101                                         ) ,
      .s_axi_arvalid                      ( memctl0_axi_arvalid                            ) ,
      .s_axi_awaddr                       ( memctl0_axi_awaddr[31 : 0]                     ) ,
      .s_axi_awburst                      ( memctl0_axi_awburst                            ) ,
      .s_axi_awid                         ( memctl0_axi_awid                               ) ,
      .s_axi_awlen                        ( memctl0_axi_awlen                              ) ,
      .s_axi_awready                      ( memctl0_axi_awready                            ) ,
      .s_axi_awsize                       ( 3'b101                                         ) ,
      .s_axi_awvalid                      ( memctl0_axi_awvalid                            ) ,
      .s_axi_bid                          ( memctl0_axi_bid                                ) ,
      .s_axi_bready                       ( memctl0_axi_bready                             ) ,
      .s_axi_bresp                        ( memctl0_axi_bresp                              ) ,
      .s_axi_bvalid                       ( memctl0_axi_bvalid                             ) ,
      .s_axi_rdata                        ( memctl0_axi_rdata[(`AXI_CARD_MEM_DATA_WIDTH/2-1 ): 0]    ) ,
      .s_axi_rid                          ( memctl0_axi_rid                                ) ,
      .s_axi_rlast                        ( memctl0_axi_rlast                              ) ,
      .s_axi_rready                       ( memctl0_axi_rready                             ) ,
      .s_axi_rresp                        ( memctl0_axi_rresp                              ) ,
      .s_axi_rvalid                       ( memctl0_axi_rvalid                             ) ,
      .s_axi_wdata                        ( memctl0_axi_wdata[(`AXI_CARD_MEM_DATA_WIDTH/2) -1 : 0] ) ,
      .s_axi_wlast                        ( memctl0_axi_wlast                              ) ,
      .s_axi_wready                       ( memctl0_axi_wready                             ) ,
      .s_axi_wstrb                        ( memctl0_axi_wstrb[(`AXI_CARD_MEM_DATA_WIDTH/16) -1 : 0] ) ,
      .s_axi_wvalid                       ( memctl0_axi_wvalid                             )
    );  // block_ram_i0: block_RAM

block_RAM block_ram_i1
    (
      .s_aresetn                          ( memctl0_axi_rst_n                                                        ) ,
      .s_aclk                             ( clock_mem                                                                ) ,
      .s_axi_araddr                       ( memctl0_axi_araddr[31 : 0]                                               ) ,
      .s_axi_arburst                      ( memctl0_axi_arburst                                                      ) ,
      .s_axi_arid                         ( memctl0_axi_arid                                                         ) ,
      .s_axi_arlen                        ( memctl0_axi_arlen                                                        ) ,
      .s_axi_arready                      (                                                                          ) ,
      .s_axi_arsize                       ( 3'b101                                                                   ) ,
      .s_axi_arvalid                      ( memctl0_axi_arvalid                                                      ) ,
      .s_axi_awaddr                       ( memctl0_axi_awaddr[31 : 0]                                               ) ,
      .s_axi_awburst                      ( memctl0_axi_awburst                                                      ) ,
      .s_axi_awid                         ( memctl0_axi_awid                                                         ) ,
      .s_axi_awlen                        ( memctl0_axi_awlen                                                        ) ,
      .s_axi_awready                      (                                                                          ) ,
      .s_axi_awsize                       ( 3'b101                                                                   ) ,
      .s_axi_awvalid                      ( memctl0_axi_awvalid                                                      ) ,
      .s_axi_bid                          (                                                                          ) ,
      .s_axi_bready                       ( memctl0_axi_bready                                                       ) ,
      .s_axi_bresp                        (                                                                          ) ,
      .s_axi_bvalid                       (                                                                          ) ,
      .s_axi_rdata                        ( memctl0_axi_rdata[`AXI_CARD_MEM_DATA_WIDTH-1 : (`AXI_CARD_MEM_DATA_WIDTH/2)]) ,
      .s_axi_rid                          (                                                                          ) ,
      .s_axi_rlast                        (                                                                          ) ,
      .s_axi_rready                       ( memctl0_axi_rready                                                       ) ,
      .s_axi_rresp                        (                                                                          ) ,
      .s_axi_rvalid                       (                                                                          ) ,
      .s_axi_wdata                        ( memctl0_axi_wdata[`AXI_CARD_MEM_DATA_WIDTH-1 : (`AXI_CARD_MEM_DATA_WIDTH/2)]) ,
      .s_axi_wlast                        ( memctl0_axi_wlast                                                        ) ,
      .s_axi_wready                       (                                                                          ) ,
      .s_axi_wstrb                        ( memctl0_axi_wstrb[(`AXI_CARD_MEM_DATA_WIDTH/8)-1 : (`AXI_CARD_MEM_DATA_WIDTH/16)]) ,
      .s_axi_wvalid                       ( memctl0_axi_wvalid                                                       )
    );  // block_ram_i1: block_RAM

`endif
`endif


// if DDR on AD9V3 (no BRAM)
`ifdef ENABLE_DDR
`ifdef AD9V3
  //
  // DDR4SDRAM
  //
     ddr4sdram ddr4memctl0_bank
      (
      .c0_init_calib_complete      ( memctl0_init_calib_complete ) ,
      .dbg_clk                     ( ddr4_dbg_clk                ) ,
      .c0_sys_clk_p                ( c0_sys_clk_p                ) ,
      .c0_sys_clk_n                ( c0_sys_clk_n                ) ,
      .dbg_bus                     ( ddr4_dbg_bus                ) ,
      .c0_ddr4_adr                 ( c0_ddr4_adr                 ) ,
      .c0_ddr4_ba                  ( c0_ddr4_ba                  ) ,
      .c0_ddr4_cke                 ( c0_ddr4_cke                 ) ,
      .c0_ddr4_cs_n                ( c0_ddr4_cs_n                ) ,
      .c0_ddr4_dm_dbi_n            ( c0_ddr4_dm_dbi_n            ) ,
      .c0_ddr4_dq                  ( c0_ddr4_dq                  ) ,
      .c0_ddr4_dqs_c               ( c0_ddr4_dqs_c               ) ,
      .c0_ddr4_dqs_t               ( c0_ddr4_dqs_t               ) ,
      .c0_ddr4_odt                 ( c0_ddr4_odt                 ) ,
      .c0_ddr4_bg                  ( c0_ddr4_bg                  ) ,
      .c0_ddr4_reset_n             ( c0_ddr4_reset_n             ) ,
      .c0_ddr4_act_n               ( c0_ddr4_act_n               ) ,
      .c0_ddr4_ck_c                ( c0_ddr4_ck_c                ) ,
      .c0_ddr4_ck_t                ( c0_ddr4_ck_t                ) ,
      .c0_ddr4_ui_clk              ( memctl0_ui_clk              ) ,//output
      .c0_ddr4_ui_clk_sync_rst     ( memctl0_ui_clk_sync_rst     ) ,//output
      .c0_ddr4_aresetn             ( memctl0_axi_rst_n           ) ,
      .c0_ddr4_s_axi_ctrl_awvalid  ( memctl0_axi_ctrl_awvalid    ) ,
      .c0_ddr4_s_axi_ctrl_awready  ( memctl0_axi_ctrl_awready    ) ,
      .c0_ddr4_s_axi_ctrl_awaddr   ( memctl0_axi_ctrl_awaddr     ) ,
      .c0_ddr4_s_axi_ctrl_wvalid   ( memctl0_axi_ctrl_wvalid     ) ,
      .c0_ddr4_s_axi_ctrl_wready   ( memctl0_axi_ctrl_wready     ) ,
      .c0_ddr4_s_axi_ctrl_wdata    ( memctl0_axi_ctrl_wdata      ) ,
      .c0_ddr4_s_axi_ctrl_bvalid   ( memctl0_axi_ctrl_bvalid     ) ,
      .c0_ddr4_s_axi_ctrl_bready   ( memctl0_axi_ctrl_bready     ) ,
      .c0_ddr4_s_axi_ctrl_bresp    ( memctl0_axi_ctrl_bresp      ) ,
      .c0_ddr4_s_axi_ctrl_arvalid  ( memctl0_axi_ctrl_arvalid    ) ,
      .c0_ddr4_s_axi_ctrl_arready  ( memctl0_axi_ctrl_arready    ) ,
      .c0_ddr4_s_axi_ctrl_araddr   ( memctl0_axi_ctrl_araddr     ) ,
      .c0_ddr4_s_axi_ctrl_rvalid   ( memctl0_axi_ctrl_rvalid     ) ,
      .c0_ddr4_s_axi_ctrl_rready   ( memctl0_axi_ctrl_rready     ) ,
      .c0_ddr4_s_axi_ctrl_rdata    ( memctl0_axi_ctrl_rdata      ) ,
      .c0_ddr4_s_axi_ctrl_rresp    ( memctl0_axi_ctrl_rresp      ) ,
      .c0_ddr4_interrupt           ( memctl0_interrupt           ) ,
      .c0_ddr4_s_axi_awid          ( memctl0_axi_awid            ) ,
      .c0_ddr4_s_axi_awaddr        ( memctl0_axi_awaddr          ) ,
      .c0_ddr4_s_axi_awlen         ( memctl0_axi_awlen           ) ,
      .c0_ddr4_s_axi_awsize        ( memctl0_axi_awsize          ) ,
      .c0_ddr4_s_axi_awburst       ( memctl0_axi_awburst         ) ,
      .c0_ddr4_s_axi_awlock        ( memctl0_axi_awlock          ) ,
      .c0_ddr4_s_axi_awcache       ( memctl0_axi_awcache         ) ,
      .c0_ddr4_s_axi_awprot        ( memctl0_axi_awprot          ) ,
      .c0_ddr4_s_axi_awqos         ( memctl0_axi_awqos           ) ,
      .c0_ddr4_s_axi_awvalid       ( memctl0_axi_awvalid         ) ,
      .c0_ddr4_s_axi_awready       ( memctl0_axi_awready         ) ,
      .c0_ddr4_s_axi_wdata         ( memctl0_axi_wdata           ) ,
      .c0_ddr4_s_axi_wstrb         ( memctl0_axi_wstrb           ) ,
      .c0_ddr4_s_axi_wlast         ( memctl0_axi_wlast           ) ,
      .c0_ddr4_s_axi_wvalid        ( memctl0_axi_wvalid          ) ,
      .c0_ddr4_s_axi_wready        ( memctl0_axi_wready          ) ,
      .c0_ddr4_s_axi_bready        ( memctl0_axi_bready          ) ,
      .c0_ddr4_s_axi_bid           ( memctl0_axi_bid             ) ,
      .c0_ddr4_s_axi_bresp         ( memctl0_axi_bresp           ) ,
      .c0_ddr4_s_axi_bvalid        ( memctl0_axi_bvalid          ) ,
      .c0_ddr4_s_axi_arid          ( memctl0_axi_arid            ) ,
      .c0_ddr4_s_axi_araddr        ( memctl0_axi_araddr          ) ,
      .c0_ddr4_s_axi_arlen         ( memctl0_axi_arlen           ) ,
      .c0_ddr4_s_axi_arsize        ( memctl0_axi_arsize          ) ,
      .c0_ddr4_s_axi_arburst       ( memctl0_axi_arburst         ) ,
      .c0_ddr4_s_axi_arlock        ( memctl0_axi_arlock          ) ,
      .c0_ddr4_s_axi_arcache       ( memctl0_axi_arcache         ) ,
      .c0_ddr4_s_axi_arprot        ( memctl0_axi_arprot          ) ,
      .c0_ddr4_s_axi_arqos         ( memctl0_axi_arqos           ) ,
      .c0_ddr4_s_axi_arvalid       ( memctl0_axi_arvalid         ) ,
      .c0_ddr4_s_axi_arready       ( memctl0_axi_arready         ) ,
      .c0_ddr4_s_axi_rready        ( memctl0_axi_rready          ) ,
      .c0_ddr4_s_axi_rlast         ( memctl0_axi_rlast           ) ,
      .c0_ddr4_s_axi_rvalid        ( memctl0_axi_rvalid          ) ,
      .c0_ddr4_s_axi_rresp         ( memctl0_axi_rresp           ) ,
      .c0_ddr4_s_axi_rid           ( memctl0_axi_rid             ) ,
      .c0_ddr4_s_axi_rdata         ( memctl0_axi_rdata           ) ,
      .sys_rst                     ( memctl0_reset_q             )
    );
`endif
`ifdef BW250SOC
  //
  // DDR4SDRAM
  //
     ddr4sdram ddr4memctl0_bank
      (
      .c0_init_calib_complete      ( memctl0_init_calib_complete ) ,
      .dbg_clk                     ( ddr4_dbg_clk                ) ,
      .c0_sys_clk_p                ( c0_sys_clk_p                ) ,
      .c0_sys_clk_n                ( c0_sys_clk_n                ) ,
      .dbg_bus                     ( ddr4_dbg_bus                ) ,
      .c0_ddr4_adr                 ( c0_ddr4_adr                 ) ,
      .c0_ddr4_ba                  ( c0_ddr4_ba                  ) ,
      .c0_ddr4_cke                 ( c0_ddr4_cke                 ) ,
      .c0_ddr4_cs_n                ( c0_ddr4_cs_n                ) ,
      .c0_ddr4_dm_dbi_n            ( c0_ddr4_dm_dbi_n            ) ,
      .c0_ddr4_dq                  ( c0_ddr4_dq                  ) ,
      .c0_ddr4_dqs_c               ( c0_ddr4_dqs_c               ) ,
      .c0_ddr4_dqs_t               ( c0_ddr4_dqs_t               ) ,
      .c0_ddr4_odt                 ( c0_ddr4_odt                 ) ,
      .c0_ddr4_bg                  ( c0_ddr4_bg                  ) ,
      .c0_ddr4_reset_n             ( c0_ddr4_reset_n             ) ,
      .c0_ddr4_act_n               ( c0_ddr4_act_n               ) ,
      .c0_ddr4_ck_c                ( c0_ddr4_ck_c                ) ,
      .c0_ddr4_ck_t                ( c0_ddr4_ck_t                ) ,
      .c0_ddr4_ui_clk              ( memctl0_ui_clk              ) ,//output
      .c0_ddr4_ui_clk_sync_rst     ( memctl0_ui_clk_sync_rst     ) ,//output
      .c0_ddr4_aresetn             ( memctl0_axi_rst_n           ) ,
      .c0_ddr4_s_axi_ctrl_awvalid  ( memctl0_axi_ctrl_awvalid    ) ,
      .c0_ddr4_s_axi_ctrl_awready  ( memctl0_axi_ctrl_awready    ) ,
      .c0_ddr4_s_axi_ctrl_awaddr   ( memctl0_axi_ctrl_awaddr     ) ,
      .c0_ddr4_s_axi_ctrl_wvalid   ( memctl0_axi_ctrl_wvalid     ) ,
      .c0_ddr4_s_axi_ctrl_wready   ( memctl0_axi_ctrl_wready     ) ,
      .c0_ddr4_s_axi_ctrl_wdata    ( memctl0_axi_ctrl_wdata      ) ,
      .c0_ddr4_s_axi_ctrl_bvalid   ( memctl0_axi_ctrl_bvalid     ) ,
      .c0_ddr4_s_axi_ctrl_bready   ( memctl0_axi_ctrl_bready     ) ,
      .c0_ddr4_s_axi_ctrl_bresp    ( memctl0_axi_ctrl_bresp      ) ,
      .c0_ddr4_s_axi_ctrl_arvalid  ( memctl0_axi_ctrl_arvalid    ) ,
      .c0_ddr4_s_axi_ctrl_arready  ( memctl0_axi_ctrl_arready    ) ,
      .c0_ddr4_s_axi_ctrl_araddr   ( memctl0_axi_ctrl_araddr     ) ,
      .c0_ddr4_s_axi_ctrl_rvalid   ( memctl0_axi_ctrl_rvalid     ) ,
      .c0_ddr4_s_axi_ctrl_rready   ( memctl0_axi_ctrl_rready     ) ,
      .c0_ddr4_s_axi_ctrl_rdata    ( memctl0_axi_ctrl_rdata      ) ,
      .c0_ddr4_s_axi_ctrl_rresp    ( memctl0_axi_ctrl_rresp      ) ,
      .c0_ddr4_interrupt           ( memctl0_interrupt           ) ,
      .c0_ddr4_s_axi_awid          ( memctl0_axi_awid            ) ,
      .c0_ddr4_s_axi_awaddr        ( memctl0_axi_awaddr          ) ,
      .c0_ddr4_s_axi_awlen         ( memctl0_axi_awlen           ) ,
      .c0_ddr4_s_axi_awsize        ( memctl0_axi_awsize          ) ,
      .c0_ddr4_s_axi_awburst       ( memctl0_axi_awburst         ) ,
      .c0_ddr4_s_axi_awlock        ( memctl0_axi_awlock          ) ,
      .c0_ddr4_s_axi_awcache       ( memctl0_axi_awcache         ) ,
      .c0_ddr4_s_axi_awprot        ( memctl0_axi_awprot          ) ,
      .c0_ddr4_s_axi_awqos         ( memctl0_axi_awqos           ) ,
      .c0_ddr4_s_axi_awvalid       ( memctl0_axi_awvalid         ) ,
      .c0_ddr4_s_axi_awready       ( memctl0_axi_awready         ) ,
      .c0_ddr4_s_axi_wdata         ( memctl0_axi_wdata           ) ,
      .c0_ddr4_s_axi_wstrb         ( memctl0_axi_wstrb           ) ,
      .c0_ddr4_s_axi_wlast         ( memctl0_axi_wlast           ) ,
      .c0_ddr4_s_axi_wvalid        ( memctl0_axi_wvalid          ) ,
      .c0_ddr4_s_axi_wready        ( memctl0_axi_wready          ) ,
      .c0_ddr4_s_axi_bready        ( memctl0_axi_bready          ) ,
      .c0_ddr4_s_axi_bid           ( memctl0_axi_bid             ) ,
      .c0_ddr4_s_axi_bresp         ( memctl0_axi_bresp           ) ,
      .c0_ddr4_s_axi_bvalid        ( memctl0_axi_bvalid          ) ,
      .c0_ddr4_s_axi_arid          ( memctl0_axi_arid            ) ,
      .c0_ddr4_s_axi_araddr        ( memctl0_axi_araddr          ) ,
      .c0_ddr4_s_axi_arlen         ( memctl0_axi_arlen           ) ,
      .c0_ddr4_s_axi_arsize        ( memctl0_axi_arsize          ) ,
      .c0_ddr4_s_axi_arburst       ( memctl0_axi_arburst         ) ,
      .c0_ddr4_s_axi_arlock        ( memctl0_axi_arlock          ) ,
      .c0_ddr4_s_axi_arcache       ( memctl0_axi_arcache         ) ,
      .c0_ddr4_s_axi_arprot        ( memctl0_axi_arprot          ) ,
      .c0_ddr4_s_axi_arqos         ( memctl0_axi_arqos           ) ,
      .c0_ddr4_s_axi_arvalid       ( memctl0_axi_arvalid         ) ,
      .c0_ddr4_s_axi_arready       ( memctl0_axi_arready         ) ,
      .c0_ddr4_s_axi_rready        ( memctl0_axi_rready          ) ,
      .c0_ddr4_s_axi_rlast         ( memctl0_axi_rlast           ) ,
      .c0_ddr4_s_axi_rvalid        ( memctl0_axi_rvalid          ) ,
      .c0_ddr4_s_axi_rresp         ( memctl0_axi_rresp           ) ,
      .c0_ddr4_s_axi_rid           ( memctl0_axi_rid             ) ,
      .c0_ddr4_s_axi_rdata         ( memctl0_axi_rdata           ) ,
      .sys_rst                     ( memctl0_reset_q             )
    );
`endif
`endif

// if HBM or HBM replaced by BRAM 
`ifdef ENABLE_HBM
  //
  // HBM controller is 256b AXI3 interface
  //
  //

 hbm_top_wrapper hbm_top_wrapper_i (
	// following depends on number of independent HBM
      `ifdef HBM_AXI_IF_P0
      .s_axi_p0_HBM_aclk        ( clock_act                   ) ,
      .s_axi_p0_HBM_awaddr      ( act_axi_card_hbm_p0_awaddr    ) ,
      .s_axi_p0_HBM_awlen       ( act_axi_card_hbm_p0_awlen     ) ,
      .s_axi_p0_HBM_awsize      ( act_axi_card_hbm_p0_awsize    ) ,
      .s_axi_p0_HBM_awburst     ( act_axi_card_hbm_p0_awburst   ) ,
      .s_axi_p0_HBM_awlock      ( act_axi_card_hbm_p0_awlock[0] ) ,
      .s_axi_p0_HBM_arlock      ( act_axi_card_hbm_p0_arlock[0] ) ,
  `ifndef ENABLE_BRAM
      .s_axi_p0_HBM_awregion    ( act_axi_card_hbm_p0_awregion  ) ,
      .s_axi_p0_HBM_awqos       ( act_axi_card_hbm_p0_awqos     ) ,
      .s_axi_p0_HBM_arregion    ( act_axi_card_hbm_p0_arregion  ) ,
      .s_axi_p0_HBM_arqos       ( act_axi_card_hbm_p0_arqos     ) ,
      .s_axi_p0_HBM_awid        ( 6'b0                          ) ,
      .s_axi_p0_HBM_arid        ( 6'b0                          ) ,
      .s_axi_p0_HBM_bid         (                               ) ,
      .s_axi_p0_HBM_rid         (                               ) ,
  `endif
      .s_axi_p0_HBM_awcache     ( act_axi_card_hbm_p0_awcache   ) ,
      .s_axi_p0_HBM_awprot      ( act_axi_card_hbm_p0_awprot    ) ,
      .s_axi_p0_HBM_awvalid     ( act_axi_card_hbm_p0_awvalid   ) ,
      .s_axi_p0_HBM_awready     ( act_axi_card_hbm_p0_awready   ) ,
      .s_axi_p0_HBM_wdata       ( act_axi_card_hbm_p0_wdata     ) ,
      .s_axi_p0_HBM_wstrb       ( act_axi_card_hbm_p0_wstrb     ) ,
      .s_axi_p0_HBM_wlast       ( act_axi_card_hbm_p0_wlast     ) ,
      .s_axi_p0_HBM_wvalid      ( act_axi_card_hbm_p0_wvalid    ) ,
      .s_axi_p0_HBM_wready      ( act_axi_card_hbm_p0_wready    ) ,
      .s_axi_p0_HBM_bresp       ( act_axi_card_hbm_p0_bresp     ) ,
      .s_axi_p0_HBM_bvalid      ( act_axi_card_hbm_p0_bvalid    ) ,
      .s_axi_p0_HBM_bready      ( act_axi_card_hbm_p0_bready    ) ,
      .s_axi_p0_HBM_araddr      ( act_axi_card_hbm_p0_araddr    ) ,
      .s_axi_p0_HBM_arlen       ( act_axi_card_hbm_p0_arlen     ) ,
      .s_axi_p0_HBM_arsize      ( act_axi_card_hbm_p0_arsize    ) ,
      .s_axi_p0_HBM_arburst     ( act_axi_card_hbm_p0_arburst   ) ,
      .s_axi_p0_HBM_arcache     ( act_axi_card_hbm_p0_arcache   ) ,
      .s_axi_p0_HBM_arprot      ( act_axi_card_hbm_p0_arprot    ) ,
      .s_axi_p0_HBM_arvalid     ( act_axi_card_hbm_p0_arvalid   ) ,
      .s_axi_p0_HBM_arready     ( act_axi_card_hbm_p0_arready   ) ,
      .s_axi_p0_HBM_rdata       ( act_axi_card_hbm_p0_rdata     ) ,
      .s_axi_p0_HBM_rresp       ( act_axi_card_hbm_p0_rresp     ) ,
      .s_axi_p0_HBM_rlast       ( act_axi_card_hbm_p0_rlast     ) ,
      .s_axi_p0_HBM_rvalid      ( act_axi_card_hbm_p0_rvalid    ) ,
      .s_axi_p0_HBM_rready      ( act_axi_card_hbm_p0_rready    ) ,
      `endif

      `ifdef HBM_AXI_IF_P1 
      .s_axi_p1_HBM_aclk        ( clock_act                   ) ,
      .s_axi_p1_HBM_awaddr      ( act_axi_card_hbm_p1_awaddr    ) ,
      .s_axi_p1_HBM_awlen       ( act_axi_card_hbm_p1_awlen     ) ,
      .s_axi_p1_HBM_awsize      ( act_axi_card_hbm_p1_awsize    ) ,
      .s_axi_p1_HBM_awburst     ( act_axi_card_hbm_p1_awburst   ) ,
      .s_axi_p1_HBM_awlock      ( act_axi_card_hbm_p1_awlock[0] ) ,
      .s_axi_p1_HBM_arlock      ( act_axi_card_hbm_p1_arlock[0] ) ,
  `ifndef ENABLE_BRAM
      .s_axi_p1_HBM_awregion    ( act_axi_card_hbm_p1_awregion  ) ,
      .s_axi_p1_HBM_awqos       ( act_axi_card_hbm_p1_awqos     ) ,
      .s_axi_p1_HBM_arregion    ( act_axi_card_hbm_p1_arregion  ) ,
      .s_axi_p1_HBM_arqos       ( act_axi_card_hbm_p1_arqos     ) ,
      .s_axi_p1_HBM_awid        ( 6'b0                          ) ,
      .s_axi_p1_HBM_arid        ( 6'b0                          ) ,
      .s_axi_p1_HBM_bid         (                               ) ,
      .s_axi_p1_HBM_rid         (                               ) ,
  `endif
      .s_axi_p1_HBM_awcache     ( act_axi_card_hbm_p1_awcache   ) ,
      .s_axi_p1_HBM_awprot      ( act_axi_card_hbm_p1_awprot    ) ,
      .s_axi_p1_HBM_awvalid     ( act_axi_card_hbm_p1_awvalid   ) ,
      .s_axi_p1_HBM_awready     ( act_axi_card_hbm_p1_awready   ) ,
      .s_axi_p1_HBM_wdata       ( act_axi_card_hbm_p1_wdata     ) ,
      .s_axi_p1_HBM_wstrb       ( act_axi_card_hbm_p1_wstrb     ) ,
      .s_axi_p1_HBM_wlast       ( act_axi_card_hbm_p1_wlast     ) ,
      .s_axi_p1_HBM_wvalid      ( act_axi_card_hbm_p1_wvalid    ) ,
      .s_axi_p1_HBM_wready      ( act_axi_card_hbm_p1_wready    ) ,
      .s_axi_p1_HBM_bresp       ( act_axi_card_hbm_p1_bresp     ) ,
      .s_axi_p1_HBM_bvalid      ( act_axi_card_hbm_p1_bvalid    ) ,
      .s_axi_p1_HBM_bready      ( act_axi_card_hbm_p1_bready    ) ,
      .s_axi_p1_HBM_araddr      ( act_axi_card_hbm_p1_araddr    ) ,
      .s_axi_p1_HBM_arlen       ( act_axi_card_hbm_p1_arlen     ) ,
      .s_axi_p1_HBM_arsize      ( act_axi_card_hbm_p1_arsize    ) ,
      .s_axi_p1_HBM_arburst     ( act_axi_card_hbm_p1_arburst   ) ,
      .s_axi_p1_HBM_arcache     ( act_axi_card_hbm_p1_arcache   ) ,
      .s_axi_p1_HBM_arprot      ( act_axi_card_hbm_p1_arprot    ) ,
      .s_axi_p1_HBM_arvalid     ( act_axi_card_hbm_p1_arvalid   ) ,
      .s_axi_p1_HBM_arready     ( act_axi_card_hbm_p1_arready   ) ,
      .s_axi_p1_HBM_rdata       ( act_axi_card_hbm_p1_rdata     ) ,
      .s_axi_p1_HBM_rresp       ( act_axi_card_hbm_p1_rresp     ) ,
      .s_axi_p1_HBM_rlast       ( act_axi_card_hbm_p1_rlast     ) ,
      .s_axi_p1_HBM_rvalid      ( act_axi_card_hbm_p1_rvalid    ) ,
      .s_axi_p1_HBM_rready      ( act_axi_card_hbm_p1_rready    ) ,
      `endif

      `ifdef HBM_AXI_IF_P2
      .s_axi_p2_HBM_aclk        ( clock_act                   ) ,
      .s_axi_p2_HBM_awaddr      ( act_axi_card_hbm_p2_awaddr    ) ,
      .s_axi_p2_HBM_awlen       ( act_axi_card_hbm_p2_awlen     ) ,
      .s_axi_p2_HBM_awsize      ( act_axi_card_hbm_p2_awsize    ) ,
      .s_axi_p2_HBM_awburst     ( act_axi_card_hbm_p2_awburst   ) ,
      .s_axi_p2_HBM_awlock      ( act_axi_card_hbm_p2_awlock[0] ) ,
      .s_axi_p2_HBM_arlock      ( act_axi_card_hbm_p2_arlock[0] ) ,
  `ifndef ENABLE_BRAM
      .s_axi_p2_HBM_awregion    ( act_axi_card_hbm_p2_awregion  ) ,
      .s_axi_p2_HBM_awqos       ( act_axi_card_hbm_p2_awqos     ) ,
      .s_axi_p2_HBM_arregion    ( act_axi_card_hbm_p2_arregion  ) ,
      .s_axi_p2_HBM_arqos       ( act_axi_card_hbm_p2_arqos     ) ,
      .s_axi_p2_HBM_awid        ( 6'b0                          ) ,
      .s_axi_p2_HBM_arid        ( 6'b0                          ) ,
      .s_axi_p2_HBM_bid         (                               ) ,
      .s_axi_p2_HBM_rid         (                               ) ,
  `endif
      .s_axi_p2_HBM_awcache     ( act_axi_card_hbm_p2_awcache   ) ,
      .s_axi_p2_HBM_awprot      ( act_axi_card_hbm_p2_awprot    ) ,
      .s_axi_p2_HBM_awvalid     ( act_axi_card_hbm_p2_awvalid   ) ,
      .s_axi_p2_HBM_awready     ( act_axi_card_hbm_p2_awready   ) ,
      .s_axi_p2_HBM_wdata       ( act_axi_card_hbm_p2_wdata     ) ,
      .s_axi_p2_HBM_wstrb       ( act_axi_card_hbm_p2_wstrb     ) ,
      .s_axi_p2_HBM_wlast       ( act_axi_card_hbm_p2_wlast     ) ,
      .s_axi_p2_HBM_wvalid      ( act_axi_card_hbm_p2_wvalid    ) ,
      .s_axi_p2_HBM_wready      ( act_axi_card_hbm_p2_wready    ) ,
      .s_axi_p2_HBM_bresp       ( act_axi_card_hbm_p2_bresp     ) ,
      .s_axi_p2_HBM_bvalid      ( act_axi_card_hbm_p2_bvalid    ) ,
      .s_axi_p2_HBM_bready      ( act_axi_card_hbm_p2_bready    ) ,
      .s_axi_p2_HBM_araddr      ( act_axi_card_hbm_p2_araddr    ) ,
      .s_axi_p2_HBM_arlen       ( act_axi_card_hbm_p2_arlen     ) ,
      .s_axi_p2_HBM_arsize      ( act_axi_card_hbm_p2_arsize    ) ,
      .s_axi_p2_HBM_arburst     ( act_axi_card_hbm_p2_arburst   ) ,
      .s_axi_p2_HBM_arcache     ( act_axi_card_hbm_p2_arcache   ) ,
      .s_axi_p2_HBM_arprot      ( act_axi_card_hbm_p2_arprot    ) ,
      .s_axi_p2_HBM_arvalid     ( act_axi_card_hbm_p2_arvalid   ) ,
      .s_axi_p2_HBM_arready     ( act_axi_card_hbm_p2_arready   ) ,
      .s_axi_p2_HBM_rdata       ( act_axi_card_hbm_p2_rdata     ) ,
      .s_axi_p2_HBM_rresp       ( act_axi_card_hbm_p2_rresp     ) ,
      .s_axi_p2_HBM_rlast       ( act_axi_card_hbm_p2_rlast     ) ,
      .s_axi_p2_HBM_rvalid      ( act_axi_card_hbm_p2_rvalid    ) ,
      .s_axi_p2_HBM_rready      ( act_axi_card_hbm_p2_rready    ) ,
      `endif

      `ifdef HBM_AXI_IF_P3
      .s_axi_p3_HBM_aclk        ( clock_act                   ) ,
      .s_axi_p3_HBM_awaddr      ( act_axi_card_hbm_p3_awaddr    ) ,
      .s_axi_p3_HBM_awlen       ( act_axi_card_hbm_p3_awlen     ) ,
      .s_axi_p3_HBM_awsize      ( act_axi_card_hbm_p3_awsize    ) ,
      .s_axi_p3_HBM_awburst     ( act_axi_card_hbm_p3_awburst   ) ,
      .s_axi_p3_HBM_awlock      ( act_axi_card_hbm_p3_awlock[0] ) ,
      .s_axi_p3_HBM_arlock      ( act_axi_card_hbm_p3_arlock[0] ) ,
  `ifndef ENABLE_BRAM
      .s_axi_p3_HBM_awregion    ( act_axi_card_hbm_p3_awregion  ) ,
      .s_axi_p3_HBM_awqos       ( act_axi_card_hbm_p3_awqos     ) ,
      .s_axi_p3_HBM_arregion    ( act_axi_card_hbm_p3_arregion  ) ,
      .s_axi_p3_HBM_arqos       ( act_axi_card_hbm_p3_arqos     ) ,
      .s_axi_p3_HBM_awid        ( 6'b0                          ) ,
      .s_axi_p3_HBM_arid        ( 6'b0                          ) ,
      .s_axi_p3_HBM_bid         (                               ) ,
      .s_axi_p3_HBM_rid         (                               ) ,
  `endif
      .s_axi_p3_HBM_awcache     ( act_axi_card_hbm_p3_awcache   ) ,
      .s_axi_p3_HBM_awprot      ( act_axi_card_hbm_p3_awprot    ) ,
      .s_axi_p3_HBM_awvalid     ( act_axi_card_hbm_p3_awvalid   ) ,
      .s_axi_p3_HBM_awready     ( act_axi_card_hbm_p3_awready   ) ,
      .s_axi_p3_HBM_wdata       ( act_axi_card_hbm_p3_wdata     ) ,
      .s_axi_p3_HBM_wstrb       ( act_axi_card_hbm_p3_wstrb     ) ,
      .s_axi_p3_HBM_wlast       ( act_axi_card_hbm_p3_wlast     ) ,
      .s_axi_p3_HBM_wvalid      ( act_axi_card_hbm_p3_wvalid    ) ,
      .s_axi_p3_HBM_wready      ( act_axi_card_hbm_p3_wready    ) ,
      .s_axi_p3_HBM_bresp       ( act_axi_card_hbm_p3_bresp     ) ,
      .s_axi_p3_HBM_bvalid      ( act_axi_card_hbm_p3_bvalid    ) ,
      .s_axi_p3_HBM_bready      ( act_axi_card_hbm_p3_bready    ) ,
      .s_axi_p3_HBM_araddr      ( act_axi_card_hbm_p3_araddr    ) ,
      .s_axi_p3_HBM_arlen       ( act_axi_card_hbm_p3_arlen     ) ,
      .s_axi_p3_HBM_arsize      ( act_axi_card_hbm_p3_arsize    ) ,
      .s_axi_p3_HBM_arburst     ( act_axi_card_hbm_p3_arburst   ) ,
      .s_axi_p3_HBM_arcache     ( act_axi_card_hbm_p3_arcache   ) ,
      .s_axi_p3_HBM_arprot      ( act_axi_card_hbm_p3_arprot    ) ,
      .s_axi_p3_HBM_arvalid     ( act_axi_card_hbm_p3_arvalid   ) ,
      .s_axi_p3_HBM_arready     ( act_axi_card_hbm_p3_arready   ) ,
      .s_axi_p3_HBM_rdata       ( act_axi_card_hbm_p3_rdata     ) ,
      .s_axi_p3_HBM_rresp       ( act_axi_card_hbm_p3_rresp     ) ,
      .s_axi_p3_HBM_rlast       ( act_axi_card_hbm_p3_rlast     ) ,
      .s_axi_p3_HBM_rvalid      ( act_axi_card_hbm_p3_rvalid    ) ,
      .s_axi_p3_HBM_rready      ( act_axi_card_hbm_p3_rready    ) ,
      `endif

      `ifdef HBM_AXI_IF_P4
      .s_axi_p4_HBM_aclk        ( clock_act                   ) ,
      .s_axi_p4_HBM_awaddr      ( act_axi_card_hbm_p4_awaddr    ) ,
      .s_axi_p4_HBM_awlen       ( act_axi_card_hbm_p4_awlen     ) ,
      .s_axi_p4_HBM_awsize      ( act_axi_card_hbm_p4_awsize    ) ,
      .s_axi_p4_HBM_awburst     ( act_axi_card_hbm_p4_awburst   ) ,
      .s_axi_p4_HBM_awlock      ( act_axi_card_hbm_p4_awlock[0] ) ,
      .s_axi_p4_HBM_arlock      ( act_axi_card_hbm_p4_arlock[0] ) ,
  `ifndef ENABLE_BRAM
      .s_axi_p4_HBM_awregion    ( act_axi_card_hbm_p4_awregion  ) ,
      .s_axi_p4_HBM_awqos       ( act_axi_card_hbm_p4_awqos     ) ,
      .s_axi_p4_HBM_arregion    ( act_axi_card_hbm_p4_arregion  ) ,
      .s_axi_p4_HBM_arqos       ( act_axi_card_hbm_p4_arqos     ) ,
      .s_axi_p4_HBM_awid        ( 6'b0                          ) ,
      .s_axi_p4_HBM_arid        ( 6'b0                          ) ,
      .s_axi_p4_HBM_bid         (                               ) ,
      .s_axi_p4_HBM_rid         (                               ) ,
  `endif
      .s_axi_p4_HBM_awcache     ( act_axi_card_hbm_p4_awcache   ) ,
      .s_axi_p4_HBM_awprot      ( act_axi_card_hbm_p4_awprot    ) ,
      .s_axi_p4_HBM_awvalid     ( act_axi_card_hbm_p4_awvalid   ) ,
      .s_axi_p4_HBM_awready     ( act_axi_card_hbm_p4_awready   ) ,
      .s_axi_p4_HBM_wdata       ( act_axi_card_hbm_p4_wdata     ) ,
      .s_axi_p4_HBM_wstrb       ( act_axi_card_hbm_p4_wstrb     ) ,
      .s_axi_p4_HBM_wlast       ( act_axi_card_hbm_p4_wlast     ) ,
      .s_axi_p4_HBM_wvalid      ( act_axi_card_hbm_p4_wvalid    ) ,
      .s_axi_p4_HBM_wready      ( act_axi_card_hbm_p4_wready    ) ,
      .s_axi_p4_HBM_bresp       ( act_axi_card_hbm_p4_bresp     ) ,
      .s_axi_p4_HBM_bvalid      ( act_axi_card_hbm_p4_bvalid    ) ,
      .s_axi_p4_HBM_bready      ( act_axi_card_hbm_p4_bready    ) ,
      .s_axi_p4_HBM_araddr      ( act_axi_card_hbm_p4_araddr    ) ,
      .s_axi_p4_HBM_arlen       ( act_axi_card_hbm_p4_arlen     ) ,
      .s_axi_p4_HBM_arsize      ( act_axi_card_hbm_p4_arsize    ) ,
      .s_axi_p4_HBM_arburst     ( act_axi_card_hbm_p4_arburst   ) ,
      .s_axi_p4_HBM_arcache     ( act_axi_card_hbm_p4_arcache   ) ,
      .s_axi_p4_HBM_arprot      ( act_axi_card_hbm_p4_arprot    ) ,
      .s_axi_p4_HBM_arvalid     ( act_axi_card_hbm_p4_arvalid   ) ,
      .s_axi_p4_HBM_arready     ( act_axi_card_hbm_p4_arready   ) ,
      .s_axi_p4_HBM_rdata       ( act_axi_card_hbm_p4_rdata     ) ,
      .s_axi_p4_HBM_rresp       ( act_axi_card_hbm_p4_rresp     ) ,
      .s_axi_p4_HBM_rlast       ( act_axi_card_hbm_p4_rlast     ) ,
      .s_axi_p4_HBM_rvalid      ( act_axi_card_hbm_p4_rvalid    ) ,
      .s_axi_p4_HBM_rready      ( act_axi_card_hbm_p4_rready    ) ,
      `endif

      `ifdef HBM_AXI_IF_P5
      .s_axi_p5_HBM_aclk        ( clock_act                   ) ,
      .s_axi_p5_HBM_awaddr      ( act_axi_card_hbm_p5_awaddr    ) ,
      .s_axi_p5_HBM_awlen       ( act_axi_card_hbm_p5_awlen     ) ,
      .s_axi_p5_HBM_awsize      ( act_axi_card_hbm_p5_awsize    ) ,
      .s_axi_p5_HBM_awburst     ( act_axi_card_hbm_p5_awburst   ) ,
      .s_axi_p5_HBM_awlock      ( act_axi_card_hbm_p5_awlock[0] ) ,
      .s_axi_p5_HBM_arlock      ( act_axi_card_hbm_p5_arlock[0] ) ,
  `ifndef ENABLE_BRAM
      .s_axi_p5_HBM_awregion    ( act_axi_card_hbm_p5_awregion  ) ,
      .s_axi_p5_HBM_awqos       ( act_axi_card_hbm_p5_awqos     ) ,
      .s_axi_p5_HBM_arregion    ( act_axi_card_hbm_p5_arregion  ) ,
      .s_axi_p5_HBM_arqos       ( act_axi_card_hbm_p5_arqos     ) ,
      .s_axi_p5_HBM_awid        ( 6'b0                          ) ,
      .s_axi_p5_HBM_arid        ( 6'b0                          ) ,
      .s_axi_p5_HBM_bid         (                               ) ,
      .s_axi_p5_HBM_rid         (                               ) ,
  `endif
      .s_axi_p5_HBM_awcache     ( act_axi_card_hbm_p5_awcache   ) ,
      .s_axi_p5_HBM_awprot      ( act_axi_card_hbm_p5_awprot    ) ,
      .s_axi_p5_HBM_awvalid     ( act_axi_card_hbm_p5_awvalid   ) ,
      .s_axi_p5_HBM_awready     ( act_axi_card_hbm_p5_awready   ) ,
      .s_axi_p5_HBM_wdata       ( act_axi_card_hbm_p5_wdata     ) ,
      .s_axi_p5_HBM_wstrb       ( act_axi_card_hbm_p5_wstrb     ) ,
      .s_axi_p5_HBM_wlast       ( act_axi_card_hbm_p5_wlast     ) ,
      .s_axi_p5_HBM_wvalid      ( act_axi_card_hbm_p5_wvalid    ) ,
      .s_axi_p5_HBM_wready      ( act_axi_card_hbm_p5_wready    ) ,
      .s_axi_p5_HBM_bresp       ( act_axi_card_hbm_p5_bresp     ) ,
      .s_axi_p5_HBM_bvalid      ( act_axi_card_hbm_p5_bvalid    ) ,
      .s_axi_p5_HBM_bready      ( act_axi_card_hbm_p5_bready    ) ,
      .s_axi_p5_HBM_araddr      ( act_axi_card_hbm_p5_araddr    ) ,
      .s_axi_p5_HBM_arlen       ( act_axi_card_hbm_p5_arlen     ) ,
      .s_axi_p5_HBM_arsize      ( act_axi_card_hbm_p5_arsize    ) ,
      .s_axi_p5_HBM_arburst     ( act_axi_card_hbm_p5_arburst   ) ,
      .s_axi_p5_HBM_arcache     ( act_axi_card_hbm_p5_arcache   ) ,
      .s_axi_p5_HBM_arprot      ( act_axi_card_hbm_p5_arprot    ) ,
      .s_axi_p5_HBM_arvalid     ( act_axi_card_hbm_p5_arvalid   ) ,
      .s_axi_p5_HBM_arready     ( act_axi_card_hbm_p5_arready   ) ,
      .s_axi_p5_HBM_rdata       ( act_axi_card_hbm_p5_rdata     ) ,
      .s_axi_p5_HBM_rresp       ( act_axi_card_hbm_p5_rresp     ) ,
      .s_axi_p5_HBM_rlast       ( act_axi_card_hbm_p5_rlast     ) ,
      .s_axi_p5_HBM_rvalid      ( act_axi_card_hbm_p5_rvalid    ) ,
      .s_axi_p5_HBM_rready      ( act_axi_card_hbm_p5_rready    ) ,
      `endif

      `ifdef HBM_AXI_IF_P6
      .s_axi_p6_HBM_aclk        ( clock_act                   ) ,
      .s_axi_p6_HBM_awaddr      ( act_axi_card_hbm_p6_awaddr    ) ,
      .s_axi_p6_HBM_awlen       ( act_axi_card_hbm_p6_awlen     ) ,
      .s_axi_p6_HBM_awsize      ( act_axi_card_hbm_p6_awsize    ) ,
      .s_axi_p6_HBM_awburst     ( act_axi_card_hbm_p6_awburst   ) ,
      .s_axi_p6_HBM_awlock      ( act_axi_card_hbm_p6_awlock[0] ) ,
      .s_axi_p6_HBM_arlock      ( act_axi_card_hbm_p6_arlock[0] ) ,
  `ifndef ENABLE_BRAM
      .s_axi_p6_HBM_awregion    ( act_axi_card_hbm_p6_awregion  ) ,
      .s_axi_p6_HBM_awqos       ( act_axi_card_hbm_p6_awqos     ) ,
      .s_axi_p6_HBM_arregion    ( act_axi_card_hbm_p6_arregion  ) ,
      .s_axi_p6_HBM_arqos       ( act_axi_card_hbm_p6_arqos     ) ,
      .s_axi_p6_HBM_awid        ( 6'b0                          ) ,
      .s_axi_p6_HBM_arid        ( 6'b0                          ) ,
      .s_axi_p6_HBM_bid         (                               ) ,
      .s_axi_p6_HBM_rid         (                               ) ,
  `endif
      .s_axi_p6_HBM_awcache     ( act_axi_card_hbm_p6_awcache   ) ,
      .s_axi_p6_HBM_awprot      ( act_axi_card_hbm_p6_awprot    ) ,
      .s_axi_p6_HBM_awvalid     ( act_axi_card_hbm_p6_awvalid   ) ,
      .s_axi_p6_HBM_awready     ( act_axi_card_hbm_p6_awready   ) ,
      .s_axi_p6_HBM_wdata       ( act_axi_card_hbm_p6_wdata     ) ,
      .s_axi_p6_HBM_wstrb       ( act_axi_card_hbm_p6_wstrb     ) ,
      .s_axi_p6_HBM_wlast       ( act_axi_card_hbm_p6_wlast     ) ,
      .s_axi_p6_HBM_wvalid      ( act_axi_card_hbm_p6_wvalid    ) ,
      .s_axi_p6_HBM_wready      ( act_axi_card_hbm_p6_wready    ) ,
      .s_axi_p6_HBM_bresp       ( act_axi_card_hbm_p6_bresp     ) ,
      .s_axi_p6_HBM_bvalid      ( act_axi_card_hbm_p6_bvalid    ) ,
      .s_axi_p6_HBM_bready      ( act_axi_card_hbm_p6_bready    ) ,
      .s_axi_p6_HBM_araddr      ( act_axi_card_hbm_p6_araddr    ) ,
      .s_axi_p6_HBM_arlen       ( act_axi_card_hbm_p6_arlen     ) ,
      .s_axi_p6_HBM_arsize      ( act_axi_card_hbm_p6_arsize    ) ,
      .s_axi_p6_HBM_arburst     ( act_axi_card_hbm_p6_arburst   ) ,
      .s_axi_p6_HBM_arcache     ( act_axi_card_hbm_p6_arcache   ) ,
      .s_axi_p6_HBM_arprot      ( act_axi_card_hbm_p6_arprot    ) ,
      .s_axi_p6_HBM_arvalid     ( act_axi_card_hbm_p6_arvalid   ) ,
      .s_axi_p6_HBM_arready     ( act_axi_card_hbm_p6_arready   ) ,
      .s_axi_p6_HBM_rdata       ( act_axi_card_hbm_p6_rdata     ) ,
      .s_axi_p6_HBM_rresp       ( act_axi_card_hbm_p6_rresp     ) ,
      .s_axi_p6_HBM_rlast       ( act_axi_card_hbm_p6_rlast     ) ,
      .s_axi_p6_HBM_rvalid      ( act_axi_card_hbm_p6_rvalid    ) ,
      .s_axi_p6_HBM_rready      ( act_axi_card_hbm_p6_rready    ) ,
      `endif

      `ifdef HBM_AXI_IF_P7
      .s_axi_p7_HBM_aclk        ( clock_act                   ) ,
      .s_axi_p7_HBM_awaddr      ( act_axi_card_hbm_p7_awaddr    ) ,
      .s_axi_p7_HBM_awlen       ( act_axi_card_hbm_p7_awlen     ) ,
      .s_axi_p7_HBM_awsize      ( act_axi_card_hbm_p7_awsize    ) ,
      .s_axi_p7_HBM_awburst     ( act_axi_card_hbm_p7_awburst   ) ,
      .s_axi_p7_HBM_awlock      ( act_axi_card_hbm_p7_awlock[0] ) ,
      .s_axi_p7_HBM_arlock      ( act_axi_card_hbm_p7_arlock[0] ) ,
  `ifndef ENABLE_BRAM
      .s_axi_p7_HBM_awregion    ( act_axi_card_hbm_p7_awregion  ) ,
      .s_axi_p7_HBM_awqos       ( act_axi_card_hbm_p7_awqos     ) ,
      .s_axi_p7_HBM_arregion    ( act_axi_card_hbm_p7_arregion  ) ,
      .s_axi_p7_HBM_arqos       ( act_axi_card_hbm_p7_arqos     ) ,
      .s_axi_p7_HBM_awid        ( 6'b0                          ) ,
      .s_axi_p7_HBM_arid        ( 6'b0                          ) ,
      .s_axi_p7_HBM_bid         (                               ) ,
      .s_axi_p7_HBM_rid         (                               ) ,
  `endif
      .s_axi_p7_HBM_awcache     ( act_axi_card_hbm_p7_awcache   ) ,
      .s_axi_p7_HBM_awprot      ( act_axi_card_hbm_p7_awprot    ) ,
      .s_axi_p7_HBM_awvalid     ( act_axi_card_hbm_p7_awvalid   ) ,
      .s_axi_p7_HBM_awready     ( act_axi_card_hbm_p7_awready   ) ,
      .s_axi_p7_HBM_wdata       ( act_axi_card_hbm_p7_wdata     ) ,
      .s_axi_p7_HBM_wstrb       ( act_axi_card_hbm_p7_wstrb     ) ,
      .s_axi_p7_HBM_wlast       ( act_axi_card_hbm_p7_wlast     ) ,
      .s_axi_p7_HBM_wvalid      ( act_axi_card_hbm_p7_wvalid    ) ,
      .s_axi_p7_HBM_wready      ( act_axi_card_hbm_p7_wready    ) ,
      .s_axi_p7_HBM_bresp       ( act_axi_card_hbm_p7_bresp     ) ,
      .s_axi_p7_HBM_bvalid      ( act_axi_card_hbm_p7_bvalid    ) ,
      .s_axi_p7_HBM_bready      ( act_axi_card_hbm_p7_bready    ) ,
      .s_axi_p7_HBM_araddr      ( act_axi_card_hbm_p7_araddr    ) ,
      .s_axi_p7_HBM_arlen       ( act_axi_card_hbm_p7_arlen     ) ,
      .s_axi_p7_HBM_arsize      ( act_axi_card_hbm_p7_arsize    ) ,
      .s_axi_p7_HBM_arburst     ( act_axi_card_hbm_p7_arburst   ) ,
      .s_axi_p7_HBM_arcache     ( act_axi_card_hbm_p7_arcache   ) ,
      .s_axi_p7_HBM_arprot      ( act_axi_card_hbm_p7_arprot    ) ,
      .s_axi_p7_HBM_arvalid     ( act_axi_card_hbm_p7_arvalid   ) ,
      .s_axi_p7_HBM_arready     ( act_axi_card_hbm_p7_arready   ) ,
      .s_axi_p7_HBM_rdata       ( act_axi_card_hbm_p7_rdata     ) ,
      .s_axi_p7_HBM_rresp       ( act_axi_card_hbm_p7_rresp     ) ,
      .s_axi_p7_HBM_rlast       ( act_axi_card_hbm_p7_rlast     ) ,
      .s_axi_p7_HBM_rvalid      ( act_axi_card_hbm_p7_rvalid    ) ,
      .s_axi_p7_HBM_rready      ( act_axi_card_hbm_p7_rready    ) ,
      `endif

      `ifdef HBM_AXI_IF_P8
      .s_axi_p8_HBM_aclk        ( clock_act                   ) ,
      .s_axi_p8_HBM_awaddr      ( act_axi_card_hbm_p8_awaddr    ) ,
      .s_axi_p8_HBM_awlen       ( act_axi_card_hbm_p8_awlen     ) ,
      .s_axi_p8_HBM_awsize      ( act_axi_card_hbm_p8_awsize    ) ,
      .s_axi_p8_HBM_awburst     ( act_axi_card_hbm_p8_awburst   ) ,
      .s_axi_p8_HBM_awlock      ( act_axi_card_hbm_p8_awlock[0] ) ,
      .s_axi_p8_HBM_arlock      ( act_axi_card_hbm_p8_arlock[0] ) ,
  `ifndef ENABLE_BRAM
      .s_axi_p8_HBM_awregion    ( act_axi_card_hbm_p8_awregion  ) ,
      .s_axi_p8_HBM_awqos       ( act_axi_card_hbm_p8_awqos     ) ,
      .s_axi_p8_HBM_arregion    ( act_axi_card_hbm_p8_arregion  ) ,
      .s_axi_p8_HBM_arqos       ( act_axi_card_hbm_p8_arqos     ) ,
      .s_axi_p8_HBM_awid        ( 6'b0                          ) ,
      .s_axi_p8_HBM_arid        ( 6'b0                          ) ,
      .s_axi_p8_HBM_bid         (                               ) ,
      .s_axi_p8_HBM_rid         (                               ) ,
  `endif
      .s_axi_p8_HBM_awcache     ( act_axi_card_hbm_p8_awcache   ) ,
      .s_axi_p8_HBM_awprot      ( act_axi_card_hbm_p8_awprot    ) ,
      .s_axi_p8_HBM_awvalid     ( act_axi_card_hbm_p8_awvalid   ) ,
      .s_axi_p8_HBM_awready     ( act_axi_card_hbm_p8_awready   ) ,
      .s_axi_p8_HBM_wdata       ( act_axi_card_hbm_p8_wdata     ) ,
      .s_axi_p8_HBM_wstrb       ( act_axi_card_hbm_p8_wstrb     ) ,
      .s_axi_p8_HBM_wlast       ( act_axi_card_hbm_p8_wlast     ) ,
      .s_axi_p8_HBM_wvalid      ( act_axi_card_hbm_p8_wvalid    ) ,
      .s_axi_p8_HBM_wready      ( act_axi_card_hbm_p8_wready    ) ,
      .s_axi_p8_HBM_bresp       ( act_axi_card_hbm_p8_bresp     ) ,
      .s_axi_p8_HBM_bvalid      ( act_axi_card_hbm_p8_bvalid    ) ,
      .s_axi_p8_HBM_bready      ( act_axi_card_hbm_p8_bready    ) ,
      .s_axi_p8_HBM_araddr      ( act_axi_card_hbm_p8_araddr    ) ,
      .s_axi_p8_HBM_arlen       ( act_axi_card_hbm_p8_arlen     ) ,
      .s_axi_p8_HBM_arsize      ( act_axi_card_hbm_p8_arsize    ) ,
      .s_axi_p8_HBM_arburst     ( act_axi_card_hbm_p8_arburst   ) ,
      .s_axi_p8_HBM_arcache     ( act_axi_card_hbm_p8_arcache   ) ,
      .s_axi_p8_HBM_arprot      ( act_axi_card_hbm_p8_arprot    ) ,
      .s_axi_p8_HBM_arvalid     ( act_axi_card_hbm_p8_arvalid   ) ,
      .s_axi_p8_HBM_arready     ( act_axi_card_hbm_p8_arready   ) ,
      .s_axi_p8_HBM_rdata       ( act_axi_card_hbm_p8_rdata     ) ,
      .s_axi_p8_HBM_rresp       ( act_axi_card_hbm_p8_rresp     ) ,
      .s_axi_p8_HBM_rlast       ( act_axi_card_hbm_p8_rlast     ) ,
      .s_axi_p8_HBM_rvalid      ( act_axi_card_hbm_p8_rvalid    ) ,
      .s_axi_p8_HBM_rready      ( act_axi_card_hbm_p8_rready    ) ,
      `endif

      `ifdef HBM_AXI_IF_P9
      .s_axi_p9_HBM_aclk        ( clock_act                   ) ,
      .s_axi_p9_HBM_awaddr      ( act_axi_card_hbm_p9_awaddr    ) ,
      .s_axi_p9_HBM_awlen       ( act_axi_card_hbm_p9_awlen     ) ,
      .s_axi_p9_HBM_awsize      ( act_axi_card_hbm_p9_awsize    ) ,
      .s_axi_p9_HBM_awburst     ( act_axi_card_hbm_p9_awburst   ) ,
      .s_axi_p9_HBM_awlock      ( act_axi_card_hbm_p9_awlock[0] ) ,
      .s_axi_p9_HBM_arlock      ( act_axi_card_hbm_p9_arlock[0] ) ,
  `ifndef ENABLE_BRAM
      .s_axi_p9_HBM_awregion    ( act_axi_card_hbm_p9_awregion  ) ,
      .s_axi_p9_HBM_awqos       ( act_axi_card_hbm_p9_awqos     ) ,
      .s_axi_p9_HBM_arregion    ( act_axi_card_hbm_p9_arregion  ) ,
      .s_axi_p9_HBM_arqos       ( act_axi_card_hbm_p9_arqos     ) ,
      .s_axi_p9_HBM_awid        ( 6'b0                          ) ,
      .s_axi_p9_HBM_arid        ( 6'b0                          ) ,
      .s_axi_p9_HBM_bid         (                               ) ,
      .s_axi_p9_HBM_rid         (                               ) ,
  `endif
      .s_axi_p9_HBM_awcache     ( act_axi_card_hbm_p9_awcache   ) ,
      .s_axi_p9_HBM_awprot      ( act_axi_card_hbm_p9_awprot    ) ,
      .s_axi_p9_HBM_awvalid     ( act_axi_card_hbm_p9_awvalid   ) ,
      .s_axi_p9_HBM_awready     ( act_axi_card_hbm_p9_awready   ) ,
      .s_axi_p9_HBM_wdata       ( act_axi_card_hbm_p9_wdata     ) ,
      .s_axi_p9_HBM_wstrb       ( act_axi_card_hbm_p9_wstrb     ) ,
      .s_axi_p9_HBM_wlast       ( act_axi_card_hbm_p9_wlast     ) ,
      .s_axi_p9_HBM_wvalid      ( act_axi_card_hbm_p9_wvalid    ) ,
      .s_axi_p9_HBM_wready      ( act_axi_card_hbm_p9_wready    ) ,
      .s_axi_p9_HBM_bresp       ( act_axi_card_hbm_p9_bresp     ) ,
      .s_axi_p9_HBM_bvalid      ( act_axi_card_hbm_p9_bvalid    ) ,
      .s_axi_p9_HBM_bready      ( act_axi_card_hbm_p9_bready    ) ,
      .s_axi_p9_HBM_araddr      ( act_axi_card_hbm_p9_araddr    ) ,
      .s_axi_p9_HBM_arlen       ( act_axi_card_hbm_p9_arlen     ) ,
      .s_axi_p9_HBM_arsize      ( act_axi_card_hbm_p9_arsize    ) ,
      .s_axi_p9_HBM_arburst     ( act_axi_card_hbm_p9_arburst   ) ,
      .s_axi_p9_HBM_arcache     ( act_axi_card_hbm_p9_arcache   ) ,
      .s_axi_p9_HBM_arprot      ( act_axi_card_hbm_p9_arprot    ) ,
      .s_axi_p9_HBM_arvalid     ( act_axi_card_hbm_p9_arvalid   ) ,
      .s_axi_p9_HBM_arready     ( act_axi_card_hbm_p9_arready   ) ,
      .s_axi_p9_HBM_rdata       ( act_axi_card_hbm_p9_rdata     ) ,
      .s_axi_p9_HBM_rresp       ( act_axi_card_hbm_p9_rresp     ) ,
      .s_axi_p9_HBM_rlast       ( act_axi_card_hbm_p9_rlast     ) ,
      .s_axi_p9_HBM_rvalid      ( act_axi_card_hbm_p9_rvalid    ) ,
      .s_axi_p9_HBM_rready      ( act_axi_card_hbm_p9_rready    ) ,
      `endif

      `ifdef HBM_AXI_IF_P10
      .s_axi_p10_HBM_aclk        ( clock_act                   ) ,
      .s_axi_p10_HBM_awaddr      ( act_axi_card_hbm_p10_awaddr    ) ,
      .s_axi_p10_HBM_awlen       ( act_axi_card_hbm_p10_awlen     ) ,
      .s_axi_p10_HBM_awsize      ( act_axi_card_hbm_p10_awsize    ) ,
      .s_axi_p10_HBM_awburst     ( act_axi_card_hbm_p10_awburst   ) ,
      .s_axi_p10_HBM_awlock      ( act_axi_card_hbm_p10_awlock[0] ) ,
      .s_axi_p10_HBM_arlock      ( act_axi_card_hbm_p10_arlock[0] ) ,
  `ifndef ENABLE_BRAM
      .s_axi_p10_HBM_awregion    ( act_axi_card_hbm_p10_awregion  ) ,
      .s_axi_p10_HBM_awqos       ( act_axi_card_hbm_p10_awqos     ) ,
      .s_axi_p10_HBM_arregion    ( act_axi_card_hbm_p10_arregion  ) ,
      .s_axi_p10_HBM_arqos       ( act_axi_card_hbm_p10_arqos     ) ,
      .s_axi_p10_HBM_awid        ( 6'b0                           ) ,
      .s_axi_p10_HBM_arid        ( 6'b0                           ) ,
      .s_axi_p10_HBM_bid         (                                ) ,
      .s_axi_p10_HBM_rid         (                                ) ,
  `endif
      .s_axi_p10_HBM_awcache     ( act_axi_card_hbm_p10_awcache   ) ,
      .s_axi_p10_HBM_awprot      ( act_axi_card_hbm_p10_awprot    ) ,
      .s_axi_p10_HBM_awvalid     ( act_axi_card_hbm_p10_awvalid   ) ,
      .s_axi_p10_HBM_awready     ( act_axi_card_hbm_p10_awready   ) ,
      .s_axi_p10_HBM_wdata       ( act_axi_card_hbm_p10_wdata     ) ,
      .s_axi_p10_HBM_wstrb       ( act_axi_card_hbm_p10_wstrb     ) ,
      .s_axi_p10_HBM_wlast       ( act_axi_card_hbm_p10_wlast     ) ,
      .s_axi_p10_HBM_wvalid      ( act_axi_card_hbm_p10_wvalid    ) ,
      .s_axi_p10_HBM_wready      ( act_axi_card_hbm_p10_wready    ) ,
      .s_axi_p10_HBM_bresp       ( act_axi_card_hbm_p10_bresp     ) ,
      .s_axi_p10_HBM_bvalid      ( act_axi_card_hbm_p10_bvalid    ) ,
      .s_axi_p10_HBM_bready      ( act_axi_card_hbm_p10_bready    ) ,
      .s_axi_p10_HBM_araddr      ( act_axi_card_hbm_p10_araddr    ) ,
      .s_axi_p10_HBM_arlen       ( act_axi_card_hbm_p10_arlen     ) ,
      .s_axi_p10_HBM_arsize      ( act_axi_card_hbm_p10_arsize    ) ,
      .s_axi_p10_HBM_arburst     ( act_axi_card_hbm_p10_arburst   ) ,
      .s_axi_p10_HBM_arcache     ( act_axi_card_hbm_p10_arcache   ) ,
      .s_axi_p10_HBM_arprot      ( act_axi_card_hbm_p10_arprot    ) ,
      .s_axi_p10_HBM_arvalid     ( act_axi_card_hbm_p10_arvalid   ) ,
      .s_axi_p10_HBM_arready     ( act_axi_card_hbm_p10_arready   ) ,
      .s_axi_p10_HBM_rdata       ( act_axi_card_hbm_p10_rdata     ) ,
      .s_axi_p10_HBM_rresp       ( act_axi_card_hbm_p10_rresp     ) ,
      .s_axi_p10_HBM_rlast       ( act_axi_card_hbm_p10_rlast     ) ,
      .s_axi_p10_HBM_rvalid      ( act_axi_card_hbm_p10_rvalid    ) ,
      .s_axi_p10_HBM_rready      ( act_axi_card_hbm_p10_rready    ) ,
      `endif

      `ifdef HBM_AXI_IF_P11
      .s_axi_p11_HBM_aclk        ( clock_act                   ) ,
      .s_axi_p11_HBM_awaddr      ( act_axi_card_hbm_p11_awaddr    ) ,
      .s_axi_p11_HBM_awlen       ( act_axi_card_hbm_p11_awlen     ) ,
      .s_axi_p11_HBM_awsize      ( act_axi_card_hbm_p11_awsize    ) ,
      .s_axi_p11_HBM_awburst     ( act_axi_card_hbm_p11_awburst   ) ,
      .s_axi_p11_HBM_awlock      ( act_axi_card_hbm_p11_awlock[0] ) ,
      .s_axi_p11_HBM_arlock      ( act_axi_card_hbm_p11_arlock[0] ) ,
  `ifndef ENABLE_BRAM
      .s_axi_p11_HBM_awregion    ( act_axi_card_hbm_p11_awregion  ) ,
      .s_axi_p11_HBM_awqos       ( act_axi_card_hbm_p11_awqos     ) ,
      .s_axi_p11_HBM_arregion    ( act_axi_card_hbm_p11_arregion  ) ,
      .s_axi_p11_HBM_arqos       ( act_axi_card_hbm_p11_arqos     ) ,
      .s_axi_p11_HBM_awid        ( 6'b0                           ) ,
      .s_axi_p11_HBM_arid        ( 6'b0                           ) ,
      .s_axi_p11_HBM_bid         (                                ) ,
      .s_axi_p11_HBM_rid         (                                ) ,
  `endif
      .s_axi_p11_HBM_awcache     ( act_axi_card_hbm_p11_awcache   ) ,
      .s_axi_p11_HBM_awprot      ( act_axi_card_hbm_p11_awprot    ) ,
      .s_axi_p11_HBM_awvalid     ( act_axi_card_hbm_p11_awvalid   ) ,
      .s_axi_p11_HBM_awready     ( act_axi_card_hbm_p11_awready   ) ,
      .s_axi_p11_HBM_wdata       ( act_axi_card_hbm_p11_wdata     ) ,
      .s_axi_p11_HBM_wstrb       ( act_axi_card_hbm_p11_wstrb     ) ,
      .s_axi_p11_HBM_wlast       ( act_axi_card_hbm_p11_wlast     ) ,
      .s_axi_p11_HBM_wvalid      ( act_axi_card_hbm_p11_wvalid    ) ,
      .s_axi_p11_HBM_wready      ( act_axi_card_hbm_p11_wready    ) ,
      .s_axi_p11_HBM_bresp       ( act_axi_card_hbm_p11_bresp     ) ,
      .s_axi_p11_HBM_bvalid      ( act_axi_card_hbm_p11_bvalid    ) ,
      .s_axi_p11_HBM_bready      ( act_axi_card_hbm_p11_bready    ) ,
      .s_axi_p11_HBM_araddr      ( act_axi_card_hbm_p11_araddr    ) ,
      .s_axi_p11_HBM_arlen       ( act_axi_card_hbm_p11_arlen     ) ,
      .s_axi_p11_HBM_arsize      ( act_axi_card_hbm_p11_arsize    ) ,
      .s_axi_p11_HBM_arburst     ( act_axi_card_hbm_p11_arburst   ) ,
      .s_axi_p11_HBM_arcache     ( act_axi_card_hbm_p11_arcache   ) ,
      .s_axi_p11_HBM_arprot      ( act_axi_card_hbm_p11_arprot    ) ,
      .s_axi_p11_HBM_arvalid     ( act_axi_card_hbm_p11_arvalid   ) ,
      .s_axi_p11_HBM_arready     ( act_axi_card_hbm_p11_arready   ) ,
      .s_axi_p11_HBM_rdata       ( act_axi_card_hbm_p11_rdata     ) ,
      .s_axi_p11_HBM_rresp       ( act_axi_card_hbm_p11_rresp     ) ,
      .s_axi_p11_HBM_rlast       ( act_axi_card_hbm_p11_rlast     ) ,
      .s_axi_p11_HBM_rvalid      ( act_axi_card_hbm_p11_rvalid    ) ,
      .s_axi_p11_HBM_rready      ( act_axi_card_hbm_p11_rready    ) ,
      `endif

      `ifdef HBM_AXI_IF_P12
      .s_axi_p12_HBM_aclk        ( clock_act                   ) ,
      .s_axi_p12_HBM_awaddr      ( act_axi_card_hbm_p12_awaddr    ) ,
      .s_axi_p12_HBM_awlen       ( act_axi_card_hbm_p12_awlen     ) ,
      .s_axi_p12_HBM_awsize      ( act_axi_card_hbm_p12_awsize    ) ,
      .s_axi_p12_HBM_awburst     ( act_axi_card_hbm_p12_awburst   ) ,
      .s_axi_p12_HBM_awlock      ( act_axi_card_hbm_p12_awlock[0] ) ,
      .s_axi_p12_HBM_arlock      ( act_axi_card_hbm_p12_arlock[0] ) ,
  `ifndef ENABLE_BRAM
      .s_axi_p12_HBM_awregion    ( act_axi_card_hbm_p12_awregion  ) ,
      .s_axi_p12_HBM_awqos       ( act_axi_card_hbm_p12_awqos     ) ,
      .s_axi_p12_HBM_arregion    ( act_axi_card_hbm_p12_arregion  ) ,
      .s_axi_p12_HBM_arqos       ( act_axi_card_hbm_p12_arqos     ) ,
      .s_axi_p12_HBM_awid        ( 6'b0                           ) ,
      .s_axi_p12_HBM_arid        ( 6'b0                           ) ,
      .s_axi_p12_HBM_bid         (                                ) ,
      .s_axi_p12_HBM_rid         (                                ) ,
  `endif
      .s_axi_p12_HBM_awcache     ( act_axi_card_hbm_p12_awcache   ) ,
      .s_axi_p12_HBM_awprot      ( act_axi_card_hbm_p12_awprot    ) ,
      .s_axi_p12_HBM_awvalid     ( act_axi_card_hbm_p12_awvalid   ) ,
      .s_axi_p12_HBM_awready     ( act_axi_card_hbm_p12_awready   ) ,
      .s_axi_p12_HBM_wdata       ( act_axi_card_hbm_p12_wdata     ) ,
      .s_axi_p12_HBM_wstrb       ( act_axi_card_hbm_p12_wstrb     ) ,
      .s_axi_p12_HBM_wlast       ( act_axi_card_hbm_p12_wlast     ) ,
      .s_axi_p12_HBM_wvalid      ( act_axi_card_hbm_p12_wvalid    ) ,
      .s_axi_p12_HBM_wready      ( act_axi_card_hbm_p12_wready    ) ,
      .s_axi_p12_HBM_bresp       ( act_axi_card_hbm_p12_bresp     ) ,
      .s_axi_p12_HBM_bvalid      ( act_axi_card_hbm_p12_bvalid    ) ,
      .s_axi_p12_HBM_bready      ( act_axi_card_hbm_p12_bready    ) ,
      .s_axi_p12_HBM_araddr      ( act_axi_card_hbm_p12_araddr    ) ,
      .s_axi_p12_HBM_arlen       ( act_axi_card_hbm_p12_arlen     ) ,
      .s_axi_p12_HBM_arsize      ( act_axi_card_hbm_p12_arsize    ) ,
      .s_axi_p12_HBM_arburst     ( act_axi_card_hbm_p12_arburst   ) ,
      .s_axi_p12_HBM_arcache     ( act_axi_card_hbm_p12_arcache   ) ,
      .s_axi_p12_HBM_arprot      ( act_axi_card_hbm_p12_arprot    ) ,
      .s_axi_p12_HBM_arvalid     ( act_axi_card_hbm_p12_arvalid   ) ,
      .s_axi_p12_HBM_arready     ( act_axi_card_hbm_p12_arready   ) ,
      .s_axi_p12_HBM_rdata       ( act_axi_card_hbm_p12_rdata     ) ,
      .s_axi_p12_HBM_rresp       ( act_axi_card_hbm_p12_rresp     ) ,
      .s_axi_p12_HBM_rlast       ( act_axi_card_hbm_p12_rlast     ) ,
      .s_axi_p12_HBM_rvalid      ( act_axi_card_hbm_p12_rvalid    ) ,
      .s_axi_p12_HBM_rready      ( act_axi_card_hbm_p12_rready    ) ,
      `endif

      `ifdef HBM_AXI_IF_P13
      .s_axi_p13_HBM_aclk        ( clock_act                   ) ,
      .s_axi_p13_HBM_awaddr      ( act_axi_card_hbm_p13_awaddr    ) ,
      .s_axi_p13_HBM_awlen       ( act_axi_card_hbm_p13_awlen     ) ,
      .s_axi_p13_HBM_awsize      ( act_axi_card_hbm_p13_awsize    ) ,
      .s_axi_p13_HBM_awburst     ( act_axi_card_hbm_p13_awburst   ) ,
      .s_axi_p13_HBM_awlock      ( act_axi_card_hbm_p13_awlock[0] ) ,
      .s_axi_p13_HBM_arlock      ( act_axi_card_hbm_p13_arlock[0] ) ,
  `ifndef ENABLE_BRAM
      .s_axi_p13_HBM_awregion    ( act_axi_card_hbm_p13_awregion  ) ,
      .s_axi_p13_HBM_awqos       ( act_axi_card_hbm_p13_awqos     ) ,
      .s_axi_p13_HBM_arregion    ( act_axi_card_hbm_p13_arregion  ) ,
      .s_axi_p13_HBM_arqos       ( act_axi_card_hbm_p13_arqos     ) ,
      .s_axi_p13_HBM_awid        ( 6'b0                           ) ,
      .s_axi_p13_HBM_arid        ( 6'b0                           ) ,
      .s_axi_p13_HBM_bid         (                                ) ,
      .s_axi_p13_HBM_rid         (                                ) ,
  `endif
      .s_axi_p13_HBM_awcache     ( act_axi_card_hbm_p13_awcache   ) ,
      .s_axi_p13_HBM_awprot      ( act_axi_card_hbm_p13_awprot    ) ,
      .s_axi_p13_HBM_awvalid     ( act_axi_card_hbm_p13_awvalid   ) ,
      .s_axi_p13_HBM_awready     ( act_axi_card_hbm_p13_awready   ) ,
      .s_axi_p13_HBM_wdata       ( act_axi_card_hbm_p13_wdata     ) ,
      .s_axi_p13_HBM_wstrb       ( act_axi_card_hbm_p13_wstrb     ) ,
      .s_axi_p13_HBM_wlast       ( act_axi_card_hbm_p13_wlast     ) ,
      .s_axi_p13_HBM_wvalid      ( act_axi_card_hbm_p13_wvalid    ) ,
      .s_axi_p13_HBM_wready      ( act_axi_card_hbm_p13_wready    ) ,
      .s_axi_p13_HBM_bresp       ( act_axi_card_hbm_p13_bresp     ) ,
      .s_axi_p13_HBM_bvalid      ( act_axi_card_hbm_p13_bvalid    ) ,
      .s_axi_p13_HBM_bready      ( act_axi_card_hbm_p13_bready    ) ,
      .s_axi_p13_HBM_araddr      ( act_axi_card_hbm_p13_araddr    ) ,
      .s_axi_p13_HBM_arlen       ( act_axi_card_hbm_p13_arlen     ) ,
      .s_axi_p13_HBM_arsize      ( act_axi_card_hbm_p13_arsize    ) ,
      .s_axi_p13_HBM_arburst     ( act_axi_card_hbm_p13_arburst   ) ,
      .s_axi_p13_HBM_arcache     ( act_axi_card_hbm_p13_arcache   ) ,
      .s_axi_p13_HBM_arprot      ( act_axi_card_hbm_p13_arprot    ) ,
      .s_axi_p13_HBM_arvalid     ( act_axi_card_hbm_p13_arvalid   ) ,
      .s_axi_p13_HBM_arready     ( act_axi_card_hbm_p13_arready   ) ,
      .s_axi_p13_HBM_rdata       ( act_axi_card_hbm_p13_rdata     ) ,
      .s_axi_p13_HBM_rresp       ( act_axi_card_hbm_p13_rresp     ) ,
      .s_axi_p13_HBM_rlast       ( act_axi_card_hbm_p13_rlast     ) ,
      .s_axi_p13_HBM_rvalid      ( act_axi_card_hbm_p13_rvalid    ) ,
      .s_axi_p13_HBM_rready      ( act_axi_card_hbm_p13_rready    ) ,
      `endif

      `ifdef HBM_AXI_IF_P14
      .s_axi_p14_HBM_aclk        ( clock_act                   ) ,
      .s_axi_p14_HBM_awaddr      ( act_axi_card_hbm_p14_awaddr    ) ,
      .s_axi_p14_HBM_awlen       ( act_axi_card_hbm_p14_awlen     ) ,
      .s_axi_p14_HBM_awsize      ( act_axi_card_hbm_p14_awsize    ) ,
      .s_axi_p14_HBM_awburst     ( act_axi_card_hbm_p14_awburst   ) ,
      .s_axi_p14_HBM_awlock      ( act_axi_card_hbm_p14_awlock[0] ) ,
      .s_axi_p14_HBM_arlock      ( act_axi_card_hbm_p14_arlock[0] ) ,
  `ifndef ENABLE_BRAM
      .s_axi_p14_HBM_awregion    ( act_axi_card_hbm_p14_awregion  ) ,
      .s_axi_p14_HBM_awqos       ( act_axi_card_hbm_p14_awqos     ) ,
      .s_axi_p14_HBM_arregion    ( act_axi_card_hbm_p14_arregion  ) ,
      .s_axi_p14_HBM_arqos       ( act_axi_card_hbm_p14_arqos     ) ,
      .s_axi_p14_HBM_awid        ( 6'b0                           ) ,
      .s_axi_p14_HBM_arid        ( 6'b0                           ) ,
      .s_axi_p14_HBM_bid         (                                ) ,
      .s_axi_p14_HBM_rid         (                                ) ,
  `endif
      .s_axi_p14_HBM_awcache     ( act_axi_card_hbm_p14_awcache   ) ,
      .s_axi_p14_HBM_awprot      ( act_axi_card_hbm_p14_awprot    ) ,
      .s_axi_p14_HBM_awvalid     ( act_axi_card_hbm_p14_awvalid   ) ,
      .s_axi_p14_HBM_awready     ( act_axi_card_hbm_p14_awready   ) ,
      .s_axi_p14_HBM_wdata       ( act_axi_card_hbm_p14_wdata     ) ,
      .s_axi_p14_HBM_wstrb       ( act_axi_card_hbm_p14_wstrb     ) ,
      .s_axi_p14_HBM_wlast       ( act_axi_card_hbm_p14_wlast     ) ,
      .s_axi_p14_HBM_wvalid      ( act_axi_card_hbm_p14_wvalid    ) ,
      .s_axi_p14_HBM_wready      ( act_axi_card_hbm_p14_wready    ) ,
      .s_axi_p14_HBM_bresp       ( act_axi_card_hbm_p14_bresp     ) ,
      .s_axi_p14_HBM_bvalid      ( act_axi_card_hbm_p14_bvalid    ) ,
      .s_axi_p14_HBM_bready      ( act_axi_card_hbm_p14_bready    ) ,
      .s_axi_p14_HBM_araddr      ( act_axi_card_hbm_p14_araddr    ) ,
      .s_axi_p14_HBM_arlen       ( act_axi_card_hbm_p14_arlen     ) ,
      .s_axi_p14_HBM_arsize      ( act_axi_card_hbm_p14_arsize    ) ,
      .s_axi_p14_HBM_arburst     ( act_axi_card_hbm_p14_arburst   ) ,
      .s_axi_p14_HBM_arcache     ( act_axi_card_hbm_p14_arcache   ) ,
      .s_axi_p14_HBM_arprot      ( act_axi_card_hbm_p14_arprot    ) ,
      .s_axi_p14_HBM_arvalid     ( act_axi_card_hbm_p14_arvalid   ) ,
      .s_axi_p14_HBM_arready     ( act_axi_card_hbm_p14_arready   ) ,
      .s_axi_p14_HBM_rdata       ( act_axi_card_hbm_p14_rdata     ) ,
      .s_axi_p14_HBM_rresp       ( act_axi_card_hbm_p14_rresp     ) ,
      .s_axi_p14_HBM_rlast       ( act_axi_card_hbm_p14_rlast     ) ,
      .s_axi_p14_HBM_rvalid      ( act_axi_card_hbm_p14_rvalid    ) ,
      .s_axi_p14_HBM_rready      ( act_axi_card_hbm_p14_rready    ) ,
      `endif

      `ifdef HBM_AXI_IF_P15
      .s_axi_p15_HBM_aclk        ( clock_act                   ) ,
      .s_axi_p15_HBM_awaddr      ( act_axi_card_hbm_p15_awaddr    ) ,
      .s_axi_p15_HBM_awlen       ( act_axi_card_hbm_p15_awlen     ) ,
      .s_axi_p15_HBM_awsize      ( act_axi_card_hbm_p15_awsize    ) ,
      .s_axi_p15_HBM_awburst     ( act_axi_card_hbm_p15_awburst   ) ,
      .s_axi_p15_HBM_awlock      ( act_axi_card_hbm_p15_awlock[0] ) ,
      .s_axi_p15_HBM_arlock      ( act_axi_card_hbm_p15_arlock[0] ) ,
  `ifndef ENABLE_BRAM
      .s_axi_p15_HBM_awregion    ( act_axi_card_hbm_p15_awregion  ) ,
      .s_axi_p15_HBM_awqos       ( act_axi_card_hbm_p15_awqos     ) ,
      .s_axi_p15_HBM_arregion    ( act_axi_card_hbm_p15_arregion  ) ,
      .s_axi_p15_HBM_arqos       ( act_axi_card_hbm_p15_arqos     ) ,
      .s_axi_p15_HBM_awid        ( 6'b0                           ) ,
      .s_axi_p15_HBM_arid        ( 6'b0                           ) ,
      .s_axi_p15_HBM_bid         (                                ) ,
      .s_axi_p15_HBM_rid         (                                ) ,
  `endif
      .s_axi_p15_HBM_awcache     ( act_axi_card_hbm_p15_awcache   ) ,
      .s_axi_p15_HBM_awprot      ( act_axi_card_hbm_p15_awprot    ) ,
      .s_axi_p15_HBM_awvalid     ( act_axi_card_hbm_p15_awvalid   ) ,
      .s_axi_p15_HBM_awready     ( act_axi_card_hbm_p15_awready   ) ,
      .s_axi_p15_HBM_wdata       ( act_axi_card_hbm_p15_wdata     ) ,
      .s_axi_p15_HBM_wstrb       ( act_axi_card_hbm_p15_wstrb     ) ,
      .s_axi_p15_HBM_wlast       ( act_axi_card_hbm_p15_wlast     ) ,
      .s_axi_p15_HBM_wvalid      ( act_axi_card_hbm_p15_wvalid    ) ,
      .s_axi_p15_HBM_wready      ( act_axi_card_hbm_p15_wready    ) ,
      .s_axi_p15_HBM_bresp       ( act_axi_card_hbm_p15_bresp     ) ,
      .s_axi_p15_HBM_bvalid      ( act_axi_card_hbm_p15_bvalid    ) ,
      .s_axi_p15_HBM_bready      ( act_axi_card_hbm_p15_bready    ) ,
      .s_axi_p15_HBM_araddr      ( act_axi_card_hbm_p15_araddr    ) ,
      .s_axi_p15_HBM_arlen       ( act_axi_card_hbm_p15_arlen     ) ,
      .s_axi_p15_HBM_arsize      ( act_axi_card_hbm_p15_arsize    ) ,
      .s_axi_p15_HBM_arburst     ( act_axi_card_hbm_p15_arburst   ) ,
      .s_axi_p15_HBM_arcache     ( act_axi_card_hbm_p15_arcache   ) ,
      .s_axi_p15_HBM_arprot      ( act_axi_card_hbm_p15_arprot    ) ,
      .s_axi_p15_HBM_arvalid     ( act_axi_card_hbm_p15_arvalid   ) ,
      .s_axi_p15_HBM_arready     ( act_axi_card_hbm_p15_arready   ) ,
      .s_axi_p15_HBM_rdata       ( act_axi_card_hbm_p15_rdata     ) ,
      .s_axi_p15_HBM_rresp       ( act_axi_card_hbm_p15_rresp     ) ,
      .s_axi_p15_HBM_rlast       ( act_axi_card_hbm_p15_rlast     ) ,
      .s_axi_p15_HBM_rvalid      ( act_axi_card_hbm_p15_rvalid    ) ,
      .s_axi_p15_HBM_rready      ( act_axi_card_hbm_p15_rready    ) ,
      `endif

      `ifdef HBM_AXI_IF_P16
      .s_axi_p16_HBM_aclk        ( clock_act                   ) ,
      .s_axi_p16_HBM_awaddr      ( act_axi_card_hbm_p16_awaddr    ) ,
      .s_axi_p16_HBM_awlen       ( act_axi_card_hbm_p16_awlen     ) ,
      .s_axi_p16_HBM_awsize      ( act_axi_card_hbm_p16_awsize    ) ,
      .s_axi_p16_HBM_awburst     ( act_axi_card_hbm_p16_awburst   ) ,
      .s_axi_p16_HBM_awlock      ( act_axi_card_hbm_p16_awlock[0] ) ,
      .s_axi_p16_HBM_arlock      ( act_axi_card_hbm_p16_arlock[0] ) ,
  `ifndef ENABLE_BRAM
      .s_axi_p16_HBM_awregion    ( act_axi_card_hbm_p16_awregion  ) ,
      .s_axi_p16_HBM_awqos       ( act_axi_card_hbm_p16_awqos     ) ,
      .s_axi_p16_HBM_arregion    ( act_axi_card_hbm_p16_arregion  ) ,
      .s_axi_p16_HBM_arqos       ( act_axi_card_hbm_p16_arqos     ) ,
      .s_axi_p16_HBM_awid        ( 6'b0                           ) ,
      .s_axi_p16_HBM_arid        ( 6'b0                           ) ,
      .s_axi_p16_HBM_bid         (                                ) ,
      .s_axi_p16_HBM_rid         (                                ) ,
  `endif
      .s_axi_p16_HBM_awcache     ( act_axi_card_hbm_p16_awcache   ) ,
      .s_axi_p16_HBM_awprot      ( act_axi_card_hbm_p16_awprot    ) ,
      .s_axi_p16_HBM_awvalid     ( act_axi_card_hbm_p16_awvalid   ) ,
      .s_axi_p16_HBM_awready     ( act_axi_card_hbm_p16_awready   ) ,
      .s_axi_p16_HBM_wdata       ( act_axi_card_hbm_p16_wdata     ) ,
      .s_axi_p16_HBM_wstrb       ( act_axi_card_hbm_p16_wstrb     ) ,
      .s_axi_p16_HBM_wlast       ( act_axi_card_hbm_p16_wlast     ) ,
      .s_axi_p16_HBM_wvalid      ( act_axi_card_hbm_p16_wvalid    ) ,
      .s_axi_p16_HBM_wready      ( act_axi_card_hbm_p16_wready    ) ,
      .s_axi_p16_HBM_bresp       ( act_axi_card_hbm_p16_bresp     ) ,
      .s_axi_p16_HBM_bvalid      ( act_axi_card_hbm_p16_bvalid    ) ,
      .s_axi_p16_HBM_bready      ( act_axi_card_hbm_p16_bready    ) ,
      .s_axi_p16_HBM_araddr      ( act_axi_card_hbm_p16_araddr    ) ,
      .s_axi_p16_HBM_arlen       ( act_axi_card_hbm_p16_arlen     ) ,
      .s_axi_p16_HBM_arsize      ( act_axi_card_hbm_p16_arsize    ) ,
      .s_axi_p16_HBM_arburst     ( act_axi_card_hbm_p16_arburst   ) ,
      .s_axi_p16_HBM_arcache     ( act_axi_card_hbm_p16_arcache   ) ,
      .s_axi_p16_HBM_arprot      ( act_axi_card_hbm_p16_arprot    ) ,
      .s_axi_p16_HBM_arvalid     ( act_axi_card_hbm_p16_arvalid   ) ,
      .s_axi_p16_HBM_arready     ( act_axi_card_hbm_p16_arready   ) ,
      .s_axi_p16_HBM_rdata       ( act_axi_card_hbm_p16_rdata     ) ,
      .s_axi_p16_HBM_rresp       ( act_axi_card_hbm_p16_rresp     ) ,
      .s_axi_p16_HBM_rlast       ( act_axi_card_hbm_p16_rlast     ) ,
      .s_axi_p16_HBM_rvalid      ( act_axi_card_hbm_p16_rvalid    ) ,
      .s_axi_p16_HBM_rready      ( act_axi_card_hbm_p16_rready    ) ,
      `endif

      `ifdef HBM_AXI_IF_P17
      .s_axi_p17_HBM_aclk        ( clock_act                   ) ,
      .s_axi_p17_HBM_awaddr      ( act_axi_card_hbm_p17_awaddr    ) ,
      .s_axi_p17_HBM_awlen       ( act_axi_card_hbm_p17_awlen     ) ,
      .s_axi_p17_HBM_awsize      ( act_axi_card_hbm_p17_awsize    ) ,
      .s_axi_p17_HBM_awburst     ( act_axi_card_hbm_p17_awburst   ) ,
      .s_axi_p17_HBM_awlock      ( act_axi_card_hbm_p17_awlock[0] ) ,
      .s_axi_p17_HBM_arlock      ( act_axi_card_hbm_p17_arlock[0] ) ,
  `ifndef ENABLE_BRAM
      .s_axi_p17_HBM_awregion    ( act_axi_card_hbm_p17_awregion  ) ,
      .s_axi_p17_HBM_awqos       ( act_axi_card_hbm_p17_awqos     ) ,
      .s_axi_p17_HBM_arregion    ( act_axi_card_hbm_p17_arregion  ) ,
      .s_axi_p17_HBM_arqos       ( act_axi_card_hbm_p17_arqos     ) ,
      .s_axi_p17_HBM_awid        ( 6'b0                           ) ,
      .s_axi_p17_HBM_arid        ( 6'b0                           ) ,
      .s_axi_p17_HBM_bid         (                                ) ,
      .s_axi_p17_HBM_rid         (                                ) ,
  `endif
      .s_axi_p17_HBM_awcache     ( act_axi_card_hbm_p17_awcache   ) ,
      .s_axi_p17_HBM_awprot      ( act_axi_card_hbm_p17_awprot    ) ,
      .s_axi_p17_HBM_awvalid     ( act_axi_card_hbm_p17_awvalid   ) ,
      .s_axi_p17_HBM_awready     ( act_axi_card_hbm_p17_awready   ) ,
      .s_axi_p17_HBM_wdata       ( act_axi_card_hbm_p17_wdata     ) ,
      .s_axi_p17_HBM_wstrb       ( act_axi_card_hbm_p17_wstrb     ) ,
      .s_axi_p17_HBM_wlast       ( act_axi_card_hbm_p17_wlast     ) ,
      .s_axi_p17_HBM_wvalid      ( act_axi_card_hbm_p17_wvalid    ) ,
      .s_axi_p17_HBM_wready      ( act_axi_card_hbm_p17_wready    ) ,
      .s_axi_p17_HBM_bresp       ( act_axi_card_hbm_p17_bresp     ) ,
      .s_axi_p17_HBM_bvalid      ( act_axi_card_hbm_p17_bvalid    ) ,
      .s_axi_p17_HBM_bready      ( act_axi_card_hbm_p17_bready    ) ,
      .s_axi_p17_HBM_araddr      ( act_axi_card_hbm_p17_araddr    ) ,
      .s_axi_p17_HBM_arlen       ( act_axi_card_hbm_p17_arlen     ) ,
      .s_axi_p17_HBM_arsize      ( act_axi_card_hbm_p17_arsize    ) ,
      .s_axi_p17_HBM_arburst     ( act_axi_card_hbm_p17_arburst   ) ,
      .s_axi_p17_HBM_arcache     ( act_axi_card_hbm_p17_arcache   ) ,
      .s_axi_p17_HBM_arprot      ( act_axi_card_hbm_p17_arprot    ) ,
      .s_axi_p17_HBM_arvalid     ( act_axi_card_hbm_p17_arvalid   ) ,
      .s_axi_p17_HBM_arready     ( act_axi_card_hbm_p17_arready   ) ,
      .s_axi_p17_HBM_rdata       ( act_axi_card_hbm_p17_rdata     ) ,
      .s_axi_p17_HBM_rresp       ( act_axi_card_hbm_p17_rresp     ) ,
      .s_axi_p17_HBM_rlast       ( act_axi_card_hbm_p17_rlast     ) ,
      .s_axi_p17_HBM_rvalid      ( act_axi_card_hbm_p17_rvalid    ) ,
      .s_axi_p17_HBM_rready      ( act_axi_card_hbm_p17_rready    ) ,
      `endif

      `ifdef HBM_AXI_IF_P18
      .s_axi_p18_HBM_aclk        ( clock_act                   ) ,
      .s_axi_p18_HBM_awaddr      ( act_axi_card_hbm_p18_awaddr    ) ,
      .s_axi_p18_HBM_awlen       ( act_axi_card_hbm_p18_awlen     ) ,
      .s_axi_p18_HBM_awsize      ( act_axi_card_hbm_p18_awsize    ) ,
      .s_axi_p18_HBM_awburst     ( act_axi_card_hbm_p18_awburst   ) ,
      .s_axi_p18_HBM_awlock      ( act_axi_card_hbm_p18_awlock[0] ) ,
      .s_axi_p18_HBM_arlock      ( act_axi_card_hbm_p18_arlock[0] ) ,
  `ifndef ENABLE_BRAM
      .s_axi_p18_HBM_awregion    ( act_axi_card_hbm_p18_awregion  ) ,
      .s_axi_p18_HBM_awqos       ( act_axi_card_hbm_p18_awqos     ) ,
      .s_axi_p18_HBM_arregion    ( act_axi_card_hbm_p18_arregion  ) ,
      .s_axi_p18_HBM_arqos       ( act_axi_card_hbm_p18_arqos     ) ,
      .s_axi_p18_HBM_awid        ( 6'b0                           ) ,
      .s_axi_p18_HBM_arid        ( 6'b0                           ) ,
      .s_axi_p18_HBM_bid         (                                ) ,
      .s_axi_p18_HBM_rid         (                                ) ,
  `endif
      .s_axi_p18_HBM_awcache     ( act_axi_card_hbm_p18_awcache   ) ,
      .s_axi_p18_HBM_awprot      ( act_axi_card_hbm_p18_awprot    ) ,
      .s_axi_p18_HBM_awvalid     ( act_axi_card_hbm_p18_awvalid   ) ,
      .s_axi_p18_HBM_awready     ( act_axi_card_hbm_p18_awready   ) ,
      .s_axi_p18_HBM_wdata       ( act_axi_card_hbm_p18_wdata     ) ,
      .s_axi_p18_HBM_wstrb       ( act_axi_card_hbm_p18_wstrb     ) ,
      .s_axi_p18_HBM_wlast       ( act_axi_card_hbm_p18_wlast     ) ,
      .s_axi_p18_HBM_wvalid      ( act_axi_card_hbm_p18_wvalid    ) ,
      .s_axi_p18_HBM_wready      ( act_axi_card_hbm_p18_wready    ) ,
      .s_axi_p18_HBM_bresp       ( act_axi_card_hbm_p18_bresp     ) ,
      .s_axi_p18_HBM_bvalid      ( act_axi_card_hbm_p18_bvalid    ) ,
      .s_axi_p18_HBM_bready      ( act_axi_card_hbm_p18_bready    ) ,
      .s_axi_p18_HBM_araddr      ( act_axi_card_hbm_p18_araddr    ) ,
      .s_axi_p18_HBM_arlen       ( act_axi_card_hbm_p18_arlen     ) ,
      .s_axi_p18_HBM_arsize      ( act_axi_card_hbm_p18_arsize    ) ,
      .s_axi_p18_HBM_arburst     ( act_axi_card_hbm_p18_arburst   ) ,
      .s_axi_p18_HBM_arcache     ( act_axi_card_hbm_p18_arcache   ) ,
      .s_axi_p18_HBM_arprot      ( act_axi_card_hbm_p18_arprot    ) ,
      .s_axi_p18_HBM_arvalid     ( act_axi_card_hbm_p18_arvalid   ) ,
      .s_axi_p18_HBM_arready     ( act_axi_card_hbm_p18_arready   ) ,
      .s_axi_p18_HBM_rdata       ( act_axi_card_hbm_p18_rdata     ) ,
      .s_axi_p18_HBM_rresp       ( act_axi_card_hbm_p18_rresp     ) ,
      .s_axi_p18_HBM_rlast       ( act_axi_card_hbm_p18_rlast     ) ,
      .s_axi_p18_HBM_rvalid      ( act_axi_card_hbm_p18_rvalid    ) ,
      .s_axi_p18_HBM_rready      ( act_axi_card_hbm_p18_rready    ) ,
      `endif

      `ifdef HBM_AXI_IF_P19
      .s_axi_p19_HBM_aclk        ( clock_act                   ) ,
      .s_axi_p19_HBM_awaddr      ( act_axi_card_hbm_p19_awaddr    ) ,
      .s_axi_p19_HBM_awlen       ( act_axi_card_hbm_p19_awlen     ) ,
      .s_axi_p19_HBM_awsize      ( act_axi_card_hbm_p19_awsize    ) ,
      .s_axi_p19_HBM_awburst     ( act_axi_card_hbm_p19_awburst   ) ,
      .s_axi_p19_HBM_awlock      ( act_axi_card_hbm_p19_awlock[0] ) ,
      .s_axi_p19_HBM_arlock      ( act_axi_card_hbm_p19_arlock[0] ) ,
  `ifndef ENABLE_BRAM
      .s_axi_p19_HBM_awregion    ( act_axi_card_hbm_p19_awregion  ) ,
      .s_axi_p19_HBM_awqos       ( act_axi_card_hbm_p19_awqos     ) ,
      .s_axi_p19_HBM_arregion    ( act_axi_card_hbm_p19_arregion  ) ,
      .s_axi_p19_HBM_arqos       ( act_axi_card_hbm_p19_arqos     ) ,
      .s_axi_p19_HBM_awid        ( 6'b0                           ) ,
      .s_axi_p19_HBM_arid        ( 6'b0                           ) ,
      .s_axi_p19_HBM_bid         (                                ) ,
      .s_axi_p19_HBM_rid         (                                ) ,
  `endif
      .s_axi_p19_HBM_awcache     ( act_axi_card_hbm_p19_awcache   ) ,
      .s_axi_p19_HBM_awprot      ( act_axi_card_hbm_p19_awprot    ) ,
      .s_axi_p19_HBM_awvalid     ( act_axi_card_hbm_p19_awvalid   ) ,
      .s_axi_p19_HBM_awready     ( act_axi_card_hbm_p19_awready   ) ,
      .s_axi_p19_HBM_wdata       ( act_axi_card_hbm_p19_wdata     ) ,
      .s_axi_p19_HBM_wstrb       ( act_axi_card_hbm_p19_wstrb     ) ,
      .s_axi_p19_HBM_wlast       ( act_axi_card_hbm_p19_wlast     ) ,
      .s_axi_p19_HBM_wvalid      ( act_axi_card_hbm_p19_wvalid    ) ,
      .s_axi_p19_HBM_wready      ( act_axi_card_hbm_p19_wready    ) ,
      .s_axi_p19_HBM_bresp       ( act_axi_card_hbm_p19_bresp     ) ,
      .s_axi_p19_HBM_bvalid      ( act_axi_card_hbm_p19_bvalid    ) ,
      .s_axi_p19_HBM_bready      ( act_axi_card_hbm_p19_bready    ) ,
      .s_axi_p19_HBM_araddr      ( act_axi_card_hbm_p19_araddr    ) ,
      .s_axi_p19_HBM_arlen       ( act_axi_card_hbm_p19_arlen     ) ,
      .s_axi_p19_HBM_arsize      ( act_axi_card_hbm_p19_arsize    ) ,
      .s_axi_p19_HBM_arburst     ( act_axi_card_hbm_p19_arburst   ) ,
      .s_axi_p19_HBM_arcache     ( act_axi_card_hbm_p19_arcache   ) ,
      .s_axi_p19_HBM_arprot      ( act_axi_card_hbm_p19_arprot    ) ,
      .s_axi_p19_HBM_arvalid     ( act_axi_card_hbm_p19_arvalid   ) ,
      .s_axi_p19_HBM_arready     ( act_axi_card_hbm_p19_arready   ) ,
      .s_axi_p19_HBM_rdata       ( act_axi_card_hbm_p19_rdata     ) ,
      .s_axi_p19_HBM_rresp       ( act_axi_card_hbm_p19_rresp     ) ,
      .s_axi_p19_HBM_rlast       ( act_axi_card_hbm_p19_rlast     ) ,
      .s_axi_p19_HBM_rvalid      ( act_axi_card_hbm_p19_rvalid    ) ,
      .s_axi_p19_HBM_rready      ( act_axi_card_hbm_p19_rready    ) ,
      `endif

      `ifdef HBM_AXI_IF_P20
      .s_axi_p20_HBM_aclk        ( clock_act                   ) ,
      .s_axi_p20_HBM_awaddr      ( act_axi_card_hbm_p20_awaddr    ) ,
      .s_axi_p20_HBM_awlen       ( act_axi_card_hbm_p20_awlen     ) ,
      .s_axi_p20_HBM_awsize      ( act_axi_card_hbm_p20_awsize    ) ,
      .s_axi_p20_HBM_awburst     ( act_axi_card_hbm_p20_awburst   ) ,
      .s_axi_p20_HBM_awlock      ( act_axi_card_hbm_p20_awlock[0] ) ,
      .s_axi_p20_HBM_arlock      ( act_axi_card_hbm_p20_arlock[0] ) ,
  `ifndef ENABLE_BRAM
      .s_axi_p20_HBM_awregion    ( act_axi_card_hbm_p20_awregion  ) ,
      .s_axi_p20_HBM_awqos       ( act_axi_card_hbm_p20_awqos     ) ,
      .s_axi_p20_HBM_arregion    ( act_axi_card_hbm_p20_arregion  ) ,
      .s_axi_p20_HBM_arqos       ( act_axi_card_hbm_p20_arqos     ) ,
      .s_axi_p20_HBM_awid        ( 6'b0                           ) ,
      .s_axi_p20_HBM_arid        ( 6'b0                           ) ,
      .s_axi_p20_HBM_bid         (                                ) ,
      .s_axi_p20_HBM_rid         (                                ) ,
  `endif
      .s_axi_p20_HBM_awcache     ( act_axi_card_hbm_p20_awcache   ) ,
      .s_axi_p20_HBM_awprot      ( act_axi_card_hbm_p20_awprot    ) ,
      .s_axi_p20_HBM_awvalid     ( act_axi_card_hbm_p20_awvalid   ) ,
      .s_axi_p20_HBM_awready     ( act_axi_card_hbm_p20_awready   ) ,
      .s_axi_p20_HBM_wdata       ( act_axi_card_hbm_p20_wdata     ) ,
      .s_axi_p20_HBM_wstrb       ( act_axi_card_hbm_p20_wstrb     ) ,
      .s_axi_p20_HBM_wlast       ( act_axi_card_hbm_p20_wlast     ) ,
      .s_axi_p20_HBM_wvalid      ( act_axi_card_hbm_p20_wvalid    ) ,
      .s_axi_p20_HBM_wready      ( act_axi_card_hbm_p20_wready    ) ,
      .s_axi_p20_HBM_bresp       ( act_axi_card_hbm_p20_bresp     ) ,
      .s_axi_p20_HBM_bvalid      ( act_axi_card_hbm_p20_bvalid    ) ,
      .s_axi_p20_HBM_bready      ( act_axi_card_hbm_p20_bready    ) ,
      .s_axi_p20_HBM_araddr      ( act_axi_card_hbm_p20_araddr    ) ,
      .s_axi_p20_HBM_arlen       ( act_axi_card_hbm_p20_arlen     ) ,
      .s_axi_p20_HBM_arsize      ( act_axi_card_hbm_p20_arsize    ) ,
      .s_axi_p20_HBM_arburst     ( act_axi_card_hbm_p20_arburst   ) ,
      .s_axi_p20_HBM_arcache     ( act_axi_card_hbm_p20_arcache   ) ,
      .s_axi_p20_HBM_arprot      ( act_axi_card_hbm_p20_arprot    ) ,
      .s_axi_p20_HBM_arvalid     ( act_axi_card_hbm_p20_arvalid   ) ,
      .s_axi_p20_HBM_arready     ( act_axi_card_hbm_p20_arready   ) ,
      .s_axi_p20_HBM_rdata       ( act_axi_card_hbm_p20_rdata     ) ,
      .s_axi_p20_HBM_rresp       ( act_axi_card_hbm_p20_rresp     ) ,
      .s_axi_p20_HBM_rlast       ( act_axi_card_hbm_p20_rlast     ) ,
      .s_axi_p20_HBM_rvalid      ( act_axi_card_hbm_p20_rvalid    ) ,
      .s_axi_p20_HBM_rready      ( act_axi_card_hbm_p20_rready    ) ,
      `endif

      `ifdef HBM_AXI_IF_P21
      .s_axi_p21_HBM_aclk        ( clock_act                   ) ,
      .s_axi_p21_HBM_awaddr      ( act_axi_card_hbm_p21_awaddr    ) ,
      .s_axi_p21_HBM_awlen       ( act_axi_card_hbm_p21_awlen     ) ,
      .s_axi_p21_HBM_awsize      ( act_axi_card_hbm_p21_awsize    ) ,
      .s_axi_p21_HBM_awburst     ( act_axi_card_hbm_p21_awburst   ) ,
      .s_axi_p21_HBM_awlock      ( act_axi_card_hbm_p21_awlock[0] ) ,
      .s_axi_p21_HBM_arlock      ( act_axi_card_hbm_p21_arlock[0] ) ,
  `ifndef ENABLE_BRAM
      .s_axi_p21_HBM_awregion    ( act_axi_card_hbm_p21_awregion  ) ,
      .s_axi_p21_HBM_awqos       ( act_axi_card_hbm_p21_awqos     ) ,
      .s_axi_p21_HBM_arregion    ( act_axi_card_hbm_p21_arregion  ) ,
      .s_axi_p21_HBM_arqos       ( act_axi_card_hbm_p21_arqos     ) ,
      .s_axi_p21_HBM_awid        ( 6'b0                           ) ,
      .s_axi_p21_HBM_arid        ( 6'b0                           ) ,
      .s_axi_p21_HBM_bid         (                                ) ,
      .s_axi_p21_HBM_rid         (                                ) ,
  `endif
      .s_axi_p21_HBM_awcache     ( act_axi_card_hbm_p21_awcache   ) ,
      .s_axi_p21_HBM_awprot      ( act_axi_card_hbm_p21_awprot    ) ,
      .s_axi_p21_HBM_awvalid     ( act_axi_card_hbm_p21_awvalid   ) ,
      .s_axi_p21_HBM_awready     ( act_axi_card_hbm_p21_awready   ) ,
      .s_axi_p21_HBM_wdata       ( act_axi_card_hbm_p21_wdata     ) ,
      .s_axi_p21_HBM_wstrb       ( act_axi_card_hbm_p21_wstrb     ) ,
      .s_axi_p21_HBM_wlast       ( act_axi_card_hbm_p21_wlast     ) ,
      .s_axi_p21_HBM_wvalid      ( act_axi_card_hbm_p21_wvalid    ) ,
      .s_axi_p21_HBM_wready      ( act_axi_card_hbm_p21_wready    ) ,
      .s_axi_p21_HBM_bresp       ( act_axi_card_hbm_p21_bresp     ) ,
      .s_axi_p21_HBM_bvalid      ( act_axi_card_hbm_p21_bvalid    ) ,
      .s_axi_p21_HBM_bready      ( act_axi_card_hbm_p21_bready    ) ,
      .s_axi_p21_HBM_araddr      ( act_axi_card_hbm_p21_araddr    ) ,
      .s_axi_p21_HBM_arlen       ( act_axi_card_hbm_p21_arlen     ) ,
      .s_axi_p21_HBM_arsize      ( act_axi_card_hbm_p21_arsize    ) ,
      .s_axi_p21_HBM_arburst     ( act_axi_card_hbm_p21_arburst   ) ,
      .s_axi_p21_HBM_arcache     ( act_axi_card_hbm_p21_arcache   ) ,
      .s_axi_p21_HBM_arprot      ( act_axi_card_hbm_p21_arprot    ) ,
      .s_axi_p21_HBM_arvalid     ( act_axi_card_hbm_p21_arvalid   ) ,
      .s_axi_p21_HBM_arready     ( act_axi_card_hbm_p21_arready   ) ,
      .s_axi_p21_HBM_rdata       ( act_axi_card_hbm_p21_rdata     ) ,
      .s_axi_p21_HBM_rresp       ( act_axi_card_hbm_p21_rresp     ) ,
      .s_axi_p21_HBM_rlast       ( act_axi_card_hbm_p21_rlast     ) ,
      .s_axi_p21_HBM_rvalid      ( act_axi_card_hbm_p21_rvalid    ) ,
      .s_axi_p21_HBM_rready      ( act_axi_card_hbm_p21_rready    ) ,
      `endif

      `ifdef HBM_AXI_IF_P22
      .s_axi_p22_HBM_aclk        ( clock_act                   ) ,
      .s_axi_p22_HBM_awaddr      ( act_axi_card_hbm_p22_awaddr    ) ,
      .s_axi_p22_HBM_awlen       ( act_axi_card_hbm_p22_awlen     ) ,
      .s_axi_p22_HBM_awsize      ( act_axi_card_hbm_p22_awsize    ) ,
      .s_axi_p22_HBM_awburst     ( act_axi_card_hbm_p22_awburst   ) ,
      .s_axi_p22_HBM_awlock      ( act_axi_card_hbm_p22_awlock[0] ) ,
      .s_axi_p22_HBM_arlock      ( act_axi_card_hbm_p22_arlock[0] ) ,
  `ifndef ENABLE_BRAM
      .s_axi_p22_HBM_awregion    ( act_axi_card_hbm_p22_awregion  ) ,
      .s_axi_p22_HBM_awqos       ( act_axi_card_hbm_p22_awqos     ) ,
      .s_axi_p22_HBM_arregion    ( act_axi_card_hbm_p22_arregion  ) ,
      .s_axi_p22_HBM_arqos       ( act_axi_card_hbm_p22_arqos     ) ,
      .s_axi_p22_HBM_awid        ( 6'b0                           ) ,
      .s_axi_p22_HBM_arid        ( 6'b0                           ) ,
      .s_axi_p22_HBM_bid         (                                ) ,
      .s_axi_p22_HBM_rid         (                                ) ,
  `endif
      .s_axi_p22_HBM_awcache     ( act_axi_card_hbm_p22_awcache   ) ,
      .s_axi_p22_HBM_awprot      ( act_axi_card_hbm_p22_awprot    ) ,
      .s_axi_p22_HBM_awvalid     ( act_axi_card_hbm_p22_awvalid   ) ,
      .s_axi_p22_HBM_awready     ( act_axi_card_hbm_p22_awready   ) ,
      .s_axi_p22_HBM_wdata       ( act_axi_card_hbm_p22_wdata     ) ,
      .s_axi_p22_HBM_wstrb       ( act_axi_card_hbm_p22_wstrb     ) ,
      .s_axi_p22_HBM_wlast       ( act_axi_card_hbm_p22_wlast     ) ,
      .s_axi_p22_HBM_wvalid      ( act_axi_card_hbm_p22_wvalid    ) ,
      .s_axi_p22_HBM_wready      ( act_axi_card_hbm_p22_wready    ) ,
      .s_axi_p22_HBM_bresp       ( act_axi_card_hbm_p22_bresp     ) ,
      .s_axi_p22_HBM_bvalid      ( act_axi_card_hbm_p22_bvalid    ) ,
      .s_axi_p22_HBM_bready      ( act_axi_card_hbm_p22_bready    ) ,
      .s_axi_p22_HBM_araddr      ( act_axi_card_hbm_p22_araddr    ) ,
      .s_axi_p22_HBM_arlen       ( act_axi_card_hbm_p22_arlen     ) ,
      .s_axi_p22_HBM_arsize      ( act_axi_card_hbm_p22_arsize    ) ,
      .s_axi_p22_HBM_arburst     ( act_axi_card_hbm_p22_arburst   ) ,
      .s_axi_p22_HBM_arcache     ( act_axi_card_hbm_p22_arcache   ) ,
      .s_axi_p22_HBM_arprot      ( act_axi_card_hbm_p22_arprot    ) ,
      .s_axi_p22_HBM_arvalid     ( act_axi_card_hbm_p22_arvalid   ) ,
      .s_axi_p22_HBM_arready     ( act_axi_card_hbm_p22_arready   ) ,
      .s_axi_p22_HBM_rdata       ( act_axi_card_hbm_p22_rdata     ) ,
      .s_axi_p22_HBM_rresp       ( act_axi_card_hbm_p22_rresp     ) ,
      .s_axi_p22_HBM_rlast       ( act_axi_card_hbm_p22_rlast     ) ,
      .s_axi_p22_HBM_rvalid      ( act_axi_card_hbm_p22_rvalid    ) ,
      .s_axi_p22_HBM_rready      ( act_axi_card_hbm_p22_rready    ) ,
      `endif

      `ifdef HBM_AXI_IF_P23
      .s_axi_p23_HBM_aclk        ( clock_act                   ) ,
      .s_axi_p23_HBM_awaddr      ( act_axi_card_hbm_p23_awaddr    ) ,
      .s_axi_p23_HBM_awlen       ( act_axi_card_hbm_p23_awlen     ) ,
      .s_axi_p23_HBM_awsize      ( act_axi_card_hbm_p23_awsize    ) ,
      .s_axi_p23_HBM_awburst     ( act_axi_card_hbm_p23_awburst   ) ,
      .s_axi_p23_HBM_awlock      ( act_axi_card_hbm_p23_awlock[0] ) ,
      .s_axi_p23_HBM_arlock      ( act_axi_card_hbm_p23_arlock[0] ) ,
  `ifndef ENABLE_BRAM
      .s_axi_p23_HBM_awregion    ( act_axi_card_hbm_p23_awregion  ) ,
      .s_axi_p23_HBM_awqos       ( act_axi_card_hbm_p23_awqos     ) ,
      .s_axi_p23_HBM_arregion    ( act_axi_card_hbm_p23_arregion  ) ,
      .s_axi_p23_HBM_arqos       ( act_axi_card_hbm_p23_arqos     ) ,
      .s_axi_p23_HBM_awid        ( 6'b0                           ) ,
      .s_axi_p23_HBM_arid        ( 6'b0                           ) ,
      .s_axi_p23_HBM_bid         (                                ) ,
      .s_axi_p23_HBM_rid         (                                ) ,
  `endif
      .s_axi_p23_HBM_awcache     ( act_axi_card_hbm_p23_awcache   ) ,
      .s_axi_p23_HBM_awprot      ( act_axi_card_hbm_p23_awprot    ) ,
      .s_axi_p23_HBM_awvalid     ( act_axi_card_hbm_p23_awvalid   ) ,
      .s_axi_p23_HBM_awready     ( act_axi_card_hbm_p23_awready   ) ,
      .s_axi_p23_HBM_wdata       ( act_axi_card_hbm_p23_wdata     ) ,
      .s_axi_p23_HBM_wstrb       ( act_axi_card_hbm_p23_wstrb     ) ,
      .s_axi_p23_HBM_wlast       ( act_axi_card_hbm_p23_wlast     ) ,
      .s_axi_p23_HBM_wvalid      ( act_axi_card_hbm_p23_wvalid    ) ,
      .s_axi_p23_HBM_wready      ( act_axi_card_hbm_p23_wready    ) ,
      .s_axi_p23_HBM_bresp       ( act_axi_card_hbm_p23_bresp     ) ,
      .s_axi_p23_HBM_bvalid      ( act_axi_card_hbm_p23_bvalid    ) ,
      .s_axi_p23_HBM_bready      ( act_axi_card_hbm_p23_bready    ) ,
      .s_axi_p23_HBM_araddr      ( act_axi_card_hbm_p23_araddr    ) ,
      .s_axi_p23_HBM_arlen       ( act_axi_card_hbm_p23_arlen     ) ,
      .s_axi_p23_HBM_arsize      ( act_axi_card_hbm_p23_arsize    ) ,
      .s_axi_p23_HBM_arburst     ( act_axi_card_hbm_p23_arburst   ) ,
      .s_axi_p23_HBM_arcache     ( act_axi_card_hbm_p23_arcache   ) ,
      .s_axi_p23_HBM_arprot      ( act_axi_card_hbm_p23_arprot    ) ,
      .s_axi_p23_HBM_arvalid     ( act_axi_card_hbm_p23_arvalid   ) ,
      .s_axi_p23_HBM_arready     ( act_axi_card_hbm_p23_arready   ) ,
      .s_axi_p23_HBM_rdata       ( act_axi_card_hbm_p23_rdata     ) ,
      .s_axi_p23_HBM_rresp       ( act_axi_card_hbm_p23_rresp     ) ,
      .s_axi_p23_HBM_rlast       ( act_axi_card_hbm_p23_rlast     ) ,
      .s_axi_p23_HBM_rvalid      ( act_axi_card_hbm_p23_rvalid    ) ,
      .s_axi_p23_HBM_rready      ( act_axi_card_hbm_p23_rready    ) ,
      `endif

      `ifdef HBM_AXI_IF_P24
      .s_axi_p24_HBM_aclk        ( clock_act                   ) ,
      .s_axi_p24_HBM_awaddr      ( act_axi_card_hbm_p24_awaddr    ) ,
      .s_axi_p24_HBM_awlen       ( act_axi_card_hbm_p24_awlen     ) ,
      .s_axi_p24_HBM_awsize      ( act_axi_card_hbm_p24_awsize    ) ,
      .s_axi_p24_HBM_awburst     ( act_axi_card_hbm_p24_awburst   ) ,
      .s_axi_p24_HBM_awlock      ( act_axi_card_hbm_p24_awlock[0] ) ,
      .s_axi_p24_HBM_arlock      ( act_axi_card_hbm_p24_arlock[0] ) ,
  `ifndef ENABLE_BRAM
      .s_axi_p24_HBM_awregion    ( act_axi_card_hbm_p24_awregion  ) ,
      .s_axi_p24_HBM_awqos       ( act_axi_card_hbm_p24_awqos     ) ,
      .s_axi_p24_HBM_arregion    ( act_axi_card_hbm_p24_arregion  ) ,
      .s_axi_p24_HBM_arqos       ( act_axi_card_hbm_p24_arqos     ) ,
      .s_axi_p24_HBM_awid        ( 6'b0                           ) ,
      .s_axi_p24_HBM_arid        ( 6'b0                           ) ,
      .s_axi_p24_HBM_bid         (                                ) ,
      .s_axi_p24_HBM_rid         (                                ) ,
  `endif
      .s_axi_p24_HBM_awcache     ( act_axi_card_hbm_p24_awcache   ) ,
      .s_axi_p24_HBM_awprot      ( act_axi_card_hbm_p24_awprot    ) ,
      .s_axi_p24_HBM_awvalid     ( act_axi_card_hbm_p24_awvalid   ) ,
      .s_axi_p24_HBM_awready     ( act_axi_card_hbm_p24_awready   ) ,
      .s_axi_p24_HBM_wdata       ( act_axi_card_hbm_p24_wdata     ) ,
      .s_axi_p24_HBM_wstrb       ( act_axi_card_hbm_p24_wstrb     ) ,
      .s_axi_p24_HBM_wlast       ( act_axi_card_hbm_p24_wlast     ) ,
      .s_axi_p24_HBM_wvalid      ( act_axi_card_hbm_p24_wvalid    ) ,
      .s_axi_p24_HBM_wready      ( act_axi_card_hbm_p24_wready    ) ,
      .s_axi_p24_HBM_bresp       ( act_axi_card_hbm_p24_bresp     ) ,
      .s_axi_p24_HBM_bvalid      ( act_axi_card_hbm_p24_bvalid    ) ,
      .s_axi_p24_HBM_bready      ( act_axi_card_hbm_p24_bready    ) ,
      .s_axi_p24_HBM_araddr      ( act_axi_card_hbm_p24_araddr    ) ,
      .s_axi_p24_HBM_arlen       ( act_axi_card_hbm_p24_arlen     ) ,
      .s_axi_p24_HBM_arsize      ( act_axi_card_hbm_p24_arsize    ) ,
      .s_axi_p24_HBM_arburst     ( act_axi_card_hbm_p24_arburst   ) ,
      .s_axi_p24_HBM_arcache     ( act_axi_card_hbm_p24_arcache   ) ,
      .s_axi_p24_HBM_arprot      ( act_axi_card_hbm_p24_arprot    ) ,
      .s_axi_p24_HBM_arvalid     ( act_axi_card_hbm_p24_arvalid   ) ,
      .s_axi_p24_HBM_arready     ( act_axi_card_hbm_p24_arready   ) ,
      .s_axi_p24_HBM_rdata       ( act_axi_card_hbm_p24_rdata     ) ,
      .s_axi_p24_HBM_rresp       ( act_axi_card_hbm_p24_rresp     ) ,
      .s_axi_p24_HBM_rlast       ( act_axi_card_hbm_p24_rlast     ) ,
      .s_axi_p24_HBM_rvalid      ( act_axi_card_hbm_p24_rvalid    ) ,
      .s_axi_p24_HBM_rready      ( act_axi_card_hbm_p24_rready    ) ,
      `endif

      `ifdef HBM_AXI_IF_P25
      .s_axi_p25_HBM_aclk        ( clock_act                   ) ,
      .s_axi_p25_HBM_awaddr      ( act_axi_card_hbm_p25_awaddr    ) ,
      .s_axi_p25_HBM_awlen       ( act_axi_card_hbm_p25_awlen     ) ,
      .s_axi_p25_HBM_awsize      ( act_axi_card_hbm_p25_awsize    ) ,
      .s_axi_p25_HBM_awburst     ( act_axi_card_hbm_p25_awburst   ) ,
      .s_axi_p25_HBM_awlock      ( act_axi_card_hbm_p25_awlock[0] ) ,
      .s_axi_p25_HBM_arlock      ( act_axi_card_hbm_p25_arlock[0] ) ,
  `ifndef ENABLE_BRAM
      .s_axi_p25_HBM_awregion    ( act_axi_card_hbm_p25_awregion  ) ,
      .s_axi_p25_HBM_awqos       ( act_axi_card_hbm_p25_awqos     ) ,
      .s_axi_p25_HBM_arregion    ( act_axi_card_hbm_p25_arregion  ) ,
      .s_axi_p25_HBM_arqos       ( act_axi_card_hbm_p25_arqos     ) ,
      .s_axi_p25_HBM_awid        ( 6'b0                           ) ,
      .s_axi_p25_HBM_arid        ( 6'b0                           ) ,
      .s_axi_p25_HBM_bid         (                                ) ,
      .s_axi_p25_HBM_rid         (                                ) ,
  `endif
      .s_axi_p25_HBM_awcache     ( act_axi_card_hbm_p25_awcache   ) ,
      .s_axi_p25_HBM_awprot      ( act_axi_card_hbm_p25_awprot    ) ,
      .s_axi_p25_HBM_awvalid     ( act_axi_card_hbm_p25_awvalid   ) ,
      .s_axi_p25_HBM_awready     ( act_axi_card_hbm_p25_awready   ) ,
      .s_axi_p25_HBM_wdata       ( act_axi_card_hbm_p25_wdata     ) ,
      .s_axi_p25_HBM_wstrb       ( act_axi_card_hbm_p25_wstrb     ) ,
      .s_axi_p25_HBM_wlast       ( act_axi_card_hbm_p25_wlast     ) ,
      .s_axi_p25_HBM_wvalid      ( act_axi_card_hbm_p25_wvalid    ) ,
      .s_axi_p25_HBM_wready      ( act_axi_card_hbm_p25_wready    ) ,
      .s_axi_p25_HBM_bresp       ( act_axi_card_hbm_p25_bresp     ) ,
      .s_axi_p25_HBM_bvalid      ( act_axi_card_hbm_p25_bvalid    ) ,
      .s_axi_p25_HBM_bready      ( act_axi_card_hbm_p25_bready    ) ,
      .s_axi_p25_HBM_araddr      ( act_axi_card_hbm_p25_araddr    ) ,
      .s_axi_p25_HBM_arlen       ( act_axi_card_hbm_p25_arlen     ) ,
      .s_axi_p25_HBM_arsize      ( act_axi_card_hbm_p25_arsize    ) ,
      .s_axi_p25_HBM_arburst     ( act_axi_card_hbm_p25_arburst   ) ,
      .s_axi_p25_HBM_arcache     ( act_axi_card_hbm_p25_arcache   ) ,
      .s_axi_p25_HBM_arprot      ( act_axi_card_hbm_p25_arprot    ) ,
      .s_axi_p25_HBM_arvalid     ( act_axi_card_hbm_p25_arvalid   ) ,
      .s_axi_p25_HBM_arready     ( act_axi_card_hbm_p25_arready   ) ,
      .s_axi_p25_HBM_rdata       ( act_axi_card_hbm_p25_rdata     ) ,
      .s_axi_p25_HBM_rresp       ( act_axi_card_hbm_p25_rresp     ) ,
      .s_axi_p25_HBM_rlast       ( act_axi_card_hbm_p25_rlast     ) ,
      .s_axi_p25_HBM_rvalid      ( act_axi_card_hbm_p25_rvalid    ) ,
      .s_axi_p25_HBM_rready      ( act_axi_card_hbm_p25_rready    ) ,
      `endif

      `ifdef HBM_AXI_IF_P26
      .s_axi_p26_HBM_aclk        ( clock_act                   ) ,
      .s_axi_p26_HBM_awaddr      ( act_axi_card_hbm_p26_awaddr    ) ,
      .s_axi_p26_HBM_awlen       ( act_axi_card_hbm_p26_awlen     ) ,
      .s_axi_p26_HBM_awsize      ( act_axi_card_hbm_p26_awsize    ) ,
      .s_axi_p26_HBM_awburst     ( act_axi_card_hbm_p26_awburst   ) ,
      .s_axi_p26_HBM_awlock      ( act_axi_card_hbm_p26_awlock[0] ) ,
      .s_axi_p26_HBM_arlock      ( act_axi_card_hbm_p26_arlock[0] ) ,
  `ifndef ENABLE_BRAM
      .s_axi_p26_HBM_awregion    ( act_axi_card_hbm_p26_awregion  ) ,
      .s_axi_p26_HBM_awqos       ( act_axi_card_hbm_p26_awqos     ) ,
      .s_axi_p26_HBM_arregion    ( act_axi_card_hbm_p26_arregion  ) ,
      .s_axi_p26_HBM_arqos       ( act_axi_card_hbm_p26_arqos     ) ,
      .s_axi_p26_HBM_awid        ( 6'b0                           ) ,
      .s_axi_p26_HBM_arid        ( 6'b0                           ) ,
      .s_axi_p26_HBM_bid         (                                ) ,
      .s_axi_p26_HBM_rid         (                                ) ,
  `endif
      .s_axi_p26_HBM_awcache     ( act_axi_card_hbm_p26_awcache   ) ,
      .s_axi_p26_HBM_awprot      ( act_axi_card_hbm_p26_awprot    ) ,
      .s_axi_p26_HBM_awvalid     ( act_axi_card_hbm_p26_awvalid   ) ,
      .s_axi_p26_HBM_awready     ( act_axi_card_hbm_p26_awready   ) ,
      .s_axi_p26_HBM_wdata       ( act_axi_card_hbm_p26_wdata     ) ,
      .s_axi_p26_HBM_wstrb       ( act_axi_card_hbm_p26_wstrb     ) ,
      .s_axi_p26_HBM_wlast       ( act_axi_card_hbm_p26_wlast     ) ,
      .s_axi_p26_HBM_wvalid      ( act_axi_card_hbm_p26_wvalid    ) ,
      .s_axi_p26_HBM_wready      ( act_axi_card_hbm_p26_wready    ) ,
      .s_axi_p26_HBM_bresp       ( act_axi_card_hbm_p26_bresp     ) ,
      .s_axi_p26_HBM_bvalid      ( act_axi_card_hbm_p26_bvalid    ) ,
      .s_axi_p26_HBM_bready      ( act_axi_card_hbm_p26_bready    ) ,
      .s_axi_p26_HBM_araddr      ( act_axi_card_hbm_p26_araddr    ) ,
      .s_axi_p26_HBM_arlen       ( act_axi_card_hbm_p26_arlen     ) ,
      .s_axi_p26_HBM_arsize      ( act_axi_card_hbm_p26_arsize    ) ,
      .s_axi_p26_HBM_arburst     ( act_axi_card_hbm_p26_arburst   ) ,
      .s_axi_p26_HBM_arcache     ( act_axi_card_hbm_p26_arcache   ) ,
      .s_axi_p26_HBM_arprot      ( act_axi_card_hbm_p26_arprot    ) ,
      .s_axi_p26_HBM_arvalid     ( act_axi_card_hbm_p26_arvalid   ) ,
      .s_axi_p26_HBM_arready     ( act_axi_card_hbm_p26_arready   ) ,
      .s_axi_p26_HBM_rdata       ( act_axi_card_hbm_p26_rdata     ) ,
      .s_axi_p26_HBM_rresp       ( act_axi_card_hbm_p26_rresp     ) ,
      .s_axi_p26_HBM_rlast       ( act_axi_card_hbm_p26_rlast     ) ,
      .s_axi_p26_HBM_rvalid      ( act_axi_card_hbm_p26_rvalid    ) ,
      .s_axi_p26_HBM_rready      ( act_axi_card_hbm_p26_rready    ) ,
      `endif

      `ifdef HBM_AXI_IF_P27
      .s_axi_p27_HBM_aclk        ( clock_act                   ) ,
      .s_axi_p27_HBM_awaddr      ( act_axi_card_hbm_p27_awaddr    ) ,
      .s_axi_p27_HBM_awlen       ( act_axi_card_hbm_p27_awlen     ) ,
      .s_axi_p27_HBM_awsize      ( act_axi_card_hbm_p27_awsize    ) ,
      .s_axi_p27_HBM_awburst     ( act_axi_card_hbm_p27_awburst   ) ,
      .s_axi_p27_HBM_awlock      ( act_axi_card_hbm_p27_awlock[0] ) ,
      .s_axi_p27_HBM_arlock      ( act_axi_card_hbm_p27_arlock[0] ) ,
  `ifndef ENABLE_BRAM
      .s_axi_p27_HBM_awregion    ( act_axi_card_hbm_p27_awregion  ) ,
      .s_axi_p27_HBM_awqos       ( act_axi_card_hbm_p27_awqos     ) ,
      .s_axi_p27_HBM_arregion    ( act_axi_card_hbm_p27_arregion  ) ,
      .s_axi_p27_HBM_arqos       ( act_axi_card_hbm_p27_arqos     ) ,
      .s_axi_p27_HBM_awid        ( 6'b0                           ) ,
      .s_axi_p27_HBM_arid        ( 6'b0                           ) ,
      .s_axi_p27_HBM_bid         (                                ) ,
      .s_axi_p27_HBM_rid         (                                ) ,
  `endif
      .s_axi_p27_HBM_awcache     ( act_axi_card_hbm_p27_awcache   ) ,
      .s_axi_p27_HBM_awprot      ( act_axi_card_hbm_p27_awprot    ) ,
      .s_axi_p27_HBM_awvalid     ( act_axi_card_hbm_p27_awvalid   ) ,
      .s_axi_p27_HBM_awready     ( act_axi_card_hbm_p27_awready   ) ,
      .s_axi_p27_HBM_wdata       ( act_axi_card_hbm_p27_wdata     ) ,
      .s_axi_p27_HBM_wstrb       ( act_axi_card_hbm_p27_wstrb     ) ,
      .s_axi_p27_HBM_wlast       ( act_axi_card_hbm_p27_wlast     ) ,
      .s_axi_p27_HBM_wvalid      ( act_axi_card_hbm_p27_wvalid    ) ,
      .s_axi_p27_HBM_wready      ( act_axi_card_hbm_p27_wready    ) ,
      .s_axi_p27_HBM_bresp       ( act_axi_card_hbm_p27_bresp     ) ,
      .s_axi_p27_HBM_bvalid      ( act_axi_card_hbm_p27_bvalid    ) ,
      .s_axi_p27_HBM_bready      ( act_axi_card_hbm_p27_bready    ) ,
      .s_axi_p27_HBM_araddr      ( act_axi_card_hbm_p27_araddr    ) ,
      .s_axi_p27_HBM_arlen       ( act_axi_card_hbm_p27_arlen     ) ,
      .s_axi_p27_HBM_arsize      ( act_axi_card_hbm_p27_arsize    ) ,
      .s_axi_p27_HBM_arburst     ( act_axi_card_hbm_p27_arburst   ) ,
      .s_axi_p27_HBM_arcache     ( act_axi_card_hbm_p27_arcache   ) ,
      .s_axi_p27_HBM_arprot      ( act_axi_card_hbm_p27_arprot    ) ,
      .s_axi_p27_HBM_arvalid     ( act_axi_card_hbm_p27_arvalid   ) ,
      .s_axi_p27_HBM_arready     ( act_axi_card_hbm_p27_arready   ) ,
      .s_axi_p27_HBM_rdata       ( act_axi_card_hbm_p27_rdata     ) ,
      .s_axi_p27_HBM_rresp       ( act_axi_card_hbm_p27_rresp     ) ,
      .s_axi_p27_HBM_rlast       ( act_axi_card_hbm_p27_rlast     ) ,
      .s_axi_p27_HBM_rvalid      ( act_axi_card_hbm_p27_rvalid    ) ,
      .s_axi_p27_HBM_rready      ( act_axi_card_hbm_p27_rready    ) ,
      `endif

      `ifdef HBM_AXI_IF_P28
      .s_axi_p28_HBM_aclk        ( clock_act                   ) ,
      .s_axi_p28_HBM_awaddr      ( act_axi_card_hbm_p28_awaddr    ) ,
      .s_axi_p28_HBM_awlen       ( act_axi_card_hbm_p28_awlen     ) ,
      .s_axi_p28_HBM_awsize      ( act_axi_card_hbm_p28_awsize    ) ,
      .s_axi_p28_HBM_awburst     ( act_axi_card_hbm_p28_awburst   ) ,
      .s_axi_p28_HBM_awlock      ( act_axi_card_hbm_p28_awlock[0] ) ,
      .s_axi_p28_HBM_arlock      ( act_axi_card_hbm_p28_arlock[0] ) ,
  `ifndef ENABLE_BRAM
      .s_axi_p28_HBM_awregion    ( act_axi_card_hbm_p28_awregion  ) ,
      .s_axi_p28_HBM_awqos       ( act_axi_card_hbm_p28_awqos     ) ,
      .s_axi_p28_HBM_arregion    ( act_axi_card_hbm_p28_arregion  ) ,
      .s_axi_p28_HBM_arqos       ( act_axi_card_hbm_p28_arqos     ) ,
      .s_axi_p28_HBM_awid        ( 6'b0                           ) ,
      .s_axi_p28_HBM_arid        ( 6'b0                           ) ,
      .s_axi_p28_HBM_bid         (                                ) ,
      .s_axi_p28_HBM_rid         (                                ) ,
  `endif
      .s_axi_p28_HBM_awcache     ( act_axi_card_hbm_p28_awcache   ) ,
      .s_axi_p28_HBM_awprot      ( act_axi_card_hbm_p28_awprot    ) ,
      .s_axi_p28_HBM_awvalid     ( act_axi_card_hbm_p28_awvalid   ) ,
      .s_axi_p28_HBM_awready     ( act_axi_card_hbm_p28_awready   ) ,
      .s_axi_p28_HBM_wdata       ( act_axi_card_hbm_p28_wdata     ) ,
      .s_axi_p28_HBM_wstrb       ( act_axi_card_hbm_p28_wstrb     ) ,
      .s_axi_p28_HBM_wlast       ( act_axi_card_hbm_p28_wlast     ) ,
      .s_axi_p28_HBM_wvalid      ( act_axi_card_hbm_p28_wvalid    ) ,
      .s_axi_p28_HBM_wready      ( act_axi_card_hbm_p28_wready    ) ,
      .s_axi_p28_HBM_bresp       ( act_axi_card_hbm_p28_bresp     ) ,
      .s_axi_p28_HBM_bvalid      ( act_axi_card_hbm_p28_bvalid    ) ,
      .s_axi_p28_HBM_bready      ( act_axi_card_hbm_p28_bready    ) ,
      .s_axi_p28_HBM_araddr      ( act_axi_card_hbm_p28_araddr    ) ,
      .s_axi_p28_HBM_arlen       ( act_axi_card_hbm_p28_arlen     ) ,
      .s_axi_p28_HBM_arsize      ( act_axi_card_hbm_p28_arsize    ) ,
      .s_axi_p28_HBM_arburst     ( act_axi_card_hbm_p28_arburst   ) ,
      .s_axi_p28_HBM_arcache     ( act_axi_card_hbm_p28_arcache   ) ,
      .s_axi_p28_HBM_arprot      ( act_axi_card_hbm_p28_arprot    ) ,
      .s_axi_p28_HBM_arvalid     ( act_axi_card_hbm_p28_arvalid   ) ,
      .s_axi_p28_HBM_arready     ( act_axi_card_hbm_p28_arready   ) ,
      .s_axi_p28_HBM_rdata       ( act_axi_card_hbm_p28_rdata     ) ,
      .s_axi_p28_HBM_rresp       ( act_axi_card_hbm_p28_rresp     ) ,
      .s_axi_p28_HBM_rlast       ( act_axi_card_hbm_p28_rlast     ) ,
      .s_axi_p28_HBM_rvalid      ( act_axi_card_hbm_p28_rvalid    ) ,
      .s_axi_p28_HBM_rready      ( act_axi_card_hbm_p28_rready    ) ,
      `endif

      `ifdef HBM_AXI_IF_P29
      .s_axi_p29_HBM_aclk        ( clock_act                   ) ,
      .s_axi_p29_HBM_awaddr      ( act_axi_card_hbm_p29_awaddr    ) ,
      .s_axi_p29_HBM_awlen       ( act_axi_card_hbm_p29_awlen     ) ,
      .s_axi_p29_HBM_awsize      ( act_axi_card_hbm_p29_awsize    ) ,
      .s_axi_p29_HBM_awburst     ( act_axi_card_hbm_p29_awburst   ) ,
      .s_axi_p29_HBM_awlock      ( act_axi_card_hbm_p29_awlock[0] ) ,
      .s_axi_p29_HBM_arlock      ( act_axi_card_hbm_p29_arlock[0] ) ,
  `ifndef ENABLE_BRAM
      .s_axi_p29_HBM_awregion    ( act_axi_card_hbm_p29_awregion  ) ,
      .s_axi_p29_HBM_awqos       ( act_axi_card_hbm_p29_awqos     ) ,
      .s_axi_p29_HBM_arregion    ( act_axi_card_hbm_p29_arregion  ) ,
      .s_axi_p29_HBM_arqos       ( act_axi_card_hbm_p29_arqos     ) ,
      .s_axi_p29_HBM_awid        ( 6'b0                           ) ,
      .s_axi_p29_HBM_arid        ( 6'b0                           ) ,
      .s_axi_p29_HBM_bid         (                                ) ,
      .s_axi_p29_HBM_rid         (                                ) ,
  `endif
      .s_axi_p29_HBM_awcache     ( act_axi_card_hbm_p29_awcache   ) ,
      .s_axi_p29_HBM_awprot      ( act_axi_card_hbm_p29_awprot    ) ,
      .s_axi_p29_HBM_awvalid     ( act_axi_card_hbm_p29_awvalid   ) ,
      .s_axi_p29_HBM_awready     ( act_axi_card_hbm_p29_awready   ) ,
      .s_axi_p29_HBM_wdata       ( act_axi_card_hbm_p29_wdata     ) ,
      .s_axi_p29_HBM_wstrb       ( act_axi_card_hbm_p29_wstrb     ) ,
      .s_axi_p29_HBM_wlast       ( act_axi_card_hbm_p29_wlast     ) ,
      .s_axi_p29_HBM_wvalid      ( act_axi_card_hbm_p29_wvalid    ) ,
      .s_axi_p29_HBM_wready      ( act_axi_card_hbm_p29_wready    ) ,
      .s_axi_p29_HBM_bresp       ( act_axi_card_hbm_p29_bresp     ) ,
      .s_axi_p29_HBM_bvalid      ( act_axi_card_hbm_p29_bvalid    ) ,
      .s_axi_p29_HBM_bready      ( act_axi_card_hbm_p29_bready    ) ,
      .s_axi_p29_HBM_araddr      ( act_axi_card_hbm_p29_araddr    ) ,
      .s_axi_p29_HBM_arlen       ( act_axi_card_hbm_p29_arlen     ) ,
      .s_axi_p29_HBM_arsize      ( act_axi_card_hbm_p29_arsize    ) ,
      .s_axi_p29_HBM_arburst     ( act_axi_card_hbm_p29_arburst   ) ,
      .s_axi_p29_HBM_arcache     ( act_axi_card_hbm_p29_arcache   ) ,
      .s_axi_p29_HBM_arprot      ( act_axi_card_hbm_p29_arprot    ) ,
      .s_axi_p29_HBM_arvalid     ( act_axi_card_hbm_p29_arvalid   ) ,
      .s_axi_p29_HBM_arready     ( act_axi_card_hbm_p29_arready   ) ,
      .s_axi_p29_HBM_rdata       ( act_axi_card_hbm_p29_rdata     ) ,
      .s_axi_p29_HBM_rresp       ( act_axi_card_hbm_p29_rresp     ) ,
      .s_axi_p29_HBM_rlast       ( act_axi_card_hbm_p29_rlast     ) ,
      .s_axi_p29_HBM_rvalid      ( act_axi_card_hbm_p29_rvalid    ) ,
      .s_axi_p29_HBM_rready      ( act_axi_card_hbm_p29_rready    ) ,
      `endif

      `ifdef HBM_AXI_IF_P30
      .s_axi_p30_HBM_aclk        ( clock_act                   ) ,
      .s_axi_p30_HBM_awaddr      ( act_axi_card_hbm_p30_awaddr    ) ,
      .s_axi_p30_HBM_awlen       ( act_axi_card_hbm_p30_awlen     ) ,
      .s_axi_p30_HBM_awsize      ( act_axi_card_hbm_p30_awsize    ) ,
      .s_axi_p30_HBM_awburst     ( act_axi_card_hbm_p30_awburst   ) ,
      .s_axi_p30_HBM_awlock      ( act_axi_card_hbm_p30_awlock[0] ) ,
      .s_axi_p30_HBM_arlock      ( act_axi_card_hbm_p30_arlock[0] ) ,
  `ifndef ENABLE_BRAM
      .s_axi_p30_HBM_awregion    ( act_axi_card_hbm_p30_awregion  ) ,
      .s_axi_p30_HBM_awqos       ( act_axi_card_hbm_p30_awqos     ) ,
      .s_axi_p30_HBM_arregion    ( act_axi_card_hbm_p30_arregion  ) ,
      .s_axi_p30_HBM_arqos       ( act_axi_card_hbm_p30_arqos     ) ,
      .s_axi_p30_HBM_awid        ( 6'b0                           ) ,
      .s_axi_p30_HBM_arid        ( 6'b0                           ) ,
      .s_axi_p30_HBM_bid         (                                ) ,
      .s_axi_p30_HBM_rid         (                                ) ,
  `endif
      .s_axi_p30_HBM_awcache     ( act_axi_card_hbm_p30_awcache   ) ,
      .s_axi_p30_HBM_awprot      ( act_axi_card_hbm_p30_awprot    ) ,
      .s_axi_p30_HBM_awvalid     ( act_axi_card_hbm_p30_awvalid   ) ,
      .s_axi_p30_HBM_awready     ( act_axi_card_hbm_p30_awready   ) ,
      .s_axi_p30_HBM_wdata       ( act_axi_card_hbm_p30_wdata     ) ,
      .s_axi_p30_HBM_wstrb       ( act_axi_card_hbm_p30_wstrb     ) ,
      .s_axi_p30_HBM_wlast       ( act_axi_card_hbm_p30_wlast     ) ,
      .s_axi_p30_HBM_wvalid      ( act_axi_card_hbm_p30_wvalid    ) ,
      .s_axi_p30_HBM_wready      ( act_axi_card_hbm_p30_wready    ) ,
      .s_axi_p30_HBM_bresp       ( act_axi_card_hbm_p30_bresp     ) ,
      .s_axi_p30_HBM_bvalid      ( act_axi_card_hbm_p30_bvalid    ) ,
      .s_axi_p30_HBM_bready      ( act_axi_card_hbm_p30_bready    ) ,
      .s_axi_p30_HBM_araddr      ( act_axi_card_hbm_p30_araddr    ) ,
      .s_axi_p30_HBM_arlen       ( act_axi_card_hbm_p30_arlen     ) ,
      .s_axi_p30_HBM_arsize      ( act_axi_card_hbm_p30_arsize    ) ,
      .s_axi_p30_HBM_arburst     ( act_axi_card_hbm_p30_arburst   ) ,
      .s_axi_p30_HBM_arcache     ( act_axi_card_hbm_p30_arcache   ) ,
      .s_axi_p30_HBM_arprot      ( act_axi_card_hbm_p30_arprot    ) ,
      .s_axi_p30_HBM_arvalid     ( act_axi_card_hbm_p30_arvalid   ) ,
      .s_axi_p30_HBM_arready     ( act_axi_card_hbm_p30_arready   ) ,
      .s_axi_p30_HBM_rdata       ( act_axi_card_hbm_p30_rdata     ) ,
      .s_axi_p30_HBM_rresp       ( act_axi_card_hbm_p30_rresp     ) ,
      .s_axi_p30_HBM_rlast       ( act_axi_card_hbm_p30_rlast     ) ,
      .s_axi_p30_HBM_rvalid      ( act_axi_card_hbm_p30_rvalid    ) ,
      .s_axi_p30_HBM_rready      ( act_axi_card_hbm_p30_rready    ) ,
      `endif

      `ifdef HBM_AXI_IF_P31
      .s_axi_p31_HBM_aclk        ( clock_act                   ) ,
      .s_axi_p31_HBM_awaddr      ( act_axi_card_hbm_p31_awaddr    ) ,
      .s_axi_p31_HBM_awlen       ( act_axi_card_hbm_p31_awlen     ) ,
      .s_axi_p31_HBM_awsize      ( act_axi_card_hbm_p31_awsize    ) ,
      .s_axi_p31_HBM_awburst     ( act_axi_card_hbm_p31_awburst   ) ,
      .s_axi_p31_HBM_awlock      ( act_axi_card_hbm_p31_awlock[0] ) ,
      .s_axi_p31_HBM_arlock      ( act_axi_card_hbm_p31_arlock[0] ) ,
  `ifndef ENABLE_BRAM
      .s_axi_p31_HBM_awregion    ( act_axi_card_hbm_p31_awregion  ) ,
      .s_axi_p31_HBM_awqos       ( act_axi_card_hbm_p31_awqos     ) ,
      .s_axi_p31_HBM_arregion    ( act_axi_card_hbm_p31_arregion  ) ,
      .s_axi_p31_HBM_arqos       ( act_axi_card_hbm_p31_arqos     ) ,
      .s_axi_p31_HBM_awid        ( 6'b0                           ) ,
      .s_axi_p31_HBM_arid        ( 6'b0                           ) ,
      .s_axi_p31_HBM_bid         (                                ) ,
      .s_axi_p31_HBM_rid         (                                ) ,
  `endif
      .s_axi_p31_HBM_awcache     ( act_axi_card_hbm_p31_awcache   ) ,
      .s_axi_p31_HBM_awprot      ( act_axi_card_hbm_p31_awprot    ) ,
      .s_axi_p31_HBM_awvalid     ( act_axi_card_hbm_p31_awvalid   ) ,
      .s_axi_p31_HBM_awready     ( act_axi_card_hbm_p31_awready   ) ,
      .s_axi_p31_HBM_wdata       ( act_axi_card_hbm_p31_wdata     ) ,
      .s_axi_p31_HBM_wstrb       ( act_axi_card_hbm_p31_wstrb     ) ,
      .s_axi_p31_HBM_wlast       ( act_axi_card_hbm_p31_wlast     ) ,
      .s_axi_p31_HBM_wvalid      ( act_axi_card_hbm_p31_wvalid    ) ,
      .s_axi_p31_HBM_wready      ( act_axi_card_hbm_p31_wready    ) ,
      .s_axi_p31_HBM_bresp       ( act_axi_card_hbm_p31_bresp     ) ,
      .s_axi_p31_HBM_bvalid      ( act_axi_card_hbm_p31_bvalid    ) ,
      .s_axi_p31_HBM_bready      ( act_axi_card_hbm_p31_bready    ) ,
      .s_axi_p31_HBM_araddr      ( act_axi_card_hbm_p31_araddr    ) ,
      .s_axi_p31_HBM_arlen       ( act_axi_card_hbm_p31_arlen     ) ,
      .s_axi_p31_HBM_arsize      ( act_axi_card_hbm_p31_arsize    ) ,
      .s_axi_p31_HBM_arburst     ( act_axi_card_hbm_p31_arburst   ) ,
      .s_axi_p31_HBM_arcache     ( act_axi_card_hbm_p31_arcache   ) ,
      .s_axi_p31_HBM_arprot      ( act_axi_card_hbm_p31_arprot    ) ,
      .s_axi_p31_HBM_arvalid     ( act_axi_card_hbm_p31_arvalid   ) ,
      .s_axi_p31_HBM_arready     ( act_axi_card_hbm_p31_arready   ) ,
      .s_axi_p31_HBM_rdata       ( act_axi_card_hbm_p31_rdata     ) ,
      .s_axi_p31_HBM_rresp       ( act_axi_card_hbm_p31_rresp     ) ,
      .s_axi_p31_HBM_rlast       ( act_axi_card_hbm_p31_rlast     ) ,
      .s_axi_p31_HBM_rvalid      ( act_axi_card_hbm_p31_rvalid    ) ,
      .s_axi_p31_HBM_rready      ( act_axi_card_hbm_p31_rready    ) ,
      `endif

//common signals
      .apb_complete             ( hbm_ctrl_apb_complete       ) ,
      .cresetn                  ( hbm_ctrl_reset_n            ) ,
      .aresetn                  ( ~reset_action_q             )
) ; 

//assign  hbm_ctrl_awid[`AXI_CARD_HBM_ID_WIDTH-1 : 0] = act_axi_card_hbm_p0_awid;
//assign  hbm_ctrl_awid[5 : `AXI_CARD_HBM_ID_WIDTH]   = 'b0;
//assign  hbm_ctrl_arid[`AXI_CARD_HBM_ID_WIDTH-1 : 0] = act_axi_card_hbm_p0_arid;
//assign  hbm_ctrl_arid[5 : `AXI_CARD_HBM_ID_WIDTH]   = 'b0;

      `ifdef HBM_AXI_IF_P0
assign  act_axi_card_hbm_p0_bid = 'b0; //hbm_ctrl_bid[`AXI_CARD_HBM_ID_WIDTH-1 : 0];
assign  act_axi_card_hbm_p0_rid = 'b0; //hbm_ctrl_rid[`AXI_CARD_HBM_ID_WIDTH-1 : 0];
      `endif
      `ifdef HBM_AXI_IF_P1
assign  act_axi_card_hbm_p1_bid = 'b0; //hbm_ctrl_bid[`AXI_CARD_HBM_ID_WIDTH-1 : 0];
assign  act_axi_card_hbm_p1_rid = 'b0; //hbm_ctrl_rid[`AXI_CARD_HBM_ID_WIDTH-1 : 0];
      `endif
      `ifdef HBM_AXI_IF_P2
assign  act_axi_card_hbm_p2_bid = 'b0; //hbm_ctrl_bid[`AXI_CARD_HBM_ID_WIDTH-1 : 0];
assign  act_axi_card_hbm_p2_rid = 'b0; //hbm_ctrl_rid[`AXI_CARD_HBM_ID_WIDTH-1 : 0];
      `endif
      `ifdef HBM_AXI_IF_P3
assign  act_axi_card_hbm_p3_bid = 'b0; //hbm_ctrl_bid[`AXI_CARD_HBM_ID_WIDTH-1 : 0];
assign  act_axi_card_hbm_p3_rid = 'b0; //hbm_ctrl_rid[`AXI_CARD_HBM_ID_WIDTH-1 : 0];
      `endif
      `ifdef HBM_AXI_IF_P4
assign  act_axi_card_hbm_p4_bid = 'b0; //hbm_ctrl_bid[`AXI_CARD_HBM_ID_WIDTH-1 : 0];
assign  act_axi_card_hbm_p4_rid = 'b0; //hbm_ctrl_rid[`AXI_CARD_HBM_ID_WIDTH-1 : 0];
      `endif
      `ifdef HBM_AXI_IF_P5
assign  act_axi_card_hbm_p5_bid = 'b0; //hbm_ctrl_bid[`AXI_CARD_HBM_ID_WIDTH-1 : 0];
assign  act_axi_card_hbm_p5_rid = 'b0; //hbm_ctrl_rid[`AXI_CARD_HBM_ID_WIDTH-1 : 0];
      `endif
      `ifdef HBM_AXI_IF_P6
assign  act_axi_card_hbm_p6_bid = 'b0; //hbm_ctrl_bid[`AXI_CARD_HBM_ID_WIDTH-1 : 0];
assign  act_axi_card_hbm_p6_rid = 'b0; //hbm_ctrl_rid[`AXI_CARD_HBM_ID_WIDTH-1 : 0];
      `endif
      `ifdef HBM_AXI_IF_P7
assign  act_axi_card_hbm_p7_bid = 'b0; //hbm_ctrl_bid[`AXI_CARD_HBM_ID_WIDTH-1 : 0];
assign  act_axi_card_hbm_p7_rid = 'b0; //hbm_ctrl_rid[`AXI_CARD_HBM_ID_WIDTH-1 : 0];
      `endif
      `ifdef HBM_AXI_IF_P8
assign  act_axi_card_hbm_p8_bid = 'b0; //hbm_ctrl_bid[`AXI_CARD_HBM_ID_WIDTH-1 : 0];
assign  act_axi_card_hbm_p8_rid = 'b0; //hbm_ctrl_rid[`AXI_CARD_HBM_ID_WIDTH-1 : 0];
      `endif
      `ifdef HBM_AXI_IF_P9
assign  act_axi_card_hbm_p9_bid = 'b0; //hbm_ctrl_bid[`AXI_CARD_HBM_ID_WIDTH-1 : 0];
assign  act_axi_card_hbm_p9_rid = 'b0; //hbm_ctrl_rid[`AXI_CARD_HBM_ID_WIDTH-1 : 0];
      `endif
      `ifdef HBM_AXI_IF_P10
assign  act_axi_card_hbm_p10_bid = 'b0; //hbm_ctrl_bid[`AXI_CARD_HBM_ID_WIDTH-1 : 0];
assign  act_axi_card_hbm_p10_rid = 'b0; //hbm_ctrl_rid[`AXI_CARD_HBM_ID_WIDTH-1 : 0];
      `endif
      `ifdef HBM_AXI_IF_P11
assign  act_axi_card_hbm_p11_bid = 'b0; //hbm_ctrl_bid[`AXI_CARD_HBM_ID_WIDTH-1 : 0];
assign  act_axi_card_hbm_p11_rid = 'b0; //hbm_ctrl_rid[`AXI_CARD_HBM_ID_WIDTH-1 : 0];
      `endif
      `ifdef HBM_AXI_IF_P12
assign  act_axi_card_hbm_p12_bid = 'b0; //hbm_ctrl_bid[`AXI_CARD_HBM_ID_WIDTH-1 : 0];
assign  act_axi_card_hbm_p12_rid = 'b0; //hbm_ctrl_rid[`AXI_CARD_HBM_ID_WIDTH-1 : 0];
      `endif
      `ifdef HBM_AXI_IF_P13
assign  act_axi_card_hbm_p13_bid = 'b0; //hbm_ctrl_bid[`AXI_CARD_HBM_ID_WIDTH-1 : 0];
assign  act_axi_card_hbm_p13_rid = 'b0; //hbm_ctrl_rid[`AXI_CARD_HBM_ID_WIDTH-1 : 0];
      `endif
      `ifdef HBM_AXI_IF_P14
assign  act_axi_card_hbm_p14_bid = 'b0; //hbm_ctrl_bid[`AXI_CARD_HBM_ID_WIDTH-1 : 0];
assign  act_axi_card_hbm_p14_rid = 'b0; //hbm_ctrl_rid[`AXI_CARD_HBM_ID_WIDTH-1 : 0];
      `endif
      `ifdef HBM_AXI_IF_P15
assign  act_axi_card_hbm_p15_bid = 'b0; //hbm_ctrl_bid[`AXI_CARD_HBM_ID_WIDTH-1 : 0];
assign  act_axi_card_hbm_p15_rid = 'b0; //hbm_ctrl_rid[`AXI_CARD_HBM_ID_WIDTH-1 : 0];
      `endif
      `ifdef HBM_AXI_IF_P16
assign  act_axi_card_hbm_p16_bid = 'b0; //hbm_ctrl_bid[`AXI_CARD_HBM_ID_WIDTH-1 : 0];
assign  act_axi_card_hbm_p16_rid = 'b0; //hbm_ctrl_rid[`AXI_CARD_HBM_ID_WIDTH-1 : 0];
      `endif
      `ifdef HBM_AXI_IF_P17
assign  act_axi_card_hbm_p17_bid = 'b0; //hbm_ctrl_bid[`AXI_CARD_HBM_ID_WIDTH-1 : 0];
assign  act_axi_card_hbm_p17_rid = 'b0; //hbm_ctrl_rid[`AXI_CARD_HBM_ID_WIDTH-1 : 0];
      `endif
      `ifdef HBM_AXI_IF_P18
assign  act_axi_card_hbm_p18_bid = 'b0; //hbm_ctrl_bid[`AXI_CARD_HBM_ID_WIDTH-1 : 0];
assign  act_axi_card_hbm_p18_rid = 'b0; //hbm_ctrl_rid[`AXI_CARD_HBM_ID_WIDTH-1 : 0];
      `endif
      `ifdef HBM_AXI_IF_P19
assign  act_axi_card_hbm_p19_bid = 'b0; //hbm_ctrl_bid[`AXI_CARD_HBM_ID_WIDTH-1 : 0];
assign  act_axi_card_hbm_p19_rid = 'b0; //hbm_ctrl_rid[`AXI_CARD_HBM_ID_WIDTH-1 : 0];
      `endif
      `ifdef HBM_AXI_IF_P20
assign  act_axi_card_hbm_p20_bid = 'b0; //hbm_ctrl_bid[`AXI_CARD_HBM_ID_WIDTH-1 : 0];
assign  act_axi_card_hbm_p20_rid = 'b0; //hbm_ctrl_rid[`AXI_CARD_HBM_ID_WIDTH-1 : 0];
      `endif
      `ifdef HBM_AXI_IF_P21
assign  act_axi_card_hbm_p21_bid = 'b0; //hbm_ctrl_bid[`AXI_CARD_HBM_ID_WIDTH-1 : 0];
assign  act_axi_card_hbm_p21_rid = 'b0; //hbm_ctrl_rid[`AXI_CARD_HBM_ID_WIDTH-1 : 0];
      `endif
      `ifdef HBM_AXI_IF_P22
assign  act_axi_card_hbm_p22_bid = 'b0; //hbm_ctrl_bid[`AXI_CARD_HBM_ID_WIDTH-1 : 0];
assign  act_axi_card_hbm_p22_rid = 'b0; //hbm_ctrl_rid[`AXI_CARD_HBM_ID_WIDTH-1 : 0];
      `endif
      `ifdef HBM_AXI_IF_P23
assign  act_axi_card_hbm_p23_bid = 'b0; //hbm_ctrl_bid[`AXI_CARD_HBM_ID_WIDTH-1 : 0];
assign  act_axi_card_hbm_p23_rid = 'b0; //hbm_ctrl_rid[`AXI_CARD_HBM_ID_WIDTH-1 : 0];
      `endif
      `ifdef HBM_AXI_IF_P24
assign  act_axi_card_hbm_p24_bid = 'b0; //hbm_ctrl_bid[`AXI_CARD_HBM_ID_WIDTH-1 : 0];
assign  act_axi_card_hbm_p24_rid = 'b0; //hbm_ctrl_rid[`AXI_CARD_HBM_ID_WIDTH-1 : 0];
      `endif
      `ifdef HBM_AXI_IF_P25
assign  act_axi_card_hbm_p25_bid = 'b0; //hbm_ctrl_bid[`AXI_CARD_HBM_ID_WIDTH-1 : 0];
assign  act_axi_card_hbm_p25_rid = 'b0; //hbm_ctrl_rid[`AXI_CARD_HBM_ID_WIDTH-1 : 0];
      `endif
      `ifdef HBM_AXI_IF_P26
assign  act_axi_card_hbm_p26_bid = 'b0; //hbm_ctrl_bid[`AXI_CARD_HBM_ID_WIDTH-1 : 0];
assign  act_axi_card_hbm_p26_rid = 'b0; //hbm_ctrl_rid[`AXI_CARD_HBM_ID_WIDTH-1 : 0];
      `endif
      `ifdef HBM_AXI_IF_P27
assign  act_axi_card_hbm_p27_bid = 'b0; //hbm_ctrl_bid[`AXI_CARD_HBM_ID_WIDTH-1 : 0];
assign  act_axi_card_hbm_p27_rid = 'b0; //hbm_ctrl_rid[`AXI_CARD_HBM_ID_WIDTH-1 : 0];
      `endif
      `ifdef HBM_AXI_IF_P28
assign  act_axi_card_hbm_p28_bid = 'b0; //hbm_ctrl_bid[`AXI_CARD_HBM_ID_WIDTH-1 : 0];
assign  act_axi_card_hbm_p28_rid = 'b0; //hbm_ctrl_rid[`AXI_CARD_HBM_ID_WIDTH-1 : 0];
      `endif
      `ifdef HBM_AXI_IF_P29
assign  act_axi_card_hbm_p29_bid = 'b0; //hbm_ctrl_bid[`AXI_CARD_HBM_ID_WIDTH-1 : 0];
assign  act_axi_card_hbm_p29_rid = 'b0; //hbm_ctrl_rid[`AXI_CARD_HBM_ID_WIDTH-1 : 0];
      `endif
      `ifdef HBM_AXI_IF_P30
assign  act_axi_card_hbm_p30_bid = 'b0; //hbm_ctrl_bid[`AXI_CARD_HBM_ID_WIDTH-1 : 0];
assign  act_axi_card_hbm_p30_rid = 'b0; //hbm_ctrl_rid[`AXI_CARD_HBM_ID_WIDTH-1 : 0];
      `endif
      `ifdef HBM_AXI_IF_P31
assign  act_axi_card_hbm_p31_bid = 'b0; //hbm_ctrl_bid[`AXI_CARD_HBM_ID_WIDTH-1 : 0];
assign  act_axi_card_hbm_p31_rid = 'b0; //hbm_ctrl_rid[`AXI_CARD_HBM_ID_WIDTH-1 : 0];
      `endif

// if HBM + (AD9H3 or AD9H7) : resets the logic before HBM
assign hbm_ctrl_reset_n = hbm_ctrl_apb_complete & ~reset_action_q;


//assign hbm_ctrl_apb_preset_n = ~reset_action_q;
//assign hbm_ctrl_apb_paddr    = 22'b0;
//assign hbm_ctrl_apb_penable  = 1'b0;
//assign hbm_ctrl_apb_psel     = 1'b0;
//assign hbm_ctrl_apb_pwrite   = 1'b0;
//assign hbm_ctrl_apb_pwdata   = 32'b0;


`endif // end of if HBM 


  // // ******************************************************************************
  // // Ethernet controllers
  // // ******************************************************************************

`ifdef ENABLE_ETHERNET 
  `ifndef ENABLE_ETH_LOOP_BACK
    // following flag depends on vivado release and is set in scripts/snap_config
    `ifdef ENABLE_EMAC_V3_1
assign  gt_grxn[0] = gt_rx_gt_port_0_n_o;
assign  gt_grxn[1] = gt_rx_gt_port_1_n_o;
assign  gt_grxn[2] = gt_rx_gt_port_2_n_o;
assign  gt_grxn[3] = gt_rx_gt_port_3_n_o;
assign  gt_grxp[0] = gt_rx_gt_port_0_p_o;
assign  gt_grxp[1] = gt_rx_gt_port_1_p_o;
assign  gt_grxp[2] = gt_rx_gt_port_2_p_o;
assign  gt_grxp[3] = gt_rx_gt_port_3_p_o;

assign  gt_tx_gt_port_0_n_i = gt_gtxn[0];
assign  gt_tx_gt_port_1_n_i = gt_gtxn[1];
assign  gt_tx_gt_port_2_n_i = gt_gtxn[2];
assign  gt_tx_gt_port_3_n_i = gt_gtxn[3];
assign  gt_tx_gt_port_0_p_i = gt_gtxp[0];
assign  gt_tx_gt_port_1_p_i = gt_gtxp[1];
assign  gt_tx_gt_port_2_p_i = gt_gtxp[2];
assign  gt_tx_gt_port_3_p_i = gt_gtxp[3];
    `endif

// Following IBUF allows to create the dynamic area when using partial reconfiguration flow
// This is needed only for signals in the dynamic area which have external IOs
   IBUF IBUF_gt_ref_clk_p_inst  ( .O(gt_ref_clk_p_o), .I(gt_ref_clk_p));
   IBUF IBUF_gt_ref_clk_n_inst  ( .O(gt_ref_clk_n_o), .I(gt_ref_clk_n));

   IBUF IBUF_gt_rx_gt_p0_p_inst ( .O(gt_rx_gt_port_0_p_o), .I(gt_rx_gt_port_0_p));
   IBUF IBUF_gt_rx_gt_p0_n_inst ( .O(gt_rx_gt_port_0_n_o), .I(gt_rx_gt_port_0_n));
   IBUF IBUF_gt_rx_gt_p1_p_inst ( .O(gt_rx_gt_port_1_p_o), .I(gt_rx_gt_port_1_p));
   IBUF IBUF_gt_rx_gt_p1_n_inst ( .O(gt_rx_gt_port_1_n_o), .I(gt_rx_gt_port_1_n));
   IBUF IBUF_gt_rx_gt_p2_p_inst ( .O(gt_rx_gt_port_2_p_o), .I(gt_rx_gt_port_2_p));
   IBUF IBUF_gt_rx_gt_p2_n_inst ( .O(gt_rx_gt_port_2_n_o), .I(gt_rx_gt_port_2_n));
   IBUF IBUF_gt_rx_gt_p3_p_inst ( .O(gt_rx_gt_port_3_p_o), .I(gt_rx_gt_port_3_p));
   IBUF IBUF_gt_rx_gt_p3_n_inst ( .O(gt_rx_gt_port_3_n_o), .I(gt_rx_gt_port_3_n));
    
   IBUF IBUF_gt_tx_gt_p0_p_inst ( .O(gt_tx_gt_port_0_p), .I(gt_tx_gt_port_0_p_i));
   IBUF IBUF_gt_tx_gt_p0_n_inst ( .O(gt_tx_gt_port_0_n), .I(gt_tx_gt_port_0_n_i));
   IBUF IBUF_gt_tx_gt_p1_p_inst ( .O(gt_tx_gt_port_1_p), .I(gt_tx_gt_port_1_p_i));
   IBUF IBUF_gt_tx_gt_p1_n_inst ( .O(gt_tx_gt_port_1_n), .I(gt_tx_gt_port_1_n_i));
   IBUF IBUF_gt_tx_gt_p2_p_inst ( .O(gt_tx_gt_port_2_p), .I(gt_tx_gt_port_2_p_i));
   IBUF IBUF_gt_tx_gt_p2_n_inst ( .O(gt_tx_gt_port_2_n), .I(gt_tx_gt_port_2_n_i));
   IBUF IBUF_gt_tx_gt_p3_p_inst ( .O(gt_tx_gt_port_3_p), .I(gt_tx_gt_port_3_p_i));
   IBUF IBUF_gt_tx_gt_p3_n_inst ( .O(gt_tx_gt_port_3_n), .I(gt_tx_gt_port_3_n_i));

eth_100G eth_100G_0
(
      .i_gt_ref_clk_n              ( gt_ref_clk_n_o                  ),
      .i_gt_ref_clk_p              ( gt_ref_clk_p_o                  ),

    `ifdef ENABLE_EMAC_V3_1
      //Vivado 2020.1 and later
      .gt_grx_n                    ( gt_grxn                       ),
      .gt_grx_p                    ( gt_grxp                       ),
      .gt_gtx_n                    ( gt_gtxn                       ),
      .gt_gtx_p                    ( gt_gtxp                       ),
    `else
      //Vivado 2019.2 and earlier
      .i_gt_rx_gt_port_0_n         ( gt_rx_gt_port_0_n_o           ),
      .i_gt_rx_gt_port_0_p         ( gt_rx_gt_port_0_p_o           ),
      .i_gt_rx_gt_port_1_n         ( gt_rx_gt_port_1_n_o           ),
      .i_gt_rx_gt_port_1_p         ( gt_rx_gt_port_1_p_o           ),
      .i_gt_rx_gt_port_2_n         ( gt_rx_gt_port_2_n_o           ),
      .i_gt_rx_gt_port_2_p         ( gt_rx_gt_port_2_p_o           ),
      .i_gt_rx_gt_port_3_n         ( gt_rx_gt_port_3_n_o           ),
      .i_gt_rx_gt_port_3_p         ( gt_rx_gt_port_3_p_o           ),

      .o_gt_tx_gt_port_0_n         ( gt_tx_gt_port_0_n_i           ),
      .o_gt_tx_gt_port_0_p         ( gt_tx_gt_port_0_p_i           ),
      .o_gt_tx_gt_port_1_n         ( gt_tx_gt_port_1_n_i           ),
      .o_gt_tx_gt_port_1_p         ( gt_tx_gt_port_1_p_i           ),
      .o_gt_tx_gt_port_2_n         ( gt_tx_gt_port_2_n_i           ),
      .o_gt_tx_gt_port_2_p         ( gt_tx_gt_port_2_p_i           ),
      .o_gt_tx_gt_port_3_n         ( gt_tx_gt_port_3_n_i           ),
      .o_gt_tx_gt_port_3_p         ( gt_tx_gt_port_3_p_i           ),
    `endif

      .m_axis_rx_tdata             ( eth1_rx_tdata                 ),
      .m_axis_rx_tkeep             ( eth1_rx_tkeep                 ),
      .m_axis_rx_tlast             ( eth1_rx_tlast                 ),
      .m_axis_rx_tvalid            ( eth1_rx_tvalid                ),
      .m_axis_rx_tuser             ( eth1_rx_tuser                 ),
      .m_axis_rx_tready            ( eth1_rx_tready                ),
      .s_axis_tx_tdata             ( eth1_tx_tdata                 ),
      .s_axis_tx_tkeep             ( eth1_tx_tkeep                 ),
      .s_axis_tx_tlast             ( eth1_tx_tlast                 ),
      .s_axis_tx_tvalid            ( eth1_tx_tvalid                ),
      .s_axis_tx_tuser             ( eth1_tx_tuser                 ),
      .s_axis_tx_tready            ( eth1_tx_tready                ),

      .i_sys_reset                 ( eth_rst                       ),
      .i_core_rx_reset             ( 1'b0                          ),
      .i_core_tx_reset             ( 1'b0                          ),
      .m_axis_rx_reset             ( eth_m_axis_rx_rst             ),
      .i_capi_clk                  ( clock_afu                     ),

      .i_ctl_rx_enable             ( 1'b1                          ),
      .i_ctl_rx_rsfec_enable       ( 1'b1                          ),
      .i_ctl_tx_enable             ( 1'b1                          ),
      .i_ctl_tx_rsfec_enable       ( 1'b1                          )
);

`endif
`endif
endmodule

