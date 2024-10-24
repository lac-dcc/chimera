// Seed: 2115341807
`timescale 1 ps / 1ps
module module_0 (
    output logic id_0,
    input id_1
);
  always @(id_1) id_0 = {1'h0 ^ id_1 - id_1{1'd0}};
endmodule
