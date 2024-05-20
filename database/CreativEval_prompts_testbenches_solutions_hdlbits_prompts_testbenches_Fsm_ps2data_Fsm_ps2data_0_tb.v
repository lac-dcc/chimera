// This program was cloned from: https://github.com/matthewdelorenzo/CreativEval
// License: BSD 3-Clause "New" or "Revised" License

`timescale 1 ns/10 ps  // time-unit = 1 ns, precision = 10 ps

module top_module_tb;

    // duration for each bit = 20 * timescale = 20 * 1 ns  = 20ns
    localparam period = 20;

    reg clk;
    reg [7:0] in;
    reg reset;

    wire [23:0] out_bytes;
    wire done;


    integer mismatch_count;

    top_module UUT (.clk(clk), .in(in), .reset(reset), .out_bytes(out_bytes), .done(done));

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

        // Tick 0: Inputs = 1'b1, 8'b11111001, 1'b0, Generated = out_bytes, done, Reference = 24'b00000000000000000000000x, 1'bx
        in = 8'b11111001; reset = 1'b0; // Set input values
        #period;
        // Tick 1: Inputs = 1'b0, 8'b11000101, 1'b0, Generated = out_bytes, done, Reference = 24'b00000000000000000000000x, 1'bx
        in = 8'b11000101; reset = 1'b0; // Set input values
        #period;
        // Tick 2: Inputs = 1'b1, 8'b11100101, 1'b0, Generated = out_bytes, done, Reference = 24'b00000000000000000000000x, 1'bx
        in = 8'b11100101; reset = 1'b0; // Set input values
        #period;
        // Tick 3: Inputs = 1'b0, 8'b00010010, 1'b0, Generated = out_bytes, done, Reference = 24'b00000000000000000000000x, 1'bx
        in = 8'b00010010; reset = 1'b0; // Set input values
        #period;
        // Tick 4: Inputs = 1'b1, 8'b11110010, 1'b0, Generated = out_bytes, done, Reference = 24'b00000000000000000000000x, 1'bx
        in = 8'b11110010; reset = 1'b0; // Set input values
        #period;
        // Tick 5: Inputs = 1'b0, 8'b11101000, 1'b0, Generated = out_bytes, done, Reference = 24'b00000000000000000000000x, 1'bx
        in = 8'b11101000; reset = 1'b0; // Set input values
        #period;
        // Tick 6: Inputs = 1'b1, 8'b01011100, 1'b0, Generated = out_bytes, done, Reference = 24'b00000000000000000000000x, 1'bx
        in = 8'b01011100; reset = 1'b0; // Set input values
        #period;
        // Tick 7: Inputs = 1'b0, 8'b00101101, 1'b0, Generated = out_bytes, done, Reference = 24'b00000000000000000000000x, 1'bx
        in = 8'b00101101; reset = 1'b0; // Set input values
        #period;
        // Tick 8: Inputs = 1'b1, 8'b01100011, 1'b0, Generated = out_bytes, done, Reference = 24'b00000000000000000000000x, 1'bx
        in = 8'b01100011; reset = 1'b0; // Set input values
        #period;
        // Tick 9: Inputs = 1'b0, 8'b10000000, 1'b1, Generated = out_bytes, done, Reference = 24'b00000000000000000000000x, 1'bx
        in = 8'b10000000; reset = 1'b1; // Set input values
        #period;
        // Tick 10: Inputs = 1'b1, 8'b10101010, 1'b0, Generated = out_bytes, done, Reference = 24'b00000000000000000000000x, 1'b0
        in = 8'b10101010; reset = 1'b0; // Set input values
        #period;
        if (!(done === 1'b0)) begin
            $display("Mismatch at index 10: Inputs = [%b, %b, %b], Generated = [%b, %b], Reference = [%b, %b]", 1'b1, 8'b10101010, 1'b0, out_bytes, done, 24'b00000000000000000000000x, 1'b0);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 10 passed!");
        end

        // Tick 11: Inputs = 1'b0, 8'b10010110, 1'b0, Generated = out_bytes, done, Reference = 24'b00000000000000000000000x, 1'b0
        in = 8'b10010110; reset = 1'b0; // Set input values
        #period;
        if (!(done === 1'b0)) begin
            $display("Mismatch at index 11: Inputs = [%b, %b, %b], Generated = [%b, %b], Reference = [%b, %b]", 1'b0, 8'b10010110, 1'b0, out_bytes, done, 24'b00000000000000000000000x, 1'b0);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 11 passed!");
        end

        // Tick 12: Inputs = 1'b1, 8'b00001101, 1'b0, Generated = out_bytes, done, Reference = 24'b00000000000000000000000x, 1'b0
        in = 8'b00001101; reset = 1'b0; // Set input values
        #period;
        if (!(done === 1'b0)) begin
            $display("Mismatch at index 12: Inputs = [%b, %b, %b], Generated = [%b, %b], Reference = [%b, %b]", 1'b1, 8'b00001101, 1'b0, out_bytes, done, 24'b00000000000000000000000x, 1'b0);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 12 passed!");
        end

        // Tick 13: Inputs = 1'b0, 8'b01101011, 1'b0, Generated = out_bytes, done, Reference = 24'b00000000000000000000000x, 1'b0
        in = 8'b01101011; reset = 1'b0; // Set input values
        #period;
        if (!(done === 1'b0)) begin
            $display("Mismatch at index 13: Inputs = [%b, %b, %b], Generated = [%b, %b], Reference = [%b, %b]", 1'b0, 8'b01101011, 1'b0, out_bytes, done, 24'b00000000000000000000000x, 1'b0);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 13 passed!");
        end

        // Tick 14: Inputs = 1'b1, 8'b00000010, 1'b0, Generated = out_bytes, done, Reference = 24'b00000000000000000000000x, 1'b0
        in = 8'b00000010; reset = 1'b0; // Set input values
        #period;
        if (!(done === 1'b0)) begin
            $display("Mismatch at index 14: Inputs = [%b, %b, %b], Generated = [%b, %b], Reference = [%b, %b]", 1'b1, 8'b00000010, 1'b0, out_bytes, done, 24'b00000000000000000000000x, 1'b0);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 14 passed!");
        end

        // Tick 15: Inputs = 1'b0, 8'b00011101, 1'b0, Generated = out_bytes, done, Reference = 24'b00000000000000000000000x, 1'b0
        in = 8'b00011101; reset = 1'b0; // Set input values
        #period;
        if (!(done === 1'b0)) begin
            $display("Mismatch at index 15: Inputs = [%b, %b, %b], Generated = [%b, %b], Reference = [%b, %b]", 1'b0, 8'b00011101, 1'b0, out_bytes, done, 24'b00000000000000000000000x, 1'b0);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 15 passed!");
        end

        // Tick 16: Inputs = 1'b1, 8'b00100011, 1'b0, Generated = out_bytes, done, Reference = 24'b00000000000000000000000x, 1'b0
        in = 8'b00100011; reset = 1'b0; // Set input values
        #period;
        if (!(done === 1'b0)) begin
            $display("Mismatch at index 16: Inputs = [%b, %b, %b], Generated = [%b, %b], Reference = [%b, %b]", 1'b1, 8'b00100011, 1'b0, out_bytes, done, 24'b00000000000000000000000x, 1'b0);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 16 passed!");
        end

        // Tick 17: Inputs = 1'b0, 8'b11001010, 1'b0, Generated = out_bytes, done, Reference = 24'b00000000000000000000000x, 1'b0
        in = 8'b11001010; reset = 1'b0; // Set input values
        #period;
        if (!(done === 1'b0)) begin
            $display("Mismatch at index 17: Inputs = [%b, %b, %b], Generated = [%b, %b], Reference = [%b, %b]", 1'b0, 8'b11001010, 1'b0, out_bytes, done, 24'b00000000000000000000000x, 1'b0);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 17 passed!");
        end

        // Tick 18: Inputs = 1'b1, 8'b11110010, 1'b0, Generated = out_bytes, done, Reference = 24'b011010110001110111001010, 1'b1
        in = 8'b11110010; reset = 1'b0; // Set input values
        #period;
        if (!(out_bytes === 24'b011010110001110111001010 && done === 1'b1)) begin
            $display("Mismatch at index 18: Inputs = [%b, %b, %b], Generated = [%b, %b], Reference = [%b, %b]", 1'b1, 8'b11110010, 1'b0, out_bytes, done, 24'b011010110001110111001010, 1'b1);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 18 passed!");
        end

        // Tick 19: Inputs = 1'b0, 8'b01000001, 1'b0, Generated = out_bytes, done, Reference = 24'b011010110001110111001010, 1'b1
        in = 8'b01000001; reset = 1'b0; // Set input values
        #period;
        if (!(out_bytes === 24'b011010110001110111001010 && done === 1'b1)) begin
            $display("Mismatch at index 19: Inputs = [%b, %b, %b], Generated = [%b, %b], Reference = [%b, %b]", 1'b0, 8'b01000001, 1'b0, out_bytes, done, 24'b011010110001110111001010, 1'b1);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 19 passed!");
        end

        // Tick 20: Inputs = 1'b1, 8'b01111000, 1'b0, Generated = out_bytes, done, Reference = 24'b00000000000000000000000x, 1'b0
        in = 8'b01111000; reset = 1'b0; // Set input values
        #period;
        if (!(done === 1'b0)) begin
            $display("Mismatch at index 20: Inputs = [%b, %b, %b], Generated = [%b, %b], Reference = [%b, %b]", 1'b1, 8'b01111000, 1'b0, out_bytes, done, 24'b00000000000000000000000x, 1'b0);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 20 passed!");
        end

        // Tick 21: Inputs = 1'b0, 8'b11101011, 1'b0, Generated = out_bytes, done, Reference = 24'b00000000000000000000000x, 1'b0
        in = 8'b11101011; reset = 1'b0; // Set input values
        #period;
        if (!(done === 1'b0)) begin
            $display("Mismatch at index 21: Inputs = [%b, %b, %b], Generated = [%b, %b], Reference = [%b, %b]", 1'b0, 8'b11101011, 1'b0, out_bytes, done, 24'b00000000000000000000000x, 1'b0);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 21 passed!");
        end

        // Tick 22: Inputs = 1'b1, 8'b11000110, 1'b0, Generated = out_bytes, done, Reference = 24'b00000000000000000000000x, 1'b0
        in = 8'b11000110; reset = 1'b0; // Set input values
        #period;
        if (!(done === 1'b0)) begin
            $display("Mismatch at index 22: Inputs = [%b, %b, %b], Generated = [%b, %b], Reference = [%b, %b]", 1'b1, 8'b11000110, 1'b0, out_bytes, done, 24'b00000000000000000000000x, 1'b0);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 22 passed!");
        end

        // Tick 23: Inputs = 1'b0, 8'b10111100, 1'b0, Generated = out_bytes, done, Reference = 24'b00000000000000000000000x, 1'b0
        in = 8'b10111100; reset = 1'b0; // Set input values
        #period;
        if (!(done === 1'b0)) begin
            $display("Mismatch at index 23: Inputs = [%b, %b, %b], Generated = [%b, %b], Reference = [%b, %b]", 1'b0, 8'b10111100, 1'b0, out_bytes, done, 24'b00000000000000000000000x, 1'b0);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 23 passed!");
        end

        // Tick 24: Inputs = 1'b1, 8'b00001011, 1'b0, Generated = out_bytes, done, Reference = 24'b00000000000000000000000x, 1'b0
        in = 8'b00001011; reset = 1'b0; // Set input values
        #period;
        if (!(done === 1'b0)) begin
            $display("Mismatch at index 24: Inputs = [%b, %b, %b], Generated = [%b, %b], Reference = [%b, %b]", 1'b1, 8'b00001011, 1'b0, out_bytes, done, 24'b00000000000000000000000x, 1'b0);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 24 passed!");
        end

        // Tick 25: Inputs = 1'b0, 8'b10000101, 1'b0, Generated = out_bytes, done, Reference = 24'b00000000000000000000000x, 1'b0
        in = 8'b10000101; reset = 1'b0; // Set input values
        #period;
        if (!(done === 1'b0)) begin
            $display("Mismatch at index 25: Inputs = [%b, %b, %b], Generated = [%b, %b], Reference = [%b, %b]", 1'b0, 8'b10000101, 1'b0, out_bytes, done, 24'b00000000000000000000000x, 1'b0);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 25 passed!");
        end

        // Tick 26: Inputs = 1'b1, 8'b00111011, 1'b0, Generated = out_bytes, done, Reference = 24'b111010111011110010000101, 1'b1
        in = 8'b00111011; reset = 1'b0; // Set input values
        #period;
        if (!(out_bytes === 24'b111010111011110010000101 && done === 1'b1)) begin
            $display("Mismatch at index 26: Inputs = [%b, %b, %b], Generated = [%b, %b], Reference = [%b, %b]", 1'b1, 8'b00111011, 1'b0, out_bytes, done, 24'b111010111011110010000101, 1'b1);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 26 passed!");
        end

        // Tick 27: Inputs = 1'b0, 8'b01111110, 1'b0, Generated = out_bytes, done, Reference = 24'b111010111011110010000101, 1'b1
        in = 8'b01111110; reset = 1'b0; // Set input values
        #period;
        if (!(out_bytes === 24'b111010111011110010000101 && done === 1'b1)) begin
            $display("Mismatch at index 27: Inputs = [%b, %b, %b], Generated = [%b, %b], Reference = [%b, %b]", 1'b0, 8'b01111110, 1'b0, out_bytes, done, 24'b111010111011110010000101, 1'b1);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 27 passed!");
        end

        // Tick 28: Inputs = 1'b1, 8'b11110001, 1'b0, Generated = out_bytes, done, Reference = 24'b00000000000000000000000x, 1'b0
        in = 8'b11110001; reset = 1'b0; // Set input values
        #period;
        if (!(done === 1'b0)) begin
            $display("Mismatch at index 28: Inputs = [%b, %b, %b], Generated = [%b, %b], Reference = [%b, %b]", 1'b1, 8'b11110001, 1'b0, out_bytes, done, 24'b00000000000000000000000x, 1'b0);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 28 passed!");
        end

        // Tick 29: Inputs = 1'b0, 8'b01100010, 1'b0, Generated = out_bytes, done, Reference = 24'b00000000000000000000000x, 1'b0
        in = 8'b01100010; reset = 1'b0; // Set input values
        #period;
        if (!(done === 1'b0)) begin
            $display("Mismatch at index 29: Inputs = [%b, %b, %b], Generated = [%b, %b], Reference = [%b, %b]", 1'b0, 8'b01100010, 1'b0, out_bytes, done, 24'b00000000000000000000000x, 1'b0);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 29 passed!");
        end

        // Tick 30: Inputs = 1'b1, 8'b10011111, 1'b0, Generated = out_bytes, done, Reference = 24'b00000000000000000000000x, 1'b0
        in = 8'b10011111; reset = 1'b0; // Set input values
        #period;
        if (!(done === 1'b0)) begin
            $display("Mismatch at index 30: Inputs = [%b, %b, %b], Generated = [%b, %b], Reference = [%b, %b]", 1'b1, 8'b10011111, 1'b0, out_bytes, done, 24'b00000000000000000000000x, 1'b0);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 30 passed!");
        end

        // Tick 31: Inputs = 1'b0, 8'b11111000, 1'b0, Generated = out_bytes, done, Reference = 24'b00000000000000000000000x, 1'b0
        in = 8'b11111000; reset = 1'b0; // Set input values
        #period;
        if (!(done === 1'b0)) begin
            $display("Mismatch at index 31: Inputs = [%b, %b, %b], Generated = [%b, %b], Reference = [%b, %b]", 1'b0, 8'b11111000, 1'b0, out_bytes, done, 24'b00000000000000000000000x, 1'b0);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 31 passed!");
        end

        if (mismatch_count == 0)
            $display("All tests passed!");
        else
            $display("%0d mismatches out of %0d total tests.", mismatch_count, 32);
        $finish;
    end

endmodule