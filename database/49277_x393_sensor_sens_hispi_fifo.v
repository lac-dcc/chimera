// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>sens_hispi_fifo
 * @file sens_hispi_fifo.v
 * @date 2015-10-14  
 * @author Andrey Filippov     
 *
 * @brief cross-clock FIFO with special handling of 'run' output
 *
 * @copyright Copyright (c) 2015 Elphel, Inc .
 *
 * <b>License:</b>
 *
 * sens_hispi_fifo.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  sens_hispi_fifo.v is distributed in the hope that it will be useful,
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

module  sens_hispi_fifo#(
//  parameter COUNT_START = 7, // wait these many samples input before starting output
  parameter DATA_WIDTH = 12,
  parameter DATA_DEPTH = 4 // >=3
) (
    input                       ipclk,
    input                       irst,
    input                       we,
    input                       sol,     // start of line - 1 cycle before dv
    input                       eol,     // end of line - last dv 
    input      [DATA_WIDTH-1:0] din,
    input      [DATA_DEPTH-1:0] out_dly, // wait these many samples input before starting output
    input                       pclk,
    input                       prst,
    input                       re,
    output reg [DATA_WIDTH-1:0] dout,   // valid next cycle after re
    output                      run    // has latency 1 after last re
);
    reg [DATA_WIDTH-1:0] fifo_ram[0 : (1 << DATA_DEPTH) -1];
    reg   [DATA_DEPTH:0] wa;
    reg   [DATA_DEPTH:0] ra;
    wire                 line_start_pclk;
    reg                  line_run_ipclk;
    reg                  line_run_ipclk_d; // to generate start for very short lines (may just use small out_dly value)
    reg                  line_run_pclk;
    reg                  run_r;
    reg                  start_sent;
    reg                  start_out_ipclk;
    
    assign run = run_r;
    // TODO: generate early done by comparing ra with (wa-1) - separate counter
    
    always @ (posedge ipclk) begin
        if      (irst ||sol)           wa <= 0;
        else if (we && line_run_ipclk) wa <= wa + 1;
        
        if (we && line_run_ipclk) fifo_ram[wa[DATA_DEPTH-1:0]] <= din;
        
        if (irst || eol) line_run_ipclk <= 0;
        else if (sol)    line_run_ipclk <= 1;

        if      (!line_run_ipclk) start_sent <= 0;
        else if (start_out_ipclk) start_sent <= 1;
        
        line_run_ipclk_d <= line_run_ipclk;
        
        if (irst)  start_out_ipclk <= 0;
        else       start_out_ipclk <= line_run_ipclk? (!start_sent && we && (wa[DATA_DEPTH-1:0] == out_dly)) : (line_run_ipclk_d && !start_sent);
        
    end

    always @(posedge pclk) begin
        line_run_pclk <= line_run_ipclk && (line_run_pclk || line_start_pclk);
        
        if (prst)                              run_r <= 0;
        else if (line_start_pclk)              run_r <= 1;
        else if (!line_run_pclk && (ra == wa)) run_r <= 0;
        
        if (prst ||line_start_pclk) ra <= 0;
        else if (re)                ra <= ra + 1;
        
        if (re) dout <= fifo_ram[ra[DATA_DEPTH-1:0]];
        
    end
    
    pulse_cross_clock #(
        .EXTRA_DLY(0)
    ) pulse_cross_clock_line_start_i (
        .rst       (irst),                      // input
        .src_clk   (ipclk),                     // input
        .dst_clk   (pclk),                      // input
//        .in_pulse  (we && (wa == COUNT_START)), // input
        .in_pulse  (start_out_ipclk), // input
        .out_pulse (line_start_pclk),           // output
        .busy() // output
    );


endmodule

