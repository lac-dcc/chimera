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
 * calculate ipv6 udp checksum then output the last two padding octets
 * refer to rfc768
-*/

`include "ptpv2_defines.v"

module ipv6_udp_chksum(
    input               tx_clk,
    input               tx_rst_n,              //async reset, active low
    input               tx_clk_en_i,

    input               tx_en_i, 
    input               tx_er_i,
    input  [7:0]        txd_i  ,  

    input               ipv6_udp_chk_en_i,     
    input  [10:0]       eth_count_i,
    input               ipv6_flag_i,
    input  [10:0]       ipv6_addr_base_i,
    input  [10:0]       ptp_addr_base_i,
    input               is_ptp_message_i,

    input  [15:0]       ptp_messageLength_i,
    input  [3:0]        ptp_messageType_i,

    output reg          ipv6_padchg_flag_o,   //change udp padding octets or not
    output reg [10:0]   chkpad_addr_base_o,
    output reg [15:0]   chksum_pad_o
);
    wire  chksum_calc_en = ipv6_udp_chk_en_i & ipv6_flag_i;

    //++
    //get udp header identifications
    //--
    reg   [15:0]    udp_sourcePort;
    reg   [15:0]    udp_destinationPort;
    reg   [15:0]    udp_length;
    reg   [15:0]    udp_chksum;

    always @(posedge tx_clk or negedge tx_rst_n) begin
        if(!tx_rst_n) begin
            udp_sourcePort       <= 16'h0;
            udp_destinationPort  <= 16'h0;
            udp_length           <= 16'h0;
            udp_chksum           <= 16'h0;
        end
        else if(tx_clk_en_i) begin
            if(chksum_calc_en == 1'b1 && tx_en_i == 1'b1) begin
                if(eth_count_i == ipv6_addr_base_i+40)  udp_sourcePort[15:8] <= txd_i;
                if(eth_count_i == ipv6_addr_base_i+41)  udp_sourcePort[7:0]  <= txd_i;
                if(eth_count_i == ipv6_addr_base_i+42)  udp_destinationPort[15:8] <= txd_i;
                if(eth_count_i == ipv6_addr_base_i+43)  udp_destinationPort[7:0]  <= txd_i;
                if(eth_count_i == ipv6_addr_base_i+44)  udp_length[15:8] <= txd_i;
                if(eth_count_i == ipv6_addr_base_i+45)  udp_length[7:0]  <= txd_i;
                if(eth_count_i == ipv6_addr_base_i+46)  udp_chksum[15:8] <= txd_i;
                if(eth_count_i == ipv6_addr_base_i+47)  udp_chksum[7:0]  <= txd_i;
            end
            else if(tx_en_i == 1'b0) begin
                udp_sourcePort       <= 16'h0;
                udp_destinationPort  <= 16'h0;
                udp_length           <= 16'h0;
                udp_chksum           <= 16'h0;
            end
        end
    end

    //++
    //calculate udp check sum, only ptp event message need this
    //message length of ptp event message is always times of 2 octets.
    //udp_checksum = ~(c+m) -->~udp_checksum+(~c) = m;
    //--
    wire   [31:0] sum_p1;
    reg    [31:0] sum;
    reg    [16:0] addend;
    reg           add_valid;
    reg           add_toggle;
    reg    [7:0]  txd_z1;

    reg    [16:0] c_p1_reg;
    wire   [15:0] c_p1;
    wire   [15:0] c_p1_inv;
    wire   [15:0] udp_chksum_inv;
    wire   [16:0] m_temp_sum;
    wire   [15:0] chksum_pad_p1;
    
    always @(posedge tx_clk or negedge tx_rst_n) begin
        if(!tx_rst_n)
            txd_z1 <= 8'h0;
        else if(tx_clk_en_i)
            txd_z1 <= txd_i;
    end

    always @(*) begin
        addend    = 17'h0;
        
        //next header and zeros (omit 16 bits zeros)
        if(eth_count_i == ipv6_addr_base_i+6)  
            addend = {9'h0, txd_i};
        
        //source address and destination address, udp source port and destinaton port
        if(eth_count_i >= (ipv6_addr_base_i+8) && eth_count_i <= (ipv6_addr_base_i+43)) 
            addend = {1'b0, txd_z1, txd_i};

        //udp length, repeat two times
        if(eth_count_i == (ipv6_addr_base_i+45)) 
            addend = {txd_z1, txd_i, 1'b0};

        //udp check sum, set to zero
        if(eth_count_i == (ipv6_addr_base_i+47)) 
            addend = 17'h0;

        //udp data, until reach the udp padding octets
        if(eth_count_i >= ptp_addr_base_i && eth_count_i < (ptp_addr_base_i+ptp_messageLength_i[10:0])) 
            addend = {1'b0, txd_z1, txd_i};
    end

    always @(posedge tx_clk or negedge tx_rst_n) begin
        if(!tx_rst_n)
            add_toggle <= 0;
        else if(tx_clk_en_i) begin
            if(eth_count_i <= (ipv6_addr_base_i+7))
                add_toggle <= 0;
            else if(chksum_calc_en == 1'b1 && tx_en_i == 1'b1)
                add_toggle <= ~add_toggle;
            else if(tx_en_i == 1'b0)
                add_toggle <= 0;
        end
    end

    always @(*) begin
        add_valid = 0;

        //next header and zeros (omit 16 bits)
        if(eth_count_i == ipv6_addr_base_i+6)  
            add_valid = tx_en_i;
        
        //source address and destination address, udp source port and destinaton port
        if(eth_count_i >= (ipv6_addr_base_i+8) && eth_count_i <= (ipv6_addr_base_i+43)) 
            add_valid = (tx_en_i & add_toggle);

        //udp length, repeat two times
        if(eth_count_i == (ipv6_addr_base_i+45)) 
            add_valid = (tx_en_i & add_toggle);

        //udp check sum, set to zero
        if(eth_count_i == (ipv6_addr_base_i+47)) 
            add_valid = (tx_en_i & add_toggle);

        //udp data, until reach the udp padding octets
        if(eth_count_i >= ptp_addr_base_i && eth_count_i < (ptp_addr_base_i+ptp_messageLength_i[10:0])) 
            add_valid = (tx_en_i & add_toggle);
    end

    assign sum_p1 = sum + {15'h0, addend};

    always @(posedge tx_clk or negedge tx_rst_n) begin
        if(!tx_rst_n) 
            sum <= 32'h0;
        else if(tx_clk_en_i) begin
            if(add_valid == 1'b1 && tx_en_i == 1'b1)
                sum <= sum_p1;
            else if(tx_en_i == 1'b0) 
                sum <= 32'h0;
        end
    end

    //compute checksum padding octets, one's complement
    always @(posedge tx_clk or negedge tx_rst_n) begin
        if(!tx_rst_n) 
            c_p1_reg <= 17'h0;
        else if(tx_clk_en_i) begin
            if(add_valid == 1'b1 && tx_en_i == 1'b1)
                c_p1_reg <= {1'b0, sum_p1[31:16]} + {1'b0, sum_p1[15:0]};
            else if(tx_en_i == 1'b0) 
                c_p1_reg <= 17'h0;
        end
    end

    //c_p1[15:0] = sum[31:16] + sum[15:0];
    assign c_p1[15:0] = c_p1_reg[15:0] + {15'b0, c_p1_reg[16]};
    assign c_p1_inv[15:0] = ~c_p1[15:0];

    assign udp_chksum_inv[15:0] = ~udp_chksum[15:0];
    assign m_temp_sum[16:0] = {1'b0, udp_chksum_inv[15:0]} + {1'b0, c_p1_inv[15:0]};
    assign chksum_pad_p1[15:0] = m_temp_sum[15:0] + {15'b0, m_temp_sum[16]};

    always @(posedge tx_clk or negedge tx_rst_n) begin
        if(!tx_rst_n) 
            chksum_pad_o <= 16'h0;
        else if(tx_clk_en_i) begin
            if(tx_en_i == 1'b1)
                chksum_pad_o <= chksum_pad_p1;
            else if(tx_en_i == 1'b0)
                chksum_pad_o <= 16'h0;
        end
    end

    //base address of ipv6 udp padding octets 
    always @(posedge tx_clk or negedge tx_rst_n) begin
        if(!tx_rst_n)
            chkpad_addr_base_o <= 11'h0;
        else if(tx_clk_en_i) begin
            if(chksum_calc_en == 1'b1)
                chkpad_addr_base_o <= ptp_addr_base_i + ptp_messageLength_i[10:0];
            else
                chkpad_addr_base_o <= 11'h0;
        end
    end

    //change flag of padding octets
    always @(posedge tx_clk or negedge tx_rst_n) begin
        if(!tx_rst_n)
            ipv6_padchg_flag_o <= 0;
        else if(tx_clk_en_i) begin
            if(chksum_calc_en == 1'b1 && is_ptp_message_i == 1'b1 && ptp_messageType_i[3] == 1'b0)
                ipv6_padchg_flag_o <= 1;
            else
                ipv6_padchg_flag_o <= 0;
        end
    end

endmodule  

