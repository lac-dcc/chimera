// This program was cloned from: https://github.com/matthewdelorenzo/CreativEval
// License: BSD 3-Clause "New" or "Revised" License

`timescale 1 ns/10 ps  // time-unit = 1 ns, precision = 10 ps

module top_module_tb;

    // duration for each bit = 20 * timescale = 20 * 1 ns  = 20ns
    localparam period = 20;

    reg [15:0] scancode;

    wire left;
    wire down;
    wire right;
    wire up;


    integer mismatch_count;

    top_module UUT (.scancode(scancode), .left(left), .down(down), .right(right), .up(up));

    initial begin
        mismatch_count = 0;

        // Tick 0: Inputs = 16'b000000000000000x, Generated = left, down, right, up, Reference = 1'bx, 1'bx, 1'bx, 1'bx
        scancode = 16'b000000000000000x; // Set input values
        #period;
        // Tick 1: Inputs = 16'b0000000000000000, Generated = left, down, right, up, Reference = 1'b0, 1'b0, 1'b0, 1'b0
        scancode = 16'b0000000000000000; // Set input values
        #period;
        if (!(left === 1'b0 && down === 1'b0 && right === 1'b0 && up === 1'b0)) begin
            $display("Mismatch at index 1: Inputs = [%b], Generated = [%b, %b, %b, %b], Reference = [%b, %b, %b, %b]", 16'b0000000000000000, left, down, right, up, 1'b0, 1'b0, 1'b0, 1'b0);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 1 passed!");
        end

        // Tick 2: Inputs = 16'b0000000000000000, Generated = left, down, right, up, Reference = 1'b0, 1'b0, 1'b0, 1'b0
        scancode = 16'b0000000000000000; // Set input values
        #period;
        if (!(left === 1'b0 && down === 1'b0 && right === 1'b0 && up === 1'b0)) begin
            $display("Mismatch at index 2: Inputs = [%b], Generated = [%b, %b, %b, %b], Reference = [%b, %b, %b, %b]", 16'b0000000000000000, left, down, right, up, 1'b0, 1'b0, 1'b0, 1'b0);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 2 passed!");
        end

        // Tick 3: Inputs = 16'b0000000000000001, Generated = left, down, right, up, Reference = 1'b0, 1'b0, 1'b0, 1'b0
        scancode = 16'b0000000000000001; // Set input values
        #period;
        if (!(left === 1'b0 && down === 1'b0 && right === 1'b0 && up === 1'b0)) begin
            $display("Mismatch at index 3: Inputs = [%b], Generated = [%b, %b, %b, %b], Reference = [%b, %b, %b, %b]", 16'b0000000000000001, left, down, right, up, 1'b0, 1'b0, 1'b0, 1'b0);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 3 passed!");
        end

        // Tick 4: Inputs = 16'b0000000000000001, Generated = left, down, right, up, Reference = 1'b0, 1'b0, 1'b0, 1'b0
        scancode = 16'b0000000000000001; // Set input values
        #period;
        if (!(left === 1'b0 && down === 1'b0 && right === 1'b0 && up === 1'b0)) begin
            $display("Mismatch at index 4: Inputs = [%b], Generated = [%b, %b, %b, %b], Reference = [%b, %b, %b, %b]", 16'b0000000000000001, left, down, right, up, 1'b0, 1'b0, 1'b0, 1'b0);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 4 passed!");
        end

        // Tick 5: Inputs = 16'b1110000001110101, Generated = left, down, right, up, Reference = 1'b0, 1'b0, 1'b0, 1'b1
        scancode = 16'b1110000001110101; // Set input values
        #period;
        if (!(left === 1'b0 && down === 1'b0 && right === 1'b0 && up === 1'b1)) begin
            $display("Mismatch at index 5: Inputs = [%b], Generated = [%b, %b, %b, %b], Reference = [%b, %b, %b, %b]", 16'b1110000001110101, left, down, right, up, 1'b0, 1'b0, 1'b0, 1'b1);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 5 passed!");
        end

        // Tick 6: Inputs = 16'b1110000001110101, Generated = left, down, right, up, Reference = 1'b0, 1'b0, 1'b0, 1'b1
        scancode = 16'b1110000001110101; // Set input values
        #period;
        if (!(left === 1'b0 && down === 1'b0 && right === 1'b0 && up === 1'b1)) begin
            $display("Mismatch at index 6: Inputs = [%b], Generated = [%b, %b, %b, %b], Reference = [%b, %b, %b, %b]", 16'b1110000001110101, left, down, right, up, 1'b0, 1'b0, 1'b0, 1'b1);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 6 passed!");
        end

        // Tick 7: Inputs = 16'b1110000001101011, Generated = left, down, right, up, Reference = 1'b1, 1'b0, 1'b0, 1'b0
        scancode = 16'b1110000001101011; // Set input values
        #period;
        if (!(left === 1'b1 && down === 1'b0 && right === 1'b0 && up === 1'b0)) begin
            $display("Mismatch at index 7: Inputs = [%b], Generated = [%b, %b, %b, %b], Reference = [%b, %b, %b, %b]", 16'b1110000001101011, left, down, right, up, 1'b1, 1'b0, 1'b0, 1'b0);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 7 passed!");
        end

        // Tick 8: Inputs = 16'b1110000001101011, Generated = left, down, right, up, Reference = 1'b1, 1'b0, 1'b0, 1'b0
        scancode = 16'b1110000001101011; // Set input values
        #period;
        if (!(left === 1'b1 && down === 1'b0 && right === 1'b0 && up === 1'b0)) begin
            $display("Mismatch at index 8: Inputs = [%b], Generated = [%b, %b, %b, %b], Reference = [%b, %b, %b, %b]", 16'b1110000001101011, left, down, right, up, 1'b1, 1'b0, 1'b0, 1'b0);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 8 passed!");
        end

        // Tick 9: Inputs = 16'b1110000001101100, Generated = left, down, right, up, Reference = 1'b0, 1'b0, 1'b0, 1'b0
        scancode = 16'b1110000001101100; // Set input values
        #period;
        if (!(left === 1'b0 && down === 1'b0 && right === 1'b0 && up === 1'b0)) begin
            $display("Mismatch at index 9: Inputs = [%b], Generated = [%b, %b, %b, %b], Reference = [%b, %b, %b, %b]", 16'b1110000001101100, left, down, right, up, 1'b0, 1'b0, 1'b0, 1'b0);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 9 passed!");
        end

        // Tick 10: Inputs = 16'b1110000001101100, Generated = left, down, right, up, Reference = 1'b0, 1'b0, 1'b0, 1'b0
        scancode = 16'b1110000001101100; // Set input values
        #period;
        if (!(left === 1'b0 && down === 1'b0 && right === 1'b0 && up === 1'b0)) begin
            $display("Mismatch at index 10: Inputs = [%b], Generated = [%b, %b, %b, %b], Reference = [%b, %b, %b, %b]", 16'b1110000001101100, left, down, right, up, 1'b0, 1'b0, 1'b0, 1'b0);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 10 passed!");
        end

        // Tick 11: Inputs = 16'b1110000001110010, Generated = left, down, right, up, Reference = 1'b0, 1'b1, 1'b0, 1'b0
        scancode = 16'b1110000001110010; // Set input values
        #period;
        if (!(left === 1'b0 && down === 1'b1 && right === 1'b0 && up === 1'b0)) begin
            $display("Mismatch at index 11: Inputs = [%b], Generated = [%b, %b, %b, %b], Reference = [%b, %b, %b, %b]", 16'b1110000001110010, left, down, right, up, 1'b0, 1'b1, 1'b0, 1'b0);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 11 passed!");
        end

        // Tick 12: Inputs = 16'b1110000001110010, Generated = left, down, right, up, Reference = 1'b0, 1'b1, 1'b0, 1'b0
        scancode = 16'b1110000001110010; // Set input values
        #period;
        if (!(left === 1'b0 && down === 1'b1 && right === 1'b0 && up === 1'b0)) begin
            $display("Mismatch at index 12: Inputs = [%b], Generated = [%b, %b, %b, %b], Reference = [%b, %b, %b, %b]", 16'b1110000001110010, left, down, right, up, 1'b0, 1'b1, 1'b0, 1'b0);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 12 passed!");
        end

        // Tick 13: Inputs = 16'b1110000001110100, Generated = left, down, right, up, Reference = 1'b0, 1'b0, 1'b1, 1'b0
        scancode = 16'b1110000001110100; // Set input values
        #period;
        if (!(left === 1'b0 && down === 1'b0 && right === 1'b1 && up === 1'b0)) begin
            $display("Mismatch at index 13: Inputs = [%b], Generated = [%b, %b, %b, %b], Reference = [%b, %b, %b, %b]", 16'b1110000001110100, left, down, right, up, 1'b0, 1'b0, 1'b1, 1'b0);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 13 passed!");
        end

        // Tick 14: Inputs = 16'b1110000001110100, Generated = left, down, right, up, Reference = 1'b0, 1'b0, 1'b1, 1'b0
        scancode = 16'b1110000001110100; // Set input values
        #period;
        if (!(left === 1'b0 && down === 1'b0 && right === 1'b1 && up === 1'b0)) begin
            $display("Mismatch at index 14: Inputs = [%b], Generated = [%b, %b, %b, %b], Reference = [%b, %b, %b, %b]", 16'b1110000001110100, left, down, right, up, 1'b0, 1'b0, 1'b1, 1'b0);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 14 passed!");
        end

        // Tick 15: Inputs = 16'b1110000001110110, Generated = left, down, right, up, Reference = 1'b0, 1'b0, 1'b0, 1'b0
        scancode = 16'b1110000001110110; // Set input values
        #period;
        if (!(left === 1'b0 && down === 1'b0 && right === 1'b0 && up === 1'b0)) begin
            $display("Mismatch at index 15: Inputs = [%b], Generated = [%b, %b, %b, %b], Reference = [%b, %b, %b, %b]", 16'b1110000001110110, left, down, right, up, 1'b0, 1'b0, 1'b0, 1'b0);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 15 passed!");
        end

        // Tick 16: Inputs = 16'b1110000001110110, Generated = left, down, right, up, Reference = 1'b0, 1'b0, 1'b0, 1'b0
        scancode = 16'b1110000001110110; // Set input values
        #period;
        if (!(left === 1'b0 && down === 1'b0 && right === 1'b0 && up === 1'b0)) begin
            $display("Mismatch at index 16: Inputs = [%b], Generated = [%b, %b, %b, %b], Reference = [%b, %b, %b, %b]", 16'b1110000001110110, left, down, right, up, 1'b0, 1'b0, 1'b0, 1'b0);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 16 passed!");
        end

        // Tick 17: Inputs = 16'b1111111111111111, Generated = left, down, right, up, Reference = 1'b0, 1'b0, 1'b0, 1'b0
        scancode = 16'b1111111111111111; // Set input values
        #period;
        if (!(left === 1'b0 && down === 1'b0 && right === 1'b0 && up === 1'b0)) begin
            $display("Mismatch at index 17: Inputs = [%b], Generated = [%b, %b, %b, %b], Reference = [%b, %b, %b, %b]", 16'b1111111111111111, left, down, right, up, 1'b0, 1'b0, 1'b0, 1'b0);
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