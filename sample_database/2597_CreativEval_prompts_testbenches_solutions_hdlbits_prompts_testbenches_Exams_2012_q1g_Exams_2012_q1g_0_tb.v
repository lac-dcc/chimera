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

        // Tick 1: Inputs = 4'b0001, Generated = f, Reference = 1'b1
        x = 4'b0001; // Set input values
        #period;
        if (!(f === 1'b1)) begin
            $display("Mismatch at index 1: Inputs = [%b], Generated = [%b], Reference = [%b]", 4'b0001, f, 1'b1);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 1 passed!");
        end

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

        // Tick 3: Inputs = 4'b0011, Generated = f, Reference = 1'b0
        x = 4'b0011; // Set input values
        #period;
        if (!(f === 1'b0)) begin
            $display("Mismatch at index 3: Inputs = [%b], Generated = [%b], Reference = [%b]", 4'b0011, f, 1'b0);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 3 passed!");
        end

        // Tick 4: Inputs = 4'b1101, Generated = f, Reference = 1'b0
        x = 4'b1101; // Set input values
        #period;
        if (!(f === 1'b0)) begin
            $display("Mismatch at index 4: Inputs = [%b], Generated = [%b], Reference = [%b]", 4'b1101, f, 1'b0);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 4 passed!");
        end

        // Tick 5: Inputs = 4'b1101, Generated = f, Reference = 1'b0
        x = 4'b1101; // Set input values
        #period;
        if (!(f === 1'b0)) begin
            $display("Mismatch at index 5: Inputs = [%b], Generated = [%b], Reference = [%b]", 4'b1101, f, 1'b0);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 5 passed!");
        end

        // Tick 6: Inputs = 4'b0101, Generated = f, Reference = 1'b1
        x = 4'b0101; // Set input values
        #period;
        if (!(f === 1'b1)) begin
            $display("Mismatch at index 6: Inputs = [%b], Generated = [%b], Reference = [%b]", 4'b0101, f, 1'b1);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 6 passed!");
        end

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

        // Tick 8: Inputs = 4'b0001, Generated = f, Reference = 1'b1
        x = 4'b0001; // Set input values
        #period;
        if (!(f === 1'b1)) begin
            $display("Mismatch at index 8: Inputs = [%b], Generated = [%b], Reference = [%b]", 4'b0001, f, 1'b1);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 8 passed!");
        end

        if (mismatch_count == 0)
            $display("All tests passed!");
        else
            $display("%0d mismatches out of %0d total tests.", mismatch_count, 9);
        $finish;
    end

endmodule