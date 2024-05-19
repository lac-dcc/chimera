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
 * bridge from apb-like bus to standard ip access bus
-*/

`include "ptpv2_defines.v"

module pbus_bridge (
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

    //standard ip access bus interface
    output              bus2ip_clk   ,
    output              bus2ip_rst_n  ,
    output [31:0]       bus2ip_addr_o ,
    output [31:0]       bus2ip_data_o ,
    output              bus2ip_rd_ce_o ,         //active high
    output              bus2ip_wr_ce_o ,         //active high
    input  [31:0]       ip2bus_data_i   
);
    //generate bus control signals
    assign bus2ip_wr_ce_o = pbus_sel_i & pbus_enable_i & pbus_write_i;
    assign bus2ip_rd_ce_o = pbus_sel_i & (~pbus_write_i);

    //pass through signals
    assign bus2ip_clk    = pbus_clk;
    assign bus2ip_rst_n  = pbus_rst_n;
    assign bus2ip_addr_o = pbus_addr_i;
    assign bus2ip_data_o = pbus_wdata_i;

    assign pbus_rdata_o  = ip2bus_data_i;

    //wire to constant
    assign pbus_ready_o  = 1'b1;
    assign pbus_slverr_o = 1'b0;
endmodule

