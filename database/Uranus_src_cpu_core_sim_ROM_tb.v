// This program was cloned from: https://github.com/ustb-owl/Uranus
// License: GNU General Public License v3.0

`timescale 1ns / 1ps

`include "../define/bus.v"

module ROM_tb(
    // synchronous ROM
    input clk,
    input rst,
    input en,
    input [`ADDR_BUS] addr,
    output reg[`INST_BUS] inst
);

    parameter kROMSize = 4096;

    reg[7:0] rom[kROMSize - 1:0];

    initial begin
        $readmemh("rom/inst.bin", rom);
    end

    always @(posedge clk) begin
        if (!rst || !en) begin
            inst <= 0;
        end
        else begin
            // big endian storage
            inst[7:0] <= #0.1 rom[(addr + 3) & 32'h000fffff];
            inst[15:8] <= #0.1 rom[(addr + 2) & 32'h000fffff];
            inst[23:16] <= #0.1 rom[(addr + 1) & 32'h000fffff];
            inst[31:24] <= #0.1 rom[(addr + 0) & 32'h000fffff];
        end
    end


endmodule // ROM_tb
