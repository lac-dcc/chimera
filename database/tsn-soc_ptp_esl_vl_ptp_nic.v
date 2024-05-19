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
 * simple ptp network interface controller
 * including ptp_int_ctl, rx_ptp_buf, tx_ptp_buf
-*/

`include "ptpv2_defines.v"

module ptp_nic (
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
    input               bus2ip_rd_ce_i ,         //active high
    input               bus2ip_wr_ce_i ,         //active high
    output [31:0]       ip2bus_data_o,   

    //interrupt inputs
    input               intxms_i,
    input               int_rx_ptp_i,
    input               int_tx_ptp_i,

    //combined interrupt output
    output              int_ptp_o
);
    wire [31:0]         intc_ip2bus_data;   
    wire [31:0]         txb_ip2bus_data;   
    wire [31:0]         rxb_ip2bus_data;   
    reg  [31:0]         ip2bus_data;   

    wire                int_rx_all;           //received frame besides PTP messages

    //clocked bus output
    always @(posedge bus2ip_clk or negedge bus2ip_rst_n) begin
        if(!bus2ip_rst_n) 
            ip2bus_data <= 0;
        else 
            ip2bus_data <= intc_ip2bus_data | txb_ip2bus_data | rxb_ip2bus_data;
    end
    assign ip2bus_data_o = ip2bus_data;

    ptp_int_ctl ptp_int_ctl (
        //32 bits on chip bus access interface
        .bus2ip_clk            (bus2ip_clk    ),
        .bus2ip_rst_n          (bus2ip_rst_n  ),
        .bus2ip_addr_i         (bus2ip_addr_i ),
        .bus2ip_data_i         (bus2ip_data_i ),
        .bus2ip_rd_ce_i        (bus2ip_rd_ce_i),         
        .bus2ip_wr_ce_i        (bus2ip_wr_ce_i),         
        .ip2bus_data_o         (intc_ip2bus_data ),  
    
        //interrupt inputs
        .int_rx_all_i          (int_rx_all  ),
        .intxms_i              (intxms_i    ),
        .int_rx_ptp_i          (int_rx_ptp_i),
        .int_tx_ptp_i          (int_tx_ptp_i),
    
        //combined interrupt output
        .int_ptp_o             (int_ptp_o)
    );
    defparam ptp_int_ctl.INT_BASE_ADDR = 32'h300;

    rx_ptp_buf rx_ptp_buf (
        //rx interface
        .rx_clk                (rx_clk   ),
        .rx_rst_n              (rx_rst_n ),
                                         
        .rx_dv_i               (rx_dv_i), 
        .rx_er_i               (rx_er_i), 
        .rxd_i                 (rxd_i  ), 

        .int_rx_all_o          (int_rx_all),
    
        //32 bits on chip bus access interface
        .bus2ip_clk            (bus2ip_clk    ),
        .bus2ip_rst_n          (bus2ip_rst_n  ),
        .bus2ip_addr_i         (bus2ip_addr_i ),
        .bus2ip_data_i         (bus2ip_data_i ),
        .bus2ip_rd_ce_i        (bus2ip_rd_ce_i),         
        .bus2ip_wr_ce_i        (bus2ip_wr_ce_i),         
        .ip2bus_data_o         (rxb_ip2bus_data ) 
    );
    defparam rx_ptp_buf.RX_BUF_BADDR = 32'h1000;

    tx_ptp_buf tx_ptp_buf (
        //tx interface
        .tx_clk                (tx_clk   ),
        .tx_rst_n              (tx_rst_n ),
                                         
        .tx_en_o               (tx_en_o),
        .tx_er_o               (tx_er_o),
        .txd_o                 (txd_o  ),

        //32 bits on chip bus access interface
        .bus2ip_clk            (bus2ip_clk    ),
        .bus2ip_rst_n          (bus2ip_rst_n  ),
        .bus2ip_addr_i         (bus2ip_addr_i ),
        .bus2ip_data_i         (bus2ip_data_i ),
        .bus2ip_rd_ce_i        (bus2ip_rd_ce_i),         
        .bus2ip_wr_ce_i        (bus2ip_wr_ce_i),         
        .ip2bus_data_o         (txb_ip2bus_data ) 
    );
    defparam tx_ptp_buf.TX_BUF_BADDR = 32'h2000;

endmodule
