/*
#################################################################################################
#   << CologneChip GateMate ILA - Edge Detection of a Signal >>                                 #
#   The module receives a signal and signals when a falling and rising clock edge has occurred  #                                                                     #
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

module nedge_edge_detection(
    input i_clk,
    input i_reset,
    input i_signal,
    output reg o_nedge_edge
);


reg signal_old; 

always @(posedge i_clk) begin
    if (!i_reset) begin
        signal_old <= i_signal;
        o_nedge_edge <= 0;
    end else begin
        signal_old <= i_signal;
        o_nedge_edge <= (~i_signal) & signal_old;
    end
end

endmodule