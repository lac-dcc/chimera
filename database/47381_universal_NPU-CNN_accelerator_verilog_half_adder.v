// This program was cloned from: https://github.com/thousrm/universal_NPU-CNN_accelerator
// License: MIT License


module HA(A, B, S, C);

input A, B;
output S, C;

assign S = A ^ B;
assign C = A & B;

endmodule