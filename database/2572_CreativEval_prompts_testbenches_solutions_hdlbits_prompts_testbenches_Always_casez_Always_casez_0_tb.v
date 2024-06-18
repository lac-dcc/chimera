// This program was cloned from: https://github.com/matthewdelorenzo/CreativEval
// License: BSD 3-Clause "New" or "Revised" License

`timescale 1 ns/10 ps  // time-unit = 1 ns, precision = 10 ps

module top_module_tb;

    // duration for each bit = 20 * timescale = 20 * 1 ns  = 20ns
    localparam period = 20;

    reg [7:0] in;

    wire [2:0] pos;


    integer mismatch_count;

    top_module UUT (.in(in), .pos(pos));

    initial begin
        mismatch_count = 0;

        // Tick 0: Inputs = 8'b0000000x, Generated = pos, Reference = 3'b00x
        in = 8'b0000000x; // Set input values
        #period;
        // Tick 1: Inputs = 8'b00000001, Generated = pos, Reference = 3'b000
        in = 8'b00000001; // Set input values
        #period;
        if (!(pos === 3'b000)) begin
            $display("Mismatch at index 1: Inputs = [%b], Generated = [%b], Reference = [%b]", 8'b00000001, pos, 3'b000);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 1 passed!");
        end

        // Tick 2: Inputs = 8'b00000001, Generated = pos, Reference = 3'b000
        in = 8'b00000001; // Set input values
        #period;
        if (!(pos === 3'b000)) begin
            $display("Mismatch at index 2: Inputs = [%b], Generated = [%b], Reference = [%b]", 8'b00000001, pos, 3'b000);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 2 passed!");
        end

        // Tick 3: Inputs = 8'b00000010, Generated = pos, Reference = 3'b001
        in = 8'b00000010; // Set input values
        #period;
        if (!(pos === 3'b001)) begin
            $display("Mismatch at index 3: Inputs = [%b], Generated = [%b], Reference = [%b]", 8'b00000010, pos, 3'b001);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 3 passed!");
        end

        // Tick 4: Inputs = 8'b00000010, Generated = pos, Reference = 3'b001
        in = 8'b00000010; // Set input values
        #period;
        if (!(pos === 3'b001)) begin
            $display("Mismatch at index 4: Inputs = [%b], Generated = [%b], Reference = [%b]", 8'b00000010, pos, 3'b001);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 4 passed!");
        end

        // Tick 5: Inputs = 8'b00000100, Generated = pos, Reference = 3'b010
        in = 8'b00000100; // Set input values
        #period;
        if (!(pos === 3'b010)) begin
            $display("Mismatch at index 5: Inputs = [%b], Generated = [%b], Reference = [%b]", 8'b00000100, pos, 3'b010);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 5 passed!");
        end

        // Tick 6: Inputs = 8'b00000100, Generated = pos, Reference = 3'b010
        in = 8'b00000100; // Set input values
        #period;
        if (!(pos === 3'b010)) begin
            $display("Mismatch at index 6: Inputs = [%b], Generated = [%b], Reference = [%b]", 8'b00000100, pos, 3'b010);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 6 passed!");
        end

        // Tick 7: Inputs = 8'b00001000, Generated = pos, Reference = 3'b011
        in = 8'b00001000; // Set input values
        #period;
        if (!(pos === 3'b011)) begin
            $display("Mismatch at index 7: Inputs = [%b], Generated = [%b], Reference = [%b]", 8'b00001000, pos, 3'b011);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 7 passed!");
        end

        // Tick 8: Inputs = 8'b00001000, Generated = pos, Reference = 3'b011
        in = 8'b00001000; // Set input values
        #period;
        if (!(pos === 3'b011)) begin
            $display("Mismatch at index 8: Inputs = [%b], Generated = [%b], Reference = [%b]", 8'b00001000, pos, 3'b011);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 8 passed!");
        end

        // Tick 9: Inputs = 8'b00010000, Generated = pos, Reference = 3'b100
        in = 8'b00010000; // Set input values
        #period;
        if (!(pos === 3'b100)) begin
            $display("Mismatch at index 9: Inputs = [%b], Generated = [%b], Reference = [%b]", 8'b00010000, pos, 3'b100);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 9 passed!");
        end

        // Tick 10: Inputs = 8'b00010000, Generated = pos, Reference = 3'b100
        in = 8'b00010000; // Set input values
        #period;
        if (!(pos === 3'b100)) begin
            $display("Mismatch at index 10: Inputs = [%b], Generated = [%b], Reference = [%b]", 8'b00010000, pos, 3'b100);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 10 passed!");
        end

        // Tick 11: Inputs = 8'b00100000, Generated = pos, Reference = 3'b101
        in = 8'b00100000; // Set input values
        #period;
        if (!(pos === 3'b101)) begin
            $display("Mismatch at index 11: Inputs = [%b], Generated = [%b], Reference = [%b]", 8'b00100000, pos, 3'b101);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 11 passed!");
        end

        // Tick 12: Inputs = 8'b00100000, Generated = pos, Reference = 3'b101
        in = 8'b00100000; // Set input values
        #period;
        if (!(pos === 3'b101)) begin
            $display("Mismatch at index 12: Inputs = [%b], Generated = [%b], Reference = [%b]", 8'b00100000, pos, 3'b101);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 12 passed!");
        end

        // Tick 13: Inputs = 8'b01000000, Generated = pos, Reference = 3'b110
        in = 8'b01000000; // Set input values
        #period;
        if (!(pos === 3'b110)) begin
            $display("Mismatch at index 13: Inputs = [%b], Generated = [%b], Reference = [%b]", 8'b01000000, pos, 3'b110);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 13 passed!");
        end

        // Tick 14: Inputs = 8'b01000000, Generated = pos, Reference = 3'b110
        in = 8'b01000000; // Set input values
        #period;
        if (!(pos === 3'b110)) begin
            $display("Mismatch at index 14: Inputs = [%b], Generated = [%b], Reference = [%b]", 8'b01000000, pos, 3'b110);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 14 passed!");
        end

        // Tick 15: Inputs = 8'b10000000, Generated = pos, Reference = 3'b111
        in = 8'b10000000; // Set input values
        #period;
        if (!(pos === 3'b111)) begin
            $display("Mismatch at index 15: Inputs = [%b], Generated = [%b], Reference = [%b]", 8'b10000000, pos, 3'b111);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 15 passed!");
        end

        // Tick 16: Inputs = 8'b10000000, Generated = pos, Reference = 3'b111
        in = 8'b10000000; // Set input values
        #period;
        if (!(pos === 3'b111)) begin
            $display("Mismatch at index 16: Inputs = [%b], Generated = [%b], Reference = [%b]", 8'b10000000, pos, 3'b111);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 16 passed!");
        end

        // Tick 17: Inputs = 8'b00010000, Generated = pos, Reference = 3'b100
        in = 8'b00010000; // Set input values
        #period;
        if (!(pos === 3'b100)) begin
            $display("Mismatch at index 17: Inputs = [%b], Generated = [%b], Reference = [%b]", 8'b00010000, pos, 3'b100);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 17 passed!");
        end

        // Tick 18: Inputs = 8'b00010000, Generated = pos, Reference = 3'b100
        in = 8'b00010000; // Set input values
        #period;
        if (!(pos === 3'b100)) begin
            $display("Mismatch at index 18: Inputs = [%b], Generated = [%b], Reference = [%b]", 8'b00010000, pos, 3'b100);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 18 passed!");
        end

        // Tick 19: Inputs = 8'b00010001, Generated = pos, Reference = 3'b000
        in = 8'b00010001; // Set input values
        #period;
        if (!(pos === 3'b000)) begin
            $display("Mismatch at index 19: Inputs = [%b], Generated = [%b], Reference = [%b]", 8'b00010001, pos, 3'b000);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 19 passed!");
        end

        // Tick 20: Inputs = 8'b00010001, Generated = pos, Reference = 3'b000
        in = 8'b00010001; // Set input values
        #period;
        if (!(pos === 3'b000)) begin
            $display("Mismatch at index 20: Inputs = [%b], Generated = [%b], Reference = [%b]", 8'b00010001, pos, 3'b000);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 20 passed!");
        end

        // Tick 21: Inputs = 8'b00010010, Generated = pos, Reference = 3'b001
        in = 8'b00010010; // Set input values
        #period;
        if (!(pos === 3'b001)) begin
            $display("Mismatch at index 21: Inputs = [%b], Generated = [%b], Reference = [%b]", 8'b00010010, pos, 3'b001);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 21 passed!");
        end

        // Tick 22: Inputs = 8'b00010010, Generated = pos, Reference = 3'b001
        in = 8'b00010010; // Set input values
        #period;
        if (!(pos === 3'b001)) begin
            $display("Mismatch at index 22: Inputs = [%b], Generated = [%b], Reference = [%b]", 8'b00010010, pos, 3'b001);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 22 passed!");
        end

        // Tick 23: Inputs = 8'b00010011, Generated = pos, Reference = 3'b000
        in = 8'b00010011; // Set input values
        #period;
        if (!(pos === 3'b000)) begin
            $display("Mismatch at index 23: Inputs = [%b], Generated = [%b], Reference = [%b]", 8'b00010011, pos, 3'b000);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 23 passed!");
        end

        // Tick 24: Inputs = 8'b00010011, Generated = pos, Reference = 3'b000
        in = 8'b00010011; // Set input values
        #period;
        if (!(pos === 3'b000)) begin
            $display("Mismatch at index 24: Inputs = [%b], Generated = [%b], Reference = [%b]", 8'b00010011, pos, 3'b000);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 24 passed!");
        end

        // Tick 25: Inputs = 8'b00010100, Generated = pos, Reference = 3'b010
        in = 8'b00010100; // Set input values
        #period;
        if (!(pos === 3'b010)) begin
            $display("Mismatch at index 25: Inputs = [%b], Generated = [%b], Reference = [%b]", 8'b00010100, pos, 3'b010);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 25 passed!");
        end

        // Tick 26: Inputs = 8'b00010100, Generated = pos, Reference = 3'b010
        in = 8'b00010100; // Set input values
        #period;
        if (!(pos === 3'b010)) begin
            $display("Mismatch at index 26: Inputs = [%b], Generated = [%b], Reference = [%b]", 8'b00010100, pos, 3'b010);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 26 passed!");
        end

        // Tick 27: Inputs = 8'b00010101, Generated = pos, Reference = 3'b000
        in = 8'b00010101; // Set input values
        #period;
        if (!(pos === 3'b000)) begin
            $display("Mismatch at index 27: Inputs = [%b], Generated = [%b], Reference = [%b]", 8'b00010101, pos, 3'b000);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 27 passed!");
        end

        // Tick 28: Inputs = 8'b00010101, Generated = pos, Reference = 3'b000
        in = 8'b00010101; // Set input values
        #period;
        if (!(pos === 3'b000)) begin
            $display("Mismatch at index 28: Inputs = [%b], Generated = [%b], Reference = [%b]", 8'b00010101, pos, 3'b000);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 28 passed!");
        end

        // Tick 29: Inputs = 8'b00010110, Generated = pos, Reference = 3'b001
        in = 8'b00010110; // Set input values
        #period;
        if (!(pos === 3'b001)) begin
            $display("Mismatch at index 29: Inputs = [%b], Generated = [%b], Reference = [%b]", 8'b00010110, pos, 3'b001);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 29 passed!");
        end

        // Tick 30: Inputs = 8'b00010110, Generated = pos, Reference = 3'b001
        in = 8'b00010110; // Set input values
        #period;
        if (!(pos === 3'b001)) begin
            $display("Mismatch at index 30: Inputs = [%b], Generated = [%b], Reference = [%b]", 8'b00010110, pos, 3'b001);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 30 passed!");
        end

        // Tick 31: Inputs = 8'b00010111, Generated = pos, Reference = 3'b000
        in = 8'b00010111; // Set input values
        #period;
        if (!(pos === 3'b000)) begin
            $display("Mismatch at index 31: Inputs = [%b], Generated = [%b], Reference = [%b]", 8'b00010111, pos, 3'b000);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 31 passed!");
        end

        // Tick 32: Inputs = 8'b00010111, Generated = pos, Reference = 3'b000
        in = 8'b00010111; // Set input values
        #period;
        if (!(pos === 3'b000)) begin
            $display("Mismatch at index 32: Inputs = [%b], Generated = [%b], Reference = [%b]", 8'b00010111, pos, 3'b000);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 32 passed!");
        end

        // Tick 33: Inputs = 8'b00011000, Generated = pos, Reference = 3'b011
        in = 8'b00011000; // Set input values
        #period;
        if (!(pos === 3'b011)) begin
            $display("Mismatch at index 33: Inputs = [%b], Generated = [%b], Reference = [%b]", 8'b00011000, pos, 3'b011);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 33 passed!");
        end

        if (mismatch_count == 0)
            $display("All tests passed!");
        else
            $display("%0d mismatches out of %0d total tests.", mismatch_count, 34);
        $finish;
    end

endmodule