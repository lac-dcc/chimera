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
 * rx timestamp engine
 * including rx_parse, rx_emb_ts, rx_rcst
-*/

`include "ptpv2_defines.v"

module rx_tse(
    //gmii interface
    input               rx_clk,
    input               rx_rst_n,
    input               rx_clk_en_i,             //for adapting to mii

    input               rx_dv_i, 
    input               rx_er_i, 
    input  [7:0]        rxd_i  , 

    output              rx_dv_o, 
    output              rx_er_o, 
    output [7:0]        rxd_o  , 

    //timestamp input
    input  [79:0]       sfd_timestamp_i,         //48 bits seconds + 32 bits nanoseconds
    input  [15:0]       sfd_timestamp_frac_ns_i, //16 bit fractional nanoseconds 

    //configuration register i/f
    input  [31:0]       tsu_cfg_i,
    input  [31:0]       link_delay_i,
    input  [31:0]       ingress_asymmetry_i,
    
    //timestamp i/f, sync to rtc_clk
    output              rxts_trig_o,
    output              rxts_valid_o,
    
    output [79:0]       rx_sourcePortIdentity_o,  
    output [15:0]       rx_flagField_o,
    output [15:0]       rx_seqId_o,                 
    output [3:0]        rx_versionPTP_o,
    output [3:0]        rx_minorVersionPTP_o,
    output [3:0]        rx_messageType_o,  
    output [3:0]        rx_majorSdoId_o,

    //ptpv2 rx interrupt signal 
    output              int_rx_ptp_o
);
    wire                rx_dv_to_emb; 
    wire                rx_er_to_emb; 
    wire [7:0]          rxd_to_emb  ; 

    wire  [10:0]        ptp_addr_base;
    wire  [3:0]         ptp_messageType;          
    wire  [63:0]        ptp_correctionField;
    wire                is_ptp_message;  

    rx_parse rx_parse(
        .rx_clk                  (rx_clk     ),
        .rx_rst_n                (rx_rst_n   ),
        .rx_clk_en_i             (rx_clk_en_i), 
    
        .rx_dv_i                 (rx_dv_i), 
        .rx_er_i                 (rx_er_i), 
        .rxd_i                   (rxd_i  ), 
    
        //signals to rx_emb_ts
        .rx_dv_o                 (rx_dv_to_emb), 
        .rx_er_o                 (rx_er_to_emb), 
        .rxd_o                   (rxd_to_emb  ), 
                                                       
        .ptp_addr_base_o         (ptp_addr_base      ), 
        .ptp_messageType_o       (ptp_messageType    ),           
        .ptp_correctionField_o   (ptp_correctionField), 
        .is_ptp_message_o        (is_ptp_message     ),  
    
        //configuration register i/f
        .tsu_cfg_i               (tsu_cfg_i),
        
        //timestamp i/f, sync to rtc_clk
        .rxts_trig_o             (rxts_trig_o            ),
        .rxts_valid_o            (rxts_valid_o           ),
                                 
        .rx_sourcePortIdentity_o (rx_sourcePortIdentity_o),  
        .rx_flagField_o          (rx_flagField_o         ),
        .rx_seqId_o              (rx_seqId_o             ),                 
        .rx_versionPTP_o         (rx_versionPTP_o        ),
        .rx_minorVersionPTP_o    (rx_minorVersionPTP_o   ),
        .rx_messageType_o        (rx_messageType_o       ),  
        .rx_majorSdoId_o         (rx_majorSdoId_o        ),
    
        //ptpv2 rx interrupt signal 
        .int_rx_ptp_o            (int_rx_ptp_o)
    );

    wire              rx_dv_to_rcst; 
    wire              rx_er_to_rcst; 
    wire [7:0]        rxd_to_rcst  ; 

    wire              efd_p4;
    wire              embed_enable;
    wire [10:0]       eth_count;

    rx_emb_ts rx_emb_ts(
        .rx_clk                  (rx_clk     ),
        .rx_rst_n                (rx_rst_n   ),
        .rx_clk_en_i             (rx_clk_en_i),            
    
        .rx_dv_i                 (rx_dv_to_emb), 
        .rx_er_i                 (rx_er_to_emb), 
        .rxd_i                   (rxd_to_emb  ), 

        .rx_dv_o                 (rx_dv_to_rcst), 
        .rx_er_o                 (rx_er_to_rcst), 
        .rxd_o                   (rxd_to_rcst  ), 
    
        //timestamp input
        .sfd_timestamp_i         (sfd_timestamp_i), 
    
        //configuration register i/f
        .tsu_cfg_i               (tsu_cfg_i          ),
        .link_delay_i            (link_delay_i       ),
        .ingress_asymmetry_i     (ingress_asymmetry_i),
    
        //ptpv2 message related information
        .ptp_addr_base_i         (ptp_addr_base      ),
        .ptp_messageType_i       (ptp_messageType    ),          
        .ptp_correctionField_i   (ptp_correctionField),
        .is_ptp_message_i        (is_ptp_message     ),  
    
        .efd_p4_o                (efd_p4      ),
        .embed_enable_o          (embed_enable),
        .eth_count_o             (eth_count)
    );

    rx_rcst rx_rcst(
        .rx_clk                  (rx_clk     ),
        .rx_rst_n                (rx_rst_n   ),
        .rx_clk_en_i             (rx_clk_en_i),            
    
        //gmii interface
        .rx_dv_i                 (rx_dv_to_rcst), 
        .rx_er_i                 (rx_er_to_rcst), 
        .rxd_i                   (rxd_to_rcst  ), 

        .rx_dv_o                 (rx_dv_o), 
        .rx_er_o                 (rx_er_o), 
        .rxd_o                   (rxd_o  ),

        //control signals for FCS re-calculation
        .efd_p4_i                (efd_p4    ),
        .embed_enable_i          (embed_enable),
        .eth_count_i             (eth_count)
    );

endmodule
