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

module SD2DAC_TB;
    reg clk, rst_an; 
    reg signed [15:0] din;
    wire dacout, din_ack;

    real accu;

    SD2DAC u_sd2dac (
        .clk     (clk),
        .rst_an  (rst_an),
        .din     (din),
        .din_ack (din_ack),
        .dacout  (dacout)
    );

    integer fd;

    initial
    begin
        fd = $fopen("dacout.sw","wb");
        $dumpfile ("sd2dac.vcd");
        $dumpvars;
        clk = 0;
        rst_an = 0;
        din = 0;
        accu = 0;
        #3
        rst_an = 1;
        #1048576
        $fclose(fd);
        $finish;
    end

    always @(posedge clk)
    begin
        if (din_ack)
        begin
            accu = accu + 1.0/256.0;
            if (accu > 1.0)
                accu = -1.0;
            din = $rtoi($sin(2.0*3.1415927*accu)*10000.0);
        end
        if (dacout == 1)
            $fwrite(fd,"%u", 32'h7000_0000);
        else
            $fwrite(fd,"%u", 32'h9000_0000);
    end

    always
        #5 clk = !clk;

endmodule