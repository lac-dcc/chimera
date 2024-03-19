/*******************************************************************************
 * Module: dly01_16
 * Date:2014-05-30  
 * Author: Andrey Filippov
 * Description: Synchronous delay by 1-16 clock cycles with reset (will map to primitive)
 *
 * Copyright (c) 2014 Elphel, Inc.
 * dly01_16.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  dly01_16.v is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/> .
 *******************************************************************************/
`timescale 1ns/1ps

module  dly01_16(
    input       clk,
    input       rst,
    input [3:0] dly,
    input       din,
    output reg  dout
);
    reg [15:0] sr=0;
    always @ (posedge rst or posedge clk) begin
       if (rst) sr <=0;
       else     sr <= {sr[14:0],din}; 
    end
    
    always @ (sr or dly) case (dly)
        4'h0: dout <= sr[ 0];
        4'h1: dout <= sr[ 1];
        4'h2: dout <= sr[ 2];
        4'h3: dout <= sr[ 3];
        4'h4: dout <= sr[ 4];
        4'h5: dout <= sr[ 5];
        4'h6: dout <= sr[ 6];
        4'h7: dout <= sr[ 7];
        4'h8: dout <= sr[ 8];
        4'h9: dout <= sr[ 9];
        4'ha: dout <= sr[10];
        4'hb: dout <= sr[11];
        4'hc: dout <= sr[12];
        4'hd: dout <= sr[13];
        4'he: dout <= sr[14];
        4'hf: dout <= sr[15];
        endcase
endmodule

