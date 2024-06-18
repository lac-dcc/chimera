// This program was cloned from: https://github.com/PaolaUniSa/tt6_rsnn_test0
// License: Apache License 2.0

`timescale 1ns / 1ps

module tb_FIPO_Memory;

    // Inputs to the FIPO_Memory
    reg clk;
    reg rst;
    reg enable;
    reg serial_in;

    // Outputs from the FIPO_Memory
    wire [311:0] parallel_out;
    wire end_writing;
    wire data_written;

    // Instantiate the FIPO_Memory module
    FIPO_Memory uut (
        .clk(clk),
        .rst(rst),
        .enable(enable),
        .serial_in(serial_in),
        .parallel_out(parallel_out),
        .end_writing(end_writing),
        .data_written(data_written)
    );

    // Clock generation
    always #5 clk = ~clk; // Generate a clock with a period of 10 ns

    // Test stimulus
    initial begin
        // Initialize inputs
        clk = 0;
        rst = 1;
        enable = 0;
        serial_in = 0;

        // Apply reset
        #10;
        rst = 0;

        // Test Case 1: All zeros input
        enable = 1;
        repeat (312) begin
            @ (posedge clk)
                serial_in = 0;
        end
        #100; // Wait longer to check the end_writing signal

        // Test Case 2: All ones input
        rst = 1;
        #10;
        rst = 0;
        enable = 1;
        repeat (312) begin
            @ (posedge clk)
                serial_in = 1;
        end
        #100; // Wait longer to check the end_writing signal

        // Test Case 3: Alternate ones and zeros
        rst = 1;
        #10;
        rst = 0;
        enable = 1;
        repeat (312) begin
            @ (posedge clk)
                serial_in = ~serial_in;
        end
        #100; // Wait longer to check the end_writing signal

        // Test Case 4: Random data input
        rst = 1;
        #10;
        rst = 0;
        enable = 1;
        repeat (312) begin
            @ (posedge clk)
                serial_in = $random % 2;
        end
        #100; // Wait longer to check the end_writing signal

        // Finish the simulation
        $finish;
    end

    // Optional: Monitor changes in outputs
    initial begin
        $monitor("Time=%g, clk=%b, rst=%b, enable=%b, serial_in=%b, end_writing=%b, data_written=%b, parallel_out=%b",
                 $time, clk, rst, enable, serial_in, end_writing, data_written, parallel_out);
    end

endmodule
