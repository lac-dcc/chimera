// Seed: 203934690
module module_0 (
    output wor id_0,
    input tri1 id_1,
    input wor id_2,
    input supply0 id_3,
    output tri1 id_4,
    input supply0 id_5,
    output wor id_6,
    output tri1 id_7,
    input supply1 id_8,
    input wor id_9
    , id_15,
    input tri1 id_10,
    output tri1 id_11,
    output tri id_12,
    input wor id_13
);
  assign id_12 = -1'h0 | 1 ? -1 : id_10;
endmodule
module module_1 (
    input  uwire id_0,
    output wor   id_1
);
  assign id_1 = id_0;
  module_0 modCall_1 (
      id_1,
      id_0,
      id_0,
      id_0,
      id_1,
      id_0,
      id_1,
      id_1,
      id_0,
      id_0,
      id_0,
      id_1,
      id_1,
      id_0
  );
  assign modCall_1.id_7 = 0;
endmodule
