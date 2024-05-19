// This program was cloned from: https://github.com/ustb-owl/Uranus
// License: GNU General Public License v3.0

`timescale 1ns / 1ps

// direct mapped cache line

module CacheLine #(parameter
    ADDR_WIDTH = 32,
    LINE_WIDTH = 6,         // 2^6 = 64 bytes/line
    CACHE_WIDTH = 6         // 2^6 = 64 lines
    `define INDEX_WIDTH     (LINE_WIDTH - 2)
    `define TAG_WIDTH       (ADDR_WIDTH - LINE_WIDTH - CACHE_WIDTH)
) (
    input clk,
    input rst,
    input write_en,
    // input signals
    input valid_in,
    input dirty_in,
    input [`TAG_WIDTH - 1:0] tag_in,
    input [`INDEX_WIDTH - 1:0] index_in,
    input [3:0] data_byte_en,
    input [31:0] data_in,
    // output signals
    output valid_out,
    output dirty_out,
    output [`TAG_WIDTH - 1:0] tag_out,
    output [31:0] data_out
);

    reg valid, dirty;
    reg[`TAG_WIDTH - 1:0] tag;
    reg[31:0] data[2 ** `INDEX_WIDTH - 1:0];

    assign valid_out = valid;
    assign dirty_out = valid ? dirty : 0;
    assign tag_out = tag;
    assign data_out = valid ? data[index_in] : 0;

    always @(posedge clk) begin
        if (!rst) begin
            valid <= 0;
            dirty <= 0;
            tag <= 0;
        end
        else if (write_en) begin
            valid <= valid_in;
            dirty <= dirty_in;
            tag <= tag_in;
        end
    end

    always @(posedge clk) begin
        if (write_en) begin
            if (data_byte_en[0]) data[index_in][7:0] <= data_in[7:0];
            if (data_byte_en[1]) data[index_in][15:8] <= data_in[15:8];
            if (data_byte_en[2]) data[index_in][23:16] <= data_in[23:16];
            if (data_byte_en[3]) data[index_in][31:24] <= data_in[31:24];
        end
    end

endmodule // CacheLine
