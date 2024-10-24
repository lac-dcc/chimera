// Seed: 399763124
module module_0 (
    output logic id_0,
    input id_1,
    output logic id_2,
    output id_3,
    output logic id_4,
    output logic id_5,
    output id_6,
    input id_7
);
  assign id_3 = {(id_7 | 1'd0 >>> id_1), id_1, id_7};
endmodule
