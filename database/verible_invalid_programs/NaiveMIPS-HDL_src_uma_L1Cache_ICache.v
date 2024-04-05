module ICache(clk, reset, rreq, addr, rdata, miss, 
              l2_rreq, l2_addr, l2_burst_size, l2_rdata, l2_busy,
              peek_addr, peek_rdata, peek_miss,
              invalid_line, invalid_req);
    input  wire clk, reset;
    
    input  wire rreq;
    input  wire [31:0] addr;    
    output wire [31:0] rdata;
    output wire miss;

    output reg  l2_rreq;
    output reg  [4:0]  l2_burst_size;
    output reg  [31:0] l2_addr;
    input  wire [31:0] l2_rdata;
    input  wire l2_busy;
    
    // Peek into DCache, if the entry exists in DCache, use it
    output wire [31:0] peek_addr;
    input  wire [31:0] peek_rdata;
    input  wire peek_miss;
    
    input  wire [26:0] invalid_line;
    input  wire invalid_req;
    
    wire [22:0] tag_addr;
    wire [3:0]  set_addr;
    wire [2:0]  word_addr;
    wire [1:0]  word_offset;
    assign {tag_addr, set_addr, word_addr, word_offset} = addr;
    
    wire [22:0] invalid_tag;
    wire [3:0]  invalid_set;
    assign {invalid_tag, invalid_set} = invalid_line;
    
    reg  [2:0] state;
    `define ICACHE_STATE_IDLE  3'h0
    `define ICACHE_STATE_RWAIT 3'h1
    `define ICACHE_STATE_RBUSY 3'h2
    `define ICACHE_STATE_READ  3'h3
    
    // Internal or external control of the cache units
    reg  use_external;
    reg  wreq_internal;
    reg  [31:0] addr_internal; 
    reg  [31:0] wdata_internal;
    
    // Build the cache units
    reg  [22:0] unit_tag_addr[0:15];
    reg  [15:0] unit_valid;
    wire unit_hit;          // Set to HIGH iff any unit has a cache hit
    wire [31:0] unit_rdata; // Only one cache unit produces non-zero output
    wire [15:0] unit_hit_array;
    wire [31:0] unit_rdata_array[0:15];
    wire [15:0] unit_rdata_rearrange[0:31];
    
    genvar gen, gen2;
    generate for (gen = 0; gen < 16; gen = gen + 1) begin: units
        L1Unit unit(.clk(clk), .reset(reset), 
                    .rreq(rreq), 
                    .wreq(wreq_internal), 
                    .addr(use_external ? addr : addr_internal), 
                    .wdata(wdata_internal), 
                    .wmask(4'hF),
                    .hit(unit_hit_array[gen]), .rdata(unit_rdata_array[gen]), 
                    .valid(unit_valid[gen]), .my_tag_addr(unit_tag_addr[gen]), 
                    .my_set_addr(gen[3:0]));
        for (gen2 = 0; gen2 < 32; gen2 = gen2 + 1) begin: rearr_loop
            assign unit_rdata_rearrange[gen2][gen] = unit_rdata_array[gen][gen2];
        end
    end
    for (gen2 = 0; gen2 < 32; gen2 = gen2 + 1) begin: rearr_loop2
        assign unit_rdata[gen2] = |unit_rdata_rearrange[gen2];
    end
    assign unit_hit = |unit_hit_array;
    endgenerate
    
    assign peek_addr = addr;
    assign miss = ((peek_miss & ~unit_hit) | (state != `ICACHE_STATE_IDLE)) & (rreq);
    assign rdata = peek_miss ? unit_rdata : peek_rdata;
    
    reg  set_valid_req;
    reg  [3:0] set_valid_addr;
    generate for (gen = 0; gen < 16; gen = gen + 1) begin: valid_loop
        always @(posedge clk) begin
            if (reset) begin
                unit_valid[gen] <= 1'b0;
            end else begin
                if (invalid_req & (invalid_set == gen[3:0]) & (invalid_tag == unit_tag_addr[gen])) begin
                    unit_valid[gen] <= 1'b0;
                end else if (set_valid_req & (set_valid_addr == gen[3:0])) begin
                    unit_valid[gen] <= 1'b1;
                end
            end
        end
    end
    endgenerate
    
    reg [3:0] op_count;
    reg [22:0] tag_addr_latch;
    reg [3:0]  set_addr_latch;
    always @(posedge clk) begin
        if (reset) begin
            state <= `ICACHE_STATE_IDLE;
            l2_rreq <= 1'b0;
            use_external <= 1'b1;
            wreq_internal <= 1'b0;
            set_valid_req <= 1'b0;
        end else begin
            case (state) 
            `ICACHE_STATE_IDLE: begin
                if (rreq & peek_miss & ~unit_hit) begin
                    state <= `ICACHE_STATE_RWAIT;
                    use_external <= 1'b0;
                    l2_rreq <= 1'b1;
                    l2_addr <= {tag_addr, set_addr, 5'h0};
                    tag_addr_latch <= tag_addr;
                    set_addr_latch <= set_addr;
                    l2_burst_size <= 5'h8;
                    set_valid_addr <= set_addr;
                end
            end 
            `ICACHE_STATE_RWAIT: begin
                l2_rreq <= 1'b0;
                state <= `ICACHE_STATE_RBUSY;
                unit_tag_addr[set_addr_latch] <= tag_addr_latch;
            end
            `ICACHE_STATE_RBUSY: begin
                if (~l2_busy) begin
                    addr_internal <= {tag_addr_latch, set_addr_latch, 5'h0};
                    wreq_internal <= 1'b1;
                    wdata_internal <= l2_rdata;
                    state <= `ICACHE_STATE_READ;
                end
            end
            `ICACHE_STATE_READ: begin
                if (addr_internal[4:2] == 3'h7) begin
                    wreq_internal <= 1'b0;
                    use_external <= 1'b1;
                    state <= `ICACHE_STATE_IDLE;
                    set_valid_req <= 1'b0;
                end else begin
                    set_valid_req <= 1'b1;
                end
                wdata_internal <= l2_rdata;
                addr_internal <= addr_internal + 32'h4;
            end 
            endcase
        end
    end
endmodule