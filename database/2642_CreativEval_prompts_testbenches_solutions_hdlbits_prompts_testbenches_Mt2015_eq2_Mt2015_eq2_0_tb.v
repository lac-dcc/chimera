// This program was cloned from: https://github.com/matthewdelorenzo/CreativEval
// License: BSD 3-Clause "New" or "Revised" License

`timescale 1 ns/10 ps  // time-unit = 1 ns, precision = 10 ps

module top_module_tb;

    // duration for each bit = 20 * timescale = 20 * 1 ns  = 20ns
    localparam period = 20;

    reg [1:0] A;
    reg [1:0] B;

    wire z;


    integer mismatch_count;

    top_module UUT (.A(A), .B(B), .z(z));

    initial begin
        mismatch_count = 0;

        // Tick 0: Inputs = 2'b01, 2'b00, Generated = z, Reference = 1'b0
        A = 2'b01; B = 2'b00; // Set input values
        #period;
        if (!(z === 1'b0)) begin
            $display("Mismatch at index 0: Inputs = [%b, %b], Generated = [%b], Reference = [%b]", 2'b01, 2'b00, z, 1'b0);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 0 passed!");
        end

        // Tick 1: Inputs = 2'b00, 2'b01, Generated = z, Reference = 1'b0
        A = 2'b00; B = 2'b01; // Set input values
        #period;
        if (!(z === 1'b0)) begin
            $display("Mismatch at index 1: Inputs = [%b, %b], Generated = [%b], Reference = [%b]", 2'b00, 2'b01, z, 1'b0);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 1 passed!");
        end

        // Tick 2: Inputs = 2'b10, 2'b01, Generated = z, Reference = 1'b0
        A = 2'b10; B = 2'b01; // Set input values
        #period;
        if (!(z === 1'b0)) begin
            $display("Mismatch at index 2: Inputs = [%b, %b], Generated = [%b], Reference = [%b]", 2'b10, 2'b01, z, 1'b0);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 2 passed!");
        end

        // Tick 3: Inputs = 2'b00, 2'b11, Generated = z, Reference = 1'b0
        A = 2'b00; B = 2'b11; // Set input values
        #period;
        if (!(z === 1'b0)) begin
            $display("Mismatch at index 3: Inputs = [%b, %b], Generated = [%b], Reference = [%b]", 2'b00, 2'b11, z, 1'b0);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 3 passed!");
        end

        // Tick 4: Inputs = 2'b11, 2'b01, Generated = z, Reference = 1'b0
        A = 2'b11; B = 2'b01; // Set input values
        #period;
        if (!(z === 1'b0)) begin
            $display("Mismatch at index 4: Inputs = [%b, %b], Generated = [%b], Reference = [%b]", 2'b11, 2'b01, z, 1'b0);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 4 passed!");
        end

        // Tick 5: Inputs = 2'b11, 2'b01, Generated = z, Reference = 1'b0
        A = 2'b11; B = 2'b01; // Set input values
        #period;
        if (!(z === 1'b0)) begin
            $display("Mismatch at index 5: Inputs = [%b, %b], Generated = [%b], Reference = [%b]", 2'b11, 2'b01, z, 1'b0);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 5 passed!");
        end

        // Tick 6: Inputs = 2'b01, 2'b01, Generated = z, Reference = 1'b1
        A = 2'b01; B = 2'b01; // Set input values
        #period;
        if (!(z === 1'b1)) begin
            $display("Mismatch at index 6: Inputs = [%b, %b], Generated = [%b], Reference = [%b]", 2'b01, 2'b01, z, 1'b1);
            mismatch_count = mismatch_count + 1;
        end

        else begin
            $display("Test 6 passed!");
        end

        // Tick 7: Inputs = 2'b00, 2'b10, Generated = z, Reference = 1'b0
        A = 2'b00; B = 2'b10; // Set input values
        #period;
        if (!(z === 1'b0)) begin
            $display("Mismatch at index 7: Inputs = [%b, %b], Generated = [%b], Reference = [%b]", 2'b00, 2'b10, z, 1'b0);
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