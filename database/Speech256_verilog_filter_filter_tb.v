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
// FILTER testbench
//


module FILTER_TB;
    reg clk, rst_an, start, coef_load, check_finish, clear_states; 
    reg signed [15:0] sig_in;
    reg signed [9:0]  coef_in;
    reg        [3:0]  reg_sel;
    
    wire signed [15:0] sig_out;
    wire done;

    parameter load_simple = 1;
    defparam u_filter.DEBUG = 1;

    FILTER u_filter (
        .clk        (clk),
        .rst_an     (rst_an),
        .coef_in    (coef_in),
        .coef_load  (coef_load),
        .clear_states (clear_states),
        .sig_in     (sig_in),
        .sig_out    (sig_out),
        .start      (start),
        .done       (done)
    );

    integer i;

    initial
    begin
        $dumpfile ("filter.vcd");
        $dumpvars;
        clk    = 0;
        rst_an = 0;

        sig_in      = 16'h0010;
        coef_in     = 0;
        coef_load   = 0;
        start       = 0;
        clear_states  = 0;
        check_finish  = 0;

        #10
        rst_an = 1;

        // load all the coefficients
    if (load_simple == 1)
    begin
        #10
        coef_load = 1;
        // section 1
        coef_in     = 10'h1C9;
        #10
        coef_in     = 10'h3E4;
        #10
        // section 2
        coef_in     = 10'h0B8;
        #10
        coef_in     = 10'h3CF;
        #10
        // section 3
        coef_in     = 10'h038;
        #10
        coef_in     = 10'h280;
        #10
        // section 4
        coef_in     = 10'h395;
        #10
        coef_in     = 10'h3BF;
        #10
        // section 5
        coef_in     = 10'h335;
        #10
        coef_in     = 10'h3BF;
        #10
        // section 6
        coef_in     = 10'h000;
        #10
        coef_in     = 10'h000;    
    end
    else
    begin        
        #10
        coef_load = 1;
        // section 1
        coef_in     = 10'h3C9;
        #10
        coef_in     = 10'h1E4;
        #10
        // section 2
        coef_in     = 10'h2B8;
        #10
        coef_in     = 10'h1CF;
        #10
        // section 3
        coef_in     = 10'h238;
        #10
        coef_in     = 10'h080;
        #10
        // section 4
        coef_in     = 10'h195;
        #10
        coef_in     = 10'h1BF;
        #10
        // section 5
        coef_in     = 10'h135;
        #10
        coef_in     = 10'h1BF;
        #10
        // section 6
        coef_in     = 10'h000;
        #10
        coef_in     = 10'h000;
    end        
        #10    
        coef_load = 0;
        start = 1;
        #20000;
        check_finish = 1;
    end

    always@(posedge clk)
    begin
        if ((done == 1) && (coef_load != 1))
            $display("%d", sig_out);
    end

    always
        #5 clk = !clk;

    always @(posedge done)
        if ((done == 1) && (check_finish == 1)) 
            $finish;

endmodule
