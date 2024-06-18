// This program was cloned from: https://github.com/colognechip/gatemate_ila
// License: GNU General Public License v3.0

/*
#################################################################################################
#   << CologneChip GateMate ILA - receive command hold >>                                       #
#   This module checks if a byte matches a defined pattern and activates an output signal once  #
#   a match is found.                                                                           #
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

module receive_command_hold#(
    parameter ADDR = 8'b00000000 
)
(
    input i_clk,
    input i_reset,
    input i_ready_read,
    input [7:0] i_Byte,
    output o_hold
);

wire start;
reg hold;

reg start_1;
reg start_2;

always @(posedge i_clk) begin
    if (!i_reset) begin
        start_1 <= 0;
    end else if(ADDR[7:4] == i_Byte[7:4]) begin
        start_1 <= 1;
    end
    else begin
        start_1 <= 0;
    end
end
always @(posedge i_clk) begin
    if (!i_reset) begin
        start_2 <= 0;
    end else if(ADDR[3:0] == i_Byte[3:0]) begin
        start_2 <= 1;
    end
    else begin
        start_2 <= 0;
    end
end

    assign start = start_2 & start_1; 

always @(posedge i_clk) begin
    if (!i_reset) begin
        hold <= 0;
    end 
    else if (start & i_ready_read) begin
        hold <= 1;
    end
end

assign o_hold = hold;

endmodule