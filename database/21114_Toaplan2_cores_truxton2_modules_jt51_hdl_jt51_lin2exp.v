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


module jt51_lin2exp(
  input      [15:0] lin,
  output reg [9:0] man,
  output reg [2:0] exp
);

always @(*) begin
  casez( lin[15:9] )
    // negative numbers
    7'b10?????: begin
        man = lin[15:6];
        exp = 3'd7;
      end
    7'b110????: begin
        man = lin[14:5];
        exp = 3'd6;
      end
    7'b1110???: begin
        man = lin[13:4];
        exp = 3'd5;
      end
    7'b11110??: begin
        man = lin[12:3];
        exp = 3'd4;
      end
    7'b111110?: begin
        man = lin[11:2];
        exp = 3'd3;
      end
    7'b1111110: begin
        man = lin[10:1];
        exp = 3'd2;
      end
    7'b1111111: begin
        man = lin[ 9:0];
        exp = 3'd1;
      end    
    // positive numbers
    7'b01?????: begin
        man = lin[15:6];
        exp = 3'd7;
      end
    7'b001????: begin
        man = lin[14:5];
        exp = 3'd6;
      end
    7'b0001???: begin
        man = lin[13:4];
        exp = 3'd5;
      end
    7'b00001??: begin
        man = lin[12:3];
        exp = 3'd4;
      end
    7'b000001?: begin
        man = lin[11:2];
        exp = 3'd3;
      end
    7'b0000001: begin
        man = lin[10:1];
        exp = 3'd2;
      end
    7'b0000000: begin
        man = lin[ 9:0];
        exp = 3'd1;
      end
    
    default: begin
        man = lin[9:0];
        exp = 3'd1;
      end
  endcase
end

endmodule
