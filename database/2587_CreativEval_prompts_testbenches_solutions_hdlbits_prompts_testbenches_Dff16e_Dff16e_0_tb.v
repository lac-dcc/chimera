// This program was cloned from: https://github.com/matthewdelorenzo/CreativEval
// License: BSD 3-Clause "New" or "Revised" License

`timescale 1 ns/10 ps  // time-unit = 1 ns, precision = 10 ps

module top_module_tb;

    // duration for each bit = 20 * timescale = 20 * 1 ns  = 20ns
    localparam period = 20;

    reg clk;
    reg resetn;
    reg [1:0] byteena;
    reg [15:0] d;

    wire [15:0] q;


    integer mismatch_count;

    top_module UUT (.clk(clk), .resetn(resetn), .byteena(byteena), .d(d), .q(q));

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

        // Tick 0: Inputs = 1'b0, 1'b1, 2'b11, 16'b0011010100100100, Generated = q, Reference = 16'b0011010100100100
        resetn = 1'b1; byteena = 2'b11; d = 16'b0011010100100100; // Set input values
        #period;
        if (!(q === 16'b0011010100100100)) begin
            $display("Mismatch at index 0: Inputs = [%b, %b, %b, %b], Generated = [%b], Reference = [%b]", 1'b0, 1'b1, 2'b11, 16'b0011010100100100, q, 16'b0011010100100100);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 0 passed!");
        end

        // Tick 1: Inputs = 1'b1, 1'b1, 2'b00, 16'b0101111010000001, Generated = q, Reference = 16'b0011010100100100
        resetn = 1'b1; byteena = 2'b00; d = 16'b0101111010000001; // Set input values
        #period;
        if (!(q === 16'b0011010100100100)) begin
            $display("Mismatch at index 1: Inputs = [%b, %b, %b, %b], Generated = [%b], Reference = [%b]", 1'b1, 1'b1, 2'b00, 16'b0101111010000001, q, 16'b0011010100100100);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 1 passed!");
        end

        // Tick 2: Inputs = 1'b0, 1'b1, 2'b00, 16'b0101111010000001, Generated = q, Reference = 16'b0011010100100100
        resetn = 1'b1; byteena = 2'b00; d = 16'b0101111010000001; // Set input values
        #period;
        if (!(q === 16'b0011010100100100)) begin
            $display("Mismatch at index 2: Inputs = [%b, %b, %b, %b], Generated = [%b], Reference = [%b]", 1'b0, 1'b1, 2'b00, 16'b0101111010000001, q, 16'b0011010100100100);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 2 passed!");
        end

        // Tick 3: Inputs = 1'b1, 1'b1, 2'b01, 16'b1101011000001001, Generated = q, Reference = 16'b0011010100100100
        resetn = 1'b1; byteena = 2'b01; d = 16'b1101011000001001; // Set input values
        #period;
        if (!(q === 16'b0011010100100100)) begin
            $display("Mismatch at index 3: Inputs = [%b, %b, %b, %b], Generated = [%b], Reference = [%b]", 1'b1, 1'b1, 2'b01, 16'b1101011000001001, q, 16'b0011010100100100);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 3 passed!");
        end

        // Tick 4: Inputs = 1'b0, 1'b1, 2'b01, 16'b1101011000001001, Generated = q, Reference = 16'b0011010100100100
        resetn = 1'b1; byteena = 2'b01; d = 16'b1101011000001001; // Set input values
        #period;
        if (!(q === 16'b0011010100100100)) begin
            $display("Mismatch at index 4: Inputs = [%b, %b, %b, %b], Generated = [%b], Reference = [%b]", 1'b0, 1'b1, 2'b01, 16'b1101011000001001, q, 16'b0011010100100100);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 4 passed!");
        end

        // Tick 5: Inputs = 1'b1, 1'b1, 2'b10, 16'b0101011001100011, Generated = q, Reference = 16'b0011010100001001
        resetn = 1'b1; byteena = 2'b10; d = 16'b0101011001100011; // Set input values
        #period;
        if (!(q === 16'b0011010100001001)) begin
            $display("Mismatch at index 5: Inputs = [%b, %b, %b, %b], Generated = [%b], Reference = [%b]", 1'b1, 1'b1, 2'b10, 16'b0101011001100011, q, 16'b0011010100001001);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 5 passed!");
        end

        // Tick 6: Inputs = 1'b0, 1'b1, 2'b10, 16'b0101011001100011, Generated = q, Reference = 16'b0011010100001001
        resetn = 1'b1; byteena = 2'b10; d = 16'b0101011001100011; // Set input values
        #period;
        if (!(q === 16'b0011010100001001)) begin
            $display("Mismatch at index 6: Inputs = [%b, %b, %b, %b], Generated = [%b], Reference = [%b]", 1'b0, 1'b1, 2'b10, 16'b0101011001100011, q, 16'b0011010100001001);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 6 passed!");
        end

        // Tick 7: Inputs = 1'b1, 1'b1, 2'b11, 16'b0111101100001101, Generated = q, Reference = 16'b0101011000001001
        resetn = 1'b1; byteena = 2'b11; d = 16'b0111101100001101; // Set input values
        #period;
        if (!(q === 16'b0101011000001001)) begin
            $display("Mismatch at index 7: Inputs = [%b, %b, %b, %b], Generated = [%b], Reference = [%b]", 1'b1, 1'b1, 2'b11, 16'b0111101100001101, q, 16'b0101011000001001);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 7 passed!");
        end

        // Tick 8: Inputs = 1'b0, 1'b1, 2'b11, 16'b0111101100001101, Generated = q, Reference = 16'b0101011000001001
        resetn = 1'b1; byteena = 2'b11; d = 16'b0111101100001101; // Set input values
        #period;
        if (!(q === 16'b0101011000001001)) begin
            $display("Mismatch at index 8: Inputs = [%b, %b, %b, %b], Generated = [%b], Reference = [%b]", 1'b0, 1'b1, 2'b11, 16'b0111101100001101, q, 16'b0101011000001001);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 8 passed!");
        end

        // Tick 9: Inputs = 1'b1, 1'b1, 2'b00, 16'b1001100110001101, Generated = q, Reference = 16'b0111101100001101
        resetn = 1'b1; byteena = 2'b00; d = 16'b1001100110001101; // Set input values
        #period;
        if (!(q === 16'b0111101100001101)) begin
            $display("Mismatch at index 9: Inputs = [%b, %b, %b, %b], Generated = [%b], Reference = [%b]", 1'b1, 1'b1, 2'b00, 16'b1001100110001101, q, 16'b0111101100001101);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 9 passed!");
        end

        // Tick 10: Inputs = 1'b0, 1'b1, 2'b00, 16'b1001100110001101, Generated = q, Reference = 16'b0111101100001101
        resetn = 1'b1; byteena = 2'b00; d = 16'b1001100110001101; // Set input values
        #period;
        if (!(q === 16'b0111101100001101)) begin
            $display("Mismatch at index 10: Inputs = [%b, %b, %b, %b], Generated = [%b], Reference = [%b]", 1'b0, 1'b1, 2'b00, 16'b1001100110001101, q, 16'b0111101100001101);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 10 passed!");
        end

        // Tick 11: Inputs = 1'b1, 1'b1, 2'b01, 16'b1000010001100101, Generated = q, Reference = 16'b0111101100001101
        resetn = 1'b1; byteena = 2'b01; d = 16'b1000010001100101; // Set input values
        #period;
        if (!(q === 16'b0111101100001101)) begin
            $display("Mismatch at index 11: Inputs = [%b, %b, %b, %b], Generated = [%b], Reference = [%b]", 1'b1, 1'b1, 2'b01, 16'b1000010001100101, q, 16'b0111101100001101);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 11 passed!");
        end

        // Tick 12: Inputs = 1'b0, 1'b1, 2'b01, 16'b1000010001100101, Generated = q, Reference = 16'b0111101100001101
        resetn = 1'b1; byteena = 2'b01; d = 16'b1000010001100101; // Set input values
        #period;
        if (!(q === 16'b0111101100001101)) begin
            $display("Mismatch at index 12: Inputs = [%b, %b, %b, %b], Generated = [%b], Reference = [%b]", 1'b0, 1'b1, 2'b01, 16'b1000010001100101, q, 16'b0111101100001101);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 12 passed!");
        end

        // Tick 13: Inputs = 1'b1, 1'b1, 2'b10, 16'b0101001000010010, Generated = q, Reference = 16'b0111101101100101
        resetn = 1'b1; byteena = 2'b10; d = 16'b0101001000010010; // Set input values
        #period;
        if (!(q === 16'b0111101101100101)) begin
            $display("Mismatch at index 13: Inputs = [%b, %b, %b, %b], Generated = [%b], Reference = [%b]", 1'b1, 1'b1, 2'b10, 16'b0101001000010010, q, 16'b0111101101100101);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 13 passed!");
        end

        // Tick 14: Inputs = 1'b0, 1'b1, 2'b10, 16'b0101001000010010, Generated = q, Reference = 16'b0111101101100101
        resetn = 1'b1; byteena = 2'b10; d = 16'b0101001000010010; // Set input values
        #period;
        if (!(q === 16'b0111101101100101)) begin
            $display("Mismatch at index 14: Inputs = [%b, %b, %b, %b], Generated = [%b], Reference = [%b]", 1'b0, 1'b1, 2'b10, 16'b0101001000010010, q, 16'b0111101101100101);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 14 passed!");
        end

        // Tick 15: Inputs = 1'b1, 1'b1, 2'b11, 16'b1110001100000001, Generated = q, Reference = 16'b0101001001100101
        resetn = 1'b1; byteena = 2'b11; d = 16'b1110001100000001; // Set input values
        #period;
        if (!(q === 16'b0101001001100101)) begin
            $display("Mismatch at index 15: Inputs = [%b, %b, %b, %b], Generated = [%b], Reference = [%b]", 1'b1, 1'b1, 2'b11, 16'b1110001100000001, q, 16'b0101001001100101);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 15 passed!");
        end

        // Tick 16: Inputs = 1'b0, 1'b1, 2'b11, 16'b1110001100000001, Generated = q, Reference = 16'b0101001001100101
        resetn = 1'b1; byteena = 2'b11; d = 16'b1110001100000001; // Set input values
        #period;
        if (!(q === 16'b0101001001100101)) begin
            $display("Mismatch at index 16: Inputs = [%b, %b, %b, %b], Generated = [%b], Reference = [%b]", 1'b0, 1'b1, 2'b11, 16'b1110001100000001, q, 16'b0101001001100101);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 16 passed!");
        end

        // Tick 17: Inputs = 1'b1, 1'b1, 2'b00, 16'b1100110100001101, Generated = q, Reference = 16'b1110001100000001
        resetn = 1'b1; byteena = 2'b00; d = 16'b1100110100001101; // Set input values
        #period;
        if (!(q === 16'b1110001100000001)) begin
            $display("Mismatch at index 17: Inputs = [%b, %b, %b, %b], Generated = [%b], Reference = [%b]", 1'b1, 1'b1, 2'b00, 16'b1100110100001101, q, 16'b1110001100000001);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 17 passed!");
        end

        // Tick 18: Inputs = 1'b0, 1'b1, 2'b00, 16'b1100110100001101, Generated = q, Reference = 16'b1110001100000001
        resetn = 1'b1; byteena = 2'b00; d = 16'b1100110100001101; // Set input values
        #period;
        if (!(q === 16'b1110001100000001)) begin
            $display("Mismatch at index 18: Inputs = [%b, %b, %b, %b], Generated = [%b], Reference = [%b]", 1'b0, 1'b1, 2'b00, 16'b1100110100001101, q, 16'b1110001100000001);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 18 passed!");
        end

        if (mismatch_count == 0)
            $display("All tests passed!");
        else
            $display("%0d mismatches out of %0d total tests.", mismatch_count, 19);
        $finish;
    end

endmodule