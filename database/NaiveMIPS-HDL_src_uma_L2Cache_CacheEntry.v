module CacheLUT(clk, reset, 
                en, tag_addr, group_addr, cache_hit, query_tag_addr);
              
    input  wire clk, reset, en;
    
    input  wire [20:0] tag_addr;
    
    output reg  [3:0]  group_addr;
    output reg         cache_hit;
    output reg  [20:0] query_tag_addr;
    
    reg [20:0] tag_list[0:15];
    reg [15:0] valid;
    
    // Compares the input index with entries in the index list. cache_hit is HIGH if a hit is found
    // Under that case, cache_entry is the hit entry
    wire        cache_valid;
    wire [3:0]  cache_entry;
    wire [15:0] compare_result;
    genvar gen;
    generate for (gen = 0; gen < 16; gen = gen + 1) begin: compare_loop
        assign compare_result[gen] = (tag_addr == tag_list[gen]) & valid[gen];
    end
    endgenerate
    PriorityEncoder16 prio_encoder(.enable_n(1'b0), .data(compare_result), .result(cache_entry), .result_valid(cache_valid));
    
    // Selects the oldest cache entry
    reg        refresh;
    reg  [3:0] refresh_entry;
    wire [3:0] line_to_use;
    wire [3:0] unused_line;
    wire [3:0] oldest_line;
    wire       has_unused;
    PriorityEncoder16 valid_encoder(.enable_n(1'b0), .data(~valid), .result(unused_line), .result_valid(has_unused));
    TimeStamp time_stamp(.clk(clk), .reset(reset), .en(refresh), .access(refresh_entry), .oldest_stamp(oldest_line));
    assign line_to_use = has_unused ? unused_line : oldest_line;
    
    reg [2:0] state;
    `define LUT_STATE_IDLE 3'h0
    `define LUT_STATE_WAIT1 3'h1
    `define LUT_STATE_FETCH 3'h2

    reg [20:0] write_tag;
    always @(posedge clk) begin
        if (reset) begin
            state <= `LUT_STATE_IDLE;
            valid <= 16'h0;
            refresh <= 1'b0;
        end else begin
            case (state) 
            `LUT_STATE_IDLE: begin
                if (en & ~cache_valid) begin
                    state <= `LUT_STATE_WAIT1;
                    cache_hit <= 1'b0;
                    write_tag <= tag_addr;
                end else if (en & cache_valid) begin
                    refresh <= 1'b1;
                    refresh_entry <= cache_entry;
                    
                    cache_hit <= 1'b1;
                    group_addr <= cache_entry;
                    query_tag_addr <= tag_list[cache_entry];
                end else begin
                    refresh <= 1'b0;
                end 
            end
            `LUT_STATE_WAIT1: begin
                state <= `LUT_STATE_FETCH;
            end
            `LUT_STATE_FETCH: begin
                group_addr <= line_to_use;
                query_tag_addr <= tag_list[line_to_use];
                
                refresh <= 1'b1;
                refresh_entry <= line_to_use;
                state <= `LUT_STATE_IDLE;
                
                tag_list[line_to_use] <= write_tag;
                valid[line_to_use] <= 1'b1;
            end
            endcase
        end
    end
    
endmodule
