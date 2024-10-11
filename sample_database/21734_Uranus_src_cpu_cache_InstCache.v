// This program was cloned from: https://github.com/ustb-owl/Uranus
// License: GNU General Public License v3.0

`timescale 1ns / 1ps

// instruction cache: direct mapped, read-only

// TODO:
// this module is unfinished! (hit_invalidate & addr_inv part)
// for reference ONLY!
// other parts have been already tested

module InstCache #(parameter
    ADDR_WIDTH = 32,
    LINE_WIDTH = 6,         // 2^6 = 64 bytes/line
    CACHE_WIDTH = 6         // 2^6 = 64 lines
    `define LINE_COUNT      (2 ** CACHE_WIDTH)
    `define INDEX_WIDTH     (LINE_WIDTH - 2)
    `define TAG_WIDTH       (ADDR_WIDTH - LINE_WIDTH - CACHE_WIDTH)
) (
    input clk,
    input rst,
    // cache control
    input read_en,
    input flush,   // TODO: remove?
    input hit_invalidate,
    input [ADDR_WIDTH - 1:0] addr_read,
    input [ADDR_WIDTH - 1:0] addr_inv,
    output ready,
    output [31:0] data_out,
    // AXI interface
    output [3:0]  arid,
    output [31:0] araddr,
    output [7:0]  arlen,
    output [2:0]  arsize,
    output [1:0]  arburst,
    output [1:0]  arlock,
    output [3:0]  arcache,
    output [2:0]  arprot,
    output        arvalid,
    input         arready,
    // ---
    input  [3:0]  rid,
    input  [31:0] rdata,
    input  [1:0]  rresp,
    input         rlast,
    input         rvalid,
    output        rready,
    // ---
    output [3:0]  awid,
    output [31:0] awaddr,
    output [7:0]  awlen,
    output [2:0]  awsize,
    output [1:0]  awburst,
    output [1:0]  awlock,
    output [3:0]  awcache,
    output [2:0]  awprot,
    output        awvalid,
    input         awready,
    // ---
    output [3:0]  wid,
    output [31:0] wdata,
    output [3:0]  wstrb,
    output        wlast,
    output        wvalid,
    input         wready,
    // ---
    input  [3:0]  bid,
    input  [1:0]  bresp,
    input         bvalid,
    output        bready
);

    // cache line connector
    wire line_write_en[`LINE_COUNT - 1:0];
    reg line_valid_in;
    reg[`TAG_WIDTH - 1:0] line_tag_in;
    reg[`INDEX_WIDTH - 1:0] line_index_in;
    reg[31:0] line_data_in;
    wire line_valid_out[`LINE_COUNT - 1:0];
    wire[`TAG_WIDTH - 1:0] line_tag_out[`LINE_COUNT - 1:0];
    wire[31:0] line_data_out[`LINE_COUNT - 1:0];

    // generate cache lines
    genvar i;
    generate
        for (i = 0; i < `LINE_COUNT; i = i + 1) begin
            CacheLine #(
                .ADDR_WIDTH(ADDR_WIDTH),
                .LINE_WIDTH(LINE_WIDTH),
                .CACHE_WIDTH(CACHE_WIDTH)
            ) line (
                .clk(clk),
                .rst(rst && !flush),   // flush cache line
                .write_en(line_write_en[i]),
                .valid_in(line_valid_in),
                .dirty_in(0),
                .tag_in(line_tag_in),
                .index_in(line_index_in),
                .data_byte_en(4'b1111),
                .data_in(line_data_in),
                .valid_out(line_valid_out[i]),
                .dirty_out(/* null */),
                .tag_out(line_tag_out[i]),
                .data_out(line_data_out[i])
            );
        end
    endgenerate

    // cache line selector
    wire[`TAG_WIDTH - 1:0] line_tag;
    wire[CACHE_WIDTH - 1:0] line_sel;
    wire[`INDEX_WIDTH - 1:0] line_index;
    wire is_cache_hit;
    assign line_tag = addr_read[ADDR_WIDTH - 1:LINE_WIDTH + CACHE_WIDTH];
    assign line_sel = addr_read[LINE_WIDTH + CACHE_WIDTH - 1:LINE_WIDTH];
    assign line_index = addr_read[LINE_WIDTH - 1:2];
    assign is_cache_hit = line_valid_out[line_sel]
            && line_tag_out[line_sel] == line_tag;

    reg cache_write_en;
    generate
        for (i = 0; i < `LINE_COUNT; i = i + 1) begin
            assign line_write_en[i] = cache_write_en ? line_sel == i : 0;
        end
    endgenerate

    // AXI adapter
    reg[31:0] axi_read_addr;
    reg axi_read_valid;
    assign araddr = axi_read_addr;
    assign arlen = 2 ** `INDEX_WIDTH - 1;
    assign arvalid = axi_read_valid;
    // constants
    assign arid = 4'b0;
    assign arsize = 3'b010;
    assign arburst = 2'b01;
    assign arlock = 2'b0;
    assign arcache = 4'b0;
    assign arprot = 3'b0;
    assign rready = 1'b1;
    assign awid = 4'b0;
    assign awaddr = 32'b0;
    assign awlen = 8'b0;
    assign awsize = 3'b0;
    assign awburst = 2'b0;
    assign awlock = 2'b0;
    assign awcache = 4'b0;
    assign awprot = 3'b0;
    assign awvalid = 1'b0;
    assign wid = 4'b0;
    assign wdata = 32'b0;
    assign wstrb = 4'b0;
    assign wlast = 1'b0;
    assign wvalid = 1'b0;
    assign bready = 1'b0;

    // FSM definition
    reg[1:0] state, next_state;
    parameter kStateIdle = 0, kStateAddr = 1,
            kStateData = 2, kStateUpdate = 3;
    assign ready = state == kStateIdle && is_cache_hit;
    assign data_out = ready ? line_data_out[line_sel] : 0;

    always @(posedge clk) begin
        if (!rst) begin
            state <= kStateIdle;
        end
        else begin
            state <= next_state;
        end
    end

    always @(*) begin
        case (state)
            kStateIdle: begin
                if (!read_en) begin
                    // idle
                    next_state <= kStateIdle;
                end
                else if (is_cache_hit) begin
                    // read, and cache hit
                    next_state <= kStateIdle;
                end
                else begin
                    // read, but cache miss
                    next_state <= kStateAddr;
                end
            end
            kStateAddr: begin
                next_state <= arready ? kStateData : kStateAddr;
            end
            kStateData: begin
                next_state <= rlast ? kStateUpdate : kStateData;
            end
            kStateUpdate: begin
                next_state <= kStateIdle;
            end
            default: next_state <= kStateIdle;
        endcase
    end

    always @(posedge clk) begin
        if (!rst) begin
            // cache control
            line_valid_in <= 0;
            line_tag_in <= 0;
            line_index_in <= 0;
            line_data_in <= 0;
            cache_write_en <= 0;
            // AXI
            axi_read_addr <= 0;
            axi_read_valid <= 0;
        end
        else begin
            case (state)
                kStateIdle: begin
                    line_valid_in <= 0;
                    line_tag_in <= 0;
                    line_index_in <= line_index;
                    line_data_in <= 0;
                    // TODO: test
                    cache_write_en <= hit_invalidate && is_cache_hit;
                    axi_read_addr <= 0;
                    axi_read_valid <= 0;
                end
                kStateAddr: begin
                    line_valid_in <= 0;
                    line_tag_in <= 0;
                    line_index_in <= -1;
                    line_data_in <= 0;
                    cache_write_en <= 0;
                    axi_read_addr <= addr_read;
                    axi_read_valid <= 1;
                end
                kStateData: begin
                    line_valid_in <= 1;
                    line_tag_in <= line_tag;
                    cache_write_en <= 1;
                    axi_read_addr <= 0;
                    axi_read_valid <= 0;
                    if (rvalid) begin
                        line_index_in <= line_index_in + 1;
                        line_data_in <= rdata;
                    end
                    else begin
                        line_index_in <= line_index_in;
                        line_data_in <= 0;
                    end
                end
                kStateUpdate: begin
                    line_valid_in <= 1;
                    line_tag_in <= line_tag;
                    line_index_in <= 0;
                    line_data_in <= 0;
                    cache_write_en <= 0;
                    axi_read_addr <= 0;
                    axi_read_valid <= 0;
                end
                default: begin
                    line_valid_in <= 0;
                    line_tag_in <= 0;
                    line_index_in <= 0;
                    line_data_in <= 0;
                    cache_write_en <= 0;
                    axi_read_addr <= 0;
                    axi_read_valid <= 0;
                end
            endcase
        end
    end

endmodule // InstCache
