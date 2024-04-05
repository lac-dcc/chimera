//
// Copyright (c) 2015 James Hongyi Zeng, Yury Audzevich
// Copyright (c) 2016 Jong Hun Han
// Copyright (c) 2021 Yuta Tokusashi
// All rights reserved.
//
// This software was developed by
// Stanford University and the University of Cambridge Computer Laboratory
// under National Science Foundation under Grant No. CNS-0855268,
// the University of Cambridge Computer Laboratory under EPSRC INTERNET Project EP/H040536/1 and
// by the University of Cambridge Computer Laboratory under DARPA/AFRL contract FA8750-11-C-0249 ("MRC2"), 
// as part of the DARPA MRC research programme,
// and by the University of Cambridge Computer Laboratory under EPSRC EARL Project
// EP/P025374/1 alongside support from Xilinx Inc.
//
// @NETFPGA_LICENSE_HEADER_START@
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
// @NETFPGA_LICENSE_HEADER_END@


`timescale 1ps / 1ps
`include "nf_mac_attachment_cpu_regs_defines.v"

module nf_mac_attachment #(
    // Master AXI Stream Data Width    
    parameter C_M_AXIS_DATA_WIDTH       = 512,
    parameter C_S_AXIS_DATA_WIDTH       = 512,
    parameter C_M_AXIS_TUSER_WIDTH      = 128,
    parameter C_S_AXIS_TUSER_WIDTH      = 128,
    parameter C_S_AXI_DATA_WIDTH        = 32,
    parameter C_S_AXI_ADDR_WIDTH        = 32,
    parameter C_BASEADDR                = 32'h00000000,
    parameter C_DEFAULT_VALUE_ENABLE    = 1,
    parameter C_DEFAULT_SRC_PORT        = 0,
    parameter C_DEFAULT_DST_PORT        = 0
) (
  // 10GE block clk & rst 
  input                                 clk156,
  input                                 areset_clk156,

  // RX MAC 64b@clk156 (no backpressure) -> rx_queue 64b@axis_clk
  input [511:0]                         m_axis_mac_tdata,
  input [63:0]                          m_axis_mac_tkeep,
  input                                 m_axis_mac_tvalid,
  input                                 m_axis_mac_tuser_err,   // valid frame
  input [C_M_AXIS_TUSER_WIDTH-1:0]      m_axis_mac_tuser,
  input                                 m_axis_mac_tlast,

  // tx_queue 64b@axis_clk -> mac 64b@clk156
  output [511:0]                        s_axis_mac_tdata,
  output [63:0]                         s_axis_mac_tkeep,
  output                                s_axis_mac_tvalid,
  output                                s_axis_mac_tuser_err,   //underrun
  output [C_M_AXIS_TUSER_WIDTH-1:0]     s_axis_mac_tuser,
  output                                s_axis_mac_tlast,
  input                                 s_axis_mac_tready,

  // TX/RX DATA channels  
  input [7:0]                           interface_number,

  // NFPLUS pipeline clk & rst 
  input                                 axis_aclk,
  input                                 axis_aresetn,

  // input from ref pipeline 256b -> MAC
  input [C_S_AXIS_DATA_WIDTH-1:0]       s_axis_pipe_tdata, 
  input [(C_S_AXIS_DATA_WIDTH/8)-1:0]   s_axis_pipe_tkeep, 
  input                                 s_axis_pipe_tlast, 
  input [C_S_AXIS_TUSER_WIDTH-1:0]      s_axis_pipe_tuser, 
  input                                 s_axis_pipe_tvalid,
  output                                s_axis_pipe_tready,

  // output to ref pipeline 256b -> DMA
  output [C_M_AXIS_DATA_WIDTH-1:0]      m_axis_pipe_tdata, 
  output [(C_M_AXIS_DATA_WIDTH/8)-1:0]  m_axis_pipe_tkeep, 
  output                                m_axis_pipe_tlast, 
  output [C_M_AXIS_TUSER_WIDTH-1:0]     m_axis_pipe_tuser, 
  output                                m_axis_pipe_tvalid,
  input                                 m_axis_pipe_tready,

  input                                     S_AXI_ACLK,
  input                                     S_AXI_ARESETN,
  input      [C_S_AXI_ADDR_WIDTH-1 : 0]     S_AXI_AWADDR,
  input                                     S_AXI_AWVALID,
  input      [C_S_AXI_DATA_WIDTH-1 : 0]     S_AXI_WDATA,
  input      [C_S_AXI_DATA_WIDTH/8-1 : 0]   S_AXI_WSTRB,
  input                                     S_AXI_WVALID,
  input                                     S_AXI_BREADY,
  input      [C_S_AXI_ADDR_WIDTH-1 : 0]     S_AXI_ARADDR,
  input                                     S_AXI_ARVALID,
  input                                     S_AXI_RREADY,
  output                                    S_AXI_ARREADY,
  output     [C_S_AXI_DATA_WIDTH-1 : 0]     S_AXI_RDATA,
  output     [1 : 0]                        S_AXI_RRESP,
  output                                    S_AXI_RVALID,
  output                                    S_AXI_WREADY,
  output     [1 :0]                         S_AXI_BRESP,
  output                                    S_AXI_BVALID,
  output                                    S_AXI_AWREADY

 );


 /////////////////////////////////////////////////////////////////////   
 // localparam 
 /////////////////////////////////////////////////////////////////////
 localparam C_M_AXIS_DATA_WIDTH_INTERNAL    = 512;
 localparam C_S_AXIS_DATA_WIDTH_INTERNAL    = 512;    

 localparam NUM_RW_REGS                     = 1;
 localparam NUM_RO_REGS                     = 17;

 // localparam for now, should be params
 localparam C_USE_WSTRB                     = 0;

 /////////////////////////////////////////////////////////////////////
 // signals
 /////////////////////////////////////////////////////////////////////

 // rx_queue -> AXIS_converter
 wire [C_M_AXIS_DATA_WIDTH_INTERNAL-1:0]        m_axis_fifo_tdata;
 wire [(C_M_AXIS_DATA_WIDTH_INTERNAL/8)-1:0]    m_axis_fifo_tkeep;
 wire [C_S_AXIS_TUSER_WIDTH-1:0]                m_axis_fifo_tuser;
 wire                                           m_axis_fifo_tvalid;
 wire                                           m_axis_fifo_tready;
 wire                                           m_axis_fifo_tlast;  

 // AXIS_converter 64b@axis_clk -> tx_queue@axis_clk  
 wire [C_S_AXIS_DATA_WIDTH_INTERNAL-1:0]        s_axis_fifo_tdata;
 wire [(C_S_AXIS_DATA_WIDTH_INTERNAL/8)-1:0]    s_axis_fifo_tkeep;
 wire [C_S_AXIS_TUSER_WIDTH-1:0]                s_axis_fifo_tuser;
 wire                                           s_axis_fifo_tvalid;
 wire                                           s_axis_fifo_tready;
 wire                                           s_axis_fifo_tlast;   

 ////////////////////////////////////////////////////////////////
 // 10g interface statistics
 // TODO: Send through AXI-Lite interface
 //////////////////////////////////////////////////////////////// 
  wire                                          interface_number_en;
  // tx_queues  
  wire                                          tx_dequeued_pkt; //
  wire                                          tx_pkts_enqueued_signal;//
  wire [15:0]                                   tx_bytes_enqueued;//
  wire                                          be; //

   /////////////////////////////////////////////////////////////////////////////
   /////////////// DATA WIDTH conversion logic   ///////////////// 
   /////////////////////////////////////////////////////////////////////////////
   assign interface_number_en = (C_DEFAULT_VALUE_ENABLE) ? 1'b1 : 1'b0;
   /////////////////////////////////////////////////////////////////////////////
   /////////////// RX SIDE MAC -> DMA: FIFO + AXIS_CONV         ///////////////// 
   /////////////////////////////////////////////////////////////////////////////
   // Internal FIFO resets for clk domain crossing 
   wire                                            areset_rx_fifo_extended;
   wire                                            areset_tx_fifo_extended; 	

   // FIFO36_72 primitive rst extension rx
   data_sync_block #(
     .C_NUM_SYNC_REGS                     (6)
   ) rx_fifo_rst (
     .clk                                 (axis_aclk),
     .data_in                             (~axis_aresetn),
     .data_out                            (areset_rx_fifo_extended)
   );

   // FIFO36_72 primitive rst extension tx
   data_sync_block #(
     .C_NUM_SYNC_REGS                     (6)
   ) tx_fifo_rst (
     .clk                                 (axis_aclk),
     .data_in                             (~axis_aresetn),
     .data_out                            (areset_tx_fifo_extended)
   );     

 
   //-------------------------------------------------------------------------
   // RX queue: 64b@clk ->64b@axis_clk conversion. 
   // Creates a backpressure to the interface (axi ethernet block doesn't have tready signal).
   // IMPORTANT: FIFO36_72 requires rst to be asserted for at least 5 clks. RDEN and WREN 
   // should be ONLY 1'b0 at that time. 
   //-------------------------------------------------------------------------  
   rx_queue #(
     .AXI_DATA_WIDTH                      (C_M_AXIS_DATA_WIDTH_INTERNAL)
    ) rx_fifo_intf (
    // MAC input 64b@clk156
    .clk156                               (clk156),
    .areset_clk156                        (areset_clk156),

    .i_tdata                              (m_axis_mac_tdata),
    .i_tkeep                              (m_axis_mac_tkeep),
    .i_tuser_err                          (m_axis_mac_tuser_err),
    .i_tuser                              (m_axis_mac_tuser),
    .i_tvalid                             (m_axis_mac_tvalid),
    .i_tlast                              (m_axis_mac_tlast),

    // FIFO output 64b@axi_aclk
    .clk                                  (axis_aclk),
    .reset                                (areset_rx_fifo_extended), 

    .o_tdata                              (m_axis_fifo_tdata),
    .o_tkeep                              (m_axis_fifo_tkeep),
    .o_tuser                              (m_axis_fifo_tuser),
    .o_tvalid                             (m_axis_fifo_tvalid),
    .o_tlast                              (m_axis_fifo_tlast),
    .o_tready                             (m_axis_fifo_tready),

    // interface statistics
    .fifo_wr_en                           (fifo_wr_en),
    .rx_pkt_drop                          (rx_pkt_drop),
    .rx_bad_frame                         (rx_bad_frame), 
    .rx_good_frame                        (rx_good_frame)  
   ); 
   
   //--------------------------------------------------------------------------
   // 64b to 256b axis converter RX SIDE (rx_queue FIFO -> DMA): 
   // (AXIS mac_64b@axis_clk -> AXIS conv_256b@axis_clk with TUSER)  
   //--------------------------------------------------------------------------
   nf_axis_converter
   #(
    .C_M_AXIS_DATA_WIDTH                  (C_M_AXIS_DATA_WIDTH),
    .C_S_AXIS_DATA_WIDTH                  (C_M_AXIS_DATA_WIDTH_INTERNAL),  
    .C_M_AXIS_TUSER_WIDTH                 (C_M_AXIS_TUSER_WIDTH),
    .C_S_AXIS_TUSER_WIDTH                 (C_S_AXIS_TUSER_WIDTH), 
          
    .C_DEFAULT_VALUE_ENABLE               (C_DEFAULT_VALUE_ENABLE), // USE C_DEFAULT_VALUE_ENABLE = 1
    .C_DEFAULT_SRC_PORT                   (C_DEFAULT_SRC_PORT),
    .C_DEFAULT_DST_PORT                   (C_DEFAULT_DST_PORT)  
   ) 
   converter_rx (     
    .axi_aclk                             (axis_aclk),
    .axi_resetn                           (~areset_rx_fifo_extended),
              
    .interface_number                     (interface_number),
    .interface_number_en                  (interface_number_en),
      
    // Slave Ports (Input 64b from AXIS_FIFO)
    .s_axis_tdata                         (m_axis_fifo_tdata),
    .s_axis_tkeep                         (m_axis_fifo_tkeep),
    .s_axis_tvalid                        (m_axis_fifo_tvalid),
    .s_axis_tready                        (m_axis_fifo_tready), 
    .s_axis_tlast                         (m_axis_fifo_tlast),
    .s_axis_tuser                         (m_axis_fifo_tuser),

    // Master Ports (Output 256b to outside)
    .m_axis_tdata                         (m_axis_pipe_tdata),
    .m_axis_tkeep                         (m_axis_pipe_tkeep),
    .m_axis_tvalid                        (m_axis_pipe_tvalid),
    .m_axis_tready                        (m_axis_pipe_tready), 
    .m_axis_tlast                         (m_axis_pipe_tlast),
    .m_axis_tuser                         (m_axis_pipe_tuser) // sideband tuser 128b 
   );

    /////////////////////////////////////////////////////////////////////////////
    /////////////// TX SIDE DMA -> MAC: AXIS_CONV + FIFO      ///////////////// 
    /////////////////////////////////////////////////////////////////////////////  
    
    //--------------------------------------------------------------------------
    // 256b to 64b axis converter TX SIDE (Outside -> AXIS_CONV):
    // (AXIS 256b@axi_aclk -> AXIS 64b@axis_aclk)
    // C_DEFAULT_VALUE_ENABLE = 0 -- bypass tuser field logic
    //--------------------------------------------------------------------------
    nf_axis_converter
    #(
     .C_M_AXIS_DATA_WIDTH                (C_S_AXIS_DATA_WIDTH_INTERNAL),
     .C_S_AXIS_DATA_WIDTH                (C_S_AXIS_DATA_WIDTH),
     .C_DEFAULT_VALUE_ENABLE             (1'b0)
    )
    converter_tx (
     .axi_aclk                           (axis_aclk),
     .axi_resetn                         (~areset_tx_fifo_extended),

     .interface_number                   (interface_number),
     .interface_number_en                (interface_number_en),

     // Slave Ports (Input 256b from DMA)
     .s_axis_tdata                       (s_axis_pipe_tdata),
     .s_axis_tkeep                       (s_axis_pipe_tkeep),
     .s_axis_tvalid                      (s_axis_pipe_tvalid),
     .s_axis_tready                      (s_axis_pipe_tready),
     .s_axis_tlast                       (s_axis_pipe_tlast),
     .s_axis_tuser                       (s_axis_pipe_tuser),

     // Master Ports (Output 64b to AXIS_FIFO)
     .m_axis_tdata                       (s_axis_fifo_tdata),
     .m_axis_tkeep                       (s_axis_fifo_tkeep),
     .m_axis_tvalid                      (s_axis_fifo_tvalid),
     .m_axis_tready                      (s_axis_fifo_tready),
     .m_axis_tlast                       (s_axis_fifo_tlast),
     .m_axis_tuser                       (s_axis_fifo_tuser)
    );

    //-------------------------------------------------------------------------
    // TX queue: 64b@axis_clk -> 64b@clk conversion. 
    // TODO : add FSM from the original block for AXI-Lite interfaces
    // IMPORTANT: FIFO36_72 requires rst to be asserted for at least 5 clks. 
    // RDEN and WREN should be ONLY 1'b0 at that time. 
    //------------------------------------------------------------------------- 
    tx_queue #(
     .AXI_DATA_WIDTH                     (C_S_AXIS_DATA_WIDTH_INTERNAL), 
     .C_S_AXIS_TUSER_WIDTH               (C_S_AXIS_TUSER_WIDTH)
    ) tx_fifo_intf (    
      // AXIS input 64b @axis_clk    
     .clk                                (axis_aclk),
     .reset                              (areset_tx_fifo_extended),
          
     .i_tuser                            (s_axis_fifo_tuser),
     .i_tdata                            (s_axis_fifo_tdata),
     .i_tkeep                            (s_axis_fifo_tkeep),
     .i_tvalid                           (s_axis_fifo_tvalid),
     .i_tlast                            (s_axis_fifo_tlast),
     .i_tready                           (s_axis_fifo_tready),
      
      // AXIS MAC output 64b @156MHz      
     .clk156                             (clk156),
    .areset_clk156                        (areset_clk156),
     
     .o_tdata                            (s_axis_mac_tdata),
     .o_tkeep                            (s_axis_mac_tkeep),
     .o_tvalid                           (s_axis_mac_tvalid),
     .o_tlast                            (s_axis_mac_tlast),
     .o_tuser_err                        (s_axis_mac_tuser_err),
     .o_tuser                            (s_axis_mac_tuser),
     .o_tready                           (s_axis_mac_tready),
        
     // sideband data
     .tx_dequeued_pkt                    (tx_dequeued_pkt),
     .be                                 (be),  
     .tx_pkts_enqueued_signal            (tx_pkts_enqueued_signal),
     .tx_bytes_enqueued                  (tx_bytes_enqueued)      
     );
  
    //-------------------------------------------------------------------------
    // AXI-Lite registers 
    // TODO : AXI-lite slave interface (not ipif) 
    //------------------------------------------------------------------------- 
    reg      [`REG_ID_BITS]        id_reg;
    reg      [`REG_VERSION_BITS]   version_reg;
    wire     [`REG_RESET_BITS]     reset_reg;
    wire     [`REG_RESET_BITS]     mac_reset_reg;
    reg      [`REG_FLIP_BITS]      ip2cpu_flip_reg;
    wire     [`REG_FLIP_BITS]      cpu2ip_flip_reg;
    reg      [`REG_DEBUG_BITS]     ip2cpu_debug_reg;
    wire     [`REG_DEBUG_BITS]     cpu2ip_debug_reg;
    reg      [`REG_RXMACPKT_BITS] rx_mac_pktin_reg, rx_queue_pktin_reg, rx_conv_pktin_reg;
    reg      [`REG_TXMACPKT_BITS] tx_mac_pktin_reg, tx_queue_pktin_reg, tx_conv_pktin_reg;
    wire                          rx_mac_pktin_reg_clear, rx_queue_pktin_reg_clear, rx_conv_pktin_reg_clear;
    wire                          tx_mac_pktin_reg_clear, tx_queue_pktin_reg_clear, tx_conv_pktin_reg_clear;

    wire resetn_soft, resetn_sync, mac_resetn_sync, cpu_resetn_soft;
    wire clear_counters;
    wire reset_registers;
    wire reset_tables;
    wire mac_clear_counters;
    wire mac_reset_registers;
    wire mac_reset_tables;
    nf_mac_attachment_cpu_regs #(
     .C_BASE_ADDRESS        (C_BASEADDR),
     .C_S_AXI_DATA_WIDTH    (C_S_AXI_DATA_WIDTH),
     .C_S_AXI_ADDR_WIDTH    (C_S_AXI_ADDR_WIDTH)
    ) u_nf_mac_attachment_cpu_reg (
     // General ports
     .mac_clk         (clk156),
     .mac_resetn      (!areset_clk156),
     .clk             (axis_aclk),
     .resetn          (axis_aresetn),
     // Global Registers
     .cpu_resetn_soft (cpu_resetn_soft ),
     .resetn_soft     (resetn_soft     ),
     .resetn_sync     (resetn_sync     ),
     .mac_resetn_sync (mac_resetn_sync ),
     // Register ports
     .id_reg          (id_reg),
     .version_reg     (version_reg),
     .reset_reg       (reset_reg),
     .mac_reset_reg    (mac_reset_reg),
     .ip2cpu_flip_reg (ip2cpu_flip_reg ),
     .cpu2ip_flip_reg (cpu2ip_flip_reg ),
     .ip2cpu_debug_reg(ip2cpu_debug_reg),
     .cpu2ip_debug_reg(cpu2ip_debug_reg),
     .rx_mac_pktin_reg         (rx_mac_pktin_reg        ),
     .rx_mac_pktin_reg_clear   (rx_mac_pktin_reg_clear  ),
     .rx_queue_pktin_reg       (rx_queue_pktin_reg      ),
     .rx_queue_pktin_reg_clear (rx_queue_pktin_reg_clear),
     .rx_conv_pktin_reg        (rx_conv_pktin_reg       ),
     .rx_conv_pktin_reg_clear  (rx_conv_pktin_reg_clear ),
     .tx_mac_pktin_reg         (tx_mac_pktin_reg        ),
     .tx_mac_pktin_reg_clear   (tx_mac_pktin_reg_clear  ),
     .tx_queue_pktin_reg       (tx_queue_pktin_reg      ),
     .tx_queue_pktin_reg_clear (tx_queue_pktin_reg_clear),
     .tx_conv_pktin_reg        (tx_conv_pktin_reg       ),
     .tx_conv_pktin_reg_clear  (tx_conv_pktin_reg_clear ),
     // AXI Lite ports
     .S_AXI_ACLK      (S_AXI_ACLK   ),
     .S_AXI_ARESETN   (S_AXI_ARESETN),
     .S_AXI_AWADDR    (S_AXI_AWADDR & 32'h0000ffff),
     .S_AXI_AWVALID   (S_AXI_AWVALID),
     .S_AXI_WDATA     (S_AXI_WDATA  ),
     .S_AXI_WSTRB     (S_AXI_WSTRB  ),
     .S_AXI_WVALID    (S_AXI_WVALID ),
     .S_AXI_BREADY    (S_AXI_BREADY ),
     .S_AXI_ARADDR    (S_AXI_ARADDR & 32'h0000ffff),
     .S_AXI_ARVALID   (S_AXI_ARVALID),
     .S_AXI_RREADY    (S_AXI_RREADY ),
     .S_AXI_ARREADY   (S_AXI_ARREADY),
     .S_AXI_RDATA     (S_AXI_RDATA  ),
     .S_AXI_RRESP     (S_AXI_RRESP  ),
     .S_AXI_RVALID    (S_AXI_RVALID ),
     .S_AXI_WREADY    (S_AXI_WREADY ),
     .S_AXI_BRESP     (S_AXI_BRESP  ),
     .S_AXI_BVALID    (S_AXI_BVALID ),
     .S_AXI_AWREADY   (S_AXI_AWREADY)
    );

    assign clear_counters      = reset_reg[0];
    assign reset_registers     = reset_reg[4];
    assign reset_tables        = reset_reg[8];
    assign mac_clear_counters  = mac_reset_reg[0];
    assign mac_reset_registers = mac_reset_reg[4];
    assign mac_reset_tables    = mac_reset_reg[8];
    //------------------------------------------------------------
    // MAC interface statistics
    //------------------------------------------------------------
    always @ (posedge clk156) begin
        if (~mac_resetn_sync | mac_reset_registers) begin
            rx_mac_pktin_reg <= #1    `REG_RXMACPKT_DEFAULT;
            tx_mac_pktin_reg <= #1    `REG_TXMACPKT_DEFAULT;
        end
        else begin
            rx_mac_pktin_reg[`REG_RXMACPKT_WIDTH-2:0] <= #1 clear_counters | rx_mac_pktin_reg_clear ? 'h0 :
                  rx_mac_pktin_reg[`REG_RXMACPKT_WIDTH-2:0] + (m_axis_mac_tvalid && m_axis_mac_tlast);
            rx_mac_pktin_reg[`REG_RXMACPKT_WIDTH-1] <= #1 clear_counters | rx_mac_pktin_reg_clear ? 1'h0 :
                  rx_mac_pktin_reg[`REG_RXMACPKT_WIDTH-2:0] + (m_axis_mac_tvalid && m_axis_mac_tlast)
                  > {(`REG_RXMACPKT_WIDTH-1){1'b1}} ? 1'b1 : rx_mac_pktin_reg[`REG_RXMACPKT_WIDTH-1];
            tx_mac_pktin_reg[`REG_TXMACPKT_WIDTH-2:0] <= #1 clear_counters | tx_mac_pktin_reg_clear ? 'h0 :
                  tx_mac_pktin_reg[`REG_TXMACPKT_WIDTH-2:0] + (s_axis_mac_tvalid && s_axis_mac_tready && s_axis_mac_tlast);
            tx_mac_pktin_reg[`REG_RXMACPKT_WIDTH-1] <= #1 clear_counters | tx_mac_pktin_reg_clear ? 1'h0 :
                  tx_mac_pktin_reg[`REG_TXMACPKT_WIDTH-2:0] + (s_axis_mac_tvalid && s_axis_mac_tready && s_axis_mac_tlast)
                  > {(`REG_TXMACPKT_WIDTH-1){1'b1}} ? 1'b1 : tx_mac_pktin_reg[`REG_TXMACPKT_WIDTH-1];
        end
    end

    always @ (posedge axis_aclk) begin
        if (~resetn_sync | reset_registers) begin
            id_reg             <= #1    `REG_ID_DEFAULT;
            version_reg        <= #1    `REG_VERSION_DEFAULT;
            ip2cpu_flip_reg    <= #1    `REG_FLIP_DEFAULT;
            ip2cpu_debug_reg   <= #1    `REG_DEBUG_DEFAULT;
            rx_queue_pktin_reg <= #1    `REG_RXQPKT_DEFAULT;
            rx_conv_pktin_reg  <= #1    `REG_RXCONVPKT_DEFAULT;
            tx_queue_pktin_reg <= #1    `REG_TXQPKT_DEFAULT;
            tx_conv_pktin_reg  <= #1    `REG_TXCONVPKT_DEFAULT;
        end
        else begin
            rx_queue_pktin_reg[`REG_RXQPKT_WIDTH-2:0] <= #1 clear_counters | rx_queue_pktin_reg_clear ? 'h0 :
                  rx_queue_pktin_reg[`REG_RXQPKT_WIDTH-2:0] + (m_axis_fifo_tvalid && m_axis_fifo_tready && m_axis_fifo_tlast);
            rx_queue_pktin_reg[`REG_RXQPKT_WIDTH-1] <= #1 clear_counters | rx_queue_pktin_reg_clear ? 1'h0 :
                  rx_queue_pktin_reg[`REG_RXQPKT_WIDTH-2:0] + (m_axis_fifo_tvalid && m_axis_fifo_tready && m_axis_fifo_tlast)
                  > {(`REG_RXQPKT_WIDTH-1){1'b1}} ? 1'b1 : rx_queue_pktin_reg[`REG_RXQPKT_WIDTH-1];
            tx_queue_pktin_reg[`REG_TXQPKT_WIDTH-2:0] <= #1 clear_counters | tx_queue_pktin_reg_clear ? 'h0 :
                  tx_queue_pktin_reg[`REG_TXQPKT_WIDTH-2:0] + (s_axis_fifo_tvalid && s_axis_fifo_tready && s_axis_fifo_tlast);
            tx_queue_pktin_reg[`REG_TXQPKT_WIDTH-1] <= #1 clear_counters | tx_queue_pktin_reg_clear ? 1'h0 :
                  tx_queue_pktin_reg[`REG_TXQPKT_WIDTH-2:0] + (s_axis_fifo_tvalid && s_axis_fifo_tready && s_axis_fifo_tlast)
                  > {(`REG_TXQPKT_WIDTH-1){1'b1}} ? 1'b1 : tx_queue_pktin_reg[`REG_TXQPKT_WIDTH-1];

            rx_conv_pktin_reg[`REG_RXCONVPKT_WIDTH-2:0] <= #1 clear_counters | rx_conv_pktin_reg_clear ? 'h0 :
                  rx_conv_pktin_reg[`REG_RXCONVPKT_WIDTH-2:0] + (m_axis_pipe_tvalid && m_axis_pipe_tready && m_axis_pipe_tlast);
            rx_conv_pktin_reg[`REG_RXCONVPKT_WIDTH-1] <= #1 clear_counters | rx_conv_pktin_reg_clear ? 1'h0 :
                  rx_conv_pktin_reg[`REG_RXCONVPKT_WIDTH-2:0] + (m_axis_pipe_tvalid && m_axis_pipe_tready && m_axis_pipe_tlast)
                  > {(`REG_RXCONVPKT_WIDTH-1){1'b1}} ? 1'b1 : rx_conv_pktin_reg[`REG_RXCONVPKT_WIDTH-1];
            tx_conv_pktin_reg[`REG_TXCONVPKT_WIDTH-2:0] <= #1 clear_counters | tx_conv_pktin_reg_clear ? 'h0 :
                  tx_conv_pktin_reg[`REG_TXCONVPKT_WIDTH-2:0] + (s_axis_pipe_tvalid && s_axis_pipe_tready && s_axis_pipe_tlast);
            tx_conv_pktin_reg[`REG_TXCONVPKT_WIDTH-1] <= #1 clear_counters | tx_conv_pktin_reg_clear ? 1'h0 :
                  tx_conv_pktin_reg[`REG_TXCONVPKT_WIDTH-2:0] + (s_axis_pipe_tvalid && s_axis_pipe_tready && s_axis_pipe_tlast)
                  > {(`REG_TXCONVPKT_WIDTH-1){1'b1}} ? 1'b1 : tx_conv_pktin_reg[`REG_TXCONVPKT_WIDTH-1];

            id_reg           <= #1    `REG_ID_DEFAULT;
            version_reg      <= #1    `REG_VERSION_DEFAULT;
            ip2cpu_flip_reg  <= #1    ~cpu2ip_flip_reg;
            ip2cpu_debug_reg <= #1    `REG_DEBUG_DEFAULT+cpu2ip_debug_reg;
        end
    end

endmodule
