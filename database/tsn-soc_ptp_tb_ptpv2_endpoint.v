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
 * emulated ptpv2 endpoint 
 * including sw/hw related functions
-*/

`include "ptpv2_defines.v"

module ptpv2_endpoint (
    input           rx_clk ,
    output          tx_clk ,

    input           rx_dv_i   ,
    input           rx_er_i   ,
    input  [7:0]    rxd_i    ,    
    
    output          tx_en_o   ,
    output          tx_er_o   ,
    output [7:0]    txd_o    , 

    input           mii_mode_i,
    output          pps_o
);
    parameter    CLOCK_MS = 0;     //0: slave, none-0: master;
    parameter    T_PBUS_CLK    = 40,
                 T_RTC_CLK     = 8,
                 T_GE_TX_CLK   = 8,
                 T_FE_TX_CLK   = 40;
    
    wire        pbus_clk;
    wire        rtc_clk;
    wire        rst_sys_n;
    
    wire        dis_ptpv2 = 1'b0;

    wire        rx_dv_out;
    wire        rx_er_out;
    wire [7:0]  rxd_out;

    wire        tx_en_in;
    wire        tx_er_in;
    wire [7:0]  txd_in;

    //++
    // ptpv2_core_wrapper glue logics
    //--
    //apb-like bus
    wire              pbus_rst_n = rst_sys_n;
    wire   [31:0]     pbus_addr = 32'b0;  
    wire              pbus_write = 1'b0;
    wire              pbus_sel = 1'b1;
    wire              pbus_enable = 1'b1;
    wire   [31:0]     pbus_wdata = 32'b0;
    wire   [31:0]     pbus_rdata;
    wire              pbus_ready;
    wire              pbus_slverr;

    wire   pps_out; 
    wire   pps_in = 1'b0;
    wire   intxms; 
    wire   int_rx_ptp; 
    wire   int_tx_ptp;
    
    assign pps_o = pps_out;

    wire              bus2ip_clk   ;
    wire              bus2ip_rst_n ;
    wire  [31:0]      bus2ip_addr  ;
    wire  [31:0]      bus2ip_data  ;
    wire              bus2ip_rd_ce ;       //active high
    wire              bus2ip_wr_ce ;       //active high
    wire  [31:0]      ip2bus_data  ;

    //++
    //instantiate ptpv2_agent (the mac and software simulator)
    //
    assign bus2ip_clk = pbus_clk;
    assign bus2ip_rst_n = pbus_rst_n;

    initial begin
        force ptpv2_core_wrapper.bus2ip_addr  = bus2ip_addr;
        force ptpv2_core_wrapper.bus2ip_data  = bus2ip_data;
        force ptpv2_core_wrapper.bus2ip_rd_ce = bus2ip_rd_ce;
        force ptpv2_core_wrapper.bus2ip_wr_ce = bus2ip_wr_ce;
        force ip2bus_data = ptpv2_core_wrapper.ip2bus_data;
    end

    //instantiate clock/reset model
    clkgen clkgen (
        .mii_mode_i       (mii_mode_i),

        .pbus_clk         (pbus_clk),
        .rtc_clk          (rtc_clk),
        .tx_clk           (tx_clk),
        .rst_sys_n        (rst_sys_n )
    );
    defparam clkgen.T_PBUS_CLK = T_PBUS_CLK  ;
    defparam clkgen.T_RTC_CLK = T_RTC_CLK  ;
    defparam clkgen.T_GE_TX_CLK = T_GE_TX_CLK;
    defparam clkgen.T_FE_TX_CLK = T_FE_TX_CLK;

    ptp_agent ptp_agent (
        //rtc and sw register interface
        .rtc_clk                 (rtc_clk   ),
        .rst_sys_n               (rst_sys_n ),
    
        .intxms_i                (intxms   ),
        .int_rx_ptp_i            (int_rx_ptp ),
        .int_tx_ptp_i            (int_tx_ptp ),
        
        //gmii/mii interface
        .rx_clk                  (rx_clk    ), 
        .tx_clk                  (tx_clk  ),

        .rx_dv_i                 (rx_dv_out ),
        .rx_er_i                 (rx_er_out ),
        .rxd_i                   (rxd_out   ),
    
        .tx_en_o                 (tx_en_in ),
        .tx_er_o                 (tx_er_in ),
        .txd_o                   (txd_in   ),

         //on chip bus interface
        .bus2ip_clk              (bus2ip_clk    ),
        .bus2ip_rst_n            (bus2ip_rst_n  ),
        .bus2ip_addr_o           (bus2ip_addr   ),
        .bus2ip_data_o           (bus2ip_data   ),
        .bus2ip_rd_ce_o          (bus2ip_rd_ce  ),         //active high
        .bus2ip_wr_ce_o          (bus2ip_wr_ce  ),         //active high
        .ip2bus_data_i           (ip2bus_data   )  
    );  
    defparam ptp_agent.CLOCK_MS = CLOCK_MS;

    //++
    //instantiate ptpv2 core wrapper 
    //--
    ptpv2_core_wrapper ptpv2_core_wrapper (
        .rtc_clk                 (rtc_clk  ),
        .rtc_rst_n               (rst_sys_n),             //async. reset, active low
                                                    
        //rx interface
        .rx_clk                  (rx_clk   ),
        .rx_rst_n                (rst_sys_n ),
        
        .rx_dv_i                 (rx_dv_i   ), 
        .rx_er_i                 (rx_er_i   ),
        .rxd_i                   (rxd_i     ),

        .rx_dv_o                 (rx_dv_out ),
        .rx_er_o                 (rx_er_out ),
        .rxd_o                   (rxd_out   ),   
          
        //tx interface
        .tx_clk                  (tx_clk   ),
        .tx_rst_n                (rst_sys_n ),

        .tx_en_i                 (tx_en_in  ), 
        .tx_er_i                 (tx_er_in  ),
        .txd_i                   (txd_in    ),  
        
        .tx_en_o                 (tx_en_o),
        .tx_er_o                 (tx_er_o),
        .txd_o                   (txd_o  ),
        
        //apb-like bus register access interface
        .pbus_clk                (pbus_clk),
        .pbus_rst_n              (pbus_rst_n),

        .pbus_addr_i             (pbus_addr  ),
        .pbus_write_i            (pbus_write ),
        .pbus_sel_i              (pbus_sel   ),
        .pbus_enable_i           (pbus_enable),
        .pbus_wdata_i            (pbus_wdata ),
        .pbus_rdata_o            (pbus_rdata ),
        .pbus_ready_o            (pbus_ready ),
        .pbus_slverr_o           (pbus_slverr),

        //control i/o
        .mii_mode_i              (mii_mode_i),  
        .dis_ptpv2_i             (dis_ptpv2   ),   


        //interrupts
        .intxms_o                (intxms   ),
        .int_rx_ptp_o            (int_rx_ptp ),
        .int_tx_ptp_o            (int_tx_ptp ),

        .pps_o                   (pps_out  ), 
        .pps_i                   (pps_in)           
    );
endmodule

