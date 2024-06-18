// This program was cloned from: https://github.com/matthewdelorenzo/CreativEval
// License: BSD 3-Clause "New" or "Revised" License

`timescale 1 ns/10 ps  // time-unit = 1 ns, precision = 10 ps

module top_module_tb;

    // duration for each bit = 20 * timescale = 20 * 1 ns  = 20ns
    localparam period = 20;

    reg [7:0] a;
    reg [7:0] b;

    wire [7:0] s;
    wire overflow;


    integer mismatch_count;

    top_module UUT (.a(a), .b(b), .s(s), .overflow(overflow));

    initial begin
        mismatch_count = 0;

        // Tick 0: Inputs = 8'b00000000, 8'b00000000, Generated = s, overflow, Reference = 8'b00000000, 1'b0
        a = 8'b00000000; b = 8'b00000000; // Set input values
        #period;
        if (!(s === 8'b00000000 && overflow === 1'b0)) begin
            $display("Mismatch at index 0: Inputs = [%b, %b], Generated = [%b, %b], Reference = [%b, %b]", 8'b00000000, 8'b00000000, s, overflow, 8'b00000000, 1'b0);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 0 passed!");
        end

        // Tick 1: Inputs = 8'b00000000, 8'b00000000, Generated = s, overflow, Reference = 8'b00000000, 1'b0
        a = 8'b00000000; b = 8'b00000000; // Set input values
        #period;
        if (!(s === 8'b00000000 && overflow === 1'b0)) begin
            $display("Mismatch at index 1: Inputs = [%b, %b], Generated = [%b, %b], Reference = [%b, %b]", 8'b00000000, 8'b00000000, s, overflow, 8'b00000000, 1'b0);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 1 passed!");
        end

        // Tick 2: Inputs = 8'b00000000, 8'b00000000, Generated = s, overflow, Reference = 8'b00000000, 1'b0
        a = 8'b00000000; b = 8'b00000000; // Set input values
        #period;
        if (!(s === 8'b00000000 && overflow === 1'b0)) begin
            $display("Mismatch at index 2: Inputs = [%b, %b], Generated = [%b, %b], Reference = [%b, %b]", 8'b00000000, 8'b00000000, s, overflow, 8'b00000000, 1'b0);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 2 passed!");
        end

        // Tick 3: Inputs = 8'b00000000, 8'b01110000, Generated = s, overflow, Reference = 8'b01110000, 1'b0
        a = 8'b00000000; b = 8'b01110000; // Set input values
        #period;
        if (!(s === 8'b01110000 && overflow === 1'b0)) begin
            $display("Mismatch at index 3: Inputs = [%b, %b], Generated = [%b, %b], Reference = [%b, %b]", 8'b00000000, 8'b01110000, s, overflow, 8'b01110000, 1'b0);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 3 passed!");
        end

        // Tick 4: Inputs = 8'b00000000, 8'b01110000, Generated = s, overflow, Reference = 8'b01110000, 1'b0
        a = 8'b00000000; b = 8'b01110000; // Set input values
        #period;
        if (!(s === 8'b01110000 && overflow === 1'b0)) begin
            $display("Mismatch at index 4: Inputs = [%b, %b], Generated = [%b, %b], Reference = [%b, %b]", 8'b00000000, 8'b01110000, s, overflow, 8'b01110000, 1'b0);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 4 passed!");
        end

        // Tick 5: Inputs = 8'b01110000, 8'b01110000, Generated = s, overflow, Reference = 8'b11100000, 1'b1
        a = 8'b01110000; b = 8'b01110000; // Set input values
        #period;
        if (!(s === 8'b11100000 && overflow === 1'b1)) begin
            $display("Mismatch at index 5: Inputs = [%b, %b], Generated = [%b, %b], Reference = [%b, %b]", 8'b01110000, 8'b01110000, s, overflow, 8'b11100000, 1'b1);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 5 passed!");
        end

        // Tick 6: Inputs = 8'b01110000, 8'b01110000, Generated = s, overflow, Reference = 8'b11100000, 1'b1
        a = 8'b01110000; b = 8'b01110000; // Set input values
        #period;
        if (!(s === 8'b11100000 && overflow === 1'b1)) begin
            $display("Mismatch at index 6: Inputs = [%b, %b], Generated = [%b, %b], Reference = [%b, %b]", 8'b01110000, 8'b01110000, s, overflow, 8'b11100000, 1'b1);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 6 passed!");
        end

        // Tick 7: Inputs = 8'b01110000, 8'b10010000, Generated = s, overflow, Reference = 8'b00000000, 1'b0
        a = 8'b01110000; b = 8'b10010000; // Set input values
        #period;
        if (!(s === 8'b00000000 && overflow === 1'b0)) begin
            $display("Mismatch at index 7: Inputs = [%b, %b], Generated = [%b, %b], Reference = [%b, %b]", 8'b01110000, 8'b10010000, s, overflow, 8'b00000000, 1'b0);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 7 passed!");
        end

        // Tick 8: Inputs = 8'b01110000, 8'b10010000, Generated = s, overflow, Reference = 8'b00000000, 1'b0
        a = 8'b01110000; b = 8'b10010000; // Set input values
        #period;
        if (!(s === 8'b00000000 && overflow === 1'b0)) begin
            $display("Mismatch at index 8: Inputs = [%b, %b], Generated = [%b, %b], Reference = [%b, %b]", 8'b01110000, 8'b10010000, s, overflow, 8'b00000000, 1'b0);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 8 passed!");
        end

        // Tick 9: Inputs = 8'b10010000, 8'b01110000, Generated = s, overflow, Reference = 8'b00000000, 1'b0
        a = 8'b10010000; b = 8'b01110000; // Set input values
        #period;
        if (!(s === 8'b00000000 && overflow === 1'b0)) begin
            $display("Mismatch at index 9: Inputs = [%b, %b], Generated = [%b, %b], Reference = [%b, %b]", 8'b10010000, 8'b01110000, s, overflow, 8'b00000000, 1'b0);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 9 passed!");
        end

        // Tick 10: Inputs = 8'b10010000, 8'b01110000, Generated = s, overflow, Reference = 8'b00000000, 1'b0
        a = 8'b10010000; b = 8'b01110000; // Set input values
        #period;
        if (!(s === 8'b00000000 && overflow === 1'b0)) begin
            $display("Mismatch at index 10: Inputs = [%b, %b], Generated = [%b, %b], Reference = [%b, %b]", 8'b10010000, 8'b01110000, s, overflow, 8'b00000000, 1'b0);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 10 passed!");
        end

        // Tick 11: Inputs = 8'b10010000, 8'b10010000, Generated = s, overflow, Reference = 8'b00100000, 1'b1
        a = 8'b10010000; b = 8'b10010000; // Set input values
        #period;
        if (!(s === 8'b00100000 && overflow === 1'b1)) begin
            $display("Mismatch at index 11: Inputs = [%b, %b], Generated = [%b, %b], Reference = [%b, %b]", 8'b10010000, 8'b10010000, s, overflow, 8'b00100000, 1'b1);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 11 passed!");
        end

        // Tick 12: Inputs = 8'b10010000, 8'b10010000, Generated = s, overflow, Reference = 8'b00100000, 1'b1
        a = 8'b10010000; b = 8'b10010000; // Set input values
        #period;
        if (!(s === 8'b00100000 && overflow === 1'b1)) begin
            $display("Mismatch at index 12: Inputs = [%b, %b], Generated = [%b, %b], Reference = [%b, %b]", 8'b10010000, 8'b10010000, s, overflow, 8'b00100000, 1'b1);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 12 passed!");
        end

        // Tick 13: Inputs = 8'b10010000, 8'b11111111, Generated = s, overflow, Reference = 8'b10001111, 1'b0
        a = 8'b10010000; b = 8'b11111111; // Set input values
        #period;
        if (!(s === 8'b10001111 && overflow === 1'b0)) begin
            $display("Mismatch at index 13: Inputs = [%b, %b], Generated = [%b, %b], Reference = [%b, %b]", 8'b10010000, 8'b11111111, s, overflow, 8'b10001111, 1'b0);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 13 passed!");
        end

        if (mismatch_count == 0)
            $display("All tests passed!");
        else
            $display("%0d mismatches out of %0d total tests.", mismatch_count, 14);
        $finish;
    end

endmodule