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
// Controller testbench
//

module CONTROLLER_TB;
    reg clk, rst_an; 
    
    reg [5:0] data_in;
    reg data_stb, serve_next;
    reg period_done;
    wire clear_states;
    
    wire ldq;
    wire [9:0] coeff;
    wire coeff_load;
    wire [7:0]  period;
    wire [15:0] amp;
    wire [7:0]  dur;

    CONTROLLER u_controller (
        .clk        (clk),
        .rst_an     (rst_an),
        .ldq        (ldq),
        .data_in    (data_in),
        .data_stb   (data_stb),
        .period_out (period),
        .amp_out    (amp),
        .coeff_out  (coeff),
        .coeff_stb  (coeff_load),
        .clear_states (clear_states),
        .period_done_in (period_done)
    );

    initial
    begin
        $dumpfile ("controller.vcd");
        $dumpvars;
        clk = 0;
        rst_an = 0;
        data_in = 6;
        data_stb = 0;
        period_done = 0;
        #5
        rst_an = 1;
        #5
        // load allophone
        data_stb = 1;
        #10
        data_stb = 0;
        serve_next = 1;
        #300000
        $finish;
    end

    always @(posedge clk)
    begin   
        ;
    end

    always
        #5 clk = !clk;

endmodule
