// This program was cloned from: https://github.com/conboy/elec374-cpu
// License: MIT License

module div(input [31:0] a, b, output reg[63:0] result);

    // Internal variables
    reg [31:0] quotient, remainder, divisor;
    reg [31:0] temp_remainder;
    integer i;

    always @(*) begin
        // Initialize variables
        quotient = 0;
        remainder = 0;
        divisor = b;
        temp_remainder = a; // Start with the dividend

        // Main loop for non-restoring division
        for (i = 31; i >= 0; i = i - 1) begin
            // Shift left to make room for the next bit
            remainder = remainder << 1;
            remainder[0] = temp_remainder[31]; // Bring down the next bit of the dividend
            temp_remainder = temp_remainder << 1; // Prepare the temp remainder for the next iteration
            
            // Attempt to subtract the divisor from the remainder
            if (remainder >= divisor) begin
                remainder = remainder - divisor;
                quotient = (quotient << 1) | 1; // Set the current bit of the quotient to 1
            end else begin
                quotient = quotient << 1; // Keep the current bit of the quotient as 0
            end
        end

        // Combine quotient and remainder for the result
       result[31:0] = quotient;
       result[63:32] = remainder; 
    end
endmodule
