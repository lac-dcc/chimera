// This program was cloned from: https://github.com/atrac17/Toaplan2
// License: GNU General Public License v3.0

/*  This file is part of JTFRAME.
    JTFRAME program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    JTFRAME program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with JTFRAME. If not, see <http://www.gnu.org/licenses/>.

    Author: Jose Tejada Gomez. Twitter: @topapate
    Version: 1.0
    Date: 22-6-2022 */

module jtframe_paddle(
    input              rst,
    input              clk,
    input signed [8:0] mouse_dx,
    input              mouse_st,
    output reg   [7:0] paddle
);

`ifdef JTFRAME_PADDLE
    localparam [7:0] PADDLE_MAX = `JTFRAME_PADDLE;
`else
    localparam [7:0] PADDLE_MAX = 0;
`endif

`ifdef JTFRAME_PADDLE_SENS
    localparam PADDLE_SENS = `JTFRAME_PADDLE_SENS;
`else
    localparam PADDLE_SENS = 0;
`endif

reg  [8:0] nx_x;

always @* begin
    nx_x = paddle + mouse_dx;
    // check overflow
    if( nx_x[8] ) begin
        nx_x = mouse_dx[8] ? 9'd0 : {1'b0,PADDLE_MAX};
    end
end

always @(posedge clk, posedge rst) begin
    if( rst ) begin
        paddle <= 0;
    end else begin
        if( mouse_st ) paddle <= nx_x[7:0] > PADDLE_MAX ? PADDLE_MAX : nx_x[7:0];
    end
end

endmodule
