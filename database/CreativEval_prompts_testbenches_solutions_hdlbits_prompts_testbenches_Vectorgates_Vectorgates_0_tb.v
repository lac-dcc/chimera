// This program was cloned from: https://github.com/matthewdelorenzo/CreativEval
// License: BSD 3-Clause "New" or "Revised" License

`timescale 1 ns/10 ps  // time-unit = 1 ns, precision = 10 ps

module top_module_tb;

    // duration for each bit = 20 * timescale = 20 * 1 ns  = 20ns
    localparam period = 20;

    reg [2:0] a;
    reg [2:0] b;

    wire [2:0] out_or_bitwise;
    wire out_or_logical;
    wire [5:0] out_not;


    integer mismatch_count;

    top_module UUT (.a(a), .b(b), .out_or_bitwise(out_or_bitwise), .out_or_logical(out_or_logical), .out_not(out_not));

    initial begin
        mismatch_count = 0;

        // Tick 0: Inputs = 3'b000, 3'b000, Generated = out_or_bitwise, out_or_logical, out_not, Reference = 3'b000, 1'b0, 6'b111111
        a = 3'b000; b = 3'b000; // Set input values
        #period;
        if (!(out_or_bitwise === 3'b000 && out_or_logical === 1'b0 && out_not === 6'b111111)) begin
            $display("Mismatch at index 0: Inputs = [%b, %b], Generated = [%b, %b, %b], Reference = [%b, %b, %b]", 3'b000, 3'b000, out_or_bitwise, out_or_logical, out_not, 3'b000, 1'b0, 6'b111111);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 0 passed!");
        end

        // Tick 1: Inputs = 3'b000, 3'b111, Generated = out_or_bitwise, out_or_logical, out_not, Reference = 3'b111, 1'b1, 6'b000111
        a = 3'b000; b = 3'b111; // Set input values
        #period;
        if (!(out_or_bitwise === 3'b111 && out_or_logical === 1'b1 && out_not === 6'b000111)) begin
            $display("Mismatch at index 1: Inputs = [%b, %b], Generated = [%b, %b, %b], Reference = [%b, %b, %b]", 3'b000, 3'b111, out_or_bitwise, out_or_logical, out_not, 3'b111, 1'b1, 6'b000111);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 1 passed!");
        end

        // Tick 2: Inputs = 3'b000, 3'b111, Generated = out_or_bitwise, out_or_logical, out_not, Reference = 3'b111, 1'b1, 6'b000111
        a = 3'b000; b = 3'b111; // Set input values
        #period;
        if (!(out_or_bitwise === 3'b111 && out_or_logical === 1'b1 && out_not === 6'b000111)) begin
            $display("Mismatch at index 2: Inputs = [%b, %b], Generated = [%b, %b, %b], Reference = [%b, %b, %b]", 3'b000, 3'b111, out_or_bitwise, out_or_logical, out_not, 3'b111, 1'b1, 6'b000111);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 2 passed!");
        end

        // Tick 3: Inputs = 3'b001, 3'b111, Generated = out_or_bitwise, out_or_logical, out_not, Reference = 3'b111, 1'b1, 6'b000110
        a = 3'b001; b = 3'b111; // Set input values
        #period;
        if (!(out_or_bitwise === 3'b111 && out_or_logical === 1'b1 && out_not === 6'b000110)) begin
            $display("Mismatch at index 3: Inputs = [%b, %b], Generated = [%b, %b, %b], Reference = [%b, %b, %b]", 3'b001, 3'b111, out_or_bitwise, out_or_logical, out_not, 3'b111, 1'b1, 6'b000110);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 3 passed!");
        end

        // Tick 4: Inputs = 3'b001, 3'b111, Generated = out_or_bitwise, out_or_logical, out_not, Reference = 3'b111, 1'b1, 6'b000110
        a = 3'b001; b = 3'b111; // Set input values
        #period;
        if (!(out_or_bitwise === 3'b111 && out_or_logical === 1'b1 && out_not === 6'b000110)) begin
            $display("Mismatch at index 4: Inputs = [%b, %b], Generated = [%b, %b, %b], Reference = [%b, %b, %b]", 3'b001, 3'b111, out_or_bitwise, out_or_logical, out_not, 3'b111, 1'b1, 6'b000110);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 4 passed!");
        end

        // Tick 5: Inputs = 3'b010, 3'b111, Generated = out_or_bitwise, out_or_logical, out_not, Reference = 3'b111, 1'b1, 6'b000101
        a = 3'b010; b = 3'b111; // Set input values
        #period;
        if (!(out_or_bitwise === 3'b111 && out_or_logical === 1'b1 && out_not === 6'b000101)) begin
            $display("Mismatch at index 5: Inputs = [%b, %b], Generated = [%b, %b, %b], Reference = [%b, %b, %b]", 3'b010, 3'b111, out_or_bitwise, out_or_logical, out_not, 3'b111, 1'b1, 6'b000101);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 5 passed!");
        end

        // Tick 6: Inputs = 3'b010, 3'b111, Generated = out_or_bitwise, out_or_logical, out_not, Reference = 3'b111, 1'b1, 6'b000101
        a = 3'b010; b = 3'b111; // Set input values
        #period;
        if (!(out_or_bitwise === 3'b111 && out_or_logical === 1'b1 && out_not === 6'b000101)) begin
            $display("Mismatch at index 6: Inputs = [%b, %b], Generated = [%b, %b, %b], Reference = [%b, %b, %b]", 3'b010, 3'b111, out_or_bitwise, out_or_logical, out_not, 3'b111, 1'b1, 6'b000101);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 6 passed!");
        end

        // Tick 7: Inputs = 3'b011, 3'b111, Generated = out_or_bitwise, out_or_logical, out_not, Reference = 3'b111, 1'b1, 6'b000100
        a = 3'b011; b = 3'b111; // Set input values
        #period;
        if (!(out_or_bitwise === 3'b111 && out_or_logical === 1'b1 && out_not === 6'b000100)) begin
            $display("Mismatch at index 7: Inputs = [%b, %b], Generated = [%b, %b, %b], Reference = [%b, %b, %b]", 3'b011, 3'b111, out_or_bitwise, out_or_logical, out_not, 3'b111, 1'b1, 6'b000100);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 7 passed!");
        end

        // Tick 8: Inputs = 3'b011, 3'b111, Generated = out_or_bitwise, out_or_logical, out_not, Reference = 3'b111, 1'b1, 6'b000100
        a = 3'b011; b = 3'b111; // Set input values
        #period;
        if (!(out_or_bitwise === 3'b111 && out_or_logical === 1'b1 && out_not === 6'b000100)) begin
            $display("Mismatch at index 8: Inputs = [%b, %b], Generated = [%b, %b, %b], Reference = [%b, %b, %b]", 3'b011, 3'b111, out_or_bitwise, out_or_logical, out_not, 3'b111, 1'b1, 6'b000100);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 8 passed!");
        end

        // Tick 9: Inputs = 3'b100, 3'b111, Generated = out_or_bitwise, out_or_logical, out_not, Reference = 3'b111, 1'b1, 6'b000011
        a = 3'b100; b = 3'b111; // Set input values
        #period;
        if (!(out_or_bitwise === 3'b111 && out_or_logical === 1'b1 && out_not === 6'b000011)) begin
            $display("Mismatch at index 9: Inputs = [%b, %b], Generated = [%b, %b, %b], Reference = [%b, %b, %b]", 3'b100, 3'b111, out_or_bitwise, out_or_logical, out_not, 3'b111, 1'b1, 6'b000011);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 9 passed!");
        end

        // Tick 10: Inputs = 3'b100, 3'b111, Generated = out_or_bitwise, out_or_logical, out_not, Reference = 3'b111, 1'b1, 6'b000011
        a = 3'b100; b = 3'b111; // Set input values
        #period;
        if (!(out_or_bitwise === 3'b111 && out_or_logical === 1'b1 && out_not === 6'b000011)) begin
            $display("Mismatch at index 10: Inputs = [%b, %b], Generated = [%b, %b, %b], Reference = [%b, %b, %b]", 3'b100, 3'b111, out_or_bitwise, out_or_logical, out_not, 3'b111, 1'b1, 6'b000011);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 10 passed!");
        end

        // Tick 11: Inputs = 3'b101, 3'b111, Generated = out_or_bitwise, out_or_logical, out_not, Reference = 3'b111, 1'b1, 6'b000010
        a = 3'b101; b = 3'b111; // Set input values
        #period;
        if (!(out_or_bitwise === 3'b111 && out_or_logical === 1'b1 && out_not === 6'b000010)) begin
            $display("Mismatch at index 11: Inputs = [%b, %b], Generated = [%b, %b, %b], Reference = [%b, %b, %b]", 3'b101, 3'b111, out_or_bitwise, out_or_logical, out_not, 3'b111, 1'b1, 6'b000010);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 11 passed!");
        end

        // Tick 12: Inputs = 3'b101, 3'b111, Generated = out_or_bitwise, out_or_logical, out_not, Reference = 3'b111, 1'b1, 6'b000010
        a = 3'b101; b = 3'b111; // Set input values
        #period;
        if (!(out_or_bitwise === 3'b111 && out_or_logical === 1'b1 && out_not === 6'b000010)) begin
            $display("Mismatch at index 12: Inputs = [%b, %b], Generated = [%b, %b, %b], Reference = [%b, %b, %b]", 3'b101, 3'b111, out_or_bitwise, out_or_logical, out_not, 3'b111, 1'b1, 6'b000010);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 12 passed!");
        end

        // Tick 13: Inputs = 3'b110, 3'b111, Generated = out_or_bitwise, out_or_logical, out_not, Reference = 3'b111, 1'b1, 6'b000001
        a = 3'b110; b = 3'b111; // Set input values
        #period;
        if (!(out_or_bitwise === 3'b111 && out_or_logical === 1'b1 && out_not === 6'b000001)) begin
            $display("Mismatch at index 13: Inputs = [%b, %b], Generated = [%b, %b, %b], Reference = [%b, %b, %b]", 3'b110, 3'b111, out_or_bitwise, out_or_logical, out_not, 3'b111, 1'b1, 6'b000001);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 13 passed!");
        end

        // Tick 14: Inputs = 3'b110, 3'b111, Generated = out_or_bitwise, out_or_logical, out_not, Reference = 3'b111, 1'b1, 6'b000001
        a = 3'b110; b = 3'b111; // Set input values
        #period;
        if (!(out_or_bitwise === 3'b111 && out_or_logical === 1'b1 && out_not === 6'b000001)) begin
            $display("Mismatch at index 14: Inputs = [%b, %b], Generated = [%b, %b, %b], Reference = [%b, %b, %b]", 3'b110, 3'b111, out_or_bitwise, out_or_logical, out_not, 3'b111, 1'b1, 6'b000001);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 14 passed!");
        end

        // Tick 15: Inputs = 3'b111, 3'b111, Generated = out_or_bitwise, out_or_logical, out_not, Reference = 3'b111, 1'b1, 6'b000000
        a = 3'b111; b = 3'b111; // Set input values
        #period;
        if (!(out_or_bitwise === 3'b111 && out_or_logical === 1'b1 && out_not === 6'b000000)) begin
            $display("Mismatch at index 15: Inputs = [%b, %b], Generated = [%b, %b, %b], Reference = [%b, %b, %b]", 3'b111, 3'b111, out_or_bitwise, out_or_logical, out_not, 3'b111, 1'b1, 6'b000000);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 15 passed!");
        end

        // Tick 16: Inputs = 3'b111, 3'b111, Generated = out_or_bitwise, out_or_logical, out_not, Reference = 3'b111, 1'b1, 6'b000000
        a = 3'b111; b = 3'b111; // Set input values
        #period;
        if (!(out_or_bitwise === 3'b111 && out_or_logical === 1'b1 && out_not === 6'b000000)) begin
            $display("Mismatch at index 16: Inputs = [%b, %b], Generated = [%b, %b, %b], Reference = [%b, %b, %b]", 3'b111, 3'b111, out_or_bitwise, out_or_logical, out_not, 3'b111, 1'b1, 6'b000000);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 16 passed!");
        end

        // Tick 17: Inputs = 3'b000, 3'b000, Generated = out_or_bitwise, out_or_logical, out_not, Reference = 3'b000, 1'b0, 6'b111111
        a = 3'b000; b = 3'b000; // Set input values
        #period;
        if (!(out_or_bitwise === 3'b000 && out_or_logical === 1'b0 && out_not === 6'b111111)) begin
            $display("Mismatch at index 17: Inputs = [%b, %b], Generated = [%b, %b, %b], Reference = [%b, %b, %b]", 3'b000, 3'b000, out_or_bitwise, out_or_logical, out_not, 3'b000, 1'b0, 6'b111111);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 17 passed!");
        end

        // Tick 18: Inputs = 3'b000, 3'b000, Generated = out_or_bitwise, out_or_logical, out_not, Reference = 3'b000, 1'b0, 6'b111111
        a = 3'b000; b = 3'b000; // Set input values
        #period;
        if (!(out_or_bitwise === 3'b000 && out_or_logical === 1'b0 && out_not === 6'b111111)) begin
            $display("Mismatch at index 18: Inputs = [%b, %b], Generated = [%b, %b, %b], Reference = [%b, %b, %b]", 3'b000, 3'b000, out_or_bitwise, out_or_logical, out_not, 3'b000, 1'b0, 6'b111111);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 18 passed!");
        end

        // Tick 19: Inputs = 3'b001, 3'b000, Generated = out_or_bitwise, out_or_logical, out_not, Reference = 3'b001, 1'b1, 6'b111110
        a = 3'b001; b = 3'b000; // Set input values
        #period;
        if (!(out_or_bitwise === 3'b001 && out_or_logical === 1'b1 && out_not === 6'b111110)) begin
            $display("Mismatch at index 19: Inputs = [%b, %b], Generated = [%b, %b, %b], Reference = [%b, %b, %b]", 3'b001, 3'b000, out_or_bitwise, out_or_logical, out_not, 3'b001, 1'b1, 6'b111110);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 19 passed!");
        end

        // Tick 20: Inputs = 3'b001, 3'b000, Generated = out_or_bitwise, out_or_logical, out_not, Reference = 3'b001, 1'b1, 6'b111110
        a = 3'b001; b = 3'b000; // Set input values
        #period;
        if (!(out_or_bitwise === 3'b001 && out_or_logical === 1'b1 && out_not === 6'b111110)) begin
            $display("Mismatch at index 20: Inputs = [%b, %b], Generated = [%b, %b, %b], Reference = [%b, %b, %b]", 3'b001, 3'b000, out_or_bitwise, out_or_logical, out_not, 3'b001, 1'b1, 6'b111110);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 20 passed!");
        end

        // Tick 21: Inputs = 3'b010, 3'b000, Generated = out_or_bitwise, out_or_logical, out_not, Reference = 3'b010, 1'b1, 6'b111101
        a = 3'b010; b = 3'b000; // Set input values
        #period;
        if (!(out_or_bitwise === 3'b010 && out_or_logical === 1'b1 && out_not === 6'b111101)) begin
            $display("Mismatch at index 21: Inputs = [%b, %b], Generated = [%b, %b, %b], Reference = [%b, %b, %b]", 3'b010, 3'b000, out_or_bitwise, out_or_logical, out_not, 3'b010, 1'b1, 6'b111101);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 21 passed!");
        end

        // Tick 22: Inputs = 3'b010, 3'b000, Generated = out_or_bitwise, out_or_logical, out_not, Reference = 3'b010, 1'b1, 6'b111101
        a = 3'b010; b = 3'b000; // Set input values
        #period;
        if (!(out_or_bitwise === 3'b010 && out_or_logical === 1'b1 && out_not === 6'b111101)) begin
            $display("Mismatch at index 22: Inputs = [%b, %b], Generated = [%b, %b, %b], Reference = [%b, %b, %b]", 3'b010, 3'b000, out_or_bitwise, out_or_logical, out_not, 3'b010, 1'b1, 6'b111101);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 22 passed!");
        end

        // Tick 23: Inputs = 3'b011, 3'b000, Generated = out_or_bitwise, out_or_logical, out_not, Reference = 3'b011, 1'b1, 6'b111100
        a = 3'b011; b = 3'b000; // Set input values
        #period;
        if (!(out_or_bitwise === 3'b011 && out_or_logical === 1'b1 && out_not === 6'b111100)) begin
            $display("Mismatch at index 23: Inputs = [%b, %b], Generated = [%b, %b, %b], Reference = [%b, %b, %b]", 3'b011, 3'b000, out_or_bitwise, out_or_logical, out_not, 3'b011, 1'b1, 6'b111100);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 23 passed!");
        end

        // Tick 24: Inputs = 3'b011, 3'b000, Generated = out_or_bitwise, out_or_logical, out_not, Reference = 3'b011, 1'b1, 6'b111100
        a = 3'b011; b = 3'b000; // Set input values
        #period;
        if (!(out_or_bitwise === 3'b011 && out_or_logical === 1'b1 && out_not === 6'b111100)) begin
            $display("Mismatch at index 24: Inputs = [%b, %b], Generated = [%b, %b, %b], Reference = [%b, %b, %b]", 3'b011, 3'b000, out_or_bitwise, out_or_logical, out_not, 3'b011, 1'b1, 6'b111100);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 24 passed!");
        end

        // Tick 25: Inputs = 3'b100, 3'b000, Generated = out_or_bitwise, out_or_logical, out_not, Reference = 3'b100, 1'b1, 6'b111011
        a = 3'b100; b = 3'b000; // Set input values
        #period;
        if (!(out_or_bitwise === 3'b100 && out_or_logical === 1'b1 && out_not === 6'b111011)) begin
            $display("Mismatch at index 25: Inputs = [%b, %b], Generated = [%b, %b, %b], Reference = [%b, %b, %b]", 3'b100, 3'b000, out_or_bitwise, out_or_logical, out_not, 3'b100, 1'b1, 6'b111011);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 25 passed!");
        end

        // Tick 26: Inputs = 3'b100, 3'b000, Generated = out_or_bitwise, out_or_logical, out_not, Reference = 3'b100, 1'b1, 6'b111011
        a = 3'b100; b = 3'b000; // Set input values
        #period;
        if (!(out_or_bitwise === 3'b100 && out_or_logical === 1'b1 && out_not === 6'b111011)) begin
            $display("Mismatch at index 26: Inputs = [%b, %b], Generated = [%b, %b, %b], Reference = [%b, %b, %b]", 3'b100, 3'b000, out_or_bitwise, out_or_logical, out_not, 3'b100, 1'b1, 6'b111011);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 26 passed!");
        end

        // Tick 27: Inputs = 3'b101, 3'b000, Generated = out_or_bitwise, out_or_logical, out_not, Reference = 3'b101, 1'b1, 6'b111010
        a = 3'b101; b = 3'b000; // Set input values
        #period;
        if (!(out_or_bitwise === 3'b101 && out_or_logical === 1'b1 && out_not === 6'b111010)) begin
            $display("Mismatch at index 27: Inputs = [%b, %b], Generated = [%b, %b, %b], Reference = [%b, %b, %b]", 3'b101, 3'b000, out_or_bitwise, out_or_logical, out_not, 3'b101, 1'b1, 6'b111010);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 27 passed!");
        end

        // Tick 28: Inputs = 3'b101, 3'b000, Generated = out_or_bitwise, out_or_logical, out_not, Reference = 3'b101, 1'b1, 6'b111010
        a = 3'b101; b = 3'b000; // Set input values
        #period;
        if (!(out_or_bitwise === 3'b101 && out_or_logical === 1'b1 && out_not === 6'b111010)) begin
            $display("Mismatch at index 28: Inputs = [%b, %b], Generated = [%b, %b, %b], Reference = [%b, %b, %b]", 3'b101, 3'b000, out_or_bitwise, out_or_logical, out_not, 3'b101, 1'b1, 6'b111010);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 28 passed!");
        end

        // Tick 29: Inputs = 3'b110, 3'b000, Generated = out_or_bitwise, out_or_logical, out_not, Reference = 3'b110, 1'b1, 6'b111001
        a = 3'b110; b = 3'b000; // Set input values
        #period;
        if (!(out_or_bitwise === 3'b110 && out_or_logical === 1'b1 && out_not === 6'b111001)) begin
            $display("Mismatch at index 29: Inputs = [%b, %b], Generated = [%b, %b, %b], Reference = [%b, %b, %b]", 3'b110, 3'b000, out_or_bitwise, out_or_logical, out_not, 3'b110, 1'b1, 6'b111001);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 29 passed!");
        end

        // Tick 30: Inputs = 3'b110, 3'b000, Generated = out_or_bitwise, out_or_logical, out_not, Reference = 3'b110, 1'b1, 6'b111001
        a = 3'b110; b = 3'b000; // Set input values
        #period;
        if (!(out_or_bitwise === 3'b110 && out_or_logical === 1'b1 && out_not === 6'b111001)) begin
            $display("Mismatch at index 30: Inputs = [%b, %b], Generated = [%b, %b, %b], Reference = [%b, %b, %b]", 3'b110, 3'b000, out_or_bitwise, out_or_logical, out_not, 3'b110, 1'b1, 6'b111001);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 30 passed!");
        end

        // Tick 31: Inputs = 3'b111, 3'b000, Generated = out_or_bitwise, out_or_logical, out_not, Reference = 3'b111, 1'b1, 6'b111000
        a = 3'b111; b = 3'b000; // Set input values
        #period;
        if (!(out_or_bitwise === 3'b111 && out_or_logical === 1'b1 && out_not === 6'b111000)) begin
            $display("Mismatch at index 31: Inputs = [%b, %b], Generated = [%b, %b, %b], Reference = [%b, %b, %b]", 3'b111, 3'b000, out_or_bitwise, out_or_logical, out_not, 3'b111, 1'b1, 6'b111000);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 31 passed!");
        end

        // Tick 32: Inputs = 3'b111, 3'b000, Generated = out_or_bitwise, out_or_logical, out_not, Reference = 3'b111, 1'b1, 6'b111000
        a = 3'b111; b = 3'b000; // Set input values
        #period;
        if (!(out_or_bitwise === 3'b111 && out_or_logical === 1'b1 && out_not === 6'b111000)) begin
            $display("Mismatch at index 32: Inputs = [%b, %b], Generated = [%b, %b, %b], Reference = [%b, %b, %b]", 3'b111, 3'b000, out_or_bitwise, out_or_logical, out_not, 3'b111, 1'b1, 6'b111000);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 32 passed!");
        end

        // Tick 33: Inputs = 3'b000, 3'b001, Generated = out_or_bitwise, out_or_logical, out_not, Reference = 3'b001, 1'b1, 6'b110111
        a = 3'b000; b = 3'b001; // Set input values
        #period;
        if (!(out_or_bitwise === 3'b001 && out_or_logical === 1'b1 && out_not === 6'b110111)) begin
            $display("Mismatch at index 33: Inputs = [%b, %b], Generated = [%b, %b, %b], Reference = [%b, %b, %b]", 3'b000, 3'b001, out_or_bitwise, out_or_logical, out_not, 3'b001, 1'b1, 6'b110111);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 33 passed!");
        end

        // Tick 34: Inputs = 3'b000, 3'b001, Generated = out_or_bitwise, out_or_logical, out_not, Reference = 3'b001, 1'b1, 6'b110111
        a = 3'b000; b = 3'b001; // Set input values
        #period;
        if (!(out_or_bitwise === 3'b001 && out_or_logical === 1'b1 && out_not === 6'b110111)) begin
            $display("Mismatch at index 34: Inputs = [%b, %b], Generated = [%b, %b, %b], Reference = [%b, %b, %b]", 3'b000, 3'b001, out_or_bitwise, out_or_logical, out_not, 3'b001, 1'b1, 6'b110111);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 34 passed!");
        end

        // Tick 35: Inputs = 3'b001, 3'b001, Generated = out_or_bitwise, out_or_logical, out_not, Reference = 3'b001, 1'b1, 6'b110110
        a = 3'b001; b = 3'b001; // Set input values
        #period;
        if (!(out_or_bitwise === 3'b001 && out_or_logical === 1'b1 && out_not === 6'b110110)) begin
            $display("Mismatch at index 35: Inputs = [%b, %b], Generated = [%b, %b, %b], Reference = [%b, %b, %b]", 3'b001, 3'b001, out_or_bitwise, out_or_logical, out_not, 3'b001, 1'b1, 6'b110110);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 35 passed!");
        end

        // Tick 36: Inputs = 3'b001, 3'b001, Generated = out_or_bitwise, out_or_logical, out_not, Reference = 3'b001, 1'b1, 6'b110110
        a = 3'b001; b = 3'b001; // Set input values
        #period;
        if (!(out_or_bitwise === 3'b001 && out_or_logical === 1'b1 && out_not === 6'b110110)) begin
            $display("Mismatch at index 36: Inputs = [%b, %b], Generated = [%b, %b, %b], Reference = [%b, %b, %b]", 3'b001, 3'b001, out_or_bitwise, out_or_logical, out_not, 3'b001, 1'b1, 6'b110110);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 36 passed!");
        end

        // Tick 37: Inputs = 3'b010, 3'b001, Generated = out_or_bitwise, out_or_logical, out_not, Reference = 3'b011, 1'b1, 6'b110101
        a = 3'b010; b = 3'b001; // Set input values
        #period;
        if (!(out_or_bitwise === 3'b011 && out_or_logical === 1'b1 && out_not === 6'b110101)) begin
            $display("Mismatch at index 37: Inputs = [%b, %b], Generated = [%b, %b, %b], Reference = [%b, %b, %b]", 3'b010, 3'b001, out_or_bitwise, out_or_logical, out_not, 3'b011, 1'b1, 6'b110101);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 37 passed!");
        end

        // Tick 38: Inputs = 3'b010, 3'b001, Generated = out_or_bitwise, out_or_logical, out_not, Reference = 3'b011, 1'b1, 6'b110101
        a = 3'b010; b = 3'b001; // Set input values
        #period;
        if (!(out_or_bitwise === 3'b011 && out_or_logical === 1'b1 && out_not === 6'b110101)) begin
            $display("Mismatch at index 38: Inputs = [%b, %b], Generated = [%b, %b, %b], Reference = [%b, %b, %b]", 3'b010, 3'b001, out_or_bitwise, out_or_logical, out_not, 3'b011, 1'b1, 6'b110101);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 38 passed!");
        end

        // Tick 39: Inputs = 3'b011, 3'b001, Generated = out_or_bitwise, out_or_logical, out_not, Reference = 3'b011, 1'b1, 6'b110100
        a = 3'b011; b = 3'b001; // Set input values
        #period;
        if (!(out_or_bitwise === 3'b011 && out_or_logical === 1'b1 && out_not === 6'b110100)) begin
            $display("Mismatch at index 39: Inputs = [%b, %b], Generated = [%b, %b, %b], Reference = [%b, %b, %b]", 3'b011, 3'b001, out_or_bitwise, out_or_logical, out_not, 3'b011, 1'b1, 6'b110100);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 39 passed!");
        end

        // Tick 40: Inputs = 3'b011, 3'b001, Generated = out_or_bitwise, out_or_logical, out_not, Reference = 3'b011, 1'b1, 6'b110100
        a = 3'b011; b = 3'b001; // Set input values
        #period;
        if (!(out_or_bitwise === 3'b011 && out_or_logical === 1'b1 && out_not === 6'b110100)) begin
            $display("Mismatch at index 40: Inputs = [%b, %b], Generated = [%b, %b, %b], Reference = [%b, %b, %b]", 3'b011, 3'b001, out_or_bitwise, out_or_logical, out_not, 3'b011, 1'b1, 6'b110100);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 40 passed!");
        end

        // Tick 41: Inputs = 3'b100, 3'b001, Generated = out_or_bitwise, out_or_logical, out_not, Reference = 3'b101, 1'b1, 6'b110011
        a = 3'b100; b = 3'b001; // Set input values
        #period;
        if (!(out_or_bitwise === 3'b101 && out_or_logical === 1'b1 && out_not === 6'b110011)) begin
            $display("Mismatch at index 41: Inputs = [%b, %b], Generated = [%b, %b, %b], Reference = [%b, %b, %b]", 3'b100, 3'b001, out_or_bitwise, out_or_logical, out_not, 3'b101, 1'b1, 6'b110011);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 41 passed!");
        end

        // Tick 42: Inputs = 3'b100, 3'b001, Generated = out_or_bitwise, out_or_logical, out_not, Reference = 3'b101, 1'b1, 6'b110011
        a = 3'b100; b = 3'b001; // Set input values
        #period;
        if (!(out_or_bitwise === 3'b101 && out_or_logical === 1'b1 && out_not === 6'b110011)) begin
            $display("Mismatch at index 42: Inputs = [%b, %b], Generated = [%b, %b, %b], Reference = [%b, %b, %b]", 3'b100, 3'b001, out_or_bitwise, out_or_logical, out_not, 3'b101, 1'b1, 6'b110011);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 42 passed!");
        end

        // Tick 43: Inputs = 3'b101, 3'b001, Generated = out_or_bitwise, out_or_logical, out_not, Reference = 3'b101, 1'b1, 6'b110010
        a = 3'b101; b = 3'b001; // Set input values
        #period;
        if (!(out_or_bitwise === 3'b101 && out_or_logical === 1'b1 && out_not === 6'b110010)) begin
            $display("Mismatch at index 43: Inputs = [%b, %b], Generated = [%b, %b, %b], Reference = [%b, %b, %b]", 3'b101, 3'b001, out_or_bitwise, out_or_logical, out_not, 3'b101, 1'b1, 6'b110010);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 43 passed!");
        end

        // Tick 44: Inputs = 3'b101, 3'b001, Generated = out_or_bitwise, out_or_logical, out_not, Reference = 3'b101, 1'b1, 6'b110010
        a = 3'b101; b = 3'b001; // Set input values
        #period;
        if (!(out_or_bitwise === 3'b101 && out_or_logical === 1'b1 && out_not === 6'b110010)) begin
            $display("Mismatch at index 44: Inputs = [%b, %b], Generated = [%b, %b, %b], Reference = [%b, %b, %b]", 3'b101, 3'b001, out_or_bitwise, out_or_logical, out_not, 3'b101, 1'b1, 6'b110010);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 44 passed!");
        end

        // Tick 45: Inputs = 3'b110, 3'b001, Generated = out_or_bitwise, out_or_logical, out_not, Reference = 3'b111, 1'b1, 6'b110001
        a = 3'b110; b = 3'b001; // Set input values
        #period;
        if (!(out_or_bitwise === 3'b111 && out_or_logical === 1'b1 && out_not === 6'b110001)) begin
            $display("Mismatch at index 45: Inputs = [%b, %b], Generated = [%b, %b, %b], Reference = [%b, %b, %b]", 3'b110, 3'b001, out_or_bitwise, out_or_logical, out_not, 3'b111, 1'b1, 6'b110001);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 45 passed!");
        end

        // Tick 46: Inputs = 3'b110, 3'b001, Generated = out_or_bitwise, out_or_logical, out_not, Reference = 3'b111, 1'b1, 6'b110001
        a = 3'b110; b = 3'b001; // Set input values
        #period;
        if (!(out_or_bitwise === 3'b111 && out_or_logical === 1'b1 && out_not === 6'b110001)) begin
            $display("Mismatch at index 46: Inputs = [%b, %b], Generated = [%b, %b, %b], Reference = [%b, %b, %b]", 3'b110, 3'b001, out_or_bitwise, out_or_logical, out_not, 3'b111, 1'b1, 6'b110001);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 46 passed!");
        end

        // Tick 47: Inputs = 3'b111, 3'b001, Generated = out_or_bitwise, out_or_logical, out_not, Reference = 3'b111, 1'b1, 6'b110000
        a = 3'b111; b = 3'b001; // Set input values
        #period;
        if (!(out_or_bitwise === 3'b111 && out_or_logical === 1'b1 && out_not === 6'b110000)) begin
            $display("Mismatch at index 47: Inputs = [%b, %b], Generated = [%b, %b, %b], Reference = [%b, %b, %b]", 3'b111, 3'b001, out_or_bitwise, out_or_logical, out_not, 3'b111, 1'b1, 6'b110000);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 47 passed!");
        end

        // Tick 48: Inputs = 3'b111, 3'b001, Generated = out_or_bitwise, out_or_logical, out_not, Reference = 3'b111, 1'b1, 6'b110000
        a = 3'b111; b = 3'b001; // Set input values
        #period;
        if (!(out_or_bitwise === 3'b111 && out_or_logical === 1'b1 && out_not === 6'b110000)) begin
            $display("Mismatch at index 48: Inputs = [%b, %b], Generated = [%b, %b, %b], Reference = [%b, %b, %b]", 3'b111, 3'b001, out_or_bitwise, out_or_logical, out_not, 3'b111, 1'b1, 6'b110000);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 48 passed!");
        end

        // Tick 49: Inputs = 3'b000, 3'b010, Generated = out_or_bitwise, out_or_logical, out_not, Reference = 3'b010, 1'b1, 6'b101111
        a = 3'b000; b = 3'b010; // Set input values
        #period;
        if (!(out_or_bitwise === 3'b010 && out_or_logical === 1'b1 && out_not === 6'b101111)) begin
            $display("Mismatch at index 49: Inputs = [%b, %b], Generated = [%b, %b, %b], Reference = [%b, %b, %b]", 3'b000, 3'b010, out_or_bitwise, out_or_logical, out_not, 3'b010, 1'b1, 6'b101111);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 49 passed!");
        end

        // Tick 50: Inputs = 3'b000, 3'b010, Generated = out_or_bitwise, out_or_logical, out_not, Reference = 3'b010, 1'b1, 6'b101111
        a = 3'b000; b = 3'b010; // Set input values
        #period;
        if (!(out_or_bitwise === 3'b010 && out_or_logical === 1'b1 && out_not === 6'b101111)) begin
            $display("Mismatch at index 50: Inputs = [%b, %b], Generated = [%b, %b, %b], Reference = [%b, %b, %b]", 3'b000, 3'b010, out_or_bitwise, out_or_logical, out_not, 3'b010, 1'b1, 6'b101111);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 50 passed!");
        end

        // Tick 51: Inputs = 3'b001, 3'b010, Generated = out_or_bitwise, out_or_logical, out_not, Reference = 3'b011, 1'b1, 6'b101110
        a = 3'b001; b = 3'b010; // Set input values
        #period;
        if (!(out_or_bitwise === 3'b011 && out_or_logical === 1'b1 && out_not === 6'b101110)) begin
            $display("Mismatch at index 51: Inputs = [%b, %b], Generated = [%b, %b, %b], Reference = [%b, %b, %b]", 3'b001, 3'b010, out_or_bitwise, out_or_logical, out_not, 3'b011, 1'b1, 6'b101110);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 51 passed!");
        end

        // Tick 52: Inputs = 3'b001, 3'b010, Generated = out_or_bitwise, out_or_logical, out_not, Reference = 3'b011, 1'b1, 6'b101110
        a = 3'b001; b = 3'b010; // Set input values
        #period;
        if (!(out_or_bitwise === 3'b011 && out_or_logical === 1'b1 && out_not === 6'b101110)) begin
            $display("Mismatch at index 52: Inputs = [%b, %b], Generated = [%b, %b, %b], Reference = [%b, %b, %b]", 3'b001, 3'b010, out_or_bitwise, out_or_logical, out_not, 3'b011, 1'b1, 6'b101110);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 52 passed!");
        end

        // Tick 53: Inputs = 3'b010, 3'b010, Generated = out_or_bitwise, out_or_logical, out_not, Reference = 3'b010, 1'b1, 6'b101101
        a = 3'b010; b = 3'b010; // Set input values
        #period;
        if (!(out_or_bitwise === 3'b010 && out_or_logical === 1'b1 && out_not === 6'b101101)) begin
            $display("Mismatch at index 53: Inputs = [%b, %b], Generated = [%b, %b, %b], Reference = [%b, %b, %b]", 3'b010, 3'b010, out_or_bitwise, out_or_logical, out_not, 3'b010, 1'b1, 6'b101101);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 53 passed!");
        end

        // Tick 54: Inputs = 3'b010, 3'b010, Generated = out_or_bitwise, out_or_logical, out_not, Reference = 3'b010, 1'b1, 6'b101101
        a = 3'b010; b = 3'b010; // Set input values
        #period;
        if (!(out_or_bitwise === 3'b010 && out_or_logical === 1'b1 && out_not === 6'b101101)) begin
            $display("Mismatch at index 54: Inputs = [%b, %b], Generated = [%b, %b, %b], Reference = [%b, %b, %b]", 3'b010, 3'b010, out_or_bitwise, out_or_logical, out_not, 3'b010, 1'b1, 6'b101101);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 54 passed!");
        end

        // Tick 55: Inputs = 3'b011, 3'b010, Generated = out_or_bitwise, out_or_logical, out_not, Reference = 3'b011, 1'b1, 6'b101100
        a = 3'b011; b = 3'b010; // Set input values
        #period;
        if (!(out_or_bitwise === 3'b011 && out_or_logical === 1'b1 && out_not === 6'b101100)) begin
            $display("Mismatch at index 55: Inputs = [%b, %b], Generated = [%b, %b, %b], Reference = [%b, %b, %b]", 3'b011, 3'b010, out_or_bitwise, out_or_logical, out_not, 3'b011, 1'b1, 6'b101100);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 55 passed!");
        end

        // Tick 56: Inputs = 3'b011, 3'b010, Generated = out_or_bitwise, out_or_logical, out_not, Reference = 3'b011, 1'b1, 6'b101100
        a = 3'b011; b = 3'b010; // Set input values
        #period;
        if (!(out_or_bitwise === 3'b011 && out_or_logical === 1'b1 && out_not === 6'b101100)) begin
            $display("Mismatch at index 56: Inputs = [%b, %b], Generated = [%b, %b, %b], Reference = [%b, %b, %b]", 3'b011, 3'b010, out_or_bitwise, out_or_logical, out_not, 3'b011, 1'b1, 6'b101100);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 56 passed!");
        end

        // Tick 57: Inputs = 3'b100, 3'b010, Generated = out_or_bitwise, out_or_logical, out_not, Reference = 3'b110, 1'b1, 6'b101011
        a = 3'b100; b = 3'b010; // Set input values
        #period;
        if (!(out_or_bitwise === 3'b110 && out_or_logical === 1'b1 && out_not === 6'b101011)) begin
            $display("Mismatch at index 57: Inputs = [%b, %b], Generated = [%b, %b, %b], Reference = [%b, %b, %b]", 3'b100, 3'b010, out_or_bitwise, out_or_logical, out_not, 3'b110, 1'b1, 6'b101011);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 57 passed!");
        end

        // Tick 58: Inputs = 3'b100, 3'b010, Generated = out_or_bitwise, out_or_logical, out_not, Reference = 3'b110, 1'b1, 6'b101011
        a = 3'b100; b = 3'b010; // Set input values
        #period;
        if (!(out_or_bitwise === 3'b110 && out_or_logical === 1'b1 && out_not === 6'b101011)) begin
            $display("Mismatch at index 58: Inputs = [%b, %b], Generated = [%b, %b, %b], Reference = [%b, %b, %b]", 3'b100, 3'b010, out_or_bitwise, out_or_logical, out_not, 3'b110, 1'b1, 6'b101011);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 58 passed!");
        end

        if (mismatch_count == 0)
            $display("All tests passed!");
        else
            $display("%0d mismatches out of %0d total tests.", mismatch_count, 59);
        $finish;
    end

endmodule