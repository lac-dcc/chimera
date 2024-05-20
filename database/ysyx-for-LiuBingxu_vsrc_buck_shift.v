// This program was cloned from: https://github.com/Liu-Bingxu/ysyx-for-LiuBingxu
// License: GNU General Public License v3.0

// Barrel shifter
// Copyright (C) 2024  LiuBingxu

// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.

// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.

// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <https://www.gnu.org/licenses/>.

// Please contact me through the following email: <qwe15889844242@163.com>

module buck_shift#(parameter DATA_LEN = 32, SHAMT_LEN =5 ) (
    input                       LR,
    input                       AL,
    input  [SHAMT_LEN-1:0]      shamt,
    input  [DATA_LEN-1:0]       data_in,
    output [DATA_LEN-1:0]       data_out
);

wire [DATA_LEN-1:0] temp[SHAMT_LEN-2:0];

genvar i;
generate for(i = 0 ; i < SHAMT_LEN; i = i + 1) begin :shift
    if(i==0)begin
        shift_base #(DATA_LEN,2**i)u_shift_base(
            .LR       	( LR        ),
            .AL       	( AL        ),
            .shift_en 	( shamt[i]  ),
            .data_in  	( data_in   ),
            .data_out 	( temp[i]   )
        ); 
    end
    else if(i==SHAMT_LEN-1)begin
        shift_base #(DATA_LEN,2**i)u_shift_base(
            .LR       	( LR        ),
            .AL       	( AL        ),
            .shift_en 	( shamt[i]  ),
            .data_in  	( temp[i-1] ),
            .data_out 	( data_out  )
        );
    end
    else begin
        shift_base #(DATA_LEN,2**i)u_shift_base(
            .LR       	( LR        ),
            .AL       	( AL        ),
            .shift_en 	( shamt[i]  ),
            .data_in  	( temp[i-1] ),
            .data_out 	( temp[i]   )
        );
    end
end
endgenerate

endmodule //buck_shift

