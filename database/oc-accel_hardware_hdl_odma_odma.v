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

`include "odma_defines.v"


//
//
//
//
//
//
//
//
//
//
//

module odma #(
                parameter    IDW = 5,
                parameter    AXI_MM_DW = 1024,
                parameter    AXI_MM_AW = 64,
                parameter    AXI_ST_DW = 1024,
                parameter    AXI_ST_AW = 64,
                parameter    AXI_LITE_DW = 32,
                parameter    AXI_LITE_AW = 32,
                parameter    AXI_MM_AWUSER = 9,
                parameter    AXI_MM_ARUSER = 9,
                parameter    AXI_MM_WUSER = 1,
                parameter    AXI_MM_RUSER = 1,
                parameter    AXI_MM_BUSER = 1,
                parameter    AXI_ST_USER = 8
)
(
                //------ synchronous clock and reset signals -----// 
                input                           clk               ,
                input                           rst_n             ,
                input                           action_interrupt  ,
                output                          action_interrupt_ack,
                input  [0008:0]                 action_interrupt_ctx,
                input  [0063:0]                 action_interrupt_src,
                output                          odma_interrupt    ,
                input                           odma_interrupt_ack,
                output [0008:0]                 odma_interrupt_ctx,
                output [0063:0]                 odma_interrupt_src,

                //-------------- LCL Read Interface --------------//
                //-------------- Read Addr/Req Channel -----------//
                output                          lcl_rd_valid      ,
                output [0063:0]                 lcl_rd_ea         ,
                output [IDW - 1:0]              lcl_rd_axi_id     ,
                output                          lcl_rd_first      ,
                output                          lcl_rd_last       ,
                output [0127:0]                 lcl_rd_be         ,
                output [0008:0]                 lcl_rd_ctx        ,
                output                          lcl_rd_ctx_valid  ,
                input                           lcl_rd_ready      ,
                //-------------- Read Data/Resp Channel-----------//
                input                           lcl_rd_data_valid ,
                input  [1023:0]                 lcl_rd_data       ,
                input  [IDW - 1:0]              lcl_rd_data_axi_id,
                input                           lcl_rd_data_last  ,
                input                           lcl_rd_rsp_code   ,
                output [0031:0]                 lcl_rd_rsp_ready  ,
                output [0031:0]                 lcl_rd_rsp_ready_hint,
                //-------------- LCL Write Interface -------------//
                //-------------- Write Addr/Data Channel ---------//
                output                          lcl_wr_valid      ,
                output [0063:0]                 lcl_wr_ea         ,
                output [IDW - 1:0]              lcl_wr_axi_id     ,
                output [0127:0]                 lcl_wr_be         ,
                output                          lcl_wr_first      ,
                output                          lcl_wr_last       ,
                output [1023:0]                 lcl_wr_data       ,
                output [0008:0]                 lcl_wr_ctx        ,
                output                          lcl_wr_ctx_valid  ,
                input                           lcl_wr_ready      ,
                //-------------- Write Response Channel ----------//
                input                           lcl_wr_rsp_valid  ,
                input  [IDW - 1:0]              lcl_wr_rsp_axi_id ,
                input                           lcl_wr_rsp_code   ,
                output [0031:0]                 lcl_wr_rsp_ready  ,
`ifndef ENABLE_ODMA_ST_MODE
                //--------------- AXI4-MM Interface --------------//
                //---------- Write Addr/Req Channel --------------//
                output [AXI_MM_AW - 1:0]        axi_mm_awaddr     ,
                output [IDW - 1:0]              axi_mm_awid       ,
                output [0007:0]                 axi_mm_awlen      ,
                output [0002:0]                 axi_mm_awsize     ,
                output [0001:0]                 axi_mm_awburst    ,
                output [0002:0]                 axi_mm_awprot     ,
                output [0003:0]                 axi_mm_awqos      ,
                output [0003:0]                 axi_mm_awregion   ,
                output [AXI_MM_AWUSER - 1:0]    axi_mm_awuser     ,
                output                          axi_mm_awvalid    ,
                output [0001:0]                 axi_mm_awlock     ,
                output [0003:0]                 axi_mm_awcache    ,
                input                           axi_mm_awready    ,
                //---------- Write Data Channel ------------------//
                output [AXI_MM_DW - 1:0]        axi_mm_wdata      ,
                output                          axi_mm_wlast      ,
                output [AXI_MM_DW/8 - 1:0]      axi_mm_wstrb      ,
                output                          axi_mm_wvalid     ,
                output [AXI_MM_WUSER - 1:0]     axi_mm_wuser      ,
                input                           axi_mm_wready     ,
                //---------- Write Response Channel --------------//
                input                           axi_mm_bvalid     ,
                input  [0001:0]                 axi_mm_bresp      ,
                input  [IDW - 1:0]              axi_mm_bid        ,
                input  [AXI_MM_BUSER - 1:0]     axi_mm_buser      ,
                output                          axi_mm_bready     ,
                //---------- Read Addr/Req Channel  --------------//
                output [AXI_MM_AW - 1:0]        axi_mm_araddr     ,        
                output [0001:0]                 axi_mm_arburst    ,        
                output [0003:0]                 axi_mm_arcache    ,        
                output [IDW - 1:0]              axi_mm_arid       ,        
                output [0007:0]                 axi_mm_arlen      ,        
                output [0001:0]                 axi_mm_arlock     ,        
                output [0002:0]                 axi_mm_arprot     ,        
                output [0003:0]                 axi_mm_arqos      ,        
                input                           axi_mm_arready    ,       
                output [0003:0]                 axi_mm_arregion   ,       
                output [0002:0]                 axi_mm_arsize     ,       
                output [AXI_MM_ARUSER - 1:0]    axi_mm_aruser     ,       
                output                          axi_mm_arvalid    ,       
                //------------- Read Data Channel ----------------//
                input  [AXI_MM_DW - 1:0]        axi_mm_rdata      ,         
                input  [IDW - 1:0]              axi_mm_rid        ,         
                input                           axi_mm_rlast      ,         
                output                          axi_mm_rready     ,         
                input  [0001:0]                 axi_mm_rresp      ,         
                input  [AXI_MM_RUSER - 1:0]     axi_mm_ruser      ,         
                input                           axi_mm_rvalid     ,         
`else
                //--------------- AXI4-ST Interface --------------//
                //---------- H2C AXI4-ST Channel 0 ---------------//
                input                           m_axis_tready     ,
                output                          m_axis_tlast      ,
                output [AXI_ST_DW - 1:0]        m_axis_tdata      ,
                output [AXI_ST_DW/8 - 1:0]      m_axis_tkeep      ,
                output                          m_axis_tvalid     ,
                output [IDW - 1:0]              m_axis_tid        ,
                output [AXI_ST_USER - 1:0]      m_axis_tuser      ,
                //---------- C2H AXI4-ST Channel 0 ---------------//
                output                          s_axis_tready     ,
                input                           s_axis_tlast      ,
                input  [AXI_ST_DW - 1:0]        s_axis_tdata      ,
                input  [AXI_ST_DW/8 - 1:0]      s_axis_tkeep      ,
                input                           s_axis_tvalid     ,
                input  [IDW - 1:0]              s_axis_tid        ,
                input  [AXI_ST_USER - 1:0]      s_axis_tuser      ,
`endif
                //-------- Host AXI-Lite slave Interface ---------//
                input                           h_s_axi_arvalid   ,        
                input  [AXI_LITE_AW - 1:0]      h_s_axi_araddr    ,        
                output                          h_s_axi_arready   ,        
                output                          h_s_axi_rvalid    ,        
                output [AXI_LITE_DW - 1:0]      h_s_axi_rdata     ,        
                output [0001:0]                 h_s_axi_rresp     ,        
                input                           h_s_axi_rready    ,        
                input                           h_s_axi_awvalid   ,        
                input  [AXI_LITE_AW - 1:0]      h_s_axi_awaddr    ,        
                output                          h_s_axi_awready   ,        
                input                           h_s_axi_wvalid    ,        
                input  [AXI_LITE_DW - 1:0]      h_s_axi_wdata     ,        
                input  [AXI_LITE_DW/8 - 1:0]    h_s_axi_wstrb     ,        
                output                          h_s_axi_wready    ,        
                output                          h_s_axi_bvalid    ,        
                output [0001:0]                 h_s_axi_bresp     ,        
                input                           h_s_axi_bready    ,        
                //------- Action AXI-Lite slave Interface --------//
                input                           a_s_axi_arvalid   ,        
                input  [AXI_LITE_AW - 1:0]      a_s_axi_araddr    ,        
                output                          a_s_axi_arready   ,        
                output                          a_s_axi_rvalid    ,        
                output [AXI_LITE_DW - 1:0]      a_s_axi_rdata     ,        
                output [0001:0]                 a_s_axi_rresp     ,        
                input                           a_s_axi_rready    ,        
                input                           a_s_axi_awvalid   ,        
                input  [AXI_LITE_AW - 1:0]      a_s_axi_awaddr    ,        
                output                          a_s_axi_awready   ,        
                input                           a_s_axi_wvalid    ,        
                input  [AXI_LITE_DW - 1:0]      a_s_axi_wdata     ,        
                input  [AXI_LITE_DW/8 - 1:0]    a_s_axi_wstrb     ,        
                output                          a_s_axi_wready    ,        
                output                          a_s_axi_bvalid    ,        
                output [0001:0]                 a_s_axi_bresp     ,        
                input                           a_s_axi_bready    ,         
                //------- Action AXI-Lite master Interface -------//
                output                          a_m_axi_arvalid   ,
                output [AXI_LITE_AW - 1:0]      a_m_axi_araddr    ,
                input                           a_m_axi_arready   ,
                input                           a_m_axi_rvalid    ,
                input  [AXI_LITE_DW - 1:0]      a_m_axi_rdata     ,
                input  [0001:0]                 a_m_axi_rresp     ,
                output                          a_m_axi_rready    ,
                output                          a_m_axi_awvalid   ,
                output [AXI_LITE_AW - 1:0]      a_m_axi_awaddr    ,
                input                           a_m_axi_awready   ,
                output                          a_m_axi_wvalid    ,
                output [AXI_LITE_DW - 1:0]      a_m_axi_wdata     ,
                output [AXI_LITE_DW/8 - 1:0]    a_m_axi_wstrb     ,
                input                           a_m_axi_wready    ,
                input                           a_m_axi_bvalid    ,
                input  [0001:0]                 a_m_axi_bresp     ,
                output                          a_m_axi_bready          
                );

// Interface betwwen cfg_engine (registers) and dsc_manager
wire             dsc_ch0_run;     
wire             dsc_ch1_run;     
wire             dsc_ch2_run;     
wire             dsc_ch3_run;     
wire             dsc_ch0_h2a;     
wire             dsc_ch1_h2a;     
wire             dsc_ch2_h2a;     
wire             dsc_ch3_h2a;     
wire             dsc_ch0_axi_st;  
wire             dsc_ch1_axi_st;  
wire             dsc_ch2_axi_st;  
wire             dsc_ch3_axi_st;  
wire [0063:0]    dsc_ch0_dsc_addr;
wire [0063:0]    dsc_ch1_dsc_addr;
wire [0063:0]    dsc_ch2_dsc_addr;
wire [0063:0]    dsc_ch3_dsc_addr;
wire [0005:0]    dsc_ch0_dsc_adj; 
wire [0005:0]    dsc_ch1_dsc_adj; 
wire [0005:0]    dsc_ch2_dsc_adj; 
wire [0005:0]    dsc_ch3_dsc_adj; 
wire [0004:0]    dsc_ch0_dsc_err; 
wire [0004:0]    dsc_ch1_dsc_err; 
wire [0004:0]    dsc_ch2_dsc_err; 
wire [0004:0]    dsc_ch3_dsc_err; 

wire [0003:0]    manager_start;
assign manager_start = {dsc_ch3_run, dsc_ch2_run, dsc_ch1_run, dsc_ch0_run};

// Interface between cfg_engine (registers) and cmp_manager
wire             cmp_ch0_poll_wb_en;  
wire             cmp_ch1_poll_wb_en;  
wire             cmp_ch2_poll_wb_en;  
wire             cmp_ch3_poll_wb_en;  
wire [0063:0]    cmp_ch0_poll_wb_addr;
wire [0063:0]    cmp_ch1_poll_wb_addr;
wire [0063:0]    cmp_ch2_poll_wb_addr;
wire [0063:0]    cmp_ch3_poll_wb_addr;
wire [0031:0]    cmp_ch0_poll_wb_size;
wire [0031:0]    cmp_ch1_poll_wb_size;
wire [0031:0]    cmp_ch2_poll_wb_size;
wire [0031:0]    cmp_ch3_poll_wb_size;
wire [0004:0]    cmp_ch0_wr_err;      
wire [0004:0]    cmp_ch1_wr_err;      
wire [0004:0]    cmp_ch2_wr_err;      
wire [0004:0]    cmp_ch3_wr_err;      
wire [0004:0]    cmp_ch0_rd_err;      
wire [0004:0]    cmp_ch1_rd_err;      
wire [0004:0]    cmp_ch2_rd_err;      
wire [0004:0]    cmp_ch3_rd_err;      
wire [0031:0]    cmp_ch0_dsc_cnt;     
wire [0031:0]    cmp_ch1_dsc_cnt;     
wire [0031:0]    cmp_ch2_dsc_cnt;     
wire [0031:0]    cmp_ch3_dsc_cnt;     
wire [0063:0]    cmp_ch0_obj_handle;
wire [0063:0]    cmp_ch1_obj_handle;
wire [0063:0]    cmp_ch2_obj_handle;
wire [0063:0]    cmp_ch3_obj_handle;

//TODO: Tie to 0s for the first version
assign cmp_ch0_wr_err = 5'b0;
assign cmp_ch0_rd_err = 5'b0;
assign cmp_ch1_wr_err = 5'b0;
assign cmp_ch1_rd_err = 5'b0;
assign cmp_ch2_wr_err = 5'b0;
assign cmp_ch2_rd_err = 5'b0;
assign cmp_ch3_wr_err = 5'b0;
assign cmp_ch3_rd_err = 5'b0;

assign cmp_ch0_dsc_cnt = 32'd0;
assign cmp_ch1_dsc_cnt = 32'd0;
assign cmp_ch2_dsc_cnt = 32'd0;
assign cmp_ch3_dsc_cnt = 32'd0;

odma_registers #(
                .DATA_WIDTH ( AXI_LITE_DW ),
                .ADDR_WIDTH ( AXI_LITE_AW )
                )
               registers (
  /*input                          */      .clk                  ( clk                  ),
  /*input                          */      .rst_n                ( rst_n                ),
  /* Host AXI lite slave interface */
  /*input                          */      .h_s_axi_arvalid      ( h_s_axi_arvalid      ),
  /*input  [ADDR_WIDTH-1 : 0]      */      .h_s_axi_araddr       ( h_s_axi_araddr       ),
  /*output                         */      .h_s_axi_arready      ( h_s_axi_arready      ),
  /*output                         */      .h_s_axi_rvalid       ( h_s_axi_rvalid       ),
  /*output [DATA_WIDTH-1 : 0 ]     */      .h_s_axi_rdata        ( h_s_axi_rdata        ),
  /*output [1 : 0 ]                */      .h_s_axi_rresp        ( h_s_axi_rresp        ),
  /*input                          */      .h_s_axi_rready       ( h_s_axi_rready       ),
  /*input                          */      .h_s_axi_awvalid      ( h_s_axi_awvalid      ),
  /*input  [ADDR_WIDTH-1 : 0]      */      .h_s_axi_awaddr       ( h_s_axi_awaddr       ),
  /*output                         */      .h_s_axi_awready      ( h_s_axi_awready      ),
  /*input                          */      .h_s_axi_wvalid       ( h_s_axi_wvalid       ),
  /*input  [DATA_WIDTH-1 : 0 ]     */      .h_s_axi_wdata        ( h_s_axi_wdata        ),
  /*input  [STRB_WIDTH-1 : 0 ]     */      .h_s_axi_wstrb        ( h_s_axi_wstrb        ),
  /*output                         */      .h_s_axi_wready       ( h_s_axi_wready       ),
  /*output                         */      .h_s_axi_bvalid       ( h_s_axi_bvalid       ),
  /*output [1 : 0 ]                */      .h_s_axi_bresp        ( h_s_axi_bresp        ),
  /*input                          */      .h_s_axi_bready       ( h_s_axi_bready       ),
  /* Action AXI lite slave interface */
  /*input                          */      .a_s_axi_arvalid      ( a_s_axi_arvalid      ),
  /*input  [ADDR_WIDTH-1 : 0]      */      .a_s_axi_araddr       ( a_s_axi_araddr       ),
  /*output                         */      .a_s_axi_arready      ( a_s_axi_arready      ),
  /*output                         */      .a_s_axi_rvalid       ( a_s_axi_rvalid       ),
  /*output [DATA_WIDTH-1 : 0 ]     */      .a_s_axi_rdata        ( a_s_axi_rdata        ),
  /*output [1 : 0 ]                */      .a_s_axi_rresp        ( a_s_axi_rresp        ),
  /*input                          */      .a_s_axi_rready       ( a_s_axi_rready       ),
  /*input                          */      .a_s_axi_awvalid      ( a_s_axi_awvalid      ),
  /*input  [ADDR_WIDTH-1 : 0]      */      .a_s_axi_awaddr       ( a_s_axi_awaddr       ),
  /*output                         */      .a_s_axi_awready      ( a_s_axi_awready      ),
  /*input                          */      .a_s_axi_wvalid       ( a_s_axi_wvalid       ),
  /*input  [DATA_WIDTH-1 : 0 ]     */      .a_s_axi_wdata        ( a_s_axi_wdata        ),
  /*input  [STRB_WIDTH-1 : 0 ]     */      .a_s_axi_wstrb        ( a_s_axi_wstrb        ),
  /*output                         */      .a_s_axi_wready       ( a_s_axi_wready       ),
  /*output                         */      .a_s_axi_bvalid       ( a_s_axi_bvalid       ),
  /*output [1 : 0 ]                */      .a_s_axi_bresp        ( a_s_axi_bresp        ),
  /*input                          */      .a_s_axi_bready       ( a_s_axi_bready       ),
  /* Action AXI lite master interface */ 
  /*output                         */      .a_m_axi_arvalid      ( a_m_axi_arvalid      ),
  /*output [ADDR_WIDTH-1 : 0]      */      .a_m_axi_araddr       ( a_m_axi_araddr       ),
  /*input                          */      .a_m_axi_arready      ( a_m_axi_arready      ),
  /*input                          */      .a_m_axi_rvalid       ( a_m_axi_rvalid       ),
  /*input  [DATA_WIDTH-1 : 0 ]     */      .a_m_axi_rdata        ( a_m_axi_rdata        ),
  /*input  [1 : 0 ]                */      .a_m_axi_rresp        ( a_m_axi_rresp        ),
  /*output reg                     */      .a_m_axi_rready       ( a_m_axi_rready       ),
  /*output                         */      .a_m_axi_awvalid      ( a_m_axi_awvalid      ),
  /*output [ADDR_WIDTH-1 : 0]      */      .a_m_axi_awaddr       ( a_m_axi_awaddr       ),
  /*input                          */      .a_m_axi_awready      ( a_m_axi_awready      ),
  /*output                         */      .a_m_axi_wvalid       ( a_m_axi_wvalid       ),
  /*output [DATA_WIDTH-1 : 0 ]     */      .a_m_axi_wdata        ( a_m_axi_wdata        ),
  /*output [STRB_WIDTH-1 : 0 ]     */      .a_m_axi_wstrb        ( a_m_axi_wstrb        ),
  /*input                          */      .a_m_axi_wready       ( a_m_axi_wready       ),
  /*input                          */      .a_m_axi_bvalid       ( a_m_axi_bvalid       ),
  /*input  [1 : 0 ]                */      .a_m_axi_bresp        ( a_m_axi_bresp        ),
  /*output reg                     */      .a_m_axi_bready       ( a_m_axi_bready       ),
  /* dsc engine interface */ 
  /*output                         */      .dsc_ch0_run          ( dsc_ch0_run          ),
  /*output                         */      .dsc_ch1_run          ( dsc_ch1_run          ),
  /*output                         */      .dsc_ch2_run          ( dsc_ch2_run          ),
  /*output                         */      .dsc_ch3_run          ( dsc_ch3_run          ),
  /*output                         */      .dsc_ch0_h2a          ( dsc_ch0_h2a          ),
  /*output                         */      .dsc_ch1_h2a          ( dsc_ch1_h2a          ),
  /*output                         */      .dsc_ch2_h2a          ( dsc_ch2_h2a          ),
  /*output                         */      .dsc_ch3_h2a          ( dsc_ch3_h2a          ),
  /*output                         */      .dsc_ch0_axi_st       ( dsc_ch0_axi_st       ), 
  /*output                         */      .dsc_ch1_axi_st       ( dsc_ch1_axi_st       ),
  /*output                         */      .dsc_ch2_axi_st       ( dsc_ch2_axi_st       ),
  /*output                         */      .dsc_ch3_axi_st       ( dsc_ch3_axi_st       ),
  /*output [63: 0 ]                */      .dsc_ch0_dsc_addr     ( dsc_ch0_dsc_addr     ),
  /*output [63: 0 ]                */      .dsc_ch1_dsc_addr     ( dsc_ch1_dsc_addr     ),
  /*output [63: 0 ]                */      .dsc_ch2_dsc_addr     ( dsc_ch2_dsc_addr     ),
  /*output [63: 0 ]                */      .dsc_ch3_dsc_addr     ( dsc_ch3_dsc_addr     ),
  /*output [5 : 0 ]                */      .dsc_ch0_dsc_adj      ( dsc_ch0_dsc_adj      ),
  /*output [5 : 0 ]                */      .dsc_ch1_dsc_adj      ( dsc_ch1_dsc_adj      ),
  /*output [5 : 0 ]                */      .dsc_ch2_dsc_adj      ( dsc_ch2_dsc_adj      ),
  /*output [5 : 0 ]                */      .dsc_ch3_dsc_adj      ( dsc_ch3_dsc_adj      ),
  /*input  [4 : 0 ]                */      .dsc_ch0_dsc_err      ( dsc_ch0_dsc_err      ),
  /*input  [4 : 0 ]                */      .dsc_ch1_dsc_err      ( dsc_ch1_dsc_err      ),
  /*input  [4 : 0 ]                */      .dsc_ch2_dsc_err      ( dsc_ch2_dsc_err      ),
  /*input  [4 : 0 ]                */      .dsc_ch3_dsc_err      ( dsc_ch3_dsc_err      ),
  /* cmp engine interface */ 
  /*output                         */      .cmp_ch0_poll_wb_en   ( cmp_ch0_poll_wb_en   ),
  /*output                         */      .cmp_ch1_poll_wb_en   ( cmp_ch1_poll_wb_en   ),
  /*output                         */      .cmp_ch2_poll_wb_en   ( cmp_ch2_poll_wb_en   ),
  /*output                         */      .cmp_ch3_poll_wb_en   ( cmp_ch3_poll_wb_en   ),
  /*output [63: 0 ]                */      .cmp_ch0_poll_wb_addr ( cmp_ch0_poll_wb_addr ),
  /*output [63: 0 ]                */      .cmp_ch1_poll_wb_addr ( cmp_ch1_poll_wb_addr ),
  /*output [63: 0 ]                */      .cmp_ch2_poll_wb_addr ( cmp_ch2_poll_wb_addr ),
  /*output [63: 0 ]                */      .cmp_ch3_poll_wb_addr ( cmp_ch3_poll_wb_addr ),
  /*output [31: 0 ]                */      .cmp_ch0_poll_wb_size ( cmp_ch0_poll_wb_size ),
  /*output [31: 0 ]                */      .cmp_ch1_poll_wb_size ( cmp_ch1_poll_wb_size ),
  /*output [31: 0 ]                */      .cmp_ch2_poll_wb_size ( cmp_ch2_poll_wb_size ),
  /*output [31: 0 ]                */      .cmp_ch3_poll_wb_size ( cmp_ch3_poll_wb_size ),
  /*input  [4 : 0 ]                */      .cmp_ch0_wr_err       ( cmp_ch0_wr_err       ),
  /*input  [4 : 0 ]                */      .cmp_ch1_wr_err       ( cmp_ch1_wr_err       ),
  /*input  [4 : 0 ]                */      .cmp_ch2_wr_err       ( cmp_ch2_wr_err       ),
  /*input  [4 : 0 ]                */      .cmp_ch3_wr_err       ( cmp_ch3_wr_err       ),
  /*input  [4 : 0 ]                */      .cmp_ch0_rd_err       ( cmp_ch0_rd_err       ),
  /*input  [4 : 0 ]                */      .cmp_ch1_rd_err       ( cmp_ch1_rd_err       ),
  /*input  [4 : 0 ]                */      .cmp_ch2_rd_err       ( cmp_ch2_rd_err       ),
  /*input  [4 : 0 ]                */      .cmp_ch3_rd_err       ( cmp_ch3_rd_err       ),
  /*input  [31: 0 ]                */      .cmp_ch0_dsc_cnt      ( cmp_ch0_dsc_cnt      ),
  /*input  [31: 0 ]                */      .cmp_ch1_dsc_cnt      ( cmp_ch1_dsc_cnt      ),
  /*input  [31: 0 ]                */      .cmp_ch2_dsc_cnt      ( cmp_ch2_dsc_cnt      ),
  /*input  [31: 0 ]                */      .cmp_ch3_dsc_cnt      ( cmp_ch3_dsc_cnt      ), 
  /*output [63: 0 ]                */      .cmp_ch0_obj_handle   ( cmp_ch0_obj_handle   ),
  /*output [63: 0 ]                */      .cmp_ch1_obj_handle   ( cmp_ch1_obj_handle   ),
  /*output [63: 0 ]                */      .cmp_ch2_obj_handle   ( cmp_ch2_obj_handle   ),
  /*output [63: 0 ]                */      .cmp_ch3_obj_handle   ( cmp_ch3_obj_handle   )
                                           );
               
// Interface between dsc_manager and lcl_rd_arbiter
wire                dsc_lcl_rd_valid;      
wire [0063:0]       dsc_lcl_rd_ea;         
wire [IDW - 1:0]    dsc_lcl_rd_axi_id;     
wire                dsc_lcl_rd_first;      
wire                dsc_lcl_rd_last;       
wire [0127:0]       dsc_lcl_rd_be;         
wire [0008:0]       dsc_lcl_rd_ctx;        
wire                dsc_lcl_rd_ctx_valid;  
wire                dsc_lcl_rd_ready;      
wire                dsc_lcl_rd_data_valid; 
wire [1023:0]       dsc_lcl_rd_data;       
wire [IDW - 1:0]    dsc_lcl_rd_data_axi_id;
wire                dsc_lcl_rd_data_last;  
wire                dsc_lcl_rd_rsp_code;   
wire                dsc_lcl_rd_rsp_ready;  
wire                dsc_lcl_rd_rsp_ready_hint;  

assign dsc_lcl_rd_rsp_ready_hint = 1'b1;

// Interface between dsc_manager and cmp_manager
wire [0003:0]       channel_done;    
wire [0029:0]       channel_id0;     
wire [0029:0]       channel_id1;     
wire [0029:0]       channel_id2;     
wire [0029:0]       channel_id3;     
wire [0003:0]       manager_start_w;

// Interface between dsc_manager and h2a_mm_engine
wire                h2a_mm_dsc_ready;
wire                h2a_mm_dsc_valid;
wire [0255:0]       h2a_mm_dsc_data;

// Interface between dsc_manager and h2a_st_engine
wire                h2a_st_dsc_ready;
wire                h2a_st_dsc_valid;
wire [0255:0]       h2a_st_dsc_data;

// Interface between dsc_manager and a2h_mm_engine
wire                a2h_mm_dsc_ready;
wire                a2h_mm_dsc_valid;
wire [0255:0]       a2h_mm_dsc_data;

// Interface between dsc_manager and a2h_st_engine
wire                a2h_st_dsc_ready;
wire                a2h_st_dsc_valid;
wire [0255:0]       a2h_st_dsc_data;

wire [0003:0]       eng_buf_full;  
wire [0003:0]       eng_buf_write;

assign eng_buf_full = {!h2a_st_dsc_ready, !h2a_mm_dsc_ready, !a2h_st_dsc_ready, !a2h_mm_dsc_ready};
//assign a2h_st_dsc_ready = 1'b0;
//assign h2a_st_dsc_ready = 1'b0;

odma_descriptor_manager descriptor_manager (
         /*input                */         .clk                ( clk                    ),
         /*input                */         .rst_n              ( rst_n                  ),
         /*configure            */
         /*input      [0063:0]  */         .init_addr0         ( dsc_ch0_dsc_addr       ),
         /*input      [0063:0]  */         .init_addr1         ( dsc_ch1_dsc_addr       ),
         /*input      [0063:0]  */         .init_addr2         ( dsc_ch2_dsc_addr       ),
         /*input      [0063:0]  */         .init_addr3         ( dsc_ch3_dsc_addr       ),
         /*input      [0005:0]  */         .init_size0         ( dsc_ch0_dsc_adj        ),
         /*input      [0005:0]  */         .init_size1         ( dsc_ch1_dsc_adj        ),
         /*input      [0005:0]  */         .init_size2         ( dsc_ch2_dsc_adj        ),
         /*input      [0005:0]  */         .init_size3         ( dsc_ch3_dsc_adj        ),
         /*input                */         .dsc_ch0_h2a        ( dsc_ch0_h2a            ), //0:a2h 1:h2a
         /*input                */         .dsc_ch1_h2a        ( dsc_ch1_h2a            ),
         /*input                */         .dsc_ch2_h2a        ( dsc_ch2_h2a            ),
         /*input                */         .dsc_ch3_h2a        ( dsc_ch3_h2a            ),
         /*input                */         .dsc_ch0_axi_st     ( dsc_ch0_axi_st         ), //0:mm 1:st
         /*input                */         .dsc_ch1_axi_st     ( dsc_ch1_axi_st         ),
         /*input                */         .dsc_ch2_axi_st     ( dsc_ch2_axi_st         ),
         /*input                */         .dsc_ch3_axi_st     ( dsc_ch3_axi_st         ),
         /*output     [0063:0]  */         .manager_error      (                        ),
         /*input      [0003:0]  */         .manager_start      ( manager_start          ),
         /*Read                 */
         /*output               */         .lcl_rd_valid       ( dsc_lcl_rd_valid       ),
         /*output     [0063:0]  */         .lcl_rd_ea          ( dsc_lcl_rd_ea          ),
         /*output     [0004:0]  */         .lcl_rd_axi_id      ( dsc_lcl_rd_axi_id      ),
         /*output               */         .lcl_rd_last        ( dsc_lcl_rd_last        ),
         /*output               */         .lcl_rd_first       ( dsc_lcl_rd_first       ),
         /*output     [0127:0]  */         .lcl_rd_be          ( dsc_lcl_rd_be          ),
         /*output               */         .lcl_rd_ctx_valid   ( dsc_lcl_rd_ctx_valid   ),
         /*output     [0008:0]  */         .lcl_rd_ctx         ( dsc_lcl_rd_ctx         ),
         /*input                */         .lcl_rd_ready       ( dsc_lcl_rd_ready       ),
         /*input                */         .lcl_rd_data_valid  ( dsc_lcl_rd_data_valid  ),
         /*input      [0004:0]  */         .lcl_rd_data_axi_id ( dsc_lcl_rd_data_axi_id ),
         /*input      [1023:0]  */         .lcl_rd_data        ( dsc_lcl_rd_data        ),
         /*input                */         .lcl_rd_data_last   ( dsc_lcl_rd_data_last   ),
         /*input                */         .lcl_rd_rsp_code    ( dsc_lcl_rd_rsp_code    ),
         /*output               */         .lcl_rd_rsp_ready   ( dsc_lcl_rd_rsp_ready   ),
         /*completion           */
         /*output reg [0003:0]  */         .channel_done       ( channel_done           ),
         /*output reg [0029:0]  */         .channel_id0        ( channel_id0            ),
         /*output reg [0029:0]  */         .channel_id1        ( channel_id1            ),
         /*output reg [0029:0]  */         .channel_id2        ( channel_id2            ),
         /*output reg [0029:0]  */         .channel_id3        ( channel_id3            ),
         /*input      [0003:0]  */         .manager_start_w    ( manager_start_w        ),
         /*engine               */
         /*input      [0003:0]  */         .eng_buf_full       ( eng_buf_full           ),
         /*output     [0003:0]  */         .eng_buf_write      ( eng_buf_write          ),
         /*output reg [0255:0]  */         .eng_dsc_data0      ( a2h_mm_dsc_data        ),
         /*output reg [0255:0]  */         .eng_dsc_data1      ( a2h_st_dsc_data        ),
         /*output reg [0255:0]  */         .eng_dsc_data2      ( h2a_mm_dsc_data        ),
         /*output reg [0255:0]  */         .eng_dsc_data3      ( h2a_st_dsc_data        ) 
                                           );

// Interface between cmp_manager and h2a_mm_engine
wire                 h2a_mm_cmp_valid_0;
wire [0511:0]        h2a_mm_cmp_data_0;
wire                 h2a_mm_cmp_resp_0; 
wire                 h2a_mm_cmp_valid_1;
wire [0511:0]        h2a_mm_cmp_data_1; 
wire                 h2a_mm_cmp_resp_1; 
wire                 h2a_mm_cmp_valid_2;
wire [0511:0]        h2a_mm_cmp_data_2; 
wire                 h2a_mm_cmp_resp_2; 
wire                 h2a_mm_cmp_valid_3;
wire [0511:0]        h2a_mm_cmp_data_3; 
wire                 h2a_mm_cmp_resp_3; 

// Interface between cmp_manager and h2a_st_engine
wire                 h2a_st_cmp_valid_0;
wire [0511:0]        h2a_st_cmp_data_0;
wire                 h2a_st_cmp_resp_0; 
wire                 h2a_st_cmp_valid_1;
wire [0511:0]        h2a_st_cmp_data_1; 
wire                 h2a_st_cmp_resp_1; 
wire                 h2a_st_cmp_valid_2;
wire [0511:0]        h2a_st_cmp_data_2; 
wire                 h2a_st_cmp_resp_2; 
wire                 h2a_st_cmp_valid_3;
wire [0511:0]        h2a_st_cmp_data_3; 
wire                 h2a_st_cmp_resp_3; 


// Interface between cmp_manager and a2h_mm_engine
wire                 a2h_mm_cmp_valid_0;
wire [0511:0]        a2h_mm_cmp_data_0;
wire                 a2h_mm_cmp_resp_0; 
wire                 a2h_mm_cmp_valid_1;
wire [0511:0]        a2h_mm_cmp_data_1; 
wire                 a2h_mm_cmp_resp_1; 
wire                 a2h_mm_cmp_valid_2;
wire [0511:0]        a2h_mm_cmp_data_2; 
wire                 a2h_mm_cmp_resp_2; 
wire                 a2h_mm_cmp_valid_3;
wire [0511:0]        a2h_mm_cmp_data_3; 
wire                 a2h_mm_cmp_resp_3; 


// Interface between cmp_manager and a2h_st_engine
wire                 a2h_st_cmp_valid_0;
wire [0511:0]        a2h_st_cmp_data_0;
wire                 a2h_st_cmp_resp_0; 
wire                 a2h_st_cmp_valid_1;
wire [0511:0]        a2h_st_cmp_data_1; 
wire                 a2h_st_cmp_resp_1; 
wire                 a2h_st_cmp_valid_2;
wire [0511:0]        a2h_st_cmp_data_2; 
wire                 a2h_st_cmp_resp_2; 
wire                 a2h_st_cmp_valid_3;
wire [0511:0]        a2h_st_cmp_data_3; 
wire                 a2h_st_cmp_resp_3; 

wire [0015:0]        eng_cmp_done;
wire [0015:0]        eng_cmp_okay;

//assign h2a_st_cmp_valid_0 = 1'b0;
//assign h2a_st_cmp_valid_1 = 1'b0;
//assign h2a_st_cmp_valid_2 = 1'b0;
//assign h2a_st_cmp_valid_3 = 1'b0;
//assign a2h_st_cmp_valid_0 = 1'b0;
//assign a2h_st_cmp_valid_1 = 1'b0;
//assign a2h_st_cmp_valid_2 = 1'b0;
//assign a2h_st_cmp_valid_3 = 1'b0;

//assign h2a_st_cmp_data_0 = 64'b0;
//assign h2a_st_cmp_data_1 = 64'b0;
//assign h2a_st_cmp_data_2 = 64'b0;
//assign h2a_st_cmp_data_3 = 64'b0;
//assign a2h_st_cmp_data_0 = 64'b0;
//assign a2h_st_cmp_data_1 = 64'b0;
//assign a2h_st_cmp_data_2 = 64'b0;
//assign a2h_st_cmp_data_3 = 64'b0;

assign eng_cmp_done = {
                       h2a_st_cmp_valid_3, 
                       h2a_st_cmp_valid_2, 
                       h2a_st_cmp_valid_1, 
                       h2a_st_cmp_valid_0, 
                       h2a_mm_cmp_valid_3,
                       h2a_mm_cmp_valid_2,
                       h2a_mm_cmp_valid_1, 
                       h2a_mm_cmp_valid_0, 
                       a2h_st_cmp_valid_3, 
                       a2h_st_cmp_valid_2, 
                       a2h_st_cmp_valid_1, 
                       a2h_st_cmp_valid_0, 
                       a2h_mm_cmp_valid_3,
                       a2h_mm_cmp_valid_2,
                       a2h_mm_cmp_valid_1, 
                       a2h_mm_cmp_valid_0 
                      };

assign h2a_st_cmp_resp_3 = eng_cmp_okay[15]; 
assign h2a_st_cmp_resp_2 = eng_cmp_okay[14]; 
assign h2a_st_cmp_resp_1 = eng_cmp_okay[13]; 
assign h2a_st_cmp_resp_0 = eng_cmp_okay[12]; 
assign h2a_mm_cmp_resp_3 = eng_cmp_okay[11];
assign h2a_mm_cmp_resp_2 = eng_cmp_okay[10];
assign h2a_mm_cmp_resp_1 = eng_cmp_okay[9]; 
assign h2a_mm_cmp_resp_0 = eng_cmp_okay[8]; 
assign a2h_st_cmp_resp_3 = eng_cmp_okay[7]; 
assign a2h_st_cmp_resp_2 = eng_cmp_okay[6]; 
assign a2h_st_cmp_resp_1 = eng_cmp_okay[5]; 
assign a2h_st_cmp_resp_0 = eng_cmp_okay[4]; 
assign a2h_mm_cmp_resp_3 = eng_cmp_okay[3];
assign a2h_mm_cmp_resp_2 = eng_cmp_okay[2];
assign a2h_mm_cmp_resp_1 = eng_cmp_okay[1]; 
assign a2h_mm_cmp_resp_0 = eng_cmp_okay[0]; 


// Interface between cmp_manager and lcl_wr_arbiter 
wire                 cmp_lcl_wr_valid;     
wire [0063:0]        cmp_lcl_wr_ea;        
wire [IDW - 1:0]     cmp_lcl_wr_axi_id;    
wire [0127:0]        cmp_lcl_wr_be;        
wire                 cmp_lcl_wr_first;     
wire                 cmp_lcl_wr_last;      
wire [1023:0]        cmp_lcl_wr_data; 
wire                 cmp_lcl_wr_ctx_valid;
wire [0008:0]        cmp_lcl_wr_ctx;
wire                 cmp_lcl_wr_ready;     
wire                 cmp_lcl_wr_rsp_valid; 
wire [IDW - 1:0]     cmp_lcl_wr_rsp_axi_id;
wire                 cmp_lcl_wr_rsp_code;  
wire [0031:0]        cmp_lcl_wr_rsp_ready; 

odma_completion_manager completion_manager (
         /*input                */          .clk               ( clk                  ),
         /*input                */          .rst_n             ( rst_n                ),
         /*interrupt            */
         /*input                */          .action_interrupt         ( action_interrupt    ),
         /*input [0008:0]        */         .action_interrupt_ctx     ( action_interrupt_ctx),
         /*input [0063:0]        */         .action_interrupt_src     ( action_interrupt_src),
         /*output                */         .action_interrupt_ack     ( action_interrupt_ack),
         /*output                */         .odma_interrupt           ( odma_interrupt      ),
         /*output [0008:0]       */         .odma_interrupt_ctx       ( odma_interrupt_ctx  ),
         /*output [0063:0]       */         .odma_interrupt_src       ( odma_interrupt_src  ),
         /*input                 */         .odma_interrupt_ack       ( odma_interrupt_ack  ),
         /*configuration        */
         /*input      [0063:0]  */          .completion_addr0  ( cmp_ch0_poll_wb_addr ),
         /*input      [0031:0]  */          .completion_size0  ( cmp_ch0_poll_wb_size ),
         /*input      [0063:0]  */          .completion_addr1  ( cmp_ch1_poll_wb_addr ),
         /*input      [0031:0]  */          .completion_size1  ( cmp_ch1_poll_wb_size ),
         /*input      [0063:0]  */          .completion_addr2  ( cmp_ch2_poll_wb_addr ),
         /*input      [0031:0]  */          .completion_size2  ( cmp_ch2_poll_wb_size ),
         /*input      [0063:0]  */          .completion_addr3  ( cmp_ch3_poll_wb_addr ),
         /*input      [0031:0]  */          .completion_size3  ( cmp_ch3_poll_wb_size ),
         /*output     [0063:0]  */          .completion_error  (                      ),
         /*output     [0003:0]  */          .completion_done   (                      ),
         /*input      [0063:0]  */          .cmp_ch0_obj_handle( cmp_ch0_obj_handle   ),
         /*input      [0063:0]  */          .cmp_ch1_obj_handle( cmp_ch1_obj_handle   ),
         /*input      [0063:0]  */          .cmp_ch2_obj_handle( cmp_ch2_obj_handle   ),
         /*input      [0063:0]  */          .cmp_ch3_obj_handle( cmp_ch3_obj_handle   ),
         /*engine               */
         /*input      [0015:0]  */          .eng_cmp_done      ( eng_cmp_done         ),
         /*output     [0015:0]  */          .eng_cmp_okay      ( eng_cmp_okay         ),
         /*input      [0063:0]  */          .eng_cmp_data00    ( a2h_mm_cmp_data_0    ),
         /*input      [0063:0]  */          .eng_cmp_data01    ( a2h_mm_cmp_data_1    ),
         /*input      [0063:0]  */          .eng_cmp_data02    ( a2h_mm_cmp_data_2    ),
         /*input      [0063:0]  */          .eng_cmp_data03    ( a2h_mm_cmp_data_3    ),
         /*input      [0063:0]  */          .eng_cmp_data10    ( a2h_st_cmp_data_0    ),
         /*input      [0063:0]  */          .eng_cmp_data11    ( a2h_st_cmp_data_1    ),
         /*input      [0063:0]  */          .eng_cmp_data12    ( a2h_st_cmp_data_2    ),
         /*input      [0063:0]  */          .eng_cmp_data13    ( a2h_st_cmp_data_3    ),
         /*input      [0063:0]  */          .eng_cmp_data20    ( h2a_mm_cmp_data_0    ),
         /*input      [0063:0]  */          .eng_cmp_data21    ( h2a_mm_cmp_data_1    ),
         /*input      [0063:0]  */          .eng_cmp_data22    ( h2a_mm_cmp_data_2    ),
         /*input      [0063:0]  */          .eng_cmp_data23    ( h2a_mm_cmp_data_3    ),
         /*input      [0063:0]  */          .eng_cmp_data30    ( h2a_st_cmp_data_0    ),
         /*input      [0063:0]  */          .eng_cmp_data31    ( h2a_st_cmp_data_1    ),
         /*input      [0063:0]  */          .eng_cmp_data32    ( h2a_st_cmp_data_2    ),
         /*input      [0063:0]  */          .eng_cmp_data33    ( h2a_st_cmp_data_3    ),
         /*write                */
         /*output               */          .lcl_wr_valid      ( cmp_lcl_wr_valid         ),
         /*output     [0063:0]  */          .lcl_wr_ea         ( cmp_lcl_wr_ea            ),
         /*output     [0004:0]  */          .lcl_wr_axi_id     ( cmp_lcl_wr_axi_id        ),
         /*output     [0127:0]  */          .lcl_wr_be         ( cmp_lcl_wr_be            ),
         /*output               */          .lcl_wr_first      ( cmp_lcl_wr_first         ),
         /*output               */          .lcl_wr_last       ( cmp_lcl_wr_last          ),
         /*output     [1023:0]  */          .lcl_wr_data       ( cmp_lcl_wr_data          ),
         /*output               */          .lcl_wr_ctx_valid  ( cmp_lcl_wr_ctx_valid     ),
         /*output     [0008:0]  */          .lcl_wr_ctx        ( cmp_lcl_wr_ctx           ),
         /*input                */          .lcl_wr_ready      ( cmp_lcl_wr_ready         ),
         /*input                */          .lcl_wr_rsp_valid  ( cmp_lcl_wr_rsp_valid     ),
         /*input      [0004:0]  */          .lcl_wr_rsp_axi_id ( cmp_lcl_wr_rsp_axi_id    ),
         /*input                */          .lcl_wr_rsp_code   ( cmp_lcl_wr_rsp_code      ),
         /*output               */          .lcl_wr_rsp_ready  ( cmp_lcl_wr_rsp_ready     ),
         /*descriptor           */
         /*input      [0003:0]  */          .channel_done      ( channel_done         ),
         /*input      [0029:0]  */          .channel_id0       ( channel_id0          ),
         /*input      [0029:0]  */          .channel_id1       ( channel_id1          ),
         /*input      [0029:0]  */          .channel_id2       ( channel_id2          ),
         /*input      [0029:0]  */          .channel_id3       ( channel_id3          ),
         /*output     [0003:0]  */          .manager_start_w   ( manager_start_w      )
);

// Interface between h2a_mm_engine and lcl_rd_arbiter 
wire                mm_lcl_rd_valid;      
wire [0063:0]       mm_lcl_rd_ea;         
wire [IDW - 1:0]    mm_lcl_rd_axi_id;     
wire                mm_lcl_rd_first;      
wire                mm_lcl_rd_last;       
wire [0127:0]       mm_lcl_rd_be;         
wire [0008:0]       mm_lcl_rd_ctx;        
wire                mm_lcl_rd_ctx_valid;  
wire                mm_lcl_rd_ready;      
wire                mm_lcl_rd_data_valid; 
wire [1023:0]       mm_lcl_rd_data;       
wire [IDW - 1:0]    mm_lcl_rd_data_axi_id;
wire                mm_lcl_rd_data_last;  
wire                mm_lcl_rd_rsp_code;   
wire [0003:0]       mm_lcl_rd_rsp_ready;  
wire [0003:0]       mm_lcl_rd_rsp_ready_hint;  

// Interface between h2a_st_engine and lcl_rd_arbiter 
wire                st_lcl_rd_valid;      
wire [0063:0]       st_lcl_rd_ea;         
wire [IDW - 1:0]    st_lcl_rd_axi_id;     
wire                st_lcl_rd_first;      
wire                st_lcl_rd_last;       
wire [0127:0]       st_lcl_rd_be;         
wire [0008:0]       st_lcl_rd_ctx;        
wire                st_lcl_rd_ctx_valid;  
wire                st_lcl_rd_ready;      
wire                st_lcl_rd_data_valid; 
wire [1023:0]       st_lcl_rd_data;       
wire [IDW - 1:0]    st_lcl_rd_data_axi_id;
wire                st_lcl_rd_data_last;  
wire                st_lcl_rd_rsp_code;   
wire                st_lcl_rd_rsp_ready;  
wire                st_lcl_rd_rsp_ready_hint;  


`ifndef ENABLE_ODMA_ST_MODE
    assign st_lcl_rd_valid = 1'b0;    
    assign st_lcl_rd_ea = 64'h0;      
    assign st_lcl_rd_axi_id = 5'b0;  
    assign st_lcl_rd_first = 1'b0;   
    assign st_lcl_rd_last = 1'b0;    
    assign st_lcl_rd_be = 128'h0;      
    assign st_lcl_rd_ctx = 9'b0;     
    assign st_lcl_rd_ctx_valid = 1'b0;
    assign st_lcl_rd_rsp_ready = 1'b0;
    assign st_lcl_rd_rsp_ready_hint = 1'b0;
`else
    assign mm_lcl_rd_valid = 1'b0;    
    assign mm_lcl_rd_ea = 64'h0;      
    assign mm_lcl_rd_axi_id = 5'b0;  
    assign mm_lcl_rd_first = 1'b0;   
    assign mm_lcl_rd_last = 1'b0;    
    assign mm_lcl_rd_be = 128'h0;      
    assign mm_lcl_rd_ctx = 9'b0;     
    assign mm_lcl_rd_ctx_valid = 1'b0;
    assign mm_lcl_rd_rsp_ready = 4'b0;
    assign mm_lcl_rd_rsp_ready_hint = 4'b0;
`endif

`ifndef ENABLE_ODMA_ST_MODE
    odma_h2a_mm_engine #(
                         .AXI_ID_WIDTH ( IDW ),
                         .AXI_ADDR_WIDTH ( AXI_MM_AW ),
                         .AXI_DATA_WIDTH ( AXI_MM_DW ),
                         .AXI_WUSER_WIDTH ( AXI_MM_WUSER ),
                         .AXI_BUSER_WIDTH ( AXI_MM_BUSER ),
                         .AXI_AWUSER_WIDTH ( AXI_MM_AWUSER )
                        )
          h2a_mm_engine (
             /*input                              */  .clk                ( clk                   ),
             /*input                              */  .rst_n              ( rst_n                 ),
             /* Descriptor Interface */
             /*output                             */  .dsc_ready          ( h2a_mm_dsc_ready      ),
             /*input                              */  .dsc_valid          ( eng_buf_write[2]      ),
             /*input      [0255:0]                */  .dsc_data           ( h2a_mm_dsc_data       ),
             /*Completion Interface */
             /*output reg                         */  .cmp_valid_0        ( h2a_mm_cmp_valid_0    ),
             /*output reg [0511:0]                */  .cmp_data_0         ( h2a_mm_cmp_data_0     ),
             /*input                              */  .cmp_resp_0         ( h2a_mm_cmp_resp_0     ),
             /*output reg                         */  .cmp_valid_1        ( h2a_mm_cmp_valid_1    ),
             /*output reg [0511:0]                */  .cmp_data_1         ( h2a_mm_cmp_data_1     ),
             /*input                              */  .cmp_resp_1         ( h2a_mm_cmp_resp_1     ),
             /*output reg                         */  .cmp_valid_2        ( h2a_mm_cmp_valid_2    ),
             /*output reg [0511:0]                */  .cmp_data_2         ( h2a_mm_cmp_data_2     ),
             /*input                              */  .cmp_resp_2         ( h2a_mm_cmp_resp_2     ),
             /*output reg                         */  .cmp_valid_3        ( h2a_mm_cmp_valid_3    ),
             /*output reg [0511:0]                */  .cmp_data_3         ( h2a_mm_cmp_data_3     ),
             /*input                              */  .cmp_resp_3         ( h2a_mm_cmp_resp_3     ),
             /*LCL Read Interface */ 
             /*Read Addr/Req Channel*/
             /*output                             */  .lcl_rd_valid       ( mm_lcl_rd_valid       ),
             /*output     [0063:0]                */  .lcl_rd_ea          ( mm_lcl_rd_ea          ),
             /*output     [AXI_ID_WIDTH - 1:0]    */  .lcl_rd_axi_id      ( mm_lcl_rd_axi_id      ),
             /*output                             */  .lcl_rd_first       ( mm_lcl_rd_first       ),
             /*output                             */  .lcl_rd_last        ( mm_lcl_rd_last        ),
             /*output     [0127:0]                */  .lcl_rd_be          ( mm_lcl_rd_be          ),
             /*output     [0008:0]                */  .lcl_rd_ctx         ( mm_lcl_rd_ctx         ),
             /*output                             */  .lcl_rd_ctx_valid   ( mm_lcl_rd_ctx_valid   ),
             /*input                              */  .lcl_rd_ready       ( mm_lcl_rd_ready       ),
             /*Read Data/Resp Channel*/                                                       
             /*input                              */  .lcl_rd_data_valid  ( mm_lcl_rd_data_valid  ),
             /*input      [1023:0]                */  .lcl_rd_data        ( mm_lcl_rd_data        ),
             /*input      [AXI_ID_WIDTH - 1:0]    */  .lcl_rd_data_axi_id ( mm_lcl_rd_data_axi_id ),
             /*input                              */  .lcl_rd_data_last   ( mm_lcl_rd_data_last   ),
             /*input                              */  .lcl_rd_rsp_code    ( mm_lcl_rd_rsp_code    ),
             /*output                             */  .lcl_rd_rsp_ready   ( mm_lcl_rd_rsp_ready   ),
             /*output                             */  .lcl_rd_rsp_ready_hint   ( mm_lcl_rd_rsp_ready_hint   ),
             /*AXI4-MM Write Interface */
             /*Write Addr/Req Channel  */
             /*output reg [AXI_ADDR_WIDTH - 1:0]  */  .m_axi_awaddr       ( axi_mm_awaddr         ),
             /*output reg [AXI_ID_WIDTH - 1:0]    */  .m_axi_awid         ( axi_mm_awid           ),
             /*output reg [0007:0]                */  .m_axi_awlen        ( axi_mm_awlen          ),
             /*output     [0002:0]                */  .m_axi_awsize       ( axi_mm_awsize         ),
             /*output     [0001:0]                */  .m_axi_awburst      ( axi_mm_awburst        ),
             /*output     [0002:0]                */  .m_axi_awprot       ( axi_mm_awprot         ),
             /*output     [0003:0]                */  .m_axi_awqos        ( axi_mm_awqos          ),
             /*output     [0003:0]                */  .m_axi_awregion     ( axi_mm_awregion       ),
             /*output     [AXI_WUSER_AWIDTH - 1:0] */ .m_axi_awuser       ( axi_mm_awuser         ),
             /*output                             */  .m_axi_awvalid      ( axi_mm_awvalid        ),
             /*output                             */  .m_axi_awlock       ( axi_mm_awlock         ),
             /*output     [0003:0]                */  .m_axi_awcache      ( axi_mm_awcache        ),
             /*input                              */  .m_axi_awready      ( axi_mm_awready        ),
             /*Write Data Channel */                                                   
             /*output reg [AXI_DATA_WIDTH - 1:0]  */  .m_axi_wdata        ( axi_mm_wdata          ),
             /*output reg                         */  .m_axi_wlast        ( axi_mm_wlast          ),
             /*output     [AXI_DATA_WIDTH/8 - 1:0]*/  .m_axi_wstrb        ( axi_mm_wstrb          ),
             /*output reg                         */  .m_axi_wvalid       ( axi_mm_wvalid         ),
             /*output     [AXI_WUSER_WIDTH - 1:0] */  .m_axi_wuser        ( axi_mm_wuser          ),
             /*input                              */  .m_axi_wready       ( axi_mm_wready         ),
             /*Write Response Channel */                                               
             /*input                              */  .m_axi_bvalid       ( axi_mm_bvalid         ),
             /*input      [0001:0]                */  .m_axi_bresp        ( axi_mm_bresp          ),
             /*input      [AXI_ID_WIDTH - 1:0]    */  .m_axi_bid          ( axi_mm_bid            ),
             /*input      [AXI_BUSER_WIDTH - 1:0] */  .m_axi_buser        ( axi_mm_buser          ),
             /*output                             */  .m_axi_bready       ( axi_mm_bready         ) 
          );
`else
    odma_h2a_st_engine #(
                         .AXIS_ID_WIDTH ( IDW ),
                         .AXIS_DATA_WIDTH ( AXI_ST_DW ),
                         .AXIS_USER_WIDTH ( AXI_ST_USER )
                        )
          h2a_st_engine (
             /*input                              */  .clk                ( clk                   ),
             /*input                              */  .rst_n              ( rst_n                 ),
             /* Descriptor Interface */
             /*output                             */  .dsc_ready          ( h2a_st_dsc_ready      ),
             /*input                              */  .dsc_valid          ( eng_buf_write[3]      ),
             /*input      [0255:0]                */  .dsc_data           ( h2a_st_dsc_data       ),
             /*Completion Interface */
             /*output reg                         */  .cmp_valid_0        ( h2a_st_cmp_valid_0    ),
             /*output reg [0511:0]                */  .cmp_data_0         ( h2a_st_cmp_data_0     ),
             /*input                              */  .cmp_resp_0         ( h2a_st_cmp_resp_0     ),
             /*output reg                         */  .cmp_valid_1        ( h2a_st_cmp_valid_1    ),
             /*output reg [0511:0]                */  .cmp_data_1         ( h2a_st_cmp_data_1     ),
             /*input                              */  .cmp_resp_1         ( h2a_st_cmp_resp_1     ),
             /*output reg                         */  .cmp_valid_2        ( h2a_st_cmp_valid_2    ),
             /*output reg [0511:0]                */  .cmp_data_2         ( h2a_st_cmp_data_2     ),
             /*input                              */  .cmp_resp_2         ( h2a_st_cmp_resp_2     ),
             /*output reg                         */  .cmp_valid_3        ( h2a_st_cmp_valid_3    ),
             /*output reg [0511:0]                */  .cmp_data_3         ( h2a_st_cmp_data_3     ),
             /*input                              */  .cmp_resp_3         ( h2a_st_cmp_resp_3     ),
             /*LCL Read Interface */ 
             /*Read Addr/Req Channel*/
             /*output                             */  .lcl_rd_valid       ( st_lcl_rd_valid       ),
             /*output     [0063:0]                */  .lcl_rd_ea          ( st_lcl_rd_ea          ),
             /*output     [AXI_ID_WIDTH - 1:0]    */  .lcl_rd_axi_id      ( st_lcl_rd_axi_id      ),
             /*output                             */  .lcl_rd_first       ( st_lcl_rd_first       ),
             /*output                             */  .lcl_rd_last        ( st_lcl_rd_last        ),
             /*output     [0127:0]                */  .lcl_rd_be          ( st_lcl_rd_be          ),
             /*output     [0008:0]                */  .lcl_rd_ctx         ( st_lcl_rd_ctx         ),
             /*output                             */  .lcl_rd_ctx_valid   ( st_lcl_rd_ctx_valid   ),
             /*input                              */  .lcl_rd_ready       ( st_lcl_rd_ready       ),
             /*Read Data/Resp Channel*/                                                       
             /*input                              */  .lcl_rd_data_valid  ( st_lcl_rd_data_valid  ),
             /*input      [1023:0]                */  .lcl_rd_data        ( st_lcl_rd_data        ),
             /*input      [AXI_ID_WIDTH - 1:0]    */  .lcl_rd_data_axi_id ( st_lcl_rd_data_axi_id ),
             /*input                              */  .lcl_rd_data_last   ( st_lcl_rd_data_last   ),
             /*input                              */  .lcl_rd_rsp_code    ( st_lcl_rd_rsp_code    ),
             /*output                             */  .lcl_rd_rsp_ready   ( st_lcl_rd_rsp_ready   ),
             /*output                             */  .lcl_rd_rsp_ready_hint  ( st_lcl_rd_rsp_ready_hint   ),
             /*AXI4-ST Write Interface */
             /*output                             */  .m_axis_tvalid      ( m_axis_tvalid         ), 
             /*input                              */  .m_axis_tready      ( m_axis_tready         ), 
             /*output    [AXIS_DATA_WIDTH - 1:0]  */  .m_axis_tdata       ( m_axis_tdata          ),
             /*output    [AXIS_DATA_WIDTH/8 - 1:0]*/  .m_axis_tkeep       ( m_axis_tkeep          ),
             /*output                             */  .m_axis_tlast       ( m_axis_tlast          ), 
             /*output    [AXIS_ID_WIDTH - 1:0]    */  .m_axis_tid         ( m_axis_tid            ),
             /*output    [AXIS_USER_WIDTH - 1:0]  */  .m_axis_tuser       ( m_axis_tuser          )
          );
`endif

// Interface between a2h_mm_engine and lcl_wr_arbiter 
wire                 mm_lcl_wr_valid;     
wire [0063:0]        mm_lcl_wr_ea;        
wire [IDW - 1:0]     mm_lcl_wr_axi_id;    
wire [0127:0]        mm_lcl_wr_be;        
wire                 mm_lcl_wr_first;     
wire                 mm_lcl_wr_last;      
wire [1023:0]        mm_lcl_wr_data;     
wire                 mm_lcl_wr_ctx_valid;
wire [8:0]           mm_lcl_wr_ctx;
wire                 mm_lcl_wr_ready;     
wire                 mm_lcl_wr_rsp_valid; 
wire [IDW - 1:0]     mm_lcl_wr_rsp_axi_id;
wire                 mm_lcl_wr_rsp_code;  
wire                 mm_lcl_wr_rsp_ready; 

// Interface between a2h_st_engine and lcl_wr_arbiter 
wire                 st_lcl_wr_valid;     
wire [0063:0]        st_lcl_wr_ea;        
wire [IDW - 1:0]     st_lcl_wr_axi_id;    
wire [0127:0]        st_lcl_wr_be;        
wire                 st_lcl_wr_first;     
wire                 st_lcl_wr_last;      
wire [1023:0]        st_lcl_wr_data;
wire                 st_lcl_wr_ctx_valid;
wire [8:0]           st_lcl_wr_ctx;
wire                 st_lcl_wr_ready;     
wire                 st_lcl_wr_rsp_valid; 
wire [IDW - 1:0]     st_lcl_wr_rsp_axi_id;
wire                 st_lcl_wr_rsp_code;  
wire [0031:0]        st_lcl_wr_rsp_ready; 

`ifndef ENABLE_ODMA_ST_MODE
    assign st_lcl_wr_valid = 1'b0;   
    assign st_lcl_wr_ea = 64'h0;      
    assign st_lcl_wr_axi_id = 5'b0;  
    assign st_lcl_wr_be = 128'h0;      
    assign st_lcl_wr_first = 1'b0;   
    assign st_lcl_wr_last = 1'b0;    
    assign st_lcl_wr_data = 1024'b0;    
    assign st_lcl_wr_ctx = 9'b0;     
    assign st_lcl_wr_ctx_valid = 1'b0;
    assign st_lcl_wr_rsp_ready = 1'b0;   
`else
    assign mm_lcl_wr_valid = 1'b0;   
    assign mm_lcl_wr_ea = 64'h0;      
    assign mm_lcl_wr_axi_id = 5'b0;  
    assign mm_lcl_wr_be = 128'h0;      
    assign mm_lcl_wr_first = 1'b0;   
    assign mm_lcl_wr_last = 1'b0;    
    assign mm_lcl_wr_data = 1024'b0;    
    assign mm_lcl_wr_ctx = 9'b0;     
    assign mm_lcl_wr_ctx_valid = 1'b0;
    assign mm_lcl_wr_rsp_ready = 1'b0;   
`endif

`ifndef ENABLE_ODMA_ST_MODE
    odma_a2h_mm_engine #(
                        .AXI_ID_WIDTH     ( IDW ),
                        .AXI_ADDR_WIDTH   ( AXI_MM_AW ),
                        .AXI_DATA_WIDTH   ( AXI_MM_DW ),
                        .AXI_AWUSER_WIDTH ( AXI_MM_AWUSER ),
                        .AXI_ARUSER_WIDTH ( AXI_MM_ARUSER ),
                        .AXI_WUSER_WIDTH  ( AXI_MM_WUSER ),
                        .AXI_RUSER_WIDTH  ( AXI_MM_RUSER ),
                        .AXI_BUSER_WIDTH  ( AXI_MM_BUSER )
                        )
          a2h_mm_engine (
             /*input                              */  .clk               ( clk                ),
             /*input                              */  .rst_n             ( rst_n              ),
             /* dsc engine interface              */
             /*input                              */  .dsc_valid         ( eng_buf_write[0]   ),
             /*input  [255 : 0]                   */  .dsc_data          ( a2h_mm_dsc_data    ),
             /*output                             */  .dsc_ready         ( a2h_mm_dsc_ready   ),
             /* AXI4 read addr interface          */
             /*output [AXI_ADDR_WIDTH-1 : 0]      */  .axi_araddr        ( axi_mm_araddr      ),
             /*output [1 : 0]                     */  .axi_arburst       ( axi_mm_arburst     ),
             /*output [3 : 0]                     */  .axi_arcache       ( axi_mm_arcache     ),
             /*output [AXI_ID_WIDTH-1 : 0]        */  .axi_arid          ( axi_mm_arid        ),
             /*output [7 : 0]                     */  .axi_arlen         ( axi_mm_arlen       ),
             /*output [1 : 0]                     */  .axi_arlock        ( axi_mm_arlock      ),
             /*output [2 : 0]                     */  .axi_arprot        ( axi_mm_arprot      ),
             /*output [3 : 0]                     */  .axi_arqos         ( axi_mm_arqos       ),
             /*input                              */  .axi_arready       ( axi_mm_arready     ),
             /*output [3 : 0]                     */  .axi_arregion      ( axi_mm_arregion    ),
             /*output [2 : 0]                     */  .axi_arsize        ( axi_mm_arsize      ),
             /*output [AXI_ARUSER_WIDTH-1 : 0]    */  .axi_aruser        ( axi_mm_aruser      ),
             /*output                             */  .axi_arvalid       ( axi_mm_arvalid     ),
             /* AXI4 read data interface          */                                          
             /*input  [AXI_DATA_WIDTH-1 : 0 ]     */  .axi_rdata         ( axi_mm_rdata       ),
             /*input  [AXI_ID_WIDTH-1 : 0 ]       */  .axi_rid           ( axi_mm_rid         ),
             /*input                              */  .axi_rlast         ( axi_mm_rlast       ),
             /*output                             */  .axi_rready        ( axi_mm_rready      ),
             /*input  [1 : 0 ]                    */  .axi_rresp         ( axi_mm_rresp       ),
             /*input  [AXI_RUSER_WIDTH-1 : 0 ]    */  .axi_ruser         ( axi_mm_ruser       ),
             /*input                              */  .axi_rvalid        ( axi_mm_rvalid      ),
             /* local write interface             */
             /*output                             */  .lcl_wr_valid      ( mm_lcl_wr_valid       ),
             /*output [63 : 0]                    */  .lcl_wr_ea         ( mm_lcl_wr_ea          ),
             /*output [AXI_ID_WIDTH-1 : 0]        */  .lcl_wr_axi_id     ( mm_lcl_wr_axi_id      ),
             /*output [127 : 0]                   */  .lcl_wr_be         ( mm_lcl_wr_be          ),
             /*output                             */  .lcl_wr_first      ( mm_lcl_wr_first       ),
             /*output                             */  .lcl_wr_last       ( mm_lcl_wr_last        ),
             /*output [1023 : 0]                  */  .lcl_wr_data       ( mm_lcl_wr_data        ),
             /*input                              */  .lcl_wr_ready      ( mm_lcl_wr_ready       ),
             /* local write context interface     */                                        
             /*output                             */  .lcl_wr_ctx_valid  ( mm_lcl_wr_ctx_valid   ),
             /*output [8 : 0]                     */  .lcl_wr_ctx        ( mm_lcl_wr_ctx         ),
             /* local write rsp interface         */                                        
             /*input                              */  .lcl_wr_rsp_valid  ( mm_lcl_wr_rsp_valid   ),
             /*input  [AXI_ID_WIDTH-1 : 0]        */  .lcl_wr_rsp_axi_id ( mm_lcl_wr_rsp_axi_id  ),
             /*input                              */  .lcl_wr_rsp_code   ( mm_lcl_wr_rsp_code    ),
             /*output                             */  .lcl_wr_rsp_ready  ( mm_lcl_wr_rsp_ready   ),
             /* cmp engine interface              */ 
             /*output                             */  .dsc_ch0_cmp_valid ( a2h_mm_cmp_valid_0 ),
             /*output [511 : 0]                   */  .dsc_ch0_cmp_data  ( a2h_mm_cmp_data_0  ),
             /*input                              */  .dsc_ch0_cmp_ready ( a2h_mm_cmp_resp_0  ),
             /*output                             */  .dsc_ch1_cmp_valid ( a2h_mm_cmp_valid_1 ),
             /*output [511 : 0]                   */  .dsc_ch1_cmp_data  ( a2h_mm_cmp_data_1  ),
             /*input                              */  .dsc_ch1_cmp_ready ( a2h_mm_cmp_resp_1  ),
             /*output                             */  .dsc_ch2_cmp_valid ( a2h_mm_cmp_valid_2 ),
             /*output [511 : 0]                   */  .dsc_ch2_cmp_data  ( a2h_mm_cmp_data_2  ),
             /*input                              */  .dsc_ch2_cmp_ready ( a2h_mm_cmp_resp_2  ),
             /*output                             */  .dsc_ch3_cmp_valid ( a2h_mm_cmp_valid_3 ),
             /*output [511 : 0]                   */  .dsc_ch3_cmp_data  ( a2h_mm_cmp_data_3  ),
             /*input                              */  .dsc_ch3_cmp_ready ( a2h_mm_cmp_resp_3  ) 
                                              );
`else
    odma_a2h_st_engine #(
                        .AXIS_ID_WIDTH     ( IDW ),
                        .AXIS_DATA_WIDTH   ( AXI_ST_DW ),
                        .AXIS_USER_WIDTH   ( AXI_ST_USER )
                        )
          a2h_st_engine (
             /*input                              */  .clk               ( clk                ),
             /*input                              */  .rst_n             ( rst_n              ),
             /* dsc engine interface              */
             /*input                              */  .dsc_valid         ( eng_buf_write[1]   ),
             /*input  [255 : 0]                   */  .dsc_data          ( a2h_st_dsc_data    ),
             /*output                             */  .dsc_ready         ( a2h_st_dsc_ready   ),
             /* AXI4-ST read interface            */
             /*input                              */  .axis_tvalid       ( s_axis_tvalid      ),
             /*output                             */  .axis_tready       ( s_axis_tready      ),
             /*input  [AXIS_DATA_WIDTH-1 : 0 ]    */  .axis_tdata        ( s_axis_tdata       ),
             /*input  [AXIS_DATA_WIDTH/8-1 : 0 ]  */  .axis_tkeep        ( s_axis_tkeep       ),
             /*input                              */  .axis_tlast        ( s_axis_tlast       ),
             /*input  [AXIS_ID_WIDTH-1 : 0 ]      */  .axis_tid          ( s_axis_tid         ),
             /*input  [AXIS_USER_WIDTH-1 : 0 ]    */  .axis_tuser        ( s_axis_tuser       ),
             /* local write interface             */
             /*output                             */  .lcl_wr_valid      ( st_lcl_wr_valid       ),
             /*output [63 : 0]                    */  .lcl_wr_ea         ( st_lcl_wr_ea          ),
             /*output [AXI_ID_WIDTH-1 : 0]        */  .lcl_wr_axi_id     ( st_lcl_wr_axi_id      ),
             /*output [127 : 0]                   */  .lcl_wr_be         ( st_lcl_wr_be          ),
             /*output                             */  .lcl_wr_first      ( st_lcl_wr_first       ),
             /*output                             */  .lcl_wr_last       ( st_lcl_wr_last        ),
             /*output [1023 : 0]                  */  .lcl_wr_data       ( st_lcl_wr_data        ),
             /*input                              */  .lcl_wr_ready      ( st_lcl_wr_ready       ),
             /* local write context interface     */                                        
             /*output                             */  .lcl_wr_ctx_valid  ( st_lcl_wr_ctx_valid   ),
             /*output [8 : 0]                     */  .lcl_wr_ctx        ( st_lcl_wr_ctx         ),
             /* local write rsp interface         */                                        
             /*input                              */  .lcl_wr_rsp_valid  ( st_lcl_wr_rsp_valid   ),
             /*input  [AXI_ID_WIDTH-1 : 0]        */  .lcl_wr_rsp_axi_id ( st_lcl_wr_rsp_axi_id  ),
             /*input                              */  .lcl_wr_rsp_code   ( st_lcl_wr_rsp_code    ),
             /*output                             */  .lcl_wr_rsp_ready  ( st_lcl_wr_rsp_ready   ),
             /* cmp engine interface              */ 
             /*output                             */  .dsc_ch0_cmp_valid ( a2h_st_cmp_valid_0 ),
             /*output [511 : 0]                   */  .dsc_ch0_cmp_data  ( a2h_st_cmp_data_0  ),
             /*input                              */  .dsc_ch0_cmp_ready ( a2h_st_cmp_resp_0  ),
             /*output                             */  .dsc_ch1_cmp_valid ( a2h_st_cmp_valid_1 ),
             /*output [511 : 0]                   */  .dsc_ch1_cmp_data  ( a2h_st_cmp_data_1  ),
             /*input                              */  .dsc_ch1_cmp_ready ( a2h_st_cmp_resp_1  ),
             /*output                             */  .dsc_ch2_cmp_valid ( a2h_st_cmp_valid_2 ),
             /*output [511 : 0]                   */  .dsc_ch2_cmp_data  ( a2h_st_cmp_data_2  ),
             /*input                              */  .dsc_ch2_cmp_ready ( a2h_st_cmp_resp_2  ),
             /*output                             */  .dsc_ch3_cmp_valid ( a2h_st_cmp_valid_3 ),
             /*output [511 : 0]                   */  .dsc_ch3_cmp_data  ( a2h_st_cmp_data_3  ),
             /*input                              */  .dsc_ch3_cmp_ready ( a2h_st_cmp_resp_3  ) 
                                              );
`endif


odma_lcl_rd_arbiter  #(
                       .AXI_ID_WIDTH ( IDW )
                      )
       lcl_rd_arbiter (
         /*input                             */   .clk                    ( clk                    ),
         /*input                             */   .rst_n                  ( rst_n                  ),
         /* LCL Read Interface */ 
         /* Read Addr/Req Channel */
         /*output reg                        */   .lcl_rd_valid           ( lcl_rd_valid           ),
         /*output reg   [0063:0]             */   .lcl_rd_ea              ( lcl_rd_ea              ),
         /*output reg   [AXI_ID_WIDTH - 1:0] */   .lcl_rd_axi_id          ( lcl_rd_axi_id          ),
         /*output reg                        */   .lcl_rd_first           ( lcl_rd_first           ),
         /*output reg                        */   .lcl_rd_last            ( lcl_rd_last            ),
         /*output reg   [0127:0]             */   .lcl_rd_be              ( lcl_rd_be              ),
         /*output reg   [0008:0]             */   .lcl_rd_ctx             ( lcl_rd_ctx             ),
         /*output reg                        */   .lcl_rd_ctx_valid       ( lcl_rd_ctx_valid       ),
         /*input                             */   .lcl_rd_ready           ( lcl_rd_ready           ),
         /* Read Data/Resp Channel */                                                         
         /*input                             */   .lcl_rd_data_valid      ( lcl_rd_data_valid      ),
         /*input        [1023:0]             */   .lcl_rd_data            ( lcl_rd_data            ),
         /*input        [AXI_ID_WIDTH - 1:0] */   .lcl_rd_data_axi_id     ( lcl_rd_data_axi_id     ),
         /*input                             */   .lcl_rd_data_last       ( lcl_rd_data_last       ),
         /*input                             */   .lcl_rd_rsp_code        ( lcl_rd_rsp_code        ),
         /*output       [0031:0]             */   .lcl_rd_rsp_ready       ( lcl_rd_rsp_ready       ),
         /*output       [0031:0]             */   .lcl_rd_rsp_ready_hint  ( lcl_rd_rsp_ready_hint  ),
         /* DSC Engine LCL Rd IF */
         /* Read Addr/Req Channel */
         /*input                             */   .dsc_lcl_rd_valid       ( dsc_lcl_rd_valid       ),
         /*input        [0063:0]             */   .dsc_lcl_rd_ea          ( dsc_lcl_rd_ea          ),
         /*input        [AXI_ID_WIDTH - 1:0] */   .dsc_lcl_rd_axi_id      ( dsc_lcl_rd_axi_id      ),
         /*input                             */   .dsc_lcl_rd_first       ( dsc_lcl_rd_first       ),
         /*input                             */   .dsc_lcl_rd_last        ( dsc_lcl_rd_last        ),
         /*input        [0127:0]             */   .dsc_lcl_rd_be          ( dsc_lcl_rd_be          ),
         /*input        [0008:0]             */   .dsc_lcl_rd_ctx         ( dsc_lcl_rd_ctx         ),
         /*input                             */   .dsc_lcl_rd_ctx_valid   ( dsc_lcl_rd_ctx_valid   ),
         /*output                            */   .dsc_lcl_rd_ready       ( dsc_lcl_rd_ready       ),
         /* Read Data/Resp Channel */                                                             
         /*output reg                        */   .dsc_lcl_rd_data_valid  ( dsc_lcl_rd_data_valid  ),
         /*output reg   [1023:0]             */   .dsc_lcl_rd_data        ( dsc_lcl_rd_data        ),
         /*output reg   [AXI_ID_WIDTH - 1:0] */   .dsc_lcl_rd_data_axi_id ( dsc_lcl_rd_data_axi_id ),
         /*output reg                        */   .dsc_lcl_rd_data_last   ( dsc_lcl_rd_data_last   ),
         /*output reg                        */   .dsc_lcl_rd_rsp_code    ( dsc_lcl_rd_rsp_code    ),
         /*input                             */   .dsc_lcl_rd_rsp_ready   ( dsc_lcl_rd_rsp_ready   ),
         /*input                             */   .dsc_lcl_rd_rsp_ready_hint   ( dsc_lcl_rd_rsp_ready_hint   ),
         /* H2A MM Engine LCL Rd IF */
         /* Read Addr/Req Channel */ 
         /*input                             */   .mm_lcl_rd_valid        ( mm_lcl_rd_valid        ),
         /*input        [0063:0]             */   .mm_lcl_rd_ea           ( mm_lcl_rd_ea           ),
         /*input        [AXI_ID_WIDTH - 1:0] */   .mm_lcl_rd_axi_id       ( mm_lcl_rd_axi_id       ),
         /*input                             */   .mm_lcl_rd_first        ( mm_lcl_rd_first        ),
         /*input                             */   .mm_lcl_rd_last         ( mm_lcl_rd_last         ),
         /*input        [0127:0]             */   .mm_lcl_rd_be           ( mm_lcl_rd_be           ),
         /*input        [0008:0]             */   .mm_lcl_rd_ctx          ( mm_lcl_rd_ctx          ),
         /*input                             */   .mm_lcl_rd_ctx_valid    ( mm_lcl_rd_ctx_valid    ),
         /*output                            */   .mm_lcl_rd_ready        ( mm_lcl_rd_ready        ),
         /* Read Data/Resp Channel */                                                            
         /*output reg                        */   .mm_lcl_rd_data_valid   ( mm_lcl_rd_data_valid   ),
         /*output reg   [1023:0]             */   .mm_lcl_rd_data         ( mm_lcl_rd_data         ),
         /*output reg   [AXI_ID_WIDTH - 1:0] */   .mm_lcl_rd_data_axi_id  ( mm_lcl_rd_data_axi_id  ),
         /*output reg                        */   .mm_lcl_rd_data_last    ( mm_lcl_rd_data_last    ),
         /*output reg                        */   .mm_lcl_rd_rsp_code     ( mm_lcl_rd_rsp_code     ),
         /*input                             */   .mm_lcl_rd_rsp_ready    ( mm_lcl_rd_rsp_ready    ),
         /*input                             */   .mm_lcl_rd_rsp_ready_hint    ( mm_lcl_rd_rsp_ready_hint    ),
         /* H2A ST Engine LCL Rd IF */                                                          
         /* Read Addr/Req Channel */                                                            
         /*input                             */   .st_lcl_rd_valid       ( st_lcl_rd_valid         ),
         /*input        [0063:0]             */   .st_lcl_rd_ea          ( st_lcl_rd_ea            ),
         /*input        [AXI_ID_WIDTH - 1:0] */   .st_lcl_rd_axi_id      ( st_lcl_rd_axi_id        ),
         /*input                             */   .st_lcl_rd_first       ( st_lcl_rd_first         ),
         /*input                             */   .st_lcl_rd_last        ( st_lcl_rd_last          ),
         /*input        [0127:0]             */   .st_lcl_rd_be          ( st_lcl_rd_be            ),
         /*input        [0008:0]             */   .st_lcl_rd_ctx         ( st_lcl_rd_ctx           ),
         /*input                             */   .st_lcl_rd_ctx_valid   ( st_lcl_rd_ctx_valid     ),
         /*output                            */   .st_lcl_rd_ready       ( st_lcl_rd_ready         ),
         /* Read Data/Resp Channel */                                                           
         /*output reg                        */   .st_lcl_rd_data_valid  ( st_lcl_rd_data_valid    ),
         /*output reg   [1023:0]             */   .st_lcl_rd_data        ( st_lcl_rd_data          ),
         /*output reg   [AXI_ID_WIDTH - 1:0] */   .st_lcl_rd_data_axi_id ( st_lcl_rd_data_axi_id   ),
         /*output reg                        */   .st_lcl_rd_data_last   ( st_lcl_rd_data_last     ),
         /*output reg                        */   .st_lcl_rd_rsp_code    ( st_lcl_rd_rsp_code      ),
         /*input                             */   .st_lcl_rd_rsp_ready   ( st_lcl_rd_rsp_ready     ), 
         /*input                             */   .st_lcl_rd_rsp_ready_hint   ( st_lcl_rd_rsp_ready_hint     ) 
                                              );

odma_lcl_wr_arbiter #(
                     .AXI_ID_WIDTH ( IDW )
                     )              
      lcl_wr_arbiter (
          /*input                             */   .clk                   ( clk                   ),
          /*input                             */   .rst_n                 ( rst_n                 ),
          /* LCL Write Interface */ 
          /* Write Addr/Data Channel */
          /*output reg                        */   .lcl_wr_valid          ( lcl_wr_valid          ),
          /*output reg    [0063:0]            */   .lcl_wr_ea             ( lcl_wr_ea             ),
          /*output reg    [AXI_ID_WIDTH - 1:0]*/   .lcl_wr_axi_id         ( lcl_wr_axi_id         ),
          /*output reg    [0127:0]            */   .lcl_wr_be             ( lcl_wr_be             ),
          /*output reg                        */   .lcl_wr_first          ( lcl_wr_first          ),
          /*output reg                        */   .lcl_wr_last           ( lcl_wr_last           ),
          /*output reg    [1023:0]            */   .lcl_wr_data           ( lcl_wr_data           ),
          /*output reg    [0008:0]            */   .lcl_wr_ctx            ( lcl_wr_ctx            ),
          /*output reg                        */   .lcl_wr_ctx_valid      ( lcl_wr_ctx_valid      ),
          /*input                             */   .lcl_wr_ready          ( lcl_wr_ready          ),
          /* Write Response Channel */                                                           
          /*input                             */   .lcl_wr_rsp_valid      ( lcl_wr_rsp_valid      ),
          /*input         [AXI_ID_WIDTH - 1:0]*/   .lcl_wr_rsp_axi_id     ( lcl_wr_rsp_axi_id     ),
          /*input                             */   .lcl_wr_rsp_code       ( lcl_wr_rsp_code       ),
          /*output        [0031:0]            */   .lcl_wr_rsp_ready      ( lcl_wr_rsp_ready      ),
          /* CMP Engine LCL Wr IF */                                                             
          /* Write Addr/Data Channel */                                                          
          /*input                             */   .cmp_lcl_wr_valid      ( cmp_lcl_wr_valid      ),
          /*input         [0063:0]            */   .cmp_lcl_wr_ea         ( cmp_lcl_wr_ea         ),
          /*input         [AXI_ID_WIDTH - 1:0]*/   .cmp_lcl_wr_axi_id     ( cmp_lcl_wr_axi_id     ),
          /*input         [0127:0]            */   .cmp_lcl_wr_be         ( cmp_lcl_wr_be         ),
          /*input                             */   .cmp_lcl_wr_first      ( cmp_lcl_wr_first      ),
          /*input                             */   .cmp_lcl_wr_last       ( cmp_lcl_wr_last       ),
          /*input         [1023:0]            */   .cmp_lcl_wr_data       ( cmp_lcl_wr_data       ),
          /*input         [0008:0]            */   .cmp_lcl_wr_ctx        ( cmp_lcl_wr_ctx        ),
          /*input                             */   .cmp_lcl_wr_ctx_valid  ( cmp_lcl_wr_ctx_valid  ),
          /*output                            */   .cmp_lcl_wr_ready      ( cmp_lcl_wr_ready      ),
          /* Write Response Channel */                                                           
          /*output reg                        */   .cmp_lcl_wr_rsp_valid  ( cmp_lcl_wr_rsp_valid  ),
          /*output reg    [AXI_ID_WIDTH - 1:0]*/   .cmp_lcl_wr_rsp_axi_id ( cmp_lcl_wr_rsp_axi_id ),
          /*output reg                        */   .cmp_lcl_wr_rsp_code   ( cmp_lcl_wr_rsp_code   ),
          /*input         [0031:0]            */   .cmp_lcl_wr_rsp_ready  ( cmp_lcl_wr_rsp_ready  ),
          /* A2H MM Engine LCL Wr IF */                                                          
          /* Write Addr/Data Channel */                                                          
          /*input                             */   .mm_lcl_wr_valid       ( mm_lcl_wr_valid       ),
          /*input        [0063:0]             */   .mm_lcl_wr_ea          ( mm_lcl_wr_ea          ),
          /*input        [AXI_ID_WIDTH - 1:0] */   .mm_lcl_wr_axi_id      ( mm_lcl_wr_axi_id      ),
          /*input        [0127:0]             */   .mm_lcl_wr_be          ( mm_lcl_wr_be          ),
          /*input                             */   .mm_lcl_wr_first       ( mm_lcl_wr_first       ),
          /*input                             */   .mm_lcl_wr_last        ( mm_lcl_wr_last        ),
          /*input        [1023:0]             */   .mm_lcl_wr_data        ( mm_lcl_wr_data        ),
          /*input        [0008:0]             */   .mm_lcl_wr_ctx         ( mm_lcl_wr_ctx         ),
          /*input                             */   .mm_lcl_wr_ctx_valid   ( mm_lcl_wr_ctx_valid   ),
          /*output                            */   .mm_lcl_wr_ready       ( mm_lcl_wr_ready       ),
          /* Write Response Channel */                                                           
          /*output reg                        */   .mm_lcl_wr_rsp_valid   ( mm_lcl_wr_rsp_valid   ),
          /*output reg   [AXI_ID_WIDTH - 1:0] */   .mm_lcl_wr_rsp_axi_id  ( mm_lcl_wr_rsp_axi_id  ),
          /*output reg                        */   .mm_lcl_wr_rsp_code    ( mm_lcl_wr_rsp_code    ),
          /*input                             */   .mm_lcl_wr_rsp_ready   ( mm_lcl_wr_rsp_ready   ),
          /* A2H ST Engine LCL Wr IF */                                                          
          /* Write Addr/Data Channel */                                                          
          /*input                             */   .st_lcl_wr_valid       ( st_lcl_wr_valid       ),
          /*input        [0063:0]             */   .st_lcl_wr_ea          ( st_lcl_wr_ea          ),
          /*input        [AXI_ID_WIDTH - 1:0] */   .st_lcl_wr_axi_id      ( st_lcl_wr_axi_id      ),
          /*input        [0127:0]             */   .st_lcl_wr_be          ( st_lcl_wr_be          ),
          /*input                             */   .st_lcl_wr_first       ( st_lcl_wr_first       ),
          /*input                             */   .st_lcl_wr_last        ( st_lcl_wr_last        ),
          /*input        [1023:0]             */   .st_lcl_wr_data        ( st_lcl_wr_data        ),
          /*input        [0008:0]             */   .st_lcl_wr_ctx         ( st_lcl_wr_ctx         ),
          /*input                             */   .st_lcl_wr_ctx_valid   ( st_lcl_wr_ctx_valid   ),
          /*output                            */   .st_lcl_wr_ready       ( st_lcl_wr_ready       ),
          /* Write Response Channel */                                                           
          /*output reg                        */   .st_lcl_wr_rsp_valid   ( st_lcl_wr_rsp_valid   ),
          /*output reg   [AXI_ID_WIDTH - 1:0] */   .st_lcl_wr_rsp_axi_id  ( st_lcl_wr_rsp_axi_id  ),
          /*output reg                        */   .st_lcl_wr_rsp_code    ( st_lcl_wr_rsp_code    ),
          /*input        [0031:0]             */   .st_lcl_wr_rsp_ready   ( st_lcl_wr_rsp_ready   )
                                                   );
endmodule
