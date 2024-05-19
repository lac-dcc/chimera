// This program was cloned from: https://github.com/Elphel/x393_sata
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>clock_inverter
 * @file clock_inverter.v
 * @date 2016-02-11  
 * @author Andrey Filippov     
 *
 * @brief Glitch-free clock controlled inverter
 *
 * @copyright Copyright (c) 2016 Elphel, Inc .
 *
 * <b>License:</b>
 *
 * clock_inverter.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  clock_inverter.v is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/> .
 */
`timescale 1ns/1ps

module  clock_inverter(
    input     rst,    // just for simulation
    input     clk_in,
    input     invert,
    output    clk_out
);
`ifdef SUPPORTED_BUFGCTRL_INVERION
    BUFGCTRL #(
        .INIT_OUT            (0),
        .IS_CE0_INVERTED     (1'b0),
        .IS_CE1_INVERTED     (1'b0),
        .IS_I0_INVERTED      (1'b1),
        .IS_I1_INVERTED      (1'b0),
        .IS_IGNORE0_INVERTED (1'b0),
        .IS_IGNORE1_INVERTED (1'b0),
        .IS_S0_INVERTED      (1'b1),
        .IS_S1_INVERTED      (1'b0),
        .PRESELECT_I0        ("TRUE"),
        .PRESELECT_I1        ("FALSE")
    ) BUFGCTRL_i (
        .O       (clk_out), // output
        .CE0     (1'b1),    // input
        .CE1     (1'b1),    // input
        .I0      (clk_in),  // input
        .I1      (clk_in),  // input
        .IGNORE0 (1'b0),    // input
        .IGNORE1 (1'b0),    // input
        .S0      (invert),  // input
        .S1      (invert)   // input
    );
`else
    reg invert_r;
    reg pos_r;
    reg neg_r;
    // poor man's ddr
    always @ (posedge clk_in) begin
        invert_r <= invert;
        pos_r <= !rst && !pos_r;
    end
    
    always @ (negedge clk_in) begin
        neg_r <=    pos_r;
    end
    BUFGCTRL #(
        .INIT_OUT      (0),
        .PRESELECT_I0  ("TRUE"),
        .PRESELECT_I1  ("FALSE")
    ) BUFGCTRL_i (
        .O       (clk_out),        // output
        .CE0     (1'b1),           // input
        .CE1     (1'b1),           // input
        .I0      (pos_r ^ neg_r),  // input
        .I1      (pos_r == neg_r), // input
        .IGNORE0 (1'b0),           // input
        .IGNORE1 (1'b0),           // input
        .S0      (!invert_r),      // input
        .S1      ( invert_r)       // input
    );
    
`endif
endmodule

