//
// Copyright (c) 2015 University of Cambridge
// Copyright (C) 2021 Yuta Tokusashi
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

`timescale 1ns/1ns
`include "nf_mac_attachment_cpu_regs_defines.v"
module nf_mac_attachment_cpu_regs #
(
parameter C_BASE_ADDRESS        = 32'h00000000,
parameter C_S_AXI_DATA_WIDTH    = 32,
parameter C_S_AXI_ADDR_WIDTH    = 32
)
(
    // General ports
    input       mac_clk,
    input       mac_resetn,
    input       clk,
    input       resetn,
    // Global Registers
    input       cpu_resetn_soft,
    output reg  resetn_soft,
    output reg  resetn_sync,
    output reg  mac_resetn_sync,

   // Register ports
    input      [`REG_ID_BITS]          id_reg,
    input      [`REG_VERSION_BITS]     version_reg,
    output reg [`REG_RESET_BITS]       reset_reg,
    output reg [`REG_RESET_BITS]       mac_reset_reg,
    input      [`REG_FLIP_BITS]        ip2cpu_flip_reg,
    output reg [`REG_FLIP_BITS]        cpu2ip_flip_reg,
    input      [`REG_DEBUG_BITS]       ip2cpu_debug_reg,
    output reg [`REG_DEBUG_BITS]       cpu2ip_debug_reg,
    input      [`REG_RXMACPKT_BITS]    rx_mac_pktin_reg,
    output reg                         rx_mac_pktin_reg_clear,
    input      [`REG_RXQPKT_BITS]      rx_queue_pktin_reg,
    output reg                         rx_queue_pktin_reg_clear,
    input      [`REG_RXCONVPKT_BITS]   rx_conv_pktin_reg,
    output reg                         rx_conv_pktin_reg_clear,
    input      [`REG_TXMACPKT_BITS]    tx_mac_pktin_reg,
    output reg                         tx_mac_pktin_reg_clear,
    input      [`REG_TXQPKT_BITS]      tx_queue_pktin_reg,
    output reg                         tx_queue_pktin_reg_clear,
    input      [`REG_RXCONVPKT_BITS]   tx_conv_pktin_reg,
    output reg                         tx_conv_pktin_reg_clear,

    // AXI Lite ports
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

    // AXI4LITE signals
    reg [C_S_AXI_ADDR_WIDTH-1 : 0]      axi_awaddr;
    reg                                 axi_awready;
    reg                                 axi_wready;
    reg [1 : 0]                         axi_bresp;
    reg                                 axi_bvalid;
    reg [C_S_AXI_ADDR_WIDTH-1 : 0]      axi_araddr;
    reg                                 axi_arready;
    reg [C_S_AXI_DATA_WIDTH-1 : 0]      axi_rdata;
    reg [1 : 0]                         axi_rresp;
    reg                                 axi_rvalid;

    reg                                 resetn_sync_d;
    reg                                 mac_resetn_sync_d;
    wire                                reg_rden;
    wire                                reg_wren;
    reg [C_S_AXI_DATA_WIDTH-1:0]        reg_data_out;
    integer                             byte_index;
    reg                                 rx_mac_pktin_reg_clear_d;
    reg                                 rx_queue_pktin_reg_clear_d;
    reg                                 rx_conv_pktin_reg_clear_d;
    reg                                 tx_mac_pktin_reg_clear_d;
    reg                                 tx_queue_pktin_reg_clear_d;
    reg                                 tx_conv_pktin_reg_clear_d;

    // I/O Connections assignments
    assign S_AXI_AWREADY    = axi_awready;
    assign S_AXI_WREADY     = axi_wready;
    assign S_AXI_BRESP      = axi_bresp;
    assign S_AXI_BVALID     = axi_bvalid;
    assign S_AXI_ARREADY    = axi_arready;
    assign S_AXI_RDATA      = axi_rdata;
    assign S_AXI_RRESP      = axi_rresp;
    assign S_AXI_RVALID     = axi_rvalid;


    //Sample reset (not mandatory, but good practice)
    always @ (posedge clk) begin
        if (~resetn) begin
            resetn_sync_d  <=  1'b0;
            resetn_sync    <=  1'b0;
        end
        else begin
            resetn_sync_d  <=  resetn;
            resetn_sync    <=  resetn_sync_d;
        end
    end

    always @ (posedge mac_clk) begin
        if (~mac_resetn) begin
            mac_resetn_sync_d  <=  1'b0;
            mac_resetn_sync    <=  1'b0;
        end
        else begin
            mac_resetn_sync_d  <=  resetn;
            mac_resetn_sync    <=  resetn_sync_d;
        end
    end

    //global registers, sampling
    always @(posedge clk) resetn_soft <= #1 cpu_resetn_soft;

    // Implement axi_awready generation

    always @( posedge S_AXI_ACLK )
    begin
      if ( S_AXI_ARESETN == 1'b0 )
        begin
          axi_awready <= 1'b0;
        end
      else
        begin
          if (~axi_awready && S_AXI_AWVALID && S_AXI_WVALID)
            begin
              // slave is ready to accept write address when
              // there is a valid write address and write data
              // on the write address and data bus. This design
              // expects no outstanding transactions.
              axi_awready <= 1'b1;
            end
          else
            begin
              axi_awready <= 1'b0;
            end
        end
    end

    // Implement axi_awaddr latching

    always @( posedge S_AXI_ACLK )
    begin
      if ( S_AXI_ARESETN == 1'b0 )
        begin
          axi_awaddr <= 0;
        end
      else
        begin
          if (~axi_awready && S_AXI_AWVALID && S_AXI_WVALID)
            begin
              // Write Address latching
              axi_awaddr <= S_AXI_AWADDR ^ C_BASE_ADDRESS;
            end
        end
    end

    // Implement axi_wready generation

    always @( posedge S_AXI_ACLK )
    begin
      if ( S_AXI_ARESETN == 1'b0 )
        begin
          axi_wready <= 1'b0;
        end
      else
        begin
          if (~axi_wready && S_AXI_WVALID && S_AXI_AWVALID)
            begin
              // slave is ready to accept write data when
              // there is a valid write address and write data
              // on the write address and data bus. This design
              // expects no outstanding transactions.
              axi_wready <= 1'b1;
            end
          else
            begin
              axi_wready <= 1'b0;
            end
        end
    end

    // Implement write response logic generation

    always @( posedge S_AXI_ACLK )
    begin
      if ( S_AXI_ARESETN == 1'b0 )
        begin
          axi_bvalid  <= 0;
          axi_bresp   <= 2'b0;
        end
      else
        begin
          if (axi_awready && S_AXI_AWVALID && ~axi_bvalid && axi_wready && S_AXI_WVALID)
            begin
              // indicates a valid write response is available
              axi_bvalid <= 1'b1;
              axi_bresp  <= 2'b0; // OKAY response
            end                   // work error responses in future
          else
            begin
              if (S_AXI_BREADY && axi_bvalid)
                //check if bready is asserted while bvalid is high)
                //(there is a possibility that bready is always asserted high)
                begin
                  axi_bvalid <= 1'b0;
                end
            end
        end
    end

    // Implement axi_arready generation

    always @( posedge S_AXI_ACLK )
    begin
      if ( S_AXI_ARESETN == 1'b0 )
        begin
          axi_arready <= 1'b0;
          axi_araddr  <= 32'b0;
        end
      else
        begin
          if (~axi_arready && S_AXI_ARVALID)
            begin
              // indicates that the slave has acceped the valid read address
              // Read address latching
              axi_arready <= 1'b1;
              axi_araddr  <= S_AXI_ARADDR ^ C_BASE_ADDRESS;
            end
          else
            begin
              axi_arready <= 1'b0;
            end
        end
    end


    // Implement axi_rvalid generation

    always @( posedge S_AXI_ACLK )
    begin
      if ( S_AXI_ARESETN == 1'b0 )
        begin
          axi_rvalid <= 0;
          axi_rresp  <= 0;
        end
      else
        begin
          if (axi_arready && S_AXI_ARVALID && ~axi_rvalid)
            begin
              // Valid read data is available at the read data bus
              axi_rvalid <= 1'b1;
              axi_rresp  <= 2'b0; // OKAY response
            end
          else if (axi_rvalid && S_AXI_RREADY)
            begin
              // Read data is accepted by the master
              axi_rvalid <= 1'b0;
            end
        end
    end


    // Implement memory mapped register select and write logic generation

    assign reg_wren = axi_wready && S_AXI_WVALID && axi_awready && S_AXI_AWVALID;

//////////////////////////////////////////////////////////////
// write registers
//////////////////////////////////////////////////////////////


//Write only register, clear on write (i.e. event)
    always @(posedge clk) begin
        if (!resetn_sync) begin
            reset_reg <= #1 `REG_RESET_DEFAULT;
        end
        else begin
            if (reg_wren) begin
                case (axi_awaddr)
                    //Reset Register
                        `REG_RESET_ADDR : begin
                                for ( byte_index = 0; byte_index <= (`REG_RESET_WIDTH/8-1); byte_index = byte_index +1)
                                    if (S_AXI_WSTRB[byte_index] == 1) begin
                                        reset_reg[byte_index*8 +: 8] <=  S_AXI_WDATA[byte_index*8 +: 8];
                                    end
                        end
                endcase
            end
            else begin
                reset_reg <= #1 `REG_RESET_DEFAULT;
            end
        end
    end
    always @(posedge mac_clk) begin
        if (!mac_resetn_sync) begin
            mac_reset_reg <= #1 `REG_RESET_DEFAULT;
        end
        else begin
            if (reg_wren) begin
                case (axi_awaddr)
                    //Reset Register
                        `REG_RESET_ADDR : begin
                                for ( byte_index = 0; byte_index <= (`REG_RESET_WIDTH/8-1); byte_index = byte_index +1)
                                    if (S_AXI_WSTRB[byte_index] == 1) begin
                                        mac_reset_reg[byte_index*8 +: 8] <=  S_AXI_WDATA[byte_index*8 +: 8];
                                    end
                        end
                endcase
            end
            else begin
                mac_reset_reg <= #1 `REG_RESET_DEFAULT;
            end
        end
    end

//R/W register, not cleared
    always @(posedge clk) begin
        if (!resetn_sync) begin

            cpu2ip_flip_reg <= #1 `REG_FLIP_DEFAULT;
            cpu2ip_debug_reg <= #1 `REG_DEBUG_DEFAULT;
        end
        else begin
           if (reg_wren) //write event
            case (axi_awaddr)
            //Flip Register
                `REG_FLIP_ADDR : begin
                    for ( byte_index = 0; byte_index <= (`REG_FLIP_WIDTH/8-1); byte_index = byte_index +1)
                        if (S_AXI_WSTRB[byte_index] == 1) begin
                            cpu2ip_flip_reg[byte_index*8 +: 8] <=  S_AXI_WDATA[byte_index*8 +: 8]; //dynamic register;
                        end
                end
            //Debug Register
                `REG_DEBUG_ADDR : begin
                    for ( byte_index = 0; byte_index <= (`REG_DEBUG_WIDTH/8-1); byte_index = byte_index +1)
                        if (S_AXI_WSTRB[byte_index] == 1) begin
                            cpu2ip_debug_reg[byte_index*8 +: 8] <=  S_AXI_WDATA[byte_index*8 +: 8]; //dynamic register;
                        end
                end
                default: begin
                end

            endcase
        end
    end



/////////////////////////
//// end of write
/////////////////////////

    // Implement memory mapped register select and read logic generation
    // Slave register read enable is asserted when valid address is available
    // and the slave is ready to accept the read address.

    // reg_rden control logic
    // temperary no extra logic here
    assign reg_rden = axi_arready & S_AXI_ARVALID & ~axi_rvalid;

    always @(*)
    begin

        case ( axi_araddr /*S_AXI_ARADDR ^ C_BASE_ADDRESS*/)
            //Id Register
            `REG_ID_ADDR : begin
                reg_data_out [`REG_ID_BITS] =  id_reg;
            end
            //Version Register
            `REG_VERSION_ADDR : begin
                reg_data_out [`REG_VERSION_BITS] =  version_reg;
            end
            //Flip Register
            `REG_FLIP_ADDR : begin
                reg_data_out [`REG_FLIP_BITS] =  ip2cpu_flip_reg;
            end
            //Debug Register
            `REG_DEBUG_ADDR : begin
                reg_data_out [`REG_DEBUG_BITS] =  ip2cpu_debug_reg;
            end
            // RX MAC PKT Register
            `REG_RXMACPKT_ADDR : begin
                reg_data_out [`REG_RXMACPKT_BITS] =  rx_mac_pktin_reg;
            end
            // RX QUEUE PKT Register
            `REG_RXQPKT_ADDR : begin
                reg_data_out [`REG_RXQPKT_BITS] =  rx_queue_pktin_reg;
            end
            // RX CONV PKT Register
            `REG_RXCONVPKT_ADDR : begin
                reg_data_out [`REG_RXCONVPKT_BITS] =  rx_conv_pktin_reg;
            end
            // TX MAC PKT Register
            `REG_TXMACPKT_ADDR : begin
                reg_data_out [`REG_TXMACPKT_BITS] =  tx_mac_pktin_reg;
            end
            // TX QUEUE PKT Register
            `REG_TXQPKT_ADDR : begin
                reg_data_out [`REG_TXQPKT_BITS] =  tx_queue_pktin_reg;
            end
            // TX CONV PKT Register
            `REG_TXCONVPKT_ADDR : begin
                reg_data_out [`REG_TXCONVPKT_BITS] =  tx_conv_pktin_reg;
            end
            //Default return value
            default: begin
                reg_data_out [31:0] =  32'hDEADBEEF;
            end

        endcase


    end//end of assigning data to IP2Bus_Data bus

    //Read only registers, not cleared
    //Nothing to do here....

//Read only registers, cleared on read (e.g. counters)
    always @(posedge clk)
    if (!resetn_sync) begin
        rx_queue_pktin_reg_clear <= #1 1'b0;
        rx_queue_pktin_reg_clear_d <= #1 1'b0;
        tx_queue_pktin_reg_clear <= #1 1'b0;
        tx_queue_pktin_reg_clear_d <= #1 1'b0;
        rx_conv_pktin_reg_clear <= #1 1'b0;
        rx_conv_pktin_reg_clear_d <= #1 1'b0;
        tx_conv_pktin_reg_clear <= #1 1'b0;
        tx_conv_pktin_reg_clear_d <= #1 1'b0;
    end
    else begin
        rx_queue_pktin_reg_clear <= #1 rx_queue_pktin_reg_clear_d;
        rx_queue_pktin_reg_clear_d <= #1 (reg_rden && (axi_araddr==`REG_RXQPKT_ADDR)) ? 1'b1 : 1'b0;
        tx_queue_pktin_reg_clear <= #1 tx_queue_pktin_reg_clear_d;
        tx_queue_pktin_reg_clear_d <= #1 (reg_rden && (axi_araddr==`REG_TXQPKT_ADDR)) ? 1'b1 : 1'b0;
        rx_conv_pktin_reg_clear <= #1 rx_conv_pktin_reg_clear_d;
        rx_conv_pktin_reg_clear_d <= #1 (reg_rden && (axi_araddr==`REG_RXCONVPKT_ADDR)) ? 1'b1 : 1'b0;
        tx_conv_pktin_reg_clear <= #1 tx_conv_pktin_reg_clear_d;
        tx_conv_pktin_reg_clear_d <= #1 (reg_rden && (axi_araddr==`REG_TXCONVPKT_ADDR)) ? 1'b1 : 1'b0;
    end

    always @(posedge mac_clk)
    if (!mac_resetn_sync) begin
        rx_mac_pktin_reg_clear <= #1 1'b0;
        rx_mac_pktin_reg_clear_d <= #1 1'b0;
        tx_mac_pktin_reg_clear <= #1 1'b0;
        tx_mac_pktin_reg_clear_d <= #1 1'b0;
    end
    else begin
        rx_mac_pktin_reg_clear <= #1 rx_mac_pktin_reg_clear_d;
        rx_mac_pktin_reg_clear_d <= #1 (reg_rden && (axi_araddr==`REG_RXMACPKT_ADDR)) ? 1'b1 : 1'b0;
        tx_mac_pktin_reg_clear <= #1 tx_mac_pktin_reg_clear_d;
        tx_mac_pktin_reg_clear_d <= #1 (reg_rden && (axi_araddr==`REG_TXMACPKT_ADDR)) ? 1'b1 : 1'b0;
    end

// Output register or memory read data
    always @( posedge S_AXI_ACLK )
    begin
      if ( S_AXI_ARESETN == 1'b0 )
        begin
          axi_rdata  <= 0;
        end
      else
        begin
          // When there is a valid read address (S_AXI_ARVALID) with
          // acceptance of read address by the slave (axi_arready),
          // output the read dada
          if (reg_rden)
            begin
              axi_rdata <= reg_data_out/*ip2bus_data*/;     // register read data /* some new changes here */
            end
        end
    end
endmodule
