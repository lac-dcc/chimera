// This program was cloned from: https://github.com/ustb-owl/Uranus
// License: GNU General Public License v3.0

`timescale 1ns / 1ps

`include "../define/bus.v"

module RAM_tb(
    input clk,
    input rst,
    input en,
    input [3:0] write_sel,
    input [`ADDR_BUS] addr,
    input [`DATA_BUS] data_in,
    output reg[`DATA_BUS] data_out
);

    parameter kSubRamSize = 128;

    reg[7:0] ram0[0:kSubRamSize - 1];
    reg[7:0] ram1[0:kSubRamSize - 1];
    reg[7:0] ram2[0:kSubRamSize - 1];
    reg[7:0] ram3[0:kSubRamSize - 1];

    integer i;
    initial begin
        for (i = 0; i < kSubRamSize; i = i + 1) begin
            ram0[i] <= 0;
            ram1[i] <= 0;
            ram2[i] <= 0;
            ram3[i] <= 0;
        end
    end

    wire out_en = rst && en && !write_sel;
    always @(posedge clk) begin
        if (out_en && !addr[31:9] && !addr[1:0]) begin
            data_out[7:0] <= ram3[addr[31:2]];
            data_out[15:8] <= ram2[addr[31:2]];
            data_out[23:16] <= ram1[addr[31:2]];
            data_out[31:24] <= ram0[addr[31:2]];
        end
        else begin
            data_out <= 0;
        end
    end

    reg inner_en;
    always @(posedge clk) begin
        inner_en <= write_sel && en && rst;
    end

    always @(posedge inner_en) begin
        if (inner_en && !addr[31:9] && !addr[1:0]) begin
            if (write_sel[0]) ram3[addr[31:2]] <= data_in[7:0];
            if (write_sel[1]) ram2[addr[31:2]] <= data_in[15:8];
            if (write_sel[2]) ram1[addr[31:2]] <= data_in[23:16];
            if (write_sel[3]) ram0[addr[31:2]] <= data_in[31:24];
        end
    end

endmodule // RAM_tb
