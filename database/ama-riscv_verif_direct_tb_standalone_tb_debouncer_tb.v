// This program was cloned from: https://github.com/AleksandarLilic/ama-riscv
// License: GNU General Public License v3.0

//-----------------------------------------------------------------------------
// Project:         AMA-RISCV
// Module:          Debouncer Testbench
// File:            debouncer_tb.v
// Date created:    2021-05-31
// Author:          Aleksandar Lilic
// Description:     Checks that debouncer module smooths-out all input signals
//
// Version history:
//      2021-05-31  AL  0.1.0 (RTL 0.1.0) - Initial
//      2021-05-31  AL  1.0.0 (RTL 0.1.0) - Sign-off
//-----------------------------------------------------------------------------

`timescale 1ns/100ps

`define CLK_PERIOD          10
`define DEBOUNCER_WIDTH      2
`define SAMPLE_COUNT_MAX    10
`define PULSE_COUNT_MAX      5

module debouncer_tb();
//-----------------------------------------------------------------------------
// Signals

// I/O of debouncer
reg     clk = 0;
reg     rst;
reg     [`DEBOUNCER_WIDTH-1:0] glitchy_signal;
wire    [`DEBOUNCER_WIDTH-1:0] debounced_signal;

// Testbench variables
integer test1_done = 0;

//-----------------------------------------------------------------------------
// Clock gen: 100 MHz
always #(`CLK_PERIOD/2) clk = ~clk;

//-----------------------------------------------------------------------------
// DUT instance
debouncer #(
    .WIDTH              (`DEBOUNCER_WIDTH),
    .SAMPLE_COUNT_MAX   (`SAMPLE_COUNT_MAX),
    .PULSE_COUNT_MAX    (`PULSE_COUNT_MAX)
) DUT (
    .clk                (clk),
    .rst                (rst),
    .glitchy_signal     (glitchy_signal),
    .debounced_signal   (debounced_signal)
);

//-----------------------------------------------------------------------------
// Test
initial begin
    glitchy_signal = 'd0;
    rst = 0;
    @(posedge clk);

    // Test 1:
    // Check that if input signal bounces for some time and then goes low 
    // before saturating counter has finished, the output never goes high
    fork
        // Reset thread
        begin                
            #(`CLK_PERIOD * 2) rst = 1;
            #(`CLK_PERIOD * 2) rst = 0;
        end
        
        // Thread 1: provide the glitchy signal
        begin
             // Wait for reset
            #(`CLK_PERIOD * 4);
            
            // Initially act glitchy
            repeat (10) begin
                glitchy_signal[0] = ~glitchy_signal[0];
                @(posedge clk);
            end

            // Bring the signal high and hold until before the saturating
            // counter should finish, then pull low
            glitchy_signal[0] = 1'b1;
            repeat (`SAMPLE_COUNT_MAX * (`PULSE_COUNT_MAX - 1)) @(posedge clk);

            // Pull the signal low and wait, the debouncer shouldn't set its 
            // output high
            glitchy_signal[0] = 1'b0;
            repeat (`SAMPLE_COUNT_MAX * (`PULSE_COUNT_MAX + 1)) @(posedge clk);
            test1_done = 1;
        end
        
        // Thread 2: check that the output of the debouncer never goes high
        begin: test1_checker
            @(posedge clk);
            
            while (!test1_done) begin
                if (debounced_signal[0] !== 1'b0) 
                    $display("Failure 0: The debounced output[0] wasn't 0 for the entire test.");
                @(posedge clk);
            end
        end
    join

    
    // Test 2:
    // Check that if input signal bounces for some time and then goes high long enough 
    // for saturating counter to finish, the output goes high and stays high until 
    // input goes low again
    fork
        begin
             #(`CLK_PERIOD * 4);
             
            // Initially act glitchy
            repeat (10) begin
                glitchy_signal[1] = ~glitchy_signal[1];
                @(posedge clk);
            end

            // Bring the signal high and hold past the point at which the debouncer should saturate
            glitchy_signal[1] = 1'b1;
            repeat (`SAMPLE_COUNT_MAX * (`PULSE_COUNT_MAX + 1)) @(posedge clk);

            if (debounced_signal[1] !== 1'b1) 
                $display("Failure 1: The debounced output[1] should have gone high by now %t", $time);
            @(posedge clk);

            // While the signal is high, the debounced output should remain high
            repeat (`SAMPLE_COUNT_MAX * (3)) begin
                if (debounced_signal[1] !== 1'b1) $display("Failure 2: The debounced output[1] should stay high once the counter saturates at %t", $time);
                @(posedge clk);
            end

            // Pull the signal low and the output should fall after the next sampling period
            // The output is only guaranteed to fall after the next sampling period
            // Wait until another sampling period to ensure signal stays low
            glitchy_signal[1] = 1'b0;
            repeat (`SAMPLE_COUNT_MAX + 1) @(posedge clk);

            if (debounced_signal[1] !== 1'b0) 
                $display("Failure 3: The debounced output[1] should have fallen by now %t", $time);
            @(posedge clk);

            // Wait for some time to ensure the signal stays low
            repeat (`SAMPLE_COUNT_MAX * (`PULSE_COUNT_MAX + 1)) begin
                if (debounced_signal[1] !== 1'b0) 
                    $display("Failure 4: The debounced output[1] should remain low at %t", $time);
                @(posedge clk);
            end
        end
    join

    repeat (100) @(posedge clk);
    $display("Test Done.");
    $finish();
end

endmodule
