// Seed: 1123733905
`timescale 1 ps / 1ps
module module_0 (
    input id_0,
    output logic id_1,
    output id_2,
    input id_3,
    output id_4
);
  always @(id_0 or posedge id_3) id_2 <= id_3;
  assign id_4 = 1 - id_0;
  always @(1) #1 id_4 <= 1;
endmodule
