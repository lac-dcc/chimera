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
 * tx timestamp engine
 * including tx_parse, tx_emb_ts, tx_rcst 
-*/

`include "ptpv2_defines.v"

module tx_tse(
    input               bypass_dp_i,

    //gmii interface
    input               tx_clk,
    input               tx_rst_n,
    input               tx_clk_en_i,            //for adapting to mii

    input               tx_en_i, 
    input               tx_er_i,
    input  [7:0]        txd_i  ,  
    
    output              tx_en_o,
    output              tx_er_o,
    output [7:0]        txd_o  ,

    //timestamp input
    input  [79:0]       sfd_timestamp_i,         //48 bits seconds + 32 bits nanoseconds
    input  [15:0]       sfd_timestamp_frac_ns_i, //16 bit fractional nanoseconds 

    //configuration register i/f
    input  [31:0]       tsu_cfg_i,
    input  [31:0]       egress_asymmetry_i,
    
    //timestamp i/f, sync to rtc_clk
    output              txts_trig_o,
    output              txts_valid_o,
    
    output [79:0]       tx_sourcePortIdentity_o,  
    output [15:0]       tx_flagField_o,
    output [15:0]       tx_seqId_o,                 
    output [3:0]        tx_versionPTP_o,
    output [3:0]        tx_minorVersionPTP_o,
    output [3:0]        tx_messageType_o,  
    output [3:0]        tx_majorSdoId_o,

    //ptpv2 tx interrupt signal 
    output              int_tx_ptp_o
);
    //decide the signal to capture timestamp
    wire                par_txts_trig;
    wire                emb_txts_trig;

    assign txts_trig_o = (bypass_dp_i == 1'b1) ? par_txts_trig : emb_txts_trig;

    //++
    //instantiate tx_parse module
    //--
    wire                tx_en_to_emb;
    wire                tx_er_to_emb;
    wire [7:0]          txd_to_emb  ;

    wire  [10:0]        ptp_addr_base;
    wire  [3:0]         ptp_messageType;          
    wire  [63:0]        ptp_correctionField;
    wire  [31:0]        ptp_messageTypeSpecific;
    wire                is_ptp_message;  
    wire  [15:0]        ptp_messageLength;
    wire  [15:0]        ptp_flagField; 
    
    wire                ipv6_flag;
    wire  [10:0]        ipv6_addr_base;
    wire                ipv4_flag;
    wire  [10:0]        ipv4_addr_base;

    tx_parse tx_parse(
        .tx_clk                    (tx_clk     ),
        .tx_rst_n                  (tx_rst_n   ),
        .tx_clk_en_i               (tx_clk_en_i),       
    
        .tx_en_i                   (tx_en_i), 
        .tx_er_i                   (tx_er_i),
        .txd_i                     (txd_i  ),  

        //signals to tx_emb_ts
        .tx_en_o                   (tx_en_to_emb),
        .tx_er_o                   (tx_er_to_emb),
        .txd_o                     (txd_to_emb  ),
    
        .ptp_addr_base_o           (ptp_addr_base          ),
        .ptp_messageType_o         (ptp_messageType        ),          
        .ptp_correctionField_o     (ptp_correctionField    ),
        .ptp_messageTypeSpecific_o (ptp_messageTypeSpecific),
        .is_ptp_message_o          (is_ptp_message         ),  
        .ptp_messageLength_o       (ptp_messageLength      ),
        .ptp_flagField_o           (ptp_flagField          ), 
                                                             
        .ipv6_flag_o               (ipv6_flag              ),
        .ipv6_addr_base_o          (ipv6_addr_base         ),
        .ipv4_flag_o               (ipv4_flag              ),
        .ipv4_addr_base_o          (ipv4_addr_base         ),
    
        //configuration register i/f
        .tsu_cfg_i                 (tsu_cfg_i),
        
        //timestamp i/f, sync to rtc_clk
        .txts_trig_o               (par_txts_trig ),
        .txts_valid_o              (txts_valid_o),
        
        .tx_sourcePortIdentity_o   (tx_sourcePortIdentity_o),  
        .tx_flagField_o            (tx_flagField_o         ),
        .tx_seqId_o                (tx_seqId_o             ),                 
        .tx_versionPTP_o           (tx_versionPTP_o        ),
        .tx_minorVersionPTP_o      (tx_minorVersionPTP_o   ),
        .tx_messageType_o          (tx_messageType_o       ),  
        .tx_majorSdoId_o           (tx_majorSdoId_o        ),
    
        //ptpv2 tx interrupt signal 
        .int_tx_ptp_o              (int_tx_ptp_o)
    );

    //++
    //instantiate tx_emb_ts module
    //--
    wire                tx_en_to_rcst;
    wire                tx_er_to_rcst;
    wire [7:0]          txd_to_rcst  ;

    wire [63:0]         emb_correctionField;     //ns * 2^16                               
    wire [31:0]         emb_ingress_time;        //32 bits ns  
    
    wire [10:0]         emb_ptp_addr_base;
    wire [3:0]          emb_ptp_messageType;          
    wire                emb_is_ptp_message;  
    wire [15:0]         emb_ptp_messageLength; 
    wire [15:0]         emb_ptp_flagField; 
    
    wire                emb_ipv6_flag;
    wire [10:0]         emb_ipv6_addr_base;
    wire                emb_ipv4_flag;
    wire [10:0]         emb_ipv4_addr_base;

    wire [10:0]         emb_eth_count;

    tx_emb_ts tx_emb_ts(
        .tx_clk                    (tx_clk     ),
        .tx_rst_n                  (tx_rst_n   ),
        .tx_clk_en_i               (tx_clk_en_i),            
    
        .tx_en_i                   (tx_en_to_emb), 
        .tx_er_i                   (tx_er_to_emb),
        .txd_i                     (txd_to_emb  ),  

        .tx_en_o                   (tx_en_to_rcst),
        .tx_er_o                   (tx_er_to_rcst),
        .txd_o                     (txd_to_rcst  ),
    
        //configuration register i/f
        .tsu_cfg_i                 (tsu_cfg_i         ),
        .egress_asymmetry_i        (egress_asymmetry_i),
    
        //ptpv2 message related information
        .ptp_addr_base_i           (ptp_addr_base      ),
        .ptp_messageType_i         (ptp_messageType        ),          
        .ptp_correctionField_i     (ptp_correctionField    ),
        .ptp_messageTypeSpecific_i (ptp_messageTypeSpecific),
        .is_ptp_message_i          (is_ptp_message         ),  
        .ptp_messageLength_i       (ptp_messageLength      ),
        .ptp_flagField_i           (ptp_flagField          ), 
    
        .ipv6_flag_i               (ipv6_flag     ),
        .ipv6_addr_base_i          (ipv6_addr_base),
        .ipv4_flag_i               (ipv4_flag     ),
        .ipv4_addr_base_i          (ipv4_addr_base),
    
        //output information of currently sending packet
        .correctionField_o         (emb_correctionField  ),
        .ingress_time_o            (emb_ingress_time     ), 
                                                       
        .ptp_addr_base_o           (emb_ptp_addr_base    ),
        .ptp_messageType_o         (emb_ptp_messageType  ),          
        .is_ptp_message_o          (emb_is_ptp_message   ),  
        .ptp_messageLength_o       (emb_ptp_messageLength), 
        .ptp_flagField_o           (emb_ptp_flagField    ), 
                                                       
        .ipv6_flag_o               (emb_ipv6_flag        ),
        .ipv6_addr_base_o          (emb_ipv6_addr_base   ),
        .ipv4_flag_o               (emb_ipv4_flag        ),
        .ipv4_addr_base_o          (emb_ipv4_addr_base   ),
    
        .txts_trig_o               (emb_txts_trig),
        .eth_count_o               (emb_eth_count)
    );

    //++
    //instantiate tx_rcst module
    //--
    tx_rcst tx_rcst (
        .tx_clk                    (tx_clk     ),
        .tx_rst_n                  (tx_rst_n   ),
        .tx_clk_en_i               (tx_clk_en_i),   
    
        .tx_en_i                   (tx_en_to_rcst), 
        .tx_er_i                   (tx_er_to_rcst),
        .txd_i                     (txd_to_rcst  ),  

        .tx_en_o                   (tx_en_o),
        .tx_er_o                   (tx_er_o),
        .txd_o                     (txd_o  ),

        //configuration register i/f
        .tsu_cfg_i                 (tsu_cfg_i),
    
        //timestamp input
        .sfd_timestamp_i           (sfd_timestamp_i        ),         
        .sfd_timestamp_frac_ns_i   (sfd_timestamp_frac_ns_i),
    
        .correctionField_i         (emb_correctionField  ),     
        .ingress_time_i            (emb_ingress_time     ),       
                                                       
        .ptp_addr_base_i           (emb_ptp_addr_base    ),
        .is_ptp_message_i          (emb_is_ptp_message   ),  
        .ptp_messageLength_i       (emb_ptp_messageLength), 
        .ptp_messageType_i         (emb_ptp_messageType  ),
        .ptp_flagField_i           (emb_ptp_flagField    ),  
                                                       
        .ipv6_flag_i               (emb_ipv6_flag        ),
        .ipv6_addr_base_i          (emb_ipv6_addr_base   ),
        .ipv4_flag_i               (emb_ipv4_flag        ),  
        .ipv4_addr_base_i          (emb_ipv4_addr_base   ),
    
        .eth_count_i               (emb_eth_count     )
    );

endmodule

