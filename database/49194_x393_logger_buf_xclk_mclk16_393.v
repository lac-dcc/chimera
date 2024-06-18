// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>buf_xclk_mclk16_393
 * @file buf_xclk_mclk16_393.v
 * @date 2015-07-06  
 * @author Andrey Filippov     
 *
 * @brief move data from xclk to mclk domain
 *
 * @copyright Copyright (c) 2015 Elphel, Inc.
 *
 * <b>License:</b>
 *
 * buf_xclk_mclk16_393.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  buf_xclk_mclk16_393.v is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/> .
 *
 * Additional permission under GNU GPL version 3 section 7:
 * If you modify this Program, or any covered work, by linking or combining it
 * with independent modules provided by the FPGA vendor only (this permission
 * does not extend to any 3-rd party modules, "soft cores" or macros) under
 * different license terms solely for the purpose of generating binary "bitstream"
 * files and/or simulating the code, the copyright holders of this Program give
 * you the right to distribute the covered work without those independent modules
 * as long as the source code for them is available from the FPGA vendor free of
 * charge, and there is no dependence on any encrypted modules for simulating of
 * the combined code. This permission applies to you if the distributed code
 * contains all the components and scripts required to completely simulate it
 * with at least one of the Free Software programs.
 */
`timescale 1ns/1ps

module  buf_xclk_mclk16_393(
    input                         mclk,    // system clock, posedge
    input                         xclk,    // half frequency (80 MHz nominal)
    input                         rst,     // @posedge xclk  reset module
    input                  [15:0] din,
    input                         din_stb,
    output reg             [15:0] dout,
    output reg                    dout_stb);

    reg     [1:0] wa;
    reg     [1:0] wa_mclk;
    reg     [1:0] wa_mclk_d;
    reg           rst_mclk;
    reg     [1:0] ra;
    reg     [1:0] ra_next;
    reg           inc_ra;
    wire   [15:0] pre_dout;

    always @ (posedge xclk) begin
        if      (rst)     wa[1:0] <= 2'h0;
        else if (din_stb) wa[1:0] <={wa[0],~wa[1]};
    end

    always @ (posedge mclk) begin
        wa_mclk[1:0]   <= wa[1:0];
        wa_mclk_d[1:0] <= wa_mclk[1:0];
        rst_mclk<= rst;
        if (rst_mclk) ra[1:0] <= 2'h0;
        else          ra[1:0] <= inc_ra?{ra[0],~ra[1]}:{ra[1],ra[0]};
    
        if (rst_mclk) ra_next[1:0] <= 2'h1;
        else          ra_next[1:0] <= inc_ra?{~ra[1],~ra[0]}:{ra[0],~ra[1]};
    
        inc_ra <= !rst && (ra[1:0]!=wa_mclk_d[1:0]) && (!inc_ra || (ra_next[1:0]!=wa_mclk_d[1:0]));
        dout_stb <= inc_ra;
        if (inc_ra) dout[15:0] <= pre_dout[15:0];
    end
    
    reg    [15:0] fifo_4x16_ram[0:3];
    always @ (posedge xclk) if (din_stb) fifo_4x16_ram[wa[1:0]] <= din[15:0];
    assign pre_dout[15:0] =              fifo_4x16_ram[ra[1:0]];

endmodule

