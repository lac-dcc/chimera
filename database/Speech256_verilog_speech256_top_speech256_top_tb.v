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
// Speech256 top level testbench
//

module SPEECH256_TOP_TB;
    reg clk, rst_an; 
    reg [5:0] data_in;
    reg data_stb;
    wire sample_stb;
    wire signed [15:0] sample_out;
    wire ldq,pwm_out;

    reg [7:0] allophones[0:10];
    reg [3:0] allo_idx;

    SPEECH256_TOP u_speech256_top (
        .clk        (clk),
        .rst_an     (rst_an),
        .ldq        (ldq),
        .data_in    (data_in),
        .data_stb   (data_stb),
        .pwm_out    (pwm_out),
        .sample_out (sample_out),
        .sample_stb (sample_stb)
    );

    integer fd; // file descriptor

    initial
    begin

    `ifdef HELLOWORLD
        // hello, world
        allophones[0] = 6'h1B;
        allophones[1] = 6'h07;
        allophones[2] = 6'h2D;
        allophones[3] = 6'h35;
        allophones[4] = 6'h03;
        allophones[5] = 6'h2E;
        allophones[6] = 6'h1E;
        allophones[7] = 6'h33;
        allophones[8] = 6'h2D;
        allophones[9] = 6'h15;
        allophones[10] = 6'h03;
        allophones[11] = 6'h00;
    `else 
        // E.T. phone
        allophones[0] = 6'h13;
        allophones[1] = 6'h02;
        allophones[2] = 6'h0D;
        allophones[3] = 6'h13;
        allophones[4] = 6'h03;
        allophones[5] = 6'h00;
        allophones[6] = 6'h00;
        allophones[7] = 6'h00;
        allophones[8] = 6'h00;
        allophones[9] = 6'h00;
        allophones[10] = 6'h00;
        allophones[11] = 6'h00;   
    `endif
        fd = $fopen("dacout.sw","wb");
        $dumpfile ("speech256_top.vcd");
        $dumpvars;
        clk = 0;
        rst_an = 0;
        allo_idx = 0;
        #5
        rst_an <= 1;
        //#5
        //#9000000
        //$fclose(fd);
        //$finish;
    end

    reg last_sample_stb;
    always @(posedge clk)
    begin
        // check for new output sample
        if ((sample_stb == 1) && (last_sample_stb != sample_stb))
        begin
            $fwrite(fd,"%u", $signed( {sample_out, 16'h0000} ));
        end
        last_sample_stb <= sample_stb;

        // check for next allophone
        if ((ldq == 1) && (data_stb == 0))
        begin
            data_stb <= 1;
            data_in  <= allophones[allo_idx];
            $display("Allophone %d", allo_idx);
            allo_idx <= allo_idx + 1;
            if (allo_idx == 11)
                $finish;
        end
        else
            data_stb <= 0;
    end

    always
        #5 clk = !clk;

endmodule
