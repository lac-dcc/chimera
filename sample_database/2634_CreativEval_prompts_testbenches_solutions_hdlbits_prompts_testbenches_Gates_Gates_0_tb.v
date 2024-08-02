// This program was cloned from: https://github.com/matthewdelorenzo/CreativEval
// License: BSD 3-Clause "New" or "Revised" License

`timescale 1 ns/10 ps  // time-unit = 1 ns, precision = 10 ps

module top_module_tb;

    // duration for each bit = 20 * timescale = 20 * 1 ns  = 20ns
    localparam period = 20;

    reg a;
    reg b;

    wire out_and;
    wire out_or;
    wire out_xor;
    wire out_nand;
    wire out_nor;
    wire out_xnor;
    wire out_anotb;


    integer mismatch_count;

    top_module UUT (.a(a), .b(b), .out_and(out_and), .out_or(out_or), .out_xor(out_xor), .out_nand(out_nand), .out_nor(out_nor), .out_xnor(out_xnor), .out_anotb(out_anotb));

    initial begin
        mismatch_count = 0;

        // Tick 0: Inputs = 1'b0, 1'b0, Generated = out_and, out_or, out_xor, out_nand, out_nor, out_xnor, out_anotb, Reference = 1'b0, 1'b0, 1'b0, 1'b1, 1'b1, 1'b1, 1'b0
        a = 1'b0; b = 1'b0; // Set input values
        #period;
        if (!(out_and === 1'b0 && out_or === 1'b0 && out_xor === 1'b0 && out_nand === 1'b1 && out_nor === 1'b1 && out_xnor === 1'b1 && out_anotb === 1'b0)) begin
            $display("Mismatch at index 0: Inputs = [%b, %b], Generated = [%b, %b, %b, %b, %b, %b, %b], Reference = [%b, %b, %b, %b, %b, %b, %b]", 1'b0, 1'b0, out_and, out_or, out_xor, out_nand, out_nor, out_xnor, out_anotb, 1'b0, 1'b0, 1'b0, 1'b1, 1'b1, 1'b1, 1'b0);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 0 passed!");
        end

        // Tick 1: Inputs = 1'b0, 1'b0, Generated = out_and, out_or, out_xor, out_nand, out_nor, out_xnor, out_anotb, Reference = 1'b0, 1'b0, 1'b0, 1'b1, 1'b1, 1'b1, 1'b0
        a = 1'b0; b = 1'b0; // Set input values
        #period;
        if (!(out_and === 1'b0 && out_or === 1'b0 && out_xor === 1'b0 && out_nand === 1'b1 && out_nor === 1'b1 && out_xnor === 1'b1 && out_anotb === 1'b0)) begin
            $display("Mismatch at index 1: Inputs = [%b, %b], Generated = [%b, %b, %b, %b, %b, %b, %b], Reference = [%b, %b, %b, %b, %b, %b, %b]", 1'b0, 1'b0, out_and, out_or, out_xor, out_nand, out_nor, out_xnor, out_anotb, 1'b0, 1'b0, 1'b0, 1'b1, 1'b1, 1'b1, 1'b0);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 1 passed!");
        end

        // Tick 2: Inputs = 1'b0, 1'b0, Generated = out_and, out_or, out_xor, out_nand, out_nor, out_xnor, out_anotb, Reference = 1'b0, 1'b0, 1'b0, 1'b1, 1'b1, 1'b1, 1'b0
        a = 1'b0; b = 1'b0; // Set input values
        #period;
        if (!(out_and === 1'b0 && out_or === 1'b0 && out_xor === 1'b0 && out_nand === 1'b1 && out_nor === 1'b1 && out_xnor === 1'b1 && out_anotb === 1'b0)) begin
            $display("Mismatch at index 2: Inputs = [%b, %b], Generated = [%b, %b, %b, %b, %b, %b, %b], Reference = [%b, %b, %b, %b, %b, %b, %b]", 1'b0, 1'b0, out_and, out_or, out_xor, out_nand, out_nor, out_xnor, out_anotb, 1'b0, 1'b0, 1'b0, 1'b1, 1'b1, 1'b1, 1'b0);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 2 passed!");
        end

        // Tick 3: Inputs = 1'b0, 1'b1, Generated = out_and, out_or, out_xor, out_nand, out_nor, out_xnor, out_anotb, Reference = 1'b0, 1'b1, 1'b1, 1'b1, 1'b0, 1'b0, 1'b0
        a = 1'b0; b = 1'b1; // Set input values
        #period;
        if (!(out_and === 1'b0 && out_or === 1'b1 && out_xor === 1'b1 && out_nand === 1'b1 && out_nor === 1'b0 && out_xnor === 1'b0 && out_anotb === 1'b0)) begin
            $display("Mismatch at index 3: Inputs = [%b, %b], Generated = [%b, %b, %b, %b, %b, %b, %b], Reference = [%b, %b, %b, %b, %b, %b, %b]", 1'b0, 1'b1, out_and, out_or, out_xor, out_nand, out_nor, out_xnor, out_anotb, 1'b0, 1'b1, 1'b1, 1'b1, 1'b0, 1'b0, 1'b0);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 3 passed!");
        end

        // Tick 4: Inputs = 1'b0, 1'b1, Generated = out_and, out_or, out_xor, out_nand, out_nor, out_xnor, out_anotb, Reference = 1'b0, 1'b1, 1'b1, 1'b1, 1'b0, 1'b0, 1'b0
        a = 1'b0; b = 1'b1; // Set input values
        #period;
        if (!(out_and === 1'b0 && out_or === 1'b1 && out_xor === 1'b1 && out_nand === 1'b1 && out_nor === 1'b0 && out_xnor === 1'b0 && out_anotb === 1'b0)) begin
            $display("Mismatch at index 4: Inputs = [%b, %b], Generated = [%b, %b, %b, %b, %b, %b, %b], Reference = [%b, %b, %b, %b, %b, %b, %b]", 1'b0, 1'b1, out_and, out_or, out_xor, out_nand, out_nor, out_xnor, out_anotb, 1'b0, 1'b1, 1'b1, 1'b1, 1'b0, 1'b0, 1'b0);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 4 passed!");
        end

        // Tick 5: Inputs = 1'b1, 1'b0, Generated = out_and, out_or, out_xor, out_nand, out_nor, out_xnor, out_anotb, Reference = 1'b0, 1'b1, 1'b1, 1'b1, 1'b0, 1'b0, 1'b1
        a = 1'b1; b = 1'b0; // Set input values
        #period;
        if (!(out_and === 1'b0 && out_or === 1'b1 && out_xor === 1'b1 && out_nand === 1'b1 && out_nor === 1'b0 && out_xnor === 1'b0 && out_anotb === 1'b1)) begin
            $display("Mismatch at index 5: Inputs = [%b, %b], Generated = [%b, %b, %b, %b, %b, %b, %b], Reference = [%b, %b, %b, %b, %b, %b, %b]", 1'b1, 1'b0, out_and, out_or, out_xor, out_nand, out_nor, out_xnor, out_anotb, 1'b0, 1'b1, 1'b1, 1'b1, 1'b0, 1'b0, 1'b1);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 5 passed!");
        end

        // Tick 6: Inputs = 1'b1, 1'b0, Generated = out_and, out_or, out_xor, out_nand, out_nor, out_xnor, out_anotb, Reference = 1'b0, 1'b1, 1'b1, 1'b1, 1'b0, 1'b0, 1'b1
        a = 1'b1; b = 1'b0; // Set input values
        #period;
        if (!(out_and === 1'b0 && out_or === 1'b1 && out_xor === 1'b1 && out_nand === 1'b1 && out_nor === 1'b0 && out_xnor === 1'b0 && out_anotb === 1'b1)) begin
            $display("Mismatch at index 6: Inputs = [%b, %b], Generated = [%b, %b, %b, %b, %b, %b, %b], Reference = [%b, %b, %b, %b, %b, %b, %b]", 1'b1, 1'b0, out_and, out_or, out_xor, out_nand, out_nor, out_xnor, out_anotb, 1'b0, 1'b1, 1'b1, 1'b1, 1'b0, 1'b0, 1'b1);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 6 passed!");
        end

        // Tick 7: Inputs = 1'b1, 1'b1, Generated = out_and, out_or, out_xor, out_nand, out_nor, out_xnor, out_anotb, Reference = 1'b1, 1'b1, 1'b0, 1'b0, 1'b0, 1'b1, 1'b0
        a = 1'b1; b = 1'b1; // Set input values
        #period;
        if (!(out_and === 1'b1 && out_or === 1'b1 && out_xor === 1'b0 && out_nand === 1'b0 && out_nor === 1'b0 && out_xnor === 1'b1 && out_anotb === 1'b0)) begin
            $display("Mismatch at index 7: Inputs = [%b, %b], Generated = [%b, %b, %b, %b, %b, %b, %b], Reference = [%b, %b, %b, %b, %b, %b, %b]", 1'b1, 1'b1, out_and, out_or, out_xor, out_nand, out_nor, out_xnor, out_anotb, 1'b1, 1'b1, 1'b0, 1'b0, 1'b0, 1'b1, 1'b0);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 7 passed!");
        end

        if (mismatch_count == 0)
            $display("All tests passed!");
        else
            $display("%0d mismatches out of %0d total tests.", mismatch_count, 8);
        $finish;
    end

endmodule