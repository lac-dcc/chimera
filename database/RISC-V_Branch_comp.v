// This program was cloned from: https://github.com/MihVuongNguyen/RISC-V
// License: Apache License 2.0

module branch_comparator (
    input signed [31:0] A, B,
    output BrEQ, BrLT
);
    
assign BrEQ = (A == B);
assign BrLT = (A < B);
endmodule