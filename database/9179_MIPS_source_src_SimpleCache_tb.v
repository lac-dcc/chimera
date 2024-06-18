// This program was cloned from: https://github.com/valar1234/MIPS
// License: GNU Lesser General Public License v3.0

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/02/12 09:49:32
// Design Name: 
// Module Name: SimpleCache_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module SimpleCache_tb(
    );
    
    reg               clk;
    reg               rst;
    reg               CPU_read_en;
    wire  [31:0]      CPU_read_dout;
    reg               CPU_write_en;
    reg  [31:0]       CPU_write_din;
    wire  [31:0]       CPU_addr;
    wire               cache_done;
    reg               mem_we;
    wire  [31:0]       mem_addr;
    reg  [31:0]       mem_din;
    wire  [31:0]      mem_dout;
    integer             index;
    
    reg [20:0]  addr_tag;
    reg [5:0]   addr_index;
    reg [2:0]   addr_offset;
    
    assign mem_addr = {addr_tag, addr_index, addr_offset, 2'b00};
    assign CPU_addr = {addr_tag, addr_index, addr_offset, 2'b00};
    
    always #5 clk = ~clk;
    
    initial
    begin
        clk = 1;
        rst = 1;
        CPU_read_en = 0;
        CPU_write_en = 0;
        CPU_write_din = 0;
        mem_we = 0;
        mem_din = 0;
        index = 0;
        repeat(3) @(posedge clk);
        rst = 0;
        
//        /* write some data to the main_mem for test */
//        #15;
//        addr_tag = 21'd1; addr_index = 6'd5; addr_offset = 3'd3;
//        mem_din = 32'd3333; mem_we = 1;
//        #10;
//        addr_tag = 21'd2; addr_index = 6'd5; addr_offset = 3'd3;
//        mem_din = 32'd9595; mem_we = 1;
//        #10
//        mem_we = 0;
        
        
        /* write the data to test WRITE CACHE MISS */
        for( index = 0; index < 8; index = index + 1)
        begin
            #25;
            addr_tag = 21'd1; addr_index = 6'd15; addr_offset = index;
            CPU_write_din = 100 + index;
            CPU_write_en = 1;
            wait( cache_done );
            CPU_write_en = 0;
        end
        
        /* write the data to test WRITE CACHE MISS */
        for( index = 0; index < 8; index = index + 1)
        begin
            #25;
            addr_tag = 21'd1; addr_index = 6'd20; addr_offset = index;
            CPU_write_din = 200 + index;
            CPU_write_en = 1;
            wait( cache_done );
            CPU_write_en = 0;
        end
        
        /* read the data to test WRITE CACHE MISS */
        for( index = 0; index < 8; index = index + 1)
        begin
            #25;
            addr_tag = 21'd1; addr_index = 6'd15; addr_offset = index;
            CPU_read_en = 1;
            wait( cache_done );
            CPU_read_en = 0;
        end
        
        /* read the data to test WRITE CACHE MISS */
        for( index = 0; index < 8; index = index + 1)
        begin
            #25;
            addr_tag = 21'd1; addr_index = 6'd20; addr_offset = index;
            CPU_read_en = 1;
            wait( cache_done );
            CPU_read_en = 0;
        end        
        
       
    end
    
    
    /* instantiate of the SimpleCache */
    SimpleCache SimpleCache_i(
        .clk( clk ),
        .rst( rst ),
        .CPU_read_en( CPU_read_en ),
        .CPU_read_dout( CPU_read_dout ),
        .CPU_write_en( CPU_write_en ),
        .CPU_write_din( CPU_write_din ),
        .CPU_addr( CPU_addr ),
        .cache_done( cache_done ),
        .mem_b_we( mem_we ),
        .mem_b_addr( mem_addr[14:2] ),
        .mem_b_din( mem_din ),
        .mem_b_dout( mem_dout )
    );
   
endmodule
