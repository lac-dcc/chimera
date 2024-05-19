// This program was cloned from: https://github.com/ultraembedded/core_axi_cache
// License: BSD 3-Clause "New" or "Revised" License

//-----------------------------------------------------------------
// Copyright (c) 2021, admin@ultra-embedded.com
// All rights reserved.
// 
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions 
// are met:
//   - Redistributions of source code must retain the above copyright
//     notice, this list of conditions and the following disclaimer.
//   - Redistributions in binary form must reproduce the above copyright
//     notice, this list of conditions and the following disclaimer 
//     in the documentation and/or other materials provided with the 
//     distribution.
//   - Neither the name of the author nor the names of its contributors 
//     may be used to endorse or promote products derived from this 
//     software without specific prior written permission.
// 
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS 
// "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT 
// LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR 
// A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE AUTHOR BE 
// LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR 
// CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF 
// SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR 
// BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF 
// LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF 
// THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF 
// SUCH DAMAGE.
//-----------------------------------------------------------------
module l2_cache_core
(
    // Inputs
     input           clk_i
    ,input           rst_i
    ,input           flush_i
    ,input  [ 31:0]  inport_addr_i
    ,input  [ 31:0]  inport_data_wr_i
    ,input           inport_rd_i
    ,input  [  3:0]  inport_wr_i
    ,input           outport_accept_i
    ,input           outport_ack_i
    ,input           outport_error_i
    ,input  [255:0]  outport_read_data_i

    // Outputs
    ,output [31:0]   inport_data_rd_o
    ,output          inport_accept_o
    ,output          inport_ack_o
    ,output          inport_error_o
    ,output          outport_wr_o
    ,output          outport_rd_o
    ,output [ 31:0]  outport_addr_o
    ,output [255:0]  outport_write_data_o
);

//-----------------------------------------------------------------
// This cache instance is 2 way set associative.
// The total size is 128KB.
// The replacement policy is a limited pseudo random scheme
// (between lines, toggling on line thrashing).
// The cache is a write back cache, with allocate on read and write.
//-----------------------------------------------------------------
// Number of ways
localparam L2_CACHE_NUM_WAYS           = 2;

// Number of cache lines
localparam L2_CACHE_NUM_LINES          = 2048;
localparam L2_CACHE_LINE_ADDR_W        = 11;

// Line size (e.g. 32-bytes)
localparam L2_CACHE_LINE_SIZE_W        = 5;
localparam L2_CACHE_LINE_SIZE          = 32;
localparam L2_CACHE_LINE_WORDS         = 8;

// Request -> tag address mapping
localparam L2_CACHE_TAG_REQ_LINE_L     = 5;  // L2_CACHE_LINE_SIZE_W
localparam L2_CACHE_TAG_REQ_LINE_H     = 15; // L2_CACHE_LINE_ADDR_W+L2_CACHE_LINE_SIZE_W-1
localparam L2_CACHE_TAG_REQ_LINE_W     = 11;  // L2_CACHE_LINE_ADDR_W
`define L2_CACHE_TAG_REQ_RNG          L2_CACHE_TAG_REQ_LINE_H:L2_CACHE_TAG_REQ_LINE_L

// Tag fields
`define L2_CACHE_TAG_ADDR_RNG          15:0
localparam L2_CACHE_TAG_ADDR_BITS      = 16;
localparam L2_CACHE_TAG_DIRTY_BIT      = L2_CACHE_TAG_ADDR_BITS + 0;
localparam L2_CACHE_TAG_VALID_BIT      = L2_CACHE_TAG_ADDR_BITS + 1;
localparam L2_CACHE_TAG_DATA_W         = L2_CACHE_TAG_ADDR_BITS + 2;

// Tag compare bits
localparam L2_CACHE_TAG_CMP_ADDR_L     = L2_CACHE_TAG_REQ_LINE_H + 1;
localparam L2_CACHE_TAG_CMP_ADDR_H     = 32-1;
localparam L2_CACHE_TAG_CMP_ADDR_W     = L2_CACHE_TAG_CMP_ADDR_H - L2_CACHE_TAG_CMP_ADDR_L + 1;
`define   L2_CACHE_TAG_CMP_ADDR_RNG   31:16

// Address mapping example:
//  31          16 15 14 13 12 11 10 09 08 07 06 05 04 03 02 01 00
// |--------------|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
//  +--------------------+  +--------------------+   +------------+
//  |  Tag address.      |  |   Line address     |      Address 
//  |                    |  |                    |      within line
//  |                    |  |                    |
//  |                    |  |                    |- L2_CACHE_TAG_REQ_LINE_L
//  |                    |  |- L2_CACHE_TAG_REQ_LINE_H
//  |                    |- L2_CACHE_TAG_CMP_ADDR_L
//  |- L2_CACHE_TAG_CMP_ADDR_H

//-----------------------------------------------------------------
// States
//-----------------------------------------------------------------
localparam STATE_W           = 4;
localparam STATE_RESET       = 4'd0;
localparam STATE_FLUSH_ADDR  = 4'd1;
localparam STATE_FLUSH       = 4'd2;
localparam STATE_LOOKUP      = 4'd3;
localparam STATE_READ        = 4'd4;
localparam STATE_WRITE       = 4'd5;
localparam STATE_REFILL      = 4'd6;
localparam STATE_EVICT       = 4'd7;
localparam STATE_EVICT_WAIT  = 4'd8;

// States
reg [STATE_W-1:0]           next_state_r;
reg [STATE_W-1:0]           state_q;

//-----------------------------------------------------------------
// Request buffer
//-----------------------------------------------------------------
reg [31:0]  inport_addr_m_q;
reg [31:0]  inport_data_m_q;
reg [3:0]   inport_wr_m_q;
reg         inport_rd_m_q;

always @ (posedge clk_i )
if (rst_i)
begin
    inport_addr_m_q      <= 32'b0;
    inport_data_m_q      <= 32'b0;
    inport_wr_m_q        <= 4'b0;
    inport_rd_m_q        <= 1'b0;
end
else if (inport_accept_o)
begin
    inport_addr_m_q      <= inport_addr_i;
    inport_data_m_q      <= inport_data_wr_i;
    inport_wr_m_q        <= inport_wr_i;
    inport_rd_m_q        <= inport_rd_i;
end
else if (inport_ack_o)
begin
    inport_addr_m_q      <= 32'b0;
    inport_data_m_q      <= 32'b0;
    inport_wr_m_q        <= 4'b0;
    inport_rd_m_q        <= 1'b0;
end

reg inport_accept_r;

always @ *
begin
    inport_accept_r = 1'b0;

    if (state_q == STATE_LOOKUP)
    begin
        // Previous access missed - do not accept new requests
        if ((inport_rd_m_q || (inport_wr_m_q != 4'b0)) && !tag_hit_any_m_w)
            inport_accept_r = 1'b0;
        // Write followed by read - detect writes to the same line, or addresses which alias in tag lookups
        else if ((|inport_wr_m_q) && inport_rd_i && inport_addr_i[31:2] == inport_addr_m_q[31:2])
            inport_accept_r = 1'b0;
        else
            inport_accept_r = 1'b1;
    end
end

assign inport_accept_o = inport_accept_r;

// Tag comparison address
wire [L2_CACHE_TAG_CMP_ADDR_W-1:0] req_addr_tag_cmp_m_w = inport_addr_m_q[`L2_CACHE_TAG_CMP_ADDR_RNG];

//-----------------------------------------------------------------
// Registers / Wires
//-----------------------------------------------------------------
reg [0:0]  replace_way_q;

wire           pmem_wr_w;
wire           pmem_rd_w;
wire  [  7:0]  pmem_len_w;
wire  [ 31:0]  pmem_addr_w;
wire  [255:0]  pmem_write_data_w;
wire           pmem_accept_w;
wire           pmem_ack_w;
wire           pmem_error_w;
wire  [255:0]  pmem_read_data_w;

wire           evict_way_w;
wire           tag_dirty_any_m_w;
wire           tag_hit_and_dirty_m_w;

reg            flushing_q;

//-----------------------------------------------------------------
// TAG RAMS
//-----------------------------------------------------------------
reg [L2_CACHE_TAG_REQ_LINE_W-1:0] tag_addr_x_r;
reg [L2_CACHE_TAG_REQ_LINE_W-1:0] tag_addr_m_r;

// Tag RAM address
always @ *
begin
    // Read Port
    tag_addr_x_r = inport_addr_i[`L2_CACHE_TAG_REQ_RNG];

    // Lookup
    if (state_q == STATE_LOOKUP && next_state_r == STATE_LOOKUP)
        tag_addr_x_r = inport_addr_i[`L2_CACHE_TAG_REQ_RNG];
    // Cache flush
    else if (flushing_q)
        tag_addr_x_r = flush_addr_q;
    else
        tag_addr_x_r = inport_addr_m_q[`L2_CACHE_TAG_REQ_RNG];        

    // Write Port
    tag_addr_m_r = flush_addr_q;

    // Cache flush
    if (flushing_q || state_q == STATE_RESET)
        tag_addr_m_r = flush_addr_q;
    // Line refill / write
    else
        tag_addr_m_r = inport_addr_m_q[`L2_CACHE_TAG_REQ_RNG];
end

// Tag RAM write data
reg [L2_CACHE_TAG_DATA_W-1:0] tag_data_in_m_r;
always @ *
begin
    tag_data_in_m_r = {(L2_CACHE_TAG_DATA_W){1'b0}};

    // Cache flush
    if (state_q == STATE_FLUSH || state_q == STATE_RESET || flushing_q)
        tag_data_in_m_r = {(L2_CACHE_TAG_DATA_W){1'b0}};
    // Line refill
    else if (state_q == STATE_REFILL)
    begin
        tag_data_in_m_r[L2_CACHE_TAG_VALID_BIT] = 1'b1;
        tag_data_in_m_r[L2_CACHE_TAG_DIRTY_BIT] = 1'b0;
        tag_data_in_m_r[`L2_CACHE_TAG_ADDR_RNG] = inport_addr_m_q[`L2_CACHE_TAG_CMP_ADDR_RNG];
    end
    // Evict completion
    else if (state_q == STATE_EVICT_WAIT)
    begin
        tag_data_in_m_r[L2_CACHE_TAG_VALID_BIT] = 1'b1;
        tag_data_in_m_r[L2_CACHE_TAG_DIRTY_BIT] = 1'b0;
        tag_data_in_m_r[`L2_CACHE_TAG_ADDR_RNG] = inport_addr_m_q[`L2_CACHE_TAG_CMP_ADDR_RNG];
    end
    // Write - mark entry as dirty
    else if (state_q == STATE_WRITE || (state_q == STATE_LOOKUP && (|inport_wr_m_q)))
    begin
        tag_data_in_m_r[L2_CACHE_TAG_VALID_BIT] = 1'b1;
        tag_data_in_m_r[L2_CACHE_TAG_DIRTY_BIT] = 1'b1;
        tag_data_in_m_r[`L2_CACHE_TAG_ADDR_RNG] = inport_addr_m_q[`L2_CACHE_TAG_CMP_ADDR_RNG];
    end
end

// Tag RAM write enable (way 0)
reg tag0_write_m_r;
always @ *
begin
    tag0_write_m_r = 1'b0;

    // Cache flush (reset)
    if (state_q == STATE_RESET)
        tag0_write_m_r = 1'b1;
    // Cache flush
    else if (state_q == STATE_FLUSH)
        tag0_write_m_r = !tag_dirty_any_m_w;
    // Write - hit, mark as dirty
    else if (state_q == STATE_LOOKUP && (|inport_wr_m_q))
        tag0_write_m_r = tag0_hit_m_w;
    // Write - write after refill
    else if (state_q == STATE_WRITE)
        tag0_write_m_r = (replace_way_q == 0);
    // Write - mark entry as dirty
    else if (state_q == STATE_EVICT_WAIT && pmem_ack_w)
        tag0_write_m_r = (replace_way_q == 0);
    // Line refill
    else if (state_q == STATE_REFILL)
        tag0_write_m_r = pmem_ack_w && (replace_way_q == 0);
end

wire [L2_CACHE_TAG_DATA_W-1:0] tag0_data_out_m_w;

l2_cache_tag_ram
u_tag0
(
  .clk0_i(clk_i),
  .rst0_i(rst_i),
  .clk1_i(clk_i),
  .rst1_i(rst_i),

  // Read
  .addr0_i(tag_addr_x_r),
  .data0_o(tag0_data_out_m_w),

  // Write
  .addr1_i(tag_addr_m_r),
  .data1_i(tag_data_in_m_r),
  .wr1_i(tag0_write_m_r)
);

`ifdef verilator
function addr_hit_way0; /* verilator public */
input  [31:0]  addr;
reg [L2_CACHE_TAG_DATA_W-1:0] tag_data;
begin
    tag_data = u_tag0.ram[addr[`L2_CACHE_TAG_REQ_RNG]];
    addr_hit_way0 = tag_data[L2_CACHE_TAG_VALID_BIT] && (tag_data[`L2_CACHE_TAG_ADDR_RNG] == addr[`L2_CACHE_TAG_CMP_ADDR_RNG]);
end
endfunction
`endif

wire                              tag0_valid_m_w     = tag0_data_out_m_w[L2_CACHE_TAG_VALID_BIT];
wire                              tag0_dirty_m_w     = tag0_data_out_m_w[L2_CACHE_TAG_DIRTY_BIT];
wire [L2_CACHE_TAG_ADDR_BITS-1:0] tag0_addr_bits_m_w = tag0_data_out_m_w[`L2_CACHE_TAG_ADDR_RNG];

// Tag hit?
wire                           tag0_hit_m_w = tag0_valid_m_w ? (tag0_addr_bits_m_w == req_addr_tag_cmp_m_w) : 1'b0;

// Tag RAM write enable (way 1)
reg tag1_write_m_r;
always @ *
begin
    tag1_write_m_r = 1'b0;

    // Cache flush (reset)
    if (state_q == STATE_RESET)
        tag1_write_m_r = 1'b1;
    // Cache flush
    else if (state_q == STATE_FLUSH)
        tag1_write_m_r = !tag_dirty_any_m_w;
    // Write - hit, mark as dirty
    else if (state_q == STATE_LOOKUP && (|inport_wr_m_q))
        tag1_write_m_r = tag1_hit_m_w;
    // Write - write after refill
    else if (state_q == STATE_WRITE)
        tag1_write_m_r = (replace_way_q == 1);
    // Write - mark entry as dirty
    else if (state_q == STATE_EVICT_WAIT && pmem_ack_w)
        tag1_write_m_r = (replace_way_q == 1);
    // Line refill
    else if (state_q == STATE_REFILL)
        tag1_write_m_r = pmem_ack_w && (replace_way_q == 1);
end

wire [L2_CACHE_TAG_DATA_W-1:0] tag1_data_out_m_w;

l2_cache_tag_ram
u_tag1
(
  .clk0_i(clk_i),
  .rst0_i(rst_i),
  .clk1_i(clk_i),
  .rst1_i(rst_i),

  // Read
  .addr0_i(tag_addr_x_r),
  .data0_o(tag1_data_out_m_w),

  // Write
  .addr1_i(tag_addr_m_r),
  .data1_i(tag_data_in_m_r),
  .wr1_i(tag1_write_m_r)
);

`ifdef verilator
function addr_hit_way1; /* verilator public */
input  [31:0]  addr;
reg [L2_CACHE_TAG_DATA_W-1:0] tag_data;
begin
    tag_data = u_tag1.ram[addr[`L2_CACHE_TAG_REQ_RNG]];
    addr_hit_way1 = tag_data[L2_CACHE_TAG_VALID_BIT] && (tag_data[`L2_CACHE_TAG_ADDR_RNG] == addr[`L2_CACHE_TAG_CMP_ADDR_RNG]);
end
endfunction
`endif

wire                              tag1_valid_m_w     = tag1_data_out_m_w[L2_CACHE_TAG_VALID_BIT];
wire                              tag1_dirty_m_w     = tag1_data_out_m_w[L2_CACHE_TAG_DIRTY_BIT];
wire [L2_CACHE_TAG_ADDR_BITS-1:0] tag1_addr_bits_m_w = tag1_data_out_m_w[`L2_CACHE_TAG_ADDR_RNG];

// Tag hit?
wire                           tag1_hit_m_w = tag1_valid_m_w ? (tag1_addr_bits_m_w == req_addr_tag_cmp_m_w) : 1'b0;


wire tag_hit_any_m_w = 1'b0
                   | tag0_hit_m_w
                   | tag1_hit_m_w
                    ;

assign tag_hit_and_dirty_m_w = 1'b0
                   | (tag0_hit_m_w & tag0_dirty_m_w)
                   | (tag1_hit_m_w & tag1_dirty_m_w)
                    ;

assign tag_dirty_any_m_w = 1'b0
                   | (tag0_valid_m_w & tag0_dirty_m_w)
                   | (tag1_valid_m_w & tag1_dirty_m_w)
                    ;

localparam EVICT_ADDR_W = 32 - L2_CACHE_LINE_SIZE_W;
reg         evict_way_r;
reg [255:0] evict_data_r;
reg [EVICT_ADDR_W-1:0] evict_addr_r;
always @ *
begin
    evict_way_r  = 1'b0;
    evict_addr_r = flushing_q ? {tag0_addr_bits_m_w, flush_addr_q} :
                                {tag0_addr_bits_m_w, inport_addr_m_q[`L2_CACHE_TAG_REQ_RNG]};
    evict_data_r = data0_data_out_m_w;

    case (replace_way_q)
        1'd0:
        begin
            evict_way_r  = tag0_valid_m_w && tag0_dirty_m_w;
            evict_addr_r = flushing_q ? {tag0_addr_bits_m_w, flush_addr_q} :
                                        {tag0_addr_bits_m_w, inport_addr_m_q[`L2_CACHE_TAG_REQ_RNG]};
            evict_data_r = data0_data_out_m_w;
        end
        1'd1:
        begin
            evict_way_r  = tag1_valid_m_w && tag1_dirty_m_w;
            evict_addr_r = flushing_q ? {tag1_addr_bits_m_w, flush_addr_q} :
                                        {tag1_addr_bits_m_w, inport_addr_m_q[`L2_CACHE_TAG_REQ_RNG]};
            evict_data_r = data1_data_out_m_w;
        end
    endcase
end
assign                  evict_way_w  = (flushing_q || !tag_hit_any_m_w) && evict_way_r;
wire [EVICT_ADDR_W-1:0] evict_addr_w = evict_addr_r;
wire [255:0]            evict_data_w = evict_data_r;

//-----------------------------------------------------------------
// DATA RAMS
//-----------------------------------------------------------------
// Data addressing
localparam CACHE_DATA_ADDR_W = L2_CACHE_LINE_ADDR_W+L2_CACHE_LINE_SIZE_W-2;


reg [CACHE_DATA_ADDR_W-1:0] data_addr_x_r;
reg [CACHE_DATA_ADDR_W-1:0] data_addr_m_r;
reg [CACHE_DATA_ADDR_W-1:0] data_write_addr_q;

// Data RAM refill write address
always @ (posedge clk_i )
if (rst_i)
    data_write_addr_q <= {(CACHE_DATA_ADDR_W){1'b0}};
else if (state_q != STATE_REFILL && next_state_r == STATE_REFILL)
    data_write_addr_q <= pmem_addr_w[CACHE_DATA_ADDR_W+2-1:2];
else if (state_q != STATE_EVICT && next_state_r == STATE_EVICT)
    data_write_addr_q <= data_addr_m_r + 1;
else if (state_q == STATE_REFILL && pmem_ack_w)
    data_write_addr_q <= data_write_addr_q + 1;
else if (state_q == STATE_EVICT && pmem_accept_w)
    data_write_addr_q <= data_write_addr_q + 1;

// Data RAM address
always @ *
begin
    data_addr_x_r = inport_addr_i[CACHE_DATA_ADDR_W+2-1:2];
    data_addr_m_r = inport_addr_m_q[CACHE_DATA_ADDR_W+2-1:2];

    // Line refill / evict
    if (state_q == STATE_REFILL || state_q == STATE_EVICT)
    begin
        data_addr_x_r = data_write_addr_q;
        data_addr_m_r = data_addr_x_r;
    end
    else if (state_q == STATE_FLUSH || state_q == STATE_RESET)
    begin
        data_addr_x_r = {flush_addr_q, {(L2_CACHE_LINE_SIZE_W-2){1'b0}}};
        data_addr_m_r = data_addr_x_r;
    end
    else if (state_q != STATE_EVICT && next_state_r == STATE_EVICT)
    begin
        data_addr_x_r = {inport_addr_m_q[`L2_CACHE_TAG_REQ_RNG], {(L2_CACHE_LINE_SIZE_W-2){1'b0}}};
        data_addr_m_r = data_addr_x_r;
    end
    // Lookup post refill
    else if (state_q == STATE_READ)
    begin
        data_addr_x_r = inport_addr_m_q[CACHE_DATA_ADDR_W+2-1:2];
    end
    // Possible line update on write
    else
        data_addr_m_r = inport_addr_m_q[CACHE_DATA_ADDR_W+2-1:2];
end


// Data RAM write enable (way 0)
reg [31:0] data0_write_m_r;
always @ *
begin
    data0_write_m_r = 32'b0;

    if (state_q == STATE_REFILL)
        data0_write_m_r = (pmem_ack_w && replace_way_q == 0) ? 32'hFFFFFFFF : 32'b0;
    else if (state_q == STATE_WRITE || state_q == STATE_LOOKUP)
    begin
        case (inport_addr_m_q[4:2])
        3'd0: data0_write_m_r[3:0] = inport_wr_m_q & {4{tag0_hit_m_w}};
        3'd1: data0_write_m_r[7:4] = inport_wr_m_q & {4{tag0_hit_m_w}};
        3'd2: data0_write_m_r[11:8] = inport_wr_m_q & {4{tag0_hit_m_w}};
        3'd3: data0_write_m_r[15:12] = inport_wr_m_q & {4{tag0_hit_m_w}};
        3'd4: data0_write_m_r[19:16] = inport_wr_m_q & {4{tag0_hit_m_w}};
        3'd5: data0_write_m_r[23:20] = inport_wr_m_q & {4{tag0_hit_m_w}};
        3'd6: data0_write_m_r[27:24] = inport_wr_m_q & {4{tag0_hit_m_w}};
        3'd7: data0_write_m_r[31:28] = inport_wr_m_q & {4{tag0_hit_m_w}};
        default: ;
        endcase
    end
end

wire [255:0] data0_data_out_m_w;
wire [255:0] data0_data_in_m_w = (state_q == STATE_REFILL) ? pmem_read_data_w : {8{inport_data_m_q}};

l2_cache_data_ram
u_data0_0
(
  .clk0_i(clk_i),
  .rst0_i(rst_i),
  .clk1_i(clk_i),
  .rst1_i(rst_i),

  // Read
  .addr0_i(data_addr_x_r[CACHE_DATA_ADDR_W-1:3]),
  .data0_i(32'b0),
  .wr0_i(4'b0),
  .data0_o(data0_data_out_m_w[31:0]),

  // Write
  .addr1_i(data_addr_m_r[CACHE_DATA_ADDR_W-1:3]),
  .data1_i(data0_data_in_m_w[31:0]),
  .wr1_i(data0_write_m_r[3:0]),
  .data1_o()
);
l2_cache_data_ram
u_data0_1
(
  .clk0_i(clk_i),
  .rst0_i(rst_i),
  .clk1_i(clk_i),
  .rst1_i(rst_i),

  // Read
  .addr0_i(data_addr_x_r[CACHE_DATA_ADDR_W-1:3]),
  .data0_i(32'b0),
  .wr0_i(4'b0),
  .data0_o(data0_data_out_m_w[63:32]),

  // Write
  .addr1_i(data_addr_m_r[CACHE_DATA_ADDR_W-1:3]),
  .data1_i(data0_data_in_m_w[63:32]),
  .wr1_i(data0_write_m_r[7:4]),
  .data1_o()
);
l2_cache_data_ram
u_data0_2
(
  .clk0_i(clk_i),
  .rst0_i(rst_i),
  .clk1_i(clk_i),
  .rst1_i(rst_i),

  // Read
  .addr0_i(data_addr_x_r[CACHE_DATA_ADDR_W-1:3]),
  .data0_i(32'b0),
  .wr0_i(4'b0),
  .data0_o(data0_data_out_m_w[95:64]),

  // Write
  .addr1_i(data_addr_m_r[CACHE_DATA_ADDR_W-1:3]),
  .data1_i(data0_data_in_m_w[95:64]),
  .wr1_i(data0_write_m_r[11:8]),
  .data1_o()
);
l2_cache_data_ram
u_data0_3
(
  .clk0_i(clk_i),
  .rst0_i(rst_i),
  .clk1_i(clk_i),
  .rst1_i(rst_i),

  // Read
  .addr0_i(data_addr_x_r[CACHE_DATA_ADDR_W-1:3]),
  .data0_i(32'b0),
  .wr0_i(4'b0),
  .data0_o(data0_data_out_m_w[127:96]),

  // Write
  .addr1_i(data_addr_m_r[CACHE_DATA_ADDR_W-1:3]),
  .data1_i(data0_data_in_m_w[127:96]),
  .wr1_i(data0_write_m_r[15:12]),
  .data1_o()
);
l2_cache_data_ram
u_data0_4
(
  .clk0_i(clk_i),
  .rst0_i(rst_i),
  .clk1_i(clk_i),
  .rst1_i(rst_i),

  // Read
  .addr0_i(data_addr_x_r[CACHE_DATA_ADDR_W-1:3]),
  .data0_i(32'b0),
  .wr0_i(4'b0),
  .data0_o(data0_data_out_m_w[159:128]),

  // Write
  .addr1_i(data_addr_m_r[CACHE_DATA_ADDR_W-1:3]),
  .data1_i(data0_data_in_m_w[159:128]),
  .wr1_i(data0_write_m_r[19:16]),
  .data1_o()
);
l2_cache_data_ram
u_data0_5
(
  .clk0_i(clk_i),
  .rst0_i(rst_i),
  .clk1_i(clk_i),
  .rst1_i(rst_i),

  // Read
  .addr0_i(data_addr_x_r[CACHE_DATA_ADDR_W-1:3]),
  .data0_i(32'b0),
  .wr0_i(4'b0),
  .data0_o(data0_data_out_m_w[191:160]),

  // Write
  .addr1_i(data_addr_m_r[CACHE_DATA_ADDR_W-1:3]),
  .data1_i(data0_data_in_m_w[191:160]),
  .wr1_i(data0_write_m_r[23:20]),
  .data1_o()
);
l2_cache_data_ram
u_data0_6
(
  .clk0_i(clk_i),
  .rst0_i(rst_i),
  .clk1_i(clk_i),
  .rst1_i(rst_i),

  // Read
  .addr0_i(data_addr_x_r[CACHE_DATA_ADDR_W-1:3]),
  .data0_i(32'b0),
  .wr0_i(4'b0),
  .data0_o(data0_data_out_m_w[223:192]),

  // Write
  .addr1_i(data_addr_m_r[CACHE_DATA_ADDR_W-1:3]),
  .data1_i(data0_data_in_m_w[223:192]),
  .wr1_i(data0_write_m_r[27:24]),
  .data1_o()
);
l2_cache_data_ram
u_data0_7
(
  .clk0_i(clk_i),
  .rst0_i(rst_i),
  .clk1_i(clk_i),
  .rst1_i(rst_i),

  // Read
  .addr0_i(data_addr_x_r[CACHE_DATA_ADDR_W-1:3]),
  .data0_i(32'b0),
  .wr0_i(4'b0),
  .data0_o(data0_data_out_m_w[255:224]),

  // Write
  .addr1_i(data_addr_m_r[CACHE_DATA_ADDR_W-1:3]),
  .data1_i(data0_data_in_m_w[255:224]),
  .wr1_i(data0_write_m_r[31:28]),
  .data1_o()
);

`ifdef verilator
function [31:0] data_way0; /* verilator public */
input  [31:0]  addr;
begin
    case (addr[4:2])
    3'd0: data_way0 = u_data0_0.ram[addr[CACHE_DATA_ADDR_W+2-1:5]];
    3'd1: data_way0 = u_data0_1.ram[addr[CACHE_DATA_ADDR_W+2-1:5]];
    3'd2: data_way0 = u_data0_2.ram[addr[CACHE_DATA_ADDR_W+2-1:5]];
    3'd3: data_way0 = u_data0_3.ram[addr[CACHE_DATA_ADDR_W+2-1:5]];
    3'd4: data_way0 = u_data0_4.ram[addr[CACHE_DATA_ADDR_W+2-1:5]];
    3'd5: data_way0 = u_data0_5.ram[addr[CACHE_DATA_ADDR_W+2-1:5]];
    3'd6: data_way0 = u_data0_6.ram[addr[CACHE_DATA_ADDR_W+2-1:5]];
    3'd7: data_way0 = u_data0_7.ram[addr[CACHE_DATA_ADDR_W+2-1:5]];
    default: ;
    endcase
end
endfunction
`endif


// Data RAM write enable (way 1)
reg [31:0] data1_write_m_r;
always @ *
begin
    data1_write_m_r = 32'b0;

    if (state_q == STATE_REFILL)
        data1_write_m_r = (pmem_ack_w && replace_way_q == 1) ? 32'hFFFFFFFF : 32'b0;
    else if (state_q == STATE_WRITE || state_q == STATE_LOOKUP)
    begin
        case (inport_addr_m_q[4:2])
        3'd0: data1_write_m_r[3:0] = inport_wr_m_q & {4{tag1_hit_m_w}};
        3'd1: data1_write_m_r[7:4] = inport_wr_m_q & {4{tag1_hit_m_w}};
        3'd2: data1_write_m_r[11:8] = inport_wr_m_q & {4{tag1_hit_m_w}};
        3'd3: data1_write_m_r[15:12] = inport_wr_m_q & {4{tag1_hit_m_w}};
        3'd4: data1_write_m_r[19:16] = inport_wr_m_q & {4{tag1_hit_m_w}};
        3'd5: data1_write_m_r[23:20] = inport_wr_m_q & {4{tag1_hit_m_w}};
        3'd6: data1_write_m_r[27:24] = inport_wr_m_q & {4{tag1_hit_m_w}};
        3'd7: data1_write_m_r[31:28] = inport_wr_m_q & {4{tag1_hit_m_w}};
        default: ;
        endcase
    end
end

wire [255:0] data1_data_out_m_w;
wire [255:0] data1_data_in_m_w = (state_q == STATE_REFILL) ? pmem_read_data_w : {8{inport_data_m_q}};

l2_cache_data_ram
u_data1_0
(
  .clk0_i(clk_i),
  .rst0_i(rst_i),
  .clk1_i(clk_i),
  .rst1_i(rst_i),

  // Read
  .addr0_i(data_addr_x_r[CACHE_DATA_ADDR_W-1:3]),
  .data0_i(32'b0),
  .wr0_i(4'b0),
  .data0_o(data1_data_out_m_w[31:0]),

  // Write
  .addr1_i(data_addr_m_r[CACHE_DATA_ADDR_W-1:3]),
  .data1_i(data1_data_in_m_w[31:0]),
  .wr1_i(data1_write_m_r[3:0]),
  .data1_o()
);
l2_cache_data_ram
u_data1_1
(
  .clk0_i(clk_i),
  .rst0_i(rst_i),
  .clk1_i(clk_i),
  .rst1_i(rst_i),

  // Read
  .addr0_i(data_addr_x_r[CACHE_DATA_ADDR_W-1:3]),
  .data0_i(32'b0),
  .wr0_i(4'b0),
  .data0_o(data1_data_out_m_w[63:32]),

  // Write
  .addr1_i(data_addr_m_r[CACHE_DATA_ADDR_W-1:3]),
  .data1_i(data1_data_in_m_w[63:32]),
  .wr1_i(data1_write_m_r[7:4]),
  .data1_o()
);
l2_cache_data_ram
u_data1_2
(
  .clk0_i(clk_i),
  .rst0_i(rst_i),
  .clk1_i(clk_i),
  .rst1_i(rst_i),

  // Read
  .addr0_i(data_addr_x_r[CACHE_DATA_ADDR_W-1:3]),
  .data0_i(32'b0),
  .wr0_i(4'b0),
  .data0_o(data1_data_out_m_w[95:64]),

  // Write
  .addr1_i(data_addr_m_r[CACHE_DATA_ADDR_W-1:3]),
  .data1_i(data1_data_in_m_w[95:64]),
  .wr1_i(data1_write_m_r[11:8]),
  .data1_o()
);
l2_cache_data_ram
u_data1_3
(
  .clk0_i(clk_i),
  .rst0_i(rst_i),
  .clk1_i(clk_i),
  .rst1_i(rst_i),

  // Read
  .addr0_i(data_addr_x_r[CACHE_DATA_ADDR_W-1:3]),
  .data0_i(32'b0),
  .wr0_i(4'b0),
  .data0_o(data1_data_out_m_w[127:96]),

  // Write
  .addr1_i(data_addr_m_r[CACHE_DATA_ADDR_W-1:3]),
  .data1_i(data1_data_in_m_w[127:96]),
  .wr1_i(data1_write_m_r[15:12]),
  .data1_o()
);
l2_cache_data_ram
u_data1_4
(
  .clk0_i(clk_i),
  .rst0_i(rst_i),
  .clk1_i(clk_i),
  .rst1_i(rst_i),

  // Read
  .addr0_i(data_addr_x_r[CACHE_DATA_ADDR_W-1:3]),
  .data0_i(32'b0),
  .wr0_i(4'b0),
  .data0_o(data1_data_out_m_w[159:128]),

  // Write
  .addr1_i(data_addr_m_r[CACHE_DATA_ADDR_W-1:3]),
  .data1_i(data1_data_in_m_w[159:128]),
  .wr1_i(data1_write_m_r[19:16]),
  .data1_o()
);
l2_cache_data_ram
u_data1_5
(
  .clk0_i(clk_i),
  .rst0_i(rst_i),
  .clk1_i(clk_i),
  .rst1_i(rst_i),

  // Read
  .addr0_i(data_addr_x_r[CACHE_DATA_ADDR_W-1:3]),
  .data0_i(32'b0),
  .wr0_i(4'b0),
  .data0_o(data1_data_out_m_w[191:160]),

  // Write
  .addr1_i(data_addr_m_r[CACHE_DATA_ADDR_W-1:3]),
  .data1_i(data1_data_in_m_w[191:160]),
  .wr1_i(data1_write_m_r[23:20]),
  .data1_o()
);
l2_cache_data_ram
u_data1_6
(
  .clk0_i(clk_i),
  .rst0_i(rst_i),
  .clk1_i(clk_i),
  .rst1_i(rst_i),

  // Read
  .addr0_i(data_addr_x_r[CACHE_DATA_ADDR_W-1:3]),
  .data0_i(32'b0),
  .wr0_i(4'b0),
  .data0_o(data1_data_out_m_w[223:192]),

  // Write
  .addr1_i(data_addr_m_r[CACHE_DATA_ADDR_W-1:3]),
  .data1_i(data1_data_in_m_w[223:192]),
  .wr1_i(data1_write_m_r[27:24]),
  .data1_o()
);
l2_cache_data_ram
u_data1_7
(
  .clk0_i(clk_i),
  .rst0_i(rst_i),
  .clk1_i(clk_i),
  .rst1_i(rst_i),

  // Read
  .addr0_i(data_addr_x_r[CACHE_DATA_ADDR_W-1:3]),
  .data0_i(32'b0),
  .wr0_i(4'b0),
  .data0_o(data1_data_out_m_w[255:224]),

  // Write
  .addr1_i(data_addr_m_r[CACHE_DATA_ADDR_W-1:3]),
  .data1_i(data1_data_in_m_w[255:224]),
  .wr1_i(data1_write_m_r[31:28]),
  .data1_o()
);

`ifdef verilator
function [31:0] data_way1; /* verilator public */
input  [31:0]  addr;
begin
    case (addr[4:2])
    3'd0: data_way1 = u_data1_0.ram[addr[CACHE_DATA_ADDR_W+2-1:5]];
    3'd1: data_way1 = u_data1_1.ram[addr[CACHE_DATA_ADDR_W+2-1:5]];
    3'd2: data_way1 = u_data1_2.ram[addr[CACHE_DATA_ADDR_W+2-1:5]];
    3'd3: data_way1 = u_data1_3.ram[addr[CACHE_DATA_ADDR_W+2-1:5]];
    3'd4: data_way1 = u_data1_4.ram[addr[CACHE_DATA_ADDR_W+2-1:5]];
    3'd5: data_way1 = u_data1_5.ram[addr[CACHE_DATA_ADDR_W+2-1:5]];
    3'd6: data_way1 = u_data1_6.ram[addr[CACHE_DATA_ADDR_W+2-1:5]];
    3'd7: data_way1 = u_data1_7.ram[addr[CACHE_DATA_ADDR_W+2-1:5]];
    default: ;
    endcase
end
endfunction
`endif


//-----------------------------------------------------------------
// Flush counter
//-----------------------------------------------------------------
reg [L2_CACHE_TAG_REQ_LINE_W-1:0] flush_addr_q;

always @ (posedge clk_i )
if (rst_i)
    flush_addr_q <= {(L2_CACHE_TAG_REQ_LINE_W){1'b0}};
else if ((state_q == STATE_RESET) || (state_q == STATE_FLUSH && next_state_r == STATE_FLUSH_ADDR))
    flush_addr_q <= flush_addr_q + 1;
else if (state_q == STATE_LOOKUP)
    flush_addr_q <= {(L2_CACHE_TAG_REQ_LINE_W){1'b0}};

always @ (posedge clk_i )
if (rst_i)
    flushing_q <= 1'b0;
else if (state_q == STATE_LOOKUP && next_state_r == STATE_FLUSH_ADDR)
    flushing_q <= 1'b1;
else if (state_q == STATE_FLUSH && next_state_r == STATE_LOOKUP)
    flushing_q <= 1'b0;

reg flush_last_q;
always @ (posedge clk_i )
if (rst_i)
    flush_last_q <= 1'b0;
else if (state_q == STATE_LOOKUP)
    flush_last_q <= 1'b0;
else if (flush_addr_q == {(L2_CACHE_TAG_REQ_LINE_W){1'b1}})
    flush_last_q <= 1'b1;

//-----------------------------------------------------------------
// Replacement Policy
//----------------------------------------------------------------- 
// Using random replacement policy - this way we cycle through the ways
// when needing to replace a line.
always @ (posedge clk_i )
if (rst_i)
    replace_way_q <= 0;
else if (state_q == STATE_WRITE || state_q == STATE_READ)
    replace_way_q <= replace_way_q + 1;
else if (flushing_q && tag_dirty_any_m_w && !evict_way_w && state_q != STATE_FLUSH_ADDR)
    replace_way_q <= replace_way_q + 1;
else if (state_q == STATE_EVICT_WAIT && next_state_r == STATE_FLUSH_ADDR)
    replace_way_q <= 0;
else if (state_q == STATE_FLUSH && next_state_r == STATE_LOOKUP)
    replace_way_q <= 0;
else if (state_q == STATE_LOOKUP && next_state_r == STATE_FLUSH_ADDR)
    replace_way_q <= 0;

//-----------------------------------------------------------------
// Output Result
//-----------------------------------------------------------------
reg [2:0] data_sel_q;

always @ (posedge clk_i )
if (rst_i)
    data_sel_q <= 3'b0;
else
    data_sel_q <= data_addr_x_r[2:0];

// Data output mux
reg [31:0]  data_r;
reg [255:0] data_wide_r;
always @ *
begin
    data_r      = 32'b0;
    data_wide_r = data0_data_out_m_w;

    case (1'b1)
    tag0_hit_m_w: data_wide_r = data0_data_out_m_w;
    tag1_hit_m_w: data_wide_r = data1_data_out_m_w;
    endcase

    case (data_sel_q)
    3'd0: data_r = data_wide_r[31:0];
    3'd1: data_r = data_wide_r[63:32];
    3'd2: data_r = data_wide_r[95:64];
    3'd3: data_r = data_wide_r[127:96];
    3'd4: data_r = data_wide_r[159:128];
    3'd5: data_r = data_wide_r[191:160];
    3'd6: data_r = data_wide_r[223:192];
    3'd7: data_r = data_wide_r[255:224];
    endcase
end

assign inport_data_rd_o  = data_r;

//-----------------------------------------------------------------
// Next State Logic
//-----------------------------------------------------------------
always @ *
begin
    next_state_r = state_q;

    case (state_q)
    //-----------------------------------------
    // STATE_RESET
    //-----------------------------------------
    STATE_RESET :
    begin
        // Final line checked
        if (flush_last_q)
            next_state_r = STATE_LOOKUP;
    end
    //-----------------------------------------
    // STATE_FLUSH_ADDR
    //-----------------------------------------
    STATE_FLUSH_ADDR : next_state_r = STATE_FLUSH;
    //-----------------------------------------
    // STATE_FLUSH
    //-----------------------------------------
    STATE_FLUSH :
    begin
        // Dirty line detected - evict unless initial cache reset cycle
        if (tag_dirty_any_m_w)
        begin
            // Evict dirty line - else wait for dirty way to be selected
            if (evict_way_w)
                next_state_r = STATE_EVICT;
        end
        // Final line checked, nothing dirty
        else if (flush_last_q)
            next_state_r = STATE_LOOKUP;
        else
            next_state_r = STATE_FLUSH_ADDR;
    end
    //-----------------------------------------
    // STATE_LOOKUP
    //-----------------------------------------
    STATE_LOOKUP :
    begin
        // Previous access missed in the cache
        if ((inport_rd_m_q || (inport_wr_m_q != 4'b0)) && !tag_hit_any_m_w)
        begin
            // Evict dirty line first
            if (evict_way_w)
                next_state_r = STATE_EVICT;
            // Allocate line and fill
            else
                next_state_r = STATE_REFILL;
        end
        // Flush whole cache
        else if (flush_i)
            next_state_r = STATE_FLUSH_ADDR;
    end
    //-----------------------------------------
    // STATE_REFILL
    //-----------------------------------------
    STATE_REFILL :
    begin
        // End of refill
        if (pmem_ack_w)
        begin
            // Refill reason was write
            if (inport_wr_m_q != 4'b0)
                next_state_r = STATE_WRITE;
            // Refill reason was read
            else
                next_state_r = STATE_READ;
        end
    end
    //-----------------------------------------
    // STATE_WRITE/READ
    //-----------------------------------------
    STATE_WRITE, STATE_READ :
    begin
        next_state_r = STATE_LOOKUP;
    end
    //-----------------------------------------
    // STATE_EVICT
    //-----------------------------------------
    STATE_EVICT :
    begin
        // End of evict, wait for write completion
        if (pmem_accept_w)
            next_state_r = STATE_EVICT_WAIT;
    end
    //-----------------------------------------
    // STATE_EVICT_WAIT
    //-----------------------------------------
    STATE_EVICT_WAIT :
    begin
        // Evict due to flush
        if (pmem_ack_w && flushing_q)
            next_state_r = STATE_FLUSH_ADDR;
        // Write ack, start re-fill now
        else if (pmem_ack_w)
            next_state_r = STATE_REFILL;
    end
    default:
        ;
   endcase
end

// Update state
always @ (posedge clk_i )
if (rst_i)
    state_q   <= STATE_RESET;
else
    state_q   <= next_state_r;

reg inport_ack_r;

always @ *
begin
    inport_ack_r = 1'b0;

    if (state_q == STATE_LOOKUP)
    begin
        // Normal hit - read or write
        if ((inport_rd_m_q || (inport_wr_m_q != 4'b0)) && tag_hit_any_m_w)
            inport_ack_r = 1'b1;
    end
end

assign inport_ack_o = inport_ack_r;

//-----------------------------------------------------------------
// Bus Request
//-----------------------------------------------------------------
reg pmem_rd_q;
reg pmem_wr0_q;

always @ (posedge clk_i )
if (rst_i)
    pmem_rd_q   <= 1'b0;
else if (pmem_rd_w)
    pmem_rd_q   <= ~pmem_accept_w;

always @ (posedge clk_i )
if (rst_i)
    pmem_wr0_q   <= 1'b0;
else if (state_q != STATE_EVICT && next_state_r == STATE_EVICT)
    pmem_wr0_q   <= 1'b1;
else if (pmem_accept_w)
    pmem_wr0_q   <= 1'b0;

//-----------------------------------------------------------------
// Skid buffer for write data
//-----------------------------------------------------------------
reg         pmem_wr_q;
reg [255:0] pmem_write_data_q;

always @ (posedge clk_i )
if (rst_i)
    pmem_wr_q <= 1'b0;
else if (pmem_wr_w && !pmem_accept_w)
    pmem_wr_q <= pmem_wr_w;
else if (pmem_accept_w)
    pmem_wr_q <= 1'b0;

always @ (posedge clk_i )
if (rst_i)
    pmem_write_data_q <= 256'b0;
else if (!pmem_accept_w)
    pmem_write_data_q <= pmem_write_data_w;

//-----------------------------------------------------------------
// AXI Error Handling
//-----------------------------------------------------------------
reg error_q;
always @ (posedge clk_i )
if (rst_i)
    error_q   <= 1'b0;
else if (pmem_ack_w && pmem_error_w)
    error_q   <= 1'b1;
else if (inport_ack_o)
    error_q   <= 1'b0;

assign inport_error_o = error_q;

//-----------------------------------------------------------------
// Outport
//-----------------------------------------------------------------
wire refill_request_w   = (state_q != STATE_REFILL && next_state_r == STATE_REFILL);
wire evict_request_w    = (state_q == STATE_EVICT) && evict_way_w;

// AXI Read channel
assign pmem_rd_w         = (refill_request_w || pmem_rd_q);
assign pmem_wr_w         = (evict_request_w || pmem_wr_q) ? 1'b1 : 1'b0;
assign pmem_addr_w       = pmem_rd_w ? {inport_addr_m_q[31:L2_CACHE_LINE_SIZE_W], {(L2_CACHE_LINE_SIZE_W){1'b0}}} :
                           {evict_addr_w, {(L2_CACHE_LINE_SIZE_W){1'b0}}};

assign pmem_len_w        = (refill_request_w || pmem_rd_q || (state_q == STATE_EVICT && pmem_wr0_q)) ? 8'd7 : 8'd0;
assign pmem_write_data_w = pmem_wr_q ? pmem_write_data_q : evict_data_w;

assign outport_wr_o         = pmem_wr_w;
assign outport_rd_o         = pmem_rd_w;
assign outport_addr_o       = pmem_addr_w;
assign outport_write_data_o = pmem_write_data_w;

assign pmem_accept_w        = outport_accept_i;
assign pmem_ack_w           = outport_ack_i;
assign pmem_error_w         = outport_error_i;
assign pmem_read_data_w     = outport_read_data_i;

//-------------------------------------------------------------------
// Debug
//-------------------------------------------------------------------
`ifdef verilator
/* verilator lint_off WIDTH */
reg [79:0] dbg_state;
always @ *
begin
    dbg_state = "-";

    case (state_q)
    STATE_RESET:
        dbg_state = "RESET";
    STATE_FLUSH_ADDR:
        dbg_state = "FLUSH_ADDR";
    STATE_FLUSH:
        dbg_state = "FLUSH";
    STATE_LOOKUP:
        dbg_state = "LOOKUP";
    STATE_READ:
        dbg_state = "READ";
    STATE_WRITE:
        dbg_state = "WRITE";
    STATE_REFILL:
        dbg_state = "REFILL";
    STATE_EVICT:
        dbg_state = "EVICT";
    STATE_EVICT_WAIT:
        dbg_state = "EVICT_WAIT";
    default:
        ;
    endcase
end
/* verilator lint_on WIDTH */


reg [31:0] stats_read_q;
reg [31:0] stats_write_q;
reg [31:0] stats_hit_q;
reg [31:0] stats_miss_q;
reg [31:0] stats_evict_q;
reg [31:0] stats_stalls_q;

always @ (posedge clk_i )
if (rst_i)
    stats_read_q   <= 32'b0;
else if (inport_rd_i && inport_accept_o)
    stats_read_q   <= stats_read_q + 32'd1;

always @ (posedge clk_i )
if (rst_i)
    stats_write_q   <= 32'b0;
else if ((|inport_wr_i) && inport_accept_o)
    stats_write_q   <= stats_write_q + 32'd1;

// Note: A miss will also count as a hit when the refill occurs
always @ (posedge clk_i )
if (rst_i)
    stats_hit_q   <= 32'b0;
else if (state_q == STATE_LOOKUP && (inport_rd_m_q || (inport_wr_m_q != 4'b0)) && tag_hit_any_m_w)
    stats_hit_q   <= stats_hit_q + 32'd1;

always @ (posedge clk_i )
if (rst_i)
    stats_miss_q   <= 32'b0;
else if ((outport_rd_o || (|outport_wr_o)) && outport_accept_i)
    stats_miss_q   <= stats_miss_q + 32'd1;

always @ (posedge clk_i )
if (rst_i)
    stats_evict_q   <= 32'b0;
else if (state_q == STATE_EVICT && next_state_r == STATE_EVICT_WAIT)
    stats_evict_q   <= stats_evict_q + 32'd1;

always @ (posedge clk_i )
if (rst_i)
    stats_stalls_q   <= 32'b0;
else if (state_q != STATE_LOOKUP)
    stats_stalls_q   <= stats_stalls_q + 32'd1;

`endif


endmodule