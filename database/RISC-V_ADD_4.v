// This program was cloned from: https://github.com/MihVuongNguyen/RISC-V
// License: Apache License 2.0

module add_4 (
    input [31:0] in,
    output [31:0] out
);

assign out = in + 4;
endmodule
