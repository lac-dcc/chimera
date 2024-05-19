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
 * ptp top module
 * including ptp_nic, ptpv2_core
 * support gigabit ethernet GMII only
-*/

`include "ptpv2_defines.v"

module ptp_top (
    //tx interface
    input               tx_clk,
    input               tx_rst_n,
    
    output              tx_en_o,
    output              tx_er_o,
    output [7:0]        txd_o  ,

    //rx interface
    input               rx_clk,
    input               rx_rst_n,

    input               rx_dv_i, 
    input               rx_er_i, 
    input  [7:0]        rxd_i  , 

    //32 bits on chip bus access interface
    input               bus2ip_clk   ,
    input               bus2ip_rst_n  ,
    input  [31:0]       bus2ip_addr_i ,
    input  [31:0]       bus2ip_data_i ,
    input               bus2ip_rd_ce_i ,   //active high
    input               bus2ip_wr_ce_i ,   //active high
    output [31:0]       ip2bus_data_o,   

    //combined interrupt output
    output              int_ptp_o,

    //rtc related
    input               rtc_clk,
    input               rtc_rst_n,    //async. reset, active low
    input               pps_i,        //1 pulse per second input
    output              pps_o         //1 pulse per second output
);
    wire           tx_en;
    wire           tx_er;
    wire [7:0]     txd  ;

    wire           rx_dv; 
    wire           rx_er; 
    wire [7:0]     rxd  ; 

    wire           intxms;
    wire           int_rx_ptp;
    wire           int_tx_ptp;

    wire  [31:0]   nic_ip2bus_data;   
    wire  [31:0]   core_ip2bus_data;   

    assign ip2bus_data_o = nic_ip2bus_data | core_ip2bus_data; 

    ptp_nic ptp_nic(
        //tx interface
        .tx_clk             (tx_clk   ),
        .tx_rst_n           (tx_rst_n ),
                                      
        .tx_en_o            (tx_en),
        .tx_er_o            (tx_er),
        .txd_o              (txd  ),

        //rx interface
        .rx_clk             (rx_clk   ),
        .rx_rst_n           (rx_rst_n ),
                                      
        .rx_dv_i            (rx_dv), 
        .rx_er_i            (rx_er), 
        .rxd_i              (rxd  ), 
    
        //32 bits on chip bus access interface
        .bus2ip_clk         (bus2ip_clk    ),
        .bus2ip_rst_n       (bus2ip_rst_n  ),
        .bus2ip_addr_i      (bus2ip_addr_i ),
        .bus2ip_data_i      (bus2ip_data_i ),
        .bus2ip_rd_ce_i     (bus2ip_rd_ce_i),      
        .bus2ip_wr_ce_i     (bus2ip_wr_ce_i),      
        .ip2bus_data_o      (nic_ip2bus_data ),   
    
        //interrupt inputs
        .intxms_i           (intxms    ),
        .int_rx_ptp_i       (int_rx_ptp),
        .int_tx_ptp_i       (int_tx_ptp),
    
        //combined interrupt output
        .int_ptp_o          (int_ptp_o)
    );

    ptpv2_core ptpv2_core(
        .rtc_clk            (rtc_clk    ),
        .rtc_rst_n          (rtc_rst_n  ), 
        .dis_ptpv2_i        (1'b0),
    
        //rx interface
        .rx_clk             (rx_clk     ),
        .rx_rst_n           (rx_rst_n   ),
        .rx_clk_en_i        (1'b1),

        .rx_dv_i            (rx_dv_i), 
        .rx_er_i            (rx_er_i), 
        .rxd_i              (rxd_i  ), 

        .rx_dv_o            (rx_dv), 
        .rx_er_o            (rx_er), 
        .rxd_o              (rxd  ), 

        //tx interface
        .tx_clk             (tx_clk     ),
        .tx_rst_n           (tx_rst_n   ),
        .tx_clk_en_i        (1'b1),         

        .tx_en_i            (tx_en), 
        .tx_er_i            (tx_er),
        .txd_i              (txd  ),  

        .tx_en_o            (tx_en_o),
        .tx_er_o            (tx_er_o),
        .txd_o              (txd_o  ),
    
        //32 bits on chip bus access interface
        .bus2ip_clk         (bus2ip_clk    ),
        .bus2ip_rst_n       (bus2ip_rst_n  ),
        .bus2ip_addr_i      (bus2ip_addr_i ),
        .bus2ip_data_i      (bus2ip_data_i ),
        .bus2ip_rd_ce_i     (bus2ip_rd_ce_i),    
        .bus2ip_wr_ce_i     (bus2ip_wr_ce_i),   
        .ip2bus_data_o      (core_ip2bus_data ),  
    
        //interrupt signals generated from ptpv2 core
        .intxms_o           (intxms    ),
        .int_rx_ptp_o       (int_rx_ptp),
        .int_tx_ptp_o       (int_tx_ptp),
    
        .pps_i              (pps_i),      
        .pps_o              (pps_o)     
    );

endmodule
