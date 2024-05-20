// This program was cloned from: https://github.com/Rohan7Gupta/pentaRV
// License: Apache License 2.0

module RegFile(
    input clk, rst, we,
    input [4:0] rs1, rs2, rd,
    input [31:0] wd,
    output [31:0] r1, r2
);

    reg [31:0] Register [31:0];
    integer i; // Declare an integer variable for loop iteration

    always @ (negedge clk)
    begin
        if (rst) begin
            // Reset all registers to zero when rst is asserted
            for (i = 0; i < 32; i = i + 1) begin
                Register[i] <= 32'd0;
            end
        end else begin
            if (we & (rd != 5'h00))
                Register[rd] <= wd;
        end
    end
    
    assign r1 = Register[rs1];
    assign r2 = Register[rs2];

endmodule
