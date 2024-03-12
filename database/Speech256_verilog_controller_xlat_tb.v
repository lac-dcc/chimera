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
// XLAT testbench
//

module XLAT_TB;    
    reg [7:0]  c8_in;
    wire [9:0] c10_out;

    XLAT u_xlat (
        c8_in, 
        c10_out
    );

    integer i;
    initial
    begin
        $dumpfile ("xlat.vcd");
        $dumpvars;
        c8_in[7] = 0;
        for(i=0; i<128; i=i+1)
        begin
            c8_in[6:0] = i;
            #10;
        end
        $finish;
    end

endmodule
