//-
// Copyright (C) 2010, 2011 The Board of Trustees of The Leland Stanford
//                          Junior University
// Copyright (C) 2010, 2011 Muhammad Shahbaz
// Copyright (C) 2015 Gianni Antichi, Noa Zilberman
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
//
/*******************************************************************************
 *  File:
 *        switch_output_port_lookup.v
 *
 *  Library:
 *        hw/std/cores/switch_output_port_lookup
 *
 *  Module:
 *        switch_output_port_lookup
 *
 *  Author:
 *        Gianni Antichi, Muhammad Shahbaz
 *        Modified by Noa Zilberman
 * 		
 *  Description:
 *        Output port lookup for the reference Switch project
 *
 */
`timescale 1ns/1ns
`include "output_port_lookup_cpu_regs_defines.v"

module switch_output_port_lookup
#(
    //Master AXI Stream Data Width
    parameter C_M_AXIS_DATA_WIDTH  = 512,
    parameter C_S_AXIS_DATA_WIDTH  = 512,
    parameter C_M_AXIS_TUSER_WIDTH = 128,
    parameter C_S_AXIS_TUSER_WIDTH = 128,
    parameter SRC_PORT_POS         = 16,
    parameter DST_PORT_POS         = 24,
    parameter NUM_OUTPUT_QUEUES    = 8,


 // AXI Registers Data Width
    parameter C_S_AXI_DATA_WIDTH    = 32,
    parameter C_S_AXI_ADDR_WIDTH    = 12,
    parameter C_USE_WSTRB           = 0,
    parameter C_DPHASE_TIMEOUT      = 0,
    parameter C_NUM_ADDRESS_RANGES  = 1,
    parameter C_CAM_LUT_DEPTH_BITS  = 4,
    parameter  C_TOTAL_NUM_CE       = 1,
    parameter  C_S_AXI_MIN_SIZE     = 32'h0000_FFFF,
    parameter [0:8*C_NUM_ADDRESS_RANGES-1] C_ARD_NUM_CE_ARRAY  = 
                                                {
                                                 C_NUM_ADDRESS_RANGES{8'd1}
                                                 },
    parameter     C_FAMILY            = "virtex7", 
    parameter C_BASEADDR            = 32'h00000000,
    parameter C_HIGHADDR            = 32'h0000FFFF


)
(
    // Global Ports
    input                                      axis_aclk,
    input                                      axis_resetn,

    // Master Stream Ports (interface to data path)
    output [C_M_AXIS_DATA_WIDTH - 1:0]         m_axis_tdata,
    output [((C_M_AXIS_DATA_WIDTH / 8)) - 1:0] m_axis_tkeep,
    output reg [C_M_AXIS_TUSER_WIDTH-1:0]      m_axis_tuser,
    output                                     m_axis_tvalid,
    input                                      m_axis_tready,
    output                                     m_axis_tlast,

    // Slave Stream Ports (interface to RX queues)
    input [C_S_AXIS_DATA_WIDTH - 1:0]          s_axis_tdata,
    input [((C_S_AXIS_DATA_WIDTH / 8)) - 1:0]  s_axis_tkeep,
    input [C_S_AXIS_TUSER_WIDTH-1:0]           s_axis_tuser,
    input                                      s_axis_tvalid,
    output                                     s_axis_tready,
    input                                      s_axis_tlast,


// Slave AXI Ports
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

  function integer log2;
     input integer number;
     begin
        log2=0;
        while(2**log2<number) begin
           log2=log2+1;
        end
     end
  endfunction // log2

  //--------------------- Internal Parameter-------------------------
  localparam DEFAULT_MISS_OUTPUT_PORTS = 8'h05; // exclude the CPU queues

  localparam NUM_STATES                = 2;
  localparam WAIT_STATE                = 1;
  localparam SEND_STATE                = 2;

  //---------------------- Wires and Regs ----------------------------
  wire [47:0]			           dst_mac;
  wire [47:0]                     src_mac;
  wire [NUM_OUTPUT_QUEUES-1:0]    src_port;
  wire                            eth_done;
  wire [NUM_OUTPUT_QUEUES-1:0]    dst_ports;
  
  wire                            lookup_done;
  reg				   send_packet;
  
  wire [C_S_AXIS_TUSER_WIDTH-1:0] tuser_fifo;

  wire                            in_fifo_rd_en;
  wire                            in_fifo_nearly_full;
  wire                            in_fifo_empty;

  wire [NUM_OUTPUT_QUEUES-1:0]    dst_ports_latched;
  reg                             dst_port_rd;
  wire                            dst_port_fifo_nearly_full;
  wire                            dst_port_fifo_empty;
  
  reg  [NUM_STATES-1:0]           state, state_next;


  reg      [`REG_ID_BITS]    id_reg;
  reg      [`REG_VERSION_BITS]    version_reg;
  wire     [`REG_RESET_BITS]    reset_reg;
  reg      [`REG_FLIP_BITS]    ip2cpu_flip_reg;
  wire     [`REG_FLIP_BITS]    cpu2ip_flip_reg;
  reg      [`REG_PKTIN_BITS]    pktin_reg;
  wire                             pktin_reg_clear;
  reg      [`REG_PKTOUT_BITS]    pktout_reg;
  wire                             pktout_reg_clear;
  reg      [`REG_LUTHIT_BITS]    luthit_reg;
  wire                             luthit_reg_clear;
  reg      [`REG_LUTMISS_BITS]    lutmiss_reg;
  wire                             lutmiss_reg_clear;
  reg      [`REG_DEBUG_BITS]    ip2cpu_debug_reg;
  wire     [`REG_DEBUG_BITS]    cpu2ip_debug_reg;

  wire clear_counters;
  wire reset_registers;
  wire reset_tables;

  reg cam_reset;

  always @(posedge axis_aclk) cam_reset <= #1 ~axis_resetn | reset_tables;

  //-------------------- Modules and Logic ---------------------------
  /* The size of this fifo has to be large enough to fit the previous modules' headers
   * and the ethernet header */
  fallthrough_small_fifo #(.WIDTH(C_M_AXIS_DATA_WIDTH+C_M_AXIS_TUSER_WIDTH+C_M_AXIS_DATA_WIDTH/8+1), .MAX_DEPTH_BITS(4))
     input_fifo
       (.din         ({s_axis_tlast, s_axis_tuser, s_axis_tkeep, s_axis_tdata}),     // Data in
        .wr_en       (s_axis_tvalid & s_axis_tready),                                // Write enable
        .rd_en       (in_fifo_rd_en),                                                // Read the next word
        .dout        ({m_axis_tlast, tuser_fifo, m_axis_tkeep, m_axis_tdata}),
        .full        (),
        .prog_full   (),
        .nearly_full (in_fifo_nearly_full),
        .empty       (in_fifo_empty),
        .reset       (~axis_resetn),
        .clk         (axis_aclk)
        );

  assign s_axis_tready = ~in_fifo_nearly_full /*& !eth_done*/;

  eth_parser
    #(.C_S_AXIS_DATA_WIDTH (C_S_AXIS_DATA_WIDTH),
      .C_S_AXIS_TUSER_WIDTH (C_S_AXIS_TUSER_WIDTH))
     eth_parser
        (.tdata    (s_axis_tdata),
         .tuser    (s_axis_tuser),
         .valid    (s_axis_tvalid & s_axis_tready),
         .tlast    (s_axis_tlast),
         .dst_mac  (dst_mac),
         .src_mac  (src_mac),
         .eth_done (eth_done),
         .src_port (src_port),
         .reset    (~axis_resetn),
         .clk      (axis_aclk));


  mac_cam_lut
    #(.NUM_OUTPUT_QUEUES(NUM_OUTPUT_QUEUES),
      .LUT_DEPTH_BITS(C_CAM_LUT_DEPTH_BITS),
      .DEFAULT_MISS_OUTPUT_PORTS(DEFAULT_MISS_OUTPUT_PORTS))
  mac_cam_lut
    // --- lookup and learn port
    (.dst_mac      (dst_mac),
     .src_mac      (src_mac),
     .src_port     (src_port),
     .lookup_req   (eth_done),
     .dst_ports    (dst_ports),
     
     .lookup_done  (lookup_done),  // pulses high on lookup done
     .lut_hit      (lut_hit),
     .lut_miss     (lut_miss),

     // --- Misc
     .clk          (axis_aclk),
     .reset        (cam_reset));

  fallthrough_small_fifo #(.WIDTH(NUM_OUTPUT_QUEUES), .MAX_DEPTH_BITS(2))
     dst_port_fifo
       (.din (dst_ports),		// Data in
        .wr_en (lookup_done),             // Write enable
        .rd_en (dst_port_rd),       // Read the next word
        .dout (dst_ports_latched),
        .full (),
        .prog_full (),
        .nearly_full (dst_port_fifo_nearly_full),
        .empty (dst_port_fifo_empty),
        .reset (~axis_resetn),
        .clk (axis_aclk)
        );

  /*********************************************************************
   * Wait until the ethernet header has been decoded and the output
   * port is found, then write the module header and move the packet
   * to the output
   **********************************************************************/
  always @(*) begin
     m_axis_tuser = tuser_fifo;
     state_next   = state;
     dst_port_rd = 0;
     send_packet  = 1;

     case(state)
       WAIT_STATE: begin
          send_packet = 0;

          if(!dst_port_fifo_empty) begin
            m_axis_tuser[DST_PORT_POS+7:DST_PORT_POS] = dst_ports_latched;
            send_packet = 1;
            if (m_axis_tvalid & m_axis_tready & m_axis_tlast) begin
              state_next = WAIT_STATE;
              dst_port_rd = 1;
            end
            else if (m_axis_tvalid & m_axis_tready) begin
              state_next = SEND_STATE;
              dst_port_rd = 1;
            end
          end
       end

       SEND_STATE: begin
         if(m_axis_tlast & m_axis_tvalid & m_axis_tready)
           state_next = WAIT_STATE;
       end
     endcase // case(state)
  end // always @ (*)

  always @(posedge axis_aclk) begin
     if(~axis_resetn) begin
        state <= WAIT_STATE;
     end
     else begin
        state <= state_next;
     end
  end

  // Control signals
  assign m_axis_tvalid = ~in_fifo_empty & send_packet;
  assign in_fifo_rd_en = m_axis_tready & m_axis_tvalid;

  //Registers section
  output_port_lookup_cpu_regs 
   #(
     .C_S_AXI_DATA_WIDTH (C_S_AXI_DATA_WIDTH),
     .C_S_AXI_ADDR_WIDTH (C_S_AXI_ADDR_WIDTH),
     .C_BASE_ADDRESS    (C_BASEADDR)
   )
   opl_cpu_regs_inst
   (
     // General ports
      .clk                    (axis_aclk),
      .resetn                 (axis_resetn),
     // AXI Lite ports
      .S_AXI_ACLK             (S_AXI_ACLK),
      .S_AXI_ARESETN          (S_AXI_ARESETN),
      .S_AXI_AWADDR           (S_AXI_AWADDR),
      .S_AXI_AWVALID          (S_AXI_AWVALID),
      .S_AXI_WDATA            (S_AXI_WDATA),
      .S_AXI_WSTRB            (S_AXI_WSTRB),
      .S_AXI_WVALID           (S_AXI_WVALID),
      .S_AXI_BREADY           (S_AXI_BREADY),
      .S_AXI_ARADDR           (S_AXI_ARADDR),
      .S_AXI_ARVALID          (S_AXI_ARVALID),
      .S_AXI_RREADY           (S_AXI_RREADY),
      .S_AXI_ARREADY          (S_AXI_ARREADY),
      .S_AXI_RDATA            (S_AXI_RDATA),
      .S_AXI_RRESP            (S_AXI_RRESP),
      .S_AXI_RVALID           (S_AXI_RVALID),
      .S_AXI_WREADY           (S_AXI_WREADY),
      .S_AXI_BRESP            (S_AXI_BRESP),
      .S_AXI_BVALID           (S_AXI_BVALID),
      .S_AXI_AWREADY          (S_AXI_AWREADY),

      // Register ports
      .id_reg          (id_reg),
      .version_reg          (version_reg),
      .reset_reg          (reset_reg),
      .ip2cpu_flip_reg          (ip2cpu_flip_reg),
      .cpu2ip_flip_reg          (cpu2ip_flip_reg),
      .pktin_reg           (pktin_reg),
      .pktin_reg_clear     (pktin_reg_clear),
      .pktout_reg          (pktout_reg),
      .pktout_reg_clear    (pktout_reg_clear),
      .luthit_reg              (luthit_reg),
      .luthit_reg_clear        (luthit_reg_clear),
      .lutmiss_reg             (lutmiss_reg),
      .lutmiss_reg_clear       (lutmiss_reg_clear),

      .ip2cpu_debug_reg          (ip2cpu_debug_reg),
      .cpu2ip_debug_reg          (cpu2ip_debug_reg),
      // Global Registers - user can select if to use
      .cpu_resetn_soft(),//software reset, after cpu module
      .resetn_soft    (),//software reset to cpu module (from central reset management)
      .resetn_sync    (resetn_sync)//synchronized reset, use for better timing
  );

  assign clear_counters =  reset_reg[0];
  assign reset_registers = reset_reg[4];
  assign reset_tables   =  reset_reg[8];

  ////registers logic, current logic is just a placeholder for initial compil, required to be changed by the user
  always @(posedge axis_aclk)
    if (~resetn_sync | reset_registers) begin
      id_reg <= #1    `REG_ID_DEFAULT;
      version_reg <= #1    `REG_VERSION_DEFAULT;
      ip2cpu_flip_reg <= #1    `REG_FLIP_DEFAULT;
      pktin_reg <= #1    `REG_PKTIN_DEFAULT;
      pktout_reg <= #1    `REG_PKTOUT_DEFAULT;
      luthit_reg <= #1    `REG_LUTHIT_DEFAULT;
      lutmiss_reg <= #1    `REG_LUTMISS_DEFAULT;
      ip2cpu_debug_reg <= #1    `REG_DEBUG_DEFAULT;
    end
    else begin
      id_reg <= #1    `REG_ID_DEFAULT;
      version_reg <= #1    `REG_VERSION_DEFAULT;
      ip2cpu_flip_reg <= #1    ~cpu2ip_flip_reg;
      pktin_reg[`REG_PKTIN_WIDTH -2: 0] <= #1  clear_counters | pktin_reg_clear ? 'h0  : pktin_reg[`REG_PKTIN_WIDTH-2:0] + (s_axis_tlast && s_axis_tvalid && s_axis_tready) ;
              pktin_reg[`REG_PKTIN_WIDTH-1] <= #1 clear_counters | pktin_reg_clear ? 1'h0   : pktin_reg[`REG_PKTIN_WIDTH-2:0] + (s_axis_tlast && s_axis_tvalid && s_axis_tready) 
                                                     > {(`REG_PKTIN_WIDTH-1){1'b1}} ? 1'b1 : pktin_reg[`REG_PKTIN_WIDTH-1];

        pktout_reg [`REG_PKTOUT_WIDTH-2:0]<= #1  clear_counters | pktout_reg_clear ? 'h0  : pktout_reg [`REG_PKTOUT_WIDTH-2:0] + (m_axis_tvalid && m_axis_tlast && m_axis_tready) ;
                pktout_reg [`REG_PKTOUT_WIDTH-1]<= #1  clear_counters | pktout_reg_clear ? 'h0  : pktout_reg [`REG_PKTOUT_WIDTH-2:0] + (m_axis_tvalid && m_axis_tlast && m_axis_tready)  > {(`REG_PKTOUT_WIDTH-1){1'b1}} ?
                                                                1'b1 : pktout_reg [`REG_PKTOUT_WIDTH-1];
        luthit_reg[`REG_LUTHIT_WIDTH -2: 0] <= #1  clear_counters | luthit_reg_clear ? 'h0  : luthit_reg[`REG_LUTHIT_WIDTH-2:0] + (lut_hit & lookup_done) ;
                luthit_reg[`REG_LUTHIT_WIDTH-1] <= #1 clear_counters | luthit_reg_clear ? 1'h0 : luthit_reg_clear ? 'h0  : luthit_reg[`REG_LUTHIT_WIDTH-2:0] + (lut_hit & lookup_done)
                                                     > {(`REG_LUTHIT_WIDTH-1){1'b1}} ? 1'b1 : pktin_reg[`REG_LUTHIT_WIDTH-1];

        lutmiss_reg [`REG_LUTMISS_WIDTH-2:0]<= #1  clear_counters | lutmiss_reg_clear ? 'h0  : lutmiss_reg [`REG_LUTMISS_WIDTH-2:0] + (lut_miss & lookup_done) ;
                lutmiss_reg [`REG_LUTMISS_WIDTH-1]<= #1  clear_counters | lutmiss_reg_clear ? 'h0  : lutmiss_reg [`REG_LUTMISS_WIDTH-2:0] + (lut_miss & lookup_done)  > {(`REG_LUTMISS_WIDTH-1){1'b1}} ?
                                                                1'b1 : lutmiss_reg [`REG_LUTMISS_WIDTH-1];

        ip2cpu_debug_reg <= #1    `REG_DEBUG_DEFAULT+cpu2ip_debug_reg;
    end

endmodule // output_port_lookup

