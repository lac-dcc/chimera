// This program was cloned from: https://github.com/matthewdelorenzo/CreativEval
// License: BSD 3-Clause "New" or "Revised" License

`timescale 1 ns/10 ps  // time-unit = 1 ns, precision = 10 ps

module top_module_tb;

    // duration for each bit = 20 * timescale = 20 * 1 ns  = 20ns
    localparam period = 20;

    reg clk;
    reg x;
    reg [2:0] y;

    wire Y0;
    wire z;


    integer mismatch_count;

    top_module UUT (.clk(clk), .x(x), .y(y), .Y0(Y0), .z(z));

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

        // Tick 0: Inputs = 1'b0, 1'b1, 3'b100, Generated = Y0, z, Reference = 1'b0, 1'b1
        x = 1'b1; y = 3'b100; // Set input values
        #period;
        if (!(Y0 === 1'b0 && z === 1'b1)) begin
            $display("Mismatch at index 0: Inputs = [%b, %b, %b], Generated = [%b, %b], Reference = [%b, %b]", 1'b0, 1'b1, 3'b100, Y0, z, 1'b0, 1'b1);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 0 passed!");
        end

        // Tick 1: Inputs = 1'b1, 1'b1, 3'b001, Generated = Y0, z, Reference = 1'b0, 1'b0
        x = 1'b1; y = 3'b001; // Set input values
        #period;
        if (!(Y0 === 1'b0 && z === 1'b0)) begin
            $display("Mismatch at index 1: Inputs = [%b, %b, %b], Generated = [%b, %b], Reference = [%b, %b]", 1'b1, 1'b1, 3'b001, Y0, z, 1'b0, 1'b0);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 1 passed!");
        end

        // Tick 2: Inputs = 1'b0, 1'b1, 3'b101, Generated = Y0, z, Reference = 1'bx, 1'bx
        x = 1'b1; y = 3'b101; // Set input values
        #period;
        // Tick 3: Inputs = 1'b1, 1'b0, 3'b101, Generated = Y0, z, Reference = 1'bx, 1'bx
        x = 1'b0; y = 3'b101; // Set input values
        #period;
        // Tick 4: Inputs = 1'b0, 1'b1, 3'b001, Generated = Y0, z, Reference = 1'b0, 1'b0
        x = 1'b1; y = 3'b001; // Set input values
        #period;
        if (!(Y0 === 1'b0 && z === 1'b0)) begin
            $display("Mismatch at index 4: Inputs = [%b, %b, %b], Generated = [%b, %b], Reference = [%b, %b]", 1'b0, 1'b1, 3'b001, Y0, z, 1'b0, 1'b0);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 4 passed!");
        end

        // Tick 5: Inputs = 1'b1, 1'b1, 3'b110, Generated = Y0, z, Reference = 1'bx, 1'bx
        x = 1'b1; y = 3'b110; // Set input values
        #period;
        // Tick 6: Inputs = 1'b0, 1'b0, 3'b101, Generated = Y0, z, Reference = 1'bx, 1'bx
        x = 1'b0; y = 3'b101; // Set input values
        #period;
        // Tick 7: Inputs = 1'b1, 1'b0, 3'b001, Generated = Y0, z, Reference = 1'b1, 1'b0
        x = 1'b0; y = 3'b001; // Set input values
        #period;
        if (!(Y0 === 1'b1 && z === 1'b0)) begin
            $display("Mismatch at index 7: Inputs = [%b, %b, %b], Generated = [%b, %b], Reference = [%b, %b]", 1'b1, 1'b0, 3'b001, Y0, z, 1'b1, 1'b0);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 7 passed!");
        end

        if (mismatch_count == 0)
            $display("All tests passed!");
        else
            $display("%0d mismatches out of %0d total tests.", mismatch_count, 8);
        $finish;
    end

endmodule