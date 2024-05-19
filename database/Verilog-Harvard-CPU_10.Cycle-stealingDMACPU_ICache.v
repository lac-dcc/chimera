// This program was cloned from: https://github.com/jaywonchung/Verilog-Harvard-CPU
// License: MIT License

//////////////////////////////////////////////////////////////////////////////////
// Organization: SNUECE
// Student: Jaewon Chung
// 
// Module Name: Instruction Cache
// Project Name: Computer organization Project 7
//////////////////////////////////////////////////////////////////////////////////

`define LATENCY 4

module ICache(
    input clk,
    input reset_n,

    // communication with CPU
    input i_readC,
    input [15:0] i_address,
    output [15:0] i_data,
    output InstCacheBusy,

    // communication with Memory    
    output reg i_readM,
    output [13:0] i_address_mem,
    input [63:0] i_data_mem
    );
    
    /*
    Latency:
        Read hit:                         1 cycle
        Read miss:                        6 cycles (1 for cache search, 4 for memory read, 1 for cache search)
        Read miss, during right prefetch: 2~5 cycles (cache was already prefetching the correct block)
        Read miss, during wrong prefetch: 7 cycles (1 for cache search, 1 for prefetch cancel, 4 for memory read, 1 for cache search)
    
    Output:
        InstCacheBusy: asserted when the cache is fetching the requested data. 
                       deasserted right before the cycle data is provided, so that the CPU can detect fetch finish at posedge clk.
                       Hence, (the number of cycles InstCacheBusy==1) + 1 is the cache's latency. 
    */
    
    reg [11:0] TagBank [3:0];
    reg Valid [3:0];
    reg [63:0] DataBank [3:0];
    
    wire [11:0] tag;
    wire [1:0] idx;
    wire [1:0] block;
    wire hit;
    
    // internal counter that counts the memory latency
    reg [2:0] InstCacheCounter;
    
    // for prefetching
    reg prefetching;
    reg [2:0] PrefetchCounter;
    reg [13:0] fetched_block, prefetched_block;
    
    assign tag = i_address[15:4];
    assign idx = i_address[3:2];
    assign block = i_address[1:0];
    
    assign hit = (TagBank[idx]==tag) && Valid[idx];
    
    assign i_data = (i_readC && hit) ? DataBank[idx][16*block+:16] : 16'hz;
    
    assign i_address_mem = prefetching ? (fetched_block + 1) : { tag, idx };
    
    // Becomes zero when data is fetched into the cache, since hit becomes 1.
    assign InstCacheBusy = i_readC && !hit;
    
    // Cache reset
    always @(posedge clk) begin
        if (!reset_n) begin
            { TagBank[3], TagBank[2], TagBank[1], TagBank[0] } <= 0;
            { Valid[3], Valid[2], Valid[1], Valid[0] } <= 0;
            { DataBank[3], DataBank[2], DataBank[1], DataBank[0] } <= 0;
            i_readM <= 0;
            InstCacheCounter <= 0;
            PrefetchCounter <= 0;
            prefetching <= 0;
            prefetched_block <= 0;
        end
    end
    
    always @(posedge clk) begin
        if (reset_n) begin
            if (i_readC && !hit) begin  // fetch missed PC from memory
            
                if (prefetching) begin  // cache was during prefetch!
                    if (i_address_mem == {tag, idx}) begin  // cache was actually prefetching the correct block. continue!
                        if (PrefetchCounter == 1) begin
                            TagBank[(fetched_block[1:0]+1)%4] <= i_address_mem[13:2];
                            Valid[(fetched_block[1:0]+1)%4] <= 1;
                            DataBank[(fetched_block[1:0]+1)%4] <= i_data_mem;
                            i_readM <= 0;
                            fetched_block <= i_address_mem;
                        end else begin
                            InstCacheCounter <= PrefetchCounter - 1;
                        end
                    end else begin  // cache was prefetching the wrong block. cancel, and restart next cycle.
                        i_readM <= 0;
                    end
                    PrefetchCounter <= 0;
                    prefetching <= 0;
                // instruction is serviced from the memory when InstCacheCounter value is 1.
                end else if (InstCacheCounter == 0) begin
                    i_readM <= 1;
                    InstCacheCounter <= `LATENCY;
                end else if (InstCacheCounter == 1) begin
                    TagBank[idx] <= tag;
                    Valid[idx] <= 1;
                    DataBank[idx] <= i_data_mem;
                    i_readM <= 0;
                    fetched_block <= i_address_mem;
                end else begin
                    InstCacheCounter <= InstCacheCounter - 1;
                end
                
            end else begin  // prefetch next block undercover when there are no requests
            
                if (prefetched_block != fetched_block + 1) begin    // check if the next block was already prefetched
                    if (PrefetchCounter == 0) begin
                        prefetching <= 1;   // internal cache-busy-because-of-prefetch signal. not exposed outside.
                        i_readM <= 1;
                        PrefetchCounter <= `LATENCY;
                    end else if (PrefetchCounter == 1) begin
                        TagBank[(fetched_block[1:0]+1)%4] <= i_address_mem[13:2];
                        Valid[(fetched_block[1:0]+1)%4] <= 1;
                        DataBank[(fetched_block[1:0]+1)%4] <= i_data_mem;
                        i_readM <= 0;
                        prefetched_block <= fetched_block + 1;
                        prefetching <= 0;
                        PrefetchCounter <= 0;
                    end else begin
                        PrefetchCounter <= PrefetchCounter - 1;
                    end
                end else begin  // next block was already prefetched.
                    i_readM <= 0;
                end
                
                InstCacheCounter <= 0;
                
            end
        end
    end
    
    
    // For measuring hit ratio
    integer inst_hit_instructions, inst_total_instructions;
    
    always @(posedge clk) begin
        if (!reset_n) begin
            inst_total_instructions <= 0;
            inst_hit_instructions <= 0;
        end
    end
    
    always @(negedge clk) begin
        if (i_readC && hit) inst_total_instructions <= inst_total_instructions + 1;
        if (i_readC && hit && InstCacheCounter==0) inst_hit_instructions <= inst_hit_instructions + 1;
    end
    
endmodule
