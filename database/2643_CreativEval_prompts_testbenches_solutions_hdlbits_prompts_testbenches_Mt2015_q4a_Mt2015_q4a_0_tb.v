// This program was cloned from: https://github.com/matthewdelorenzo/CreativEval
// License: BSD 3-Clause "New" or "Revised" License

`timescale 1 ns/10 ps  // time-unit = 1 ns, precision = 10 ps

module top_module_tb;

    // duration for each bit = 20 * timescale = 20 * 1 ns  = 20ns
    localparam period = 20;

    reg x;
    reg y;

    wire z;


    integer mismatch_count;

    top_module UUT (.x(x), .y(y), .z(z));

    initial begin
        mismatch_count = 0;

        // Tick 0: Inputs = 1'b0, 1'b0, Generated = z, Reference = 1'b0
        x = 1'b0; y = 1'b0; // Set input values
        #period;
        if (!(z === 1'b0)) begin
            $display("Mismatch at index 0: Inputs = [%b, %b], Generated = [%b], Reference = [%b]", 1'b0, 1'b0, z, 1'b0);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 0 passed!");
        end

        // Tick 1: Inputs = 1'b0, 1'b1, Generated = z, Reference = 1'b0
        x = 1'b0; y = 1'b1; // Set input values
        #period;
        if (!(z === 1'b0)) begin
            $display("Mismatch at index 1: Inputs = [%b, %b], Generated = [%b], Reference = [%b]", 1'b0, 1'b1, z, 1'b0);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 1 passed!");
        end

        // Tick 2: Inputs = 1'b0, 1'b1, Generated = z, Reference = 1'b0
        x = 1'b0; y = 1'b1; // Set input values
        #period;
        if (!(z === 1'b0)) begin
            $display("Mismatch at index 2: Inputs = [%b, %b], Generated = [%b], Reference = [%b]", 1'b0, 1'b1, z, 1'b0);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 2 passed!");
        end

        // Tick 3: Inputs = 1'b1, 1'b1, Generated = z, Reference = 1'b0
        x = 1'b1; y = 1'b1; // Set input values
        #period;
        if (!(z === 1'b0)) begin
            $display("Mismatch at index 3: Inputs = [%b, %b], Generated = [%b], Reference = [%b]", 1'b1, 1'b1, z, 1'b0);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 3 passed!");
        end

        // Tick 4: Inputs = 1'b0, 1'b1, Generated = z, Reference = 1'b0
        x = 1'b0; y = 1'b1; // Set input values
        #period;
        if (!(z === 1'b0)) begin
            $display("Mismatch at index 4: Inputs = [%b, %b], Generated = [%b], Reference = [%b]", 1'b0, 1'b1, z, 1'b0);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 4 passed!");
        end

        // Tick 5: Inputs = 1'b0, 1'b1, Generated = z, Reference = 1'b0
        x = 1'b0; y = 1'b1; // Set input values
        #period;
        if (!(z === 1'b0)) begin
            $display("Mismatch at index 5: Inputs = [%b, %b], Generated = [%b], Reference = [%b]", 1'b0, 1'b1, z, 1'b0);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 5 passed!");
        end

        // Tick 6: Inputs = 1'b0, 1'b1, Generated = z, Reference = 1'b0
        x = 1'b0; y = 1'b1; // Set input values
        #period;
        if (!(z === 1'b0)) begin
            $display("Mismatch at index 6: Inputs = [%b, %b], Generated = [%b], Reference = [%b]", 1'b0, 1'b1, z, 1'b0);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 6 passed!");
        end

        // Tick 7: Inputs = 1'b1, 1'b0, Generated = z, Reference = 1'b1
        x = 1'b1; y = 1'b0; // Set input values
        #period;
        if (!(z === 1'b1)) begin
            $display("Mismatch at index 7: Inputs = [%b, %b], Generated = [%b], Reference = [%b]", 1'b1, 1'b0, z, 1'b1);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 7 passed!");
        end

        // Tick 8: Inputs = 1'b0, 1'b1, Generated = z, Reference = 1'b0
        x = 1'b0; y = 1'b1; // Set input values
        #period;
        if (!(z === 1'b0)) begin
            $display("Mismatch at index 8: Inputs = [%b, %b], Generated = [%b], Reference = [%b]", 1'b0, 1'b1, z, 1'b0);
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