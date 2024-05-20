// This program was cloned from: https://github.com/AleksandarLilic/ama-riscv
// License: GNU General Public License v3.0

//-----------------------------------------------------------------------------
// Project:         AMA-RISCV
// Module:          FIFO Testbench
// File:            fifo_tb.v
// Date created:    2021-06-07
// Author:          Aleksandar Lilic
// Description:     Test covers multiple scenarios:
//                      - Writing to a full FIFO
//                      - Reading from an empty FIFO
//                      - Concurrent read and write to and from FIFO
//                      - Burst mode read and write
//
// Version history:
//      2021-06-07  AL  0.1.0 - Initial
//      2021-06-07  AL  1.0.0 - Sign-off
//-----------------------------------------------------------------------------

`timescale 1ns/100ps

`define CLK_PERIOD       8
`define DATA_WIDTH      32
`define FIFO_DEPTH       8
`define BURST_MODE       1

module fifo_tb();

//-----------------------------------------------------------------------------
// Signals

// DUT I/O 
reg clk = 0;
reg rst = 0;

// Write side signals
reg [`DATA_WIDTH-1:0] din = 0;
reg         wr_en = 0;
wire        full;

// Read side signals
wire [`DATA_WIDTH-1:0] dout;
reg         rd_en = 0;
wire        empty;

// Testbench variables
integer i, ii;
// Reg filled with test vectors for the testbench
reg [`DATA_WIDTH-1:0] test_values[`FIFO_DEPTH-1:0];
// Reg used to collect the data read from the FIFO
reg [`DATA_WIDTH-1:0] received_values[`FIFO_DEPTH-1:0];

//-----------------------------------------------------------------------------
// DUT instance
fifo #(
    .DATA_WIDTH (`DATA_WIDTH),
    .FIFO_DEPTH (`FIFO_DEPTH)
) DUT (
    .clk        (clk),
    .rst        (rst),
    .wr_en      (wr_en),
    .din        (din),
    .fifo_full  (full),
    .rd_en      (rd_en),
    .dout       (dout),
    .fifo_empty (empty)
);

//-----------------------------------------------------------------------------
// Clock gen: 125 MHz
always #(`CLK_PERIOD/2) clk = ~clk;

//-----------------------------------------------------------------------------
// Tasks

// This task will push some data to the FIFO through the write interface
// If violate_interface == 1'b1, force wr_en high even if the FIFO is full
// If violate_interface == 1'b0, won't write if the FIFO is full
task write_to_fifo;
    input [`DATA_WIDTH-1:0] write_data;
    input violate_interface;
    begin
        
        if (!violate_interface && full) begin
            wr_en <= 1'b0;
        end
        else begin  // try to write regardless
            wr_en <= 1'b1;
        end

        din <= write_data;

        // Wait for the clock edge to perform the write
        @(posedge clk);
        #1;

        // Deassert the write enable
        wr_en <= 1'b0;
    end
endtask

// This task will read some data from the FIFO through the read interface
// violate_interface does the same as for the write_to_fifo task
task read_from_fifo;
    input violate_interface;
    output [`DATA_WIDTH-1:0] read_data;
    begin
        if (!violate_interface && empty) begin
            rd_en <= 1'b0;
        end
        else begin
            rd_en <= 1'b1;
        end
        // Wait for the clock edge to get the read data
        @(posedge clk);
        #1;

        read_data = dout;
        // Deassert the read enable
        rd_en <= 1'b0;
    end
endtask

//-----------------------------------------------------------------------------
// Test
initial begin: TB
    // Generate the random data to write to the FIFO
    for (i = 0; i < `FIFO_DEPTH; i = i + 1) begin
        test_values[i] <= $random;
    end
    
    // Reset DUT
    rst = 1'b1;
    @(posedge clk); #1;
    rst = 1'b0;
    @(posedge clk); #1;
    
    //-----------------------------------------------------------------------------
    // Test 1: Regular reads and writes with `BURST_MODE switch
    // Check initial conditions
    if (empty !== 1'b1) begin
        $display("Failure: After reset, the FIFO isn't empty. empty = %b", empty);
    end

    if (full !== 1'b0) begin
        $display("Failure: After reset, the FIFO is full. full = %b", full);
    end

    @(posedge clk);
    
    //-----------------------------------------------------------------------------
    // Write test:
    // Begin pushing data into the FIFO with a 1 cycle delay in between each write operation
    for (i = 0; i < `FIFO_DEPTH - 1; i = i + 1) begin
        write_to_fifo(test_values[i], 1'b0);

        // Perform checks on empty, full
        if (empty === 1'b1) begin
            $display("Failure: While being filled, FIFO was flagged as empty");
        end
        if (full === 1'b1) begin
            $display("Failure: While being filled, FIFO was flagged full before all entries were written");
        end

        // Insert single-cycle delay between each write
        // For burst mode, there is no delay
        if (!`BURST_MODE) @(posedge clk);
    end

    // Perform the final write
    write_to_fifo(test_values[`FIFO_DEPTH-1], 1'b0);

    // Check that the FIFO is now full
    if (full !== 1'b1 || empty === 1'b1) begin
        $display("Failure: FIFO wasn't full or empty went high after writing all values - full = %b, empty = %b", full, empty);
    end

    // Cycle the clock, the FIFO should still be full
    repeat (10) @(posedge clk);
    if (full !== 1'b1 || empty == 1'b1) begin
        $display("Failure: Cycling the clock while the FIFO is full shouldn't change its state - full = %b, empty = %b", full, empty);
    end

    // Try stuffing the FIFO with more data while it's full (overflow protection check)
    repeat (20) begin
        write_to_fifo(0, 1'b1);
        // Check that the FIFO is still full, has the max num of entries, and isn't empty
        if (full !== 1'b1 || empty == 1'b1) begin
            $display("Failure: Overflowing the FIFO changed its state - full = %b, empty = %b", full, empty);
        end
    end

    repeat (5) @(posedge clk);
    
    //-----------------------------------------------------------------------------
    // Read test:
    // Read from the FIFO one by one with a 1 cycle delay in between reads
    for (i = 0; i < `FIFO_DEPTH - 1; i = i + 1) begin
        read_from_fifo(1'b0, received_values[i]);

        // Perform checks on empty, full
        if (empty === 1'b1) begin
            $display("Failure: FIFO was empty as its being read");
        end
        if (full === 1'b1) begin
            $display("Failure: FIFO was full as its being read");
        end
        
        // Insert single-cycle delay between each read
        // For burst mode, there is no delay
        if (!`BURST_MODE) @(posedge clk);
    end

    // Perform the final read
    read_from_fifo(1'b0, received_values[`FIFO_DEPTH-1]);
    // Check that the FIFO is now empty
    if (full !== 1'b0 || empty !== 1'b1) begin
        $display("Failure: FIFO wasn't empty or full is high after the FIFO has been read -  full = %b, empty = %b", full, empty);
    end

    // Cycle the clock and perform the same checks
    repeat (10) @(posedge clk);
    if (full !== 1'b0 || empty !== 1'b1) begin
        $display("Failure: FIFO should be empty after it has been read - full = %b, empty = %b", full, empty);
    end

    // Compare data received from the FIFO
    for (i = 0; i < `FIFO_DEPTH; i = i + 1) begin
        if (test_values[i] !== received_values[i]) begin
            $display("Failure: Data received from FIFO not equal to data written. Entry %d, got %d, expected %d", i, received_values[i], test_values[i]);
        end
    end

    // Now attempt a read underflow
    repeat (10) read_from_fifo(1'b1, received_values[0]);
    // Nothing should change, perform the same checks on full and empty
    if (full !== 1'b0 || empty !== 1'b1) begin
        $display("Failure: Empty FIFO wasn't empty or full went high when trying to read -  full = %b, empty = %b", full, empty);
    end
    
    //-----------------------------------------------------------------------------
    // Test 2: Try reading and writing on the same cycle
    // Generate new random data to write to the FIFO
    for (i = 0; i < `FIFO_DEPTH; i = i + 1) begin
        test_values[i] <= $random;
    end
    // Clear received values:
    for (i = 0; i < `FIFO_DEPTH ; i = i + 1)
        received_values[i] <= 'h0;
    
    @(posedge clk);
    // Write initial data:
    write_to_fifo(test_values[0], 1'b0);
    //write_to_fifo(test_values[1], 1'b0);
    
    // Test concurrent read and write
    fork
        // Thread 1 - write
        begin
            for (i = 1; i < `FIFO_DEPTH; i = i + 1) begin
                write_to_fifo(test_values[i], 1'b0);
            end                
        end
        // Thread 2 - read 
        begin
            for (ii = 0; ii < `FIFO_DEPTH; ii = ii + 1) begin
                read_from_fifo(1'b0, received_values[ii]);
            end
        end    
    join
    
    // Check that the FIFO is now empty
    if (full !== 1'b0 || empty !== 1'b1) begin
        $display("Failure: FIFO wasn't empty or full is high after the FIFO has been read -  full = %b, empty = %b", full, empty);
    end

    // Cycle the clock and perform the same checks
    repeat (10) @(posedge clk);
    if (full !== 1'b0 || empty !== 1'b1) begin
        $display("Failure: FIFO should be empty after it has been read - full = %b, empty = %b", full, empty);
    end
    
    // Compare data received from the FIFO
    for (i = 0; i < `FIFO_DEPTH; i = i + 1) begin
        if (test_values[i] !== received_values[i]) begin
            $display("Failure: Data received from FIFO not equal to data written. Entry %0d, got %d, expected %d", i, received_values[i], test_values[i]);
        end
    end

    //-----------------------------------------------------------------------------
    // Test done
    $display("\nTestbench was run with these parameters:");
    $display("CLK_PERIOD = %0d, DATA_WIDTH = %0d, FIFO_DEPTH = %0d", `CLK_PERIOD, `DATA_WIDTH, `FIFO_DEPTH);
    $display("Test Finished\n");
    $finish();
end

endmodule
