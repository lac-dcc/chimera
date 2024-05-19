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
// 
// PWMDAC testbench
//

module PWMDAC_TB;
    reg clk, rst_an; 
    reg signed [7:0] din;
    wire dacout, din_ack;

    real accu;

    PWMDAC u_pwmdac (
        .clk     (clk),
        .rst_an  (rst_an),
        .din     (din),
        .din_ack (din_ack),
        .dacout  (dacout)
    );

    initial
    begin
        $dumpfile ("pwmdac.vcd");
        $dumpvars;
        clk = 0;
        rst_an = 0;
        din = 0;
        accu = 0;
        #3
        rst_an = 1;
        #655360     
        $finish;
    end

    always @(posedge clk)
    begin
        if (din_ack)
        begin
            accu = accu + 1.0/256.0;
            if (accu > 1.0)
                accu = -1.0;
            din = $rtoi($sin(2.0*3.1415927*accu)*127.0);
        end
    end

    always
        #5 clk = !clk;

endmodule