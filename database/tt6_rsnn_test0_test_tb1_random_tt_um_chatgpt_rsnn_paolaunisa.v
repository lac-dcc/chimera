// This program was cloned from: https://github.com/PaolaUniSa/tt6_rsnn_test0
// License: Apache License 2.0

// Enhanced Test Bench with Multiple Test Cases for tt_um_chatgpt_rsnn_paolaunisa

`timescale 1ns/1ps

module tb1_random_tt_um_chatgpt_rsnn_paolaunisa;

    // Inputs
    reg [7:0] ui_in;
    reg [7:0] uio_in;
    reg ena;
    reg clk;
    reg rst_n;

    // Outputs
    wire [7:0] uo_out;
    wire [7:0] uio_out;
    wire [7:0] uio_oe;
    
    parameter integer CLOCK_PERIOD = 20;  // Clock period in nanoseconds 
    
    // Instantiate the Unit Under Test (UUT)
    tt_um_chatgpt_rsnn_paolaunisa uut (
        .ui_in(ui_in),
        .uo_out(uo_out),
        .uio_in(uio_in),
        .uio_out(uio_out),
        .uio_oe(uio_oe),
        .ena(ena),
        .clk(clk),
        .rst_n(rst_n)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #(CLOCK_PERIOD/2) clk = !clk; 
    end

    // Apply different test scenarios
    task apply_inputs;
        input [7:0] test_ui_in;
        input [7:0] test_uio_in;
        input test_ena;
        begin
            @(posedge clk);
            ena = test_ena;
            ui_in = test_ui_in;
            uio_in = test_uio_in;
            @(posedge clk);
        end
    endtask

    // Stimulus and response monitoring
    initial begin
        // Initialize Inputs
        ui_in = 0;
        uio_in = 0;
        ena = 0;
        rst_n = 0;  // Assert Reset
        #(2*CLOCK_PERIOD);
        rst_n = 1;

        // Wait for Global Reset to stabilize
        #(10*CLOCK_PERIOD);
        rst_n = 0;  // Assert Reset
        #(2*CLOCK_PERIOD);
        rst_n = 1;  // De-assert Reset
        #(3*CLOCK_PERIOD);

        // Case 1: Simple enable test
        apply_inputs(8'hAA, 8'h55, 1);
        #(20*CLOCK_PERIOD);

        // Case 2: Toggle RSNN Enable Bit
        apply_inputs(8'h10, 8'h00, 1);
        #(20*CLOCK_PERIOD);

        // Case 3: Data Writing Test
        apply_inputs(8'h20, 8'hFF, 1);
        #(20*CLOCK_PERIOD);

        // Case 4: Parameter Load Test
        apply_inputs(8'h40, 8'h11, 1);
        #(20*CLOCK_PERIOD);

        // Case 5: System Disable Test
        apply_inputs(8'h80, 8'h22, 0);
        #(20*CLOCK_PERIOD);

        $finish;
    end

    // Monitor changes to outputs
    initial begin
        $monitor("Time = %t, ena = %b, ui_in = %b, uio_in = %b, uo_out = %b, uio_out = %b, uio_oe = %b",
                 $time, ena, ui_in, uio_in, uo_out, uio_out, uio_oe);
    end

endmodule
