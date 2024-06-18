// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>freq_meter
 * @file freq_meter.v
 * @date 2016-02-13  
 * @author Andrey Filippov     
 *
 * @brief Measure device clock frequency to set the local clock
 *
 * @copyright Copyright (c) 2016 Elphel, Inc .
 *
 * <b>License:</b>
 *
 * freq_meter.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  freq_meter.v is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/> .
 */
`timescale 1ns/1ps

module  freq_meter#(
    parameter WIDTH =    12, // width of the result
    parameter PRESCALE = 1 // 0 same frequency, +1 - xclk is tvice faster, -1 - twice slower
)(
    input                     rst,
    input                     clk,
    input                    xclk,
    output reg [WIDTH - 1:0] dout
);
    localparam TIMER_WIDTH = WIDTH - PRESCALE;
    reg [TIMER_WIDTH - 1 :0] timer;
    reg       [WIDTH - 1 :0] counter;
    
    wire                     restart;
    reg                [3:0] run_xclk;
    
    always @ (posedge clk) begin
        if      (rst || restart)          timer <= 0;
        else if (!timer[TIMER_WIDTH - 1]) timer <= timer + 1;
        
        if (restart) dout <= counter; // it is stopped before copying
        
    end
    always @ (posedge xclk) begin
        run_xclk <= {run_xclk[2:0], ~timer[TIMER_WIDTH - 1] & ~rst};
        
        if      (run_xclk[2]) counter <= counter + 1;
        else if (run_xclk[1]) counter <= 0;
        
    end
    
    pulse_cross_clock #(
        .EXTRA_DLY(0)
    ) xclk2clk_i (
        .rst       (rst),                         // input
        .src_clk   (xclk),                        // input
        .dst_clk   (clk),                         // input
        .in_pulse  (!run_xclk[2] && run_xclk[3]), // input
        .out_pulse (restart),                     // output
        .busy      ()                             // output
    );
    
    
endmodule

