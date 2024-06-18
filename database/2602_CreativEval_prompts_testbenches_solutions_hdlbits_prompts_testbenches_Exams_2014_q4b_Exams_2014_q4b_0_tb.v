// This program was cloned from: https://github.com/matthewdelorenzo/CreativEval
// License: BSD 3-Clause "New" or "Revised" License

`timescale 1 ns/10 ps  // time-unit = 1 ns, precision = 10 ps

module top_module_tb;

    // duration for each bit = 20 * timescale = 20 * 1 ns  = 20ns
    localparam period = 20;

    reg [3:0] SW;
    reg [3:0] KEY;

    wire [3:0] LEDR;


    integer mismatch_count;

    top_module UUT (.SW(SW), .KEY(KEY), .LEDR(LEDR));

    initial begin
        mismatch_count = 0;

        // Tick 0: Inputs = 4'b0100, 4'b1000, Generated = LEDR, Reference = 4'b000x
        SW = 4'b0100; KEY = 4'b1000; // Set input values
        #period;
        // Tick 1: Inputs = 4'b0000, 4'b0011, Generated = LEDR, Reference = 4'b000x
        SW = 4'b0000; KEY = 4'b0011; // Set input values
        #period;
        // Tick 2: Inputs = 4'b0001, 4'b0010, Generated = LEDR, Reference = 4'b000x
        SW = 4'b0001; KEY = 4'b0010; // Set input values
        #period;
        // Tick 3: Inputs = 4'b1100, 4'b0111, Generated = LEDR, Reference = 4'b000X
        SW = 4'b1100; KEY = 4'b0111; // Set input values
        #period;
        if (!(LEDR === 4'b000X)) begin
            $display("Mismatch at index 3: Inputs = [%b, %b], Generated = [%b], Reference = [%b]", 4'b1100, 4'b0111, LEDR, 4'b000X);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 3 passed!");
        end

        // Tick 4: Inputs = 4'b0001, 4'b1010, Generated = LEDR, Reference = 4'b000X
        SW = 4'b0001; KEY = 4'b1010; // Set input values
        #period;
        if (!(LEDR === 4'b000X)) begin
            $display("Mismatch at index 4: Inputs = [%b, %b], Generated = [%b], Reference = [%b]", 4'b0001, 4'b1010, LEDR, 4'b000X);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 4 passed!");
        end

        // Tick 5: Inputs = 4'b0001, 4'b1011, Generated = LEDR, Reference = 4'b000X
        SW = 4'b0001; KEY = 4'b1011; // Set input values
        #period;
        if (!(LEDR === 4'b000X)) begin
            $display("Mismatch at index 5: Inputs = [%b, %b], Generated = [%b], Reference = [%b]", 4'b0001, 4'b1011, LEDR, 4'b000X);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 5 passed!");
        end

        // Tick 6: Inputs = 4'b1100, 4'b1010, Generated = LEDR, Reference = 4'b000X
        SW = 4'b1100; KEY = 4'b1010; // Set input values
        #period;
        if (!(LEDR === 4'b000X)) begin
            $display("Mismatch at index 6: Inputs = [%b, %b], Generated = [%b], Reference = [%b]", 4'b1100, 4'b1010, LEDR, 4'b000X);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 6 passed!");
        end

        // Tick 7: Inputs = 4'b0010, 4'b0101, Generated = LEDR, Reference = 4'b000X
        SW = 4'b0010; KEY = 4'b0101; // Set input values
        #period;
        if (!(LEDR === 4'b000X)) begin
            $display("Mismatch at index 7: Inputs = [%b, %b], Generated = [%b], Reference = [%b]", 4'b0010, 4'b0101, LEDR, 4'b000X);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 7 passed!");
        end

        // Tick 8: Inputs = 4'b0000, 4'b0010, Generated = LEDR, Reference = 4'b000X
        SW = 4'b0000; KEY = 4'b0010; // Set input values
        #period;
        if (!(LEDR === 4'b000X)) begin
            $display("Mismatch at index 8: Inputs = [%b, %b], Generated = [%b], Reference = [%b]", 4'b0000, 4'b0010, LEDR, 4'b000X);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 8 passed!");
        end

        // Tick 9: Inputs = 4'b0001, 4'b1011, Generated = LEDR, Reference = 4'b0110
        SW = 4'b0001; KEY = 4'b1011; // Set input values
        #period;
        if (!(LEDR === 4'b0110)) begin
            $display("Mismatch at index 9: Inputs = [%b, %b], Generated = [%b], Reference = [%b]", 4'b0001, 4'b1011, LEDR, 4'b0110);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 9 passed!");
        end

        // Tick 10: Inputs = 4'b1110, 4'b1100, Generated = LEDR, Reference = 4'b0110
        SW = 4'b1110; KEY = 4'b1100; // Set input values
        #period;
        if (!(LEDR === 4'b0110)) begin
            $display("Mismatch at index 10: Inputs = [%b, %b], Generated = [%b], Reference = [%b]", 4'b1110, 4'b1100, LEDR, 4'b0110);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 10 passed!");
        end

        // Tick 11: Inputs = 4'b0111, 4'b1011, Generated = LEDR, Reference = 4'b1110
        SW = 4'b0111; KEY = 4'b1011; // Set input values
        #period;
        if (!(LEDR === 4'b1110)) begin
            $display("Mismatch at index 11: Inputs = [%b, %b], Generated = [%b], Reference = [%b]", 4'b0111, 4'b1011, LEDR, 4'b1110);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 11 passed!");
        end

        // Tick 12: Inputs = 4'b1101, 4'b1010, Generated = LEDR, Reference = 4'b1110
        SW = 4'b1101; KEY = 4'b1010; // Set input values
        #period;
        if (!(LEDR === 4'b1110)) begin
            $display("Mismatch at index 12: Inputs = [%b, %b], Generated = [%b], Reference = [%b]", 4'b1101, 4'b1010, LEDR, 4'b1110);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 12 passed!");
        end

        if (mismatch_count == 0)
            $display("All tests passed!");
        else
            $display("%0d mismatches out of %0d total tests.", mismatch_count, 13);
        $finish;
    end

endmodule