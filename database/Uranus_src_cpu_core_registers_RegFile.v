// This program was cloned from: https://github.com/ustb-owl/Uranus
// License: GNU General Public License v3.0

`timescale 1ns / 1ps

`include "../define/bus.v"

module RegFile(
    input clk,
    input rst,
    input write_en,
    input read_en_1,
    input read_en_2,
    input [`REG_ADDR_BUS] write_addr,
    input [`REG_ADDR_BUS] read_addr_1,
    input [`REG_ADDR_BUS] read_addr_2,
    input [`DATA_BUS] write_data,
    output reg[`DATA_BUS] read_data_1,
    output reg[`DATA_BUS] read_data_2
);

    reg[`DATA_BUS] registers[0:31];

    // writing
    always @(posedge clk) begin
        if (!rst) begin
            registers[0] <= 0; registers[1] <= 0; registers[2] <= 0;
            registers[3] <= 0; registers[4] <= 0; registers[5] <= 0;
            registers[6] <= 0; registers[7] <= 0; registers[8] <= 0;
            registers[9] <= 0; registers[10] <= 0; registers[11] <= 0;
            registers[12] <= 0; registers[13] <= 0; registers[14] <= 0;
            registers[15] <= 0; registers[16] <= 0; registers[17] <= 0;
            registers[18] <= 0; registers[19] <= 0; registers[20] <= 0;
            registers[21] <= 0; registers[22] <= 0; registers[23] <= 0;
            registers[24] <= 0; registers[25] <= 0; registers[26] <= 0;
            registers[27] <= 0; registers[28] <= 0; registers[29] <= 0;
            registers[30] <= 0; registers[31] <= 0;
        end
        else if (write_en && write_addr) begin
            registers[write_addr] <= write_data;
        end
    end

    // reading 1
    always @(*) begin
        if (!rst) begin
            read_data_1 <= `DATA_BUS_WIDTH'b0;
        end
        else if (read_addr_1 == write_addr && write_en && read_en_1) begin
            // forward data to output
            read_data_1 <= write_data;
        end
        else if (read_en_1) begin
            read_data_1 <= registers[read_addr_1];
        end
        else begin
            read_data_1 <= `DATA_BUS_WIDTH'b0;
        end
    end

    // reading 2
    always @(*) begin
        if (!rst) begin
            read_data_2 <= `DATA_BUS_WIDTH'b0;
        end
        else if (read_addr_2 == write_addr && write_en && read_en_2) begin
            // forward data to output
            read_data_2 <= write_data;
        end
        else if (read_en_2) begin
            read_data_2 <= registers[read_addr_2];
        end
        else begin
            read_data_2 <= `DATA_BUS_WIDTH'b0;
        end
    end

endmodule // RegFile
