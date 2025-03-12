// Seed: 434816109
module module_0 (
    input supply1 id_0,
    output tri id_1,
    input uwire id_2,
    output supply0 id_3,
    output uwire id_4,
    output tri id_5,
    output supply0 id_6,
    output supply1 id_7,
    input tri1 id_8,
    input wor id_9,
    input supply1 id_10,
    output uwire id_11,
    output wor id_12,
    input supply1 id_13,
    output tri id_14,
    output wor id_15
);
  wire id_17;
  logic id_18, id_19;
  assign module_0[-1] = -1 + id_17;
endmodule
module module_1 #(
    parameter id_0 = 32'd55
) (
    input tri _id_0,
    input wire id_1,
    output supply0 id_2
);
  wire [-1 : 1  -  id_0] id_4;
  module_0 modCall_1 (
      id_1,
      id_2,
      id_1,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_1,
      id_1,
      id_1,
      id_2,
      id_2,
      id_1,
      id_2,
      id_2
  );
  assign modCall_1.id_12 = 0;
endmodule
