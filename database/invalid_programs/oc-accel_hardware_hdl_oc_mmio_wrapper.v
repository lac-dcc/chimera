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

module mmio_wrapper (
                     input                 clk_tlx                          ,
                     input                 clk_afu                          ,
                     input                 rst_n                            ,

                     //---- configuration ------------------------------------
                     input          [63:0] cfg_f1_mmio_bar0                 ,
                     input          [63:0] cfg_f1_mmio_bar0_mask            ,

                     //---- local information input --------------------------
                     output                debug_cnt_clear                  ,
                     input          [63:0] debug_tlx_cnt_cmd                ,
                     input          [63:0] debug_tlx_cnt_rsp                ,
                     input          [63:0] debug_tlx_cnt_retry              ,
                     input          [63:0] debug_tlx_cnt_fail               ,
                     input          [63:0] debug_tlx_cnt_xlt_pd             ,
                     input          [63:0] debug_tlx_cnt_xlt_done           ,
                     input          [63:0] debug_tlx_cnt_xlt_retry          ,
                     input          [63:0] debug_axi_cnt_cmd                , 
                     input          [63:0] debug_axi_cnt_rsp                , 
                     input          [63:0] debug_buf_cnt                    , 
                     input          [63:0] debug_traffic_idle               ,
                     output         [63:0] debug_tlx_idle_lim               ,
                     output         [63:0] debug_axi_idle_lim               ,

                     //---- FIR ----------------------------------------------
                     input          [63:0] fir_fifo_overflow                ,
                     input          [63:0] fir_tlx_interface                ,

                     //---- local control output -----------------------------
                     output                soft_reset_brdg_odma             ,
                     output                soft_reset_action                ,

                     //---- TL CAPP command ----------------------------------
                     input                 tlx_afu_cmd_valid                ,
                     input           [7:0] tlx_afu_cmd_opcode               ,
                     input          [15:0] tlx_afu_cmd_capptag              ,
                     input           [1:0] tlx_afu_cmd_dl                   ,
                     input           [2:0] tlx_afu_cmd_pl                   ,
                     input          [63:0] tlx_afu_cmd_be                   , // not supported
                     input                 tlx_afu_cmd_end                  , // not supported
                     input          [63:0] tlx_afu_cmd_pa                   ,
                     input           [3:0] tlx_afu_cmd_flag                 , // not supported
                     input                 tlx_afu_cmd_os                   , // not supported
                     output                afu_tlx_cmd_credit               ,
                     output          [6:0] afu_tlx_cmd_initial_credit       ,
                     output                afu_tlx_cmd_rd_req               ,
                     output          [2:0] afu_tlx_cmd_rd_cnt               ,
                     input                 tlx_afu_cmd_data_valid           ,
                     input                 tlx_afu_cmd_data_bdi             ,
                     input         [511:0] tlx_afu_cmd_data_bus             ,

                     //---- TL CAPP response ---------------------------------
                     output                afu_tlx_resp_valid               ,
                     output          [7:0] afu_tlx_resp_opcode              ,
                     output          [1:0] afu_tlx_resp_dl                  ,
                     output         [15:0] afu_tlx_resp_capptag             ,
                     output          [1:0] afu_tlx_resp_dp                  ,
                     output          [3:0] afu_tlx_resp_code                ,
                     output                afu_tlx_rdata_valid              ,
                     output                afu_tlx_rdata_bdi                ,
                     output        [511:0] afu_tlx_rdata_bus                ,
                     input                 tlx_afu_resp_credit              ,
                     input                 tlx_afu_resp_data_credit         ,
                     input           [3:0] tlx_afu_resp_initial_credit      ,
                     input           [5:0] tlx_afu_resp_data_initial_credit ,

                     //---- master side AXI Lite bus ----
                       // AXI write address channel
                     input                 m_axi_awready                    ,   
                     output         [31:0] m_axi_awaddr                     ,
                     output         [02:0] m_axi_awprot                     , // not supported
                     output                m_axi_awvalid                    ,

                       // axi write data channel             
                     input                 m_axi_wready                     ,
                     output         [31:0] m_axi_wdata                      ,
                     output         [03:0] m_axi_wstrb                      , // not supported
                     output                m_axi_wvalid                     ,

                       // AXI response channel
                     input          [01:0] m_axi_bresp                      ,
                     input                 m_axi_bvalid                     ,
                     output                m_axi_bready                     ,

                       // AXI read address channel
                     input                 m_axi_arready                    ,
                     output                m_axi_arvalid                    ,
                     output         [31:0] m_axi_araddr                     ,
                     output         [02:0] m_axi_arprot                     , // not supported

                       // AXI read data channel
                     input          [31:0] m_axi_rdata                      ,
                     input          [01:0] m_axi_rresp                      ,
                     output                m_axi_rready                     ,
                     input                 m_axi_rvalid                     
                     );


 wire          mmio_wr    ;
 wire          mmio_rd    ;
 wire          mmio_dw    ;
 wire  [31:0]  mmio_addr  ;
 wire  [63:0]  mmio_din   ;
 wire  [63:0]  mmio_dout  ;
 wire          mmio_done  ;
 wire          mmio_failed;
 wire          lcl_wr     ;
 wire          lcl_rd     ;
 wire  [31:0]  lcl_addr   ;
 wire  [31:0]  lcl_din    ;
 wire          lcl_ack    ;
 wire          lcl_rsp    ;
 wire  [31:0]  lcl_dout   ;
 wire          lcl_dv     ;



//---- TLX and MMIO local convertion ----
 tlx_mmio_converter mtlx_mmio_converter (
                                         .clk_tlx                          (clk_tlx                         ),
                                         .clk_afu                          (clk_afu                         ),
                                         .rst_n                            (rst_n                           ),
                                         .cfg_f1_mmio_bar0                 (cfg_f1_mmio_bar0                ),
                                         .cfg_f1_mmio_bar0_mask            (cfg_f1_mmio_bar0_mask           ),
                                         .tlx_afu_cmd_valid                (tlx_afu_cmd_valid               ),
                                         .tlx_afu_cmd_opcode               (tlx_afu_cmd_opcode              ),
                                         .tlx_afu_cmd_capptag              (tlx_afu_cmd_capptag             ),
                                         .tlx_afu_cmd_dl                   (tlx_afu_cmd_dl                  ),
                                         .tlx_afu_cmd_pl                   (tlx_afu_cmd_pl                  ),
                                         .tlx_afu_cmd_be                   (tlx_afu_cmd_be                  ), // not supported
                                         .tlx_afu_cmd_end                  (tlx_afu_cmd_end                 ), // not supported
                                         .tlx_afu_cmd_pa                   (tlx_afu_cmd_pa                  ),
                                         .tlx_afu_cmd_flag                 (tlx_afu_cmd_flag                ), // not supported
                                         .tlx_afu_cmd_os                   (tlx_afu_cmd_os                  ), // not supported
                                         .afu_tlx_cmd_credit               (afu_tlx_cmd_credit              ),
                                         .afu_tlx_cmd_initial_credit       (afu_tlx_cmd_initial_credit      ),
                                         .afu_tlx_cmd_rd_req               (afu_tlx_cmd_rd_req              ),
                                         .afu_tlx_cmd_rd_cnt               (afu_tlx_cmd_rd_cnt              ),
                                         .tlx_afu_cmd_data_valid           (tlx_afu_cmd_data_valid          ),
                                         .tlx_afu_cmd_data_bdi             (tlx_afu_cmd_data_bdi            ),
                                         .tlx_afu_cmd_data_bus             (tlx_afu_cmd_data_bus            ),
                                         .afu_tlx_resp_valid               (afu_tlx_resp_valid              ),
                                         .afu_tlx_resp_opcode              (afu_tlx_resp_opcode             ),
                                         .afu_tlx_resp_dl                  (afu_tlx_resp_dl                 ),
                                         .afu_tlx_resp_capptag             (afu_tlx_resp_capptag            ),
                                         .afu_tlx_resp_dp                  (afu_tlx_resp_dp                 ),
                                         .afu_tlx_resp_code                (afu_tlx_resp_code               ),
                                         .afu_tlx_rdata_valid              (afu_tlx_rdata_valid             ),
                                         .afu_tlx_rdata_bdi                (afu_tlx_rdata_bdi               ),
                                         .afu_tlx_rdata_bus                (afu_tlx_rdata_bus               ),
                                         .tlx_afu_resp_credit              (tlx_afu_resp_credit             ),
                                         .tlx_afu_resp_data_credit         (tlx_afu_resp_data_credit        ),
                                         .tlx_afu_resp_initial_credit      (tlx_afu_resp_initial_credit     ),
                                         .tlx_afu_resp_data_initial_credit (tlx_afu_resp_data_initial_credit),
                                         .mmio_wr                          (mmio_wr                         ),
                                         .mmio_rd                          (mmio_rd                         ),
                                         .mmio_dw                          (mmio_dw                         ),
                                         .mmio_addr                        (mmio_addr                       ),
                                         .mmio_din                         (mmio_din                        ),
                                         .mmio_dout                        (mmio_dout                       ),
                                         .mmio_done                        (mmio_done                       ),                       
                                         .mmio_failed                      (mmio_failed                     )                       
                                         );


//---- route TLX access to local SNAP registers or action register space ---- 
 mmio mmmio (
             .clk                        (clk_afu                    ),
             .rst_n                      (rst_n                      ),
             .debug_cnt_clear            (debug_cnt_clear            ),
             .debug_tlx_cnt_cmd          (debug_tlx_cnt_cmd          ),
             .debug_tlx_cnt_rsp          (debug_tlx_cnt_rsp          ),
             .debug_tlx_cnt_retry        (debug_tlx_cnt_retry        ),
             .debug_tlx_cnt_fail         (debug_tlx_cnt_fail         ),
             .debug_tlx_cnt_xlt_pd       (debug_tlx_cnt_xlt_pd       ),
             .debug_tlx_cnt_xlt_done     (debug_tlx_cnt_xlt_done     ),
             .debug_tlx_cnt_xlt_retry    (debug_tlx_cnt_xlt_retry    ),
             .debug_axi_cnt_cmd          (debug_axi_cnt_cmd          ), 
             .debug_axi_cnt_rsp          (debug_axi_cnt_rsp          ), 
             .debug_buf_cnt              (debug_buf_cnt              ), 
             .debug_traffic_idle         (debug_traffic_idle         ),
             .debug_tlx_idle_lim         (debug_tlx_idle_lim         ), 
             .debug_axi_idle_lim         (debug_axi_idle_lim         ),
             .fir_fifo_overflow          (fir_fifo_overflow          ),
             .fir_tlx_interface          (fir_tlx_interface          ),
             .soft_reset_brdg_odma       (soft_reset_brdg_odma       ),
             .soft_reset_action          (soft_reset_action          ),
             .mmio_wr                    (mmio_wr                    ),
             .mmio_rd                    (mmio_rd                    ),
             .mmio_dw                    (mmio_dw                    ),
             .mmio_addr                  (mmio_addr                  ),
             .mmio_din                   (mmio_din                   ),
             .mmio_dout                  (mmio_dout                  ),
             .mmio_done                  (mmio_done                  ),
             .mmio_failed                (mmio_failed                ),
             .lcl_wr                     (lcl_wr                     ),
             .lcl_rd                     (lcl_rd                     ),
             .lcl_addr                   (lcl_addr                   ),
             .lcl_din                    (lcl_din                    ),
             .lcl_ack                    (lcl_ack                    ),
             .lcl_rsp                    (lcl_rsp                    ),
             .lcl_dout                   (lcl_dout                   ),
             .lcl_dv                     (lcl_dv                     ) 
             );


//---- AXI lite interface to action as master ----
 axi_lite_master maxi_lite_master (
                                   .clk           (clk_afu      ),
                                   .rst_n         (rst_n        ),
                                   .m_axi_awready (m_axi_awready),   
                                   .m_axi_awaddr  (m_axi_awaddr ),
                                   .m_axi_awprot  (m_axi_awprot ), // not supported
                                   .m_axi_awvalid (m_axi_awvalid),
                                   .m_axi_wready  (m_axi_wready ),
                                   .m_axi_wdata   (m_axi_wdata  ),
                                   .m_axi_wstrb   (m_axi_wstrb  ), // not supported
                                   .m_axi_wvalid  (m_axi_wvalid ),
                                   .m_axi_bresp   (m_axi_bresp  ),
                                   .m_axi_bvalid  (m_axi_bvalid ),
                                   .m_axi_bready  (m_axi_bready ),
                                   .m_axi_arready (m_axi_arready),
                                   .m_axi_arvalid (m_axi_arvalid),
                                   .m_axi_araddr  (m_axi_araddr ),
                                   .m_axi_arprot  (m_axi_arprot ), // not supported
                                   .m_axi_rdata   (m_axi_rdata  ),
                                   .m_axi_rresp   (m_axi_rresp  ),
                                   .m_axi_rready  (m_axi_rready ),
                                   .m_axi_rvalid  (m_axi_rvalid ),
                                   .lcl_wr        (lcl_wr       ), // write enable
                                   .lcl_rd        (lcl_rd       ), // read enable
                                   .lcl_addr      (lcl_addr     ), // write/read address
                                   .lcl_din       (lcl_din      ), // write data
                                   .lcl_ack       (lcl_ack      ), // write data acknowledgement
                                   .lcl_rsp       (lcl_rsp      ), // write/read response: 0: good; 1: bad
                                   .lcl_dout      (lcl_dout     ), // read data
                                   .lcl_dv        (lcl_dv       )  // read data valid
                                  );


endmodule
