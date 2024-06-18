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
 * ptpv2 core ip wrapper, includes apb-like on-chip-bus  slave interface and core ip.
-*/

`include "ptpv2_defines.v"

module ptpv2_core_wrapper (
    input               rtc_clk,
    input               rtc_rst_n,              //async. reset, active low

    //rx interface
    input               rx_clk,
    input               rx_rst_n,
      
    input               rx_dv_i, 
    input               rx_er_i,
    input  [7:0]        rxd_i,
    
    output              rx_dv_o,
    output              rx_er_o,
    output [7:0]        rxd_o,   
      
    //tx interface
    input               tx_clk,
    input               tx_rst_n,
    
    input               tx_en_i, 
    input               tx_er_i,
    input  [7:0]        txd_i,  
    
    output              tx_en_o,
    output              tx_er_o,
    output [7:0]        txd_o,

    //apb-like bus slave interface
    input               pbus_clk,
    input               pbus_rst_n,
    input  [31:0]       pbus_addr_i,
    input               pbus_write_i,
    input               pbus_sel_i,
    input               pbus_enable_i,
    input  [31:0]       pbus_wdata_i,
    output [31:0]       pbus_rdata_o,
    output              pbus_ready_o,
    output              pbus_slverr_o,

    //control i/o
    input               mii_mode_i,          //0:ge, 1: 100m/10m ethernet
    input               dis_ptpv2_i,
    
    //interrupt signals 
    output              intxms_o,
    output              int_rx_ptp_o,
    output              int_tx_ptp_o,

    output              pps_o,               //pps output
    input               pps_i                //pps input
);
    //interconnect signals.
    wire                bus2ip_clk   ;
    wire                bus2ip_rst_n ;
    wire  [31:0]        bus2ip_addr  ;
    wire  [31:0]        bus2ip_data  ;
    wire                bus2ip_rd_ce ;       //active high
    wire                bus2ip_wr_ce ;       //active high
    wire  [31:0]        ip2bus_data  ;

    //apb-like bus slave bridge 
    pbus_bridge pbus_bridge_inst (
        //apb-like bus register access interface
        .pbus_clk          (pbus_clk     ),
        .pbus_rst_n        (pbus_rst_n   ),
        .pbus_addr_i       (pbus_addr_i  ),
        .pbus_write_i      (pbus_write_i ),
        .pbus_sel_i        (pbus_sel_i   ),
        .pbus_enable_i     (pbus_enable_i),
        .pbus_wdata_i      (pbus_wdata_i ),
        .pbus_rdata_o      (pbus_rdata_o ),
        .pbus_ready_o      (pbus_ready_o ),
        .pbus_slverr_o     (pbus_slverr_o),

        //standard ip register access bus interface
        .bus2ip_clk        (bus2ip_clk    ),
        .bus2ip_rst_n      (bus2ip_rst_n  ),
        .bus2ip_addr_o     (bus2ip_addr   ),
        .bus2ip_data_o     (bus2ip_data   ),
        .bus2ip_rd_ce_o    (bus2ip_rd_ce  ),         //active high
        .bus2ip_wr_ce_o    (bus2ip_wr_ce  ),         //active high
        .ip2bus_data_i     (ip2bus_data   )  
    );

    //++
    //instantiate ptpv2_core
    //--
    wire  rx_clk_en;

    wire        rx_dv_out;
    wire        rx_er_out;
    wire [7:0]  rxd_out;   

    wire        grx_dv_in;
    wire        grx_er_in;
    wire [7:0]  grx_d_in;   

    wire        grx_dv_out;
    wire        grx_er_out;
    wire [7:0]  grx_d_out;   

    assign rx_dv_o = (dis_ptpv2_i == 1'b1) ? rx_dv_i : rx_dv_out;
    assign rx_er_o = (dis_ptpv2_i == 1'b1) ? rx_er_i : rx_er_out;
    assign rxd_o   = (dis_ptpv2_i == 1'b1) ? rxd_i   : rxd_out  ;   

    mii_cvt rx_mii_cvt (
        .clk            (rx_clk),
        .rst_n          (rx_rst_n),

        .mii_mode_i     (mii_mode_i),
        .clk_en_o       (rx_clk_en),

        .mii_en_i       (rx_dv_i), 
        .mii_er_i       (rx_er_i),
        .mii_d_i        (rxd_i),
    
        .gmii_en_o      (grx_dv_in),
        .gmii_er_o      (grx_er_in),
        .gmii_d_o       (grx_d_in ),   

        .gmii_en_i      (grx_dv_out), 
        .gmii_er_i      (grx_er_out),
        .gmii_d_i       (grx_d_out ),

        .mii_en_o       (rx_dv_out),
        .mii_er_o       (rx_er_out),
        .mii_d_o        (rxd_out),   

        .nibble_slide_o ()
    );

    wire  tx_clk_en;

    wire        tx_en_out;
    wire        tx_er_out;
    wire [7:0]  txd_out;   

    wire        gtx_en_in;
    wire        gtx_er_in;
    wire [7:0]  gtx_d_in;   

    wire        gtx_en_out;
    wire        gtx_er_out;
    wire [7:0]  gtx_d_out;   

    assign tx_en_o = (dis_ptpv2_i == 1'b1) ? tx_en_i : tx_en_out;
    assign tx_er_o = (dis_ptpv2_i == 1'b1) ? tx_er_i : tx_er_out;
    assign txd_o   = (dis_ptpv2_i == 1'b1) ? txd_i   : txd_out  ;   

    mii_cvt tx_mii_cvt (
        .clk            (tx_clk),
        .rst_n          (tx_rst_n),

        .mii_mode_i     (mii_mode_i),
        .clk_en_o       (tx_clk_en),

        .mii_en_i       (tx_en_i), 
        .mii_er_i       (tx_er_i),
        .mii_d_i        (txd_i),
    
        .gmii_en_o      (gtx_en_in),
        .gmii_er_o      (gtx_er_in),
        .gmii_d_o       (gtx_d_in ),  

        .gmii_en_i      (gtx_en_out), 
        .gmii_er_i      (gtx_er_out),
        .gmii_d_i       (gtx_d_out ),

        .mii_en_o       (tx_en_out),
        .mii_er_o       (tx_er_out),
        .mii_d_o        (txd_out),   

        .nibble_slide_o ()
    );

    ptpv2_core ptpv2_core_inst (
        .rtc_clk          (rtc_clk    ),    
        .rtc_rst_n        (rtc_rst_n  ),   
                          
        .dis_ptpv2_i      (dis_ptpv2_i),    
    
        //rx interface
        .rx_clk           (rx_clk  ),
        .rx_rst_n         (rx_rst_n),
        .rx_clk_en_i      (rx_clk_en),       

        .rx_dv_i          (grx_dv_in), 
        .rx_er_i          (grx_er_in), 
        .rxd_i            (grx_d_in ), 

        .rx_dv_o          (grx_dv_out), 
        .rx_er_o          (grx_er_out), 
        .rxd_o            (grx_d_out ), 

        //tx interface
        .tx_clk           (tx_clk  ),
        .tx_rst_n         (tx_rst_n),
        .tx_clk_en_i      (tx_clk_en), 

        .tx_en_i          (gtx_en_in), 
        .tx_er_i          (gtx_er_in), 
        .txd_i            (gtx_d_in ), 

        .tx_en_o          (gtx_en_out), 
        .tx_er_o          (gtx_er_out), 
        .txd_o            (gtx_d_out ), 

        //32 bits on chip bus access interface
        .bus2ip_clk       (bus2ip_clk    ),
        .bus2ip_rst_n     (bus2ip_rst_n  ),
        .bus2ip_addr_i    (bus2ip_addr   ),
        .bus2ip_data_i    (bus2ip_data   ),
        .bus2ip_rd_ce_i   (bus2ip_rd_ce  ),         
        .bus2ip_wr_ce_i   (bus2ip_wr_ce  ),         
        .ip2bus_data_o    (ip2bus_data   ),  

        //interrupt signals generated from ptpv2 core
        .intxms_o         (intxms_o    ),
        .int_rx_ptp_o     (int_rx_ptp_o),
        .int_tx_ptp_o     (int_tx_ptp_o),
                                       
        .pps_i            (pps_i   ),        
        .pps_o            (pps_o   )   
    );

endmodule

