// This program was cloned from: https://github.com/jaywonchung/Verilog-Harvard-CPU
// License: MIT License

//////////////////////////////////////////////////////////////////////////////////
// Organization: SNUECE
// Student: Jaewon Chung
// 
// Module Name: Data Cache
// Project Name: Computer organization Project 7
//////////////////////////////////////////////////////////////////////////////////

`define LATENCY 4

module DCache(
    input clk,
    input reset_n,

    // communication with CPU
    input d_readC, d_writeC,
    input [15:0] d_address,
    inout [15:0] d_data,
    output DataCacheBusy,
    
    // communication with Memory
    output reg d_readM, d_writeM,
    output [13:0] d_address_mem,
    inout [63:0] d_data_mem
    );
    
    /*
    Latency:
        Read/write hit:              1 cycle
        Read/write miss, no evict:   6 cycles (1 for cache search, 4 for memory read, 1 for cache search)
        Read/write miss, yes evict:  10 cycles (1 for cache search, 4 for cache line eviction, 4 for memory read, 1 for cache search)
    
    Output:
        DataCacheBusy: asserted when the cache is fetching the requested data. 
                       deasserted right before the cycle data is provided, so that the CPU can detect fetch finish at posedge clk.
                       Hence, (the number of cycles DataCacheBusy==1) + 1 is the cache's latency. 
    */
    
    reg [11:0] TagBank [3:0];
    reg Valid [3:0];
    reg Dirty [3:0];
    reg [63:0] DataBank [3:0];
    
    wire [11:0] tag;
    wire [1:0] idx;
    wire [1:0] block;
    wire hit, evict;
    
    reg [2:0] DataCacheCounter;
    
    assign tag = d_address[15:4];
    assign idx = d_address[3:2];
    assign block = d_address[1:0];
    
    assign hit = (TagBank[idx]==tag) && Valid[idx];
    assign evict = (Dirty[idx]);
    
    // Read hit is handled combinationally
    assign d_data = (d_readC && hit) ? DataBank[idx][16*block+:16] : 16'hz;
    
    assign d_address_mem = { tag, idx };
    assign d_data_mem = (d_writeM && evict) ? DataBank[idx] : 64'hz;
    
    // Becomes zero when data is fetched into the cache, since hit becomes 1.
    assign DataCacheBusy = (d_readC || d_writeC) && !hit;
    
    // Cache reset
    always @(posedge clk) begin
        if (!reset_n) begin
            { TagBank[3], TagBank[2], TagBank[1], TagBank[0] } <= 0;
            { Valid[3], Valid[2], Valid[1], Valid[0] } <= 0;
            { Dirty[3], Dirty[2], Dirty[1], Dirty[0] } <= 0;
            { DataBank[3], DataBank[2], DataBank[1], DataBank[0] } <= 0;
            d_readM <= 0;
            d_writeM <= 0;
            DataCacheCounter <= 0;
        end
    end
    
    // Data read/write miss
    always @(posedge clk) begin
        if (reset_n) begin
            if ((d_readC || d_writeC) && !hit) begin
                if (evict) begin    // evict cache line to memory. actual evicting logic is located at the next always statement.
                    if (DataCacheCounter == 0) begin
                        d_writeM <= 1;
                        DataCacheCounter <= `LATENCY;
                    end else begin
                        DataCacheCounter <= DataCacheCounter - 1;
                    end
                end else begin      // fetch cache line from memory
                    if (DataCacheCounter == 0) begin
                        d_readM <= 1;
                        DataCacheCounter <= `LATENCY;
                    end else if (DataCacheCounter == 1) begin
                        TagBank[idx] <= tag;
                        Valid[idx] <= 1;
                        Dirty[idx] <= 0;
                        DataBank[idx] <= d_data_mem;
                        d_readM <= 0;
                    end else begin
                        DataCacheCounter <= DataCacheCounter - 1;
                    end
                end
            end else begin
                d_readM <= 0;
                d_writeM <= 0;
                DataCacheCounter <= 0;
            end
        end
    end
    
    // Cache line eviction
    always @(negedge clk) begin
        if (reset_n && !hit && evict && DataCacheCounter == 1) begin
            Dirty[idx] <= 0;    // Dirty bit cleared. Now the evict signal will drop.
            Valid[idx] <= 0;
            d_writeM <= 0;
            DataCacheCounter <= 0;                    
        end
    end
    
    // Data write hit: latch to cache at next posedge
    always @(posedge clk) begin
        if (reset_n) begin
            if (d_writeC && hit) begin
                DataBank[idx][16*block+:16] <= d_data;
                Dirty[idx] <= 1;
            end
        end
    end
    
    
    // For measuring hit ratio    
    integer data_hit_instructions, data_total_instructions;
    
    always @(posedge clk) begin
        if (!reset_n) begin
            data_hit_instructions <= 0;
            data_total_instructions <= 0;
        end
    end
    
    always @(negedge clk) begin
        if ((d_readC || d_writeC) && hit) data_total_instructions <= data_total_instructions + 1;
        if ((d_readC || d_writeC) && hit && DataCacheCounter==0) data_hit_instructions <= data_hit_instructions + 1;
    end
    
endmodule
