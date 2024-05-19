// This program was cloned from: https://github.com/ustb-owl/Uranus
// License: GNU General Public License v3.0

`timescale 1ns / 1ps

`include "../define/bus.v"

module HILOReadProxy(
    // from HI & LO register
    input [`DATA_BUS] hi_in,
    input [`DATA_BUS] lo_in,
    // from MEM stage
    input mem_hilo_write_en,
    input [`DATA_BUS] mem_hi_in,
    input [`DATA_BUS] mem_lo_in,
    // from WB stage
    input wb_hilo_write_en,
    input [`DATA_BUS] wb_hi_in,
    input [`DATA_BUS] wb_lo_in,
    // HI & LO data output
    output reg[`DATA_BUS] hi_out,
    output reg[`DATA_BUS] lo_out
);

    // generate output
    always @(*) begin
        if (mem_hilo_write_en) begin
            hi_out <= mem_hi_in;
            lo_out <= mem_lo_in;
        end
        else if (wb_hilo_write_en) begin
            hi_out <= wb_hi_in;
            lo_out <= wb_lo_in;
        end
        else begin
            hi_out <= hi_in;
            lo_out <= lo_in;
        end
    end

endmodule // HILOReadProxy
