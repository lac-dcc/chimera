// This program was cloned from: https://github.com/matthewdelorenzo/CreativEval
// License: BSD 3-Clause "New" or "Revised" License

`timescale 1 ns/10 ps  // time-unit = 1 ns, precision = 10 ps

module top_module_tb;

    // duration for each bit = 20 * timescale = 20 * 1 ns  = 20ns
    localparam period = 20;

    reg [7:0] in;

    wire [31:0] out;


    integer mismatch_count;

    top_module UUT (.in(in), .out(out));

    initial begin
        mismatch_count = 0;

        // Tick 0: Inputs = 8'b00100100, Generated = out, Reference = 32'b00000000000000000000000000100100
        in = 8'b00100100; // Set input values
        #period;
        if (!(out === 32'b00000000000000000000000000100100)) begin
            $display("Mismatch at index 0: Inputs = [%b], Generated = [%b], Reference = [%b]", 8'b00100100, out, 32'b00000000000000000000000000100100);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 0 passed!");
        end

        // Tick 1: Inputs = 8'b10000001, Generated = out, Reference = 32'b11111111111111111111111110000001
        in = 8'b10000001; // Set input values
        #period;
        if (!(out === 32'b11111111111111111111111110000001)) begin
            $display("Mismatch at index 1: Inputs = [%b], Generated = [%b], Reference = [%b]", 8'b10000001, out, 32'b11111111111111111111111110000001);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 1 passed!");
        end

        // Tick 2: Inputs = 8'b00001001, Generated = out, Reference = 32'b00000000000000000000000000001001
        in = 8'b00001001; // Set input values
        #period;
        if (!(out === 32'b00000000000000000000000000001001)) begin
            $display("Mismatch at index 2: Inputs = [%b], Generated = [%b], Reference = [%b]", 8'b00001001, out, 32'b00000000000000000000000000001001);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 2 passed!");
        end

        // Tick 3: Inputs = 8'b01100011, Generated = out, Reference = 32'b00000000000000000000000001100011
        in = 8'b01100011; // Set input values
        #period;
        if (!(out === 32'b00000000000000000000000001100011)) begin
            $display("Mismatch at index 3: Inputs = [%b], Generated = [%b], Reference = [%b]", 8'b01100011, out, 32'b00000000000000000000000001100011);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 3 passed!");
        end

        // Tick 4: Inputs = 8'b00001101, Generated = out, Reference = 32'b00000000000000000000000000001101
        in = 8'b00001101; // Set input values
        #period;
        if (!(out === 32'b00000000000000000000000000001101)) begin
            $display("Mismatch at index 4: Inputs = [%b], Generated = [%b], Reference = [%b]", 8'b00001101, out, 32'b00000000000000000000000000001101);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 4 passed!");
        end

        // Tick 5: Inputs = 8'b10001101, Generated = out, Reference = 32'b11111111111111111111111110001101
        in = 8'b10001101; // Set input values
        #period;
        if (!(out === 32'b11111111111111111111111110001101)) begin
            $display("Mismatch at index 5: Inputs = [%b], Generated = [%b], Reference = [%b]", 8'b10001101, out, 32'b11111111111111111111111110001101);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 5 passed!");
        end

        // Tick 6: Inputs = 8'b01100101, Generated = out, Reference = 32'b00000000000000000000000001100101
        in = 8'b01100101; // Set input values
        #period;
        if (!(out === 32'b00000000000000000000000001100101)) begin
            $display("Mismatch at index 6: Inputs = [%b], Generated = [%b], Reference = [%b]", 8'b01100101, out, 32'b00000000000000000000000001100101);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 6 passed!");
        end

        // Tick 7: Inputs = 8'b00010010, Generated = out, Reference = 32'b00000000000000000000000000010010
        in = 8'b00010010; // Set input values
        #period;
        if (!(out === 32'b00000000000000000000000000010010)) begin
            $display("Mismatch at index 7: Inputs = [%b], Generated = [%b], Reference = [%b]", 8'b00010010, out, 32'b00000000000000000000000000010010);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 7 passed!");
        end

        // Tick 8: Inputs = 8'b00000001, Generated = out, Reference = 32'b00000000000000000000000000000001
        in = 8'b00000001; // Set input values
        #period;
        if (!(out === 32'b00000000000000000000000000000001)) begin
            $display("Mismatch at index 8: Inputs = [%b], Generated = [%b], Reference = [%b]", 8'b00000001, out, 32'b00000000000000000000000000000001);
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