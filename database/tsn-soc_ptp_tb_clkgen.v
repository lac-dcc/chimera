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
 * clock and reset generation
-*/

`include "ptpv2_defines.v"

module clkgen (
    input        mii_mode_i,

    output       rtc_clk,
    output       tx_clk,
    output reg   pbus_clk,
    output reg   rst_sys_n
);
    parameter    T_PBUS_CLK    = 40,
                 T_RTC_CLK     = 8,
                 T_GE_TX_CLK   = 8,
                 T_FE_TX_CLK   = 40;

    reg ge_tx_clk, fe_tx_clk;
    reg gfe_rtc_clk;
    
    //initialization
    initial begin
        ge_tx_clk   = 0;
        fe_tx_clk   = 0;
        gfe_rtc_clk = 0;

        pbus_clk    = 0;
        rst_sys_n   = 1;
    end
    
    //reset generation
    task reset;
        begin
            #55
            rst_sys_n    = 0;
            
            #(40*5000);
 
            #355 
            rst_sys_n    = 1;
        end
    endtask 

    // clock generation
    always #(T_PBUS_CLK/2)  pbus_clk    = ~pbus_clk;

    always #(T_RTC_CLK/2)   gfe_rtc_clk = ~gfe_rtc_clk;

    always #(T_GE_TX_CLK/2) ge_tx_clk = ~ge_tx_clk;         
    
    always #(T_FE_TX_CLK/2) fe_tx_clk = ~fe_tx_clk;         


    assign rtc_clk = gfe_rtc_clk;
    assign tx_clk  = (mii_mode_i == 1'b0) ? ge_tx_clk : fe_tx_clk;
endmodule

