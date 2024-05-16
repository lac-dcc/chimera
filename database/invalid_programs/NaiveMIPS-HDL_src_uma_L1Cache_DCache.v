module DCache(clk, reset, rreq, wreq, addr, rdata, wdata, wmask, miss, 
              l2_rreq, l2_wreq, l2_addr, l2_burst_size, l2_rdata, l2_wdata, l2_busy, 
              peek_addr, peek_rdata, peek_miss, invalid_line, invalid_req);
    input  wire clk, reset;
    
    input  wire rreq, wreq;
    input  wire [31:0] addr;
    input  wire [31:0] wdata;
    input  wire [3:0] wmask;
    output wire [31:0] rdata;
    output wire miss;

    output reg  l2_rreq, l2_wreq;
    output reg  [4:0]  l2_burst_size;
    output reg  [31:0] l2_addr, l2_wdata;
    input  wire [31:0] l2_rdata;
    input  wire l2_busy;
    
    // These ports allow peaking of internal registers without changing internal states
    input  wire [31:0] peek_addr;
    output wire [31:0] peek_rdata;
    output wire peek_miss;
    
    output reg  [26:0] invalid_line;
    output reg  invalid_req;
    
    wire [22:0] tag_addr;
    wire [3:0]  set_addr;
    wire [2:0]  word_addr;
    wire [1:0]  word_offset;
    assign {tag_addr, set_addr, word_addr, word_offset} = addr;
    
    reg  [3:0] state;
    `define DCACHE_STATE_IDLE  4'h0
    `define DCACHE_STATE_WWAIT 4'h2
    `define DCACHE_STATE_WBUSY 4'h3
    `define DCACHE_STATE_WRITE 4'h4
    `define DCACHE_STATE_RWAIT 4'h5
    `define DCACHE_STATE_RBUSY 4'h6
    `define DCACHE_STATE_READ  4'h7
    
    // Internal or external control of the cache units
    reg  use_external;
    reg  rreq_internal;
    reg  wreq_internal;
    reg  [31:0] addr_internal; 
    reg  [31:0] wdata_internal;
    
    // Build the cache units
    reg  [22:0] unit_tag_addr[0:15];
    reg  [15:0] unit_valid;
    wire unit_hit;          // Set to HIGH iff any unit has a cache hit
    reg  [15:0] unit_dirty;
    wire [31:0] unit_rdata; // Only one cache unit produces non-zero output
    wire [15:0] unit_hit_array;
    wire [31:0] unit_rdata_array[0:15];
    wire [15:0] unit_rdata_rearrange[0:31];
    wire [15:0] peek_hit_array;
    wire [31:0] peek_rdata_array[0:15];
    wire [15:0] peek_rdata_rearrange[0:31];
    genvar gen, gen2;
    generate for (gen = 0; gen < 16; gen = gen + 1) begin: units
        L1Unit unit(.clk(clk), .reset(reset), 
                    .rreq(use_external ? rreq : rreq_internal), 
                    .wreq(use_external ? wreq : wreq_internal), 
                    .addr(use_external ? addr : addr_internal), 
                    .wdata(use_external ? wdata : wdata_internal), 
                    .wmask(use_external ? wmask : 4'hF),
                    .hit(unit_hit_array[gen]), .rdata(unit_rdata_array[gen]), 
                    .valid(unit_valid[gen]), .my_tag_addr(unit_tag_addr[gen]), 
                    .my_set_addr(gen[3:0]), 
                    .peek_addr(peek_addr), .peek_rdata(peek_rdata_array[gen]), 
                    .peek_hit(peek_hit_array[gen]));
                    
        for (gen2 = 0; gen2 < 32; gen2 = gen2 + 1) begin: rearr_loop
            assign unit_rdata_rearrange[gen2][gen] = unit_rdata_array[gen][gen2];
            assign peek_rdata_rearrange[gen2][gen] = peek_rdata_array[gen][gen2];
        end
    end
    for (gen2 = 0; gen2 < 32; gen2 = gen2 + 1) begin: rearr_loop2
        assign unit_rdata[gen2] = |unit_rdata_rearrange[gen2];
        assign peek_rdata[gen2] = |peek_rdata_rearrange[gen2];
    end
    assign unit_hit = |unit_hit_array;
    assign peek_miss = ~|peek_hit_array;
    endgenerate
    
    assign miss = (~unit_hit | (state != `DCACHE_STATE_IDLE)) & (rreq | wreq);
    assign rdata = unit_rdata;
    
    reg [3:0] op_count;
    reg [22:0] tag_addr_latch;
    reg [3:0] set_addr_latch;
    always @(posedge clk) begin
        if (reset) begin
            state <= `DCACHE_STATE_IDLE;
            l2_wreq <= 1'b0;
            l2_rreq <= 1'b0;
            use_external <= 1'b1;
            rreq_internal <= 1'b0;
            wreq_internal <= 1'b0;
            unit_valid <= 16'h0;
            invalid_req <= 1'b0;
        end else begin
            case (state) 
            `DCACHE_STATE_IDLE: begin
                if ((rreq | wreq) & ~unit_hit) begin
                    if (unit_valid[set_addr] & unit_dirty[set_addr]) begin
                        state <= `DCACHE_STATE_WWAIT;
                        l2_wreq <= 1'b1;
                        l2_addr <= {unit_tag_addr[set_addr], set_addr, 5'h0};
                        tag_addr_latch <= tag_addr;
                        set_addr_latch <= set_addr;
                        l2_burst_size <= 5'h8;
                        
                        use_external <= 1'b0;
                        rreq_internal <= 1'b1;
                        addr_internal = {unit_tag_addr[set_addr], set_addr, 5'h0};
                        invalid_line <= {unit_tag_addr[set_addr], set_addr};
                    end else begin
                        state <= `DCACHE_STATE_RWAIT;
                        use_external <= 1'b0;
                        l2_rreq <= 1'b1;
                        l2_addr <= {tag_addr, set_addr, 5'h0};
                        tag_addr_latch <= tag_addr;
                        set_addr_latch <= set_addr;
                        l2_burst_size <= 5'h8;
                        unit_valid[set_addr] <= 1'b0;
                    end
                end
                if (wreq & unit_hit) begin
                    unit_dirty[set_addr] <= 1'b1;
                end
            end 
            `DCACHE_STATE_WWAIT: begin
                l2_wreq <= 1'b0;
                state <= `DCACHE_STATE_WBUSY;
            end
            `DCACHE_STATE_WBUSY: begin
                if (~l2_busy) begin
                    l2_wdata <= unit_rdata;
                    addr_internal <= addr_internal + 32'h4;
                    state <= `DCACHE_STATE_WRITE;
                end
            end
            `DCACHE_STATE_WRITE: begin
                if (addr_internal[4:2] == 3'h0) begin
                    state <= `DCACHE_STATE_RWAIT;
                    rreq_internal <= 1'b0;
                    l2_rreq <= 1'b1;
                    l2_addr <= {tag_addr_latch, set_addr_latch, 5'h0};
                    
                    invalid_req <= 1'b1;
                end 
                l2_wdata <= unit_rdata;
                addr_internal <= addr_internal + 32'h4;
            end
            `DCACHE_STATE_RWAIT: begin
                l2_rreq <= 1'b0;
                state <= `DCACHE_STATE_RBUSY;
                unit_tag_addr[set_addr_latch] <= tag_addr_latch;
                unit_valid[set_addr_latch] <= 1'b0;
                invalid_req <= 1'b0;
            end
            `DCACHE_STATE_RBUSY: begin
                if (~l2_busy) begin
                    addr_internal <= {tag_addr_latch, set_addr_latch, 5'h0};
                    wreq_internal <= 1'b1;
                    wdata_internal <= l2_rdata;
                    state <= `DCACHE_STATE_READ;
                end
            end
            `DCACHE_STATE_READ: begin
                if (addr_internal[4:2] == 3'h7) begin
                    wreq_internal <= 1'b0;
                    use_external <= 1'b1;
                    state <= `DCACHE_STATE_IDLE;
                    unit_valid[set_addr_latch] <= 1'b1;
                    unit_dirty[set_addr_latch] <= 1'b0;   // Carefully look at this
                end
                wdata_internal <= l2_rdata;
                addr_internal <= addr_internal + 32'h4;
            end 
            endcase
        end
    end
endmodule