// This program was cloned from: https://github.com/matthewdelorenzo/CreativEval
// License: BSD 3-Clause "New" or "Revised" License

`timescale 1 ns/10 ps  // time-unit = 1 ns, precision = 10 ps

module top_module_tb;

    // duration for each bit = 20 * timescale = 20 * 1 ns  = 20ns
    localparam period = 20;

    reg [4:0] a;
    reg [4:0] b;
    reg [4:0] c;
    reg [4:0] d;
    reg [4:0] e;
    reg [4:0] f;

    wire [7:0] w;
    wire [7:0] x;
    wire [7:0] y;
    wire [7:0] z;


    integer mismatch_count;

    top_module UUT (.a(a), .b(b), .c(c), .d(d), .e(e), .f(f), .w(w), .x(x), .y(y), .z(z));

    initial begin
        mismatch_count = 0;

        // Tick 0: Inputs = 5'b0000x, 5'b0000x, 5'b0000x, 5'b0000x, 5'b0000x, 5'b0000x, Generated = w, x, y, z, Reference = 8'b0000000x, 8'b0000000x, 8'b0000000x, 8'b0000000x
        a = 5'b0000x; b = 5'b0000x; c = 5'b0000x; d = 5'b0000x; e = 5'b0000x; f = 5'b0000x; // Set input values
        #period;
        // Tick 1: Inputs = 5'b00000, 5'b00000, 5'b00000, 5'b00000, 5'b00000, 5'b00000, Generated = w, x, y, z, Reference = 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000011
        a = 5'b00000; b = 5'b00000; c = 5'b00000; d = 5'b00000; e = 5'b00000; f = 5'b00000; // Set input values
        #period;
        if (!(w === 8'b00000000 && x === 8'b00000000 && y === 8'b00000000 && z === 8'b00000011)) begin
            $display("Mismatch at index 1: Inputs = [%b, %b, %b, %b, %b, %b], Generated = [%b, %b, %b, %b], Reference = [%b, %b, %b, %b]", 5'b00000, 5'b00000, 5'b00000, 5'b00000, 5'b00000, 5'b00000, w, x, y, z, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000011);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 1 passed!");
        end

        // Tick 2: Inputs = 5'b00000, 5'b00000, 5'b00000, 5'b00000, 5'b00000, 5'b00000, Generated = w, x, y, z, Reference = 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000011
        a = 5'b00000; b = 5'b00000; c = 5'b00000; d = 5'b00000; e = 5'b00000; f = 5'b00000; // Set input values
        #period;
        if (!(w === 8'b00000000 && x === 8'b00000000 && y === 8'b00000000 && z === 8'b00000011)) begin
            $display("Mismatch at index 2: Inputs = [%b, %b, %b, %b, %b, %b], Generated = [%b, %b, %b, %b], Reference = [%b, %b, %b, %b]", 5'b00000, 5'b00000, 5'b00000, 5'b00000, 5'b00000, 5'b00000, w, x, y, z, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000011);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 2 passed!");
        end

        // Tick 3: Inputs = 5'b00000, 5'b00000, 5'b00000, 5'b00000, 5'b00000, 5'b00001, Generated = w, x, y, z, Reference = 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000111
        a = 5'b00000; b = 5'b00000; c = 5'b00000; d = 5'b00000; e = 5'b00000; f = 5'b00001; // Set input values
        #period;
        if (!(w === 8'b00000000 && x === 8'b00000000 && y === 8'b00000000 && z === 8'b00000111)) begin
            $display("Mismatch at index 3: Inputs = [%b, %b, %b, %b, %b, %b], Generated = [%b, %b, %b, %b], Reference = [%b, %b, %b, %b]", 5'b00000, 5'b00000, 5'b00000, 5'b00000, 5'b00000, 5'b00001, w, x, y, z, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000111);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 3 passed!");
        end

        // Tick 4: Inputs = 5'b00000, 5'b00000, 5'b00000, 5'b00000, 5'b00000, 5'b00001, Generated = w, x, y, z, Reference = 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000111
        a = 5'b00000; b = 5'b00000; c = 5'b00000; d = 5'b00000; e = 5'b00000; f = 5'b00001; // Set input values
        #period;
        if (!(w === 8'b00000000 && x === 8'b00000000 && y === 8'b00000000 && z === 8'b00000111)) begin
            $display("Mismatch at index 4: Inputs = [%b, %b, %b, %b, %b, %b], Generated = [%b, %b, %b, %b], Reference = [%b, %b, %b, %b]", 5'b00000, 5'b00000, 5'b00000, 5'b00000, 5'b00000, 5'b00001, w, x, y, z, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000111);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 4 passed!");
        end

        // Tick 5: Inputs = 5'b00000, 5'b00000, 5'b00000, 5'b00000, 5'b00000, 5'b00010, Generated = w, x, y, z, Reference = 8'b00000000, 8'b00000000, 8'b00000000, 8'b00001011
        a = 5'b00000; b = 5'b00000; c = 5'b00000; d = 5'b00000; e = 5'b00000; f = 5'b00010; // Set input values
        #period;
        if (!(w === 8'b00000000 && x === 8'b00000000 && y === 8'b00000000 && z === 8'b00001011)) begin
            $display("Mismatch at index 5: Inputs = [%b, %b, %b, %b, %b, %b], Generated = [%b, %b, %b, %b], Reference = [%b, %b, %b, %b]", 5'b00000, 5'b00000, 5'b00000, 5'b00000, 5'b00000, 5'b00010, w, x, y, z, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00001011);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 5 passed!");
        end

        // Tick 6: Inputs = 5'b00000, 5'b00000, 5'b00000, 5'b00000, 5'b00000, 5'b00010, Generated = w, x, y, z, Reference = 8'b00000000, 8'b00000000, 8'b00000000, 8'b00001011
        a = 5'b00000; b = 5'b00000; c = 5'b00000; d = 5'b00000; e = 5'b00000; f = 5'b00010; // Set input values
        #period;
        if (!(w === 8'b00000000 && x === 8'b00000000 && y === 8'b00000000 && z === 8'b00001011)) begin
            $display("Mismatch at index 6: Inputs = [%b, %b, %b, %b, %b, %b], Generated = [%b, %b, %b, %b], Reference = [%b, %b, %b, %b]", 5'b00000, 5'b00000, 5'b00000, 5'b00000, 5'b00000, 5'b00010, w, x, y, z, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00001011);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 6 passed!");
        end

        // Tick 7: Inputs = 5'b00000, 5'b00000, 5'b00000, 5'b00000, 5'b00000, 5'b00100, Generated = w, x, y, z, Reference = 8'b00000000, 8'b00000000, 8'b00000000, 8'b00010011
        a = 5'b00000; b = 5'b00000; c = 5'b00000; d = 5'b00000; e = 5'b00000; f = 5'b00100; // Set input values
        #period;
        if (!(w === 8'b00000000 && x === 8'b00000000 && y === 8'b00000000 && z === 8'b00010011)) begin
            $display("Mismatch at index 7: Inputs = [%b, %b, %b, %b, %b, %b], Generated = [%b, %b, %b, %b], Reference = [%b, %b, %b, %b]", 5'b00000, 5'b00000, 5'b00000, 5'b00000, 5'b00000, 5'b00100, w, x, y, z, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00010011);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 7 passed!");
        end

        // Tick 8: Inputs = 5'b00000, 5'b00000, 5'b00000, 5'b00000, 5'b00000, 5'b00100, Generated = w, x, y, z, Reference = 8'b00000000, 8'b00000000, 8'b00000000, 8'b00010011
        a = 5'b00000; b = 5'b00000; c = 5'b00000; d = 5'b00000; e = 5'b00000; f = 5'b00100; // Set input values
        #period;
        if (!(w === 8'b00000000 && x === 8'b00000000 && y === 8'b00000000 && z === 8'b00010011)) begin
            $display("Mismatch at index 8: Inputs = [%b, %b, %b, %b, %b, %b], Generated = [%b, %b, %b, %b], Reference = [%b, %b, %b, %b]", 5'b00000, 5'b00000, 5'b00000, 5'b00000, 5'b00000, 5'b00100, w, x, y, z, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00010011);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 8 passed!");
        end

        // Tick 9: Inputs = 5'b00000, 5'b00000, 5'b00000, 5'b00000, 5'b00000, 5'b01000, Generated = w, x, y, z, Reference = 8'b00000000, 8'b00000000, 8'b00000000, 8'b00100011
        a = 5'b00000; b = 5'b00000; c = 5'b00000; d = 5'b00000; e = 5'b00000; f = 5'b01000; // Set input values
        #period;
        if (!(w === 8'b00000000 && x === 8'b00000000 && y === 8'b00000000 && z === 8'b00100011)) begin
            $display("Mismatch at index 9: Inputs = [%b, %b, %b, %b, %b, %b], Generated = [%b, %b, %b, %b], Reference = [%b, %b, %b, %b]", 5'b00000, 5'b00000, 5'b00000, 5'b00000, 5'b00000, 5'b01000, w, x, y, z, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00100011);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 9 passed!");
        end

        // Tick 10: Inputs = 5'b00000, 5'b00000, 5'b00000, 5'b00000, 5'b00000, 5'b01000, Generated = w, x, y, z, Reference = 8'b00000000, 8'b00000000, 8'b00000000, 8'b00100011
        a = 5'b00000; b = 5'b00000; c = 5'b00000; d = 5'b00000; e = 5'b00000; f = 5'b01000; // Set input values
        #period;
        if (!(w === 8'b00000000 && x === 8'b00000000 && y === 8'b00000000 && z === 8'b00100011)) begin
            $display("Mismatch at index 10: Inputs = [%b, %b, %b, %b, %b, %b], Generated = [%b, %b, %b, %b], Reference = [%b, %b, %b, %b]", 5'b00000, 5'b00000, 5'b00000, 5'b00000, 5'b00000, 5'b01000, w, x, y, z, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00100011);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 10 passed!");
        end

        // Tick 11: Inputs = 5'b00000, 5'b00000, 5'b00000, 5'b00000, 5'b00000, 5'b10000, Generated = w, x, y, z, Reference = 8'b00000000, 8'b00000000, 8'b00000000, 8'b01000011
        a = 5'b00000; b = 5'b00000; c = 5'b00000; d = 5'b00000; e = 5'b00000; f = 5'b10000; // Set input values
        #period;
        if (!(w === 8'b00000000 && x === 8'b00000000 && y === 8'b00000000 && z === 8'b01000011)) begin
            $display("Mismatch at index 11: Inputs = [%b, %b, %b, %b, %b, %b], Generated = [%b, %b, %b, %b], Reference = [%b, %b, %b, %b]", 5'b00000, 5'b00000, 5'b00000, 5'b00000, 5'b00000, 5'b10000, w, x, y, z, 8'b00000000, 8'b00000000, 8'b00000000, 8'b01000011);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 11 passed!");
        end

        // Tick 12: Inputs = 5'b00000, 5'b00000, 5'b00000, 5'b00000, 5'b00000, 5'b10000, Generated = w, x, y, z, Reference = 8'b00000000, 8'b00000000, 8'b00000000, 8'b01000011
        a = 5'b00000; b = 5'b00000; c = 5'b00000; d = 5'b00000; e = 5'b00000; f = 5'b10000; // Set input values
        #period;
        if (!(w === 8'b00000000 && x === 8'b00000000 && y === 8'b00000000 && z === 8'b01000011)) begin
            $display("Mismatch at index 12: Inputs = [%b, %b, %b, %b, %b, %b], Generated = [%b, %b, %b, %b], Reference = [%b, %b, %b, %b]", 5'b00000, 5'b00000, 5'b00000, 5'b00000, 5'b00000, 5'b10000, w, x, y, z, 8'b00000000, 8'b00000000, 8'b00000000, 8'b01000011);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 12 passed!");
        end

        // Tick 13: Inputs = 5'b00000, 5'b00000, 5'b00000, 5'b00000, 5'b00001, 5'b00000, Generated = w, x, y, z, Reference = 8'b00000000, 8'b00000000, 8'b00000000, 8'b10000011
        a = 5'b00000; b = 5'b00000; c = 5'b00000; d = 5'b00000; e = 5'b00001; f = 5'b00000; // Set input values
        #period;
        if (!(w === 8'b00000000 && x === 8'b00000000 && y === 8'b00000000 && z === 8'b10000011)) begin
            $display("Mismatch at index 13: Inputs = [%b, %b, %b, %b, %b, %b], Generated = [%b, %b, %b, %b], Reference = [%b, %b, %b, %b]", 5'b00000, 5'b00000, 5'b00000, 5'b00000, 5'b00001, 5'b00000, w, x, y, z, 8'b00000000, 8'b00000000, 8'b00000000, 8'b10000011);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 13 passed!");
        end

        // Tick 14: Inputs = 5'b00000, 5'b00000, 5'b00000, 5'b00000, 5'b00001, 5'b00000, Generated = w, x, y, z, Reference = 8'b00000000, 8'b00000000, 8'b00000000, 8'b10000011
        a = 5'b00000; b = 5'b00000; c = 5'b00000; d = 5'b00000; e = 5'b00001; f = 5'b00000; // Set input values
        #period;
        if (!(w === 8'b00000000 && x === 8'b00000000 && y === 8'b00000000 && z === 8'b10000011)) begin
            $display("Mismatch at index 14: Inputs = [%b, %b, %b, %b, %b, %b], Generated = [%b, %b, %b, %b], Reference = [%b, %b, %b, %b]", 5'b00000, 5'b00000, 5'b00000, 5'b00000, 5'b00001, 5'b00000, w, x, y, z, 8'b00000000, 8'b00000000, 8'b00000000, 8'b10000011);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 14 passed!");
        end

        // Tick 15: Inputs = 5'b00000, 5'b00000, 5'b00000, 5'b00000, 5'b00010, 5'b00000, Generated = w, x, y, z, Reference = 8'b00000000, 8'b00000000, 8'b00000001, 8'b00000011
        a = 5'b00000; b = 5'b00000; c = 5'b00000; d = 5'b00000; e = 5'b00010; f = 5'b00000; // Set input values
        #period;
        if (!(w === 8'b00000000 && x === 8'b00000000 && y === 8'b00000001 && z === 8'b00000011)) begin
            $display("Mismatch at index 15: Inputs = [%b, %b, %b, %b, %b, %b], Generated = [%b, %b, %b, %b], Reference = [%b, %b, %b, %b]", 5'b00000, 5'b00000, 5'b00000, 5'b00000, 5'b00010, 5'b00000, w, x, y, z, 8'b00000000, 8'b00000000, 8'b00000001, 8'b00000011);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 15 passed!");
        end

        // Tick 16: Inputs = 5'b00000, 5'b00000, 5'b00000, 5'b00000, 5'b00010, 5'b00000, Generated = w, x, y, z, Reference = 8'b00000000, 8'b00000000, 8'b00000001, 8'b00000011
        a = 5'b00000; b = 5'b00000; c = 5'b00000; d = 5'b00000; e = 5'b00010; f = 5'b00000; // Set input values
        #period;
        if (!(w === 8'b00000000 && x === 8'b00000000 && y === 8'b00000001 && z === 8'b00000011)) begin
            $display("Mismatch at index 16: Inputs = [%b, %b, %b, %b, %b, %b], Generated = [%b, %b, %b, %b], Reference = [%b, %b, %b, %b]", 5'b00000, 5'b00000, 5'b00000, 5'b00000, 5'b00010, 5'b00000, w, x, y, z, 8'b00000000, 8'b00000000, 8'b00000001, 8'b00000011);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 16 passed!");
        end

        // Tick 17: Inputs = 5'b00000, 5'b00000, 5'b00000, 5'b00000, 5'b00100, 5'b00000, Generated = w, x, y, z, Reference = 8'b00000000, 8'b00000000, 8'b00000010, 8'b00000011
        a = 5'b00000; b = 5'b00000; c = 5'b00000; d = 5'b00000; e = 5'b00100; f = 5'b00000; // Set input values
        #period;
        if (!(w === 8'b00000000 && x === 8'b00000000 && y === 8'b00000010 && z === 8'b00000011)) begin
            $display("Mismatch at index 17: Inputs = [%b, %b, %b, %b, %b, %b], Generated = [%b, %b, %b, %b], Reference = [%b, %b, %b, %b]", 5'b00000, 5'b00000, 5'b00000, 5'b00000, 5'b00100, 5'b00000, w, x, y, z, 8'b00000000, 8'b00000000, 8'b00000010, 8'b00000011);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 17 passed!");
        end

        // Tick 18: Inputs = 5'b00000, 5'b00000, 5'b00000, 5'b00000, 5'b00100, 5'b00000, Generated = w, x, y, z, Reference = 8'b00000000, 8'b00000000, 8'b00000010, 8'b00000011
        a = 5'b00000; b = 5'b00000; c = 5'b00000; d = 5'b00000; e = 5'b00100; f = 5'b00000; // Set input values
        #period;
        if (!(w === 8'b00000000 && x === 8'b00000000 && y === 8'b00000010 && z === 8'b00000011)) begin
            $display("Mismatch at index 18: Inputs = [%b, %b, %b, %b, %b, %b], Generated = [%b, %b, %b, %b], Reference = [%b, %b, %b, %b]", 5'b00000, 5'b00000, 5'b00000, 5'b00000, 5'b00100, 5'b00000, w, x, y, z, 8'b00000000, 8'b00000000, 8'b00000010, 8'b00000011);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 18 passed!");
        end

        // Tick 19: Inputs = 5'b00000, 5'b00000, 5'b00000, 5'b00000, 5'b01000, 5'b00000, Generated = w, x, y, z, Reference = 8'b00000000, 8'b00000000, 8'b00000100, 8'b00000011
        a = 5'b00000; b = 5'b00000; c = 5'b00000; d = 5'b00000; e = 5'b01000; f = 5'b00000; // Set input values
        #period;
        if (!(w === 8'b00000000 && x === 8'b00000000 && y === 8'b00000100 && z === 8'b00000011)) begin
            $display("Mismatch at index 19: Inputs = [%b, %b, %b, %b, %b, %b], Generated = [%b, %b, %b, %b], Reference = [%b, %b, %b, %b]", 5'b00000, 5'b00000, 5'b00000, 5'b00000, 5'b01000, 5'b00000, w, x, y, z, 8'b00000000, 8'b00000000, 8'b00000100, 8'b00000011);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 19 passed!");
        end

        // Tick 20: Inputs = 5'b00000, 5'b00000, 5'b00000, 5'b00000, 5'b01000, 5'b00000, Generated = w, x, y, z, Reference = 8'b00000000, 8'b00000000, 8'b00000100, 8'b00000011
        a = 5'b00000; b = 5'b00000; c = 5'b00000; d = 5'b00000; e = 5'b01000; f = 5'b00000; // Set input values
        #period;
        if (!(w === 8'b00000000 && x === 8'b00000000 && y === 8'b00000100 && z === 8'b00000011)) begin
            $display("Mismatch at index 20: Inputs = [%b, %b, %b, %b, %b, %b], Generated = [%b, %b, %b, %b], Reference = [%b, %b, %b, %b]", 5'b00000, 5'b00000, 5'b00000, 5'b00000, 5'b01000, 5'b00000, w, x, y, z, 8'b00000000, 8'b00000000, 8'b00000100, 8'b00000011);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 20 passed!");
        end

        // Tick 21: Inputs = 5'b00000, 5'b00000, 5'b00000, 5'b00000, 5'b10000, 5'b00000, Generated = w, x, y, z, Reference = 8'b00000000, 8'b00000000, 8'b00001000, 8'b00000011
        a = 5'b00000; b = 5'b00000; c = 5'b00000; d = 5'b00000; e = 5'b10000; f = 5'b00000; // Set input values
        #period;
        if (!(w === 8'b00000000 && x === 8'b00000000 && y === 8'b00001000 && z === 8'b00000011)) begin
            $display("Mismatch at index 21: Inputs = [%b, %b, %b, %b, %b, %b], Generated = [%b, %b, %b, %b], Reference = [%b, %b, %b, %b]", 5'b00000, 5'b00000, 5'b00000, 5'b00000, 5'b10000, 5'b00000, w, x, y, z, 8'b00000000, 8'b00000000, 8'b00001000, 8'b00000011);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 21 passed!");
        end

        // Tick 22: Inputs = 5'b00000, 5'b00000, 5'b00000, 5'b00000, 5'b10000, 5'b00000, Generated = w, x, y, z, Reference = 8'b00000000, 8'b00000000, 8'b00001000, 8'b00000011
        a = 5'b00000; b = 5'b00000; c = 5'b00000; d = 5'b00000; e = 5'b10000; f = 5'b00000; // Set input values
        #period;
        if (!(w === 8'b00000000 && x === 8'b00000000 && y === 8'b00001000 && z === 8'b00000011)) begin
            $display("Mismatch at index 22: Inputs = [%b, %b, %b, %b, %b, %b], Generated = [%b, %b, %b, %b], Reference = [%b, %b, %b, %b]", 5'b00000, 5'b00000, 5'b00000, 5'b00000, 5'b10000, 5'b00000, w, x, y, z, 8'b00000000, 8'b00000000, 8'b00001000, 8'b00000011);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 22 passed!");
        end

        // Tick 23: Inputs = 5'b00000, 5'b00000, 5'b00000, 5'b00001, 5'b00000, 5'b00000, Generated = w, x, y, z, Reference = 8'b00000000, 8'b00000000, 8'b00010000, 8'b00000011
        a = 5'b00000; b = 5'b00000; c = 5'b00000; d = 5'b00001; e = 5'b00000; f = 5'b00000; // Set input values
        #period;
        if (!(w === 8'b00000000 && x === 8'b00000000 && y === 8'b00010000 && z === 8'b00000011)) begin
            $display("Mismatch at index 23: Inputs = [%b, %b, %b, %b, %b, %b], Generated = [%b, %b, %b, %b], Reference = [%b, %b, %b, %b]", 5'b00000, 5'b00000, 5'b00000, 5'b00001, 5'b00000, 5'b00000, w, x, y, z, 8'b00000000, 8'b00000000, 8'b00010000, 8'b00000011);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 23 passed!");
        end

        // Tick 24: Inputs = 5'b00000, 5'b00000, 5'b00000, 5'b00001, 5'b00000, 5'b00000, Generated = w, x, y, z, Reference = 8'b00000000, 8'b00000000, 8'b00010000, 8'b00000011
        a = 5'b00000; b = 5'b00000; c = 5'b00000; d = 5'b00001; e = 5'b00000; f = 5'b00000; // Set input values
        #period;
        if (!(w === 8'b00000000 && x === 8'b00000000 && y === 8'b00010000 && z === 8'b00000011)) begin
            $display("Mismatch at index 24: Inputs = [%b, %b, %b, %b, %b, %b], Generated = [%b, %b, %b, %b], Reference = [%b, %b, %b, %b]", 5'b00000, 5'b00000, 5'b00000, 5'b00001, 5'b00000, 5'b00000, w, x, y, z, 8'b00000000, 8'b00000000, 8'b00010000, 8'b00000011);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 24 passed!");
        end

        // Tick 25: Inputs = 5'b11111, 5'b00000, 5'b11111, 5'b00000, 5'b11111, 5'b00000, Generated = w, x, y, z, Reference = 8'b11111000, 8'b00111110, 8'b00001111, 8'b10000011
        a = 5'b11111; b = 5'b00000; c = 5'b11111; d = 5'b00000; e = 5'b11111; f = 5'b00000; // Set input values
        #period;
        if (!(w === 8'b11111000 && x === 8'b00111110 && y === 8'b00001111 && z === 8'b10000011)) begin
            $display("Mismatch at index 25: Inputs = [%b, %b, %b, %b, %b, %b], Generated = [%b, %b, %b, %b], Reference = [%b, %b, %b, %b]", 5'b11111, 5'b00000, 5'b11111, 5'b00000, 5'b11111, 5'b00000, w, x, y, z, 8'b11111000, 8'b00111110, 8'b00001111, 8'b10000011);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 25 passed!");
        end

        if (mismatch_count == 0)
            $display("All tests passed!");
        else
            $display("%0d mismatches out of %0d total tests.", mismatch_count, 26);
        $finish;
    end

endmodule