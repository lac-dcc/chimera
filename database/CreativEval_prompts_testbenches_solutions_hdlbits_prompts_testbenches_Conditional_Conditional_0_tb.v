// This program was cloned from: https://github.com/matthewdelorenzo/CreativEval
// License: BSD 3-Clause "New" or "Revised" License

`timescale 1 ns/10 ps  // time-unit = 1 ns, precision = 10 ps

module top_module_tb;

    // duration for each bit = 20 * timescale = 20 * 1 ns  = 20ns
    localparam period = 20;

    reg [7:0] a;
    reg [7:0] b;
    reg [7:0] c;
    reg [7:0] d;

    wire [7:0] min;


    integer mismatch_count;

    top_module UUT (.a(a), .b(b), .c(c), .d(d), .min(min));

    initial begin
        mismatch_count = 0;

        // Tick 0: Inputs = 8'b00000001, 8'b00000010, 8'b00000011, 8'b00000100, Generated = min, Reference = 8'b00000001
        a = 8'b00000001; b = 8'b00000010; c = 8'b00000011; d = 8'b00000100; // Set input values
        #period;
        if (!(min === 8'b00000001)) begin
            $display("Mismatch at index 0: Inputs = [%b, %b, %b, %b], Generated = [%b], Reference = [%b]", 8'b00000001, 8'b00000010, 8'b00000011, 8'b00000100, min, 8'b00000001);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 0 passed!");
        end

        // Tick 1: Inputs = 8'b00000001, 8'b00000010, 8'b00000011, 8'b00000100, Generated = min, Reference = 8'b00000001
        a = 8'b00000001; b = 8'b00000010; c = 8'b00000011; d = 8'b00000100; // Set input values
        #period;
        if (!(min === 8'b00000001)) begin
            $display("Mismatch at index 1: Inputs = [%b, %b, %b, %b], Generated = [%b], Reference = [%b]", 8'b00000001, 8'b00000010, 8'b00000011, 8'b00000100, min, 8'b00000001);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 1 passed!");
        end

        // Tick 2: Inputs = 8'b00000001, 8'b00000010, 8'b00000011, 8'b00000100, Generated = min, Reference = 8'b00000001
        a = 8'b00000001; b = 8'b00000010; c = 8'b00000011; d = 8'b00000100; // Set input values
        #period;
        if (!(min === 8'b00000001)) begin
            $display("Mismatch at index 2: Inputs = [%b, %b, %b, %b], Generated = [%b], Reference = [%b]", 8'b00000001, 8'b00000010, 8'b00000011, 8'b00000100, min, 8'b00000001);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 2 passed!");
        end

        // Tick 3: Inputs = 8'b00010001, 8'b00000010, 8'b00000011, 8'b00000100, Generated = min, Reference = 8'b00000010
        a = 8'b00010001; b = 8'b00000010; c = 8'b00000011; d = 8'b00000100; // Set input values
        #period;
        if (!(min === 8'b00000010)) begin
            $display("Mismatch at index 3: Inputs = [%b, %b, %b, %b], Generated = [%b], Reference = [%b]", 8'b00010001, 8'b00000010, 8'b00000011, 8'b00000100, min, 8'b00000010);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 3 passed!");
        end

        // Tick 4: Inputs = 8'b00010001, 8'b00000010, 8'b00000011, 8'b00000100, Generated = min, Reference = 8'b00000010
        a = 8'b00010001; b = 8'b00000010; c = 8'b00000011; d = 8'b00000100; // Set input values
        #period;
        if (!(min === 8'b00000010)) begin
            $display("Mismatch at index 4: Inputs = [%b, %b, %b, %b], Generated = [%b], Reference = [%b]", 8'b00010001, 8'b00000010, 8'b00000011, 8'b00000100, min, 8'b00000010);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 4 passed!");
        end

        // Tick 5: Inputs = 8'b00010001, 8'b00010010, 8'b00000011, 8'b00000100, Generated = min, Reference = 8'b00000011
        a = 8'b00010001; b = 8'b00010010; c = 8'b00000011; d = 8'b00000100; // Set input values
        #period;
        if (!(min === 8'b00000011)) begin
            $display("Mismatch at index 5: Inputs = [%b, %b, %b, %b], Generated = [%b], Reference = [%b]", 8'b00010001, 8'b00010010, 8'b00000011, 8'b00000100, min, 8'b00000011);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 5 passed!");
        end

        // Tick 6: Inputs = 8'b00010001, 8'b00010010, 8'b00000011, 8'b00000100, Generated = min, Reference = 8'b00000011
        a = 8'b00010001; b = 8'b00010010; c = 8'b00000011; d = 8'b00000100; // Set input values
        #period;
        if (!(min === 8'b00000011)) begin
            $display("Mismatch at index 6: Inputs = [%b, %b, %b, %b], Generated = [%b], Reference = [%b]", 8'b00010001, 8'b00010010, 8'b00000011, 8'b00000100, min, 8'b00000011);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 6 passed!");
        end

        // Tick 7: Inputs = 8'b00010001, 8'b00010010, 8'b00010011, 8'b00000100, Generated = min, Reference = 8'b00000100
        a = 8'b00010001; b = 8'b00010010; c = 8'b00010011; d = 8'b00000100; // Set input values
        #period;
        if (!(min === 8'b00000100)) begin
            $display("Mismatch at index 7: Inputs = [%b, %b, %b, %b], Generated = [%b], Reference = [%b]", 8'b00010001, 8'b00010010, 8'b00010011, 8'b00000100, min, 8'b00000100);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 7 passed!");
        end

        // Tick 8: Inputs = 8'b00010001, 8'b00010010, 8'b00010011, 8'b00000100, Generated = min, Reference = 8'b00000100
        a = 8'b00010001; b = 8'b00010010; c = 8'b00010011; d = 8'b00000100; // Set input values
        #period;
        if (!(min === 8'b00000100)) begin
            $display("Mismatch at index 8: Inputs = [%b, %b, %b, %b], Generated = [%b], Reference = [%b]", 8'b00010001, 8'b00010010, 8'b00010011, 8'b00000100, min, 8'b00000100);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 8 passed!");
        end

        // Tick 9: Inputs = 8'b00010001, 8'b00010010, 8'b00010011, 8'b00010100, Generated = min, Reference = 8'b00010001
        a = 8'b00010001; b = 8'b00010010; c = 8'b00010011; d = 8'b00010100; // Set input values
        #period;
        if (!(min === 8'b00010001)) begin
            $display("Mismatch at index 9: Inputs = [%b, %b, %b, %b], Generated = [%b], Reference = [%b]", 8'b00010001, 8'b00010010, 8'b00010011, 8'b00010100, min, 8'b00010001);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 9 passed!");
        end

        if (mismatch_count == 0)
            $display("All tests passed!");
        else
            $display("%0d mismatches out of %0d total tests.", mismatch_count, 10);
        $finish;
    end

endmodule