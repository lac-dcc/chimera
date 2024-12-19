// Seed: 4205859147
module module_0 (
    output tri id_0,
    input wor id_1,
    input tri1 id_2,
    input tri id_3,
    input wand id_4,
    input supply1 id_5,
    output wand id_6,
    input supply1 id_7,
    input supply0 id_8,
    output supply1 id_9,
    input wand module_0,
    input supply1 id_11,
    output supply0 id_12,
    output wor id_13,
    output wire id_14,
    input wand id_15,
    input tri id_16
);
  id_18(
      .id_0(1), .id_1(id_11)
  );
  wire id_19 = id_2;
endmodule
module module_1 (
    output supply1 id_0,
    output tri id_1,
    input supply1 id_2,
    output uwire id_3,
    output wand id_4,
    input tri0 id_5
);
  assign id_4 = 1;
  module_0 modCall_1 (
      id_3,
      id_5,
      id_2,
      id_5,
      id_2,
      id_2,
      id_4,
      id_5,
      id_2,
      id_1,
      id_5,
      id_2,
      id_1,
      id_3,
      id_3,
      id_2,
      id_5
  );
  assign modCall_1.type_8 = 0;
endmodule
