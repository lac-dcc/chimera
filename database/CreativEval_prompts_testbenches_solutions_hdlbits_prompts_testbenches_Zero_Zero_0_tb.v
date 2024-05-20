// This program was cloned from: https://github.com/matthewdelorenzo/CreativEval
// License: BSD 3-Clause "New" or "Revised" License

`timescale 1 ns/10 ps  // time-unit = 1 ns, precision = 10 ps

module top_module_tb;

    // duration for each bit = 20 * timescale = 20 * 1 ns  = 20ns
    localparam period = 20;


    wire zero;


    integer mismatch_count;

    top_module UUT (.zero(zero));

    initial begin
        mismatch_count = 0;

        // Tick 0: Inputs = , Generated = zero, Reference = 1'b0
        // No input assignments for this tick
        #period;
        if (!(zero === 1'b0)) begin
            $display("Mismatch at index 0: Inputs = [], Generated = [%b], Reference = [%b]", zero, 1'b0);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 0 passed!");
        end

        // Tick 1: Inputs = , Generated = zero, Reference = 1'b0
        // No input assignments for this tick
        #period;
        if (!(zero === 1'b0)) begin
            $display("Mismatch at index 1: Inputs = [], Generated = [%b], Reference = [%b]", zero, 1'b0);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 1 passed!");
        end

        // Tick 2: Inputs = , Generated = zero, Reference = 1'b0
        // No input assignments for this tick
        #period;
        if (!(zero === 1'b0)) begin
            $display("Mismatch at index 2: Inputs = [], Generated = [%b], Reference = [%b]", zero, 1'b0);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 2 passed!");
        end

        // Tick 3: Inputs = , Generated = zero, Reference = 1'b0
        // No input assignments for this tick
        #period;
        if (!(zero === 1'b0)) begin
            $display("Mismatch at index 3: Inputs = [], Generated = [%b], Reference = [%b]", zero, 1'b0);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 3 passed!");
        end

        // Tick 4: Inputs = , Generated = zero, Reference = 1'b0
        // No input assignments for this tick
        #period;
        if (!(zero === 1'b0)) begin
            $display("Mismatch at index 4: Inputs = [], Generated = [%b], Reference = [%b]", zero, 1'b0);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 4 passed!");
        end

        // Tick 5: Inputs = , Generated = zero, Reference = 1'b0
        // No input assignments for this tick
        #period;
        if (!(zero === 1'b0)) begin
            $display("Mismatch at index 5: Inputs = [], Generated = [%b], Reference = [%b]", zero, 1'b0);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 5 passed!");
        end

        // Tick 6: Inputs = , Generated = zero, Reference = 1'b0
        // No input assignments for this tick
        #period;
        if (!(zero === 1'b0)) begin
            $display("Mismatch at index 6: Inputs = [], Generated = [%b], Reference = [%b]", zero, 1'b0);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 6 passed!");
        end

        // Tick 7: Inputs = , Generated = zero, Reference = 1'b0
        // No input assignments for this tick
        #period;
        if (!(zero === 1'b0)) begin
            $display("Mismatch at index 7: Inputs = [], Generated = [%b], Reference = [%b]", zero, 1'b0);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 7 passed!");
        end

        // Tick 8: Inputs = , Generated = zero, Reference = 1'b0
        // No input assignments for this tick
        #period;
        if (!(zero === 1'b0)) begin
            $display("Mismatch at index 8: Inputs = [], Generated = [%b], Reference = [%b]", zero, 1'b0);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 8 passed!");
        end

        // Tick 9: Inputs = , Generated = zero, Reference = 1'b0
        // No input assignments for this tick
        #period;
        if (!(zero === 1'b0)) begin
            $display("Mismatch at index 9: Inputs = [], Generated = [%b], Reference = [%b]", zero, 1'b0);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 9 passed!");
        end

        // Tick 10: Inputs = , Generated = zero, Reference = 1'b0
        // No input assignments for this tick
        #period;
        if (!(zero === 1'b0)) begin
            $display("Mismatch at index 10: Inputs = [], Generated = [%b], Reference = [%b]", zero, 1'b0);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 10 passed!");
        end

        // Tick 11: Inputs = , Generated = zero, Reference = 1'b0
        // No input assignments for this tick
        #period;
        if (!(zero === 1'b0)) begin
            $display("Mismatch at index 11: Inputs = [], Generated = [%b], Reference = [%b]", zero, 1'b0);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 11 passed!");
        end

        // Tick 12: Inputs = , Generated = zero, Reference = 1'b0
        // No input assignments for this tick
        #period;
        if (!(zero === 1'b0)) begin
            $display("Mismatch at index 12: Inputs = [], Generated = [%b], Reference = [%b]", zero, 1'b0);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 12 passed!");
        end

        // Tick 13: Inputs = , Generated = zero, Reference = 1'b0
        // No input assignments for this tick
        #period;
        if (!(zero === 1'b0)) begin
            $display("Mismatch at index 13: Inputs = [], Generated = [%b], Reference = [%b]", zero, 1'b0);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 13 passed!");
        end

        // Tick 14: Inputs = , Generated = zero, Reference = 1'b0
        // No input assignments for this tick
        #period;
        if (!(zero === 1'b0)) begin
            $display("Mismatch at index 14: Inputs = [], Generated = [%b], Reference = [%b]", zero, 1'b0);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 14 passed!");
        end

        // Tick 15: Inputs = , Generated = zero, Reference = 1'b0
        // No input assignments for this tick
        #period;
        if (!(zero === 1'b0)) begin
            $display("Mismatch at index 15: Inputs = [], Generated = [%b], Reference = [%b]", zero, 1'b0);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 15 passed!");
        end

        // Tick 16: Inputs = , Generated = zero, Reference = 1'b0
        // No input assignments for this tick
        #period;
        if (!(zero === 1'b0)) begin
            $display("Mismatch at index 16: Inputs = [], Generated = [%b], Reference = [%b]", zero, 1'b0);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 16 passed!");
        end

        // Tick 17: Inputs = , Generated = zero, Reference = 1'b0
        // No input assignments for this tick
        #period;
        if (!(zero === 1'b0)) begin
            $display("Mismatch at index 17: Inputs = [], Generated = [%b], Reference = [%b]", zero, 1'b0);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 17 passed!");
        end

        // Tick 18: Inputs = , Generated = zero, Reference = 1'b0
        // No input assignments for this tick
        #period;
        if (!(zero === 1'b0)) begin
            $display("Mismatch at index 18: Inputs = [], Generated = [%b], Reference = [%b]", zero, 1'b0);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 18 passed!");
        end

        if (mismatch_count == 0)
            $display("All tests passed!");
        else
            $display("%0d mismatches out of %0d total tests.", mismatch_count, 19);
        $finish;
    end

endmodule