// This program was cloned from: https://github.com/matthewdelorenzo/CreativEval
// License: BSD 3-Clause "New" or "Revised" License

`timescale 1 ns/10 ps  // time-unit = 1 ns, precision = 10 ps

module top_module_tb;

    // duration for each bit = 20 * timescale = 20 * 1 ns  = 20ns
    localparam period = 20;

    reg [2:0] a;
    reg [2:0] b;
    reg cin;

    wire [2:0] cout;
    wire [2:0] sum;


    integer mismatch_count;

    top_module UUT (.a(a), .b(b), .cin(cin), .cout(cout), .sum(sum));

    initial begin
        mismatch_count = 0;

        // Tick 0: Inputs = 3'b010, 3'b011, 1'b0, Generated = cout, sum, Reference = 3'b010, 3'b101
        a = 3'b010; b = 3'b011; cin = 1'b0; // Set input values
        #period;
        if (!(cout === 3'b010 && sum === 3'b101)) begin
            $display("Mismatch at index 0: Inputs = [%b, %b, %b], Generated = [%b, %b], Reference = [%b, %b]", 3'b010, 3'b011, 1'b0, cout, sum, 3'b010, 3'b101);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 0 passed!");
        end

        // Tick 1: Inputs = 3'b010, 3'b011, 1'b0, Generated = cout, sum, Reference = 3'b010, 3'b101
        a = 3'b010; b = 3'b011; cin = 1'b0; // Set input values
        #period;
        if (!(cout === 3'b010 && sum === 3'b101)) begin
            $display("Mismatch at index 1: Inputs = [%b, %b, %b], Generated = [%b, %b], Reference = [%b, %b]", 3'b010, 3'b011, 1'b0, cout, sum, 3'b010, 3'b101);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 1 passed!");
        end

        // Tick 2: Inputs = 3'b010, 3'b011, 1'b1, Generated = cout, sum, Reference = 3'b011, 3'b110
        a = 3'b010; b = 3'b011; cin = 1'b1; // Set input values
        #period;
        if (!(cout === 3'b011 && sum === 3'b110)) begin
            $display("Mismatch at index 2: Inputs = [%b, %b, %b], Generated = [%b, %b], Reference = [%b, %b]", 3'b010, 3'b011, 1'b1, cout, sum, 3'b011, 3'b110);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 2 passed!");
        end

        // Tick 3: Inputs = 3'b010, 3'b011, 1'b1, Generated = cout, sum, Reference = 3'b011, 3'b110
        a = 3'b010; b = 3'b011; cin = 1'b1; // Set input values
        #period;
        if (!(cout === 3'b011 && sum === 3'b110)) begin
            $display("Mismatch at index 3: Inputs = [%b, %b, %b], Generated = [%b, %b], Reference = [%b, %b]", 3'b010, 3'b011, 1'b1, cout, sum, 3'b011, 3'b110);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 3 passed!");
        end

        if (mismatch_count == 0)
            $display("All tests passed!");
        else
            $display("%0d mismatches out of %0d total tests.", mismatch_count, 4);
        $finish;
    end

endmodule