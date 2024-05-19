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
 * combine rx/tx timestamp unit
-*/

`include "ptpv2_defines.v"

module tsu_mx(
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
    input               tx_clk_en_i,            //for adapting to mii

    input               tx_en_i, 
    input               tx_er_i,
    input  [7:0]        txd_i  ,  
    
    output              tx_en_o,
    output              tx_er_o,
    output [7:0]        txd_o  ,

    //time input
    input  [79:0]       rtc_std_i,             //48 bits seconds + 32 bits nanoseconds
    input  [15:0]       rtc_fns_i,             //16 bit fractional nanoseconds of rtc

    //configuration register i/f
    input  [31:0]       tsu_cfg_i,
    input  [31:0]       link_delay_i,
    input  [31:0]       ingress_asymmetry_i,
    input  [31:0]       egress_asymmetry_i,
    input  [15:0]       tx_latency_i,
    input  [47:0]       loc_mac_addr_i,
    
    //timestamp i/f, sync to rtc_clk
    output reg [79:0]   rx_timestamp_o,            
    output reg [15:0]   rx_timestamp_frac_ns_o,   
    output reg [79:0]   rx_sourcePortIdentity_o,  
    output reg [15:0]   rx_flagField_o,
    output reg [15:0]   rx_seqId_o,                 
    output reg [3:0]    rx_versionPTP_o,
    output reg [3:0]    rx_minorVersionPTP_o,
    output reg [3:0]    rx_messageType_o,  
    output reg [3:0]    rx_majorSdoId_o,

    output reg [79:0]   tx_timestamp_o,            
    output reg [15:0]   tx_timestamp_frac_ns_o,   
    output reg [79:0]   tx_sourcePortIdentity_o,  
    output reg [15:0]   tx_flagField_o,
    output reg [15:0]   tx_seqId_o,                 
    output reg [3:0]    tx_versionPTP_o,
    output reg [3:0]    tx_minorVersionPTP_o,
    output reg [3:0]    tx_messageType_o,  
    output reg [3:0]    tx_majorSdoId_o,

    //interrupt signals generated from ptpv2 core
    output              int_rx_ptp_o,
    output              int_tx_ptp_o
);
    wire bypass_dp = dis_ptpv2_i | tsu_cfg_i[4];  //bypass data path, maybe used in two-step clock

    //++
    //rx direction tsu
    //--
    reg  [79:0]   rx_timestamp;            
    reg  [15:0]   rx_timestamp_frac_ns;   

    wire [79:0]   rx_sourcePortIdentity;  
    wire [15:0]   rx_flagField;
    wire [15:0]   rx_seqId;                 
    wire [3:0]    rx_versionPTP;
    wire [3:0]    rx_minorVersionPTP;
    wire [3:0]    rx_messageType;  
    wire [3:0]    rx_majorSdoId;

    wire          rxts_trig;
    wire          rxts_valid;

    //get temporary timestamp for each rx frame
    reg           rxts_toggle, rxts_toggle_d1, rxts_toggle_d2, rxts_toggle_d3;  
    wire          rxts_take;

    always @(posedge rx_clk or negedge rx_rst_n) begin
        if(!rx_rst_n)
            rxts_toggle  <= 0;
        else if(rxts_trig == 1'b1)     //sfd received
            rxts_toggle  <= ~rxts_toggle;
    end

    //synchronization between rx_clk and rtc_clk clock domains
    always @(posedge rtc_clk or negedge rtc_rst_n) begin
        if(!rtc_rst_n) 
            {rxts_toggle_d3, rxts_toggle_d2, rxts_toggle_d1} <= 3'b0;
        else 
            {rxts_toggle_d3, rxts_toggle_d2, rxts_toggle_d1} <= {rxts_toggle_d2, rxts_toggle_d1, rxts_toggle};
    end

    assign rxts_take = rxts_toggle_d3 ^ rxts_toggle_d2;
  
    always @(posedge rtc_clk or negedge rtc_rst_n) begin
        if(!rtc_rst_n) begin
            rx_timestamp         <= 80'h0;            
            rx_timestamp_frac_ns <= 16'h0;   
        end
        else if(rxts_take == 1'b1) begin
            rx_timestamp         <= rtc_std_i;            
            rx_timestamp_frac_ns <= rtc_fns_i;   
        end
    end

    //get formal timestamp and identification for rx ptpv2 packet
    reg     rxts_valid_d1, rxts_valid_d2, rxts_valid_d3;
    
    always @(posedge rtc_clk or negedge rtc_rst_n) begin
        if(!rtc_rst_n) 
            {rxts_valid_d3, rxts_valid_d2, rxts_valid_d1} <= 3'b0;
        else
            {rxts_valid_d3, rxts_valid_d2, rxts_valid_d1} <= {rxts_valid_d2, rxts_valid_d1, rxts_valid};
    end

    wire    rxts_valid_sync_pulse;
    assign  rxts_valid_sync_pulse = rxts_valid_d2 & (~rxts_valid_d3);

    always @(posedge rtc_clk or negedge rtc_rst_n) begin
        if(!rtc_rst_n) begin
            rx_timestamp_o          <= 0;            
            rx_timestamp_frac_ns_o  <= 0;   

            rx_sourcePortIdentity_o <= 0;  
            rx_flagField_o          <= 0;
            rx_seqId_o              <= 0;                 
            rx_versionPTP_o         <= 0;
            rx_minorVersionPTP_o    <= 0;
            rx_messageType_o        <= 0;  
            rx_majorSdoId_o         <= 0;
        end
        else if(rxts_valid_sync_pulse) begin
            rx_timestamp_o          <= rx_timestamp         ;            
            rx_timestamp_frac_ns_o  <= rx_timestamp_frac_ns ;   
                                                              
            rx_sourcePortIdentity_o <= rx_sourcePortIdentity;  
            rx_flagField_o          <= rx_flagField         ;
            rx_seqId_o              <= rx_seqId             ;                 
            rx_versionPTP_o         <= rx_versionPTP        ;
            rx_minorVersionPTP_o    <= rx_minorVersionPTP   ;
            rx_messageType_o        <= rx_messageType       ;  
            rx_majorSdoId_o         <= rx_majorSdoId        ;
        end
    end
  
    //instantiate rx timestamp engine 
    wire              rx_dv_out; 
    wire              rx_er_out; 
    wire [7:0]        rxd_out  ; 

    assign rx_dv_o = (bypass_dp == 1'b1) ? rx_dv_i : rx_dv_out; 
    assign rx_er_o = (bypass_dp == 1'b1) ? rx_er_i : rx_er_out; 
    assign rxd_o   = (bypass_dp == 1'b1) ? rxd_i   : rxd_out  ; 

    rx_tse  rx_tse(
        //xgmii i/f
        .rx_clk                  (rx_clk     ),
        .rx_rst_n                (rx_rst_n   ),
        .rx_clk_en_i             (rx_clk_en_i),            

        .rx_dv_i                 (rx_dv_i), 
        .rx_er_i                 (rx_er_i), 
        .rxd_i                   (rxd_i  ), 

        .rx_dv_o                 (rx_dv_out), 
        .rx_er_o                 (rx_er_out), 
        .rxd_o                   (rxd_out  ), 

        //timestamp input
        .sfd_timestamp_i         (rx_timestamp        ),       
        .sfd_timestamp_frac_ns_i (rx_timestamp_frac_ns), 

        //configuration register i/f
        .tsu_cfg_i               (tsu_cfg_i          ),
        .link_delay_i            (link_delay_i       ),
        .ingress_asymmetry_i     (ingress_asymmetry_i),
    
        //timestamp i/f, sync to rtc_clk
        .rxts_trig_o             (rxts_trig ),
        .rxts_valid_o            (rxts_valid),

        .rx_sourcePortIdentity_o (rx_sourcePortIdentity),  
        .rx_flagField_o          (rx_flagField         ),
        .rx_seqId_o              (rx_seqId             ),                 
        .rx_versionPTP_o         (rx_versionPTP        ),
        .rx_minorVersionPTP_o    (rx_minorVersionPTP   ),
        .rx_messageType_o        (rx_messageType       ),  
        .rx_majorSdoId_o         (rx_majorSdoId        ),

        //ptpv2 rx interrupt signal 
        .int_rx_ptp_o            (int_rx_ptp_o )
    );

    //++
    //tx direction tsu
    //--
    reg  [79:0]   tx_timestamp;            
    reg  [15:0]   tx_timestamp_frac_ns;   

    wire [79:0]   tx_sourcePortIdentity;  
    wire [15:0]   tx_flagField;
    wire [15:0]   tx_seqId;                 
    wire [3:0]    tx_versionPTP;
    wire [3:0]    tx_minorVersionPTP;
    wire [3:0]    tx_messageType;  
    wire [3:0]    tx_majorSdoId;

    wire          txts_trig;
    wire          txts_valid;

    //get temporary timestamp for each tx frame
    reg           txts_toggle, txts_toggle_d1, txts_toggle_d2, txts_toggle_d3;  
    wire          txts_take;  

    always @(posedge tx_clk or negedge tx_rst_n) begin
        if(!tx_rst_n)
            txts_toggle  <= 0;
        else if(txts_trig == 1'b1)     //sfd received
            txts_toggle  <= ~txts_toggle;
    end

    //synchronization between tx_clk and rtc_clk clock domains
    always @(posedge rtc_clk or negedge rtc_rst_n) begin
        if(!rtc_rst_n) 
            {txts_toggle_d3, txts_toggle_d2, txts_toggle_d1} <= 3'b0;
        else 
            {txts_toggle_d3, txts_toggle_d2, txts_toggle_d1} <= {txts_toggle_d2, txts_toggle_d1, txts_toggle};
    end

    assign txts_take = txts_toggle_d3 ^ txts_toggle_d2;
  
    always @(posedge rtc_clk or negedge rtc_rst_n) begin
        if(!rtc_rst_n) begin
            tx_timestamp         <= 80'h0;            
            tx_timestamp_frac_ns <= 16'h0;   
        end
        else if(txts_take == 1'b1) begin
            tx_timestamp         <= rtc_std_i;            
            tx_timestamp_frac_ns <= rtc_fns_i;   
        end
    end

    //correct tx timestamp by adding tx_latency
    wire [79:0]    corrected_tx_timestamp;
    reg  [31:0]    corrected_nanoseconds_tmp;
    reg  [47:0]    corrected_seconds;
    reg  [31:0]    corrected_nanoseconds;
    
    always @(posedge rtc_clk or negedge rtc_rst_n) begin
        if(!rtc_rst_n) 
            corrected_nanoseconds_tmp <= 32'h0;
        else
            corrected_nanoseconds_tmp <= tx_timestamp[31:0] + {16'h0, tx_latency_i};
    end

    always @(posedge rtc_clk or negedge rtc_rst_n) begin
        if(!rtc_rst_n) begin
            corrected_nanoseconds <= 32'h0;
            corrected_seconds     <= 48'h0;
        end
        else if(corrected_nanoseconds_tmp[31:0] >= `SC2NS) begin
            corrected_nanoseconds <= corrected_nanoseconds_tmp - `SC2NS; 	
            corrected_seconds     <= tx_timestamp[79:32] + 48'h1;
        end
        else begin
            corrected_nanoseconds <= corrected_nanoseconds_tmp;
            corrected_seconds     <= tx_timestamp[79:32];
        end 
    end
  
    assign corrected_tx_timestamp = {corrected_seconds,  corrected_nanoseconds}; 

    //get formal timestamp and identification for tx ptpv2 packet
    reg     txts_valid_d1, txts_valid_d2, txts_valid_d3;
    
    always @(posedge rtc_clk or negedge rtc_rst_n) begin
        if(!rtc_rst_n) 
            {txts_valid_d3, txts_valid_d2, txts_valid_d1} <= 3'b0;
        else
            {txts_valid_d3, txts_valid_d2, txts_valid_d1} <= {txts_valid_d2, txts_valid_d1, txts_valid};
    end

    wire    txts_valid_sync_pulse;
    assign  txts_valid_sync_pulse = txts_valid_d2 & (~txts_valid_d3);

    always @(posedge rtc_clk or negedge rtc_rst_n) begin
        if(!rtc_rst_n) begin
            tx_timestamp_o          <= 0;            
            tx_timestamp_frac_ns_o  <= 0;   

            tx_sourcePortIdentity_o <= 0;  
            tx_flagField_o          <= 0;
            tx_seqId_o              <= 0;                 
            tx_versionPTP_o         <= 0;
            tx_minorVersionPTP_o    <= 0;
            tx_messageType_o        <= 0;  
            tx_majorSdoId_o         <= 0;
        end
        else if(txts_valid_sync_pulse) begin
            tx_timestamp_o          <= corrected_tx_timestamp     ;            
            tx_timestamp_frac_ns_o  <= tx_timestamp_frac_ns ;   
                                                              
            tx_sourcePortIdentity_o <= tx_sourcePortIdentity;  
            tx_flagField_o          <= tx_flagField         ;
            tx_seqId_o              <= tx_seqId             ;                 
            tx_versionPTP_o         <= tx_versionPTP        ;
            tx_minorVersionPTP_o    <= tx_minorVersionPTP   ;
            tx_messageType_o        <= tx_messageType       ;  
            tx_majorSdoId_o         <= tx_majorSdoId        ;
        end
    end

    //instantiate tx timestamp engine
    wire              tx_en_out;
    wire              tx_er_out;
    wire [7:0]        txd_out  ;

    assign tx_en_o = (bypass_dp == 1'b1) ? tx_en_i : tx_en_out;
    assign tx_er_o = (bypass_dp == 1'b1) ? tx_er_i : tx_er_out;
    assign txd_o   = (bypass_dp == 1'b1) ? txd_i   : txd_out  ;

    tx_tse tx_tse(
        .bypass_dp_i             (bypass_dp),

        //gmii interface
        .tx_clk                  (tx_clk     ),
        .tx_rst_n                (tx_rst_n   ),
        .tx_clk_en_i             (tx_clk_en_i),      

        .tx_en_i                 (tx_en_i), 
        .tx_er_i                 (tx_er_i),
        .txd_i                   (txd_i  ),  
        
        .tx_en_o                 (tx_en_out),
        .tx_er_o                 (tx_er_out),
        .txd_o                   (txd_out  ),
    
        //timestamp input
        .sfd_timestamp_i         (corrected_tx_timestamp),       
        .sfd_timestamp_frac_ns_i (tx_timestamp_frac_ns), 
    
        //configuration register i/f
        .tsu_cfg_i               (tsu_cfg_i         ),
        .egress_asymmetry_i      (egress_asymmetry_i),
        
        //timestamp i/f, sync to rtc_clk
        .txts_trig_o             (txts_trig ),
        .txts_valid_o            (txts_valid),
        
        .tx_sourcePortIdentity_o (tx_sourcePortIdentity),  
        .tx_flagField_o          (tx_flagField         ),
        .tx_seqId_o              (tx_seqId             ),                 
        .tx_versionPTP_o         (tx_versionPTP        ),
        .tx_minorVersionPTP_o    (tx_minorVersionPTP   ),
        .tx_messageType_o        (tx_messageType       ),  
        .tx_majorSdoId_o         (tx_majorSdoId        ),
    
        //ptpv2 tx interrupt signal 
        .int_tx_ptp_o            (int_tx_ptp_o)
    );

endmodule


