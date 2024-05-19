// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>multipulse_cross_clock
 * @file multipulse_cross_clock.v
 * @date 2015-04-27  
 * @author Andrey Filippov     
 *
 * @brief Generate a train of pulses through clock domains boundary.
 *
 * Maximal duty cycle (with EXTRA_DLY=0 and Fdst << Fsrc) = 50%
 * same frequencies - ~1/3 (with EXTRA_DLY=0) and 1/5 (with EXTRA_DLY=1)
 * Lowering Fsrc reduces duty cycle proportianally as counter is in src_clk
 * domain.
 *
 * @copyright Copyright (c) 2015 Elphel, Inc.
 *
 * <b>License:</b>
 *
 * multipulse_cross_clock.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  multipulse_cross_clock.v is distributed in the hope that it will be useful,
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

module  multipulse_cross_clock#(
    parameter WIDTH=1,          // width of the pulse counter (assign MSB of input to 0 to
                                // have more pending that possible input)
    parameter EXTRA_DLY=0)(     // 0 or 1 - output duty cycle control
    input              rst,
    input              src_clk,
    input              dst_clk,
    input  [WIDTH-1:0] num_pulses, // single-cycle positive pulse
    input              we,
    output             out_pulse,
    output             busy
);
    reg   [WIDTH-1:0] pend_cntr=0;
    wire              busy_single;
    wire              single_rq_w;
    reg               single_rq_r=0;

//    assign busy = busy_single && (|pend_cntr);
    assign busy = busy_single || (|pend_cntr);
    assign single_rq_w = !busy_single && (|pend_cntr);
    
    always @(posedge src_clk) begin
        single_rq_r <= single_rq_w;
        if (rst) pend_cntr <= 0;
        else pend_cntr <= pend_cntr + (we ? num_pulses : {WIDTH{1'b0}}) + (single_rq_r ? {WIDTH{1'b1}}:{WIDTH{1'b0}});
    end
    
    pulse_cross_clock #(
        .EXTRA_DLY(EXTRA_DLY)
    ) pulse_cross_clock_i (
        .rst       (rst), // input
        .src_clk   (src_clk), // input
        .dst_clk   (dst_clk), // input
        .in_pulse  (single_rq_w), // input
        .out_pulse (out_pulse), // output
        .busy      (busy_single) // output
    );
    
endmodule

