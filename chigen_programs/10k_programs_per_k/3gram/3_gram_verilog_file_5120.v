// Seed: 2251097916
module module_0 (
    input supply1 id_0,
    input uwire id_1,
    output tri1 id_2,
    input wor id_3,
    input wand id_4,
    input tri0 id_5,
    output tri id_6,
    output tri0 id_7,
    input tri id_8,
    input supply1 id_9,
    input wand id_10,
    input tri1 id_11,
    output uwire id_12,
    output tri0 id_13,
    output tri1 id_14,
    input wor id_15,
    output tri id_16,
    input tri1 id_17,
    input wand id_18,
    input tri1 id_19,
    input supply0 id_20
);
endmodule
module module_1 (
    input wor id_0,
    input tri id_1,
    input tri id_2
);
  uwire id_4 = 1;
  wor   id_5 = id_2;
  module_0 modCall_1 (
      id_0,
      id_2,
      id_5,
      id_5,
      id_0,
      id_1,
      id_5,
      id_5,
      id_1,
      id_5,
      id_2,
      id_1,
      id_5,
      id_5,
      id_5,
      id_5,
      id_5,
      id_2,
      id_0,
      id_0,
      id_5
  );
  assign modCall_1.id_12 = 0;
endmodule
