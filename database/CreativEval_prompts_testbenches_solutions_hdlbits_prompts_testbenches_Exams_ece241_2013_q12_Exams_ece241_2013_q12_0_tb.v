// This program was cloned from: https://github.com/matthewdelorenzo/CreativEval
// License: BSD 3-Clause "New" or "Revised" License

`timescale 1 ns/10 ps  // time-unit = 1 ns, precision = 10 ps

module top_module_tb;

    // duration for each bit = 20 * timescale = 20 * 1 ns  = 20ns
    localparam period = 20;

    reg clk;
    reg enable;
    reg S;
    reg A;
    reg B;
    reg C;

    wire Z;


    integer mismatch_count;

    top_module UUT (.clk(clk), .enable(enable), .S(S), .A(A), .B(B), .C(C), .Z(Z));

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

        // Tick 0: Inputs = 1'b0, 1'b0, 1'bx, 1'b0, 1'b0, 1'b0, Generated = Z, Reference = 1'bx
        enable = 1'b0; S = 1'bx; A = 1'b0; B = 1'b0; C = 1'b0; // Set input values
        #period;
        // Tick 1: Inputs = 1'b1, 1'b0, 1'bx, 1'b0, 1'b0, 1'b0, Generated = Z, Reference = 1'bx
        enable = 1'b0; S = 1'bx; A = 1'b0; B = 1'b0; C = 1'b0; // Set input values
        #period;
        // Tick 2: Inputs = 1'b0, 1'b0, 1'bx, 1'b0, 1'b0, 1'b0, Generated = Z, Reference = 1'bx
        enable = 1'b0; S = 1'bx; A = 1'b0; B = 1'b0; C = 1'b0; // Set input values
        #period;
        // Tick 3: Inputs = 1'b1, 1'b1, 1'b1, 1'b0, 1'b0, 1'b0, Generated = Z, Reference = 1'bx
        enable = 1'b1; S = 1'b1; A = 1'b0; B = 1'b0; C = 1'b0; // Set input values
        #period;
        // Tick 4: Inputs = 1'b0, 1'b1, 1'b1, 1'b0, 1'b0, 1'b0, Generated = Z, Reference = 1'bx
        enable = 1'b1; S = 1'b1; A = 1'b0; B = 1'b0; C = 1'b0; // Set input values
        #period;
        // Tick 5: Inputs = 1'b1, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0, Generated = Z, Reference = 1'b1
        enable = 1'b1; S = 1'b0; A = 1'b0; B = 1'b0; C = 1'b0; // Set input values
        #period;
        if (!(Z === 1'b1)) begin
            $display("Mismatch at index 5: Inputs = [%b, %b, %b, %b, %b, %b], Generated = [%b], Reference = [%b]", 1'b1, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0, Z, 1'b1);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 5 passed!");
        end

        // Tick 6: Inputs = 1'b0, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0, Generated = Z, Reference = 1'b1
        enable = 1'b1; S = 1'b0; A = 1'b0; B = 1'b0; C = 1'b0; // Set input values
        #period;
        if (!(Z === 1'b1)) begin
            $display("Mismatch at index 6: Inputs = [%b, %b, %b, %b, %b, %b], Generated = [%b], Reference = [%b]", 1'b0, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0, Z, 1'b1);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 6 passed!");
        end

        // Tick 7: Inputs = 1'b1, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0, Generated = Z, Reference = 1'b0
        enable = 1'b1; S = 1'b0; A = 1'b0; B = 1'b0; C = 1'b0; // Set input values
        #period;
        if (!(Z === 1'b0)) begin
            $display("Mismatch at index 7: Inputs = [%b, %b, %b, %b, %b, %b], Generated = [%b], Reference = [%b]", 1'b1, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0, Z, 1'b0);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 7 passed!");
        end

        // Tick 8: Inputs = 1'b0, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0, Generated = Z, Reference = 1'b0
        enable = 1'b1; S = 1'b0; A = 1'b0; B = 1'b0; C = 1'b0; // Set input values
        #period;
        if (!(Z === 1'b0)) begin
            $display("Mismatch at index 8: Inputs = [%b, %b, %b, %b, %b, %b], Generated = [%b], Reference = [%b]", 1'b0, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0, Z, 1'b0);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 8 passed!");
        end

        // Tick 9: Inputs = 1'b1, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0, Generated = Z, Reference = 1'b0
        enable = 1'b1; S = 1'b0; A = 1'b0; B = 1'b0; C = 1'b0; // Set input values
        #period;
        if (!(Z === 1'b0)) begin
            $display("Mismatch at index 9: Inputs = [%b, %b, %b, %b, %b, %b], Generated = [%b], Reference = [%b]", 1'b1, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0, Z, 1'b0);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 9 passed!");
        end

        // Tick 10: Inputs = 1'b0, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0, Generated = Z, Reference = 1'b0
        enable = 1'b1; S = 1'b0; A = 1'b0; B = 1'b0; C = 1'b0; // Set input values
        #period;
        if (!(Z === 1'b0)) begin
            $display("Mismatch at index 10: Inputs = [%b, %b, %b, %b, %b, %b], Generated = [%b], Reference = [%b]", 1'b0, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0, Z, 1'b0);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 10 passed!");
        end

        // Tick 11: Inputs = 1'b1, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0, Generated = Z, Reference = 1'b0
        enable = 1'b1; S = 1'b0; A = 1'b0; B = 1'b0; C = 1'b0; // Set input values
        #period;
        if (!(Z === 1'b0)) begin
            $display("Mismatch at index 11: Inputs = [%b, %b, %b, %b, %b, %b], Generated = [%b], Reference = [%b]", 1'b1, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0, Z, 1'b0);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 11 passed!");
        end

        // Tick 12: Inputs = 1'b0, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0, Generated = Z, Reference = 1'b0
        enable = 1'b1; S = 1'b0; A = 1'b0; B = 1'b0; C = 1'b0; // Set input values
        #period;
        if (!(Z === 1'b0)) begin
            $display("Mismatch at index 12: Inputs = [%b, %b, %b, %b, %b, %b], Generated = [%b], Reference = [%b]", 1'b0, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0, Z, 1'b0);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 12 passed!");
        end

        // Tick 13: Inputs = 1'b1, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0, Generated = Z, Reference = 1'b0
        enable = 1'b1; S = 1'b0; A = 1'b0; B = 1'b0; C = 1'b0; // Set input values
        #period;
        if (!(Z === 1'b0)) begin
            $display("Mismatch at index 13: Inputs = [%b, %b, %b, %b, %b, %b], Generated = [%b], Reference = [%b]", 1'b1, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0, Z, 1'b0);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 13 passed!");
        end

        // Tick 14: Inputs = 1'b0, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0, Generated = Z, Reference = 1'b0
        enable = 1'b1; S = 1'b0; A = 1'b0; B = 1'b0; C = 1'b0; // Set input values
        #period;
        if (!(Z === 1'b0)) begin
            $display("Mismatch at index 14: Inputs = [%b, %b, %b, %b, %b, %b], Generated = [%b], Reference = [%b]", 1'b0, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0, Z, 1'b0);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 14 passed!");
        end

        // Tick 15: Inputs = 1'b1, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0, Generated = Z, Reference = 1'b0
        enable = 1'b1; S = 1'b0; A = 1'b0; B = 1'b0; C = 1'b0; // Set input values
        #period;
        if (!(Z === 1'b0)) begin
            $display("Mismatch at index 15: Inputs = [%b, %b, %b, %b, %b, %b], Generated = [%b], Reference = [%b]", 1'b1, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0, Z, 1'b0);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 15 passed!");
        end

        // Tick 16: Inputs = 1'b0, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0, Generated = Z, Reference = 1'b0
        enable = 1'b1; S = 1'b0; A = 1'b0; B = 1'b0; C = 1'b0; // Set input values
        #period;
        if (!(Z === 1'b0)) begin
            $display("Mismatch at index 16: Inputs = [%b, %b, %b, %b, %b, %b], Generated = [%b], Reference = [%b]", 1'b0, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0, Z, 1'b0);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 16 passed!");
        end

        // Tick 17: Inputs = 1'b1, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0, Generated = Z, Reference = 1'b0
        enable = 1'b1; S = 1'b0; A = 1'b0; B = 1'b0; C = 1'b0; // Set input values
        #period;
        if (!(Z === 1'b0)) begin
            $display("Mismatch at index 17: Inputs = [%b, %b, %b, %b, %b, %b], Generated = [%b], Reference = [%b]", 1'b1, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0, Z, 1'b0);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 17 passed!");
        end

        // Tick 18: Inputs = 1'b0, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0, Generated = Z, Reference = 1'b0
        enable = 1'b1; S = 1'b0; A = 1'b0; B = 1'b0; C = 1'b0; // Set input values
        #period;
        if (!(Z === 1'b0)) begin
            $display("Mismatch at index 18: Inputs = [%b, %b, %b, %b, %b, %b], Generated = [%b], Reference = [%b]", 1'b0, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0, Z, 1'b0);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 18 passed!");
        end

        // Tick 19: Inputs = 1'b1, 1'b0, 1'bx, 1'b1, 1'b0, 1'b1, Generated = Z, Reference = 1'b0
        enable = 1'b0; S = 1'bx; A = 1'b1; B = 1'b0; C = 1'b1; // Set input values
        #period;
        if (!(Z === 1'b0)) begin
            $display("Mismatch at index 19: Inputs = [%b, %b, %b, %b, %b, %b], Generated = [%b], Reference = [%b]", 1'b1, 1'b0, 1'bx, 1'b1, 1'b0, 1'b1, Z, 1'b0);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 19 passed!");
        end

        // Tick 20: Inputs = 1'b0, 1'b0, 1'bx, 1'b1, 1'b0, 1'b1, Generated = Z, Reference = 1'b0
        enable = 1'b0; S = 1'bx; A = 1'b1; B = 1'b0; C = 1'b1; // Set input values
        #period;
        if (!(Z === 1'b0)) begin
            $display("Mismatch at index 20: Inputs = [%b, %b, %b, %b, %b, %b], Generated = [%b], Reference = [%b]", 1'b0, 1'b0, 1'bx, 1'b1, 1'b0, 1'b1, Z, 1'b0);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 20 passed!");
        end

        // Tick 21: Inputs = 1'b1, 1'b0, 1'bx, 1'b1, 1'b1, 1'b0, Generated = Z, Reference = 1'b0
        enable = 1'b0; S = 1'bx; A = 1'b1; B = 1'b1; C = 1'b0; // Set input values
        #period;
        if (!(Z === 1'b0)) begin
            $display("Mismatch at index 21: Inputs = [%b, %b, %b, %b, %b, %b], Generated = [%b], Reference = [%b]", 1'b1, 1'b0, 1'bx, 1'b1, 1'b1, 1'b0, Z, 1'b0);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 21 passed!");
        end

        // Tick 22: Inputs = 1'b0, 1'b0, 1'bx, 1'b1, 1'b1, 1'b0, Generated = Z, Reference = 1'b0
        enable = 1'b0; S = 1'bx; A = 1'b1; B = 1'b1; C = 1'b0; // Set input values
        #period;
        if (!(Z === 1'b0)) begin
            $display("Mismatch at index 22: Inputs = [%b, %b, %b, %b, %b, %b], Generated = [%b], Reference = [%b]", 1'b0, 1'b0, 1'bx, 1'b1, 1'b1, 1'b0, Z, 1'b0);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 22 passed!");
        end

        // Tick 23: Inputs = 1'b1, 1'b0, 1'bx, 1'b1, 1'b1, 1'b1, Generated = Z, Reference = 1'b1
        enable = 1'b0; S = 1'bx; A = 1'b1; B = 1'b1; C = 1'b1; // Set input values
        #period;
        if (!(Z === 1'b1)) begin
            $display("Mismatch at index 23: Inputs = [%b, %b, %b, %b, %b, %b], Generated = [%b], Reference = [%b]", 1'b1, 1'b0, 1'bx, 1'b1, 1'b1, 1'b1, Z, 1'b1);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 23 passed!");
        end

        // Tick 24: Inputs = 1'b0, 1'b0, 1'bx, 1'b1, 1'b1, 1'b1, Generated = Z, Reference = 1'b1
        enable = 1'b0; S = 1'bx; A = 1'b1; B = 1'b1; C = 1'b1; // Set input values
        #period;
        if (!(Z === 1'b1)) begin
            $display("Mismatch at index 24: Inputs = [%b, %b, %b, %b, %b, %b], Generated = [%b], Reference = [%b]", 1'b0, 1'b0, 1'bx, 1'b1, 1'b1, 1'b1, Z, 1'b1);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 24 passed!");
        end

        // Tick 25: Inputs = 1'b1, 1'b0, 1'bx, 1'b0, 1'b0, 1'b0, Generated = Z, Reference = 1'b0
        enable = 1'b0; S = 1'bx; A = 1'b0; B = 1'b0; C = 1'b0; // Set input values
        #period;
        if (!(Z === 1'b0)) begin
            $display("Mismatch at index 25: Inputs = [%b, %b, %b, %b, %b, %b], Generated = [%b], Reference = [%b]", 1'b1, 1'b0, 1'bx, 1'b0, 1'b0, 1'b0, Z, 1'b0);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 25 passed!");
        end

        // Tick 26: Inputs = 1'b0, 1'b0, 1'bx, 1'b0, 1'b0, 1'b0, Generated = Z, Reference = 1'b0
        enable = 1'b0; S = 1'bx; A = 1'b0; B = 1'b0; C = 1'b0; // Set input values
        #period;
        if (!(Z === 1'b0)) begin
            $display("Mismatch at index 26: Inputs = [%b, %b, %b, %b, %b, %b], Generated = [%b], Reference = [%b]", 1'b0, 1'b0, 1'bx, 1'b0, 1'b0, 1'b0, Z, 1'b0);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 26 passed!");
        end

        // Tick 27: Inputs = 1'b1, 1'b0, 1'bx, 1'b0, 1'b0, 1'b1, Generated = Z, Reference = 1'b0
        enable = 1'b0; S = 1'bx; A = 1'b0; B = 1'b0; C = 1'b1; // Set input values
        #period;
        if (!(Z === 1'b0)) begin
            $display("Mismatch at index 27: Inputs = [%b, %b, %b, %b, %b, %b], Generated = [%b], Reference = [%b]", 1'b1, 1'b0, 1'bx, 1'b0, 1'b0, 1'b1, Z, 1'b0);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 27 passed!");
        end

        if (mismatch_count == 0)
            $display("All tests passed!");
        else
            $display("%0d mismatches out of %0d total tests.", mismatch_count, 28);
        $finish;
    end

endmodule