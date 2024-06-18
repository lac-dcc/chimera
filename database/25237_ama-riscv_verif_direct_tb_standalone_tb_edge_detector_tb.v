// This program was cloned from: https://github.com/AleksandarLilic/ama-riscv
// License: GNU General Public License v3.0

//-----------------------------------------------------------------------------
// Project:         AMA-RISCV
// Module:          Edge Detector Testbench
// File:            edge_detector_tb.v
// Date created:    2021-05-31
// Author:          Aleksandar Lilic
// Description:     Checks that edge_detector module outputs one clock wide
//                  pulse regardless of the duration of the input pulse
//
// Version history:
//      2021-05-31  AL  0.1.0 (RTL 0.1.0) - Initial
//      2021-05-31  AL  1.0.0 (RTL 0.1.0) - Sign-off
//-----------------------------------------------------------------------------

`timescale 1ns/100ps

`define CLK_PERIOD          10
`define EDGE_DETECTOR_WIDTH  1

module edge_detector_tb();
//-----------------------------------------------------------------------------
// Signals

// I/O of edge detector
reg     clk = 0;
reg     rst;
reg     [`EDGE_DETECTOR_WIDTH-1:0] signal_in;
wire    [`EDGE_DETECTOR_WIDTH-1:0] edge_detect_pulse;

// Testbench variables
reg done = 0;

//-----------------------------------------------------------------------------
// Clock gen: 100 MHz
always #(`CLK_PERIOD/2) clk = ~clk;

//-----------------------------------------------------------------------------
// DUT instance
edge_detector #(
    .WIDTH              (`EDGE_DETECTOR_WIDTH)
) DUT (
    .clk                (clk),
    .rst                (rst),
    .signal_in          (signal_in),
    .edge_detect_pulse  (edge_detect_pulse)
);

//-----------------------------------------------------------------------------
// Test
initial begin
    // Set initial state, wait for a few clock cycles
    rst = 0;
    signal_in = 0;
    #(`CLK_PERIOD * 2) rst = 1;
    #(`CLK_PERIOD * 2) rst = 0;
    //repeat (10) @(posedge clk); #1;

    // Test 1:
    // Check long and short pulse on the input
    fork
    
        // Thread 1: provide input signal
        begin
            // Pulse signal_in for 10 clock cycles
            signal_in[0] = 1'b1;
            repeat (10) @(posedge clk); #1;
            signal_in[0] = 1'b0;

            // Wait for 10 clock cycles
            repeat (10) @(posedge clk); #1;

            // Pulse signal_in for 1 clock cycle
            signal_in[0] = 1'b1;
            repeat (1) @(posedge clk); #1;
            signal_in[0] = 1'b0;

            // Wait for 10 clock cycles
            repeat (10) @(posedge clk);
        end

        // Thread 2: check that the output always lasts one clock cycle
        begin
            // Wait for the rising edge of the edge detector output
            @(posedge edge_detect_pulse);
            // Let 1 clock cycle elapse 
            @(posedge clk); #1;

            // Check that the edge detector output is now low
            if (edge_detect_pulse[0] !== 1'b0) 
                $display("Failure 1: Edge detector's output wasn't 1 clock cycle wide");

            // Wait for the 2nd rising edge
            @(posedge edge_detect_pulse);
            @(posedge clk); #1;
            
            // Check that the edge detector output is now low
            if (edge_detect_pulse[0] !== 1'b0) 
                $display("Failure 2: Edge detector's output wasn't 1 clock cycle wide");
            done = 1;
        end

        // Catch time-out:
        begin
            repeat (100) @(posedge clk);
            if (!done) begin
                $display("Failure: Timing out after 1000 cycles");
                $finish();
            end
        end
    join
    
    $display("Test Done.");
    $finish();
end

endmodule
