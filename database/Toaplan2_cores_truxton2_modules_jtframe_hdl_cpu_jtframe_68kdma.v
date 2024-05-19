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
    along with JTFRAME.  If not, see <http://www.gnu.org/licenses/>.

    Author: Jose Tejada Gomez. Twitter: @topapate
    Version: 1.0
    Date: 12-9-2019 */

module jtframe_68kdma #(parameter BW=1)(
    input          clk,
    input          rst,
    input          cen,
    output     reg cpu_BRn,
    output     reg cpu_BGACKn,
    input          cpu_BGn,
    input          cpu_ASn,
    input          cpu_DTACKn,
    input [BW-1:0] dev_br      // high to signal a bus request from a device
);

// using asynchronous reset will cause Altera FPGAs
// to invert the signals as it can only reset but not preset
always @(posedge clk)
    if( rst ) begin
        cpu_BRn    <= 1'b1;
        cpu_BGACKn <= 1'b1;
    end else if(cen) begin
        casez( {cpu_BGACKn, cpu_BGn} )
            2'b11: // waiting for bus request
                if( |dev_br ) begin
                    cpu_BRn <= 1'b0;                    
                end
            2'b10: begin // bus granted
                if( cpu_ASn && cpu_DTACKn ) cpu_BGACKn <= 1'b0;
            end
            2'b0?: begin // bus held by the device
                cpu_BRn  <= 1'b1;
                if( !(|dev_br) ) begin
                    cpu_BGACKn <= 1'b1; // frees the bus
                end
            end
        endcase
    end

endmodule