// This program was cloned from: https://github.com/DingWH03/verilog-demo
// License: GNU General Public License v3.0

module Add64bit_test;

    // Inputs
    reg [63:0] A;
    reg [63:0] B;

    // Output
    wire [63:0] Sum;
    wire Co;

    // Instantiate the 64-bit adder
    Adder64bit UUT (
        .Ci(1'b0),
        .A(A),
        .B(B),
        .Sum(Sum),
        .Co(Co)
    );

    // Initialize testbench
    initial begin
        // Test case 1: Adding two positive numbers
        A = 64'h123456789ABCDEF0;
        B = 64'hA1B2C3D4E5F67891;
        #10; // Wait a few time units for the result
        $display("Test Case 1:");
        $display("A = %h", A);
        $display("B = %h", B);
        $display("Sum = %h", Sum);
        $display("Co = %h", Co);

        // Test case 2: Adding a positive and a negative number
        A = 64'hFFFFFFFFFFFFFFFF; // -1 in 2's complement
        B = 64'h0000000000000001; // 1
        #10; // Wait a few time units for the result
        $display("Test Case 2:");
        $display("A = %h", A);
        $display("B = %h", B);
        $display("Sum = %h", Sum);
        $display("Co = %h", Co);

        // Add more test cases as needed...

        // Finish simulation
        $finish;
    end

endmodule
