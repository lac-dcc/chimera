// This program was cloned from: https://github.com/trcwm/Speech256
// License: GNU Lesser General Public License v3.0

// SPEECH 256
// Copyright (C) 2017 Niels Moseley / Moseley Instruments
// http://www.moseleyinstruments.com
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <http://www.gnu.org/licenses/>.
// 
// SPMUL testbench
//

module SPMUL_TB;
    reg clk, rst_an, start; 
    reg signed [15:0] sig;
    reg signed [9:0]  coef;
    wire signed [15:0] result;
    wire done;

    SPMUL u_spmul (
        .clk     (clk),
        .rst_an  (rst_an),
        .sig_in  (sig),
        .coef_in (coef),
        .result_out  (result),
        .start   (start),
        .done    (done)
    );

    initial
    begin
        $dumpfile ("spmul.vcd");
        $dumpvars;
        clk    = 0;
        rst_an = 0;
        sig    = 16'h7FFF;
        coef   = 10'h3FF; // sign-magnitude
        start  = 1;
        #3
        rst_an = 1;
        #10
        start  = 0;
        #1024;
    end

    always
        #5 clk = !clk;

    always @(posedge done)
    begin
        if ((done == 1) && (start == 0))
        begin
            $display("Expected: %d, got %d", -32703 , result);
            $finish;
        end
    end
endmodule
