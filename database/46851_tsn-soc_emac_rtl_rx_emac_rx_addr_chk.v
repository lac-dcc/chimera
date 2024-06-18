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
 *  MAC address check for received frames
-*/

module emac_rx_addr_chk (
    input               rst_n             ,
    input               clk               ,

    //emac_rx_ctrl interface
    input               init_i            ,
    input  [7:0]        data_i            ,
    input               multicast_i       , //is multicast address
    input               broadcast_i       , //is broadcast address
    input  [31:0]       rx_crc_i          ,
    input  [15:0]       frame_counter_i   ,
    output reg          rx_addr_chk_err_o ,

    //Host interface
    input               r_rxAddrChkEn_i   , //check RX MAC address enable    
    input  [47:0]       r_rxMacAddr_i     , //MAC address used for check
    input  [31:0]       r_Hash0_i         , //HASH table for address check, lower 4 bytes
    input  [31:0]       r_Hash1_i           //HASH table for address check, upper 4 bytes 
);
    //++
    //internal signals
    //--

    reg          multicast_ok;
    reg          unicast_ok;
    reg  [5:0]   crc_hash;
    wire [31:0]  word_hash;
    reg  [7:0]   byte_hash;
    wire         hash_bit;

    //Hash table processing
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n)
            crc_hash <= 6'h0;
        else if(init_i)
            crc_hash <= 6'h0;
        else if(frame_counter_i == 7)
            crc_hash <= rx_crc_i[31:26];
    end
    
    assign word_hash[31:0] = (crc_hash[5]) ? r_Hash1_i : r_Hash0_i;

    always @(*) begin
        case(crc_hash[4:3])
            2'b00:   byte_hash = word_hash[7:0];
            2'b01:   byte_hash = word_hash[15:8];
            2'b10:   byte_hash = word_hash[23:16];
            2'b11:   byte_hash = word_hash[31:24];
            default: byte_hash = 8'h0;
        endcase
    end

    assign hash_bit = byte_hash[crc_hash[2:0]];

    //Hash address check, multicast
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n)
            multicast_ok <= 0;
        else if(init_i)
            multicast_ok <= 0;
        else if(frame_counter_i == 8 && multicast_i)
            multicast_ok <= hash_bit;
    end

    //unicast address detection
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n)
            unicast_ok <= 0;
        else if(init_i)
            unicast_ok <= 0;
        else if(frame_counter_i == 1)
            unicast_ok <= (data_i[7:0] == r_rxMacAddr_i[47:40]);
        else if(frame_counter_i == 2)
            unicast_ok <= (data_i[7:0] == r_rxMacAddr_i[39:32]) & unicast_ok;
        else if(frame_counter_i == 3)
            unicast_ok <= (data_i[7:0] == r_rxMacAddr_i[31:24]) & unicast_ok;
        else if(frame_counter_i == 4)
            unicast_ok <= (data_i[7:0] == r_rxMacAddr_i[23:16]) & unicast_ok;
        else if(frame_counter_i == 5)
            unicast_ok <= (data_i[7:0] == r_rxMacAddr_i[15:8]) & unicast_ok;
        else if(frame_counter_i == 6)
            unicast_ok <= (data_i[7:0] == r_rxMacAddr_i[7:0]) & unicast_ok;
    end

    //output address check error signal
    wire address_invalid = ~(broadcast_i | multicast_ok | unicast_ok);

    always @(posedge clk or negedge rst_n) begin
        if(!rst_n)
            rx_addr_chk_err_o <= 0;
        else if(init_i)
            rx_addr_chk_err_o <= 0;
        else if(r_rxAddrChkEn_i && frame_counter_i > 8)
            rx_addr_chk_err_o <= address_invalid;
    end

endmodule
