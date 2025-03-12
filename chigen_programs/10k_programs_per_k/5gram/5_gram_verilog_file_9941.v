// Seed: 2270833651
module module_0 (
    input tri0 id_0,
    output uwire id_1,
    output supply1 id_2,
    input wor id_3
);
  tri1 [1 : -1] id_5 = -1;
endmodule
module module_1 (
    input tri0 id_0,
    output supply0 id_1,
    input supply1 id_2,
    output logic id_3,
    input uwire id_4,
    input tri1 id_5
);
  always_comb @(posedge id_4 < id_0 or posedge id_2 & "") begin : LABEL_0
    if (1) id_3 <= 1 ? -1'h0 : id_5;
  end
  module_0 modCall_1 (
      id_2,
      id_1,
      id_1,
      id_5
  );
  assign modCall_1.id_3 = 0;
endmodule
