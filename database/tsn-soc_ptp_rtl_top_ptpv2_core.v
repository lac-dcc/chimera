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
 * ptpv2 top level
 * with GMII support only
-*/

`include "ptpv2_defines.v"

module ptpv2_core (
    input               rtc_clk,
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

    //32 bits on chip bus access interface
    input               bus2ip_clk   ,
    input               bus2ip_rst_n  ,
    input  [31:0]       bus2ip_addr_i ,
    input  [31:0]       bus2ip_data_i ,
    input               bus2ip_rd_ce_i ,         //active high
    input               bus2ip_wr_ce_i ,         //active high
    output [31:0]       ip2bus_data_o ,  

    //interrupt signals generated from ptpv2 core
    output              intxms_o,
    output              int_rx_ptp_o,
    output              int_tx_ptp_o,

    input               pps_i,        //1 pulse per second input
    output              pps_o         //1 pulse per second output
);
    wire [79:0]         rtc_std;      //48 bits seconds + 32 bits nanoseconds
    wire [15:0]         rtc_fns;      //16 bit fractional nanoseconds of rtc

    wire [31:0]         rtc_ip2bus_data;
    wire [31:0]         tsu_ip2bus_data;

    assign  ip2bus_data_o = rtc_ip2bus_data | tsu_ip2bus_data;
  
    rtc_unit rtc_unit_inst(
        .rtc_clk                  (rtc_clk  ),
        .rtc_rst_n                (rtc_rst_n),              

        //bus interface
        .bus2ip_clk               (bus2ip_clk      ),
        .bus2ip_rst_n             (bus2ip_rst_n    ),
                                                    
        .bus2ip_addr_i            (bus2ip_addr_i   ),
        .bus2ip_data_i            (bus2ip_data_i   ),
        .bus2ip_rd_ce_i           (bus2ip_rd_ce_i  ),         
        .bus2ip_wr_ce_i           (bus2ip_wr_ce_i  ),         
        .ip2bus_data_o            (rtc_ip2bus_data ),  

        //time related signals
        .rtc_std_o                (rtc_std),          
        .rtc_fns_o                (rtc_fns),           
        
        .intxms_o                 (intxms_o),
        .pps_i                    (pps_i),        
        .pps_o                    (pps_o)         
    );
    defparam rtc_unit_inst.BLK_ADDR = `RTC_BLK_ADDR;

    timestamp_unit timestamp_unit_inst(
        .rtc_clk                  (rtc_clk),
        .rtc_rst_n                (rtc_rst_n), 

        .dis_ptpv2_i              (dis_ptpv2_i ),         

        //rx interface
        .rx_clk                   (rx_clk     ),
        .rx_rst_n                 (rx_rst_n   ),
        .rx_clk_en_i              (rx_clk_en_i),           

        .rx_dv_i                  (rx_dv_i), 
        .rx_er_i                  (rx_er_i), 
        .rxd_i                    (rxd_i  ), 
                                          
        .rx_dv_o                  (rx_dv_o), 
        .rx_er_o                  (rx_er_o), 
        .rxd_o                    (rxd_o  ), 
        
        //tx interface
        .tx_clk                   (tx_clk     ),
        .tx_rst_n                 (tx_rst_n   ),
        .tx_clk_en_i              (tx_clk_en_i),          

        .tx_en_i                  (tx_en_i), 
        .tx_er_i                  (tx_er_i),
        .txd_i                    (txd_i  ),  
                                  
        .tx_en_o                  (tx_en_o),
        .tx_er_o                  (tx_er_o),
        .txd_o                    (txd_o  ),

        //time input
        .rtc_std_i                (rtc_std),          
        .rtc_fns_i                (rtc_fns),           

        //on chip bus access interface
        .bus2ip_clk               (bus2ip_clk    ),
        .bus2ip_rst_n             (bus2ip_rst_n  ),
        .bus2ip_addr_i            (bus2ip_addr_i ),
        .bus2ip_data_i            (bus2ip_data_i ),
        .bus2ip_rd_ce_i           (bus2ip_rd_ce_i),         
        .bus2ip_wr_ce_i           (bus2ip_wr_ce_i),         
        .ip2bus_data_o            (tsu_ip2bus_data ),  

        //interrupt signals generated from ptpv2 core
        .int_rx_ptp_o             (int_rx_ptp_o),
        .int_tx_ptp_o             (int_tx_ptp_o)
    );
    defparam timestamp_unit_inst.BLK_ADDR = `TSU_BLK_ADDR;
endmodule

