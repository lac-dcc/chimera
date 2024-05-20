// This program was cloned from: https://github.com/matthewdelorenzo/CreativEval
// License: BSD 3-Clause "New" or "Revised" License

`timescale 1 ns/10 ps  // time-unit = 1 ns, precision = 10 ps

module top_module_tb;

    // duration for each bit = 20 * timescale = 20 * 1 ns  = 20ns
    localparam period = 20;

    reg [31:0] a;
    reg [31:0] b;

    wire [31:0] sum;


    integer mismatch_count;

    top_module UUT (.a(a), .b(b), .sum(sum));

    initial begin
        mismatch_count = 0;

        // Tick 0: Inputs = 32'b00000000000000000000000000000000, 32'b00000000000000000000000000000000, Generated = sum, Reference = 32'b00000000000000000000000000000000
        a = 32'b00000000000000000000000000000000; b = 32'b00000000000000000000000000000000; // Set input values
        #period;
        if (!(sum === 32'b00000000000000000000000000000000)) begin
            $display("Mismatch at index 0: Inputs = [%b, %b], Generated = [%b], Reference = [%b]", 32'b00000000000000000000000000000000, 32'b00000000000000000000000000000000, sum, 32'b00000000000000000000000000000000);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 0 passed!");
        end

        // Tick 1: Inputs = 32'b00000000000000000000000000000000, 32'b00000000000000000000000000000001, Generated = sum, Reference = 32'b00000000000000000000000000000001
        a = 32'b00000000000000000000000000000000; b = 32'b00000000000000000000000000000001; // Set input values
        #period;
        if (!(sum === 32'b00000000000000000000000000000001)) begin
            $display("Mismatch at index 1: Inputs = [%b, %b], Generated = [%b], Reference = [%b]", 32'b00000000000000000000000000000000, 32'b00000000000000000000000000000001, sum, 32'b00000000000000000000000000000001);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 1 passed!");
        end

        // Tick 2: Inputs = 32'b00000000000000000000000000000001, 32'b00000000000000000000000000000000, Generated = sum, Reference = 32'b00000000000000000000000000000001
        a = 32'b00000000000000000000000000000001; b = 32'b00000000000000000000000000000000; // Set input values
        #period;
        if (!(sum === 32'b00000000000000000000000000000001)) begin
            $display("Mismatch at index 2: Inputs = [%b, %b], Generated = [%b], Reference = [%b]", 32'b00000000000000000000000000000001, 32'b00000000000000000000000000000000, sum, 32'b00000000000000000000000000000001);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 2 passed!");
        end

        // Tick 3: Inputs = 32'b00000000000000000000000000000001, 32'b00000000000000000000000000000001, Generated = sum, Reference = 32'b00000000000000000000000000000010
        a = 32'b00000000000000000000000000000001; b = 32'b00000000000000000000000000000001; // Set input values
        #period;
        if (!(sum === 32'b00000000000000000000000000000010)) begin
            $display("Mismatch at index 3: Inputs = [%b, %b], Generated = [%b], Reference = [%b]", 32'b00000000000000000000000000000001, 32'b00000000000000000000000000000001, sum, 32'b00000000000000000000000000000010);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 3 passed!");
        end

        // Tick 4: Inputs = 32'b00000000000000000000000000000000, 32'b00000000000000000000000000000001, Generated = sum, Reference = 32'b00000000000000000000000000000001
        a = 32'b00000000000000000000000000000000; b = 32'b00000000000000000000000000000001; // Set input values
        #period;
        if (!(sum === 32'b00000000000000000000000000000001)) begin
            $display("Mismatch at index 4: Inputs = [%b, %b], Generated = [%b], Reference = [%b]", 32'b00000000000000000000000000000000, 32'b00000000000000000000000000000001, sum, 32'b00000000000000000000000000000001);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 4 passed!");
        end

        // Tick 5: Inputs = 32'b00000000000000000000000000000001, 32'b00000000000000000000000000000011, Generated = sum, Reference = 32'b00000000000000000000000000000100
        a = 32'b00000000000000000000000000000001; b = 32'b00000000000000000000000000000011; // Set input values
        #period;
        if (!(sum === 32'b00000000000000000000000000000100)) begin
            $display("Mismatch at index 5: Inputs = [%b, %b], Generated = [%b], Reference = [%b]", 32'b00000000000000000000000000000001, 32'b00000000000000000000000000000011, sum, 32'b00000000000000000000000000000100);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 5 passed!");
        end

        // Tick 6: Inputs = 32'b00000000000000000000000000000011, 32'b00000000000000000000000000000011, Generated = sum, Reference = 32'b00000000000000000000000000000110
        a = 32'b00000000000000000000000000000011; b = 32'b00000000000000000000000000000011; // Set input values
        #period;
        if (!(sum === 32'b00000000000000000000000000000110)) begin
            $display("Mismatch at index 6: Inputs = [%b, %b], Generated = [%b], Reference = [%b]", 32'b00000000000000000000000000000011, 32'b00000000000000000000000000000011, sum, 32'b00000000000000000000000000000110);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 6 passed!");
        end

        // Tick 7: Inputs = 32'b00000000000000001111111111111111, 32'b00000000000000000000000000000000, Generated = sum, Reference = 32'b00000000000000001111111111111111
        a = 32'b00000000000000001111111111111111; b = 32'b00000000000000000000000000000000; // Set input values
        #period;
        if (!(sum === 32'b00000000000000001111111111111111)) begin
            $display("Mismatch at index 7: Inputs = [%b, %b], Generated = [%b], Reference = [%b]", 32'b00000000000000001111111111111111, 32'b00000000000000000000000000000000, sum, 32'b00000000000000001111111111111111);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 7 passed!");
        end

        // Tick 8: Inputs = 32'b00000000000000001111111111111111, 32'b00000000000000000000000000000001, Generated = sum, Reference = 32'b00000000000000010000000000000000
        a = 32'b00000000000000001111111111111111; b = 32'b00000000000000000000000000000001; // Set input values
        #period;
        if (!(sum === 32'b00000000000000010000000000000000)) begin
            $display("Mismatch at index 8: Inputs = [%b, %b], Generated = [%b], Reference = [%b]", 32'b00000000000000001111111111111111, 32'b00000000000000000000000000000001, sum, 32'b00000000000000010000000000000000);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 8 passed!");
        end

        if (mismatch_count == 0)
            $display("All tests passed!");
        else
            $display("%0d mismatches out of %0d total tests.", mismatch_count, 9);
        $finish;
    end

endmodule