// This program was cloned from: https://github.com/colognechip/gatemate_ila
// License: GNU General Public License v3.0

/*
#################################################################################################
#   << CologneChip GateMate ILA - receive cmd nibble >>                                         #
#   This module checks if a nibble matches a defined pattern, activates an output signal and    #
#   output the other 4 Bit from the byte once a match is found and disable output signal upon   #
#   specific input activation.                                                                  #
# ********************************************************************************************* #
#    Copyright (C) 2023 Cologne Chip AG <support@colognechip.com>                               #
#    Developed by Dave Fohrn                                                                    #
#                                                                                               #
#    This program is free software: you can redistribute it and/or modify                       #
#    it under the terms of the GNU General Public License as published by                       #
#    the Free Software Foundation, either version 3 of the License, or                          #
#    (at your option) any later version.                                                        #
#                                                                                               #
#    This program is distributed in the hope that it will be useful,                            #
#    but WITHOUT ANY WARRANTY; without even the implied warranty of                             #
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the                              #
#    GNU General Public License for more details.                                               #
#                                                                                               #
#    You should have received a copy of the GNU General Public License                          #
#    along with this program.  If not, see <https://www.gnu.org/licenses/>.                     #
#                                                                                               #
# ********************************************************************************************* #
#################################################################################################
*/

module rec_cmd_nib#(
    parameter ADDR = 4'b0000 // Bit Pattern
)
(
    input i_clk,
    input i_reset,
    input i_ready_read,
    input [7:0] i_Byte,
    input i_done,
    output [3:0] o_data,
    output o_hold
);

reg start;
reg hold;
reg [3:0] data;


always @(posedge i_clk) begin
    if (!i_reset) begin
        start <= 0;
    end else if(ADDR == i_Byte[7:4]) begin
        start <= 1;
    end
    else begin
        start <= 0;
    end
end

always @(posedge i_clk) begin
    if (!i_reset | i_done) begin
        hold <= 0;
    end 
    else if (start & i_ready_read) begin
        hold <= 1;
    end
end

always @(posedge i_clk) begin
    if (!i_reset) begin
        data <= 0;
    end 
    else if (start & i_ready_read) begin
        data <= i_Byte[3:0];
    end
end

assign o_hold = hold;
assign o_data = data;

endmodule