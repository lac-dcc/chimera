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
// 7-segment display driver for DE0 board


module segmentdisplay (
    clk,
    latch,
    hexdigit_in,
    display_out
);

    input  clk,latch;
    input  [3:0] hexdigit_in;
    output reg [0:6] display_out;

    always @(posedge clk)
    begin
        if (latch == 1)
        begin 
            case (hexdigit_in)
                4'b0000:
                    display_out <= 7'b1000000;
                4'b0001:
                    display_out <= 7'b1111001;
                4'b0010:
                    display_out <= 7'b0100100;
                4'b0011:
                    display_out <= 7'b0110000;
                4'b0100:
                    display_out <= 7'b0011001;
                4'b0101:
                    display_out <= 7'b0010010;
                4'b0110:
                    display_out <= 7'b0000010;
                4'b0111:
                    display_out <= 7'b1111000;
                4'b1000:
                    display_out <= 7'b0000000;
                4'b1001:
                    display_out <= 7'b0011000;
                4'b1010:
                    display_out <= 7'b0001000;
                4'b1011:
                    display_out <= 7'b0000011;
                4'b1100:
                    display_out <= 7'b1000110;
                4'b1101:
                    display_out <= 7'b0100001;
                4'b1110:
                    display_out <= 7'b0000110;    
                4'b1111:
                    display_out <= 7'b0001110;
            endcase
        end                                                                                                   
    end
endmodule

