/*
#################################################################################################
#   << CologneChip GateMate ILA - SPI Slave >>                                                  #
#   No global mesh signal trace is wasted for the externally applied clock signal.              #
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

module spi_slave(
    (* clkbuf_inhibit *) input i_sclk,
    input i_ss,
    input i_mosi,
    input i_echo,
    input [7:0] i_byte_send,
    output o_miso,
    output o_rec_byte_ready,
    output [7:0] o_byte_rec
);


reg [7:0] tx_shift_reg;
reg [7:0] rx_shift_reg;
reg [2:0] bit_cnt;
reg end_byte_s, end_byte_rec_read;
reg [7:0] o_byte_rec_reg;

wire [7:0] send_byte;


always @(posedge i_sclk) begin
    if (i_ss) begin
        rx_shift_reg <= 0;
    end else begin    
        rx_shift_reg <= {rx_shift_reg[6:0], i_mosi};
    end
end

always @(posedge i_sclk) begin
    if (i_ss) begin
        bit_cnt <= 3'b111;
    end
    else begin
        bit_cnt <= bit_cnt + 1'b1;
    end
end 


always @(negedge i_sclk) 
begin
    if (i_ss) begin
        end_byte_s <= 0;
        o_byte_rec_reg <= 0;
    end
    else if (bit_cnt == 3'b111) begin
        end_byte_s <= 1;
        o_byte_rec_reg <= rx_shift_reg;
    end
    else begin
        end_byte_s <= 0;
    end
end


assign o_rec_byte_ready = end_byte_s;

assign o_byte_rec = o_byte_rec_reg;

assign send_byte = i_echo ? o_byte_rec_reg : i_byte_send;

always @(posedge i_sclk) 
begin
    if (i_ss) begin
        tx_shift_reg <= 0;
    end
    else if (end_byte_s) begin
        tx_shift_reg <= send_byte;
    end
    else begin
        tx_shift_reg <= {tx_shift_reg[6:0], 1'b0};
    end
end


assign o_miso = tx_shift_reg[7];

endmodule