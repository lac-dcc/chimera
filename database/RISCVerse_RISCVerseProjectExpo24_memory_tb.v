// This program was cloned from: https://github.com/chandana38/RISCVerse
// License: MIT License

`timescale 1ns / 1ps

module memory_tb;

    // Parameters
    parameter DATA_WIDTH = 32;
    parameter ADDR_WIDTH = 32;
    parameter MEM_DEPTH = 16384;

    // Signals
    reg clk, rst, mem_en, rd_wr;
    reg [ADDR_WIDTH-1:0] read_addr, write_addr;
    reg [DATA_WIDTH-1:0] write_data;
    wire [DATA_WIDTH-1:0] read_data;

    // Instantiate the memory module
    memory #(
        .data_width(DATA_WIDTH),
        .addr_width(ADDR_WIDTH)
    ) dut (
        .clk(clk),
        .rst(rst),
        .mem_en(mem_en),
        .rd_wr(rd_wr),
        .read_addr(read_addr),
        .write_addr(write_addr),
        .write_data(write_data),
        .read_data(read_data)
    );

    // Clock generation
    always #5 clk = ~clk;

    // Initial values
    initial begin
        clk = 0;
        rst = 1;
        mem_en = 0;
        rd_wr = 0;
        read_addr = 0;
        write_addr = 0;
        write_data = 0;

        // Reset
        #10 rst = 0;

        // Write data to memory
        #20 mem_en = 1;
        #30 rd_wr = 1;
        #40 write_addr = 32'h0000_0000;
        #50 write_data = 32'h1234_5678;
        #60 rd_wr = 0;
        #70 mem_en = 0;

        // Read data from memory
        #80 mem_en = 1;
        #90 rd_wr = 1;
        #100 read_addr = 32'h0000_0000;
        #110 mem_en = 0;

        // Stop simulation after some time
        #120 $stop;
    end

    // Display read data
    always @(posedge clk) begin
        $display("Read Data: %h", read_data);
    end

endmodule
