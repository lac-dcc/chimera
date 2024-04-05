`timescale 1ns / 1ps
`default_nettype none
//
// RISu64
// Copyright 2022 Wenting Zhang
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
//
`include "options.vh"

module l1cache(
    input  wire         clk,
    input  wire         rst,
    // Interface to CPU
    input  wire [31:0]  core_req_addr, // byte address
    input  wire         core_req_wen,
    input  wire [63:0]  core_req_wdata,
    input  wire [7:0]   core_req_wmask,
    input  wire         core_req_cache,
    output wire         core_req_ready,
    input  wire         core_req_valid,
    output wire [63:0]  core_resp_rdata,
    output wire         core_resp_valid,
    // Interface to L2/ arbiter
    output reg  [31:0]  mem_req_addr,
    output reg          mem_req_wen,
    output wire [63:0]  mem_req_wdata,
    output wire [7:0]   mem_req_wmask,
    output wire [2:0]   mem_req_size,
    output reg          mem_req_valid,
    input  wire         mem_req_ready,
    input  wire [63:0]  mem_resp_rdata,
    input  wire         mem_resp_valid,
    output reg          mem_resp_ready,
    // Maintenance request
    input  wire         invalidate_req,
    output reg          invalidate_resp,
    input  wire         flush_req,
    output reg          flush_resp
    );

    // Registered for 2nd-stage of pipeline
    /* verilator lint_off UNUSED */
    reg [31:0]  p2_core_req_addr;
    /* verilator lint_on UNUSED */
    reg         p2_core_req_wen;
    reg [63:0]  p2_core_req_wdata;
    reg [7:0]   p2_core_req_wmask;
    reg         p2_core_req_valid;
    wire cache_int_ready;
    assign core_req_ready = cache_int_ready;

    // 2-way set associative cache with LRU replacement
    // Input address is byte address
    // Cache takes double word (64 bit) address as input to match core port
    // cache line length 256 bit (4 double word) (n = 2)
    // 2 ways (k = 1)
    // each set consists of 256 lines (s = 8)
    // total size = 2 * 32 * 256 = 16 KB 
    // tag length = 29 - 8 - 2 = 19 bits
    // replacement: LRU
    // line length: lru(1) + valid(1) + dirty(1) + tag(19) + data(256) = 278bits
    // LRU bit is inside the top bit of both ways
    // | 19 bit tag | 8 bit set | 2 bit line | 3 bit byte |

    // Performance (from request to data valid)
    //   Read, cache hit: 1 cycles
    //   Read, cache miss: 4 cycles + memory latency
    //   Read, cache miss + flush: 12 cycles + 2x memory latency
    //   Write, cache hit: 1 cycles
    //   Write, cache miss: 5 cylces + memory read latency
    //   Write, cache miss + flush: 13 cycles + 2x memory latency

    // The interface to L2 is an K-Link interface. The burst length is either
    // cache line length (cached access) or data bus width (non-cached access)

    // Flush doesn't invalidate cache, and invalidate doesn't flush cache

    localparam CACHE_WAY = 2; // This shouldn't be changed
    localparam CACHE_WAY_BITS = 1; // This shouldn't be changed
    localparam CACHE_BLOCK = `CACHE_BLOCK; // Line number inside each way
    localparam CACHE_BLOCK_ABITS = `CACHE_BLOCK_ABITS;
    localparam CACHE_LINE_IN_BLOCK = 4;
    localparam CACHE_LINE_IN_BLOCK_ABITS = 2; // Bits needed to address DW inside line
    localparam CACHE_LINE_ABITS = CACHE_BLOCK_ABITS + CACHE_LINE_IN_BLOCK_ABITS;
    localparam CACHE_LINE_DBITS = 64;
    localparam CACHE_LINE_BYTES = CACHE_LINE_DBITS / 8;
    localparam CACHE_ADDR_BITS = 29; // Input DW address bits
    localparam CACHE_TAG_BITS = CACHE_ADDR_BITS - CACHE_BLOCK_ABITS - CACHE_LINE_IN_BLOCK_ABITS;
    localparam CACHE_VALID_BITS = 1; // This shouldn't be changed
    localparam CACHE_DIRTY_BITS = 1; // This shouldn't be changed
    localparam CACHE_LRU_BITS = 1;
    localparam CACHE_LEN_TOTAL = CACHE_TAG_BITS + CACHE_VALID_BITS +
            CACHE_DIRTY_BITS + CACHE_LRU_BITS;
    
    localparam BIT_TAG_START = 0;
    localparam BIT_TAG_END = CACHE_TAG_BITS-1;
    localparam BIT_DIRTY = BIT_TAG_END + 1;
    localparam BIT_VALID = BIT_DIRTY + 1;
    localparam BIT_LRU = BIT_VALID + 1;

    // 1st pipeline stage
    
    /* verilator lint_off UNUSED */
    wire [CACHE_ADDR_BITS-1:0] core_dw_addr = core_req_addr[31:3];
    /* verilator lint_on UNUSED */
    wire [CACHE_BLOCK_ABITS-1:0] cache_meta_raddr =
            core_dw_addr[CACHE_LINE_ABITS-1:CACHE_LINE_IN_BLOCK_ABITS];
    wire [CACHE_BLOCK_ABITS-1:0] cache_meta_raddr_keep =
            p2_core_dw_addr[CACHE_LINE_ABITS-1:CACHE_LINE_IN_BLOCK_ABITS];
    wire [CACHE_BLOCK_ABITS-1:0] cache_meta_raddr_mux =
            cache_int_ready ? cache_meta_raddr :
            invalidate_flush_en ? invalidate_flush_counter :
            cache_meta_raddr_keep;

    wire p2_cache_comparator [0:CACHE_WAY-1];

    wire [CACHE_LEN_TOTAL-1:0] p2_cache_meta_rd [0:CACHE_WAY-1];
    wire [CACHE_LEN_TOTAL-1:0] p2_cache_meta_wr [0:CACHE_WAY-1];
    wire                       p2_cache_meta_we [0:CACHE_WAY-1];
    wire [CACHE_LINE_DBITS-1:0] p2_cache_data_rd [0:CACHE_WAY-1];
    wire [CACHE_LINE_DBITS-1:0] p2_cache_data_wr [0:CACHE_WAY-1];
    wire                        p2_cache_data_we [0:CACHE_WAY-1];

    genvar i, j;
    generate
    for (i = 0; i < CACHE_WAY; i = i + 1) begin: cache_ram
        `ifdef CACHE_META_RAM_PRIM
        `CACHE_META_RAM_PRIM cache_meta(
        `else
        ram_generic_1rw1r #(.DBITS(CACHE_LEN_TOTAL), .ABITS(CACHE_BLOCK_ABITS)) cache_meta(
        `endif
            .clk(clk),
            .rst(rst),
            .raddr(cache_meta_raddr_mux),
        // 2nd pipeline stage (after 1-cycle RAM)
            // Read has 1 cycle delay
            .rd(p2_cache_meta_rd[i]),
            .re(1'b1),
            // Write happens after read, thus in p2
            .waddr(p2_cache_meta_waddr_mux),
            .we(p2_cache_meta_we[i]),
            .wr(p2_cache_meta_wr[i])
        );

        `ifdef CACHE_DATA_RAM_PRIM
        `CACHE_DATA_RAM_PRIM cache_data(
        `else
        ram_generic_1rw1r #(.DBITS(CACHE_LINE_DBITS), .ABITS(CACHE_LINE_ABITS)) cache_data(
        `endif
            .clk(clk),
            .rst(rst),
            .raddr(cache_data_raddr_mux),
        // 2nd pipeline stage (after 1-cycle RAM)
            // Read has 1 cycle delay
            .rd(p2_cache_data_rd[i]),
            .re(1'b1),
            // Write happens after read, thus in p2
            .waddr(p2_cache_data_waddr_mux),
            .we(p2_cache_data_we[i]),
            .wr(p2_cache_data_wr[i])
        );
    end
    endgenerate

    wire [CACHE_ADDR_BITS-1:0] p2_core_dw_addr = p2_core_req_addr[31:3];
    wire [CACHE_TAG_BITS-1:0]  p2_addr_tag =
            p2_core_dw_addr[CACHE_ADDR_BITS-1:CACHE_LINE_ABITS];

    // Uncached support
    reg [7:0] uncached_req_wmask;
    reg [63:0] uncached_req_wdata;

    // Support invalidate request
    reg invalidate_flush_en;
    reg [CACHE_BLOCK_ABITS-1:0] invalidate_flush_counter;
    wire [CACHE_BLOCK_ABITS-1:0] p2_cache_meta_waddr_mux;
    wire [CACHE_BLOCK_ABITS-1:0] p2_cache_meta_waddr =
            p2_core_dw_addr[CACHE_LINE_ABITS-1:CACHE_LINE_IN_BLOCK_ABITS];
    assign p2_cache_meta_waddr_mux = invalidate_flush_en ?
            invalidate_flush_counter : p2_cache_meta_waddr;

    // Sequential reload data array
    wire reload_en = !cache_int_ready && (cache_state != STATE_RETRY);
    reg [CACHE_LINE_IN_BLOCK_ABITS-1: 0] reload_counter;
    wire [CACHE_LINE_ABITS-1:0] cache_data_raddr =
            (cache_int_ready) ? core_dw_addr[CACHE_LINE_ABITS-1:0] :
            p2_core_dw_addr[CACHE_LINE_ABITS-1:0];
    wire [CACHE_LINE_ABITS-1:0] p2_cache_data_waddr =
            p2_core_dw_addr[CACHE_LINE_ABITS-1:0];
    wire [CACHE_LINE_ABITS-1:0] cache_data_raddr_mux = (reload_en) ?
            {p2_cache_meta_waddr, reload_counter} : cache_data_raddr;
    wire [CACHE_LINE_ABITS-1:0] p2_cache_data_waddr_mux = (reload_en) ?
            {p2_cache_meta_waddr, reload_counter} : p2_cache_data_waddr;

    generate
    for (i = 0; i < CACHE_WAY; i = i + 1) begin
        assign p2_cache_comparator[i] =
                ((p2_addr_tag == p2_cache_meta_rd[i][BIT_TAG_END:BIT_TAG_START])
                && (p2_cache_meta_rd[i][BIT_VALID]));
    end
    endgenerate
    
    wire cache_way_updated_lru[0:CACHE_WAY-1];
    assign cache_way_updated_lru[0] = p2_cache_meta_rd[1][BIT_LRU];
    assign cache_way_updated_lru[1] = !p2_cache_meta_rd[0][BIT_LRU];
    
    // Cache WB
    wire [CACHE_LEN_TOTAL-1:0] cache_meta_core_wb [0:CACHE_WAY-1];
    wire [CACHE_LEN_TOTAL-1:0] cache_meta_mem_wb [0:CACHE_WAY-1];
    wire [CACHE_LEN_TOTAL-1:0] cache_meta_flush_wb [0:CACHE_WAY-1];
    wire [CACHE_LEN_TOTAL-1:0] cache_meta_invalidate_wb [0:CACHE_WAY-1];

    wire [CACHE_LINE_DBITS-1:0] cache_data_core_wb [0:CACHE_WAY-1];
    wire [CACHE_LINE_DBITS-1:0] cache_data_mem_wb = mem_resp_rdata;

    localparam CACHE_WB_CORE = 2'd0;
    localparam CACHE_WB_MEM = 2'd1;
    localparam CACHE_WB_FLUSH = 2'd2;
    localparam CACHE_WB_INVALIDATE = 2'd3;
    reg [1:0] cache_way_wb_src;

    generate
    for (i = 0; i < CACHE_WAY; i = i + 1) begin
        // META mem
        // Write-back value for read/ write hit
        assign cache_meta_core_wb[i][BIT_TAG_END:BIT_TAG_START] =
                p2_cache_meta_rd[i][BIT_TAG_END:BIT_TAG_START];
        assign cache_meta_core_wb[i][BIT_VALID] = 1'b1;
        assign cache_meta_core_wb[i][BIT_DIRTY] =
                ((p2_core_req_wen) || (p2_cache_meta_rd[i][BIT_DIRTY]));
        assign cache_meta_core_wb[i][BIT_LRU] = cache_way_updated_lru[i];

        // Write-back value for read/ write miss
        assign cache_meta_mem_wb[i][BIT_TAG_END:BIT_TAG_START] = p2_addr_tag;
        assign cache_meta_mem_wb[i][BIT_VALID] = 1'b1;
        assign cache_meta_mem_wb[i][BIT_DIRTY] = 1'b0;
        assign cache_meta_mem_wb[i][BIT_LRU] = cache_way_updated_lru[i];

        // Write-back value for flush
        assign cache_meta_flush_wb[i][BIT_TAG_END:BIT_TAG_START] =
                p2_cache_meta_rd[i][BIT_TAG_END:BIT_TAG_START];
        assign cache_meta_flush_wb[i][BIT_VALID] = 1'b1;
        assign cache_meta_flush_wb[i][BIT_DIRTY] = 1'b0;
        assign cache_meta_flush_wb[i][BIT_LRU] = p2_cache_meta_rd[i][BIT_LRU];

        // Write-back value for invalidate
        assign cache_meta_invalidate_wb[i][CACHE_LEN_TOTAL-1:0] =
                {(CACHE_LEN_TOTAL){1'b0}};

        // Select cache way writeback
        assign p2_cache_meta_wr[i] =
                (cache_way_wb_src == CACHE_WB_CORE) ? cache_meta_core_wb[i] :
                (cache_way_wb_src == CACHE_WB_MEM) ? cache_meta_mem_wb[i] :
                (cache_way_wb_src == CACHE_WB_FLUSH) ? cache_meta_flush_wb[i] :
                cache_meta_invalidate_wb[i];
        
        // DATA mem
        // Could be removed if DATA memory array supports byte masking
        for (j = 0; j < CACHE_LINE_BYTES; j = j + 1) begin
            assign cache_data_core_wb[i][j*8+7:j*8] =
                    (p2_core_req_wmask[j]) ? (p2_core_req_wdata[j*8+7:j*8]) :
                    (p2_cache_data_rd[i][j*8+7:j*8]);
        end
        assign p2_cache_data_wr[i] =
                (cache_way_wb_src == CACHE_WB_CORE) ? (cache_data_core_wb[i]) :
                (cache_way_wb_src == CACHE_WB_MEM) ? (cache_data_mem_wb) :
                (64'bx);
    end
    endgenerate

    reg cache_meta_we_reg[0:CACHE_WAY-1]; 
    reg cache_data_we_reg[0:CACHE_WAY-1];

    generate
    for (i = 0; i < CACHE_WAY; i = i + 1) begin
        // Wish verilog allows array assigning
        assign p2_cache_meta_we[i] = cache_int_ready ?
                (p2_cache_comparator[i] && p2_core_req_valid) :
                (cache_meta_we_reg[i]);
        assign p2_cache_data_we[i] = cache_int_ready ?
                (p2_cache_comparator[i] && p2_core_req_valid && p2_core_req_wen) :
                (cache_data_we_reg[i]);
    end
    endgenerate

    reg [3: 0] cache_state;
    
    // Cache hit take 1 cycles
    localparam STATE_RESET = 4'd0;      // State after reset
    localparam STATE_PREPARE = 4'd1;
    localparam STATE_READY = 4'd2;
    localparam STATE_LOAD = 4'd3;
    localparam STATE_FLUSH = 4'd4;
    localparam STATE_WAY_WB = 4'd5;
    localparam STATE_RETRY = 4'd6;
    localparam STATE_FLUSH_WAIT_ACK = 4'd7;
    localparam STATE_UNCACHED_REQ = 4'd8;
    localparam STATE_INVALIDATE = 4'd9;
    localparam STATE_BULK_FLUSH_MEMREQ = 4'd10;
    localparam STATE_BULK_FLUSH_MEMRESP = 4'd11;
    localparam STATE_BULK_FLUSH_WAIT = 4'd12;

    // Combinational path for 1-cycle hit
    wire p2_core_resp_valid = (p2_cache_comparator[0] || p2_cache_comparator[1])
            && p2_core_req_valid;
    wire p2_cache_miss = (p2_core_req_valid == 1'b1) && (!p2_core_resp_valid);
    wire [63:0] p2_core_resp_rdata =
            (p2_cache_comparator[0]) ? (p2_cache_data_rd[0]) :
            (p2_cache_comparator[1]) ? (p2_cache_data_rd[1]) : (64'bx);
    assign cache_int_ready =
            ((cache_state == STATE_PREPARE) || (cache_state == STATE_READY)) &&
            !p2_cache_miss;
    reg [63:0] cache_int_resp_rdata;
    reg cache_int_resp_valid;
    assign core_resp_rdata = cache_int_ready ? p2_core_resp_rdata : cache_int_resp_rdata;
    assign core_resp_valid = cache_int_ready ? p2_core_resp_valid : cache_int_resp_valid;

    // LRU policy:
    // For every line, both way have its own LRU bit. Both bits are read out
    // everytime, but only one will be written back.
    // It is encoded as such:
    // W0 W1
    // 0  0 - Way 0 is newer
    // 0  1 - Way 1 is newer
    // 1  0 - Way 1 is newer
    // 1  1 - Way 0 is newer
    // When way 0 need to be newer, it set itself to be the same as way 1's LRU bit 
    // When way 1 need to be newer, it set itself to be different as way 0's LRU bit
    
    reg flush_way;
    wire cache_lru_way_0_newer =
            p2_cache_meta_rd[0][BIT_LRU] == p2_cache_meta_rd[1][BIT_LRU];
    wire cache_lru_way_1_newer = !cache_lru_way_0_newer;
    wire cache_victim = 
            ((cache_state == STATE_BULK_FLUSH_MEMREQ) || (cache_state == STATE_BULK_FLUSH_MEMRESP)) ?
            (flush_way) : ((cache_lru_way_1_newer) ? 1'b0 : 1'b1);

    wire [31:0] cache_flush_mem_addr =
            {p2_cache_meta_rd[cache_victim][BIT_TAG_END: BIT_TAG_START],
            p2_cache_meta_waddr, 2'b0, 3'b0};
    wire [31:0] cache_load_mem_addr = 
            {p2_addr_tag, p2_cache_meta_waddr, 2'b0, 3'b0};
    
    always@(posedge clk) begin
        /* verilator lint_off CASEINCOMPLETE */
        case (cache_state)
        /* verilator lint_on CASEINCOMPLETE */
        STATE_RESET: begin
            invalidate_flush_counter <= invalidate_flush_counter + 1;
            /* verilator lint_off WIDTH */
            if (invalidate_flush_counter == CACHE_BLOCK - 1) begin
            /* verilator lint_on WIDTH */
                cache_state <= STATE_PREPARE;
            end
        end
        STATE_PREPARE: begin
            cache_meta_we_reg[0] <= 1'b0;
            cache_meta_we_reg[1] <= 1'b0;
            cache_way_wb_src <= CACHE_WB_CORE;
            p2_core_req_addr <= core_req_addr;
            p2_core_req_wen <= core_req_wen;
            p2_core_req_wdata <= core_req_wdata;
            p2_core_req_wmask <= core_req_wmask;
            p2_core_req_valid <= core_req_valid;
            cache_int_resp_valid <= 1'b0;
            invalidate_resp <= 1'b0;
            flush_resp <= 1'b0;
            cache_state <= STATE_READY;
        end
        STATE_READY: begin
            invalidate_flush_en <= 1'b0;
            // At this state, way_we and core_resp_rdata / resp_valid
            // are supplied by combinational logic for 1-cycle hit.
            if (invalidate_req) begin
                cache_meta_we_reg[0] <= 1'b1;
                cache_meta_we_reg[1] <= 1'b1;
                cache_way_wb_src <= CACHE_WB_INVALIDATE;
                invalidate_flush_counter <= 0;
                invalidate_flush_en <= 1'b1;
                cache_state <= STATE_INVALIDATE;
            end
            else if (flush_req) begin
                cache_way_wb_src <= CACHE_WB_FLUSH;
                invalidate_flush_counter <= 0;
                invalidate_flush_en <= 1'b1;
                reload_counter <= 0;
                flush_way <= 1'b0;
                cache_state <= STATE_BULK_FLUSH_WAIT;
            end
            else if (core_req_valid && core_req_ready && !core_req_cache) begin
                mem_req_wen <= core_req_wen;
                mem_req_addr <= core_req_addr;
                mem_req_valid <= 1'b1;
                mem_resp_ready <= 1'b1;
                uncached_req_wdata <= core_req_wdata;
                uncached_req_wmask <= core_req_wmask;
                cache_state <= STATE_UNCACHED_REQ;
            end
            else if (p2_cache_miss) begin
                // Requested but miss
                // Check if the cache line needed to be flushed before RW
                if (p2_cache_meta_rd[cache_victim][BIT_VALID] &&
                        p2_cache_meta_rd[cache_victim][BIT_DIRTY]) begin
                    // flush is required before overwritting
                    reload_counter <= 0;
                    // Need to wait for a cycle for cache line read
                    // Issue write next cycle
                    cache_state <= STATE_FLUSH;
                    //$display("Cache miss, way %d flush.", cache_victim);
                end
                else begin
                    // flush is not required
                    reload_counter <= 0;
                    // Issue Reload request
                    mem_req_wen <= 1'b0;
                    mem_req_addr <= cache_load_mem_addr;
                    mem_req_valid <= 1'b1;
                    mem_resp_ready <= 1'b1;
                    cache_way_wb_src <= CACHE_WB_MEM;
                    cache_state <= STATE_LOAD;
                    cache_data_we_reg[cache_victim] <= 1'b1;
                    //$display("Cache miss, way %d load.", cache_victim);
                end
            end
            else begin
                p2_core_req_addr <= core_req_addr;
                p2_core_req_wen <= core_req_wen;
                p2_core_req_wdata <= core_req_wdata;
                p2_core_req_wmask <= core_req_wmask;
                p2_core_req_valid <= core_req_valid;
            end
        end
        STATE_FLUSH: begin
            mem_req_wen <= 1'b1;
            mem_req_addr <= cache_flush_mem_addr;
            mem_req_valid <= 1'b1;
            if (mem_req_ready) begin
                // Data in last beat has been accepted, continue to next beat
                reload_counter <= reload_counter + 1;
                /* verilator lint_off WIDTH */
                if (reload_counter == (CACHE_LINE_IN_BLOCK - 1)) begin
                /* verilator lint_on WIDTH */
                    // Writeback finished, waiting for acknowledge from L2
                    cache_state <= STATE_FLUSH_WAIT_ACK;
                    mem_resp_ready <= 1'b1;
                end
            end
        end
        STATE_FLUSH_WAIT_ACK: begin
            mem_req_valid <= 1'b0;
            if (mem_resp_valid) begin
                mem_resp_ready <= 1'b0;
                reload_counter <= 0;
                // Issue Reload request
                mem_req_wen <= 1'b0;
                mem_req_addr <= cache_load_mem_addr;
                mem_req_valid <= 1'b1;
                mem_resp_ready <= 1'b1;
                cache_way_wb_src <= CACHE_WB_MEM;
                cache_data_we_reg[cache_victim] <= 1'b1;
                cache_state <= STATE_LOAD;
            end
        end
        STATE_LOAD: begin
            // Ack the A channel request if accepted
            if (mem_req_ready) begin
                mem_req_valid <= 1'b0;
            end
            // Writeback way data if got a beat from L2
            if (mem_resp_valid) begin
                reload_counter <= reload_counter + 1;
                /* verilator lint_off WIDTH */
                if (reload_counter == (CACHE_LINE_IN_BLOCK - 1)) begin
                /* verilator lint_on WIDTH */
                    mem_resp_ready <= 1'b0;
                    cache_state <= STATE_WAY_WB;
                    cache_meta_we_reg[cache_victim] <= 1'b1;
                    cache_data_we_reg[cache_victim] <= 1'b0;
                    // Start data RAM read one cycle earlier
                    reload_counter <=
                            core_dw_addr[CACHE_LINE_IN_BLOCK_ABITS-1:0];
                end
            end
        end
        STATE_WAY_WB: begin
            // Finish way writeback
            cache_meta_we_reg[0] <= 1'b0;
            cache_meta_we_reg[1] <= 1'b0;
            cache_data_we_reg[0] <= 1'b0;
            cache_data_we_reg[1] <= 1'b0;
            cache_way_wb_src <= CACHE_WB_CORE;
            cache_state <= STATE_RETRY;
        end
        STATE_RETRY: begin
            // Essentially a wait state
            cache_int_resp_valid <= 1'b0;
            cache_state <= STATE_READY;
        end
        STATE_UNCACHED_REQ: begin
            if (mem_req_ready)
                mem_req_valid <= 1'b0;

            if (mem_resp_valid) begin
                mem_resp_ready <= 1'b0;
                cache_int_resp_rdata <= mem_resp_rdata;
                cache_int_resp_valid <= 1'b1;
                cache_state <= STATE_RETRY;
            end
        end
        STATE_INVALIDATE: begin
            invalidate_flush_counter <= invalidate_flush_counter + 1;
            /* verilator lint_off WIDTH */
            if (invalidate_flush_counter == CACHE_BLOCK - 1) begin
            /* verilator lint_on WIDTH */
                cache_state <= STATE_PREPARE;
                invalidate_resp <= 1'b1;
            end
        end
        STATE_BULK_FLUSH_MEMREQ: begin
            cache_meta_we_reg[0] <= 1'b0;
            cache_meta_we_reg[1] <= 1'b0;
            if (p2_cache_meta_rd[cache_victim][BIT_VALID] &&
                        p2_cache_meta_rd[cache_victim][BIT_DIRTY]) begin
                mem_req_wen <= 1'b1;
                mem_req_addr <= cache_flush_mem_addr;
                mem_req_valid <= 1'b1;
                if (mem_req_ready) begin
                    // Data in last beat has been accepted, continue to next beat
                    reload_counter <= reload_counter + 1;
                    /* verilator lint_off WIDTH */
                    if (reload_counter == (CACHE_LINE_IN_BLOCK - 1)) begin
                    /* verilator lint_on WIDTH */
                        // Writeback finished, waiting for acknowledge from L2
                        cache_state <= STATE_BULK_FLUSH_MEMRESP;
                        cache_meta_we_reg[cache_victim] <= 1'b1;
                        mem_resp_ready <= 1'b1;
                    end
                end
            end
            else begin
                invalidate_flush_counter <= invalidate_flush_counter + 1;
                cache_state <= STATE_BULK_FLUSH_WAIT;
                /* verilator lint_off WIDTH */
                if (invalidate_flush_counter == CACHE_BLOCK - 1) begin
                /* verilator lint_on WIDTH */
                    if (flush_way == 1'b0) begin
                        flush_way <= 1'b1;
                    end
                    else begin
                        cache_state <= STATE_PREPARE;
                        flush_resp <= 1'b1;
                    end
                end
            end
        end
        STATE_BULK_FLUSH_MEMRESP: begin
            mem_req_valid <= 1'b0;
            cache_meta_we_reg[0] <= 1'b0;
            cache_meta_we_reg[1] <= 1'b0;
            if (mem_resp_valid) begin
                mem_resp_ready <= 1'b0;
                reload_counter <= 0;
                invalidate_flush_counter <= invalidate_flush_counter + 1;
                cache_state <= STATE_BULK_FLUSH_WAIT;
                /* verilator lint_off WIDTH */
                if (invalidate_flush_counter == CACHE_BLOCK - 1) begin
                /* verilator lint_on WIDTH */
                    if (flush_way == 1'b0) begin
                        flush_way <= 1'b1;
                    end
                    else begin
                        cache_state <= STATE_PREPARE;
                        flush_resp <= 1'b1;
                    end
                end
            end
        end
        STATE_BULK_FLUSH_WAIT: begin
            cache_state <= STATE_BULK_FLUSH_MEMREQ;
        end
        endcase

        if (rst) begin
            cache_state <= STATE_RESET;
            mem_req_valid <= 1'b0;
            mem_resp_ready <= 1'b0;
            cache_meta_we_reg[0] <= 1'b1;
            cache_meta_we_reg[1] <= 1'b1;
            cache_data_we_reg[0] <= 1'b0;
            cache_data_we_reg[1] <= 1'b0;
            cache_way_wb_src <= CACHE_WB_INVALIDATE;
            /* verilator lint_off WIDTH */
            invalidate_flush_counter <= 0;
            /* verilator lint_on WIDTH */
            invalidate_flush_en <= 1'b1;
            p2_core_req_valid <= 1'b0;
            cache_int_resp_valid <= 1'b0;
            invalidate_resp <= 1'b0;
            flush_resp <= 1'b0;
        end
    end
    
    // Tieoff fixed outputs
    assign mem_req_size = (cache_state == STATE_UNCACHED_REQ) ?
        3'd3 : // Fixed 64-bit
        3'd5; // 2^5 = 32 byte / 4 beats on 64-bit bus
    assign mem_req_wmask = (cache_state == STATE_UNCACHED_REQ) ?
        uncached_req_wmask : 8'hFF;
    assign mem_req_wdata = (cache_state == STATE_UNCACHED_REQ) ?
        uncached_req_wdata : p2_cache_data_rd[cache_victim];

endmodule
