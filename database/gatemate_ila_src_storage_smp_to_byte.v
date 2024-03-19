/*
#################################################################################################
# << CologneChip GateMate ILA - sample to byte >>                                               #
# This module is required to split a sample of any size into eight-bit packets                  #
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


module smp_to_byte#(
    parameter sample_width = 24
)(
    input i_clk_ILA,
    input i_read_active,
    input [(sample_width-1):0] i_ram_sample,
    input i_slave_end_byte_post_edge,
    output [7:0] o_send_byte,
    output o_rd
);


parameter packages_per_sample = ((sample_width-1)/8)+1;
parameter shift_cnt_width = $clog2(packages_per_sample);
parameter zero_padding_bits = (packages_per_sample*8) - sample_width;
reg [((packages_per_sample*8)-1):0] shift_reg;

wire init_reg;

reg [(shift_cnt_width-1):0] shift_counter;

// The data from the BRAM needs to be shifted
always @(posedge i_clk_ILA) begin
    if (init_reg | (!i_read_active)) begin               
        shift_reg <= {{zero_padding_bits{1'b0}}, i_ram_sample};
    end
    else if (i_slave_end_byte_post_edge) begin
        shift_reg <= {8'b00000000, shift_reg[((packages_per_sample*8)-1):8]};
    end
end

// shift counter 
always @(posedge i_clk_ILA) begin
    if (!i_read_active) begin
        shift_counter <= 0;
    end
    else if (i_slave_end_byte_post_edge) begin
        if (init_reg) begin
            shift_counter <= 0;
        end
        else begin
            shift_counter <= shift_counter + 1;
        end
    end
end
reg rd;
assign init_reg = (shift_counter == (packages_per_sample-1) & i_slave_end_byte_post_edge);
always @(posedge i_clk_ILA) begin
    if (!i_read_active) begin
        rd <= 0;
    end else begin
        rd <= init_reg & i_read_active;
    end
end
assign o_rd = rd;

reg [7:0] o_send;

always @(posedge i_clk_ILA) begin
    if (!i_read_active) begin
        o_send <= 0;
    end else begin
        o_send <= shift_reg[7:0];
    end
end

assign o_send_byte = o_send;

endmodule