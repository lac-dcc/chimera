// This program was cloned from: https://github.com/matthewdelorenzo/CreativEval
// License: BSD 3-Clause "New" or "Revised" License

`timescale 1 ns/10 ps  // time-unit = 1 ns, precision = 10 ps

module top_module_tb;

    // duration for each bit = 20 * timescale = 20 * 1 ns  = 20ns
    localparam period = 20;

    reg a;
    reg b;
    reg c;
    reg d;
    reg e;

    wire [24:0] out;


    integer mismatch_count;

    top_module UUT (.a(a), .b(b), .c(c), .d(d), .e(e), .out(out));

    initial begin
        mismatch_count = 0;

        // Tick 0: Inputs = 1'b0, 1'b0, 1'b1, 1'b0, 1'b0, Generated = out, Reference = 25'b1101111011001001101111011
        a = 1'b0; b = 1'b0; c = 1'b1; d = 1'b0; e = 1'b0; // Set input values
        #period;
        if (!(out === 25'b1101111011001001101111011)) begin
            $display("Mismatch at index 0: Inputs = [%b, %b, %b, %b, %b], Generated = [%b], Reference = [%b]", 1'b0, 1'b0, 1'b1, 1'b0, 1'b0, out, 25'b1101111011001001101111011);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 0 passed!");
        end

        // Tick 1: Inputs = 1'b0, 1'b0, 1'b0, 1'b0, 1'b1, Generated = out, Reference = 25'b1111011110111101111000001
        a = 1'b0; b = 1'b0; c = 1'b0; d = 1'b0; e = 1'b1; // Set input values
        #period;
        if (!(out === 25'b1111011110111101111000001)) begin
            $display("Mismatch at index 1: Inputs = [%b, %b, %b, %b, %b], Generated = [%b], Reference = [%b]", 1'b0, 1'b0, 1'b0, 1'b0, 1'b1, out, 25'b1111011110111101111000001);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 1 passed!");
        end

        // Tick 2: Inputs = 1'b0, 1'b1, 1'b0, 1'b0, 1'b1, Generated = out, Reference = 25'b1011001001101101011001001
        a = 1'b0; b = 1'b1; c = 1'b0; d = 1'b0; e = 1'b1; // Set input values
        #period;
        if (!(out === 25'b1011001001101101011001001)) begin
            $display("Mismatch at index 2: Inputs = [%b, %b, %b, %b, %b], Generated = [%b], Reference = [%b]", 1'b0, 1'b1, 1'b0, 1'b0, 1'b1, out, 25'b1011001001101101011001001);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 2 passed!");
        end

        // Tick 3: Inputs = 1'b0, 1'b0, 1'b0, 1'b1, 1'b1, Generated = out, Reference = 25'b1110011100111000001100011
        a = 1'b0; b = 1'b0; c = 1'b0; d = 1'b1; e = 1'b1; // Set input values
        #period;
        if (!(out === 25'b1110011100111000001100011)) begin
            $display("Mismatch at index 3: Inputs = [%b, %b, %b, %b, %b], Generated = [%b], Reference = [%b]", 1'b0, 1'b0, 1'b0, 1'b1, 1'b1, out, 25'b1110011100111000001100011);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 3 passed!");
        end

        // Tick 4: Inputs = 1'b0, 1'b1, 1'b1, 1'b0, 1'b1, Generated = out, Reference = 25'b1001001101011011001001101
        a = 1'b0; b = 1'b1; c = 1'b1; d = 1'b0; e = 1'b1; // Set input values
        #period;
        if (!(out === 25'b1001001101011011001001101)) begin
            $display("Mismatch at index 4: Inputs = [%b, %b, %b, %b, %b], Generated = [%b], Reference = [%b]", 1'b0, 1'b1, 1'b1, 1'b0, 1'b1, out, 25'b1001001101011011001001101);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 4 passed!");
        end

        // Tick 5: Inputs = 1'b0, 1'b1, 1'b1, 1'b0, 1'b1, Generated = out, Reference = 25'b1001001101011011001001101
        a = 1'b0; b = 1'b1; c = 1'b1; d = 1'b0; e = 1'b1; // Set input values
        #period;
        if (!(out === 25'b1001001101011011001001101)) begin
            $display("Mismatch at index 5: Inputs = [%b, %b, %b, %b, %b], Generated = [%b], Reference = [%b]", 1'b0, 1'b1, 1'b1, 1'b0, 1'b1, out, 25'b1001001101011011001001101);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 5 passed!");
        end

        // Tick 6: Inputs = 1'b0, 1'b0, 1'b1, 1'b0, 1'b1, Generated = out, Reference = 25'b1101011010001011101000101
        a = 1'b0; b = 1'b0; c = 1'b1; d = 1'b0; e = 1'b1; // Set input values
        #period;
        if (!(out === 25'b1101011010001011101000101)) begin
            $display("Mismatch at index 6: Inputs = [%b, %b, %b, %b, %b], Generated = [%b], Reference = [%b]", 1'b0, 1'b0, 1'b1, 1'b0, 1'b1, out, 25'b1101011010001011101000101);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 6 passed!");
        end

        // Tick 7: Inputs = 1'b1, 1'b0, 1'b0, 1'b1, 1'b0, Generated = out, Reference = 25'b1001001101011011001001101
        a = 1'b1; b = 1'b0; c = 1'b0; d = 1'b1; e = 1'b0; // Set input values
        #period;
        if (!(out === 25'b1001001101011011001001101)) begin
            $display("Mismatch at index 7: Inputs = [%b, %b, %b, %b, %b], Generated = [%b], Reference = [%b]", 1'b1, 1'b0, 1'b0, 1'b1, 1'b0, out, 25'b1001001101011011001001101);
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