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
 * tx frame reconstruction including one-step clock processing for ptpv2, etc.
-*/

`include "ptpv2_defines.v"

module tx_rcst (
    input               tx_clk,
    input               tx_rst_n,
    input               tx_clk_en_i,            //for adapting to mii

    input               tx_en_i, 
    input               tx_er_i,
    input  [7:0]        txd_i  ,  
    
    output              tx_en_o,
    output              tx_er_o,
    output [7:0]        txd_o  ,

    //configuration register i/f
    input  [31:0]       tsu_cfg_i,

    //timestamp input
    input  [79:0]       sfd_timestamp_i,         //48 bits seconds + 32 bits nanoseconds
    input  [15:0]       sfd_timestamp_frac_ns_i, //16 bit fractional nanoseconds 

    input  [63:0]       correctionField_i,       //ns * 2^16                               
    input  [31:0]       ingress_time_i,          //32 bits ns  
    
    input  [10:0]       ptp_addr_base_i,
    input               is_ptp_message_i,  
    input  [15:0]       ptp_messageLength_i, 
    input  [3:0]        ptp_messageType_i,
    input  [15:0]       ptp_flagField_i,  
    
    input               ipv6_flag_i,
    input  [10:0]       ipv6_addr_base_i,
    input               ipv4_flag_i,  
    input  [10:0]       ipv4_addr_base_i,

    input  [10:0]       eth_count_i
);
    //register settings
    wire one_step    = tsu_cfg_i[0];
    wire is_tc       = tsu_cfg_i[1];  
    wire peer_delay  = tsu_cfg_i[2];
    wire tc_offload  = tsu_cfg_i[3];
    wire emb_ingressTime_en = tsu_cfg_i[5];
    wire eg_asym_en  = tsu_cfg_i[6];
    wire ipv6_udp_chk_en = tsu_cfg_i[16];
    wire one_step_from_pkt = tsu_cfg_i[24];

    //++
    //calculate correctionField
    //--
    reg  signed [63:0] correctionField;

    //do not take fractional ns into account
    wire signed [31:0] ingress_time, egress_time;
    wire signed [31:0] diff_time_p1;
    reg  signed [31:0] diff_time;

    assign ingress_time = $signed(ingress_time_i);
    assign egress_time  = $signed(sfd_timestamp_i[31:0]);
    assign diff_time_p1 = (egress_time > ingress_time) ? (egress_time - ingress_time) : (egress_time + $signed(`SC2NS) - ingress_time);

    //13 samples delay after parsing input
    always @(posedge tx_clk or negedge tx_rst_n) begin
        if(!tx_rst_n) 
            diff_time <= 32'b0;
        else if(tx_clk_en_i)
            diff_time <= diff_time_p1;
    end

    //14 samples delay
    always @(posedge tx_clk or negedge tx_rst_n) begin
        if(!tx_rst_n) begin
            correctionField <= 0; 
        end
        else if(tx_clk_en_i) begin
            if(is_tc == 1'b0 && ptp_messageType_i[3:0] == 4'h0)    //ordinary or boundary clock, sync message
                correctionField <= $signed(correctionField_i) + $signed({48'h0, sfd_timestamp_frac_ns_i[15:0]});
            else if(emb_ingressTime_en)                  
                correctionField <= $signed(correctionField_i) + $signed({{16{diff_time[31]}}, diff_time[31:0], 16'b0});
            else
                correctionField <= correctionField_i;
        end 
    end

    //++
    //modify ptp frame for one-step clock processing
    //--
    wire  step_flag_msg = ((ptp_messageType_i[3:0] == 4'h0) || (ptp_messageType_i[3:0] == 4'h3)) ? 1 : 0; //sync or pdelay_resp
    wire  one_step_flag = (one_step_from_pkt & (~ptp_flagField_i[9]) & step_flag_msg) | one_step;

    //delay input data 1 sample
    reg               tx_en_z1; 
    reg               tx_er_z1;
    reg  [7:0]        txd_z1  ;  

    reg [10:0]        eth_count_z1;

    always @(posedge tx_clk or negedge tx_rst_n) begin
        if(!tx_rst_n) begin
            tx_en_z1 <= 0;
            tx_er_z1 <= 0;
            txd_z1   <= 8'h0;

            eth_count_z1    <= 11'h0;
        end
        else if(tx_clk_en_i) begin
            tx_en_z1 <= tx_en_i;
            tx_er_z1 <= tx_er_i;
            txd_z1   <= txd_i;

            eth_count_z1    <= eth_count_i; 
        end
    end

    //insert tx timestamp and modify correctionField
    reg               tx_en_tmp; 
    reg               tx_er_tmp;
    reg  [7:0]        txd_tmp  ;  

    always @(*) begin
        //default values
        tx_en_tmp = tx_en_z1; 
        tx_er_tmp = tx_er_z1;
        txd_tmp   = txd_z1  ;  

        //deal with sync message timestamp, 
        if(ptp_messageType_i[3:0] == 4'h0 && one_step_flag == 1'b1 && is_ptp_message_i == 1'b1) begin  
            //originTimestamp
            if(is_tc == 1'b0)  begin  //ordinary or boundary clock
                if(eth_count_z1 == (ptp_addr_base_i+34))  txd_tmp = sfd_timestamp_i[79:72];    
                if(eth_count_z1 == (ptp_addr_base_i+35))  txd_tmp = sfd_timestamp_i[71:64];          
                if(eth_count_z1 == (ptp_addr_base_i+36))  txd_tmp = sfd_timestamp_i[63:56];    
                if(eth_count_z1 == (ptp_addr_base_i+37))  txd_tmp = sfd_timestamp_i[55:48];    
                if(eth_count_z1 == (ptp_addr_base_i+38))  txd_tmp = sfd_timestamp_i[47:40];    
                if(eth_count_z1 == (ptp_addr_base_i+39))  txd_tmp = sfd_timestamp_i[39:32];    
                if(eth_count_z1 == (ptp_addr_base_i+40))  txd_tmp = sfd_timestamp_i[31:24];    
                if(eth_count_z1 == (ptp_addr_base_i+41))  txd_tmp = sfd_timestamp_i[23:16];    
                if(eth_count_z1 == (ptp_addr_base_i+42))  txd_tmp = sfd_timestamp_i[15:8];     
                if(eth_count_z1 == (ptp_addr_base_i+43))  txd_tmp = sfd_timestamp_i[7:0];  
            end  
        end

        //deal with correctionField 
        if((ptp_messageType_i[3:0] == 4'h0 || (ptp_messageType_i[3:0] == 4'h1 && is_tc == 1'b1) || 
           (ptp_messageType_i[3:0] == 4'h2 && is_tc == 1'b1) || ptp_messageType_i[3:0] == 4'h3) 
            && one_step_flag == 1'b1 && is_ptp_message_i == 1'b1) begin  
            //correction_field
            if(eth_count_z1 == (ptp_addr_base_i+8))   txd_tmp = correctionField[63:56];
            if(eth_count_z1 == (ptp_addr_base_i+9))   txd_tmp = correctionField[55:48];
            if(eth_count_z1 == (ptp_addr_base_i+10))  txd_tmp = correctionField[47:40];
            if(eth_count_z1 == (ptp_addr_base_i+11))  txd_tmp = correctionField[39:32];
            if(eth_count_z1 == (ptp_addr_base_i+12))  txd_tmp = correctionField[31:24];
            if(eth_count_z1 == (ptp_addr_base_i+13))  txd_tmp = correctionField[23:16];
            if(eth_count_z1 == (ptp_addr_base_i+14))  txd_tmp = correctionField[15:8];
            if(eth_count_z1 == (ptp_addr_base_i+15))  txd_tmp = correctionField[7:0];
        end
    end

    //generate modified output
    reg               tx_en_z2; 
    reg               tx_er_z2;
    reg  [7:0]        txd_z2  ;  

    reg [10:0]        eth_count_z2;

    always @(posedge tx_clk or negedge tx_rst_n) begin
        if(!tx_rst_n) begin
            tx_en_z2 <= 0;
            tx_er_z2 <= 0;
            txd_z2   <= 8'h0;

            eth_count_z2    <= 11'h0;
        end
        else if(tx_clk_en_i) begin
            tx_en_z2 <= tx_en_tmp;
            tx_er_z2 <= tx_er_tmp;
            txd_z2   <= txd_tmp;

            eth_count_z2    <= eth_count_z1; 
        end
    end

    //++
    //calculate udp padding octets for one-step ptp event messages encapsulated in ipv6/udp  
    //--

    //delay 1 samples
    reg               tx_en_z3; 
    reg               tx_er_z3;
    reg  [7:0]        txd_z3  ;  

    reg [10:0]        eth_count_z3   ;

    always @(posedge tx_clk or negedge tx_rst_n) begin
        if(!tx_rst_n) begin
            tx_en_z3 <= 1'b0; 
            tx_er_z3 <= 1'b0;
            txd_z3   <= 8'h0;  

            eth_count_z3    <= 11'h0;
        end
        else if(tx_clk_en_i) begin
            tx_en_z3 <= tx_en_z2; 
            tx_er_z3 <= tx_er_z2;
            txd_z3   <= txd_z2  ;  

            eth_count_z3    <= eth_count_z2   ;
        end
    end

    wire ptp_pkt_chg = (ptp_messageType_i[3:0] == 4'h0 || (ptp_messageType_i[3:0] == 4'h1 && is_tc) || 
         (ptp_messageType_i[3:0] == 4'h2 && is_tc) || ptp_messageType_i[3:0] == 4'h3) && one_step_flag  && is_ptp_message_i;

    wire        ipv6_padchg_flag;
    wire [10:0] chkpad_addr_base ;
    wire [15:0] chksum_pad       ;

    //calculate ipv6 udp checksum, need two samples latency
    ipv6_udp_chksum ipv6_udp_chksum (
        .tx_clk              (tx_clk),
        .tx_rst_n            (tx_rst_n),              
        .tx_clk_en_i         (tx_clk_en_i),      

        .tx_en_i             (tx_en_z2), 
        .tx_er_i             (tx_er_z2),
        .txd_i               (txd_z2  ),  

        .ipv6_udp_chk_en_i   (ipv6_udp_chk_en & one_step_flag),      
        .eth_count_i         (eth_count_z2),
        .ipv6_flag_i         (ipv6_flag_i),
        .ipv6_addr_base_i    (ipv6_addr_base_i),
        .ptp_addr_base_i     (ptp_addr_base_i),
        .is_ptp_message_i    (is_ptp_message_i),

        .ptp_messageLength_i (ptp_messageLength_i),
        .ptp_messageType_i   (ptp_messageType_i),

        .ipv6_padchg_flag_o  (ipv6_padchg_flag), 
        .chkpad_addr_base_o  (chkpad_addr_base),
        .chksum_pad_o        (chksum_pad)
    );

    //change udp checksum (ptp over udp/ipv6 or udp/ipv4)
    reg               tx_en_tmp1; 
    reg               tx_er_tmp1;
    reg  [7:0]        txd_tmp1  ;  

    always @(*) begin
        tx_en_tmp1 = tx_en_z3; 
        tx_er_tmp1 = tx_er_z3;
        txd_tmp1   = txd_z3  ;  

        if(ipv6_padchg_flag == 1'b1 && ptp_pkt_chg == 1'b1) begin  //calculate udp checksum need 2 samples
          if(eth_count_z3 == chkpad_addr_base)   txd_tmp1 = chksum_pad[15:8];
          if(eth_count_z3 == chkpad_addr_base+1) txd_tmp1 = chksum_pad[7:0] ;
        end
        
        //force ipv4 udp checksum to 0 for changed ptp event message
        if(ipv4_flag_i == 1'b1 && ptp_pkt_chg == 1'b1) begin        
          if(eth_count_z3 == (ipv4_addr_base_i+26)) txd_tmp1 = 0;        
          if(eth_count_z3 == (ipv4_addr_base_i+27)) txd_tmp1 = 0;        
        end 
    end

    //generate checksum changed output
    reg               tx_en_z4; 
    reg               tx_er_z4;
    reg  [7:0]        txd_z4  ;  

    reg [10:0]        eth_count_z4   ;

    always @(posedge tx_clk or negedge tx_rst_n) begin
        if(!tx_rst_n) begin
            tx_en_z4 <= 1'b0; 
            tx_er_z4 <= 1'b0;
            txd_z4   <= 8'h0;  

            eth_count_z4    <= 11'h0;
        end
        else if(tx_clk_en_i) begin
            tx_en_z4 <= tx_en_tmp1; 
            tx_er_z4 <= tx_er_tmp1;
            txd_z4   <= txd_tmp1  ;  

            eth_count_z4    <= eth_count_z3   ;
        end
    end

    //++
    //re-calculate FCS. 
    //if frame modified, replace old crc.
    //--

    //indicator used to replace crc
    reg rpl_crc, rpl_crc_z1;

    always @(*) begin
        rpl_crc = rpl_crc_z1;

        if(eth_count_z4 == 11'd0 && tx_en_z4 == 1'b1) //start of frame 
            rpl_crc = 0;
        else if(ptp_pkt_chg == 1'b1)   
            rpl_crc = 1;
    end

    always @(posedge tx_clk or negedge tx_rst_n) begin
        if(!tx_rst_n)
            rpl_crc_z1 <= 1'b0;
        else if(tx_clk_en_i)
            rpl_crc_z1 <= rpl_crc; 
    end

    //indicator for end of frame (4 samples before)
    wire efd_p4 = tx_clk_en_i & (~tx_en_i) & tx_en_z1;

    //instantiate gmii_crc
    gmii_crc tx_gmii_crc(
        .clk              (tx_clk),
        .rst_n            (tx_rst_n),              
        .clk_en_i         (tx_clk_en_i),
        
        .data_en_i        (tx_en_z4), 
        .data_er_i        (tx_er_z4),
        .data_i           (txd_z4  ),  
        
        .data_en_o        (tx_en_o),
        .data_er_o        (tx_er_o),
        .data_o           (txd_o  ),
        
        .efd_p4_i         (efd_p4 ),
        .eth_count_i      (eth_count_z4),
        .rpl_flag_i       (rpl_crc_z1)
    );

endmodule

