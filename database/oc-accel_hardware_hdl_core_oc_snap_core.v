// This program was cloned from: https://github.com/OpenCAPI/oc-accel
// License: Apache License 2.0

/*
 * Copyright 2019 International Business Machines
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
`timescale 1ns/1ps

`include "snap_global_vars.v"

module oc_snap_core(
//
//Clocks&Reset
input                                   clock_tlx                        ,
input                                   clock_afu                        ,
input                                   reset_snap                       ,

//configuration
input [3:0]                             cfg_backoff_timer                ,
input [7:0]                             cfg_bdf_bus                      ,
input [4:0]                             cfg_bdf_device                   ,
input [2:0]                             cfg_bdf_function                 ,
input [11:0]                            cfg_actag_base                   ,
input [19:0]                            cfg_pasid_base                   ,
input [4:0]                             cfg_pasid_length                 ,
input [63:0]                            cfg_f1_mmio_bar0                 ,
input [63:0]                            cfg_f1_mmio_bar0_mask            ,

//AFU-TLXcommandtransmitinterface
output                                  afu_tlx_cmd_valid                ,
output [7:0]                            afu_tlx_cmd_opcode               ,
output [11:0]                           afu_tlx_cmd_actag                ,
output [3:0]                            afu_tlx_cmd_stream_id            ,
output [67:0]                           afu_tlx_cmd_ea_or_obj            ,
output [15:0]                           afu_tlx_cmd_afutag               ,
output [1:0]                            afu_tlx_cmd_dl                   ,
output [2:0]                            afu_tlx_cmd_pl                   ,
output                                  afu_tlx_cmd_os                   ,
output [63:0]                           afu_tlx_cmd_be                   ,
output [3:0]                            afu_tlx_cmd_flag                 ,
output                                  afu_tlx_cmd_endian               ,
output [15:0]                           afu_tlx_cmd_bdf                  ,
output [19:0]                           afu_tlx_cmd_pasid                ,
output [5:0]                            afu_tlx_cmd_pg_size              ,
output                                  afu_tlx_cdata_valid              ,
output                                  afu_tlx_cdata_bdi                ,
output [511:0]                          afu_tlx_cdata_bus                ,
input                                   tlx_afu_cmd_credit               ,
input                                   tlx_afu_cmd_data_credit          ,
input [3:0]                             tlx_afu_cmd_initial_credit       ,
input [5:0]                             tlx_afu_cmd_data_initial_credit  ,
//
//TLX-AFUresponsereceiveinterface
input                                   tlx_afu_resp_valid               ,
input [7:0]                             tlx_afu_resp_opcode              ,
input [15:0]                            tlx_afu_resp_afutag              ,
input [3:0]                             tlx_afu_resp_code                ,
input [1:0]                             tlx_afu_resp_dl                  ,
input [1:0]                             tlx_afu_resp_dp                  ,
output                                  afu_tlx_resp_rd_req              ,
output [2:0]                            afu_tlx_resp_rd_cnt              ,
input                                   tlx_afu_resp_data_valid          ,
input                                   tlx_afu_resp_data_bdi            ,
input [511:0]                           tlx_afu_resp_data_bus            ,
output                                  afu_tlx_resp_credit              ,
output [6:0]                            afu_tlx_resp_initial_credit      ,
//
//TLX-AFUcommandreceiveinterface
input                                   tlx_afu_cmd_valid                ,
input [7:0]                             tlx_afu_cmd_opcode               ,
input [15:0]                            tlx_afu_cmd_capptag              ,
input [1:0]                             tlx_afu_cmd_dl                   ,
input [2:0]                             tlx_afu_cmd_pl                   ,
input [63:0]                            tlx_afu_cmd_be                   ,
input                                   tlx_afu_cmd_end                  ,
input [63:0]                            tlx_afu_cmd_pa                   ,
input [3:0]                             tlx_afu_cmd_flag                 ,
input                                   tlx_afu_cmd_os                   ,

output                                  afu_tlx_cmd_credit               ,
output [6:0]                            afu_tlx_cmd_initial_credit       ,

output                                  afu_tlx_cmd_rd_req               ,
output [2:0]                            afu_tlx_cmd_rd_cnt               ,

input                                   tlx_afu_cmd_data_valid           ,
input                                   tlx_afu_cmd_data_bdi             ,
input [511:0]                           tlx_afu_cmd_data_bus             ,
//
//AFU-TLXresponsetransmitinterface
output                                  afu_tlx_resp_valid               ,
output [7:0]                            afu_tlx_resp_opcode              ,
output [1:0]                            afu_tlx_resp_dl                  ,
output [15:0]                           afu_tlx_resp_capptag             ,
output [1:0]                            afu_tlx_resp_dp                  ,
output [3:0]                            afu_tlx_resp_code                ,

output                                  afu_tlx_rdata_valid              ,
output                                  afu_tlx_rdata_bdi                ,
output [511:0]                          afu_tlx_rdata_bus                ,

input                                   tlx_afu_resp_credit              ,
input                                   tlx_afu_resp_data_credit         ,
input [3:0]                             tlx_afu_resp_initial_credit      ,
input [5:0]                             tlx_afu_resp_data_initial_credit ,
//
//ACTIONInterface
//misc
output                                  soft_reset_action                 ,
//
`ifndef ENABLE_ODMA
//MMIOtoconverteroraction
//xk_d_o:OUTXK_D_T;
output [`AXI_LITE_AW-1:0]                lite_snap2conv_awaddr            ,
output [2:0]                            lite_snap2conv_awprot            ,
output                                  lite_snap2conv_awvalid           ,
output [`AXI_LITE_DW-1:0]                lite_snap2conv_wdata             ,
output [3:0]                            lite_snap2conv_wstrb             ,
output                                  lite_snap2conv_wvalid            ,
output                                  lite_snap2conv_bready            ,
output [`AXI_LITE_AW-1:0]                lite_snap2conv_araddr            ,
output [2:0]                            lite_snap2conv_arprot            ,
output                                  lite_snap2conv_arvalid           ,
output                                  lite_snap2conv_rready            ,

//kx_d_i:INKX_D_T;
input                                   lite_conv2snap_awready           ,
input                                   lite_conv2snap_wready            ,
input [1:0]                             lite_conv2snap_bresp             ,
input                                   lite_conv2snap_bvalid            ,
input                                   lite_conv2snap_arready           ,
input [`AXI_LITE_DW-1:0]                 lite_conv2snap_rdata             ,
input [1:0]                             lite_conv2snap_rresp             ,
input                                   lite_conv2snap_rvalid            ,

//dwidth_convertororactiontobridge
//sk_d:OUTSK_D_T;
output                                  mm_snap2conv_awready             ,
output                                  mm_snap2conv_wready              ,
output [`IDW-1:0]                        mm_snap2conv_bid                 ,
output [1:0]                            mm_snap2conv_bresp               ,
output                                  mm_snap2conv_bvalid              ,
output [`IDW-1:0]                        mm_snap2conv_rid                 ,
output [`AXI_MM_DW-1:0]                  mm_snap2conv_rdata               ,
output [1:0]                            mm_snap2conv_rresp               ,
output                                  mm_snap2conv_rlast               ,
output                                  mm_snap2conv_rvalid              ,
output                                  mm_snap2conv_arready             ,
output                                  int_req_ack                      ,

//ks_d:INKS_D_T
input [`IDW-1:0]                         mm_conv2snap_awid                ,
input [`AXI_MM_AW-1:0]                   mm_conv2snap_awaddr              ,
input [7:0]                             mm_conv2snap_awlen               ,
input [2:0]                             mm_conv2snap_awsize              ,
input [1:0]                             mm_conv2snap_awburst             ,
input                                   mm_conv2snap_awlock              ,
input [3:0]                             mm_conv2snap_awcache             ,
input [2:0]                             mm_conv2snap_awprot              ,
input [3:0]                             mm_conv2snap_awqos               ,
input [3:0]                             mm_conv2snap_awregion            ,
input [`AXI_AWUSER-1:0]                  mm_conv2snap_awuser              ,
input                                   mm_conv2snap_awvalid             ,
input [`AXI_MM_DW-1:0]                   mm_conv2snap_wdata               ,
input [(`AXI_MM_DW/8)-1:0]               mm_conv2snap_wstrb               ,
input                                   mm_conv2snap_wlast               ,
input                                   mm_conv2snap_wvalid              ,
input                                   mm_conv2snap_bready              ,
output[`AXI_AWUSER-1:0]                  mm_snap2conv_buser              ,
input [`IDW-1:0]                         mm_conv2snap_arid                ,
input [`AXI_MM_AW-1:0]                   mm_conv2snap_araddr              ,
input [7:0]                             mm_conv2snap_arlen               ,
input [2:0]                             mm_conv2snap_arsize              ,
input [1:0]                             mm_conv2snap_arburst             ,
input [`AXI_ARUSER-1:0]                  mm_conv2snap_aruser              ,
input                                   mm_conv2snap_arlock              ,
input [3:0]                             mm_conv2snap_arcache             ,
input [2:0]                             mm_conv2snap_arprot              ,
input [3:0]                             mm_conv2snap_arqos               ,
input [3:0]                             mm_conv2snap_arregion            ,
input                                   mm_conv2snap_arvalid             ,
input                                   mm_conv2snap_rready              ,
output[`AXI_AWUSER-1:0]                  mm_snap2conv_ruser              ,
input                                   int_req                          ,
input [`INT_BITS-1:0]                    int_src                          ,
input [`CTXW-1:0]                        int_ctx
//Note: here is the end of port list

`else
    `ifdef ENABLE_ODMA_ST_MODE
        input                                   m_axis_tready     ,
        output                                  m_axis_tlast      ,
        output [`AXI_ST_DW - 1:0]                m_axis_tdata      ,
        output [`AXI_ST_DW/8 - 1:0]              m_axis_tkeep      ,
        output                                  m_axis_tvalid     ,
        output [`IDW - 1:0]                     m_axis_tid      ,
        output [`AXI_ST_USER - 1:0]              m_axis_tuser      ,
        output                                  s_axis_tready     ,
        input                                   s_axis_tlast      ,
        input  [`AXI_ST_DW - 1:0]                s_axis_tdata      ,
        input  [`AXI_ST_DW/8 - 1:0]              s_axis_tkeep      ,
        input                                   s_axis_tvalid     ,
        input  [`IDW - 1:0]                     s_axis_tid        ,
        input  [`AXI_ST_USER - 1:0]              s_axis_tuser      ,
    `else
        //ODMAmode:AXI4-MMInterface
        output [`AXI_MM_AW-1:0]                  axi_mm_awaddr                    ,
        output [`IDW-1:0]                        axi_mm_awid                      ,
        output [7:0]                            axi_mm_awlen                     ,
        output [2:0]                            axi_mm_awsize                    ,
        output [1:0]                            axi_mm_awburst                   ,
        output [2:0]                            axi_mm_awprot                    ,
        output [3:0]                            axi_mm_awqos                     ,
        output [3:0]                            axi_mm_awregion                  ,
        output [`AXI_AWUSER-1:0]                 axi_mm_awuser                    ,
        output                                  axi_mm_awvalid                   ,
        output [1:0]                            axi_mm_awlock                    ,
        output [3:0]                            axi_mm_awcache                   ,
        input                                   axi_mm_awready                   ,
        output [`AXI_MM_DW-1:0]                  axi_mm_wdata                     ,
        output                                  axi_mm_wlast                     ,
        output [`AXI_MM_DW/8-1:0]                axi_mm_wstrb                     ,
        output                                  axi_mm_wvalid                    ,
        output [`AXI_WUSER-1:0]                  axi_mm_wuser                     ,
        input                                   axi_mm_wready                    ,
        input                                   axi_mm_bvalid                    ,
        input [1:0]                             axi_mm_bresp                     ,
        input [`IDW-1:0]                         axi_mm_bid                       ,
        input [`AXI_BUSER-1:0]                   axi_mm_buser                     ,
        output                                  axi_mm_bready                    ,
        output [`AXI_MM_AW-1:0]                  axi_mm_araddr                    ,
        output [1:0]                            axi_mm_arburst                   ,
        output [3:0]                            axi_mm_arcache                   ,
        output [`IDW-1:0]                        axi_mm_arid                      ,
        output [7:0]                            axi_mm_arlen                     ,
        output [1:0]                            axi_mm_arlock                    ,
        output [2:0]                            axi_mm_arprot                    ,
        output [3:0]                            axi_mm_arqos                     ,
        input                                   axi_mm_arready                   ,
        output [3:0]                            axi_mm_arregion                  ,
        output [2:0]                            axi_mm_arsize                    ,
        output [`AXI_ARUSER-1:0]                 axi_mm_aruser                    ,
        output                                  axi_mm_arvalid                   ,
        input [`AXI_MM_DW-1:0]                   axi_mm_rdata                     ,
        input [`IDW-1:0]                         axi_mm_rid                       ,
        input                                   axi_mm_rlast                     ,
        output                                  axi_mm_rready                    ,
        input [1:0]                             axi_mm_rresp                     ,
        input [`AXI_RUSER-1:0]                   axi_mm_ruser                     ,
        input                                   axi_mm_rvalid                    ,
    `endif
//
//ActionAXI-LiteslaveInterface
input                                   a_s_axi_arvalid                  ,
input [`AXI_LITE_AW-1:0]                 a_s_axi_araddr                   ,
output                                  a_s_axi_arready                  ,
output                                  a_s_axi_rvalid                   ,
output [`AXI_LITE_DW-1:0]                a_s_axi_rdata                    ,
output [1:0]                            a_s_axi_rresp                    ,
input                                   a_s_axi_rready                   ,
input                                   a_s_axi_awvalid                  ,
input [`AXI_LITE_AW-1:0]                 a_s_axi_awaddr                   ,
output                                  a_s_axi_awready                  ,
input                                   a_s_axi_wvalid                   ,
input [`AXI_LITE_DW-1:0]                 a_s_axi_wdata                    ,
input [`AXI_LITE_DW/8-1:0]               a_s_axi_wstrb                    ,
output                                  a_s_axi_wready                   ,
output                                  a_s_axi_bvalid                   ,
output [1:0]                            a_s_axi_bresp                    ,
input                                   a_s_axi_bready                   ,
//ActionAXI-LitemasterInterface
output                                  a_m_axi_arvalid                  ,
output [`AXI_LITE_AW-1:0]                a_m_axi_araddr                   ,
input                                   a_m_axi_arready                  ,
input                                   a_m_axi_rvalid                   ,
input [`AXI_LITE_DW-1:0]                 a_m_axi_rdata                    ,
input [1:0]                             a_m_axi_rresp                    ,
output                                  a_m_axi_rready                   ,
output                                  a_m_axi_awvalid                  ,
output [`AXI_LITE_AW-1:0]                a_m_axi_awaddr                   ,
input                                   a_m_axi_awready                  ,
output                                  a_m_axi_wvalid                   ,
output [`AXI_LITE_DW-1:0]                a_m_axi_wdata                    ,
output [`AXI_LITE_DW/8-1:0]              a_m_axi_wstrb                    ,
input                                   a_m_axi_wready                   ,
input                                   a_m_axi_bvalid                   ,
input [1:0]                             a_m_axi_bresp                    ,
output                                  a_m_axi_bready
`endif
) ; //end of module ports


//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
// wires
//------------------------------------------------------------------------------
//-----------------------------------------------------------------------------



`ifdef ENABLE_ODMA
wire [`AXI_LITE_AW-1:0]             lite_mmio2odma_awaddr    ;
wire [2:0]                         lite_mmio2odma_awprot    ;
wire                               lite_mmio2odma_awvalid   ;
wire [`AXI_LITE_DW-1:0]             lite_mmio2odma_wdata     ;
wire [3:0]                         lite_mmio2odma_wstrb     ;
wire                               lite_mmio2odma_wvalid    ;
wire                               lite_mmio2odma_bready    ;
wire [`AXI_LITE_AW-1:0]             lite_mmio2odma_araddr    ;
wire [2:0]                         lite_mmio2odma_arprot    ;
wire                               lite_mmio2odma_arvalid   ;
wire                               lite_mmio2odma_rready    ;

wire                               lite_odma2mmio_awready   ;
wire                               lite_odma2mmio_wready    ;
wire [1:0]                         lite_odma2mmio_bresp     ;
wire                               lite_odma2mmio_bvalid    ;
wire                               lite_odma2mmio_arready   ;
wire [`AXI_LITE_DW-1:0]             lite_odma2mmio_rdata     ;
wire [1:0]                         lite_odma2mmio_rresp     ;
wire                               lite_odma2mmio_rvalid    ;

`endif



wire        debug_cnt_clear         ;
wire [63:0] debug_tlx_cnt_cmd       ;
wire [63:0] debug_tlx_cnt_rsp       ;
wire [63:0] debug_tlx_cnt_retry     ;
wire [63:0] debug_tlx_cnt_fail      ;
wire [63:0] debug_tlx_cnt_xlt_pd    ;
wire [63:0] debug_tlx_cnt_xlt_done  ;
wire [63:0] debug_tlx_cnt_xlt_retry ;
wire [63:0] debug_axi_cnt_cmd       ;
wire [63:0] debug_axi_cnt_rsp       ;
wire [63:0] debug_buf_cnt           ;
wire [63:0] debug_traffic_idle      ;
wire [63:0] debug_tlx_idle_lim      ;
wire [63:0] debug_axi_idle_lim      ;
wire [63:0] fir_fifo_overflow       ;
wire [63:0] fir_tlx_interface       ;
wire        soft_reset_brdg_odma    ;

wire brdg_odma_rst_n      ;

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
// SNAP CORE ENTITIES
//------------------------------------------------------------------------------
//-----------------------------------------------------------------------------
`ifndef ENABLE_ODMA
  //----------------------------------------------------------------------------
  //----------------------------------------------------------------------------
  // BRIDGE Entity
  //----------------------------------------------------------------------------
  //----------------------------------------------------------------------------
    brdg_wrapper bridge (
      //
      // Clocks & Reset
        .clk_tlx                                     ( clock_tlx                        ) ,
        .clk_afu                                     ( clock_afu                        ) ,
        .rst_n                                       ( brdg_odma_rst_n                  ) ,
      //
      // CONFIGURATION
        .cfg_backoff_timer                           ( cfg_backoff_timer                ) ,
        .cfg_bdf_bus                                 ( cfg_bdf_bus                      ) ,
        .cfg_bdf_device                              ( cfg_bdf_device                   ) ,
        .cfg_bdf_function                            ( cfg_bdf_function                 ) ,
        .cfg_actag_base                              ( cfg_actag_base                   ) ,
        .cfg_pasid_base                              ( cfg_pasid_base                   ) ,
        .cfg_pasid_length                            ( cfg_pasid_length                 ) ,
      
      // STATUS
        .debug_cnt_clear                             ( debug_cnt_clear                  ) ,
        .debug_tlx_cnt_cmd                           ( debug_tlx_cnt_cmd                ) ,
        .debug_tlx_cnt_rsp                           ( debug_tlx_cnt_rsp                ) ,
        .debug_tlx_cnt_retry                         ( debug_tlx_cnt_retry              ) ,
        .debug_tlx_cnt_fail                          ( debug_tlx_cnt_fail               ) ,
        .debug_tlx_cnt_xlt_pd                        ( debug_tlx_cnt_xlt_pd             ) ,
        .debug_tlx_cnt_xlt_done                      ( debug_tlx_cnt_xlt_done           ) ,
        .debug_tlx_cnt_xlt_retry                     ( debug_tlx_cnt_xlt_retry          ) ,
        .debug_axi_cnt_cmd                           ( debug_axi_cnt_cmd                ) , 
        .debug_axi_cnt_rsp                           ( debug_axi_cnt_rsp                ) , 
        .debug_buf_cnt                               ( debug_buf_cnt                    ) , 
        .debug_traffic_idle                          ( debug_traffic_idle               ) ,
        .debug_tlx_idle_lim                          ( debug_tlx_idle_lim               ) ,
        .debug_axi_idle_lim                          ( debug_axi_idle_lim               ) ,
        .fir_fifo_overflow                           ( fir_fifo_overflow                ) ,
        .fir_tlx_interface                           ( fir_tlx_interface                ) ,
     //
     //
     // AFU-TLX command transmit interface
        .afu_tlx_cmd_valid                           ( afu_tlx_cmd_valid                ) ,
        .afu_tlx_cmd_opcode                          ( afu_tlx_cmd_opcode               ) ,
        .afu_tlx_cmd_actag                           ( afu_tlx_cmd_actag                ) ,
        .afu_tlx_cmd_stream_id                       ( afu_tlx_cmd_stream_id            ) ,
        .afu_tlx_cmd_ea_or_obj                       ( afu_tlx_cmd_ea_or_obj            ) ,
        .afu_tlx_cmd_afutag                          ( afu_tlx_cmd_afutag               ) ,
        .afu_tlx_cmd_dl                              ( afu_tlx_cmd_dl                   ) ,
        .afu_tlx_cmd_pl                              ( afu_tlx_cmd_pl                   ) ,
        .afu_tlx_cmd_os                              ( afu_tlx_cmd_os                   ) ,
        .afu_tlx_cmd_be                              ( afu_tlx_cmd_be                   ) ,
        .afu_tlx_cmd_flag                            ( afu_tlx_cmd_flag                 ) ,
        .afu_tlx_cmd_endian                          ( afu_tlx_cmd_endian               ) ,
        .afu_tlx_cmd_bdf                             ( afu_tlx_cmd_bdf                  ) ,
        .afu_tlx_cmd_pasid                           ( afu_tlx_cmd_pasid                ) ,
        .afu_tlx_cmd_pg_size                         ( afu_tlx_cmd_pg_size              ) ,
        .afu_tlx_cdata_valid                         ( afu_tlx_cdata_valid              ) ,
        .afu_tlx_cdata_bdi                           ( afu_tlx_cdata_bdi                ) ,
        .afu_tlx_cdata_bus                           ( afu_tlx_cdata_bus                ) ,
        .tlx_afu_cmd_credit                          ( tlx_afu_cmd_credit               ) ,
        .tlx_afu_cmd_data_credit                     ( tlx_afu_cmd_data_credit          ) ,
        .tlx_afu_cmd_initial_credit                  ( tlx_afu_cmd_initial_credit       ) ,
        .tlx_afu_cmd_data_initial_credit             ( tlx_afu_cmd_data_initial_credit  ) ,
      //
      // TLX-AFU response receive interface
        .tlx_afu_resp_valid                          ( tlx_afu_resp_valid               ) ,
        .tlx_afu_resp_afutag                         ( tlx_afu_resp_afutag              ) ,
        .tlx_afu_resp_opcode                         ( tlx_afu_resp_opcode              ) ,
        .tlx_afu_resp_code                           ( tlx_afu_resp_code                ) ,
        .tlx_afu_resp_dl                             ( tlx_afu_resp_dl                  ) ,
        .tlx_afu_resp_dp                             ( tlx_afu_resp_dp                  ) ,
        .afu_tlx_resp_rd_req                         ( afu_tlx_resp_rd_req              ) ,
        .afu_tlx_resp_rd_cnt                         ( afu_tlx_resp_rd_cnt              ) ,
        .tlx_afu_resp_data_valid                     ( tlx_afu_resp_data_valid          ) ,
        .tlx_afu_resp_data_bus                       ( tlx_afu_resp_data_bus            ) ,
        .tlx_afu_resp_data_bdi                       ( tlx_afu_resp_data_bdi            ) ,
        .afu_tlx_resp_credit                         ( afu_tlx_resp_credit              ) ,
        .afu_tlx_resp_initial_credit                 ( afu_tlx_resp_initial_credit      ) ,
      //
      // AXI write address channel
        .s_axi_awid                                  ( mm_conv2snap_awid                ) ,
        .s_axi_awaddr                                ( mm_conv2snap_awaddr              ) ,
        .s_axi_awlen                                 ( mm_conv2snap_awlen               ) ,
        .s_axi_awvalid                               ( mm_conv2snap_awvalid             ) ,
        .s_axi_awready                               ( mm_snap2conv_awready             ) ,
        .s_axi_awsize                                ( mm_conv2snap_awsize              ) ,
        .s_axi_awburst                               ( mm_conv2snap_awburst             ) ,
//        .s_axi_awcache                             ( mm_conv2snap_awcache             ) ,
//        .s_axi_awlock                              ( mm_conv2snap_awlock              ) ,
//        .s_axi_awprot                              ( mm_conv2snap_awprot              ) ,
//        .s_axi_awqos                               ( mm_conv2snap_awqos               ) ,
//        .s_axi_awregion                            ( mm_conv2snap_awregion            ) ,
        .s_axi_awuser                                ( mm_conv2snap_awuser              ) ,
      //
      // AXI write data channel
//        .s_axi_wid                                 ( mm_conv2snap_wid                 ) ,
        .s_axi_wdata                                 ( mm_conv2snap_wdata               ) ,
        .s_axi_wstrb                                 ( mm_conv2snap_wstrb               ) ,
        .s_axi_wlast                                 ( mm_conv2snap_wlast               ) ,
        .s_axi_wvalid                                ( mm_conv2snap_wvalid              ) ,
        .s_axi_wready                                ( mm_snap2conv_wready              ) ,
      //
      // AXI write response channel
        .s_axi_bready                                ( mm_conv2snap_bready              ) ,
        .s_axi_bid                                   ( mm_snap2conv_bid                 ) ,
        .s_axi_bresp                                 ( mm_snap2conv_bresp               ) ,
        .s_axi_bvalid                                ( mm_snap2conv_bvalid              ) ,
        .s_axi_buser                                 ( mm_snap2conv_buser               ) ,
      //
      // AXI read address channel
        .s_axi_arid                                  ( mm_conv2snap_arid                ) ,
        .s_axi_araddr                                ( mm_conv2snap_araddr              ) ,
        .s_axi_arlen                                 ( mm_conv2snap_arlen               ) ,
        .s_axi_arsize                                ( mm_conv2snap_arsize              ) ,
        .s_axi_arburst                               ( mm_conv2snap_arburst             ) ,
        .s_axi_aruser                                ( mm_conv2snap_aruser              ) ,
//        .s_axi_arcache                             ( mm_conv2snap_arcache             ) ,
//        .s_axi_arlock                              ( mm_conv2snap_arlock              ) ,
//        .s_axi_arprot                              ( mm_conv2snap_arprot              ) ,
//        .s_axi_arqos                               ( mm_conv2snap_arqos               ) ,
//        .s_axi_arregion                            ( mm_conv2snap_arregion            ) ,
        .s_axi_arvalid                               ( mm_conv2snap_arvalid             ) ,
        .s_axi_arready                               ( mm_snap2conv_arready             ) ,
      //
      // AXI read data channel
        .s_axi_rready                                ( mm_conv2snap_rready              ) ,
        .s_axi_rid                                   ( mm_snap2conv_rid                 ) ,
        .s_axi_rdata                                 ( mm_snap2conv_rdata               ) ,
        .s_axi_rresp                                 ( mm_snap2conv_rresp               ) ,
        .s_axi_rlast                                 ( mm_snap2conv_rlast               ) ,
        .s_axi_rvalid                                ( mm_snap2conv_rvalid              ) ,
        .s_axi_ruser                                 ( mm_snap2conv_ruser               ) ,
      //
      // interrupt channel
        .interrupt_ack                               ( int_req_ack                      ),
        .interrupt                                   ( int_req                          ),
        .interrupt_src                               ( int_src                          ),
        .interrupt_ctx                               ( int_ctx                          ) 
) ;
`else
  //----------------------------------------------------------------------------
  //----------------------------------------------------------------------------
  // ODMA Entity
  //
  //
  // shortcut = o
  //----------------------------------------------------------------------------
  //----------------------------------------------------------------------------
    odma_wrapper #(
                   .IDW(`IDW), 
                   .CTXW(`CTXW),
                   .TAGW(`TAGW),
                   .AXI_MM_DW(`AXI_MM_DW), 
                   .AXI_MM_AW(`AXI_MM_AW), 
                   .AXI_ST_DW(`AXI_ST_DW), 
                   .AXI_ST_AW(`AXI_ST_AW), 
                   .AXI_LITE_DW(`AXI_LITE_DW), 
                   .AXI_LITE_AW(`AXI_LITE_AW), 
                   .AXI_MM_AWUSER(`AXI_AWUSER),
                   .AXI_MM_ARUSER(`AXI_ARUSER),
                   .AXI_MM_WUSER(`AXI_WUSER), 
                   .AXI_MM_RUSER(`AXI_RUSER), 
                   .AXI_MM_BUSER(`AXI_BUSER), 
                   .AXI_ST_USER(`AXI_ST_USER) 
                 )
        odma (
      //
      // Clocks & Reset
        .clk_tlx                                     ( clock_tlx                        ) ,
        .clk_afu                                     ( clock_afu                        ) ,
        .rst_n                                       ( brdg_odma_rst_n                  ) ,
      //
      // CONFIGURATION
        .cfg_backoff_timer                           ( cfg_backoff_timer                ) ,
        .cfg_bdf_bus                                 ( cfg_bdf_bus                      ) ,
        .cfg_bdf_device                              ( cfg_bdf_device                   ) ,
        .cfg_bdf_function                            ( cfg_bdf_function                 ) ,
        .cfg_actag_base                              ( cfg_actag_base                   ) ,
        .cfg_pasid_base                              ( cfg_pasid_base                   ) ,
        .cfg_pasid_length                            ( cfg_pasid_length                 ) ,

       // STATUS
        .debug_cnt_clear                             ( debug_cnt_clear                  ) ,
        .debug_tlx_cnt_cmd                           ( debug_tlx_cnt_cmd                ) ,
        .debug_tlx_cnt_rsp                           ( debug_tlx_cnt_rsp                ) ,
        .debug_tlx_cnt_retry                         ( debug_tlx_cnt_retry              ) ,
        .debug_tlx_cnt_fail                          ( debug_tlx_cnt_fail               ) ,
        .debug_tlx_cnt_xlt_pd                        ( debug_tlx_cnt_xlt_pd             ) ,
        .debug_tlx_cnt_xlt_done                      ( debug_tlx_cnt_xlt_done           ) ,
        .debug_tlx_cnt_xlt_retry                     ( debug_tlx_cnt_xlt_retry          ) ,
        .debug_axi_cnt_cmd                           ( debug_axi_cnt_cmd                ) , 
        .debug_axi_cnt_rsp                           ( debug_axi_cnt_rsp                ) , 
        .debug_buf_cnt                               ( debug_buf_cnt                    ) , 
        .debug_traffic_idle                          ( debug_traffic_idle               ) ,
        .debug_tlx_idle_lim                          ( debug_tlx_idle_lim               ) ,
        .debug_axi_idle_lim                          ( debug_axi_idle_lim               ) ,
        .fir_fifo_overflow                           ( fir_fifo_overflow                ) ,
        .fir_tlx_interface                           ( fir_tlx_interface                ) ,

      //
      //
      // AFU-TLX command transmit interface
        .afu_tlx_cmd_valid                           ( afu_tlx_cmd_valid                ) ,
        .afu_tlx_cmd_opcode                          ( afu_tlx_cmd_opcode               ) ,
        .afu_tlx_cmd_actag                           ( afu_tlx_cmd_actag                ) ,
        .afu_tlx_cmd_stream_id                       ( afu_tlx_cmd_stream_id            ) ,
        .afu_tlx_cmd_ea_or_obj                       ( afu_tlx_cmd_ea_or_obj            ) ,
        .afu_tlx_cmd_afutag                          ( afu_tlx_cmd_afutag               ) ,
        .afu_tlx_cmd_dl                              ( afu_tlx_cmd_dl                   ) ,
        .afu_tlx_cmd_pl                              ( afu_tlx_cmd_pl                   ) ,
        .afu_tlx_cmd_os                              ( afu_tlx_cmd_os                   ) ,
        .afu_tlx_cmd_be                              ( afu_tlx_cmd_be                   ) ,
        .afu_tlx_cmd_flag                            ( afu_tlx_cmd_flag                 ) ,
        .afu_tlx_cmd_endian                          ( afu_tlx_cmd_endian               ) ,
        .afu_tlx_cmd_bdf                             ( afu_tlx_cmd_bdf                  ) ,
        .afu_tlx_cmd_pasid                           ( afu_tlx_cmd_pasid                ) ,
        .afu_tlx_cmd_pg_size                         ( afu_tlx_cmd_pg_size              ) ,
        .afu_tlx_cdata_valid                         ( afu_tlx_cdata_valid              ) ,
        .afu_tlx_cdata_bdi                           ( afu_tlx_cdata_bdi                ) ,
        .afu_tlx_cdata_bus                           ( afu_tlx_cdata_bus                ) ,
        .tlx_afu_cmd_credit                          ( tlx_afu_cmd_credit               ) ,
        .tlx_afu_cmd_data_credit                     ( tlx_afu_cmd_data_credit          ) ,
        .tlx_afu_cmd_initial_credit                  ( tlx_afu_cmd_initial_credit       ) ,
        .tlx_afu_cmd_data_initial_credit             ( tlx_afu_cmd_data_initial_credit  ) ,
      //
      // TLX-AFU response receive interface
        .tlx_afu_resp_valid                          ( tlx_afu_resp_valid               ) ,
        .tlx_afu_resp_afutag                         ( tlx_afu_resp_afutag              ) ,
        .tlx_afu_resp_opcode                         ( tlx_afu_resp_opcode              ) ,
        .tlx_afu_resp_code                           ( tlx_afu_resp_code                ) ,
        .tlx_afu_resp_dl                             ( tlx_afu_resp_dl                  ) ,
        .tlx_afu_resp_dp                             ( tlx_afu_resp_dp                  ) ,
        .afu_tlx_resp_rd_req                         ( afu_tlx_resp_rd_req              ) ,
        .afu_tlx_resp_rd_cnt                         ( afu_tlx_resp_rd_cnt              ) ,
        .tlx_afu_resp_data_valid                     ( tlx_afu_resp_data_valid          ) ,
        .tlx_afu_resp_data_bus                       ( tlx_afu_resp_data_bus            ) ,
        .tlx_afu_resp_data_bdi                       ( tlx_afu_resp_data_bdi            ) ,
        .afu_tlx_resp_credit                         ( afu_tlx_resp_credit              ) ,
        .afu_tlx_resp_initial_credit                 ( afu_tlx_resp_initial_credit      ) ,
      //
`ifndef ENABLE_ODMA_ST_MODE
      // AXI4-MM Interface to action
      // Write Addr/Req channel
        .axi_mm_awaddr                               ( axi_mm_awaddr                    ) ,
        .axi_mm_awid                                 ( axi_mm_awid                      ) ,
        .axi_mm_awlen                                ( axi_mm_awlen                     ) ,
        .axi_mm_awsize                               ( axi_mm_awsize                    ) ,
        .axi_mm_awburst                              ( axi_mm_awburst                   ) ,
        .axi_mm_awprot                               ( axi_mm_awprot                    ) ,
        .axi_mm_awqos                                ( axi_mm_awqos                     ) ,
        .axi_mm_awregion                             ( axi_mm_awregion                  ) ,
        .axi_mm_awuser                               ( axi_mm_awuser                    ) ,
        .axi_mm_awvalid                              ( axi_mm_awvalid                   ) ,
        .axi_mm_awlock                               ( axi_mm_awlock                    ) ,
        .axi_mm_awcache                              ( axi_mm_awcache                   ) ,
        .axi_mm_awready                              ( axi_mm_awready                   ) ,
      //
      // Write Data channel
        .axi_mm_wdata                                ( axi_mm_wdata                     ) ,
        .axi_mm_wlast                                ( axi_mm_wlast                     ) ,
        .axi_mm_wstrb                                ( axi_mm_wstrb                     ) ,
        .axi_mm_wvalid                               ( axi_mm_wvalid                    ) ,
        .axi_mm_wuser                                ( axi_mm_wuser                     ) ,
        .axi_mm_wready                               ( axi_mm_wready                    ) ,
      //
      // Write Response channel
        .axi_mm_bvalid                               ( axi_mm_bvalid                    ) ,
        .axi_mm_bresp                                ( axi_mm_bresp                     ) ,
        .axi_mm_bid                                  ( axi_mm_bid                       ) ,
        .axi_mm_buser                                ( axi_mm_buser                     ) ,
        .axi_mm_bready                               ( axi_mm_bready                    ) ,
      //
      // Read Addr/Req Channel
        .axi_mm_araddr                               ( axi_mm_araddr                    ) ,
        .axi_mm_arburst                              ( axi_mm_arburst                   ) ,
        .axi_mm_arcache                              ( axi_mm_arcache                   ) ,
        .axi_mm_arid                                 ( axi_mm_arid                      ) ,
        .axi_mm_arlen                                ( axi_mm_arlen                     ) ,
        .axi_mm_arlock                               ( axi_mm_arlock                    ) ,
        .axi_mm_arprot                               ( axi_mm_arprot                    ) ,
        .axi_mm_arqos                                ( axi_mm_arqos                     ) ,
        .axi_mm_arready                              ( axi_mm_arready                   ) ,
        .axi_mm_arregion                             ( axi_mm_arregion                  ) ,
        .axi_mm_arsize                               ( axi_mm_arsize                    ) ,
        .axi_mm_aruser                               ( axi_mm_aruser                    ) ,
        .axi_mm_arvalid                              ( axi_mm_arvalid                   ) ,
      //
      // Read Data Channel
        .axi_mm_rdata                                ( axi_mm_rdata                     ) ,
        .axi_mm_rid                                  ( axi_mm_rid                       ) ,
        .axi_mm_rlast                                ( axi_mm_rlast                     ) ,
        .axi_mm_rready                               ( axi_mm_rready                    ) ,
        .axi_mm_rresp                                ( axi_mm_rresp                     ) ,
        .axi_mm_ruser                                ( axi_mm_ruser                     ) ,
        .axi_mm_rvalid                               ( axi_mm_rvalid                    ) ,
`else
        .m_axis_tready                               ( m_axis_tready                    ),
        .m_axis_tlast                                ( m_axis_tlast                     ),
        .m_axis_tdata                                ( m_axis_tdata                     ),
        .m_axis_tkeep                                ( m_axis_tkeep                     ),
        .m_axis_tvalid                               ( m_axis_tvalid                    ),
        .m_axis_tid                                  ( m_axis_tid                       ),
        .m_axis_tuser                                ( m_axis_tuser                     ),
        .s_axis_tready                               ( s_axis_tready                    ),
        .s_axis_tlast                                ( s_axis_tlast                     ),
        .s_axis_tdata                                ( s_axis_tdata                     ),
        .s_axis_tkeep                                ( s_axis_tkeep                     ),
        .s_axis_tvalid                               ( s_axis_tvalid                    ),
        .s_axis_tid                                  ( s_axis_tid                       ),
        .s_axis_tuser                                ( s_axis_tuser                     ),
`endif
      //
      // Host AXI-Lite slave Interface
        .h_s_axi_arvalid                             ( lite_mmio2odma_arvalid           ) ,
        .h_s_axi_araddr                              ( lite_mmio2odma_araddr            ) ,
        .h_s_axi_arready                             ( lite_odma2mmio_arready           ) ,
        .h_s_axi_rvalid                              ( lite_odma2mmio_rvalid            ) ,
        .h_s_axi_rdata                               ( lite_odma2mmio_rdata             ) ,
        .h_s_axi_rresp                               ( lite_odma2mmio_rresp             ) ,
        .h_s_axi_rready                              ( lite_mmio2odma_rready            ) ,
        .h_s_axi_awvalid                             ( lite_mmio2odma_awvalid           ) ,
        .h_s_axi_awaddr                              ( lite_mmio2odma_awaddr            ) ,
        .h_s_axi_awready                             ( lite_odma2mmio_awready           ) ,
        .h_s_axi_wvalid                              ( lite_mmio2odma_wvalid            ) ,
        .h_s_axi_wdata                               ( lite_mmio2odma_wdata             ) ,
        .h_s_axi_wstrb                               ( lite_mmio2odma_wstrb             ) ,
        .h_s_axi_wready                              ( lite_odma2mmio_wready            ) ,
        .h_s_axi_bvalid                              ( lite_odma2mmio_bvalid            ) ,
        .h_s_axi_bresp                               ( lite_odma2mmio_bresp             ) ,
        .h_s_axi_bready                              ( lite_mmio2odma_bready            ) ,
      // Action AXI-Lite slave Interface
        .a_s_axi_arvalid                             ( a_s_axi_arvalid                  ) ,
        .a_s_axi_araddr                              ( a_s_axi_araddr                   ) ,
        .a_s_axi_arready                             ( a_s_axi_arready                  ) ,
        .a_s_axi_rvalid                              ( a_s_axi_rvalid                   ) ,
        .a_s_axi_rdata                               ( a_s_axi_rdata                    ) ,
        .a_s_axi_rresp                               ( a_s_axi_rresp                    ) ,
        .a_s_axi_rready                              ( a_s_axi_rready                   ) ,
        .a_s_axi_awvalid                             ( a_s_axi_awvalid                  ) ,
        .a_s_axi_awaddr                              ( a_s_axi_awaddr                   ) ,
        .a_s_axi_awready                             ( a_s_axi_awready                  ) ,
        .a_s_axi_wvalid                              ( a_s_axi_wvalid                   ) ,
        .a_s_axi_wdata                               ( a_s_axi_wdata                    ) ,
        .a_s_axi_wstrb                               ( a_s_axi_wstrb                    ) ,
        .a_s_axi_wready                              ( a_s_axi_wready                   ) ,
        .a_s_axi_bvalid                              ( a_s_axi_bvalid                   ) ,
        .a_s_axi_bresp                               ( a_s_axi_bresp                    ) ,
        .a_s_axi_bready                              ( a_s_axi_bready                   ) ,
      // Action AXI-Lite master Interface -------//
        .a_m_axi_arvalid                             ( a_m_axi_arvalid                  ) ,
        .a_m_axi_araddr                              ( a_m_axi_araddr                   ) ,
        .a_m_axi_arready                             ( a_m_axi_arready                  ) ,
        .a_m_axi_rvalid                              ( a_m_axi_rvalid                   ) ,
        .a_m_axi_rdata                               ( a_m_axi_rdata                    ) ,
        .a_m_axi_rresp                               ( a_m_axi_rresp                    ) ,
        .a_m_axi_rready                              ( a_m_axi_rready                   ) ,
        .a_m_axi_awvalid                             ( a_m_axi_awvalid                  ) ,
        .a_m_axi_awaddr                              ( a_m_axi_awaddr                   ) ,
        .a_m_axi_awready                             ( a_m_axi_awready                  ) ,
        .a_m_axi_wvalid                              ( a_m_axi_wvalid                   ) ,
        .a_m_axi_wdata                               ( a_m_axi_wdata                    ) ,
        .a_m_axi_wstrb                               ( a_m_axi_wstrb                    ) ,
        .a_m_axi_wready                              ( a_m_axi_wready                   ) ,
        .a_m_axi_bvalid                              ( a_m_axi_bvalid                   ) ,
        .a_m_axi_bresp                               ( a_m_axi_bresp                    ) ,
        .a_m_axi_bready                              ( a_m_axi_bready                   )
) ;

`endif


  //----------------------------------------------------------------------------
  //----------------------------------------------------------------------------
  // MMIO Entity
  //----------------------------------------------------------------------------
  //----------------------------------------------------------------------------
    mmio_wrapper mmio (
      //
      // Clocks & Reset
        .clk_tlx                                     ( clock_tlx                        ) ,
        .clk_afu                                     ( clock_afu                        ) ,
        .rst_n                                       ( ~reset_snap                      ) ,
      //
      // CONFIGURATION
        .cfg_f1_mmio_bar0                            ( cfg_f1_mmio_bar0                 ) ,
        .cfg_f1_mmio_bar0_mask                       ( cfg_f1_mmio_bar0_mask            ) ,
      //
      // STATUS
        .debug_cnt_clear                             ( debug_cnt_clear                  ) ,
        .debug_tlx_cnt_cmd                           ( debug_tlx_cnt_cmd                ) ,
        .debug_tlx_cnt_rsp                           ( debug_tlx_cnt_rsp                ) ,
        .debug_tlx_cnt_retry                         ( debug_tlx_cnt_retry              ) ,
        .debug_tlx_cnt_fail                          ( debug_tlx_cnt_fail               ) ,
        .debug_tlx_cnt_xlt_pd                        ( debug_tlx_cnt_xlt_pd             ) ,
        .debug_tlx_cnt_xlt_done                      ( debug_tlx_cnt_xlt_done           ) ,
        .debug_tlx_cnt_xlt_retry                     ( debug_tlx_cnt_xlt_retry          ) ,
        .debug_axi_cnt_cmd                           ( debug_axi_cnt_cmd                ) , 
        .debug_axi_cnt_rsp                           ( debug_axi_cnt_rsp                ) , 
        .debug_buf_cnt                               ( debug_buf_cnt                    ) , 
        .debug_traffic_idle                          ( debug_traffic_idle               ) ,
        .debug_tlx_idle_lim                          ( debug_tlx_idle_lim               ) ,
        .debug_axi_idle_lim                          ( debug_axi_idle_lim               ) ,
        .fir_fifo_overflow                           ( fir_fifo_overflow                ) ,
        .fir_tlx_interface                           ( fir_tlx_interface                ) ,
      //
      // CONTROL
        .soft_reset_brdg_odma                        ( soft_reset_brdg_odma             ),
        .soft_reset_action                           ( soft_reset_action                ) ,
      //
      // TLX to AFU command
        .tlx_afu_cmd_valid                           ( tlx_afu_cmd_valid                ) ,
        .tlx_afu_cmd_opcode                          ( tlx_afu_cmd_opcode               ) ,
        .tlx_afu_cmd_capptag                         ( tlx_afu_cmd_capptag              ) ,
        .tlx_afu_cmd_dl                              ( tlx_afu_cmd_dl                   ) ,
        .tlx_afu_cmd_pl                              ( tlx_afu_cmd_pl                   ) ,
        .tlx_afu_cmd_be                              ( tlx_afu_cmd_be                   ) ,
        .tlx_afu_cmd_end                             ( tlx_afu_cmd_end                  ) ,
        .tlx_afu_cmd_pa                              ( tlx_afu_cmd_pa                   ) ,
        .tlx_afu_cmd_flag                            ( tlx_afu_cmd_flag                 ) ,
        .tlx_afu_cmd_os                              ( tlx_afu_cmd_os                   ) ,
        .afu_tlx_cmd_credit                          ( afu_tlx_cmd_credit               ) ,
        .afu_tlx_cmd_initial_credit                  ( afu_tlx_cmd_initial_credit       ) ,
        .afu_tlx_cmd_rd_req                          ( afu_tlx_cmd_rd_req               ) ,
        .afu_tlx_cmd_rd_cnt                          ( afu_tlx_cmd_rd_cnt               ) ,
        .tlx_afu_cmd_data_valid                      ( tlx_afu_cmd_data_valid           ) ,
        .tlx_afu_cmd_data_bdi                        ( tlx_afu_cmd_data_bdi             ) ,
        .tlx_afu_cmd_data_bus                        ( tlx_afu_cmd_data_bus             ) ,
      //
      // AFU to TLX response
        .afu_tlx_resp_valid                          ( afu_tlx_resp_valid               ) ,
        .afu_tlx_resp_opcode                         ( afu_tlx_resp_opcode              ) ,
        .afu_tlx_resp_dl                             ( afu_tlx_resp_dl                  ) ,
        .afu_tlx_resp_capptag                        ( afu_tlx_resp_capptag             ) ,
        .afu_tlx_resp_dp                             ( afu_tlx_resp_dp                  ) ,
        .afu_tlx_resp_code                           ( afu_tlx_resp_code                ) ,
        .afu_tlx_rdata_valid                         ( afu_tlx_rdata_valid              ) ,
        .afu_tlx_rdata_bdi                           ( afu_tlx_rdata_bdi                ) ,
        .afu_tlx_rdata_bus                           ( afu_tlx_rdata_bus                ) ,
        .tlx_afu_resp_credit                         ( tlx_afu_resp_credit              ) ,
        .tlx_afu_resp_data_credit                    ( tlx_afu_resp_data_credit         ) ,
        .tlx_afu_resp_initial_credit                 ( tlx_afu_resp_initial_credit      ) ,
        .tlx_afu_resp_data_initial_credit            ( tlx_afu_resp_data_initial_credit ) ,
      //
`ifndef ENABLE_ODMA
      // AXI Lite write
        .m_axi_awready                               ( lite_conv2snap_awready           ) ,
        .m_axi_awaddr                                ( lite_snap2conv_awaddr            ) ,
        .m_axi_awprot                                ( lite_snap2conv_awprot            ) ,
        .m_axi_awvalid                               ( lite_snap2conv_awvalid           ) ,
        .m_axi_wready                                ( lite_conv2snap_wready            ) ,
        .m_axi_wdata                                 ( lite_snap2conv_wdata             ) ,
        .m_axi_wstrb                                 ( lite_snap2conv_wstrb             ) ,
        .m_axi_wvalid                                ( lite_snap2conv_wvalid            ) ,
        .m_axi_bresp                                 ( lite_conv2snap_bresp             ) ,
        .m_axi_bvalid                                ( lite_conv2snap_bvalid            ) ,
        .m_axi_bready                                ( lite_snap2conv_bready            ) ,

      // AXI Lite read
        .m_axi_arready                               ( lite_conv2snap_arready           ) ,
        .m_axi_arvalid                               ( lite_snap2conv_arvalid           ) ,
        .m_axi_araddr                                ( lite_snap2conv_araddr            ) ,
        .m_axi_arprot                                ( lite_snap2conv_arprot            ) ,
        .m_axi_rdata                                 ( lite_conv2snap_rdata             ) ,
        .m_axi_rresp                                 ( lite_conv2snap_rresp             ) ,
        .m_axi_rready                                ( lite_snap2conv_rready            ) ,
        .m_axi_rvalid                                ( lite_conv2snap_rvalid            )
`else
      // AXI Lite write
        .m_axi_awready                               ( lite_odma2mmio_awready           ) ,
        .m_axi_awaddr                                ( lite_mmio2odma_awaddr            ) ,
        .m_axi_awprot                                ( lite_mmio2odma_awprot            ) ,
        .m_axi_awvalid                               ( lite_mmio2odma_awvalid           ) ,
        .m_axi_wready                                ( lite_odma2mmio_wready            ) ,
        .m_axi_wdata                                 ( lite_mmio2odma_wdata             ) ,
        .m_axi_wstrb                                 ( lite_mmio2odma_wstrb             ) ,
        .m_axi_wvalid                                ( lite_mmio2odma_wvalid            ) ,
        .m_axi_bresp                                 ( lite_odma2mmio_bresp             ) ,
        .m_axi_bvalid                                ( lite_odma2mmio_bvalid            ) ,
        .m_axi_bready                                ( lite_mmio2odma_bready            ) ,

      // AXI Lite read
        .m_axi_arready                               ( lite_odma2mmio_arready           ) ,
        .m_axi_arvalid                               ( lite_mmio2odma_arvalid           ) ,
        .m_axi_araddr                                ( lite_mmio2odma_araddr            ) ,
        .m_axi_arprot                                ( lite_mmio2odma_arprot            ) ,
        .m_axi_rdata                                 ( lite_odma2mmio_rdata             ) ,
        .m_axi_rresp                                 ( lite_odma2mmio_rresp             ) ,
        .m_axi_rready                                ( lite_mmio2odma_rready            ) ,
        .m_axi_rvalid                                ( lite_odma2mmio_rvalid            )
`endif
) ; // mmio_wrapper


assign   brdg_odma_rst_n = ~(soft_reset_brdg_odma || reset_snap);


endmodule
