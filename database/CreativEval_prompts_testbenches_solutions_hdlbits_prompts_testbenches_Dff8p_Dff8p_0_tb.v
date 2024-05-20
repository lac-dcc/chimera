// This program was cloned from: https://github.com/matthewdelorenzo/CreativEval
// License: BSD 3-Clause "New" or "Revised" License

`timescale 1 ns/10 ps  // time-unit = 1 ns, precision = 10 ps

module top_module_tb;

    // duration for each bit = 20 * timescale = 20 * 1 ns  = 20ns
    localparam period = 20;

    reg clk;
    reg [7:0] d;
    reg reset;

    wire [7:0] q;


    integer mismatch_count;

    top_module UUT (.clk(clk), .d(d), .reset(reset), .q(q));

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

        // Tick 0: Inputs = 1'b0, 8'b00100100, 1'b1, Generated = q, Reference = 8'b00110100
        d = 8'b00100100; reset = 1'b1; // Set input values
        #period;
        if (!(q === 8'b00110100)) begin
            $display("Mismatch at index 0: Inputs = [%b, %b, %b], Generated = [%b], Reference = [%b]", 1'b0, 8'b00100100, 1'b1, q, 8'b00110100);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 0 passed!");
        end

        // Tick 1: Inputs = 1'b1, 8'b00100100, 1'b1, Generated = q, Reference = 8'b00110100
        d = 8'b00100100; reset = 1'b1; // Set input values
        #period;
        if (!(q === 8'b00110100)) begin
            $display("Mismatch at index 1: Inputs = [%b, %b, %b], Generated = [%b], Reference = [%b]", 1'b1, 8'b00100100, 1'b1, q, 8'b00110100);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 1 passed!");
        end

        // Tick 2: Inputs = 1'b0, 8'b00100100, 1'b1, Generated = q, Reference = 8'b00110100
        d = 8'b00100100; reset = 1'b1; // Set input values
        #period;
        if (!(q === 8'b00110100)) begin
            $display("Mismatch at index 2: Inputs = [%b, %b, %b], Generated = [%b], Reference = [%b]", 1'b0, 8'b00100100, 1'b1, q, 8'b00110100);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 2 passed!");
        end

        // Tick 3: Inputs = 1'b1, 8'b00100100, 1'b0, Generated = q, Reference = 8'b00110100
        d = 8'b00100100; reset = 1'b0; // Set input values
        #period;
        if (!(q === 8'b00110100)) begin
            $display("Mismatch at index 3: Inputs = [%b, %b, %b], Generated = [%b], Reference = [%b]", 1'b1, 8'b00100100, 1'b0, q, 8'b00110100);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 3 passed!");
        end

        // Tick 4: Inputs = 1'b0, 8'b00100100, 1'b0, Generated = q, Reference = 8'b00100100
        d = 8'b00100100; reset = 1'b0; // Set input values
        #period;
        if (!(q === 8'b00100100)) begin
            $display("Mismatch at index 4: Inputs = [%b, %b, %b], Generated = [%b], Reference = [%b]", 1'b0, 8'b00100100, 1'b0, q, 8'b00100100);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 4 passed!");
        end

        // Tick 5: Inputs = 1'b1, 8'b00100100, 1'b0, Generated = q, Reference = 8'b00100100
        d = 8'b00100100; reset = 1'b0; // Set input values
        #period;
        if (!(q === 8'b00100100)) begin
            $display("Mismatch at index 5: Inputs = [%b, %b, %b], Generated = [%b], Reference = [%b]", 1'b1, 8'b00100100, 1'b0, q, 8'b00100100);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 5 passed!");
        end

        // Tick 6: Inputs = 1'b0, 8'b00100100, 1'b0, Generated = q, Reference = 8'b00100100
        d = 8'b00100100; reset = 1'b0; // Set input values
        #period;
        if (!(q === 8'b00100100)) begin
            $display("Mismatch at index 6: Inputs = [%b, %b, %b], Generated = [%b], Reference = [%b]", 1'b0, 8'b00100100, 1'b0, q, 8'b00100100);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 6 passed!");
        end

        // Tick 7: Inputs = 1'b1, 8'b00100100, 1'b0, Generated = q, Reference = 8'b00100100
        d = 8'b00100100; reset = 1'b0; // Set input values
        #period;
        if (!(q === 8'b00100100)) begin
            $display("Mismatch at index 7: Inputs = [%b, %b, %b], Generated = [%b], Reference = [%b]", 1'b1, 8'b00100100, 1'b0, q, 8'b00100100);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 7 passed!");
        end

        // Tick 8: Inputs = 1'b0, 8'b00100100, 1'b0, Generated = q, Reference = 8'b00100100
        d = 8'b00100100; reset = 1'b0; // Set input values
        #period;
        if (!(q === 8'b00100100)) begin
            $display("Mismatch at index 8: Inputs = [%b, %b, %b], Generated = [%b], Reference = [%b]", 1'b0, 8'b00100100, 1'b0, q, 8'b00100100);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 8 passed!");
        end

        // Tick 9: Inputs = 1'b1, 8'b00100100, 1'b0, Generated = q, Reference = 8'b00100100
        d = 8'b00100100; reset = 1'b0; // Set input values
        #period;
        if (!(q === 8'b00100100)) begin
            $display("Mismatch at index 9: Inputs = [%b, %b, %b], Generated = [%b], Reference = [%b]", 1'b1, 8'b00100100, 1'b0, q, 8'b00100100);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 9 passed!");
        end

        // Tick 10: Inputs = 1'b0, 8'b00100100, 1'b1, Generated = q, Reference = 8'b00100100
        d = 8'b00100100; reset = 1'b1; // Set input values
        #period;
        if (!(q === 8'b00100100)) begin
            $display("Mismatch at index 10: Inputs = [%b, %b, %b], Generated = [%b], Reference = [%b]", 1'b0, 8'b00100100, 1'b1, q, 8'b00100100);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 10 passed!");
        end

        // Tick 11: Inputs = 1'b1, 8'b00100100, 1'b1, Generated = q, Reference = 8'b00100100
        d = 8'b00100100; reset = 1'b1; // Set input values
        #period;
        if (!(q === 8'b00100100)) begin
            $display("Mismatch at index 11: Inputs = [%b, %b, %b], Generated = [%b], Reference = [%b]", 1'b1, 8'b00100100, 1'b1, q, 8'b00100100);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 11 passed!");
        end

        // Tick 12: Inputs = 1'b0, 8'b00100100, 1'b1, Generated = q, Reference = 8'b00110100
        d = 8'b00100100; reset = 1'b1; // Set input values
        #period;
        if (!(q === 8'b00110100)) begin
            $display("Mismatch at index 12: Inputs = [%b, %b, %b], Generated = [%b], Reference = [%b]", 1'b0, 8'b00100100, 1'b1, q, 8'b00110100);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 12 passed!");
        end

        // Tick 13: Inputs = 1'b1, 8'b00100100, 1'b0, Generated = q, Reference = 8'b00110100
        d = 8'b00100100; reset = 1'b0; // Set input values
        #period;
        if (!(q === 8'b00110100)) begin
            $display("Mismatch at index 13: Inputs = [%b, %b, %b], Generated = [%b], Reference = [%b]", 1'b1, 8'b00100100, 1'b0, q, 8'b00110100);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 13 passed!");
        end

        // Tick 14: Inputs = 1'b0, 8'b10000001, 1'b0, Generated = q, Reference = 8'b00100100
        d = 8'b10000001; reset = 1'b0; // Set input values
        #period;
        if (!(q === 8'b00100100)) begin
            $display("Mismatch at index 14: Inputs = [%b, %b, %b], Generated = [%b], Reference = [%b]", 1'b0, 8'b10000001, 1'b0, q, 8'b00100100);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 14 passed!");
        end

        // Tick 15: Inputs = 1'b1, 8'b10000001, 1'b0, Generated = q, Reference = 8'b00100100
        d = 8'b10000001; reset = 1'b0; // Set input values
        #period;
        if (!(q === 8'b00100100)) begin
            $display("Mismatch at index 15: Inputs = [%b, %b, %b], Generated = [%b], Reference = [%b]", 1'b1, 8'b10000001, 1'b0, q, 8'b00100100);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 15 passed!");
        end

        // Tick 16: Inputs = 1'b0, 8'b00001001, 1'b0, Generated = q, Reference = 8'b10000001
        d = 8'b00001001; reset = 1'b0; // Set input values
        #period;
        if (!(q === 8'b10000001)) begin
            $display("Mismatch at index 16: Inputs = [%b, %b, %b], Generated = [%b], Reference = [%b]", 1'b0, 8'b00001001, 1'b0, q, 8'b10000001);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 16 passed!");
        end

        // Tick 17: Inputs = 1'b1, 8'b00001001, 1'b0, Generated = q, Reference = 8'b10000001
        d = 8'b00001001; reset = 1'b0; // Set input values
        #period;
        if (!(q === 8'b10000001)) begin
            $display("Mismatch at index 17: Inputs = [%b, %b, %b], Generated = [%b], Reference = [%b]", 1'b1, 8'b00001001, 1'b0, q, 8'b10000001);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 17 passed!");
        end

        // Tick 18: Inputs = 1'b0, 8'b01100011, 1'b0, Generated = q, Reference = 8'b00001001
        d = 8'b01100011; reset = 1'b0; // Set input values
        #period;
        if (!(q === 8'b00001001)) begin
            $display("Mismatch at index 18: Inputs = [%b, %b, %b], Generated = [%b], Reference = [%b]", 1'b0, 8'b01100011, 1'b0, q, 8'b00001001);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 18 passed!");
        end

        // Tick 19: Inputs = 1'b1, 8'b01100011, 1'b0, Generated = q, Reference = 8'b00001001
        d = 8'b01100011; reset = 1'b0; // Set input values
        #period;
        if (!(q === 8'b00001001)) begin
            $display("Mismatch at index 19: Inputs = [%b, %b, %b], Generated = [%b], Reference = [%b]", 1'b1, 8'b01100011, 1'b0, q, 8'b00001001);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 19 passed!");
        end

        // Tick 20: Inputs = 1'b0, 8'b00001101, 1'b0, Generated = q, Reference = 8'b01100011
        d = 8'b00001101; reset = 1'b0; // Set input values
        #period;
        if (!(q === 8'b01100011)) begin
            $display("Mismatch at index 20: Inputs = [%b, %b, %b], Generated = [%b], Reference = [%b]", 1'b0, 8'b00001101, 1'b0, q, 8'b01100011);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 20 passed!");
        end

        // Tick 21: Inputs = 1'b1, 8'b00001101, 1'b0, Generated = q, Reference = 8'b01100011
        d = 8'b00001101; reset = 1'b0; // Set input values
        #period;
        if (!(q === 8'b01100011)) begin
            $display("Mismatch at index 21: Inputs = [%b, %b, %b], Generated = [%b], Reference = [%b]", 1'b1, 8'b00001101, 1'b0, q, 8'b01100011);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 21 passed!");
        end

        // Tick 22: Inputs = 1'b0, 8'b10001101, 1'b0, Generated = q, Reference = 8'b00001101
        d = 8'b10001101; reset = 1'b0; // Set input values
        #period;
        if (!(q === 8'b00001101)) begin
            $display("Mismatch at index 22: Inputs = [%b, %b, %b], Generated = [%b], Reference = [%b]", 1'b0, 8'b10001101, 1'b0, q, 8'b00001101);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 22 passed!");
        end

        // Tick 23: Inputs = 1'b1, 8'b10001101, 1'b0, Generated = q, Reference = 8'b00001101
        d = 8'b10001101; reset = 1'b0; // Set input values
        #period;
        if (!(q === 8'b00001101)) begin
            $display("Mismatch at index 23: Inputs = [%b, %b, %b], Generated = [%b], Reference = [%b]", 1'b1, 8'b10001101, 1'b0, q, 8'b00001101);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 23 passed!");
        end

        // Tick 24: Inputs = 1'b0, 8'b01100101, 1'b0, Generated = q, Reference = 8'b10001101
        d = 8'b01100101; reset = 1'b0; // Set input values
        #period;
        if (!(q === 8'b10001101)) begin
            $display("Mismatch at index 24: Inputs = [%b, %b, %b], Generated = [%b], Reference = [%b]", 1'b0, 8'b01100101, 1'b0, q, 8'b10001101);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 24 passed!");
        end

        // Tick 25: Inputs = 1'b1, 8'b01100101, 1'b0, Generated = q, Reference = 8'b10001101
        d = 8'b01100101; reset = 1'b0; // Set input values
        #period;
        if (!(q === 8'b10001101)) begin
            $display("Mismatch at index 25: Inputs = [%b, %b, %b], Generated = [%b], Reference = [%b]", 1'b1, 8'b01100101, 1'b0, q, 8'b10001101);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 25 passed!");
        end

        // Tick 26: Inputs = 1'b0, 8'b00010010, 1'b0, Generated = q, Reference = 8'b01100101
        d = 8'b00010010; reset = 1'b0; // Set input values
        #period;
        if (!(q === 8'b01100101)) begin
            $display("Mismatch at index 26: Inputs = [%b, %b, %b], Generated = [%b], Reference = [%b]", 1'b0, 8'b00010010, 1'b0, q, 8'b01100101);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 26 passed!");
        end

        // Tick 27: Inputs = 1'b1, 8'b00010010, 1'b0, Generated = q, Reference = 8'b01100101
        d = 8'b00010010; reset = 1'b0; // Set input values
        #period;
        if (!(q === 8'b01100101)) begin
            $display("Mismatch at index 27: Inputs = [%b, %b, %b], Generated = [%b], Reference = [%b]", 1'b1, 8'b00010010, 1'b0, q, 8'b01100101);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 27 passed!");
        end

        // Tick 28: Inputs = 1'b0, 8'b00000001, 1'b0, Generated = q, Reference = 8'b00010010
        d = 8'b00000001; reset = 1'b0; // Set input values
        #period;
        if (!(q === 8'b00010010)) begin
            $display("Mismatch at index 28: Inputs = [%b, %b, %b], Generated = [%b], Reference = [%b]", 1'b0, 8'b00000001, 1'b0, q, 8'b00010010);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 28 passed!");
        end

        // Tick 29: Inputs = 1'b1, 8'b00000001, 1'b0, Generated = q, Reference = 8'b00010010
        d = 8'b00000001; reset = 1'b0; // Set input values
        #period;
        if (!(q === 8'b00010010)) begin
            $display("Mismatch at index 29: Inputs = [%b, %b, %b], Generated = [%b], Reference = [%b]", 1'b1, 8'b00000001, 1'b0, q, 8'b00010010);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 29 passed!");
        end

        // Tick 30: Inputs = 1'b0, 8'b00001101, 1'b0, Generated = q, Reference = 8'b00000001
        d = 8'b00001101; reset = 1'b0; // Set input values
        #period;
        if (!(q === 8'b00000001)) begin
            $display("Mismatch at index 30: Inputs = [%b, %b, %b], Generated = [%b], Reference = [%b]", 1'b0, 8'b00001101, 1'b0, q, 8'b00000001);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 30 passed!");
        end

        // Tick 31: Inputs = 1'b1, 8'b00001101, 1'b0, Generated = q, Reference = 8'b00000001
        d = 8'b00001101; reset = 1'b0; // Set input values
        #period;
        if (!(q === 8'b00000001)) begin
            $display("Mismatch at index 31: Inputs = [%b, %b, %b], Generated = [%b], Reference = [%b]", 1'b1, 8'b00001101, 1'b0, q, 8'b00000001);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 31 passed!");
        end

        if (mismatch_count == 0)
            $display("All tests passed!");
        else
            $display("%0d mismatches out of %0d total tests.", mismatch_count, 32);
        $finish;
    end

endmodule