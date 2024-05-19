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
 * embed ingress timestamp (ns part) in messageTypeSpecific field
 * of received ptpv2 event messages 
-*/

`include "ptpv2_defines.v"

module rx_emb_ts(
    //gmii interface
    input               rx_clk,
    input               rx_rst_n,
    input               rx_clk_en_i,            //for adapting to mii

    input               rx_dv_i, 
    input               rx_er_i, 
    input  [7:0]        rxd_i  , 

    output reg          rx_dv_o, 
    output reg          rx_er_o, 
    output reg [7:0]    rxd_o  , 

    //timestamp input
    input  [79:0]       sfd_timestamp_i,       //48 bits seconds + 32 bits nanoseconds

    //configuration register i/f
    input  [31:0]       tsu_cfg_i,
    input  [31:0]       link_delay_i,
    input  [31:0]       ingress_asymmetry_i,

    //ptpv2 message related information
    input  [10:0]       ptp_addr_base_i,
    input  [3:0]        ptp_messageType_i,          
    input  [63:0]       ptp_correctionField_i,
    input               is_ptp_message_i,  

    output reg          efd_p4_o,
    output reg          embed_enable_o,
    output reg [10:0]   eth_count_o
);
    //correctionField calculation
    reg  [31:0] asym_plus_delay;

    always @(posedge rx_clk  or negedge rx_rst_n) begin
        if(!rx_rst_n)
            asym_plus_delay <= 32'h0;
        else if(rx_clk_en_i)
            asym_plus_delay <= link_delay_i + ingress_asymmetry_i;
    end

    //note: p2p tc offload take effect to sync message only
    //e2e tc offload happen to all event messages
    wire one_step    = tsu_cfg_i[0];
    wire peer_delay  = tsu_cfg_i[2];
    wire tc_offload  = tsu_cfg_i[3];
    wire ing_asym_en = tsu_cfg_i[7];
    wire p2p_tc_offload = peer_delay & tc_offload;
    
    reg  [63:0] correctionField;

    always @(*) begin
        if(p2p_tc_offload == 1'b1 && ing_asym_en == 1'b1 && ptp_messageType_i[3:0] == 4'h0) //p2p sync message
            correctionField = ptp_correctionField_i + {{16{asym_plus_delay[31]}}, asym_plus_delay[31:0], 16'b0};
        else if(p2p_tc_offload == 1'b1 && ptp_messageType_i[3:0] == 4'h0) //p2p sync message, no asymmetry correction
            correctionField = ptp_correctionField_i + {16'h0, link_delay_i[31:0], 16'b0};
        else if(tc_offload == 1'b1 && ing_asym_en == 1'b1 && ptp_messageType_i[3:0] == 4'h0) //e2e sync message, asymmetry correction
            correctionField = ptp_correctionField_i + {{16{ingress_asymmetry_i[31]}}, ingress_asymmetry_i[31:0], 16'b0};
        else if(ing_asym_en == 1'b1 && ptp_messageType_i[3:0] == 4'h3)    //pdelay_resp message
            correctionField = ptp_correctionField_i + {{16{ingress_asymmetry_i[31]}}, ingress_asymmetry_i[31:0], 16'b0};
        else   //no aysmmetry correction and link_delay add
            correctionField = ptp_correctionField_i;
    end

    //input delay line
    reg              rx_dv_z1, rx_dv_z2, rx_dv_z3, rx_dv_z4; 
    reg              rx_er_z1, rx_er_z2, rx_er_z3, rx_er_z4; 
    reg [7:0]        rxd_z1  , rxd_z2  , rxd_z3  , rxd_z4  ; 

    reg              rx_dv_z5, rx_dv_z6, rx_dv_z7, rx_dv_z8; 
    reg              rx_er_z5, rx_er_z6, rx_er_z7, rx_er_z8; 
    reg [7:0]        rxd_z5  , rxd_z6  , rxd_z7  , rxd_z8  ; 

    always @(posedge rx_clk  or negedge rx_rst_n) begin
        if(!rx_rst_n) begin
            {rx_dv_z1, rx_dv_z2, rx_dv_z3, rx_dv_z4} <= {4{1'b0}}; 
            {rx_er_z1, rx_er_z2, rx_er_z3, rx_er_z4} <= {4{1'b0}}; 
            {rxd_z1  , rxd_z2  , rxd_z3  , rxd_z4  } <= {4{8'b0}}; 

            {rx_dv_z5, rx_dv_z6, rx_dv_z7, rx_dv_z8} <= {4{1'b0}}; 
            {rx_er_z5, rx_er_z6, rx_er_z7, rx_er_z8} <= {4{1'b0}}; 
            {rxd_z5  , rxd_z6  , rxd_z7  , rxd_z8  } <= {4{8'b0}}; 
        end
        else if(rx_clk_en_i) begin
            {rx_dv_z1, rx_dv_z2, rx_dv_z3, rx_dv_z4} <= {rx_dv_i, rx_dv_z1, rx_dv_z2, rx_dv_z3}; 
            {rx_er_z1, rx_er_z2, rx_er_z3, rx_er_z4} <= {rx_er_i, rx_er_z1, rx_er_z2, rx_er_z3}; 
            {rxd_z1  , rxd_z2  , rxd_z3  , rxd_z4  } <= {rxd_i  , rxd_z1  , rxd_z2  , rxd_z3  }; 

            {rx_dv_z5, rx_dv_z6, rx_dv_z7, rx_dv_z8} <= {rx_dv_z4, rx_dv_z5, rx_dv_z6, rx_dv_z7}; 
            {rx_er_z5, rx_er_z6, rx_er_z7, rx_er_z8} <= {rx_er_z4, rx_er_z5, rx_er_z6, rx_er_z7}; 
            {rxd_z5  , rxd_z6  , rxd_z7  , rxd_z8  } <= {rxd_z4  , rxd_z5  , rxd_z6  , rxd_z7  }; 
        end
    end

    //detect the delayed start of frame 
    wire                get_sfd_done_p1;
    reg                 get_sfd_done;
    reg  [10:0]         eth_count;

    assign  get_sfd_done_p1 = (rxd_z8[7:0] == `SFD);

    always @(posedge rx_clk or negedge rx_rst_n) begin
        if(!rx_rst_n)
            get_sfd_done <= 0;
        else if(rx_clk_en_i) begin
            if(rx_dv_z8 == 1'b1 && get_sfd_done_p1 == 1'b1)
                get_sfd_done <= 1;
            else if(rx_dv_z8 == 1'b0 )
                get_sfd_done <= 0;
        end
    end

    always @(posedge rx_clk or negedge rx_rst_n) begin
        if(!rx_rst_n)
            eth_count  <=  11'd0;
        else if(rx_clk_en_i) begin
            if(rx_dv_z8 == 1'b1 && get_sfd_done_p1 == 1'b1 && get_sfd_done == 1'b0)  
                eth_count  <=  11'd8;
            else if(rx_dv_z8 == 1'b1 && get_sfd_done == 1'b1)
                eth_count  <=  eth_count + 1;
            else if(rx_dv_z8 == 1'b0)
                eth_count  <=  11'd0;
        end
    end

    //embed ns of ingress timestamp in messageTypeSpecific field 
    wire emb_ingressTime_en = tsu_cfg_i[5];
    wire embed_enable = (emb_ingressTime_en == 1'b1 && is_ptp_message_i == 1'b1 && ptp_messageType_i[3] == 1'b0) ? 1 : 0;

    reg              rx_dv_tmp; 
    reg              rx_er_tmp; 
    reg [7:0]        rxd_tmp  ; 

    always @(*) begin
        rx_dv_tmp = rx_dv_z8; 
        rx_er_tmp = rx_er_z8; 
        rxd_tmp   = rxd_z8  ; 

        if(embed_enable == 1'b1 && rx_dv_z8 == 1'b1) begin
            if(eth_count == (ptp_addr_base_i+8))  rxd_tmp = correctionField[63:56];
            if(eth_count == (ptp_addr_base_i+9))  rxd_tmp = correctionField[55:48];
            if(eth_count == (ptp_addr_base_i+10)) rxd_tmp = correctionField[47:40];
            if(eth_count == (ptp_addr_base_i+11)) rxd_tmp = correctionField[39:32];
            if(eth_count == (ptp_addr_base_i+12)) rxd_tmp = correctionField[31:24];
            if(eth_count == (ptp_addr_base_i+13)) rxd_tmp = correctionField[23:16];
            if(eth_count == (ptp_addr_base_i+14)) rxd_tmp = correctionField[15:8];  
            if(eth_count == (ptp_addr_base_i+15)) rxd_tmp = correctionField[7:0];   

            if(eth_count == (ptp_addr_base_i+16)) rxd_tmp = sfd_timestamp_i[31:24];   //messageTypeSpecific, 4 octets
            if(eth_count == (ptp_addr_base_i+17)) rxd_tmp = sfd_timestamp_i[23:16];
            if(eth_count == (ptp_addr_base_i+18)) rxd_tmp = sfd_timestamp_i[15:8];
            if(eth_count == (ptp_addr_base_i+19)) rxd_tmp = sfd_timestamp_i[7:0];
        end
    end

    always @(posedge rx_clk  or negedge rx_rst_n) begin
        if(!rx_rst_n) begin
            rx_dv_o     <= 1'b0; 
            rx_er_o     <= 1'b0; 
            rxd_o       <= 8'b0; 

            eth_count_o    <= 11'b0;
            efd_p4_o       <= 1'b0;
            embed_enable_o <= 1'b0;
        end
        else if(rx_clk_en_i) begin
            rx_dv_o     <= rx_dv_tmp; 
            rx_er_o     <= rx_er_tmp; 
            rxd_o       <= rxd_tmp  ; 

            eth_count_o    <= eth_count;
            efd_p4_o       <= (~rx_dv_z4) & rx_dv_z5;
            embed_enable_o <= embed_enable;
        end
    end
endmodule
