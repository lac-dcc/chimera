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
 * extract ingress timestamp (ns part) from messageTypeSpecific field
 * of ptpv2 event message.
 * recalculate correctionField by subtract egress asymmetry. 
 * fill messageTypeSpecific field to zero according to standard.
-*/

`include "ptpv2_defines.v"

module tx_emb_ts(
    //gmii interface
    input               tx_clk,
    input               tx_rst_n,
    input               tx_clk_en_i,            //for adapting to mii

    input               tx_en_i, 
    input               tx_er_i,
    input  [7:0]        txd_i  ,  
    
    output reg          tx_en_o,
    output reg          tx_er_o,
    output reg [7:0]    txd_o  ,

    //configuration register i/f
    input  [31:0]       tsu_cfg_i,
    input  [31:0]       egress_asymmetry_i,

    //ptpv2 message related information
    input  [10:0]       ptp_addr_base_i,
    input  [3:0]        ptp_messageType_i,          
    input  [63:0]       ptp_correctionField_i,
    input  [31:0]       ptp_messageTypeSpecific_i,
    input               is_ptp_message_i,  
    input  [15:0]       ptp_messageLength_i,
    input  [15:0]       ptp_flagField_i, 

    input               ipv6_flag_i,
    input  [10:0]       ipv6_addr_base_i,
    input               ipv4_flag_i,
    input  [10:0]       ipv4_addr_base_i,

    //output information of currently sending packet
    output reg [63:0]   correctionField_o,       //ns * 2^16                               
    output     [31:0]   ingress_time_o,          //32 bits ns  

    output reg [10:0]   ptp_addr_base_o,
    output reg [3:0]    ptp_messageType_o,          
    output reg          is_ptp_message_o,  
    output reg [15:0]   ptp_messageLength_o, 
    output reg [15:0]   ptp_flagField_o, 

    output reg          ipv6_flag_o,
    output reg [10:0]   ipv6_addr_base_o,
    output reg          ipv4_flag_o,
    output reg [10:0]   ipv4_addr_base_o,

    output reg          txts_trig_o,
    output reg [10:0]   eth_count_o
);
    //extract register settings
    wire one_step    = tsu_cfg_i[0];
    wire is_tc       = tsu_cfg_i[1];   
    wire peer_delay  = tsu_cfg_i[2];
    wire tc_offload  = tsu_cfg_i[3];
    wire eg_asym_en  = tsu_cfg_i[6];
    wire emb_ingressTime_en = tsu_cfg_i[5];
    wire one_step_from_pkt = tsu_cfg_i[24];     

    wire  one_step_flag = (one_step_from_pkt & (~ptp_flagField_i[9])) | one_step;                                  

    //gmii delay line
    reg         tx_en_z1, tx_en_z2, tx_en_z3, tx_en_z4, tx_en_z5, tx_en_z6, tx_en_z7, tx_en_z8, 
                tx_en_z9, tx_en_z10, tx_en_z11, tx_en_z12, tx_en_z13;
    reg         tx_er_z1, tx_er_z2, tx_er_z3, tx_er_z4, tx_er_z5, tx_er_z6, tx_er_z7, tx_er_z8, 
                tx_er_z9, tx_er_z10,tx_er_z11, tx_er_z12, tx_er_z13;
    reg  [7:0]  txd_z1, txd_z2, txd_z3, txd_z4, txd_z5, txd_z6, txd_z7, txd_z8, txd_z9, txd_z10,
                txd_z11, txd_z12, txd_z13;

    always @(posedge tx_clk or negedge tx_rst_n) begin
        if(!tx_rst_n) begin
            {tx_en_z1, tx_en_z2, tx_en_z3, tx_en_z4, tx_en_z5, tx_en_z6, tx_en_z7, tx_en_z8, 
             tx_en_z9, tx_en_z10, tx_en_z11, tx_en_z12, tx_en_z13} <= {13{1'b0}};

            {tx_er_z1, tx_er_z2, tx_er_z3, tx_er_z4, tx_er_z5, tx_er_z6, tx_er_z7, tx_er_z8, 
             tx_er_z9, tx_er_z10, tx_er_z11, tx_er_z12, tx_er_z13} <= {13{1'b0}};

            {txd_z1, txd_z2, txd_z3, txd_z4, txd_z5, txd_z6, txd_z7, txd_z8, txd_z9, txd_z10,
                      txd_z11, txd_z12, txd_z13} <= {13{8'b0}};
        end
        else if(tx_clk_en_i) begin
            {tx_en_z1, tx_en_z2, tx_en_z3, tx_en_z4, tx_en_z5, tx_en_z6, tx_en_z7, tx_en_z8, 
             tx_en_z9, tx_en_z10, tx_en_z11, tx_en_z12, tx_en_z13}
            <= {tx_en_i, tx_en_z1, tx_en_z2, tx_en_z3, tx_en_z4, tx_en_z5, tx_en_z6, tx_en_z7, 
                tx_en_z8, tx_en_z9, tx_en_z10, tx_en_z11, tx_en_z12};

            {tx_er_z1, tx_er_z2, tx_er_z3, tx_er_z4, tx_er_z5, tx_er_z6, tx_er_z7, tx_er_z8, 
             tx_er_z9, tx_er_z10, tx_er_z11, tx_er_z12, tx_er_z13}
            <= {tx_er_i, tx_er_z1, tx_er_z2, tx_er_z3, tx_er_z4, tx_er_z5, tx_er_z6, tx_er_z7, 
                tx_er_z8, tx_er_z9, tx_er_z10, tx_er_z11, tx_er_z12};

            {txd_z1, txd_z2, txd_z3, txd_z4, txd_z5, txd_z6, txd_z7, txd_z8, txd_z9, txd_z10,
                      txd_z11, txd_z12, txd_z13}
            <= {txd_i, txd_z1, txd_z2, txd_z3, txd_z4, txd_z5, txd_z6, txd_z7, txd_z8, txd_z9, 
                      txd_z10, txd_z11, txd_z12};
        end
    end
    
    //++
    //re-calculate eth_count and get_sfd_done
    //to get correctionField and MessageTypeSpecific correctly,
    //use txd_z12 instead of txd_i
    //--
    reg  [10:0]         eth_count;
    wire                get_sfd_done_p1;
    reg                 get_sfd_done;

    assign  get_sfd_done_p1 = (txd_z12[7:0] == `SFD);

    always @(posedge tx_clk or negedge tx_rst_n) begin
        if(!tx_rst_n)
            get_sfd_done <= 0;
        else if(tx_clk_en_i) begin
            if(tx_en_z12 == 1'b1 && get_sfd_done_p1 == 1'b1)
                get_sfd_done <= 1;
            else if(tx_en_z12 == 1'b0)
                get_sfd_done <= 0;
        end
    end
    
    always @(posedge tx_clk or negedge tx_rst_n) begin
        if(!tx_rst_n)
            eth_count  <=  11'd0;
        else if(tx_clk_en_i) begin
            if(tx_en_z12 == 1'b1 && get_sfd_done_p1 == 1'b1 && get_sfd_done == 1'b0)  
                eth_count  <=  11'd8;
            else if(tx_en_z12 == 1'b1 && get_sfd_done == 1'b1)
                eth_count  <=  eth_count + 1;
            else if(tx_en_z12 == 1'b0)
                eth_count  <=  11'd0;
        end
    end

    always @(posedge tx_clk or negedge tx_rst_n) begin
        if(!tx_rst_n)
            txts_trig_o <= 0;
        else if(tx_clk_en_i)
            txts_trig_o <= (tx_en_z12 == 1'b1 && get_sfd_done_p1 == 1'b1 && get_sfd_done == 1'b0);
    end

    //processing of ingress time and correctionField 
    wire [63:0] asym_correction = {{16{egress_asymmetry_i[31]}}, egress_asymmetry_i[31:0], 16'b0};  

    always @(posedge tx_clk or negedge tx_rst_n) begin
        if(!tx_rst_n)
            correctionField_o <= 64'h0;
        else if(tx_clk_en_i) begin
            if(eg_asym_en == 1'b1 && (ptp_messageType_i[3:0] == 4'h1 || ptp_messageType_i[3:0] ==  4'h2) && is_ptp_message_i == 1'b1)
                correctionField_o <= ptp_correctionField_i - asym_correction;  // only for delay_req and pdelay_req messages.
            else
                correctionField_o <= ptp_correctionField_i;
        end
    end

    assign ingress_time_o = ptp_messageTypeSpecific_i;

    //related control signals for one-step clock processing
    wire next_frame_start = (eth_count == 0) && (tx_en_z12 == 1'b1);
    
    always @(posedge tx_clk or negedge tx_rst_n) begin
        if(!tx_rst_n) begin
            ptp_addr_base_o     <= 11'h80;
            ptp_messageType_o   <= 4'hf;  
            ptp_flagField_o     <= 16'h0;
            is_ptp_message_o    <= 0;  
            ptp_messageLength_o <= 16'h0; 
        end
        else if(tx_clk_en_i) begin
            if(is_ptp_message_i == 1'b1 ) begin //latch
                ptp_addr_base_o     <= ptp_addr_base_i;
                ptp_messageType_o   <= ptp_messageType_i;  
                ptp_flagField_o     <= ptp_flagField_i;        
                is_ptp_message_o    <= is_ptp_message_i;  
                ptp_messageLength_o <= ptp_messageLength_i;
            end
            else if(next_frame_start == 1) begin 
                ptp_addr_base_o     <= 11'h80;
                ptp_messageType_o   <= 4'hf;  
                ptp_flagField_o     <= 16'h0;
                is_ptp_message_o    <= 0;  
                ptp_messageLength_o <= 16'h0; 
            end
        end
    end

    always @(posedge tx_clk or negedge tx_rst_n) begin
        if(!tx_rst_n) begin
            ipv6_flag_o      <= 0;
            ipv6_addr_base_o <= 11'h0;
        end
        else if(tx_clk_en_i) begin
            if(ipv6_flag_i == 1'b1) begin //latch
                ipv6_flag_o      <= ipv6_flag_i;
                ipv6_addr_base_o <= ipv6_addr_base_i;        
            end
            else if(next_frame_start == 1) begin 
                ipv6_flag_o      <= 0;
                ipv6_addr_base_o <= 11'h0;
            end
        end
    end

    always @(posedge tx_clk or negedge tx_rst_n) begin
        if(!tx_rst_n) begin
            ipv4_flag_o      <= 0;
            ipv4_addr_base_o <= 11'h0;
        end
        else if(tx_clk_en_i) begin
            if(ipv4_flag_i == 1'b1) begin //latch
                ipv4_flag_o      <= ipv4_flag_i;
                ipv4_addr_base_o <= ipv4_addr_base_i;        
            end
            else if(next_frame_start == 1) begin 
                ipv4_flag_o      <= 0;
                ipv4_addr_base_o <= 11'h0;
            end
        end
    end

    //output gmii data
    always @(posedge tx_clk or negedge tx_rst_n) begin
        if(!tx_rst_n) begin
            tx_en_o <= 0;
            tx_er_o <= 0;
            txd_o   <= 8'h0;
        end
        else if(tx_clk_en_i) begin
            tx_en_o <= tx_en_z12;
            tx_er_o <= tx_er_z12;
            txd_o   <= txd_z12;

            //ptp event message, one-step clock or tc-offload, embedded ingress time
            if(is_ptp_message_i == 1'b1 && ptp_messageType_i[3] == 1'b0 && emb_ingressTime_en == 1'b1 && 
              (one_step_flag | tc_offload)) begin 
                if(eth_count == (ptp_addr_base_i+16)) txd_o <= 8'h0;             //messageTypeSpecific
                if(eth_count == (ptp_addr_base_i+17)) txd_o <= 8'h0;
                if(eth_count == (ptp_addr_base_i+18)) txd_o <= 8'h0;
                if(eth_count == (ptp_addr_base_i+19)) txd_o <= 8'h0;
            end
        end
    end
  
    always @(posedge tx_clk or negedge tx_rst_n) begin  
        if(!tx_rst_n) begin
            eth_count_o    <= 0;
        end
        else if(tx_clk_en_i) begin  
            eth_count_o    <= eth_count;
        end
    end

endmodule
