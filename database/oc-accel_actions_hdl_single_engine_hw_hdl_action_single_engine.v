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

module action_single_engine # (
           // Parameters of Axi Slave Bus Interface AXI_CTRL_REG
           parameter C_S_AXI_CTRL_REG_DATA_WIDTH    = 32,
           parameter C_S_AXI_CTRL_REG_ADDR_WIDTH    = 32,
       
           // Parameters of Axi Master Bus Interface AXI_HOST_MEM ; to Host memory
           parameter C_M_AXI_HOST_MEM_ID_WIDTH      = 2,
           parameter C_M_AXI_HOST_MEM_ADDR_WIDTH    = 64,
           parameter C_M_AXI_HOST_MEM_DATA_WIDTH    = 1024,
           parameter C_M_AXI_HOST_MEM_AWUSER_WIDTH  = 8,
           parameter C_M_AXI_HOST_MEM_ARUSER_WIDTH  = 8,
           parameter C_M_AXI_HOST_MEM_WUSER_WIDTH   = 1,
           parameter C_M_AXI_HOST_MEM_RUSER_WIDTH   = 1,
           parameter C_M_AXI_HOST_MEM_BUSER_WIDTH   = 1
)
(
input                                          clk                  ,
input                                          rst_n                ,


//---- AXI bus interfaced with SNAP core ----
  // AXI write address channel
output    [C_M_AXI_HOST_MEM_ID_WIDTH - 1:0]     m_axi_snap_awid     ,
output    [C_M_AXI_HOST_MEM_ADDR_WIDTH - 1:0]   m_axi_snap_awaddr   ,
output    [0007:0]                              m_axi_snap_awlen    ,
output    [0002:0]                              m_axi_snap_awsize   ,
output    [0001:0]                              m_axi_snap_awburst  ,
output    [0003:0]                              m_axi_snap_awcache  ,
output    [0001:0]                              m_axi_snap_awlock   ,
output    [0002:0]                              m_axi_snap_awprot   ,
output    [0003:0]                              m_axi_snap_awqos    ,
output    [0003:0]                              m_axi_snap_awregion ,
output    [C_M_AXI_HOST_MEM_AWUSER_WIDTH - 1:0] m_axi_snap_awuser   ,
output                                          m_axi_snap_awvalid  ,
input                                           m_axi_snap_awready  ,
  // AXI write data channel
output    [C_M_AXI_HOST_MEM_DATA_WIDTH - 1:0]   m_axi_snap_wdata    ,
output    [(C_M_AXI_HOST_MEM_DATA_WIDTH/8) -1:0]m_axi_snap_wstrb    ,
output                                          m_axi_snap_wlast    ,
output                                          m_axi_snap_wvalid   ,
input                                           m_axi_snap_wready   ,
  // AXI write response channel
output                                          m_axi_snap_bready   ,
input     [C_M_AXI_HOST_MEM_ID_WIDTH - 1:0]     m_axi_snap_bid      ,
input     [0001:0]                              m_axi_snap_bresp    ,
input                                           m_axi_snap_bvalid   ,
  // AXI read address channel
output    [C_M_AXI_HOST_MEM_ID_WIDTH - 1:0]     m_axi_snap_arid     ,
output    [C_M_AXI_HOST_MEM_ADDR_WIDTH - 1:0]   m_axi_snap_araddr   ,
output    [0007:0]                              m_axi_snap_arlen    ,
output    [0002:0]                              m_axi_snap_arsize   ,
output    [0001:0]                              m_axi_snap_arburst  ,
output    [C_M_AXI_HOST_MEM_ARUSER_WIDTH - 1:0] m_axi_snap_aruser   ,
output    [0003:0]                              m_axi_snap_arcache  ,
output    [0001:0]                              m_axi_snap_arlock   ,
output    [0002:0]                              m_axi_snap_arprot   ,
output    [0003:0]                              m_axi_snap_arqos    ,
output    [0003:0]                              m_axi_snap_arregion ,
output                                          m_axi_snap_arvalid  ,
input                                           m_axi_snap_arready  ,
  // AXI  ead data channel
output                                          m_axi_snap_rready   ,
input     [C_M_AXI_HOST_MEM_ID_WIDTH - 1:0]     m_axi_snap_rid      ,
input     [C_M_AXI_HOST_MEM_DATA_WIDTH - 1:0]   m_axi_snap_rdata    ,
input     [0001:0]                              m_axi_snap_rresp    ,
input                                           m_axi_snap_rlast    ,
input                                           m_axi_snap_rvalid   ,


//---- AXI Lite bus interfaced with SNAP core ----
  // AXI write address channel
output                                          s_axi_snap_awready  ,
input     [C_S_AXI_CTRL_REG_ADDR_WIDTH - 1:0]   s_axi_snap_awaddr   ,
input                                           s_axi_snap_awvalid  ,
  // axi write data channel
output                                          s_axi_snap_wready   ,
input     [C_S_AXI_CTRL_REG_DATA_WIDTH - 1:0]   s_axi_snap_wdata    ,
input     [(C_S_AXI_CTRL_REG_DATA_WIDTH/8) -1:0]s_axi_snap_wstrb    ,
input                                           s_axi_snap_wvalid   ,
  // AXI response channel
output    [0001:0]                              s_axi_snap_bresp    ,
output                                          s_axi_snap_bvalid   ,
input                                           s_axi_snap_bready   ,
  // AXI read address channel
output                                          s_axi_snap_arready  ,
input                                           s_axi_snap_arvalid  ,
input     [C_S_AXI_CTRL_REG_ADDR_WIDTH - 1:0]   s_axi_snap_araddr   ,
  // AXI read data channel
output    [C_S_AXI_CTRL_REG_DATA_WIDTH - 1:0]   s_axi_snap_rdata    ,
output    [0001:0]                              s_axi_snap_rresp    ,
input                                           s_axi_snap_rready   ,
output                                          s_axi_snap_rvalid   ,

// Other signals
input      [31:0]                               i_action_type       ,
input      [31:0]                               i_action_version
);

 

wire            engine_start_pulse ;
wire            wrap_mode          ;
wire  [03:0]    wrap_len           ;
wire  [63:0]    source_address     ;
wire  [63:0]    target_address     ;
wire  [31:0]    rd_init_data       ;
wire  [31:0]    wr_init_data       ;
wire  [31:0]    rd_pattern         ;
wire  [31:0]    rd_number          ;
wire  [31:0]    wr_pattern         ;
wire  [31:0]    wr_number          ;
wire            rd_done_pulse      ;
wire            wr_done_pulse      ;
wire  [1:0]     rd_error           ;
wire  [63:0]    rd_error_info      ;
wire            tt_arvalid         ; //arvalid & arready
wire            tt_rlast           ; //rlast & rvalid & rready
wire            tt_awvalid         ; //awvalid & awready
wire            tt_bvalid          ; //bvalid & bready
wire  [4:0]     tt_arid            ;
wire  [4:0]     tt_awid            ;
wire  [4:0]     tt_rid             ;
wire  [4:0]     tt_bid             ;
wire  [31:0]    snap_context       ;



//---- registers hub for AXI Lite interface ----
 axi_lite_slave #(
           .DATA_WIDTH   (C_S_AXI_CTRL_REG_DATA_WIDTH   ),
           .ADDR_WIDTH   (C_S_AXI_CTRL_REG_ADDR_WIDTH   )
 ) maxi_lite_slave (
                      .clk                ( clk                ) ,
                      .rst_n              ( rst_n              ) ,
                      .s_axi_awready      ( s_axi_snap_awready ) ,
                      .s_axi_awaddr       ( s_axi_snap_awaddr  ) ,//32b
                      .s_axi_awvalid      ( s_axi_snap_awvalid ) ,
                      .s_axi_wready       ( s_axi_snap_wready  ) ,
                      .s_axi_wdata        ( s_axi_snap_wdata   ) ,//32b
                      .s_axi_wstrb        ( s_axi_snap_wstrb   ) ,//4b
                      .s_axi_wvalid       ( s_axi_snap_wvalid  ) ,
                      .s_axi_bresp        ( s_axi_snap_bresp   ) ,//2b
                      .s_axi_bvalid       ( s_axi_snap_bvalid  ) ,
                      .s_axi_bready       ( s_axi_snap_bready  ) ,
                      .s_axi_arready      ( s_axi_snap_arready ) ,
                      .s_axi_arvalid      ( s_axi_snap_arvalid ) ,
                      .s_axi_araddr       ( s_axi_snap_araddr  ) ,//32b
                      .s_axi_rdata        ( s_axi_snap_rdata   ) ,//32b
                      .s_axi_rresp        ( s_axi_snap_rresp   ) ,//2b
                      .s_axi_rready       ( s_axi_snap_rready  ) ,
                      .s_axi_rvalid       ( s_axi_snap_rvalid  ) ,

                      .engine_start_pulse ( engine_start_pulse ) ,
                      .wrap_mode          ( wrap_mode          ) ,
                      .wrap_len           ( wrap_len           ) ,
                      .source_address     ( source_address     ) ,
                      .target_address     ( target_address     ) ,
                      .rd_init_data       ( rd_init_data       ) ,
                      .wr_init_data       ( wr_init_data       ) ,
                      .rd_pattern         ( rd_pattern         ) ,
                      .rd_number          ( rd_number          ) ,
                      .wr_pattern         ( wr_pattern         ) ,
                      .wr_number          ( wr_number          ) ,

                      .rd_done_pulse      ( rd_done_pulse      ) ,
                      .wr_done_pulse      ( wr_done_pulse      ) ,
                      .rd_error           ( rd_error           ) ,
                      .rd_error_info      ( rd_error_info      ) ,
                      .wr_error           ( wr_error           ) ,
                      .tt_arvalid         ( tt_arvalid         ) , //arvalid & arready
                      .tt_rlast           ( tt_rlast           ) , //rlast & rvalid & rready
                      .tt_awvalid         ( tt_awvalid         ) , //awvalid & awready
                      .tt_bvalid          ( tt_bvalid          ) , //bvalid & bready

                      .tt_arid            ( tt_arid            ) ,
                      .tt_awid            ( tt_awid            ) ,
                      .tt_rid             ( tt_rid             ) ,
                      .tt_bid             ( tt_bid             ) ,

                      .i_action_type      ( i_action_type      ) ,
                      .i_action_version   ( i_action_version   ) ,
                      .o_snap_context     ( snap_context       )
           );
 assign tt_arvalid = m_axi_snap_arvalid && m_axi_snap_arready;
 assign tt_rlast = m_axi_snap_rvalid && m_axi_snap_rready && m_axi_snap_rlast;
 assign tt_arid = m_axi_snap_arid;
 assign tt_rid = m_axi_snap_rid;

 assign tt_awvalid = m_axi_snap_awvalid && m_axi_snap_awready;
 assign tt_bvalid = m_axi_snap_bvalid && m_axi_snap_bready;
 assign tt_awid = m_axi_snap_awid;
 assign tt_bid = m_axi_snap_bid;

//---- writing channel of AXI master interface facing SNAP ----
 axi_master_wr#(
                .ID_WIDTH     (C_M_AXI_HOST_MEM_ID_WIDTH     ),
                .ADDR_WIDTH   (C_M_AXI_HOST_MEM_ADDR_WIDTH   ),
                .DATA_WIDTH   (C_M_AXI_HOST_MEM_DATA_WIDTH   ),
                .AWUSER_WIDTH (C_M_AXI_HOST_MEM_AWUSER_WIDTH ),
                .ARUSER_WIDTH (C_M_AXI_HOST_MEM_ARUSER_WIDTH ),
                .WUSER_WIDTH  (C_M_AXI_HOST_MEM_WUSER_WIDTH  ),
                .RUSER_WIDTH  (C_M_AXI_HOST_MEM_RUSER_WIDTH  ),
                .BUSER_WIDTH  (C_M_AXI_HOST_MEM_BUSER_WIDTH  )
                ) maxi_master_wr( 
       .clk                (clk                ),
       .rst_n              (rst_n), 
       .m_axi_awid         (m_axi_snap_awid    ), 
       .m_axi_awaddr       (m_axi_snap_awaddr  ), 
       .m_axi_awlen        (m_axi_snap_awlen   ),
       .m_axi_awsize       (m_axi_snap_awsize  ),
       .m_axi_awburst      (m_axi_snap_awburst ),
       .m_axi_awcache      (m_axi_snap_awcache ),
       .m_axi_awlock       (m_axi_snap_awlock  ),
       .m_axi_awprot       (m_axi_snap_awprot  ),
       .m_axi_awqos        (m_axi_snap_awqos   ),
       .m_axi_awregion     (m_axi_snap_awregion),
       .m_axi_awuser       (m_axi_snap_awuser  ),
       .m_axi_awvalid      (m_axi_snap_awvalid ),
       .m_axi_awready      (m_axi_snap_awready ),
       .m_axi_wdata        (m_axi_snap_wdata   ),
       .m_axi_wstrb        (m_axi_snap_wstrb   ),
       .m_axi_wlast        (m_axi_snap_wlast   ),
       .m_axi_wvalid       (m_axi_snap_wvalid  ),
       .m_axi_wready       (m_axi_snap_wready  ),
       .m_axi_bready       (m_axi_snap_bready  ),
       .m_axi_bid          (m_axi_snap_bid     ), 
       .m_axi_bresp        (m_axi_snap_bresp   ),
       .m_axi_bvalid       (m_axi_snap_bvalid  ),
       .engine_start_pulse (engine_start_pulse ),
       .wrap_mode          ( wrap_mode          ) ,
       .wrap_len           ( wrap_len           ) ,
       .target_address     (target_address     ),
       .wr_init_data       (wr_init_data       ),
       .wr_pattern         (wr_pattern         ),
       .wr_number          (wr_number          ),
       .wr_done_pulse      (wr_done_pulse      ),
       .wr_error           (wr_error           ),
       .i_snap_context     (snap_context       )
      );



//---- writing channel of AXI master interface facing SNAP ----
 axi_master_rd#(
                .ID_WIDTH     (C_M_AXI_HOST_MEM_ID_WIDTH     ),
                .ADDR_WIDTH   (C_M_AXI_HOST_MEM_ADDR_WIDTH   ),
                .DATA_WIDTH   (C_M_AXI_HOST_MEM_DATA_WIDTH   ),
                .AWUSER_WIDTH (C_M_AXI_HOST_MEM_AWUSER_WIDTH ),
                .ARUSER_WIDTH (C_M_AXI_HOST_MEM_ARUSER_WIDTH ),
                .WUSER_WIDTH  (C_M_AXI_HOST_MEM_WUSER_WIDTH  ),
                .RUSER_WIDTH  (C_M_AXI_HOST_MEM_RUSER_WIDTH  ),
                .BUSER_WIDTH  (C_M_AXI_HOST_MEM_BUSER_WIDTH  )
                ) maxi_master_rd( 
      .clk                (clk                ),
      .rst_n              (rst_n), 
      .m_axi_arid         (m_axi_snap_arid    ),
      .m_axi_araddr       (m_axi_snap_araddr  ),
      .m_axi_arlen        (m_axi_snap_arlen   ),
      .m_axi_arsize       (m_axi_snap_arsize  ),
      .m_axi_arburst      (m_axi_snap_arburst ),
      .m_axi_aruser       (m_axi_snap_aruser  ),
      .m_axi_arcache      (m_axi_snap_arcache ),
      .m_axi_arlock       (m_axi_snap_arlock  ),
      .m_axi_arprot       (m_axi_snap_arprot  ),
      .m_axi_arqos        (m_axi_snap_arqos   ),
      .m_axi_arregion     (m_axi_snap_arregion),
      .m_axi_arvalid      (m_axi_snap_arvalid ),
      .m_axi_arready      (m_axi_snap_arready ),
      .m_axi_rready       (m_axi_snap_rready  ),
      .m_axi_rid          (m_axi_snap_rid     ),
      .m_axi_rdata        (m_axi_snap_rdata   ),
      .m_axi_rresp        (m_axi_snap_rresp   ),
      .m_axi_rlast        (m_axi_snap_rlast   ),
      .m_axi_rvalid       (m_axi_snap_rvalid  ),
      .engine_start_pulse (engine_start_pulse ),
      .wrap_mode          ( wrap_mode          ) ,
      .wrap_len           ( wrap_len           ) ,
      .source_address     (source_address     ),
      .rd_init_data       (rd_init_data       ),
      .rd_pattern         (rd_pattern         ),
      .rd_number          (rd_number          ),
      .rd_done_pulse      (rd_done_pulse      ),
      .rd_error           (rd_error           ),
      .rd_error_info      (rd_error_info      ),
      .i_snap_context     (snap_context       )
     );

endmodule
