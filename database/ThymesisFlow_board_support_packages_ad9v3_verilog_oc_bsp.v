// This program was cloned from: https://github.com/OpenCAPI/ThymesisFlow
// License: Apache License 2.0

// *!***************************************************************************
// *! Copyright 2019 International Business Machines
// *!
// *! Licensed under the Apache License, Version 2.0 (the "License");
// *! you may not use this file except in compliance with the License.
// *! You may obtain a copy of the License at
// *! http://www.apache.org/licenses/LICENSE-2.0 
// *!
// *! The patent license granted to you in Section 3 of the License, as applied
// *! to the "Work," hereby includes implementations of the Work in physical form.  
// *!
// *! Unless required by applicable law or agreed to in writing, the reference design
// *! distributed under the License is distributed on an "AS IS" BASIS,
// *! WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// *! See the License for the specific language governing permissions and
// *! limitations under the License.
// *! 
// *! The background Specification upon which this is based is managed by and available from
// *! the OpenCAPI Consortium.  More information can be found at https://opencapi.org. 
// *!***************************************************************************
module oc_bsp (
//-------------
//-- FPGA I/O
//-------------
// -- Reset
    input                 ocde
   ,input                 freerun_clk_p
   ,input                 freerun_clk_n

  // -- Phy Interface
   ,output                ch0_gtytxn_out     // -- XLX PHY transmit channels
   ,output                ch0_gtytxp_out     // -- XLX PHY transmit channels
   ,output                ch1_gtytxn_out     // -- XLX PHY transmit channels
   ,output                ch1_gtytxp_out     // -- XLX PHY transmit channels
   ,output                ch2_gtytxn_out     // -- XLX PHY transmit channels
   ,output                ch2_gtytxp_out     // -- XLX PHY transmit channels
   ,output                ch3_gtytxn_out     // -- XLX PHY transmit channels
   ,output                ch3_gtytxp_out     // -- XLX PHY transmit channels
   ,output                ch4_gtytxn_out     // -- XLX PHY transmit channels
   ,output                ch4_gtytxp_out     // -- XLX PHY transmit channels
   ,output                ch5_gtytxn_out     // -- XLX PHY transmit channels
   ,output                ch5_gtytxp_out     // -- XLX PHY transmit channels
   ,output                ch6_gtytxn_out     // -- XLX PHY transmit channels
   ,output                ch6_gtytxp_out     // -- XLX PHY transmit channels
   ,output                ch7_gtytxn_out     // -- XLX PHY transmit channels
   ,output                ch7_gtytxp_out     // -- XLX PHY transmit channels

   ,input                 ch0_gtyrxn_in      // -- XLX PHY receive channels
   ,input                 ch0_gtyrxp_in      // -- XLX PHY receive channels
   ,input                 ch1_gtyrxn_in      // -- XLX PHY receive channels
   ,input                 ch1_gtyrxp_in      // -- XLX PHY receive channels
   ,input                 ch2_gtyrxn_in      // -- XLX PHY receive channels
   ,input                 ch2_gtyrxp_in      // -- XLX PHY receive channels
   ,input                 ch3_gtyrxn_in      // -- XLX PHY receive channels
   ,input                 ch3_gtyrxp_in      // -- XLX PHY receive channels
   ,input                 ch4_gtyrxn_in      // -- XLX PHY receive channels
   ,input                 ch4_gtyrxp_in      // -- XLX PHY receive channels
   ,input                 ch5_gtyrxn_in      // -- XLX PHY receive channels
   ,input                 ch5_gtyrxp_in      // -- XLX PHY receive channels
   ,input                 ch6_gtyrxn_in      // -- XLX PHY receive channels
   ,input                 ch6_gtyrxp_in      // -- XLX PHY receive channels
   ,input                 ch7_gtyrxn_in      // -- XLX PHY receive channels
   ,input                 ch7_gtyrxp_in      // -- XLX PHY receive channels

   ,input                 mgtrefclk1_x0y0_p  // -- XLX PHY transcieve clocks 156.25 MHz
   ,input                 mgtrefclk1_x0y0_n  // -- XLX PHY transcieve clocks 156.25 MHz
   ,input                 mgtrefclk1_x0y1_p  // -- XLX PHY transcieve clocks 156.25 MHz
   ,input                 mgtrefclk1_x0y1_n  // -- XLX PHY transcieve clocks 156.25 MHz

`ifdef FLASH
   ,inout  FPGA_FLASH_CE2_L       // To/From FLASH of flash_sub_system.v
   ,inout  FPGA_FLASH_DQ4         // To/From FLASH of flash_sub_system.v
   ,inout  FPGA_FLASH_DQ5         // To/From FLASH of flash_sub_system.v
   ,inout  FPGA_FLASH_DQ6         // To/From FLASH of flash_sub_system.v
   ,inout  FPGA_FLASH_DQ7         // To/From FLASH of flash_sub_system.v
`endif

`ifdef THYMESISFLOW
   ,output clock_free_running_100
`endif 

//-------------
//-- AFU Ports
//-------------
   ,output           clock_afu
   ,output           clock_tlx
   ,output           reset_n
   ,output  [4:0]    ro_device
   ,output  [31:0]   ro_dlx_version
   ,output  [31:0]   ro_tlx_version
   ,output           tlx_afu_ready
   ,input   [6:0]    afu_tlx_cmd_initial_credit
   ,input            afu_tlx_cmd_credit
   ,output           tlx_afu_cmd_valid
   ,output  [7:0]    tlx_afu_cmd_opcode
   ,output  [1:0]    tlx_afu_cmd_dl
   ,output           tlx_afu_cmd_end
   ,output  [63:0]   tlx_afu_cmd_pa
   ,output  [3:0]    tlx_afu_cmd_flag
   ,output           tlx_afu_cmd_os
   ,output  [15:0]   tlx_afu_cmd_capptag
   ,output  [2:0]    tlx_afu_cmd_pl
   ,output  [63:0]   tlx_afu_cmd_be
   ,input   [6:0]    afu_tlx_resp_initial_credit
   ,input            afu_tlx_resp_credit
   ,output           tlx_afu_resp_valid
   ,output  [7:0]    tlx_afu_resp_opcode
   ,output  [15:0]   tlx_afu_resp_afutag
   ,output  [3:0]    tlx_afu_resp_code
   ,output  [5:0]    tlx_afu_resp_pg_size
   ,output  [1:0]    tlx_afu_resp_dl
   ,output  [1:0]    tlx_afu_resp_dp
   ,output  [23:0]   tlx_afu_resp_host_tag
   ,output  [3:0]    tlx_afu_resp_cache_state
   ,output  [17:0]   tlx_afu_resp_addr_tag
   ,input            afu_tlx_cmd_rd_req
   ,input   [2:0]    afu_tlx_cmd_rd_cnt
   ,output           tlx_afu_cmd_data_valid
   ,output           tlx_afu_cmd_data_bdi
   ,output  [511:0]  tlx_afu_cmd_data_bus
   ,input            afu_tlx_resp_rd_req
   ,input   [2:0]    afu_tlx_resp_rd_cnt
   ,output           tlx_afu_resp_data_valid
   ,output           tlx_afu_resp_data_bdi
   ,output  [511:0]  tlx_afu_resp_data_bus
   ,input            cfg_tlx_xmit_tmpl_config_0
   ,input            cfg_tlx_xmit_tmpl_config_1
   ,input            cfg_tlx_xmit_tmpl_config_2
   ,input            cfg_tlx_xmit_tmpl_config_3
   ,input   [3:0]    cfg_tlx_xmit_rate_config_0
   ,input   [3:0]    cfg_tlx_xmit_rate_config_1
   ,input   [3:0]    cfg_tlx_xmit_rate_config_2
   ,input   [3:0]    cfg_tlx_xmit_rate_config_3
   ,output           tlx_cfg_in_rcv_tmpl_capability_0
   ,output           tlx_cfg_in_rcv_tmpl_capability_1
   ,output           tlx_cfg_in_rcv_tmpl_capability_2
   ,output           tlx_cfg_in_rcv_tmpl_capability_3
   ,output  [3:0]    tlx_cfg_in_rcv_rate_capability_0
   ,output  [3:0]    tlx_cfg_in_rcv_rate_capability_1
   ,output  [3:0]    tlx_cfg_in_rcv_rate_capability_2
   ,output  [3:0]    tlx_cfg_in_rcv_rate_capability_3
   ,output  [3:0]    tlx_afu_cmd_initial_credit
   ,output  [3:0]    tlx_afu_resp_initial_credit
   ,output  [5:0]    tlx_afu_cmd_data_initial_credit
   ,output  [5:0]    tlx_afu_resp_data_initial_credit
   ,output           tlx_afu_cmd_credit
   ,input            afu_tlx_cmd_valid
   ,input   [7:0]    afu_tlx_cmd_opcode
   ,input   [11:0]   afu_tlx_cmd_actag
   ,input   [3:0]    afu_tlx_cmd_stream_id
   ,input   [67:0]   afu_tlx_cmd_ea_or_obj
   ,input   [15:0]   afu_tlx_cmd_afutag
   ,input   [1:0]    afu_tlx_cmd_dl
   ,input   [2:0]    afu_tlx_cmd_pl
   ,input            afu_tlx_cmd_os
   ,input   [63:0]   afu_tlx_cmd_be
   ,input   [3:0]    afu_tlx_cmd_flag
   ,input            afu_tlx_cmd_endian
   ,input   [15:0]   afu_tlx_cmd_bdf
   ,input   [19:0]   afu_tlx_cmd_pasid
   ,input   [5:0]    afu_tlx_cmd_pg_size
   ,output           tlx_afu_cmd_data_credit
   ,input            afu_tlx_cdata_valid
   ,input   [511:0]  afu_tlx_cdata_bus
   ,input            afu_tlx_cdata_bdi
   ,output           tlx_afu_resp_credit
   ,input            afu_tlx_resp_valid
   ,input   [7:0]    afu_tlx_resp_opcode
   ,input   [1:0]    afu_tlx_resp_dl
   ,input   [15:0]   afu_tlx_resp_capptag
   ,input   [1:0]    afu_tlx_resp_dp
   ,input   [3:0]    afu_tlx_resp_code
   ,output           tlx_afu_resp_data_credit
   ,input            afu_tlx_rdata_valid
   ,input   [511:0]  afu_tlx_rdata_bus
   ,input            afu_tlx_rdata_bdi
   ,output           tlx_cfg_valid
   ,output  [7:0]    tlx_cfg_opcode
   ,output  [63:0]   tlx_cfg_pa
   ,output           tlx_cfg_t
   ,output  [2:0]    tlx_cfg_pl
   ,output  [15:0]   tlx_cfg_capptag
   ,output  [31:0]   tlx_cfg_data_bus
   ,output           tlx_cfg_data_bdi
   ,input   [3:0]    cfg_tlx_initial_credit
   ,input            cfg_tlx_credit_return
   ,input            cfg_tlx_resp_valid
   ,input   [7:0]    cfg_tlx_resp_opcode
   ,input   [15:0]   cfg_tlx_resp_capptag
   ,input   [3:0]    cfg_tlx_resp_code
   ,input   [3:0]    cfg_tlx_rdata_offset
   ,input   [31:0]   cfg_tlx_rdata_bus
   ,input            cfg_tlx_rdata_bdi
   ,output           tlx_cfg_resp_ack
   ,input            cfg_f1_octrl00_resync_credits
   ,input   [14:0]   cfg_vpd_addr
   ,input            cfg_vpd_wren
   ,input   [31:0]   cfg_vpd_wdata
   ,input            cfg_vpd_rden
   ,output  [31:0]   vpd_cfg_rdata
   ,output           vpd_cfg_done
   ,output           vpd_err_unimplemented_addr
   ,input   [1:0]    cfg_flsh_devsel
   ,input   [13:0]   cfg_flsh_addr
   ,input            cfg_flsh_wren
   ,input   [31:0]   cfg_flsh_wdata
   ,input            cfg_flsh_rden
   ,output  [31:0]   flsh_cfg_rdata
   ,output           flsh_cfg_done
   ,output  [7:0]    flsh_cfg_status
   ,output  [1:0]    flsh_cfg_bresp
   ,output  [1:0]    flsh_cfg_rresp
   ,input            cfg_flsh_expand_enable
   ,input            cfg_flsh_expand_dir

  );

  assign ro_device[4:0] = 5'b0; 
  // --****************************************************************************
  // -- Signal declarations
  // --****************************************************************************

  // -- IBERT Ports
  wire     [7:0] rxlpmen_int;
  wire    [39:0] txpostcursor_int;
  wire    [39:0] txprecursor_int;
  wire    [39:0] txdiffctrl_int;
  wire    [23:0] rxrate_int;
  `ifdef BUFFER_ELASTIC
  wire     [7:0] drpen_int;
  wire     [7:0] drpwe_int;
  wire    [79:0] drpaddr_int;
  wire     [7:0] drpclk_int;
  wire   [127:0] drpdi_int;
  wire     [7:0] eyescanreset_int;
  wire   [127:0] drpdo_int;
  wire     [7:0] drprdy_int;
  `endif
  wire           init_done_int;
  wire     [3:0] init_retry_ctr_int;
  wire           gtwiz_reset_tx_done_vio_sync;
  wire           gtwiz_reset_rx_done_vio_sync;
  wire           gtwiz_buffbypass_tx_done_vio_sync;
  wire           gtwiz_buffbypass_rx_done_vio_sync;
  wire           gtwiz_buffbypass_tx_error_vio_sync;
  wire           gtwiz_buffbypass_rx_error_vio_sync;
  wire           hb_gtwiz_reset_all_vio_int;
  wire           hb0_gtwiz_reset_tx_pll_and_datapath_int;
  wire           hb0_gtwiz_reset_tx_datapath_int;
  wire           hb_gtwiz_reset_rx_pll_and_datapath_vio_int;
  wire           hb_gtwiz_reset_rx_datapath_vio_int;

  // -- DLX to TLX Parser Interface
  wire            dlx_tlx_flit_valid;
  wire    [511:0] dlx_tlx_flit;
  wire            dlx_tlx_flit_crc_err;
  wire            dlx_tlx_link_up;

  // -- TLX Framer to DLX Interface
  wire      [2:0] dlx_tlx_init_flit_depth;
  wire            dlx_tlx_flit_credit;
  wire            tlx_dlx_flit_valid;
  wire    [511:0] tlx_dlx_flit;
  wire      [3:0] tlx_dlx_debug_encode;
  wire     [31:0] tlx_dlx_debug_info;
  wire     [31:0] dlx_config_info;

  // -- Miscellaneous
  wire            clock_156_25;
  wire            send_first;
  wire            reset_afu_din;
  wire            reset_tlx_din;
  wire            dlx_tlx_link_up_din;
  reg             reset_afu_q;
  reg             reset_tlx_q;
  reg             dlx_tlx_link_up_q;
  wire [2:0]      unused;

  //-- Flash output interface
`ifndef FLASH
  assign flsh_cfg_rdata  = {32{1'b0}};
  assign flsh_cfg_done   = { 1{1'b0}};
  assign flsh_cfg_status = { 8{1'b0}};
  assign flsh_cfg_bresp  = { 2{1'b0}};
  assign flsh_cfg_rresp  = { 2{1'b0}};
`endif

  wire            spi_clk_div_2;



  // -- ********************************************************************************************************************************
  // -- CLOCKS & RESET
  // -- ********************************************************************************************************************************

  assign send_first          =  1'b0;  // -- '0' = receive data before sending, '1' = send data immediately after reset
  assign reset_afu_din       = dlx_tlx_link_up;
  assign reset_tlx_din       = dlx_tlx_link_up;
  assign dlx_tlx_link_up_din = dlx_tlx_link_up;
  always@(posedge clock_tlx) begin
       reset_afu_q       <= reset_afu_din;
       reset_tlx_q       <= reset_tlx_din;
       dlx_tlx_link_up_q <= dlx_tlx_link_up_din;
  end

  vio_reset_n vio_reset_n_inst_tlx
    (
      .clk        ( clock_tlx ),       // -- input
      .probe_in0  ( dlx_tlx_link_up ), // -- input wire [0 : 0] probe_in0
      .probe_in1  ( tlx_afu_ready ),   // -- input wire [0 : 0] probe_in1
      .probe_out0 ( unused[2] )        // -- output
    );

assign reset_n = reset_afu_q;

DLx_phy_vio_0 DLx_phy_vio_0_inst (
   .clk        (clock_156_25)                               // -- [0:0] < input
  ,.probe_in0  (ocde)                                       // -- [0:0] < input
  ,.probe_in1  (1'b0)                                       // -- [0:0] < input
  ,.probe_in2  (init_done_int)                              // -- [0:0] < input
  ,.probe_in3  (init_retry_ctr_int)                         // -- [3:0] < input
  ,.probe_in4  (8'b0)                                       // -- [7:0] < input
  ,.probe_in5  (8'b0)                                       // -- [7:0] < input
  ,.probe_in6  (8'b0)                                       // -- [7:0] < input
  ,.probe_in7  (gtwiz_reset_tx_done_vio_sync)               // -- [0:0] < input
  ,.probe_in8  (gtwiz_reset_rx_done_vio_sync)               // -- [0:0] < input
  ,.probe_in9  (gtwiz_buffbypass_tx_done_vio_sync)          // -- [0:0] < input
  ,.probe_in10 (gtwiz_buffbypass_rx_done_vio_sync)          // -- [0:0] < input
  ,.probe_in11 (gtwiz_buffbypass_tx_error_vio_sync)         // -- [0:0] < input
  ,.probe_in12 (gtwiz_buffbypass_rx_error_vio_sync)         // -- [0:0] < input
  ,.probe_out0 (hb_gtwiz_reset_all_vio_int)                 // -- [0:0] > output
  ,.probe_out1 (unused[0])                                  // -- [0:0] > output
  ,.probe_out2 (hb0_gtwiz_reset_tx_pll_and_datapath_int)    // -- [0:0] > output
  ,.probe_out3 (hb0_gtwiz_reset_tx_datapath_int)            // -- [0:0] > output
  ,.probe_out4 (hb_gtwiz_reset_rx_pll_and_datapath_vio_int) // -- [0:0] > output
  ,.probe_out5 (hb_gtwiz_reset_rx_datapath_vio_int)         // -- [0:0] > output
  ,.probe_out6 (unused[1])                                  // -- [0:0] > output
);


  // -- ********************************************************************************************************************************
  // -- DLX & PHY
  // -- ********************************************************************************************************************************

  dlx_phy_wrap dlx_phy
    (
      // -- Differential reference clock inputs
       .mgtrefclk1_x0y0_p                           ( mgtrefclk1_x0y0_p )             // -- input
      ,.mgtrefclk1_x0y0_n                           ( mgtrefclk1_x0y0_n )             // -- input
      ,.mgtrefclk1_x0y1_p                           ( mgtrefclk1_x0y1_p )             // -- input
      ,.mgtrefclk1_x0y1_n                           ( mgtrefclk1_x0y1_n )             // -- input
      ,.freerun_clk_p                               ( freerun_clk_p )                 // -- input
      ,.freerun_clk_n                               ( freerun_clk_n )                 // -- input

      ,.ch0_gtyrxn_in                               ( ch0_gtyrxn_in )                 // -- input
      ,.ch0_gtyrxp_in                               ( ch0_gtyrxp_in )                 // -- input
      ,.ch0_gtytxn_out                              ( ch0_gtytxn_out )                // -- output
      ,.ch0_gtytxp_out                              ( ch0_gtytxp_out )                // -- output
      ,.ch1_gtyrxn_in                               ( ch1_gtyrxn_in )                 // -- input
      ,.ch1_gtyrxp_in                               ( ch1_gtyrxp_in )                 // -- input
      ,.ch1_gtytxn_out                              ( ch1_gtytxn_out )                // -- output
      ,.ch1_gtytxp_out                              ( ch1_gtytxp_out )                // -- output
      ,.ch2_gtyrxn_in                               ( ch2_gtyrxn_in )                 // -- input
      ,.ch2_gtyrxp_in                               ( ch2_gtyrxp_in )                 // -- input
      ,.ch2_gtytxn_out                              ( ch2_gtytxn_out )                // -- output
      ,.ch2_gtytxp_out                              ( ch2_gtytxp_out )                // -- output
      ,.ch3_gtyrxn_in                               ( ch3_gtyrxn_in )                 // -- input
      ,.ch3_gtyrxp_in                               ( ch3_gtyrxp_in )                 // -- input
      ,.ch3_gtytxn_out                              ( ch3_gtytxn_out )                // -- output
      ,.ch3_gtytxp_out                              ( ch3_gtytxp_out )                // -- output
      ,.ch4_gtyrxn_in                               ( ch4_gtyrxn_in )                 // -- input
      ,.ch4_gtyrxp_in                               ( ch4_gtyrxp_in )                 // -- input
      ,.ch4_gtytxn_out                              ( ch4_gtytxn_out )                // -- output
      ,.ch4_gtytxp_out                              ( ch4_gtytxp_out )                // -- output
      ,.ch5_gtyrxn_in                               ( ch5_gtyrxn_in )                 // -- input
      ,.ch5_gtyrxp_in                               ( ch5_gtyrxp_in )                 // -- input
      ,.ch5_gtytxn_out                              ( ch5_gtytxn_out )                // -- output
      ,.ch5_gtytxp_out                              ( ch5_gtytxp_out )                // -- output
      ,.ch6_gtyrxn_in                               ( ch6_gtyrxn_in )                 // -- input
      ,.ch6_gtyrxp_in                               ( ch6_gtyrxp_in )                 // -- input
      ,.ch6_gtytxn_out                              ( ch6_gtytxn_out )                // -- output
      ,.ch6_gtytxp_out                              ( ch6_gtytxp_out )                // -- output
      ,.ch7_gtyrxn_in                               ( ch7_gtyrxn_in )                 // -- input
      ,.ch7_gtyrxp_in                               ( ch7_gtyrxp_in )                 // -- input
      ,.ch7_gtytxn_out                              ( ch7_gtytxn_out )                // -- output
      ,.ch7_gtytxp_out                              ( ch7_gtytxp_out )                // -- output

      ,.dlx_config_info                             ( dlx_config_info[31:0] )         // -- output
      ,.ro_dlx_version                              ( ro_dlx_version[31:0] )          // -- output [31:0]
      ,.dlx_tlx_init_flit_depth                     ( dlx_tlx_init_flit_depth[2:0] )  // -- output
      ,.dlx_tlx_flit                                ( dlx_tlx_flit[511:0] )           // -- output
      ,.dlx_tlx_flit_crc_err                        ( dlx_tlx_flit_crc_err )          // -- output
      ,.dlx_tlx_flit_credit                         ( dlx_tlx_flit_credit )           // -- output
      ,.dlx_tlx_flit_valid                          ( dlx_tlx_flit_valid )            // -- output
      ,.dlx_tlx_link_up                             ( dlx_tlx_link_up )               // -- output

      ,.tlx_dlx_debug_encode                        ( tlx_dlx_debug_encode[3:0] )     // -- input
      ,.tlx_dlx_debug_info                          ( tlx_dlx_debug_info[31:0] )      // -- input
      ,.tlx_dlx_flit                                ( tlx_dlx_flit[511:0] )           // -- input
      ,.tlx_dlx_flit_valid                          ( tlx_dlx_flit_valid )            // -- input

      ,.send_first                                  ( send_first )                    // -- input
      ,.ocde                                        ( ocde )                          // -- input
      ,.tx_clk_402MHz                               ( clock_tlx )                     // -- output
      ,.tx_clk_201MHz                               ( clock_afu )                     // -- output
      ,.hb_gtwiz_reset_clk_freerun_buf_int          ( clock_156_25 )                  // -- output
`ifdef THYMESISFLOW
      ,.init_clk_100_freerun_buf_int                ( clock_free_running_100)     
`endif      
      ,.init_done_int                               ( init_done_int )                               // -- output
      ,.init_retry_ctr_int                          ( init_retry_ctr_int[3:0] )                     // -- output
      ,.gtwiz_reset_tx_done_vio_sync                ( gtwiz_reset_tx_done_vio_sync )                // -- output
      ,.gtwiz_reset_rx_done_vio_sync                ( gtwiz_reset_rx_done_vio_sync )                // -- output
      ,.gtwiz_buffbypass_tx_done_vio_sync           ( gtwiz_buffbypass_tx_done_vio_sync )           // -- output
      ,.gtwiz_buffbypass_rx_done_vio_sync           ( gtwiz_buffbypass_rx_done_vio_sync )           // -- output
      ,.gtwiz_buffbypass_tx_error_vio_sync          ( gtwiz_buffbypass_tx_error_vio_sync )          // -- output
      ,.gtwiz_buffbypass_rx_error_vio_sync          ( gtwiz_buffbypass_rx_error_vio_sync )          // -- output
      ,.hb_gtwiz_reset_all_vio_int                  ( hb_gtwiz_reset_all_vio_int )                  // -- input
      ,.hb0_gtwiz_reset_tx_pll_and_datapath_int     ( hb0_gtwiz_reset_tx_pll_and_datapath_int )     // -- input
      ,.hb0_gtwiz_reset_tx_datapath_int             ( hb0_gtwiz_reset_tx_datapath_int )             // -- input
      ,.hb_gtwiz_reset_rx_pll_and_datapath_vio_int  ( hb_gtwiz_reset_rx_pll_and_datapath_vio_int )  // -- input
      ,.hb_gtwiz_reset_rx_datapath_vio_int          ( hb_gtwiz_reset_rx_datapath_vio_int )          // -- input

       // -- IBERT Logic
      ,.rxlpmen_in                                  ( rxlpmen_int[7:0] )                            // -- input
      ,.rxrate_in                                   ( rxrate_int[23:0] )                            // -- input
      ,.txdiffctrl_in                               ( txdiffctrl_int[39:0] )                        // -- input
      ,.txpostcursor_in                             ( txpostcursor_int[39:0] )                      // -- input
      ,.txprecursor_in                              ( txprecursor_int[39:0] )                        // -- input

      `ifdef BUFFER_ELASTIC
      ,.drpaddr_in                                  ( drpaddr_int[79:0] )                           // -- input
      ,.drpclk_in                                   ( drpclk_int[7:0] )                             // -- input
      ,.drpdi_in                                    ( drpdi_int[127:0] )                            // -- input
      ,.drpen_in                                    ( drpen_int[7:0] )                              // -- input
      ,.drpwe_in                                    ( drpwe_int[7:0] )                              // -- input
      ,.eyescanreset_in                             ( eyescanreset_int[7:0] )                       // -- input
      ,.drpdo_out                                   ( drpdo_int[127:0] )                            // -- output
      ,.drprdy_out                                  ( drprdy_int[7:0] )                              // -- output
      `endif
    );


  // -- ********************************************************************************************************************************
  // -- TLX
  // -- ********************************************************************************************************************************

  ocx_tlx_top  tlx
    (
      // -- Clocks, Reset, Ready
      .clock                            (clock_tlx                       ) // -- input
     ,.reset_n                          (reset_tlx_q                     ) // -- input
     ,.tlx_afu_ready                    (tlx_afu_ready                   ) // output
     ,.afu_tlx_cmd_initial_credit       (afu_tlx_cmd_initial_credit      ) // input  [6:0]
     ,.afu_tlx_cmd_credit               (afu_tlx_cmd_credit              ) // input
     ,.tlx_afu_cmd_valid                (tlx_afu_cmd_valid               ) // output
     ,.tlx_afu_cmd_opcode               (tlx_afu_cmd_opcode              ) // output [7:0]
     ,.tlx_afu_cmd_dl                   (tlx_afu_cmd_dl                  ) // output [1:0]
     ,.tlx_afu_cmd_end                  (tlx_afu_cmd_end                 ) // output
     ,.tlx_afu_cmd_pa                   (tlx_afu_cmd_pa                  ) // output [63:0]
     ,.tlx_afu_cmd_flag                 (tlx_afu_cmd_flag                ) // output [3:0]
     ,.tlx_afu_cmd_os                   (tlx_afu_cmd_os                  ) // output
     ,.tlx_afu_cmd_capptag              (tlx_afu_cmd_capptag             ) // output [15:0]
     ,.tlx_afu_cmd_pl                   (tlx_afu_cmd_pl                  ) // output [2:0]
     ,.tlx_afu_cmd_be                   (tlx_afu_cmd_be                  ) // output [63:0]
     ,.cfg_tlx_initial_credit           (cfg_tlx_initial_credit          ) // input  [3:0]
     ,.cfg_tlx_credit_return            (cfg_tlx_credit_return           ) // input
     ,.tlx_cfg_valid                    (tlx_cfg_valid                   ) // output
     ,.tlx_cfg_opcode                   (tlx_cfg_opcode                  ) // output [7:0]
     ,.tlx_cfg_pa                       (tlx_cfg_pa                      ) // output [63:0]
     ,.tlx_cfg_t                        (tlx_cfg_t                       ) // output
     ,.tlx_cfg_pl                       (tlx_cfg_pl                      ) // output [2:0]
     ,.tlx_cfg_capptag                  (tlx_cfg_capptag                 ) // output [15:0]
     ,.tlx_cfg_data_bus                 (tlx_cfg_data_bus                ) // output [31:0]
     ,.tlx_cfg_data_bdi                 (tlx_cfg_data_bdi                ) // output
     ,.afu_tlx_resp_initial_credit      (afu_tlx_resp_initial_credit     ) // input  [6:0]
     ,.afu_tlx_resp_credit              (afu_tlx_resp_credit             ) // input
     ,.tlx_afu_resp_valid               (tlx_afu_resp_valid              ) // output
     ,.tlx_afu_resp_opcode              (tlx_afu_resp_opcode             ) // output [7:0]
     ,.tlx_afu_resp_afutag              (tlx_afu_resp_afutag             ) // output [15:0]
     ,.tlx_afu_resp_code                (tlx_afu_resp_code               ) // output [3:0]
     ,.tlx_afu_resp_pg_size             (tlx_afu_resp_pg_size            ) // output [5:0]
     ,.tlx_afu_resp_dl                  (tlx_afu_resp_dl                 ) // output [1:0]
     ,.tlx_afu_resp_dp                  (tlx_afu_resp_dp                 ) // output [1:0]
     ,.tlx_afu_resp_host_tag            (tlx_afu_resp_host_tag           ) // output [23:0]
     ,.tlx_afu_resp_cache_state         (tlx_afu_resp_cache_state        ) // output [3:0]
     ,.tlx_afu_resp_addr_tag            (tlx_afu_resp_addr_tag           ) // output [17:0]
     ,.afu_tlx_cmd_rd_req               (afu_tlx_cmd_rd_req              ) // input
     ,.afu_tlx_cmd_rd_cnt               (afu_tlx_cmd_rd_cnt              ) // input  [2:0]
     ,.tlx_afu_cmd_data_valid           (tlx_afu_cmd_data_valid          ) // output
     ,.tlx_afu_cmd_data_bus             (tlx_afu_cmd_data_bus            ) // output [511:0]
     ,.tlx_afu_cmd_data_bdi             (tlx_afu_cmd_data_bdi            ) // output
     ,.afu_tlx_resp_rd_req              (afu_tlx_resp_rd_req             ) // input
     ,.afu_tlx_resp_rd_cnt              (afu_tlx_resp_rd_cnt             ) // input  [2:0]
     ,.tlx_afu_resp_data_valid          (tlx_afu_resp_data_valid         ) // output
     ,.tlx_afu_resp_data_bus            (tlx_afu_resp_data_bus           ) // output [511:0]
     ,.tlx_afu_resp_data_bdi            (tlx_afu_resp_data_bdi           ) // output
     ,.tlx_afu_cmd_initial_credit       (tlx_afu_cmd_initial_credit      ) // output [3:0]
     ,.tlx_afu_cmd_credit               (tlx_afu_cmd_credit              ) // output
     ,.afu_tlx_cmd_valid                (afu_tlx_cmd_valid               ) // input
     ,.afu_tlx_cmd_opcode               (afu_tlx_cmd_opcode              ) // input  [7:0]
     ,.afu_tlx_cmd_actag                (afu_tlx_cmd_actag               ) // input  [11:0]
     ,.afu_tlx_cmd_stream_id            (afu_tlx_cmd_stream_id           ) // input  [3:0]
     ,.afu_tlx_cmd_ea_or_obj            (afu_tlx_cmd_ea_or_obj           ) // input  [67:0]
     ,.afu_tlx_cmd_afutag               (afu_tlx_cmd_afutag              ) // input  [15:0]
     ,.afu_tlx_cmd_dl                   (afu_tlx_cmd_dl                  ) // input  [1:0]
     ,.afu_tlx_cmd_pl                   (afu_tlx_cmd_pl                  ) // input  [2:0]
     ,.afu_tlx_cmd_os                   (afu_tlx_cmd_os                  ) // input
     ,.afu_tlx_cmd_be                   (afu_tlx_cmd_be                  ) // input  [63:0]
     ,.afu_tlx_cmd_flag                 (afu_tlx_cmd_flag                ) // input  [3:0]
     ,.afu_tlx_cmd_endian               (afu_tlx_cmd_endian              ) // input
     ,.afu_tlx_cmd_bdf                  (afu_tlx_cmd_bdf                 ) // input  [15:0]
     ,.afu_tlx_cmd_pasid                (afu_tlx_cmd_pasid               ) // input  [19:0]
     ,.afu_tlx_cmd_pg_size              (afu_tlx_cmd_pg_size             ) // input  [5:0]
     ,.tlx_afu_cmd_data_initial_credit  (tlx_afu_cmd_data_initial_credit ) // output [5:0]
     ,.tlx_afu_cmd_data_credit          (tlx_afu_cmd_data_credit         ) // output
     ,.afu_tlx_cdata_valid              (afu_tlx_cdata_valid             ) // input
     ,.afu_tlx_cdata_bus                (afu_tlx_cdata_bus               ) // input  [511:0]
     ,.afu_tlx_cdata_bdi                (afu_tlx_cdata_bdi               ) // input
     ,.tlx_afu_resp_initial_credit      (tlx_afu_resp_initial_credit     ) // output [3:0]
     ,.tlx_afu_resp_credit              (tlx_afu_resp_credit             ) // output
     ,.afu_tlx_resp_valid               (afu_tlx_resp_valid              ) // input
     ,.afu_tlx_resp_opcode              (afu_tlx_resp_opcode             ) // input  [7:0]
     ,.afu_tlx_resp_dl                  (afu_tlx_resp_dl                 ) // input  [1:0]
     ,.afu_tlx_resp_capptag             (afu_tlx_resp_capptag            ) // input  [15:0]
     ,.afu_tlx_resp_dp                  (afu_tlx_resp_dp                 ) // input  [1:0]
     ,.afu_tlx_resp_code                (afu_tlx_resp_code               ) // input  [3:0]
     ,.tlx_afu_resp_data_initial_credit (tlx_afu_resp_data_initial_credit) // output [5:0]
     ,.tlx_afu_resp_data_credit         (tlx_afu_resp_data_credit        ) // output
     ,.afu_tlx_rdata_valid              (afu_tlx_rdata_valid             ) // input
     ,.afu_tlx_rdata_bus                (afu_tlx_rdata_bus               ) // input  [511:0]
     ,.afu_tlx_rdata_bdi                (afu_tlx_rdata_bdi               ) // input
     ,.cfg_tlx_resp_valid               (cfg_tlx_resp_valid              ) // input
     ,.cfg_tlx_resp_opcode              (cfg_tlx_resp_opcode             ) // input  [7:0]
     ,.cfg_tlx_resp_capptag             (cfg_tlx_resp_capptag            ) // input  [15:0]
     ,.cfg_tlx_resp_code                (cfg_tlx_resp_code               ) // input  [3:0]
     ,.tlx_cfg_resp_ack                 (tlx_cfg_resp_ack                ) // output
     ,.cfg_tlx_rdata_offset             (cfg_tlx_rdata_offset            ) // input  [3:0]
     ,.cfg_tlx_rdata_bus                (cfg_tlx_rdata_bus               ) // input  [31:0]
     ,.cfg_tlx_rdata_bdi                (cfg_tlx_rdata_bdi               ) // input
     ,.dlx_tlx_flit_valid               (dlx_tlx_flit_valid              ) // input
     ,.dlx_tlx_flit                     (dlx_tlx_flit                    ) // input  [511:0]
     ,.dlx_tlx_flit_crc_err             (dlx_tlx_flit_crc_err            ) // input
     ,.dlx_tlx_link_up                  (dlx_tlx_link_up_q               ) // input
     ,.dlx_tlx_flit_credit              (dlx_tlx_flit_credit             ) // input
     ,.dlx_tlx_init_flit_depth          (dlx_tlx_init_flit_depth         ) // input  [2:0]
     ,.tlx_dlx_flit_valid               (tlx_dlx_flit_valid              ) // output
     ,.tlx_dlx_flit                     (tlx_dlx_flit                    ) // output [511:0]
     ,.tlx_dlx_debug_encode             (tlx_dlx_debug_encode            ) // output [3:0]
     ,.tlx_dlx_debug_info               (tlx_dlx_debug_info              ) // output [31:0]
     ,.dlx_tlx_dlx_config_info          (dlx_config_info                 ) // input  [31:0]
     ,.cfg_tlx_xmit_tmpl_config_0       (cfg_tlx_xmit_tmpl_config_0      ) // input
     ,.cfg_tlx_xmit_tmpl_config_1       (cfg_tlx_xmit_tmpl_config_1      ) // input
     ,.cfg_tlx_xmit_tmpl_config_2       (cfg_tlx_xmit_tmpl_config_2      ) // input
     ,.cfg_tlx_xmit_tmpl_config_3       (cfg_tlx_xmit_tmpl_config_3      ) // input
     ,.cfg_tlx_xmit_rate_config_0       (cfg_tlx_xmit_rate_config_0      ) // input  [3:0]
     ,.cfg_tlx_xmit_rate_config_1       (cfg_tlx_xmit_rate_config_1      ) // input  [3:0]
     ,.cfg_tlx_xmit_rate_config_2       (cfg_tlx_xmit_rate_config_2      ) // input  [3:0]
     ,.cfg_tlx_xmit_rate_config_3       (cfg_tlx_xmit_rate_config_3      ) // input  [3:0]
     ,.tlx_cfg_in_rcv_tmpl_capability_0 (tlx_cfg_in_rcv_tmpl_capability_0) // output
     ,.tlx_cfg_in_rcv_tmpl_capability_1 (tlx_cfg_in_rcv_tmpl_capability_1) // output
     ,.tlx_cfg_in_rcv_tmpl_capability_2 (tlx_cfg_in_rcv_tmpl_capability_2) // output
     ,.tlx_cfg_in_rcv_tmpl_capability_3 (tlx_cfg_in_rcv_tmpl_capability_3) // output
     ,.tlx_cfg_in_rcv_rate_capability_0 (tlx_cfg_in_rcv_rate_capability_0) // output [3:0]
     ,.tlx_cfg_in_rcv_rate_capability_1 (tlx_cfg_in_rcv_rate_capability_1) // output [3:0]
     ,.tlx_cfg_in_rcv_rate_capability_2 (tlx_cfg_in_rcv_rate_capability_2) // output [3:0]
     ,.tlx_cfg_in_rcv_rate_capability_3 (tlx_cfg_in_rcv_rate_capability_3) // output [3:0]
     ,.tlx_cfg_oc3_tlx_version          (ro_tlx_version                  ) // output [31:0]
);


  // -- ********************************************************************************************************************************
  // -- VPD
  // -- ********************************************************************************************************************************

  vpd_stub  vpd
    (
      // -- Miscellaneous Ports
      .clock                                       ( clock_tlx ),                              // -- input
      .reset                                       ( reset_afu_q ),                            // -- input

      .cfg_vpd_rden                                ( cfg_vpd_rden ),                           // -- input
      .cfg_vpd_wren                                ( cfg_vpd_wren ),                           // -- input
      .cfg_vpd_addr                                ( cfg_vpd_addr[14:0] ),                     // -- input
      .cfg_vpd_wdata                               ( cfg_vpd_wdata[31:0] ),                    // -- input

      .vpd_cfg_done                                ( vpd_cfg_done ),                           // -- output
      .vpd_cfg_rdata                               ( vpd_cfg_rdata[31:0] ),                    // -- output

      // -- Error indicator
      .vpd_err_unimplemented_addr                  ( vpd_err_unimplemented_addr )              // -- output

    );

`ifdef FLASH
  flash_sub_system FLASH
    (
      // -- Outputs
      .spi_clk_div_2                         ( spi_clk_div_2 ),          // -- output
      .axi_cfg_rdata                         ( flsh_cfg_rdata[31:0] ),   // -- output
      .axi_cfg_done                          ( flsh_cfg_done ),          // -- output
      .axi_cfg_bresp                         ( flsh_cfg_bresp[1:0] ),    // -- output
      .axi_cfg_rresp                         ( flsh_cfg_rresp[1:0] ),    // -- output
      .axi_cfg_status                        ( flsh_cfg_status[7:0] ),   // -- output
      // -- Inouts
      .FPGA_FLASH_CE2_L                      ( FPGA_FLASH_CE2_L ),       // -- inout
      .FPGA_FLASH_DQ4                        ( FPGA_FLASH_DQ4 ),         // -- inout
      .FPGA_FLASH_DQ5                        ( FPGA_FLASH_DQ5 ),         // -- inout
      .FPGA_FLASH_DQ6                        ( FPGA_FLASH_DQ6 ),         // -- inout
      .FPGA_FLASH_DQ7                        ( FPGA_FLASH_DQ7 ),         // -- inout
      // -- Inputs
      .axi_clk                               ( clock_tlx ),              // -- input
      .spi_clk                               ( clock_afu ),              // -- input
      .icap_clk                              ( spi_clk_div_2 ),          // -- input
      .reset_n                               ( reset_afu_q ),            // -- input
      .cfg_axi_devsel                        ( cfg_flsh_devsel[1:0] ),   // -- input
      .cfg_axi_addr                          ( cfg_flsh_addr[13:0] ),    // -- input
      .cfg_axi_wren                          ( cfg_flsh_wren ),          // -- input
      .cfg_axi_wdata                         ( cfg_flsh_wdata[31:0] ),   // -- input
      .cfg_axi_rden                          ( cfg_flsh_rden ),          // -- input
      .data_expand_enable                    ( cfg_flsh_expand_enable ), // -- input
      .data_expand_dir                       ( cfg_flsh_expand_dir )     // -- input
    );
`endif

assign rxrate_int[23:0]       = {8{3'b000}};
assign txdiffctrl_int[39:0]   = {8{5'b11111}};
assign txprecursor_int[39:0]  = {8{5'b00010}};
assign txpostcursor_int[39:0] = {8{5'b00000}};

`ifdef DFE
   assign rxlpmen_int[ 7:0]      = {8{1'b0}}; //-- DFE ON
`else
   assign rxlpmen_int[ 7:0]      = {8{1'b1}}; //-- DFE OFF
`endif



endmodule //-- oc_bsp
