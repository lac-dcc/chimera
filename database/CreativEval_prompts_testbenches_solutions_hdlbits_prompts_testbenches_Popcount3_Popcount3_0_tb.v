// This program was cloned from: https://github.com/matthewdelorenzo/CreativEval
// License: BSD 3-Clause "New" or "Revised" License

`timescale 1 ns/10 ps  // time-unit = 1 ns, precision = 10 ps

module top_module_tb;

    // duration for each bit = 20 * timescale = 20 * 1 ns  = 20ns
    localparam period = 20;

    reg [2:0] in;

    wire [1:0] out;


    integer mismatch_count;

    top_module UUT (.in(in), .out(out));

    initial begin
        mismatch_count = 0;

        // Tick 0: Inputs = 3'b111, Generated = out, Reference = 2'b11
        in = 3'b111; // Set input values
        #period;
        if (!(out === 2'b11)) begin
            $display("Mismatch at index 0: Inputs = [%b], Generated = [%b], Reference = [%b]", 3'b111, out, 2'b11);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 0 passed!");
        end

        // Tick 1: Inputs = 3'b000, Generated = out, Reference = 2'b00
        in = 3'b000; // Set input values
        #period;
        if (!(out === 2'b00)) begin
            $display("Mismatch at index 1: Inputs = [%b], Generated = [%b], Reference = [%b]", 3'b000, out, 2'b00);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 1 passed!");
        end

        // Tick 2: Inputs = 3'b000, Generated = out, Reference = 2'b00
        in = 3'b000; // Set input values
        #period;
        if (!(out === 2'b00)) begin
            $display("Mismatch at index 2: Inputs = [%b], Generated = [%b], Reference = [%b]", 3'b000, out, 2'b00);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 2 passed!");
        end

        // Tick 3: Inputs = 3'b001, Generated = out, Reference = 2'b01
        in = 3'b001; // Set input values
        #period;
        if (!(out === 2'b01)) begin
            $display("Mismatch at index 3: Inputs = [%b], Generated = [%b], Reference = [%b]", 3'b001, out, 2'b01);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 3 passed!");
        end

        // Tick 4: Inputs = 3'b001, Generated = out, Reference = 2'b01
        in = 3'b001; // Set input values
        #period;
        if (!(out === 2'b01)) begin
            $display("Mismatch at index 4: Inputs = [%b], Generated = [%b], Reference = [%b]", 3'b001, out, 2'b01);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 4 passed!");
        end

        // Tick 5: Inputs = 3'b010, Generated = out, Reference = 2'b01
        in = 3'b010; // Set input values
        #period;
        if (!(out === 2'b01)) begin
            $display("Mismatch at index 5: Inputs = [%b], Generated = [%b], Reference = [%b]", 3'b010, out, 2'b01);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 5 passed!");
        end

        // Tick 6: Inputs = 3'b010, Generated = out, Reference = 2'b01
        in = 3'b010; // Set input values
        #period;
        if (!(out === 2'b01)) begin
            $display("Mismatch at index 6: Inputs = [%b], Generated = [%b], Reference = [%b]", 3'b010, out, 2'b01);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 6 passed!");
        end

        // Tick 7: Inputs = 3'b011, Generated = out, Reference = 2'b10
        in = 3'b011; // Set input values
        #period;
        if (!(out === 2'b10)) begin
            $display("Mismatch at index 7: Inputs = [%b], Generated = [%b], Reference = [%b]", 3'b011, out, 2'b10);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 7 passed!");
        end

        // Tick 8: Inputs = 3'b011, Generated = out, Reference = 2'b10
        in = 3'b011; // Set input values
        #period;
        if (!(out === 2'b10)) begin
            $display("Mismatch at index 8: Inputs = [%b], Generated = [%b], Reference = [%b]", 3'b011, out, 2'b10);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 8 passed!");
        end

        // Tick 9: Inputs = 3'b100, Generated = out, Reference = 2'b01
        in = 3'b100; // Set input values
        #period;
        if (!(out === 2'b01)) begin
            $display("Mismatch at index 9: Inputs = [%b], Generated = [%b], Reference = [%b]", 3'b100, out, 2'b01);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 9 passed!");
        end

        // Tick 10: Inputs = 3'b100, Generated = out, Reference = 2'b01
        in = 3'b100; // Set input values
        #period;
        if (!(out === 2'b01)) begin
            $display("Mismatch at index 10: Inputs = [%b], Generated = [%b], Reference = [%b]", 3'b100, out, 2'b01);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 10 passed!");
        end

        // Tick 11: Inputs = 3'b101, Generated = out, Reference = 2'b10
        in = 3'b101; // Set input values
        #period;
        if (!(out === 2'b10)) begin
            $display("Mismatch at index 11: Inputs = [%b], Generated = [%b], Reference = [%b]", 3'b101, out, 2'b10);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 11 passed!");
        end

        // Tick 12: Inputs = 3'b101, Generated = out, Reference = 2'b10
        in = 3'b101; // Set input values
        #period;
        if (!(out === 2'b10)) begin
            $display("Mismatch at index 12: Inputs = [%b], Generated = [%b], Reference = [%b]", 3'b101, out, 2'b10);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 12 passed!");
        end

        // Tick 13: Inputs = 3'b110, Generated = out, Reference = 2'b10
        in = 3'b110; // Set input values
        #period;
        if (!(out === 2'b10)) begin
            $display("Mismatch at index 13: Inputs = [%b], Generated = [%b], Reference = [%b]", 3'b110, out, 2'b10);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 13 passed!");
        end

        // Tick 14: Inputs = 3'b110, Generated = out, Reference = 2'b10
        in = 3'b110; // Set input values
        #period;
        if (!(out === 2'b10)) begin
            $display("Mismatch at index 14: Inputs = [%b], Generated = [%b], Reference = [%b]", 3'b110, out, 2'b10);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 14 passed!");
        end

        // Tick 15: Inputs = 3'b111, Generated = out, Reference = 2'b11
        in = 3'b111; // Set input values
        #period;
        if (!(out === 2'b11)) begin
            $display("Mismatch at index 15: Inputs = [%b], Generated = [%b], Reference = [%b]", 3'b111, out, 2'b11);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 15 passed!");
        end

        // Tick 16: Inputs = 3'b111, Generated = out, Reference = 2'b11
        in = 3'b111; // Set input values
        #period;
        if (!(out === 2'b11)) begin
            $display("Mismatch at index 16: Inputs = [%b], Generated = [%b], Reference = [%b]", 3'b111, out, 2'b11);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 16 passed!");
        end

        // Tick 17: Inputs = 3'b000, Generated = out, Reference = 2'b00
        in = 3'b000; // Set input values
        #period;
        if (!(out === 2'b00)) begin
            $display("Mismatch at index 17: Inputs = [%b], Generated = [%b], Reference = [%b]", 3'b000, out, 2'b00);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 17 passed!");
        end

        if (mismatch_count == 0)
            $display("All tests passed!");
        else
            $display("%0d mismatches out of %0d total tests.", mismatch_count, 18);
        $finish;
    end

endmodule