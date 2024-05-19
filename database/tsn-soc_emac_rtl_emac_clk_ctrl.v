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
 * Clock generation for EMAC TX/RX data processing.
-*/

module emac_clk_ctrl
(   
    input           rst_n           ,
    input           clk_125m        ,

    //registers interface
    input   [2:0]   speed_i           ,       

    //clock signals between PHY/MAC interface
    output          gtx_clk         ,//used in GMII mode only
    input           rx_clk          ,
    input           tx_clk          ,//used in MII mode only

    //internal clock signals for TX/RX data processing
    output          mac_tx_clk      ,
    output          mac_rx_clk      ,
    output          mac_tx_clk_div  ,
    output          mac_rx_clk_div    
);

    //internal signals                                                              
    wire            rx_clk_div2 ;
    wire            tx_clk_div2 ;

    assign gtx_clk    =clk_125m ;
    assign mac_rx_clk =rx_clk   ;

    clk_div2 u_clk_div2_0
    (
        .rst_n          (rst_n          ),
        .in             (rx_clk         ),
        .out            (rx_clk_div2    )
    );

    clk_div2 u_clk_div2_1
    (
        .rst_n          (rst_n          ),
        .in             (tx_clk         ),
        .out            (tx_clk_div2    )
    );

    clk_switch u_clk_switch_0
    (
        .in_0           (rx_clk_div2    ),
        .in_1           (rx_clk         ),
        .sw             (speed_i[2]       ),
        .out            (mac_rx_clk_div )
    );

    clk_switch u_clk_switch_1
    (
        .in_0           (tx_clk         ),
        .in_1           (clk_125m       ),
        .sw             (speed_i[2]       ),
        .out            (mac_tx_clk     )
    );

    clk_switch u_clk_switch_2
    (
        .in_0           (tx_clk_div2    ),
        .in_1           (clk_125m       ),
        .sw             (speed_i[2]       ),
        .out            (mac_tx_clk_div )
    );

endmodule

