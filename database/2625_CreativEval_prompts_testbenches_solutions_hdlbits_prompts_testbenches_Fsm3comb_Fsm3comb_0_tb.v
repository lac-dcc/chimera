// This program was cloned from: https://github.com/matthewdelorenzo/CreativEval
// License: BSD 3-Clause "New" or "Revised" License

`timescale 1 ns/10 ps  // time-unit = 1 ns, precision = 10 ps

module top_module_tb;

    // duration for each bit = 20 * timescale = 20 * 1 ns  = 20ns
    localparam period = 20;

    reg in;
    reg [1:0] state;

    wire [1:0] next_state;
    wire out;


    integer mismatch_count;

    top_module UUT (.in(in), .state(state), .next_state(next_state), .out(out));

    initial begin
        mismatch_count = 0;

        // Tick 0: Inputs = 1'b0, 2'b01, Generated = next_state, out, Reference = 2'b10, 1'b0
        in = 1'b0; state = 2'b01; // Set input values
        #period;
        if (!(next_state === 2'b10 && out === 1'b0)) begin
            $display("Mismatch at index 0: Inputs = [%b, %b], Generated = [%b, %b], Reference = [%b, %b]", 1'b0, 2'b01, next_state, out, 2'b10, 1'b0);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 0 passed!");
        end

        // Tick 1: Inputs = 1'b1, 2'b11, Generated = next_state, out, Reference = 2'b01, 1'b1
        in = 1'b1; state = 2'b11; // Set input values
        #period;
        if (!(next_state === 2'b01 && out === 1'b1)) begin
            $display("Mismatch at index 1: Inputs = [%b, %b], Generated = [%b, %b], Reference = [%b, %b]", 1'b1, 2'b11, next_state, out, 2'b01, 1'b1);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 1 passed!");
        end

        // Tick 2: Inputs = 1'b1, 2'b01, Generated = next_state, out, Reference = 2'b01, 1'b0
        in = 1'b1; state = 2'b01; // Set input values
        #period;
        if (!(next_state === 2'b01 && out === 1'b0)) begin
            $display("Mismatch at index 2: Inputs = [%b, %b], Generated = [%b, %b], Reference = [%b, %b]", 1'b1, 2'b01, next_state, out, 2'b01, 1'b0);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 2 passed!");
        end

        // Tick 3: Inputs = 1'b1, 2'b10, Generated = next_state, out, Reference = 2'b11, 1'b0
        in = 1'b1; state = 2'b10; // Set input values
        #period;
        if (!(next_state === 2'b11 && out === 1'b0)) begin
            $display("Mismatch at index 3: Inputs = [%b, %b], Generated = [%b, %b], Reference = [%b, %b]", 1'b1, 2'b10, next_state, out, 2'b11, 1'b0);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 3 passed!");
        end

        // Tick 4: Inputs = 1'b1, 2'b01, Generated = next_state, out, Reference = 2'b01, 1'b0
        in = 1'b1; state = 2'b01; // Set input values
        #period;
        if (!(next_state === 2'b01 && out === 1'b0)) begin
            $display("Mismatch at index 4: Inputs = [%b, %b], Generated = [%b, %b], Reference = [%b, %b]", 1'b1, 2'b01, next_state, out, 2'b01, 1'b0);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 4 passed!");
        end

        // Tick 5: Inputs = 1'b0, 2'b01, Generated = next_state, out, Reference = 2'b10, 1'b0
        in = 1'b0; state = 2'b01; // Set input values
        #period;
        if (!(next_state === 2'b10 && out === 1'b0)) begin
            $display("Mismatch at index 5: Inputs = [%b, %b], Generated = [%b, %b], Reference = [%b, %b]", 1'b0, 2'b01, next_state, out, 2'b10, 1'b0);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 5 passed!");
        end

        // Tick 6: Inputs = 1'b1, 2'b00, Generated = next_state, out, Reference = 2'b01, 1'b0
        in = 1'b1; state = 2'b00; // Set input values
        #period;
        if (!(next_state === 2'b01 && out === 1'b0)) begin
            $display("Mismatch at index 6: Inputs = [%b, %b], Generated = [%b, %b], Reference = [%b, %b]", 1'b1, 2'b00, next_state, out, 2'b01, 1'b0);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 6 passed!");
        end

        // Tick 7: Inputs = 1'b1, 2'b10, Generated = next_state, out, Reference = 2'b11, 1'b0
        in = 1'b1; state = 2'b10; // Set input values
        #period;
        if (!(next_state === 2'b11 && out === 1'b0)) begin
            $display("Mismatch at index 7: Inputs = [%b, %b], Generated = [%b, %b], Reference = [%b, %b]", 1'b1, 2'b10, next_state, out, 2'b11, 1'b0);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 7 passed!");
        end

        // Tick 8: Inputs = 1'b1, 2'b10, Generated = next_state, out, Reference = 2'b11, 1'b0
        in = 1'b1; state = 2'b10; // Set input values
        #period;
        if (!(next_state === 2'b11 && out === 1'b0)) begin
            $display("Mismatch at index 8: Inputs = [%b, %b], Generated = [%b, %b], Reference = [%b, %b]", 1'b1, 2'b10, next_state, out, 2'b11, 1'b0);
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