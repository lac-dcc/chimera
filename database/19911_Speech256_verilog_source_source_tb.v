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
// PWMDAC testbench
//

module SOURCE_TB;
    reg clk, rst_an, strobe; 
    reg signed [14:0] amp;
    reg [7:0] period;

    reg [7:0] cnt;

    wire signed [15:0] source_out;
    wire period_done;

    SOURCE u_source (
        .clk     (clk),
        .rst_an  (rst_an),
        .period  (period),
        .amplitude (amp),
        .strobe  (strobe),
        .period_done (period_done),
        .source_out  (source_out)
    );

    integer fd; // file descriptor

    initial
    begin
        fd = $fopen("audio.sw","wb");
        $dumpfile ("source.vcd");
        $dumpvars;
        clk = 0;
        rst_an = 0;
        strobe = 0;
        period = 50;
        amp    = 15000;
        cnt    = 0;
        #3
        rst_an = 1;
        #300000
        period = 0; // switch to noise mode
        #300000
        $fclose(fd);
        $finish;
    end

    always @(posedge clk)
    begin        
        if (cnt == 4)
        begin
            cnt <= 0;
            strobe <= 1;            
            $fwrite(fd,"%u",{ {16{source_out[15]}} ,source_out});
        end
        else
        begin
            strobe <= 0;
            cnt <= cnt + 1;
        end        
    end

    always
        #5 clk = !clk;

endmodule