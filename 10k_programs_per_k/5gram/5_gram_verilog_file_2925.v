// Seed: 3859583884
module module_0 (
    output logic id_0,
    input logic id_1,
    input id_2
);
  assign id_0 = id_1 ? 1'b0 : id_1 ^ 1 == 1'd0 ? id_2 : id_1;
endmodule
