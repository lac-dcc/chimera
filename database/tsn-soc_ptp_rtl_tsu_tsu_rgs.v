// This program was cloned from: https://github.com/lvzhengde/tsn-soc
// License: BSD 3-Clause "New" or "Revised" License

/*+
 * Copyright (c) 2022-2023 Zhengde
 * 
 * All rights reserved.
 * 
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 * 
 * 1 Redistributions of source code must retain the above copyright notice, this
 *   list of conditions and the following disclaimer.
 * 
 * 2 Redistributions in binary form must reproduce the above copyright notice,
 *   this list of conditions and the following disclaimer in the documentation
 *   and/or other materials provided with the distribution.
 * 
 * 3 Neither the name of the copyright holder nor the names of its
 *   contributors may be used to endorse or promote products derived from
 *   this software without specific prior written permission.
 * 
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
 * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
 * CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
 * OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
-*/

/*+
 * tsu register interface for software
-*/

`include "ptpv2_defines.v"

module tsu_rgs (
    //32 bits on chip bus access interface
    input               bus2ip_clk    ,
    input               bus2ip_rst_n  ,
    input  [31:0]       bus2ip_addr_i ,
    input  [31:0]       bus2ip_data_i ,
    input               bus2ip_rd_ce_i ,    //active high
    input               bus2ip_wr_ce_i ,    //active high
    output reg [31:0]   ip2bus_data_o  ,  

    //timestamp i/f, sync to rtc_clk
    input   [79:0]      tx_timestamp_i,            
    input   [15:0]      tx_timestamp_frac_ns_i,   
    input   [79:0]      tx_sourcePortIdentity_i,  
    input   [15:0]      tx_flagField_i,
    input   [15:0]      tx_seqId_i,                 
    input   [3:0]       tx_versionPTP_i,
    input   [3:0]       tx_minorVersionPTP_i,
    input   [3:0]       tx_messageType_i,  
    input   [3:0]       tx_majorSdoId_i,

    input   [79:0]      rx_timestamp_i,            
    input   [15:0]      rx_timestamp_frac_ns_i,   
    input   [79:0]      rx_sourcePortIdentity_i,  
    input   [15:0]      rx_flagField_i,
    input   [15:0]      rx_seqId_i,                 
    input   [3:0]       rx_versionPTP_i,
    input   [3:0]       rx_minorVersionPTP_i,
    input   [3:0]       rx_messageType_i,  
    input   [3:0]       rx_majorSdoId_i,

    //configuration register i/f
    output reg [31:0]   tsu_cfg_o,
    output reg [31:0]   link_delay_o,
    output reg [31:0]   ingress_asymmetry_o,
    output reg [31:0]   egress_asymmetry_o,
    output reg [15:0]   tx_latency_o,
    output reg [47:0]   loc_mac_addr_o
);
    parameter BLK_ADDR = `TSU_BLK_ADDR;

    //++
    //bus read operation
    //--
    reg [31:0] ip2bus_data;

    always @(*) begin
        ip2bus_data = 32'h0;

        if(bus2ip_rd_ce_i == 1'b1 && bus2ip_addr_i[31:8] == BLK_ADDR) begin   //base address to tsu
            case(bus2ip_addr_i[7:0])    //deal with offset address
                `TSU_CFG_ADDR:      ip2bus_data = tsu_cfg_o;
                `LINK_DELAY_ADDR:   ip2bus_data = link_delay_o;
                `IN_ASYM_ADDR:      ip2bus_data = ingress_asymmetry_o;
                `EG_ASYM_ADDR:      ip2bus_data = egress_asymmetry_o;
                `LOC_MAC_ADDR0:     ip2bus_data = {tx_latency_o[15:0], loc_mac_addr_o[47:32]};
                `LOC_MAC_ADDR1:     ip2bus_data = loc_mac_addr_o[31:0];

                `TX_TS_ADDR0:       ip2bus_data = tx_timestamp_i[79:48];
                `TX_TS_ADDR1:       ip2bus_data = tx_timestamp_i[47:16];
                `TX_TS_ADDR2:       ip2bus_data = {tx_timestamp_i[15:0], tx_timestamp_frac_ns_i[15:0]};    
                `TX_SPF_ADDR0:      ip2bus_data = tx_sourcePortIdentity_i[79:48];
                `TX_SPF_ADDR1:      ip2bus_data = tx_sourcePortIdentity_i[47:16];
                `TX_SPF_ADDR2:      ip2bus_data = {tx_sourcePortIdentity_i[15:0], tx_flagField_i[15:0]};
                `TX_TVID_ADDR:      ip2bus_data = {tx_majorSdoId_i[3:0], tx_messageType_i[3:0], tx_minorVersionPTP_i[3:0],
                                               tx_versionPTP_i[3:0], tx_seqId_i[15:0]};

                `RX_TS_ADDR0:       ip2bus_data = rx_timestamp_i[79:48];
                `RX_TS_ADDR1:       ip2bus_data = rx_timestamp_i[47:16];
                `RX_TS_ADDR2:       ip2bus_data = {rx_timestamp_i[15:0], rx_timestamp_frac_ns_i[15:0]};    
                `RX_SPF_ADDR0:      ip2bus_data = rx_sourcePortIdentity_i[79:48];
                `RX_SPF_ADDR1:      ip2bus_data = rx_sourcePortIdentity_i[47:16];
                `RX_SPF_ADDR2:      ip2bus_data = {rx_sourcePortIdentity_i[15:0], rx_flagField_i[15:0]};
                `RX_TVID_ADDR:      ip2bus_data = {rx_majorSdoId_i[3:0], rx_messageType_i[3:0], rx_minorVersionPTP_i[3:0],
                                               rx_versionPTP_i[3:0], rx_seqId_i[15:0]};

                default:            ip2bus_data = 32'h0;
            endcase                        
        end   
    end

    //registered output 
    always @(posedge bus2ip_clk) ip2bus_data_o <= ip2bus_data;
    
    //++
    //bus write operation
    //--
    always @(posedge bus2ip_clk or negedge bus2ip_rst_n) begin
        if(!bus2ip_rst_n) begin
            tsu_cfg_o           <= 32'h0;
            link_delay_o        <= 32'h0;
            ingress_asymmetry_o <= 32'h0;
            egress_asymmetry_o  <= 32'h0;
            tx_latency_o        <= 16'h0;
            loc_mac_addr_o      <= 48'h0;
        end
        else if(bus2ip_wr_ce_i == 1'b1 && bus2ip_addr_i[31:8] == BLK_ADDR) begin   //deal with base address
            case(bus2ip_addr_i[7:0]) //deal with offset address
                `TSU_CFG_ADDR:    tsu_cfg_o             <= bus2ip_data_i[31:0];
                `LINK_DELAY_ADDR: link_delay_o          <= bus2ip_data_i[31:0];
                `IN_ASYM_ADDR:    ingress_asymmetry_o   <= bus2ip_data_i[31:0];
                `EG_ASYM_ADDR:    egress_asymmetry_o    <= bus2ip_data_i[31:0];
                `LOC_MAC_ADDR0:   {tx_latency_o[15:0], loc_mac_addr_o[47:32]} <= bus2ip_data_i[31:0];
                `LOC_MAC_ADDR1:   loc_mac_addr_o[31:0]  <= bus2ip_data_i[31:0];
                default: ;
            endcase  
        end
    end

endmodule

