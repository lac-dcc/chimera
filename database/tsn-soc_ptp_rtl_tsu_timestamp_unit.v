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
 * ptpv2 timestamp unit 
-*/

`include "ptpv2_defines.v"

module timestamp_unit (
    input               rtc_clk,                //fast clock used to lock signals
    input               rtc_rst_n,              //async. reset, active low

    input               dis_ptpv2_i,            //disable ptpv2

    //rx interface
    input               rx_clk,
    input               rx_rst_n,
    input               rx_clk_en_i,            //for adapting to mii

    input               rx_dv_i, 
    input               rx_er_i, 
    input  [7:0]        rxd_i  , 

    output              rx_dv_o, 
    output              rx_er_o, 
    output [7:0]        rxd_o  , 

    //tx interface
    input               tx_clk,
    input               tx_rst_n,
    input               tx_clk_en_i,           //for adapting to mii

    input               tx_en_i, 
    input               tx_er_i,
    input  [7:0]        txd_i  ,  
    
    output              tx_en_o,
    output              tx_er_o,
    output [7:0]        txd_o  ,

    //time input
    input  [79:0]       rtc_std_i,             //48 bits seconds + 32 bits nanoseconds
    input  [15:0]       rtc_fns_i,             //16 bit fractional nanoseconds of rtc

    //32 bits on chip bus access interface
    input               bus2ip_clk   ,
    input               bus2ip_rst_n  ,
    input  [31:0]       bus2ip_addr_i ,
    input  [31:0]       bus2ip_data_i ,
    input               bus2ip_rd_ce_i ,         //active high
    input               bus2ip_wr_ce_i ,         //active high
    output [31:0]       ip2bus_data_o ,  

    //interrupt signals generated from ptpv2 core
    output              int_rx_ptp_o,
    output              int_tx_ptp_o
);
    parameter BLK_ADDR = `TSU_BLK_ADDR;

    //connection wires
    wire [79:0]      tx_timestamp;            
    wire [15:0]      tx_timestamp_frac_ns;   
    wire [79:0]      tx_sourcePortIdentity;  
    wire [15:0]      tx_flagField;
    wire [15:0]      tx_seqId;                 
    wire [3:0]       tx_versionPTP;
    wire [3:0]       tx_minorVersionPTP;
    wire [3:0]       tx_messageType;  
    wire [3:0]       tx_majorSdoId;
    
    wire [79:0]      rx_timestamp;            
    wire [15:0]      rx_timestamp_frac_ns;   
    wire [79:0]      rx_sourcePortIdentity;  
    wire [15:0]      rx_flagField;
    wire [15:0]      rx_seqId;                 
    wire [3:0]       rx_versionPTP;
    wire [3:0]       rx_minorVersionPTP;
    wire [3:0]       rx_messageType;  
    wire [3:0]       rx_majorSdoId;

    wire [31:0]      tsu_cfg;
    wire [31:0]      link_delay;
    wire [31:0]      ingress_asymmetry;
    wire [31:0]      egress_asymmetry;
    wire [15:0]      tx_latency;
    wire [47:0]      loc_mac_addr;

    //instantiate register i/f
    tsu_rgs tsu_rgs(
        //32 bits on chip bus access interface
        .bus2ip_clk              (bus2ip_clk    ),
        .bus2ip_rst_n            (bus2ip_rst_n  ),
        .bus2ip_addr_i           (bus2ip_addr_i ),
        .bus2ip_data_i           (bus2ip_data_i ),
        .bus2ip_rd_ce_i          (bus2ip_rd_ce_i), 
        .bus2ip_wr_ce_i          (bus2ip_wr_ce_i), 
        .ip2bus_data_o           (ip2bus_data_o ),  
    
        //timestamp i/f, sync to rtc_clk
        .tx_timestamp_i          (tx_timestamp         ),            
        .tx_timestamp_frac_ns_i  (tx_timestamp_frac_ns ),   
        .tx_sourcePortIdentity_i (tx_sourcePortIdentity),  
        .tx_flagField_i          (tx_flagField         ),
        .tx_seqId_i              (tx_seqId             ),                 
        .tx_versionPTP_i         (tx_versionPTP        ),
        .tx_minorVersionPTP_i    (tx_minorVersionPTP   ),
        .tx_messageType_i        (tx_messageType       ),  
        .tx_majorSdoId_i         (tx_majorSdoId        ),
                                                         
        .rx_timestamp_i          (rx_timestamp         ),            
        .rx_timestamp_frac_ns_i  (rx_timestamp_frac_ns ),   
        .rx_sourcePortIdentity_i (rx_sourcePortIdentity),  
        .rx_flagField_i          (rx_flagField         ),
        .rx_seqId_i              (rx_seqId             ),                 
        .rx_versionPTP_i         (rx_versionPTP        ),
        .rx_minorVersionPTP_i    (rx_minorVersionPTP   ),
        .rx_messageType_i        (rx_messageType       ),  
        .rx_majorSdoId_i         (rx_majorSdoId        ),
    
        //configuration register i/f
        .tsu_cfg_o               (tsu_cfg          ),
        .link_delay_o            (link_delay       ),
        .ingress_asymmetry_o     (ingress_asymmetry),
        .egress_asymmetry_o      (egress_asymmetry ),
        .tx_latency_o            (tx_latency       ),
        .loc_mac_addr_o          (loc_mac_addr     )
    );
    defparam tsu_rgs.BLK_ADDR = BLK_ADDR;
  
    //instantiate TSU kernel
    tsu_mx tsu_mx(
        .rtc_clk                 (rtc_clk    ),                  
        .rtc_rst_n               (rtc_rst_n  ),              

        .dis_ptpv2_i             (dis_ptpv2_i),            
    
        //rx interface
        .rx_clk                  (rx_clk     ),
        .rx_rst_n                (rx_rst_n   ),
        .rx_clk_en_i             (rx_clk_en_i),      

        .rx_dv_i                 (rx_dv_i), 
        .rx_er_i                 (rx_er_i), 
        .rxd_i                   (rxd_i  ), 
                                         
        .rx_dv_o                 (rx_dv_o), 
        .rx_er_o                 (rx_er_o), 
        .rxd_o                   (rxd_o  ), 

        //tx interface
        .tx_clk                  (tx_clk     ),
        .tx_rst_n                (tx_rst_n   ),
        .tx_clk_en_i             (tx_clk_en_i),    

        .tx_en_i                 (tx_en_i), 
        .tx_er_i                 (tx_er_i),
        .txd_i                   (txd_i  ),  
                                         
        .tx_en_o                 (tx_en_o),
        .tx_er_o                 (tx_er_o),
        .txd_o                   (txd_o  ),
    
        //time input
        .rtc_std_i               (rtc_std_i),             
        .rtc_fns_i               (rtc_fns_i),             
    
        //configuration register i/f
        .tsu_cfg_i               (tsu_cfg          ),
        .link_delay_i            (link_delay       ),
        .ingress_asymmetry_i     (ingress_asymmetry),
        .egress_asymmetry_i      (egress_asymmetry ),
        .tx_latency_i            (tx_latency       ),
        .loc_mac_addr_i          (loc_mac_addr     ),
        
        //timestamp i/f, sync to rtc_clk
        .rx_timestamp_o          (rx_timestamp         ),            
        .rx_timestamp_frac_ns_o  (rx_timestamp_frac_ns ),   
        .rx_sourcePortIdentity_o (rx_sourcePortIdentity),  
        .rx_flagField_o          (rx_flagField         ),
        .rx_seqId_o              (rx_seqId             ),                 
        .rx_versionPTP_o         (rx_versionPTP        ),
        .rx_minorVersionPTP_o    (rx_minorVersionPTP   ),
        .rx_messageType_o        (rx_messageType       ),  
        .rx_majorSdoId_o         (rx_majorSdoId        ),
    
        .tx_timestamp_o          (tx_timestamp         ),            
        .tx_timestamp_frac_ns_o  (tx_timestamp_frac_ns ),   
        .tx_sourcePortIdentity_o (tx_sourcePortIdentity),  
        .tx_flagField_o          (tx_flagField         ),
        .tx_seqId_o              (tx_seqId             ),                 
        .tx_versionPTP_o         (tx_versionPTP        ),
        .tx_minorVersionPTP_o    (tx_minorVersionPTP   ),
        .tx_messageType_o        (tx_messageType       ),  
        .tx_majorSdoId_o         (tx_majorSdoId        ),
    
        //interrupt signals generated from ptpv2 core
        .int_rx_ptp_o            (int_rx_ptp_o),
        .int_tx_ptp_o            (int_tx_ptp_o)
    );

endmodule

