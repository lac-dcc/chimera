// This program was cloned from: https://github.com/AleksandarLilic/ama-riscv
// License: GNU General Public License v3.0

//-----------------------------------------------------------------------------
// Project:         AMA-RISCV
// Module:          Synchronizer Testbench
// File:            synchronizer_tb.v
// Date created:    2021-05-31
// Author:          Aleksandar Lilic
// Description:     Checks basic functionality. Cannot model metastability
//
// Version history:
//      2021-05-31  AL  0.1.0 (RTL 0.1.0) - Initial
//      2021-05-31  AL  1.0.0 (RTL 0.1.0) - Sign-off
//-----------------------------------------------------------------------------

`timescale 1ns/100ps

`define CLK_PERIOD 10

module synchronizer_tb();
//-----------------------------------------------------------------------------
// Signals

// I/O of synchronizer
reg         clk = 0;
reg         rst;
reg         async_signal;
wire        sync_signal;

// Testbench variables
reg   [5:0] test_status;
wire  [4:0] driver = 5'b1_0101;

//-----------------------------------------------------------------------------
// Clock gen: 100 MHz
always #(`CLK_PERIOD/2) clk = ~clk;

//-----------------------------------------------------------------------------
// DUT instance
synchronizer #(
    .WIDTH(1)
) DUT (
    .clk            (clk),
    .rst            (rst),
    .async_signal   (async_signal),
    .sync_signal    (sync_signal)
);

//-----------------------------------------------------------------------------
// Test
initial begin
    fork
    
        // Reset thread
        begin
            rst = 0;
            #1 rst = 1;
            $display("reset @ %0d ns", $time);
            @(posedge clk); #1 rst = 0;
        end
        
        // Thread 1: Drive DUT async_signal input
        begin
            async_signal = 1'b0;
            repeat (2) @(posedge clk); // wait for reset
            #(`CLK_PERIOD * 2)     async_signal = driver[0];
            #(`CLK_PERIOD * 1 + 1) async_signal = driver[1];
            #(`CLK_PERIOD * 3 + 2) async_signal = driver[2];
            #(`CLK_PERIOD * 2 - 4) async_signal = driver[3];
            #(`CLK_PERIOD * 4 + 2) async_signal = driver[4];
        end
        
        // Thread 2: Monitor DUT sync_signal output
        begin
            test_status = 6'b11_1111;
            repeat (2) @(posedge clk);  // wait for reset
            repeat (3) @(posedge clk); 
            #1 if (sync_signal !== driver[0]) test_status[0] = 1'b0;
            repeat (2) @(posedge clk); 
            #1 if (sync_signal !== driver[1]) test_status[1] = 1'b0;
            repeat (3) @(posedge clk); 
            #1 if (sync_signal !== driver[2]) test_status[2] = 1'b0;
            repeat (2) @(posedge clk); 
            #1 if (sync_signal !== driver[3]) test_status[3] = 1'b0;
            repeat (4) @(posedge clk); 
            #1 if (sync_signal !== driver[4]) test_status[4] = 1'b0;
        end
    join
    
    // Last check
    repeat (3) @(posedge clk); #1 if (sync_signal !== driver[4]) test_status[5] = 1'b0;
    // Report status
    $display("Test Finished @ %0d ns. Status of the tests: 6'b%2b_%4b", 
              $time, test_status[5:4],test_status[3:0]);
    
    $finish();
end

endmodule
