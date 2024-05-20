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
 * ptpv2 ip core test harness
-*/

`include "ptpv2_defines.v"

module harness;  
    //signal for local device
    wire          rx_clk; 
    wire          tx_clk; 

    wire          rx_dv_i; 
    wire          rx_er_i; 
    wire [7:0]    rxd_i ;                

    wire          tx_en_o; 
    wire          tx_er_o; 
    wire [7:0]    txd_o ;             

    wire          pps_o ; 
    wire          mii_mode_i ;
    
    //signal for link partner device
    wire          lp_rx_clk; 
    wire          lp_tx_clk; 

    wire          lp_rx_dv_i; 
    wire          lp_rx_er_i; 
    wire [7:0]    lp_rxd_i ;                

    wire          lp_tx_en_o; 
    wire          lp_tx_er_o; 
    wire [7:0]    lp_txd_o ;             

    wire          lp_pps_o ; 
    wire          lp_mii_mode_i ;

    wire          channel_clk;
    wire          lp_channel_clk;

    wire          mii_mode;

    assign mii_mode_i = mii_mode;
    assign lp_mii_mode_i = mii_mode;

    //instantiate ptp master (link partner) 
    ptpv2_endpoint lp_ptpv2_endpoint (
        .rx_clk         (channel_clk ),
        .tx_clk         (lp_tx_clk ),

        .rx_dv_i        (lp_rx_dv_i),
        .rx_er_i        (lp_rx_er_i),
        .rxd_i          (lp_rxd_i ),    
    
        .tx_en_o        (lp_tx_en_o),
        .tx_er_o        (lp_tx_er_o),
        .txd_o          (lp_txd_o ),

        .mii_mode_i     (lp_mii_mode_i),
        .pps_o          (lp_pps_o)
    );
    //link parter is master
    defparam lp_ptpv2_endpoint.CLOCK_MS = 1;

    assign lp_channel_clk = lp_tx_clk;
    
    channel_model lp_channel_model (
        .clk              (lp_channel_clk),

        .rx_dv_i          (lp_tx_en_o),
        .rx_er_i          (lp_tx_er_o),
        .rxd_i            (lp_txd_o ),
        
        .tx_en_o          (rx_dv_i  ),
        .tx_er_o          (rx_er_i  ),
        .txd_o            (rxd_i   )
    ); 
    defparam lp_channel_model.DELAY_LEN = 8;
    
    //instantiate ptp slave (local device) 
    ptpv2_endpoint ptpv2_endpoint (
        .rx_clk         (lp_channel_clk ),
        .tx_clk         (tx_clk ),

        .rx_dv_i        (rx_dv_i),
        .rx_er_i        (rx_er_i),
        .rxd_i          (rxd_i ),    
    
        .tx_en_o        (tx_en_o),
        .tx_er_o        (tx_er_o),
        .txd_o          (txd_o ),
        
        .mii_mode_i     (mii_mode_i),
        .pps_o          (pps_o)
    );
    //local device is slave
    defparam  ptpv2_endpoint.CLOCK_MS = 0;

    assign  channel_clk = tx_clk;
    
    channel_model channel_model (
        .clk              (channel_clk),

        .rx_dv_i          (tx_en_o),
        .rx_er_i          (tx_er_o),
        .rxd_i            (txd_o ),
        
        .tx_en_o          (lp_rx_dv_i),
        .tx_er_o          (lp_rx_er_i),
        .txd_o            (lp_rxd_i )
    );
    defparam channel_model.DELAY_LEN = 8;       
endmodule

