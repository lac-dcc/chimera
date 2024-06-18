// This program was cloned from: https://github.com/matthewdelorenzo/CreativEval
// License: BSD 3-Clause "New" or "Revised" License

`timescale 1 ns/10 ps  // time-unit = 1 ns, precision = 10 ps

module top_module_tb;

    // duration for each bit = 20 * timescale = 20 * 1 ns  = 20ns
    localparam period = 20;

    reg clk;
    reg resetn;
    reg x;
    reg y;

    wire f;
    wire g;


    integer mismatch_count;

    top_module UUT (.clk(clk), .resetn(resetn), .x(x), .y(y), .f(f), .g(g));

    initial // clk generation
    begin
        clk = 0;
        forever begin
            #(period/2);
            clk = ~clk;
        end
    end

    initial begin
        mismatch_count = 0;

        // Tick 0: Inputs = 1'b0, 1'b0, 1'b0, 1'b0, Generated = f, g, Reference = 1'bx, 1'bx
        resetn = 1'b0; x = 1'b0; y = 1'b0; // Set input values
        #period;
        // Tick 1: Inputs = 1'b1, 1'b0, 1'b0, 1'b0, Generated = f, g, Reference = 1'b0, 1'b0
        resetn = 1'b0; x = 1'b0; y = 1'b0; // Set input values
        #period;
        if (!(f === 1'b0 && g === 1'b0)) begin
            $display("Mismatch at index 1: Inputs = [%b, %b, %b, %b], Generated = [%b, %b], Reference = [%b, %b]", 1'b1, 1'b0, 1'b0, 1'b0, f, g, 1'b0, 1'b0);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 1 passed!");
        end

        // Tick 2: Inputs = 1'b0, 1'b0, 1'b0, 1'b0, Generated = f, g, Reference = 1'b0, 1'b0
        resetn = 1'b0; x = 1'b0; y = 1'b0; // Set input values
        #period;
        if (!(f === 1'b0 && g === 1'b0)) begin
            $display("Mismatch at index 2: Inputs = [%b, %b, %b, %b], Generated = [%b, %b], Reference = [%b, %b]", 1'b0, 1'b0, 1'b0, 1'b0, f, g, 1'b0, 1'b0);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 2 passed!");
        end

        // Tick 3: Inputs = 1'b1, 1'b1, 1'b0, 1'b0, Generated = f, g, Reference = 1'b0, 1'b0
        resetn = 1'b1; x = 1'b0; y = 1'b0; // Set input values
        #period;
        if (!(f === 1'b0 && g === 1'b0)) begin
            $display("Mismatch at index 3: Inputs = [%b, %b, %b, %b], Generated = [%b, %b], Reference = [%b, %b]", 1'b1, 1'b1, 1'b0, 1'b0, f, g, 1'b0, 1'b0);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 3 passed!");
        end

        // Tick 4: Inputs = 1'b0, 1'b1, 1'b0, 1'b1, Generated = f, g, Reference = 1'b0, 1'b0
        resetn = 1'b1; x = 1'b0; y = 1'b1; // Set input values
        #period;
        if (!(f === 1'b0 && g === 1'b0)) begin
            $display("Mismatch at index 4: Inputs = [%b, %b, %b, %b], Generated = [%b, %b], Reference = [%b, %b]", 1'b0, 1'b1, 1'b0, 1'b1, f, g, 1'b0, 1'b0);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 4 passed!");
        end

        // Tick 5: Inputs = 1'b1, 1'b1, 1'b1, 1'b1, Generated = f, g, Reference = 1'b1, 1'b0
        resetn = 1'b1; x = 1'b1; y = 1'b1; // Set input values
        #period;
        if (!(f === 1'b1 && g === 1'b0)) begin
            $display("Mismatch at index 5: Inputs = [%b, %b, %b, %b], Generated = [%b, %b], Reference = [%b, %b]", 1'b1, 1'b1, 1'b1, 1'b1, f, g, 1'b1, 1'b0);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 5 passed!");
        end

        // Tick 6: Inputs = 1'b0, 1'b1, 1'b0, 1'b1, Generated = f, g, Reference = 1'b1, 1'b0
        resetn = 1'b1; x = 1'b0; y = 1'b1; // Set input values
        #period;
        if (!(f === 1'b1 && g === 1'b0)) begin
            $display("Mismatch at index 6: Inputs = [%b, %b, %b, %b], Generated = [%b, %b], Reference = [%b, %b]", 1'b0, 1'b1, 1'b0, 1'b1, f, g, 1'b1, 1'b0);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 6 passed!");
        end

        // Tick 7: Inputs = 1'b1, 1'b1, 1'b1, 1'b0, Generated = f, g, Reference = 1'b0, 1'b0
        resetn = 1'b1; x = 1'b1; y = 1'b0; // Set input values
        #period;
        if (!(f === 1'b0 && g === 1'b0)) begin
            $display("Mismatch at index 7: Inputs = [%b, %b, %b, %b], Generated = [%b, %b], Reference = [%b, %b]", 1'b1, 1'b1, 1'b1, 1'b0, f, g, 1'b0, 1'b0);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 7 passed!");
        end

        // Tick 8: Inputs = 1'b0, 1'b1, 1'b0, 1'b1, Generated = f, g, Reference = 1'b0, 1'b0
        resetn = 1'b1; x = 1'b0; y = 1'b1; // Set input values
        #period;
        if (!(f === 1'b0 && g === 1'b0)) begin
            $display("Mismatch at index 8: Inputs = [%b, %b, %b, %b], Generated = [%b, %b], Reference = [%b, %b]", 1'b0, 1'b1, 1'b0, 1'b1, f, g, 1'b0, 1'b0);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 8 passed!");
        end

        // Tick 9: Inputs = 1'b1, 1'b1, 1'b0, 1'b1, Generated = f, g, Reference = 1'b0, 1'b0
        resetn = 1'b1; x = 1'b0; y = 1'b1; // Set input values
        #period;
        if (!(f === 1'b0 && g === 1'b0)) begin
            $display("Mismatch at index 9: Inputs = [%b, %b, %b, %b], Generated = [%b, %b], Reference = [%b, %b]", 1'b1, 1'b1, 1'b0, 1'b1, f, g, 1'b0, 1'b0);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 9 passed!");
        end

        // Tick 10: Inputs = 1'b0, 1'b1, 1'b0, 1'b0, Generated = f, g, Reference = 1'b0, 1'b0
        resetn = 1'b1; x = 1'b0; y = 1'b0; // Set input values
        #period;
        if (!(f === 1'b0 && g === 1'b0)) begin
            $display("Mismatch at index 10: Inputs = [%b, %b, %b, %b], Generated = [%b, %b], Reference = [%b, %b]", 1'b0, 1'b1, 1'b0, 1'b0, f, g, 1'b0, 1'b0);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 10 passed!");
        end

        // Tick 11: Inputs = 1'b1, 1'b1, 1'b1, 1'b0, Generated = f, g, Reference = 1'b0, 1'b0
        resetn = 1'b1; x = 1'b1; y = 1'b0; // Set input values
        #period;
        if (!(f === 1'b0 && g === 1'b0)) begin
            $display("Mismatch at index 11: Inputs = [%b, %b, %b, %b], Generated = [%b, %b], Reference = [%b, %b]", 1'b1, 1'b1, 1'b1, 1'b0, f, g, 1'b0, 1'b0);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 11 passed!");
        end

        // Tick 12: Inputs = 1'b0, 1'b1, 1'b1, 1'b0, Generated = f, g, Reference = 1'b0, 1'b0
        resetn = 1'b1; x = 1'b1; y = 1'b0; // Set input values
        #period;
        if (!(f === 1'b0 && g === 1'b0)) begin
            $display("Mismatch at index 12: Inputs = [%b, %b, %b, %b], Generated = [%b, %b], Reference = [%b, %b]", 1'b0, 1'b1, 1'b1, 1'b0, f, g, 1'b0, 1'b0);
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