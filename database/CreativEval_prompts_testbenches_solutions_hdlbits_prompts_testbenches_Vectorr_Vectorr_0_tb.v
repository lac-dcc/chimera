// This program was cloned from: https://github.com/matthewdelorenzo/CreativEval
// License: BSD 3-Clause "New" or "Revised" License

`timescale 1 ns/10 ps  // time-unit = 1 ns, precision = 10 ps

module top_module_tb;

    // duration for each bit = 20 * timescale = 20 * 1 ns  = 20ns
    localparam period = 20;

    reg [7:0] in;

    wire [7:0] out;


    integer mismatch_count;

    top_module UUT (.in(in), .out(out));

    initial begin
        mismatch_count = 0;

        // Tick 0: Inputs = 8'b00000000, Generated = out, Reference = 8'b00000000
        in = 8'b00000000; // Set input values
        #period;
        if (!(out === 8'b00000000)) begin
            $display("Mismatch at index 0: Inputs = [%b], Generated = [%b], Reference = [%b]", 8'b00000000, out, 8'b00000000);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 0 passed!");
        end

        // Tick 1: Inputs = 8'b00000001, Generated = out, Reference = 8'b10000000
        in = 8'b00000001; // Set input values
        #period;
        if (!(out === 8'b10000000)) begin
            $display("Mismatch at index 1: Inputs = [%b], Generated = [%b], Reference = [%b]", 8'b00000001, out, 8'b10000000);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 1 passed!");
        end

        // Tick 2: Inputs = 8'b00000001, Generated = out, Reference = 8'b10000000
        in = 8'b00000001; // Set input values
        #period;
        if (!(out === 8'b10000000)) begin
            $display("Mismatch at index 2: Inputs = [%b], Generated = [%b], Reference = [%b]", 8'b00000001, out, 8'b10000000);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 2 passed!");
        end

        // Tick 3: Inputs = 8'b00000010, Generated = out, Reference = 8'b01000000
        in = 8'b00000010; // Set input values
        #period;
        if (!(out === 8'b01000000)) begin
            $display("Mismatch at index 3: Inputs = [%b], Generated = [%b], Reference = [%b]", 8'b00000010, out, 8'b01000000);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 3 passed!");
        end

        // Tick 4: Inputs = 8'b00000010, Generated = out, Reference = 8'b01000000
        in = 8'b00000010; // Set input values
        #period;
        if (!(out === 8'b01000000)) begin
            $display("Mismatch at index 4: Inputs = [%b], Generated = [%b], Reference = [%b]", 8'b00000010, out, 8'b01000000);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 4 passed!");
        end

        // Tick 5: Inputs = 8'b00000100, Generated = out, Reference = 8'b00100000
        in = 8'b00000100; // Set input values
        #period;
        if (!(out === 8'b00100000)) begin
            $display("Mismatch at index 5: Inputs = [%b], Generated = [%b], Reference = [%b]", 8'b00000100, out, 8'b00100000);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 5 passed!");
        end

        // Tick 6: Inputs = 8'b00000100, Generated = out, Reference = 8'b00100000
        in = 8'b00000100; // Set input values
        #period;
        if (!(out === 8'b00100000)) begin
            $display("Mismatch at index 6: Inputs = [%b], Generated = [%b], Reference = [%b]", 8'b00000100, out, 8'b00100000);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 6 passed!");
        end

        // Tick 7: Inputs = 8'b00001000, Generated = out, Reference = 8'b00010000
        in = 8'b00001000; // Set input values
        #period;
        if (!(out === 8'b00010000)) begin
            $display("Mismatch at index 7: Inputs = [%b], Generated = [%b], Reference = [%b]", 8'b00001000, out, 8'b00010000);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 7 passed!");
        end

        // Tick 8: Inputs = 8'b00001000, Generated = out, Reference = 8'b00010000
        in = 8'b00001000; // Set input values
        #period;
        if (!(out === 8'b00010000)) begin
            $display("Mismatch at index 8: Inputs = [%b], Generated = [%b], Reference = [%b]", 8'b00001000, out, 8'b00010000);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 8 passed!");
        end

        // Tick 9: Inputs = 8'b10000000, Generated = out, Reference = 8'b00000001
        in = 8'b10000000; // Set input values
        #period;
        if (!(out === 8'b00000001)) begin
            $display("Mismatch at index 9: Inputs = [%b], Generated = [%b], Reference = [%b]", 8'b10000000, out, 8'b00000001);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 9 passed!");
        end

        // Tick 10: Inputs = 8'b10000000, Generated = out, Reference = 8'b00000001
        in = 8'b10000000; // Set input values
        #period;
        if (!(out === 8'b00000001)) begin
            $display("Mismatch at index 10: Inputs = [%b], Generated = [%b], Reference = [%b]", 8'b10000000, out, 8'b00000001);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 10 passed!");
        end

        // Tick 11: Inputs = 8'b11000000, Generated = out, Reference = 8'b00000011
        in = 8'b11000000; // Set input values
        #period;
        if (!(out === 8'b00000011)) begin
            $display("Mismatch at index 11: Inputs = [%b], Generated = [%b], Reference = [%b]", 8'b11000000, out, 8'b00000011);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 11 passed!");
        end

        // Tick 12: Inputs = 8'b11000000, Generated = out, Reference = 8'b00000011
        in = 8'b11000000; // Set input values
        #period;
        if (!(out === 8'b00000011)) begin
            $display("Mismatch at index 12: Inputs = [%b], Generated = [%b], Reference = [%b]", 8'b11000000, out, 8'b00000011);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 12 passed!");
        end

        // Tick 13: Inputs = 8'b11100000, Generated = out, Reference = 8'b00000111
        in = 8'b11100000; // Set input values
        #period;
        if (!(out === 8'b00000111)) begin
            $display("Mismatch at index 13: Inputs = [%b], Generated = [%b], Reference = [%b]", 8'b11100000, out, 8'b00000111);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 13 passed!");
        end

        // Tick 14: Inputs = 8'b11100000, Generated = out, Reference = 8'b00000111
        in = 8'b11100000; // Set input values
        #period;
        if (!(out === 8'b00000111)) begin
            $display("Mismatch at index 14: Inputs = [%b], Generated = [%b], Reference = [%b]", 8'b11100000, out, 8'b00000111);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 14 passed!");
        end

        // Tick 15: Inputs = 8'b11110000, Generated = out, Reference = 8'b00001111
        in = 8'b11110000; // Set input values
        #period;
        if (!(out === 8'b00001111)) begin
            $display("Mismatch at index 15: Inputs = [%b], Generated = [%b], Reference = [%b]", 8'b11110000, out, 8'b00001111);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 15 passed!");
        end

        if (mismatch_count == 0)
            $display("All tests passed!");
        else
            $display("%0d mismatches out of %0d total tests.", mismatch_count, 16);
        $finish;
    end

endmodule