// This program was cloned from: https://github.com/matthewdelorenzo/CreativEval
// License: BSD 3-Clause "New" or "Revised" License

`timescale 1 ns/10 ps  // time-unit = 1 ns, precision = 10 ps

module top_module_tb;

    // duration for each bit = 20 * timescale = 20 * 1 ns  = 20ns
    localparam period = 20;

    reg [3:0] x;

    wire f;


    integer mismatch_count;

    top_module UUT (.x(x), .f(f));

    initial begin
        mismatch_count = 0;

        // Tick 0: Inputs = 4'b0100, Generated = f, Reference = 1'b1
        x = 4'b0100; // Set input values
        #period;
        if (!(f === 1'b1)) begin
            $display("Mismatch at index 0: Inputs = [%b], Generated = [%b], Reference = [%b]", 4'b0100, f, 1'b1);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 0 passed!");
        end

        // Tick 1: Inputs = 4'b0001, Generated = f, Reference = 1'bx
        x = 4'b0001; // Set input values
        #period;
        // Tick 2: Inputs = 4'b1001, Generated = f, Reference = 1'b0
        x = 4'b1001; // Set input values
        #period;
        if (!(f === 1'b0)) begin
            $display("Mismatch at index 2: Inputs = [%b], Generated = [%b], Reference = [%b]", 4'b1001, f, 1'b0);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 2 passed!");
        end

        // Tick 3: Inputs = 4'b0011, Generated = f, Reference = 1'bx
        x = 4'b0011; // Set input values
        #period;
        // Tick 4: Inputs = 4'b1101, Generated = f, Reference = 1'bx
        x = 4'b1101; // Set input values
        #period;
        // Tick 5: Inputs = 4'b1101, Generated = f, Reference = 1'bx
        x = 4'b1101; // Set input values
        #period;
        // Tick 6: Inputs = 4'b0101, Generated = f, Reference = 1'bx
        x = 4'b0101; // Set input values
        #period;
        // Tick 7: Inputs = 4'b0010, Generated = f, Reference = 1'b0
        x = 4'b0010; // Set input values
        #period;
        if (!(f === 1'b0)) begin
            $display("Mismatch at index 7: Inputs = [%b], Generated = [%b], Reference = [%b]", 4'b0010, f, 1'b0);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 7 passed!");
        end

        // Tick 8: Inputs = 4'b0001, Generated = f, Reference = 1'bx
        x = 4'b0001; // Set input values
        #period;
        // Tick 9: Inputs = 4'b1101, Generated = f, Reference = 1'bx
        x = 4'b1101; // Set input values
        #period;
        // Tick 10: Inputs = 4'b0110, Generated = f, Reference = 1'b1
        x = 4'b0110; // Set input values
        #period;
        if (!(f === 1'b1)) begin
            $display("Mismatch at index 10: Inputs = [%b], Generated = [%b], Reference = [%b]", 4'b0110, f, 1'b1);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 10 passed!");
        end

        // Tick 11: Inputs = 4'b1101, Generated = f, Reference = 1'bx
        x = 4'b1101; // Set input values
        #period;
        // Tick 12: Inputs = 4'b1101, Generated = f, Reference = 1'bx
        x = 4'b1101; // Set input values
        #period;
        // Tick 13: Inputs = 4'b1100, Generated = f, Reference = 1'b1
        x = 4'b1100; // Set input values
        #period;
        if (!(f === 1'b1)) begin
            $display("Mismatch at index 13: Inputs = [%b], Generated = [%b], Reference = [%b]", 4'b1100, f, 1'b1);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 13 passed!");
        end

        // Tick 14: Inputs = 4'b1001, Generated = f, Reference = 1'b0
        x = 4'b1001; // Set input values
        #period;
        if (!(f === 1'b0)) begin
            $display("Mismatch at index 14: Inputs = [%b], Generated = [%b], Reference = [%b]", 4'b1001, f, 1'b0);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 14 passed!");
        end

        // Tick 15: Inputs = 4'b0110, Generated = f, Reference = 1'b1
        x = 4'b0110; // Set input values
        #period;
        if (!(f === 1'b1)) begin
            $display("Mismatch at index 15: Inputs = [%b], Generated = [%b], Reference = [%b]", 4'b0110, f, 1'b1);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 15 passed!");
        end

        // Tick 16: Inputs = 4'b0101, Generated = f, Reference = 1'bx
        x = 4'b0101; // Set input values
        #period;
        // Tick 17: Inputs = 4'b1010, Generated = f, Reference = 1'bx
        x = 4'b1010; // Set input values
        #period;
        // Tick 18: Inputs = 4'b0101, Generated = f, Reference = 1'bx
        x = 4'b0101; // Set input values
        #period;
        // Tick 19: Inputs = 4'b0111, Generated = f, Reference = 1'b0
        x = 4'b0111; // Set input values
        #period;
        if (!(f === 1'b0)) begin
            $display("Mismatch at index 19: Inputs = [%b], Generated = [%b], Reference = [%b]", 4'b0111, f, 1'b0);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 19 passed!");
        end

        // Tick 20: Inputs = 4'b0010, Generated = f, Reference = 1'b0
        x = 4'b0010; // Set input values
        #period;
        if (!(f === 1'b0)) begin
            $display("Mismatch at index 20: Inputs = [%b], Generated = [%b], Reference = [%b]", 4'b0010, f, 1'b0);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 20 passed!");
        end

        // Tick 21: Inputs = 4'b1111, Generated = f, Reference = 1'bx
        x = 4'b1111; // Set input values
        #period;
        // Tick 22: Inputs = 4'b0010, Generated = f, Reference = 1'b0
        x = 4'b0010; // Set input values
        #period;
        if (!(f === 1'b0)) begin
            $display("Mismatch at index 22: Inputs = [%b], Generated = [%b], Reference = [%b]", 4'b0010, f, 1'b0);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 22 passed!");
        end

        // Tick 23: Inputs = 4'b1110, Generated = f, Reference = 1'b1
        x = 4'b1110; // Set input values
        #period;
        if (!(f === 1'b1)) begin
            $display("Mismatch at index 23: Inputs = [%b], Generated = [%b], Reference = [%b]", 4'b1110, f, 1'b1);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 23 passed!");
        end

        // Tick 24: Inputs = 4'b1000, Generated = f, Reference = 1'b0
        x = 4'b1000; // Set input values
        #period;
        if (!(f === 1'b0)) begin
            $display("Mismatch at index 24: Inputs = [%b], Generated = [%b], Reference = [%b]", 4'b1000, f, 1'b0);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 24 passed!");
        end

        // Tick 25: Inputs = 4'b0101, Generated = f, Reference = 1'bx
        x = 4'b0101; // Set input values
        #period;
        // Tick 26: Inputs = 4'b1100, Generated = f, Reference = 1'b1
        x = 4'b1100; // Set input values
        #period;
        if (!(f === 1'b1)) begin
            $display("Mismatch at index 26: Inputs = [%b], Generated = [%b], Reference = [%b]", 4'b1100, f, 1'b1);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 26 passed!");
        end

        // Tick 27: Inputs = 4'b1101, Generated = f, Reference = 1'bx
        x = 4'b1101; // Set input values
        #period;
        // Tick 28: Inputs = 4'b1101, Generated = f, Reference = 1'bx
        x = 4'b1101; // Set input values
        #period;
        // Tick 29: Inputs = 4'b0101, Generated = f, Reference = 1'bx
        x = 4'b0101; // Set input values
        #period;
        // Tick 30: Inputs = 4'b0011, Generated = f, Reference = 1'bx
        x = 4'b0011; // Set input values
        #period;
        if (mismatch_count == 0)
            $display("All tests passed!");
        else
            $display("%0d mismatches out of %0d total tests.", mismatch_count, 31);
        $finish;
    end

endmodule