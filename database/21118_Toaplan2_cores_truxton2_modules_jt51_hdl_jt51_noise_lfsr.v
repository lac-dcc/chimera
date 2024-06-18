// This program was cloned from: https://github.com/atrac17/Toaplan2
// License: GNU General Public License v3.0

/*  This file is part of JT51.

    JT51 is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    JT51 is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with JT51.  If not, see <http://www.gnu.org/licenses/>.
    
    Author: Jose Tejada Gomez. Twitter: @topapate
    Version: 1.0
    Date: 27-10-2016
    */


//  See xapp052.pdf from Xilinx

module jt51_noise_lfsr #(parameter init=14220 )(
    input   rst,
    input   clk,
    input   cen,
    input   base,
    output  out
);

reg [16:0] bb;
assign out = bb[16];

always @(posedge clk, posedge rst) begin : base_counter
    if( rst ) begin
        bb          <= init[16:0];
    end
    else if(cen) begin
        if(  base ) begin   
            bb[16:1]    <= bb[15:0];
            bb[0]       <= ~(bb[16]^bb[13]);
        end
    end
end

endmodule
