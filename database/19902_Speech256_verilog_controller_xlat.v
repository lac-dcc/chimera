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
// 8-bit sign-magnitude to 10-bit sign-magnitude 
// conversion block
//
//
// C1: x*8
// C2: 301 + (x-38)*4 = 301 - 152 + x*4 = 149 + x*4
// C3: 425 + (x-69)*2 = 425 - 138 + x*2 = 287 + x*2
// C4: 481 + (x-97)   = 481 - 97  + x   = 384 + x
//
//
//
//

module XLAT (
        c8_in, 
        c10_out
    );

    input      [7:0] c8_in;
    output reg [9:0] c10_out;
    wire sign;

    assign sign = ~c8_in[7];

    always@(*)
    begin
        if (c8_in[6:0] < 38)
            c10_out <= {sign, c8_in[5:0], 3'b000};
        else if (c8_in[6:0] < 69)
            c10_out <= {sign, {c8_in[6:0], 2'b00} + 9'd149};
        else if (c8_in[6:0] < 97)
            c10_out <= {sign, {{1'b0, c8_in[6:0]}, 1'b0} + 9'd287};
        else
            c10_out <= {sign, {{2'b00, c8_in[6:0]} + 9'd384}};
    end
endmodule
