// This program was cloned from: https://github.com/atrac17/Toaplan2
// License: GNU General Public License v3.0



/* This file is part of JT51.

 
    JT51 program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    JT51 program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with JT51.  If not, see <http://www.gnu.org/licenses/>.

    Author: Jose Tejada Gomez. Twitter: @topapate
    Version: 1.0
    Date: 14-4-2017 

*/

module jt51_mod(
    input       m1_enters,
    input       m2_enters,
    input       c1_enters,
    input       c2_enters,
    
    input [2:0] alg_I,
    
    output reg  use_prevprev1,
    output reg  use_internal_x,
    output reg  use_internal_y,    
    output reg  use_prev2,
    output reg  use_prev1       
);

reg [7:0] alg_hot;

always @(*) begin
    case( alg_I )
        3'd0: alg_hot = 8'h1;  // D0
        3'd1: alg_hot = 8'h2;  // D1
        3'd2: alg_hot = 8'h4;  // D2
        3'd3: alg_hot = 8'h8;  // D3
        3'd4: alg_hot = 8'h10; // D4
        3'd5: alg_hot = 8'h20; // D5
        3'd6: alg_hot = 8'h40; // D6
        3'd7: alg_hot = 8'h80; // D7
        default: alg_hot = 8'hx;
    endcase
end

always @(*) begin
    use_prevprev1   = m1_enters | (m2_enters&alg_hot[5]);
    use_prev2       = (m2_enters&(|alg_hot[2:0])) | (c2_enters&alg_hot[3]);
    use_internal_x  = c2_enters & alg_hot[2];
    use_internal_y  = c2_enters & (|{alg_hot[4:3],alg_hot[1:0]});
    use_prev1       = m1_enters | (m2_enters&alg_hot[1]) |
        (c1_enters&(|{alg_hot[6:3],alg_hot[0]}) )|
        (c2_enters&(|{alg_hot[5],alg_hot[2]}));
end

endmodule
