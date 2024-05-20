// This program was cloned from: https://github.com/Men1scus/Principles_of_Computer_Organization
// License: MIT License

module tb;

    // Inputs
    reg clk;
    reg mult_begin;
    reg [31:0] mult_op1;
    reg [31:0] mult_op2;

    // Outputs
    wire [63:0] product;
    wire mult_end;

    // Instantiate the UUT
    multiply uut (
        .clk(clk), 
        .mult_begin(mult_begin), 
        .mult_op1(mult_op1), 
        .mult_op2(mult_op2), 
        .product(product), 
        .mult_end(mult_end)
    );

    initial begin
        // Initialize Inputs
        clk = 0;
        mult_begin = 0;
        mult_op1 = 0;
        mult_op2 = 0;

        // Wait 100 ns for global reset to finish
        #100;
        
        perform_multiplication(32'H00001111, 32'H00001111); // Expected result: 1234321
        perform_multiplication(32'H00001111, 32'H00002222); // Example test case
        perform_multiplication(32'H00000002, 32'HFFFFFFFF); // Edge case: large negative number
        perform_multiplication(32'H00000002, 32'H80000000); // Edge case: overflow
        perform_multiplication(32'H00000000, 32'HFFFFFFFF); // Zero test case
        perform_random_tests(10); // Perform 10 random tests
    end

    // Always toggle clock every 5ns
    always #5 clk = ~clk;

    task perform_multiplication(input [31:0] op1, input [31:0] op2);
        begin
            #100;
            mult_begin = 1;
            mult_op1 = op1;
            mult_op2 = op2;
            #400;
            mult_begin = 0;
            #500;
        end
    endtask

    task perform_random_tests(input integer count);
        integer i;
        begin
            for (i = 0; i < count; i = i + 1) begin
                perform_multiplication($random, $random);
            end
        end
    endtask

endmodule
