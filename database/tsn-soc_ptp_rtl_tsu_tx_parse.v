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
 * tx frame parsing
-*/

`include "ptpv2_defines.v"

module tx_parse(
    //gmii interface
    input               tx_clk,
    input               tx_rst_n,
    input               tx_clk_en_i,            //for adapting to mii

    input               tx_en_i, 
    input               tx_er_i,
    input  [7:0]        txd_i  ,  

    //signals to tx_emb_ts
    output              tx_en_o,
    output              tx_er_o,
    output [7:0]        txd_o  ,

    output  [10:0]      ptp_addr_base_o,
    output  [3:0]       ptp_messageType_o,          
    output  [63:0]      ptp_correctionField_o,
    output  [31:0]      ptp_messageTypeSpecific_o,
    output              is_ptp_message_o,  
    output  [15:0]      ptp_messageLength_o,
    output  [15:0]      ptp_flagField_o, 

    output              ipv6_flag_o,
    output  [10:0]      ipv6_addr_base_o,
    output              ipv4_flag_o,
    output  [10:0]      ipv4_addr_base_o,

    //configuration register i/f
    input  [31:0]       tsu_cfg_i,
    
    //timestamp i/f, sync to rtc_clk
    output reg          txts_trig_o,
    output reg          txts_valid_o,
    
    output reg [79:0]   tx_sourcePortIdentity_o,  
    output reg [15:0]   tx_flagField_o,
    output reg [15:0]   tx_seqId_o,                 
    output reg [3:0]    tx_versionPTP_o,
    output reg [3:0]    tx_minorVersionPTP_o,
    output reg [3:0]    tx_messageType_o,  
    output reg [3:0]    tx_majorSdoId_o,

    //ptpv2 tx interrupt signal 
    output reg          int_tx_ptp_o
);
    reg  [10:0]         eth_count;

    //++
    //detect start of frame 
    //--
    wire                get_sfd_done_p1;
    reg                 get_sfd_done;

    assign  get_sfd_done_p1 = (txd_i[7:0] == `SFD);

    always @(posedge tx_clk or negedge tx_rst_n) begin
        if(!tx_rst_n)
            get_sfd_done <= 0;
        else if(tx_clk_en_i) begin
            if(tx_en_i == 1'b1 && get_sfd_done_p1 == 1'b1)
                get_sfd_done <= 1;
            else if(tx_en_i == 1'b0)
                get_sfd_done <= 0;
        end
    end

    always @(posedge tx_clk or negedge tx_rst_n) begin
        if(!tx_rst_n)
            eth_count  <=  11'd0;
        else if(tx_clk_en_i) begin
            if(tx_en_i == 1'b1 && get_sfd_done_p1 == 1'b1 && get_sfd_done == 1'b0)  
                eth_count  <=  11'd8;
            else if(tx_en_i == 1'b1 && get_sfd_done == 1'b1)
                eth_count  <=  eth_count + 1;
            else if(tx_en_i == 1'b0)
                eth_count  <=  11'd0;
        end
    end

    always @(posedge tx_clk or negedge tx_rst_n) begin
        if(!tx_rst_n)
            txts_trig_o <= 0;
        else if(tx_clk_en_i)
            txts_trig_o <= (tx_en_i == 1'b1 && get_sfd_done_p1 == 1'b1 && get_sfd_done == 1'b0);
    end

    //++
    //parse layer 2 ethernet header
    //--
    reg  [47:0]      mac_da;
    reg  [47:0]      mac_sa;
    reg  [15:0]      length_type;
    reg  [15:0]      vlan1_length_type;
    reg  [15:0]      vlan2_length_type;

    always @(posedge tx_clk or negedge tx_rst_n) begin
        if(!tx_rst_n) begin
            mac_da              <= 48'h0;
            mac_sa              <= 48'h0;
            length_type         <= 16'h0;   
            vlan1_length_type   <= 16'h0;
            vlan2_length_type   <= 16'h0;      
        end
        else if(tx_clk_en_i) begin  
            if(tx_en_i == 1'b1 && tx_er_i == 1'b0 && get_sfd_done == 1'b1) begin
                if(eth_count == 11'd8)   mac_da[47:40]     <= txd_i;
                if(eth_count == 11'd9)   mac_da[39:32]     <= txd_i;        
                if(eth_count == 11'd10)  mac_da[31:24]     <= txd_i;        
                if(eth_count == 11'd11)  mac_da[23:16]     <= txd_i;        
                if(eth_count == 11'd12)  mac_da[15:8]      <= txd_i;        
                if(eth_count == 11'd13)  mac_da[7:0]       <= txd_i; 

                if(eth_count == 11'd14)  mac_sa[47:40]     <= txd_i;
                if(eth_count == 11'd15)  mac_sa[39:32]     <= txd_i;        
                if(eth_count == 11'd16)  mac_sa[31:24]     <= txd_i;        
                if(eth_count == 11'd17)  mac_sa[23:16]     <= txd_i;        
                if(eth_count == 11'd18)  mac_sa[15:8]      <= txd_i;        
                if(eth_count == 11'd19)  mac_sa[7:0]       <= txd_i;          
                  
                if(eth_count == 11'd20)  length_type[15:8] <= txd_i;
                if(eth_count == 11'd21)  length_type[7:0]  <= txd_i; 
                
                if(eth_count == 11'd24)  vlan1_length_type[15:8] <= txd_i;
                if(eth_count == 11'd25)  vlan1_length_type[7:0]  <= txd_i; 
                  
                if(eth_count == 11'd28)  vlan2_length_type[15:8] <= txd_i;
                if(eth_count == 11'd29)  vlan2_length_type[7:0]  <= txd_i;                    
            end 
            else if(tx_en_i == 1'b0) begin
                mac_da            <= 48'h0;
                mac_sa            <= 48'h0;
                length_type       <= 16'h0;   
                vlan1_length_type <= 16'h0;
                vlan2_length_type <= 16'h0;              
            end     
        end  
    end

    //get pppoe information-ppp_id
    reg  [15:0]         ppp_pid;

    always @(posedge tx_clk or negedge tx_rst_n) begin
        if(!tx_rst_n)
            ppp_pid  <= 16'h0;
        else if(tx_clk_en_i) begin
            if(tx_en_i == 1'b1 && tx_er_i == 1'b0 && get_sfd_done == 1'b1) begin
                if(length_type == 16'h8864) begin      //no vlan
                    if(eth_count == 11'd28) ppp_pid[15:8]  <= txd_i;
                    if(eth_count == 11'd29) ppp_pid[7:0]   <= txd_i;
                end
                else if(length_type == 16'h8100 && vlan1_length_type == 16'h8864) begin     //single vlan
                    if(eth_count == 11'd32) ppp_pid[15:8]  <= txd_i;
                    if(eth_count == 11'd33) ppp_pid[7:0]   <= txd_i;
                end 
                else if((length_type == 16'h88a8 || length_type == 16'h9100 || length_type == 16'h9200 
                    || length_type == 16'h9300 || length_type == 16'h8100)
                    && vlan1_length_type == 16'h8100 && vlan2_length_type == 16'h8864) begin //double vlan
                    if(eth_count == 11'd36) ppp_pid[15:8]  <= txd_i;
                    if(eth_count == 11'd37) ppp_pid[7:0]   <= txd_i;     
                end 
            end 
            else if(tx_en_i == 1'b0)
                ppp_pid  <= 16'h0; 
        end    
    end  

    //get snap related attributes
    reg  [7:0]      snap_dsap;
    reg  [7:0]      snap_ssap;
    reg  [15:0]     snap_length_type;

    always @(posedge tx_clk or negedge tx_rst_n) begin
        if(!tx_rst_n) begin
            snap_dsap        <= 8'h0;       
            snap_ssap        <= 8'h0;       
            snap_length_type <= 16'h0;
        end
        else if(tx_clk_en_i) begin
            if(tx_en_i == 1'b1 && tx_er_i == 1'b0 && get_sfd_done == 1'b1) begin
                if(length_type <= 1500) begin          //no vlan
                    if(eth_count == 11'd22)  snap_dsap <= txd_i;
                    if(eth_count == 11'd23)  snap_ssap <= txd_i;
                    if(eth_count == 11'd28)  snap_length_type[15:8] <= txd_i;
                    if(eth_count == 11'd29)  snap_length_type[7:0]  <= txd_i;
                end 
                else if(length_type == 16'h8100 && vlan1_length_type <= 1500) begin     //single vlan
                    if(eth_count == 11'd26)  snap_dsap <= txd_i;                        
                    if(eth_count == 11'd27)  snap_ssap <= txd_i;                        
                    if(eth_count == 11'd32)  snap_length_type[15:8] <= txd_i;           
                    if(eth_count == 11'd33)  snap_length_type[7:0]  <= txd_i;           
                end  
                else if((length_type == 16'h88a8 || length_type == 16'h9100 || length_type == 16'h9200 
                    || length_type == 16'h9300 || length_type == 16'h8100)
                    && vlan1_length_type == 16'h8100 && vlan2_length_type <= 1500) begin //double  vlan 
                    if(eth_count == 11'd30)  snap_dsap <= txd_i;                        
                    if(eth_count == 11'd31)  snap_ssap <= txd_i;                        
                    if(eth_count == 11'd36)  snap_length_type[15:8] <= txd_i;           
                    if(eth_count == 11'd37)  snap_length_type[7:0]  <= txd_i;            
                end 
            end 
            else if(tx_en_i == 1'b0) begin
                snap_dsap        <= 8'h0;       
                snap_ssap        <= 8'h0;       
                snap_length_type <= 16'h0;
            end
        end
    end

    //++
    //get ptpv2 related information
    //--

    //deal with ptp message over 802.3/ethernet
    reg            ptp_eth_flag;
    reg  [10:0]    eth_ptp_addr_base;

    always @(*) begin
        //default values
        ptp_eth_flag      = 0;
        eth_ptp_addr_base = 0;
     
        //native_ethernet-2 encapsulation
        if(length_type == 16'h88f7) begin  //no vlan
            ptp_eth_flag      = 1;
            eth_ptp_addr_base = 22;
        end
        else if(length_type == 16'h8100 && vlan1_length_type == 16'h88f7) begin   //single vlan
            ptp_eth_flag      = 1;
            eth_ptp_addr_base = 26;
        end 
        else if((length_type == 16'h88a8 || length_type == 16'h9100 || length_type == 16'h9200 || length_type == 16'h9300 
          || length_type == 16'h8100) && vlan1_length_type == 16'h8100 && vlan2_length_type == 16'h88f7) begin //double vlan
            ptp_eth_flag      = 1;
            eth_ptp_addr_base = 30;       
        end

        //802.3 snap layer2 encapsulation
        if(length_type <= 1500 && snap_dsap == 8'haa && snap_ssap == 8'haa && snap_length_type == 16'h88f7) begin      //no vlan
            ptp_eth_flag      = 1;
            eth_ptp_addr_base = 30;
        end
        else if(length_type == 16'h8100 && vlan1_length_type <= 1500 && snap_dsap == 8'haa && snap_ssap == 8'haa 
          && snap_length_type == 16'h88f7) begin    //single vlan
            ptp_eth_flag      = 1;
            eth_ptp_addr_base = 34;   
        end 
        else if((length_type == 16'h88a8 || length_type == 16'h9100 || length_type == 16'h9200 || length_type == 16'h9300 
          || length_type == 16'h8100) && vlan1_length_type == 16'h8100 && vlan2_length_type <=1500 && snap_dsap == 8'haa 
          && snap_ssap == 8'haa && snap_length_type == 16'h88f7) begin //double vlan
            ptp_eth_flag      = 1;
            eth_ptp_addr_base = 38;   
        end        
    end

    //deal with ptp message over ipv4/udp
    reg          ipv4_flag;
    reg  [10:0]  ipv4_addr_base;
    
    always @(*) begin
        //default values
        ipv4_flag      = 0;
        ipv4_addr_base = 0;
        
        //normal situation
        if(length_type == 16'h0800) begin      //no vlan
            ipv4_flag      = 1;
            ipv4_addr_base = 22;
        end
        else if(length_type == 16'h8100 && vlan1_length_type == 16'h0800) begin   //single vlan
            ipv4_flag      = 1;
            ipv4_addr_base = 26;   
        end 
        else if((length_type == 16'h88a8 || length_type == 16'h9100 || length_type == 16'h9200 || length_type == 16'h9300 
          || length_type == 16'h8100) && vlan1_length_type == 16'h8100 && vlan2_length_type == 16'h0800) begin //double vlan
            ipv4_flag      = 1;
            ipv4_addr_base = 30;   
        end
        
        //pppoe
        if(length_type == 16'h8864 && ppp_pid == 16'h0021) begin      //no vlan
            ipv4_flag      = 1;
            ipv4_addr_base = 30;
        end
        else if(length_type == 16'h8100 && vlan1_length_type == 16'h8864 && ppp_pid == 16'h0021) begin    //single vlan
            ipv4_flag      = 1;
            ipv4_addr_base = 34;   
        end 
        else if((length_type == 16'h88a8 || length_type == 16'h9100 || length_type == 16'h9200 || length_type == 16'h9300 
         ||length_type == 16'h8100) && vlan1_length_type == 16'h8100 
         && vlan2_length_type == 16'h8864 && ppp_pid == 16'h0021) begin //double vlan
            ipv4_flag      = 1;
            ipv4_addr_base = 38;   
        end  
        
        //snap
        if(length_type <= 1500 && snap_dsap == 8'haa && snap_ssap == 8'haa && snap_length_type == 16'h0800) begin //no vlan
            ipv4_flag      = 1;
            ipv4_addr_base = 30;
        end
        else if(length_type == 16'h8100 && vlan1_length_type <= 1500 && snap_dsap == 8'haa && snap_ssap == 8'haa 
          && snap_length_type == 16'h0800) begin    //single vlan
            ipv4_flag      = 1;
            ipv4_addr_base = 34;   
        end 
        else if((length_type == 16'h88a8 || length_type == 16'h9100 || length_type == 16'h9200 || length_type == 16'h9300 
          || length_type == 16'h8100) && vlan1_length_type == 16'h8100 && vlan2_length_type <=1500 && snap_dsap == 8'haa 
          && snap_ssap == 8'haa && snap_length_type == 16'h0800) begin //double vlan
            ipv4_flag      = 1;
            ipv4_addr_base = 38;   
        end        
    end

    //register latch
    reg          ipv4_flag_z1;
    reg  [10:0]  ipv4_addr_base_z1;

    always @(posedge tx_clk or negedge tx_rst_n) begin
        if(!tx_rst_n) begin
            ipv4_flag_z1      <= 0;
            ipv4_addr_base_z1 <= 11'h0;
        end
        else if(tx_clk_en_i) begin
            ipv4_flag_z1      <= ipv4_flag;
            ipv4_addr_base_z1 <= ipv4_addr_base;
        end
    end

    //parse ipv4/udp header
    reg  [31:0]         ipv4_da;
    reg  [7:0]          ipv4_layer4_protocol;
    reg  [15:0]         ipv4_udp_port;

    always @(posedge tx_clk or negedge tx_rst_n) begin
        if(!tx_rst_n) begin
            ipv4_da              <= 32'h0;
            ipv4_layer4_protocol <= 8'h0;
            ipv4_udp_port        <= 16'h0;      
        end
        else if(tx_clk_en_i) begin
            if(ipv4_flag_z1 == 1'b1) begin
                if(eth_count == (ipv4_addr_base_z1+9))   ipv4_layer4_protocol <= txd_i;
                  
                if(eth_count == (ipv4_addr_base_z1+16))  ipv4_da[31:24]       <= txd_i;
                if(eth_count == (ipv4_addr_base_z1+17))  ipv4_da[23:16]       <= txd_i;
                if(eth_count == (ipv4_addr_base_z1+18))  ipv4_da[15:8]        <= txd_i;
                if(eth_count == (ipv4_addr_base_z1+19))  ipv4_da[7:0]         <= txd_i;   
                
                if(eth_count == (ipv4_addr_base_z1+22))  ipv4_udp_port[15:8]  <= txd_i;
                if(eth_count == (ipv4_addr_base_z1+23))  ipv4_udp_port[7:0]   <= txd_i;   
            end
            else begin
                ipv4_da              <= 32'h0;
                ipv4_layer4_protocol <= 8'h0;
                ipv4_udp_port        <= 16'h0;            
            end
        end
    end

    reg             ptp_ipv4_flag;
    reg  [10:0]     ipv4_ptp_addr_base;

    always @(*) begin
        ptp_ipv4_flag      = 0;
        ipv4_ptp_addr_base = 0;
        
        if(ipv4_flag == 1'b1 && ipv4_layer4_protocol == 8'd17 && (ipv4_udp_port == 16'd319 || ipv4_udp_port == 16'd320)) begin
            ptp_ipv4_flag      = 1;
            ipv4_ptp_addr_base = ipv4_addr_base + 28;
        end  
    end

    //deal with ptp message over ipv6/udp
    reg          ipv6_flag;
    reg  [10:0]  ipv6_addr_base;
    
    always @(*) begin
        //default values
        ipv6_flag       = 0;
        ipv6_addr_base  = 0;
        
        //normal situation
        if(length_type == 16'h86dd) begin      //no vlan
            ipv6_flag      = 1;
            ipv6_addr_base = 22;
        end
        else if(length_type == 16'h8100 && vlan1_length_type == 16'h86dd) begin   //single vlan
            ipv6_flag      = 1;
            ipv6_addr_base = 26;   
        end 
        else if((length_type == 16'h88a8 || length_type == 16'h9100 || length_type == 16'h9200 || length_type == 16'h9300 
          || length_type == 16'h8100) && vlan1_length_type == 16'h8100 && vlan2_length_type == 16'h86dd) begin //double vlan
            ipv6_flag      = 1;
            ipv6_addr_base = 30;   
        end
        
        //pppoe
        if(length_type == 16'h8864 && ppp_pid == 16'h0057) begin      //no vlan
            ipv6_flag      = 1;
            ipv6_addr_base = 30;
        end
        else if(length_type == 16'h8100 && vlan1_length_type == 16'h8864 && ppp_pid == 16'h0057) begin    //single vlan
            ipv6_flag      = 1;
            ipv6_addr_base = 34;   
        end 
        else if((length_type == 16'h88a8 || length_type == 16'h9100 || length_type == 16'h9200 || length_type == 16'h9300 
         || length_type == 16'h8100) && vlan1_length_type == 16'h8100 
         && vlan2_length_type == 16'h8864 && ppp_pid == 16'h0057) begin //double vlan
            ipv6_flag      = 1;
            ipv6_addr_base = 38;   
        end  
        
        //snap
        if(length_type <= 1500 && snap_dsap == 8'haa && snap_ssap == 8'haa && snap_length_type == 16'h86dd) begin   //no vlan
            ipv6_flag      = 1;
            ipv6_addr_base = 30;
        end
        else if(length_type == 16'h8100 && vlan1_length_type <= 1500 && snap_dsap == 8'haa && snap_ssap == 8'haa 
          && snap_length_type == 16'h86dd) begin    //single vlan
            ipv6_flag      = 1;
            ipv6_addr_base = 34;   
        end 
        else if((length_type == 16'h88a8 || length_type == 16'h9100 || length_type == 16'h9200 || length_type == 16'h9300 
          || length_type == 16'h8100) && vlan1_length_type == 16'h8100 && vlan2_length_type <=1500 && snap_dsap == 8'haa 
          && snap_ssap == 8'haa && snap_length_type == 16'h86dd) begin  //double vlan
            ipv6_flag      = 1;
            ipv6_addr_base = 38;   
        end       
    end    

    //register latch
    reg          ipv6_flag_z1;
    reg  [10:0]  ipv6_addr_base_z1;

    always @(posedge tx_clk or negedge tx_rst_n) begin
        if(!tx_rst_n) begin
            ipv6_flag_z1      <= 0;
            ipv6_addr_base_z1 <= 11'h0;
        end
        else if(tx_clk_en_i) begin
            ipv6_flag_z1      <= ipv6_flag;
            ipv6_addr_base_z1 <= ipv6_addr_base;
        end
    end

    //parse ipv6/udp header
    reg  [127:0]    ipv6_da;  
    reg  [7:0]      ipv6_next_header;
    reg  [15:0]     ipv6_udp_port;

    always @(posedge tx_clk or negedge tx_rst_n) begin
        if(!tx_rst_n) begin
            ipv6_da              <= 128'h0;
            ipv6_next_header     <= 8'h0;
            ipv6_udp_port        <= 16'h0;      
        end
        else if(tx_clk_en_i) begin
            if(ipv6_flag_z1 == 1'b1) begin
                if(eth_count == (ipv6_addr_base_z1+6))   ipv6_next_header    <= txd_i;
                                                            
                if(eth_count == (ipv6_addr_base_z1+24))  ipv6_da[127:120]    <= txd_i;                           
                if(eth_count == (ipv6_addr_base_z1+25))  ipv6_da[119:112]    <= txd_i;                           
                if(eth_count == (ipv6_addr_base_z1+26))  ipv6_da[111:104]    <= txd_i;                           
                if(eth_count == (ipv6_addr_base_z1+27))  ipv6_da[103:96]     <= txd_i;                           
                if(eth_count == (ipv6_addr_base_z1+28))  ipv6_da[95:88]      <= txd_i;                           
                if(eth_count == (ipv6_addr_base_z1+29))  ipv6_da[87:80]      <= txd_i;                           
                if(eth_count == (ipv6_addr_base_z1+30))  ipv6_da[79:72]      <= txd_i;                           
                if(eth_count == (ipv6_addr_base_z1+31))  ipv6_da[71:64]      <= txd_i;          
                if(eth_count == (ipv6_addr_base_z1+32))  ipv6_da[63:56]      <= txd_i;                           
                if(eth_count == (ipv6_addr_base_z1+33))  ipv6_da[55:48]      <= txd_i;                           
                if(eth_count == (ipv6_addr_base_z1+34))  ipv6_da[47:40]      <= txd_i;                           
                if(eth_count == (ipv6_addr_base_z1+35))  ipv6_da[39:32]      <= txd_i;          
                if(eth_count == (ipv6_addr_base_z1+36))  ipv6_da[31:24]      <= txd_i;                           
                if(eth_count == (ipv6_addr_base_z1+37))  ipv6_da[23:16]      <= txd_i;                           
                if(eth_count == (ipv6_addr_base_z1+38))  ipv6_da[15:8]       <= txd_i;                           
                if(eth_count == (ipv6_addr_base_z1+39))  ipv6_da[7:0]        <= txd_i;          
                                                                                                                                 
                if(eth_count == (ipv6_addr_base_z1+42))  ipv6_udp_port[15:8] <= txd_i;                           
                if(eth_count == (ipv6_addr_base_z1+43))  ipv6_udp_port[7:0]  <= txd_i;    
            end
            else begin
                ipv6_da              <= 128'h0;
                ipv6_next_header     <= 8'h0;
                ipv6_udp_port        <= 16'h0;            
            end
        end
    end  

    reg            ptp_ipv6_flag; 
    reg  [10:0]    ipv6_ptp_addr_base; 

    always @(*) begin
        ptp_ipv6_flag       = 0;
        ipv6_ptp_addr_base  = 0;
        
        if(ipv6_flag == 1'b1 && ipv6_next_header == 8'd17 && (ipv6_udp_port == 16'd319 || ipv6_udp_port == 16'd320)) begin
            ptp_ipv6_flag      = 1;
            ipv6_ptp_addr_base = ipv6_addr_base + 48;
        end  
    end

    //summary all cases, ptp over 802.3/ethernet, ipv4/udp, ipv6/udp
    reg                 is_ptp_message;
    reg  [10:0]         ptp_addr_base;  
    reg                 is_ptp_message_z1;
    reg  [10:0]         ptp_addr_base_z1;

    always @(*) begin
        is_ptp_message  = 0;
        ptp_addr_base   = 11'h80;   //initialize to a large value intentionally
        
        if(ptp_eth_flag == 1'b1) begin
            is_ptp_message = 1;
            ptp_addr_base  = eth_ptp_addr_base;
        end
        else if(ptp_ipv4_flag == 1'b1) begin
            is_ptp_message = 1;
            ptp_addr_base  = ipv4_ptp_addr_base; 
        end
        else if(ptp_ipv6_flag == 1'b1) begin
            is_ptp_message = 1;
            ptp_addr_base  = ipv6_ptp_addr_base;
        end  
    end
  
    //register latch
    always @(posedge tx_clk or negedge tx_rst_n) begin
        if(!tx_rst_n) begin
            is_ptp_message_z1  <= 0 ;
            ptp_addr_base_z1   <= 11'h0  ;
        end
        else if(tx_clk_en_i) begin
            is_ptp_message_z1  <= is_ptp_message ;
            ptp_addr_base_z1   <= ptp_addr_base  ;
        end
    end

    //deal with ptp messages, according to ieee1588-2019
    reg  [3:0]      ptp_majorSdoId;
    reg  [3:0]      ptp_messageType;
    reg  [3:0]      ptp_minorVersionPTP;
    reg  [3:0]      ptp_versionPTP;
    reg  [15:0]     ptp_messageLength;
    reg  [7:0]      ptp_domainNumber;
    reg  [7:0]      ptp_minorSdoId;
    reg  [15:0]     ptp_flagField;
    reg  [63:0]     ptp_correctionField;
    reg  [31:0]     ptp_messageTypeSpecific;
    reg  [79:0]     ptp_sourcePortIdentity; 
    reg  [15:0]     ptp_seqId;

    always @(posedge tx_clk or negedge tx_rst_n) begin
        if(!tx_rst_n) begin
            ptp_minorVersionPTP     <= 0;
            ptp_versionPTP          <= 0;
            ptp_messageLength       <= 0;
            ptp_domainNumber        <= 0;
            ptp_minorSdoId          <= 0;
            ptp_flagField           <= 0;
            ptp_correctionField     <= 0;
            ptp_messageTypeSpecific <= 0;
            ptp_sourcePortIdentity  <= 0;
            ptp_seqId               <= 0;
        end
        else if(tx_clk_en_i) begin
            if(tx_en_i && (!tx_er_i) && is_ptp_message == 1'b1) begin
                if(eth_count == (ptp_addr_base_z1+1))   {ptp_minorVersionPTP, ptp_versionPTP} <= txd_i;
                  
                if(eth_count == (ptp_addr_base_z1+2))   ptp_messageLength[15:8]  <= txd_i;
                if(eth_count == (ptp_addr_base_z1+3))   ptp_messageLength[7:0]   <= txd_i;
                if(eth_count == (ptp_addr_base_z1+4))   ptp_domainNumber <= txd_i;
                if(eth_count == (ptp_addr_base_z1+5))   ptp_minorSdoId   <= txd_i;
  
                if(eth_count == (ptp_addr_base_z1+6))   ptp_flagField[15:8] <= txd_i;
                if(eth_count == (ptp_addr_base_z1+7))   ptp_flagField[7:0]  <= txd_i;

                if(eth_count == (ptp_addr_base_z1+8))   ptp_correctionField[63:56] <= txd_i;
                if(eth_count == (ptp_addr_base_z1+9))   ptp_correctionField[55:48] <= txd_i;
                if(eth_count == (ptp_addr_base_z1+10))  ptp_correctionField[47:40] <= txd_i;
                if(eth_count == (ptp_addr_base_z1+11))  ptp_correctionField[39:32] <= txd_i;
                if(eth_count == (ptp_addr_base_z1+12))  ptp_correctionField[31:24] <= txd_i;
                if(eth_count == (ptp_addr_base_z1+13))  ptp_correctionField[23:16] <= txd_i;
                if(eth_count == (ptp_addr_base_z1+14))  ptp_correctionField[15:8]  <= txd_i;
                if(eth_count == (ptp_addr_base_z1+15))  ptp_correctionField[7:0]   <= txd_i;

                if(eth_count == (ptp_addr_base_z1+16))  ptp_messageTypeSpecific[31:24] <= txd_i;
                if(eth_count == (ptp_addr_base_z1+17))  ptp_messageTypeSpecific[23:16] <= txd_i;
                if(eth_count == (ptp_addr_base_z1+18))  ptp_messageTypeSpecific[15:8]  <= txd_i;
                if(eth_count == (ptp_addr_base_z1+19))  ptp_messageTypeSpecific[7:0]   <= txd_i;
       
                if(eth_count == (ptp_addr_base_z1+20))  ptp_sourcePortIdentity[79:72] <= txd_i;
                if(eth_count == (ptp_addr_base_z1+21))  ptp_sourcePortIdentity[71:64] <= txd_i;
                if(eth_count == (ptp_addr_base_z1+22))  ptp_sourcePortIdentity[63:56] <= txd_i;
                if(eth_count == (ptp_addr_base_z1+23))  ptp_sourcePortIdentity[55:48] <= txd_i;          
                if(eth_count == (ptp_addr_base_z1+24))  ptp_sourcePortIdentity[47:40] <= txd_i;
                if(eth_count == (ptp_addr_base_z1+25))  ptp_sourcePortIdentity[39:32] <= txd_i;
                if(eth_count == (ptp_addr_base_z1+26))  ptp_sourcePortIdentity[31:24] <= txd_i;
                if(eth_count == (ptp_addr_base_z1+27))  ptp_sourcePortIdentity[23:16] <= txd_i;      
                if(eth_count == (ptp_addr_base_z1+28))  ptp_sourcePortIdentity[15:8]  <= txd_i;
                if(eth_count == (ptp_addr_base_z1+29))  ptp_sourcePortIdentity[7:0]   <= txd_i;   
                  
                if(eth_count == (ptp_addr_base_z1+30))  ptp_seqId[15:8] <= txd_i;
                if(eth_count == (ptp_addr_base_z1+31))  ptp_seqId[7:0]  <= txd_i; 
            end
            else if(eth_count == 0 && tx_en_i == 1'b1) begin  //start of the next frame
                ptp_minorVersionPTP     <= 0;
                ptp_versionPTP          <= 0;
                ptp_messageLength       <= 0;
                ptp_domainNumber        <= 0;
                ptp_minorSdoId          <= 0;
                ptp_flagField           <= 0;
                ptp_correctionField     <= 0;
                ptp_messageTypeSpecific <= 0;
                ptp_sourcePortIdentity  <= 0;
                ptp_seqId               <= 0;
            end
        end
    end

    //for solving timing problem
    //deal with the first octet (messageType) field independently.
    always @(posedge tx_clk or negedge tx_rst_n) begin
        if(!tx_rst_n)
            {ptp_majorSdoId, ptp_messageType} <= 8'h0f;
        else if(tx_clk_en_i) begin
            if(tx_en_i && (!tx_er_i)) begin
              if(ptp_eth_flag == 1'b1 && eth_count == eth_ptp_addr_base)
                  {ptp_majorSdoId, ptp_messageType} <= txd_i;
              else if(is_ptp_message == 1'b1 && eth_count == ptp_addr_base_z1)  
                  {ptp_majorSdoId, ptp_messageType} <= txd_i;  
              else if(eth_count == 0)
                  {ptp_majorSdoId, ptp_messageType} <= 8'h0f;
            end
        end
    end

    //check ptp version or address matched or not
    reg   ptp_version_match;
    wire  ptp_ver_chk_en   = tsu_cfg_i[21];
    wire [3:0] ptp_version_cfg = tsu_cfg_i[20:17]; 

    always @(posedge tx_clk or negedge tx_rst_n) begin
        if(!tx_rst_n)
            ptp_version_match <= 0;
        else if(tx_clk_en_i) begin
            if(ptp_ver_chk_en == 1'b0)
                ptp_version_match <= 1;
            else if(eth_count == 0 && tx_en_i == 1'b1)   //start of the next frame.
                ptp_version_match <= 0;
            else if((ptp_versionPTP[3:0] == ptp_version_cfg[3:0]) && (eth_count > (ptp_addr_base_z1+2)))
                ptp_version_match <= 1;
        end
    end

    //generate ptpv2 identification outputs 
    always @(posedge tx_clk or negedge tx_rst_n) begin
        if(!tx_rst_n) begin
            txts_valid_o <= 0;
    
            tx_sourcePortIdentity_o <= 0;  
            tx_flagField_o          <= 0;
            tx_seqId_o              <= 0;                 
            tx_versionPTP_o         <= 0;
            tx_minorVersionPTP_o    <= 0;
            tx_messageType_o        <= 4'hf;  
            tx_majorSdoId_o         <= 0;
        end
        else if(tx_clk_en_i) begin
            if(ptp_messageType[3] == 1'b0 && ptp_version_match == 1'b1) begin //event message
                if(is_ptp_message_z1 == 1'b1 && eth_count == (ptp_addr_base_z1+32))  
                    txts_valid_o <= 1;
                else if(eth_count == 11'd0)
                    txts_valid_o <= 0;

                tx_sourcePortIdentity_o <= ptp_sourcePortIdentity;  
                tx_flagField_o          <= ptp_flagField         ;
                tx_seqId_o              <= ptp_seqId             ;                 
                tx_versionPTP_o         <= ptp_versionPTP        ;
                tx_minorVersionPTP_o    <= ptp_minorVersionPTP   ;
                tx_messageType_o        <= ptp_messageType       ;  
                tx_majorSdoId_o         <= ptp_majorSdoId        ;
            end
            else begin
                txts_valid_o <= 0;
        
                if(tx_en_i == 1'b1 && eth_count == 0) begin
                  tx_sourcePortIdentity_o <= 0;  
                  tx_flagField_o          <= 0;
                  tx_seqId_o              <= 0;                 
                  tx_versionPTP_o         <= 0;
                  tx_minorVersionPTP_o    <= 0;
                  tx_messageType_o        <= 4'hf;  
                  tx_majorSdoId_o         <= 0;
                end     
            end
        end
    end

    //generate tx interrupt signal
    always @(posedge tx_clk or negedge tx_rst_n) begin
        if(!tx_rst_n)
            int_tx_ptp_o <= 0;
        else if(tx_clk_en_i) begin
            if(is_ptp_message_z1 == 1'b1 && eth_count >= (ptp_addr_base_z1+32) && ptp_version_match == 1'b1
                && tx_en_i == 1'b0)    //generate interrupt at the end of frame
                int_tx_ptp_o <= 1;
            else if(eth_count == 11'd0 && tx_en_i == 1'b1)  //start of the next frame
                int_tx_ptp_o <= 0;
        end  
    end
  
    //signals to tx_emb_ts
    assign tx_en_o = tx_en_i;
    assign tx_er_o = tx_er_i;
    assign txd_o   = txd_i  ;

    assign ptp_addr_base_o           = ptp_addr_base_z1;
    assign ptp_messageType_o         = ptp_messageType;           
    assign ptp_correctionField_o     = ptp_correctionField;
    assign ptp_messageTypeSpecific_o = ptp_messageTypeSpecific;
    assign is_ptp_message_o          = is_ptp_message_z1;  
    assign ptp_messageLength_o       = ptp_messageLength;
    assign ptp_flagField_o           = ptp_flagField; 

    assign ipv6_flag_o      = ipv6_flag_z1;     
    assign ipv6_addr_base_o = ipv6_addr_base_z1;
    assign ipv4_flag_o      = ipv4_flag_z1;      
    assign ipv4_addr_base_o = ipv4_addr_base_z1; 

endmodule

