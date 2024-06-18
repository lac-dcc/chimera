// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>sim_frac_clk_delay
 * @file sim_frac_clk_delay.v
 * @date 2015-10-11  
 * @author Andrey Filippov     
 *
 * @brief Delay clock-synchronous signal by fractional number of periods
 *
 * @copyright Copyright (c) 2015 Elphel, Inc .
 *
 * <b>License:</b>
 *
 * sim_frac_clk_delay.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  sim_frac_clk_delay.v is distributed in the hope that it will be useful,
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

module  sim_frac_clk_delay #(
        parameter FRAC_DELAY = 2.3, // periods of clock > 0.5
        parameter SKIP_FIRST = 5 // skip first clock pulses
    ) (
        input      clk,
        input      din,
        output     dout
    );
    localparam integer INT_DELAY = $rtoi (FRAC_DELAY);
//    localparam [0:0] HALF_DELAY = $rtoi(2.0 *(FRAC_DELAY - INT_DELAY));
    localparam [0:0] HALF_DELAY = (FRAC_DELAY - INT_DELAY) >= 0.5;
    localparam RDELAY = (FRAC_DELAY - INT_DELAY) - 0.5 * HALF_DELAY;
    integer num_period = 0;
    reg en = 0;
    real phase;
    real prev_phase = 0.0;
    real frac_period = 0.0;
    
    // measure period
    always @ (posedge clk) begin
        phase = $realtime;
        if (num_period >= SKIP_FIRST) begin
            frac_period = RDELAY* (phase - prev_phase); 
            en = 1;
        end
        prev_phase = phase;
        if (!en) num_period = num_period + 1;
    end
    reg    [INT_DELAY:0] sr = 0;
    reg    [INT_DELAY:0] sr_fract = 0;
    wire [INT_DELAY+1:0] taps = {sr,din};
    wire [INT_DELAY+1:0] taps_fract = {sr_fract,din};
    reg    dly_half;
//    reg    dly_int;
    always @(posedge clk) if (en) begin
         sr <= taps[INT_DELAY:0];
//         #frac_period sr_fract <= taps[INT_DELAY:0];
         #frac_period sr_fract <= sr;
    end  
    always @(negedge clk) if (en)  begin
         #frac_period dly_half = taps[INT_DELAY];
    end     
//    assign dout = dly_half;
//    assign dout = HALF_DELAY ? dly_half : taps[INT_DELAY];
//    assign #frac_period dout = HALF_DELAY ? dly_half : taps[INT_DELAY];
    assign dout = HALF_DELAY ? dly_half : taps_fract[INT_DELAY];
//    assign #(RDELAY*period) dout = HALF_DELAY ? dly_half : taps[INT_DELAY];
endmodule

