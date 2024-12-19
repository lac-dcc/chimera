// Seed: 3080391239
module module_0 (
    output tri1 id_0,
    input uwire id_1,
    input supply1 id_2,
    output supply1 id_3,
    input tri1 id_4,
    output supply0 id_5,
    input supply1 id_6,
    output supply0 id_7,
    input tri0 id_8,
    input supply0 id_9,
    output wire id_10,
    input tri1 id_11
);
  always force id_5 = 1 + 1;
  assign module_1.id_3 = 0;
endmodule
module module_1 (
    output tri0 id_0,
    input supply0 id_1,
    input tri1 id_2,
    output tri1 id_3
);
  module_0 modCall_1 (
      id_3,
      id_2,
      id_1,
      id_3,
      id_2,
      id_3,
      id_2,
      id_3,
      id_2,
      id_2,
      id_0,
      id_1
  );
  generate
    for (id_5 = id_2; id_2; id_0 = id_2) begin : LABEL_0
      assign id_5 = id_5;
    end
  endgenerate
endmodule
