// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>simul_clk_mult
 * @file simul_clk_mult.v
 * @date 2015-10-10  
 * @author Andrey Filippov     
 *
 * @brief Clock multiplier
 *
 * @copyright Copyright (c) 2015 Elphel, Inc .
 *
 * <b>License:</b>
 *
 * simul_clk_mult.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  simul_clk_mult.v is distributed in the hope that it will be useful,
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

module  simul_clk_mult#(
        parameter MULTIPLIER = 3,
        parameter SKIP_FIRST = 5
    ) (
        input      clk_in,
        input      en,
        output     clk_out
    );
    real phase;
    real prev_phase = 0.0;
    real out_half_period = 0.0;
    integer num_period = 0;
    reg en1 = 0;
    reg clk_out_r = 0;
    assign clk_out = (MULTIPLIER == 1)? clk_in: clk_out_r;
    always @ (posedge clk_in) begin
        phase = $realtime;
        if (num_period >= SKIP_FIRST) begin
            out_half_period = (phase - prev_phase) / (2 * MULTIPLIER); 
            en1 = 1;
        end
        prev_phase = phase;
        num_period = num_period + 1;
    end
    
    always @ (posedge clk_in) if (en && en1) begin
        clk_out_r = 1;
        repeat (MULTIPLIER - 1) begin
            #out_half_period clk_out_r = 0;
            #out_half_period clk_out_r = 1;
        end
        #out_half_period clk_out_r = 0;
    end

endmodule

