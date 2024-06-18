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

/*++
 * rx frame reconstruct, including crc recalculation
-*/

`include "ptpv2_defines.v"

module rx_rcst(
    input               rx_clk,
    input               rx_rst_n,
    input               rx_clk_en_i,        //adapting to gmii/mii

    input               rx_dv_i, 
    input               rx_er_i, 
    input  [7:0]        rxd_i  , 

    output              rx_dv_o, 
    output              rx_er_o, 
    output [7:0]        rxd_o  , 

    input               efd_p4_i      ,
    input               embed_enable_i,
    input  [10:0]       eth_count_i   

);
    //re-calculate fcs, if frame modified, replace old crc.
    //indicator used to replace crc
    reg rpl_crc, rpl_crc_z1;

    always @(*) begin
        rpl_crc = rpl_crc_z1;

        if(eth_count_i == 11'd0 && rx_dv_i == 1'b1) //start of frame detected
            rpl_crc = 0;
        else if(embed_enable_i == 1'b1)   
            rpl_crc = 1;
    end

    always @(posedge rx_clk or negedge rx_rst_n) begin
        if(!rx_rst_n)
            rpl_crc_z1 <= 1'b0;
        else if(rx_clk_en_i)
            rpl_crc_z1 <= rpl_crc; 
    end

    //instantiate gmii_crc
    gmii_crc rx_gmii_crc(
        .clk              (rx_clk),
        .rst_n            (rx_rst_n),              
        .clk_en_i         (rx_clk_en_i),
        
        .data_en_i        (rx_dv_i), 
        .data_er_i        (rx_er_i),
        .data_i           (rxd_i  ),  
        
        .data_en_o        (rx_dv_o),
        .data_er_o        (rx_er_o),
        .data_o           (rxd_o  ),
        
        .efd_p4_i         (efd_p4_i ),
        .eth_count_i      (eth_count_i),
        .rpl_flag_i       (rpl_crc_z1)
    );

endmodule
