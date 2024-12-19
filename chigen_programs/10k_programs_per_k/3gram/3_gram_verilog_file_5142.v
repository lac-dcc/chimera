// Seed: 3353348923
module module_0 (
    output wor id_0,
    output tri id_1,
    input tri1 id_2,
    output supply1 id_3,
    input supply0 id_4,
    input supply0 id_5,
    input supply0 id_6,
    input uwire id_7,
    output tri id_8,
    input tri id_9,
    input tri0 id_10,
    input wire id_11,
    input wire id_12,
    output tri1 id_13,
    input tri1 id_14,
    output supply1 id_15,
    output wand id_16,
    input wand id_17,
    output tri0 id_18,
    output wand id_19,
    input tri0 id_20,
    input wor id_21
);
  id_23(
      .id_0(id_16), .id_1("")
  );
endmodule
module module_1 (
    input supply0 id_0,
    input wand id_1,
    input wor id_2,
    input tri1 id_3,
    input uwire id_4,
    input wor id_5,
    input tri0 id_6,
    input wor id_7,
    output tri0 id_8
);
  wor id_10 = id_0;
  module_0 modCall_1 (
      id_10,
      id_10,
      id_4,
      id_8,
      id_4,
      id_5,
      id_6,
      id_1,
      id_10,
      id_1,
      id_1,
      id_2,
      id_2,
      id_8,
      id_10,
      id_10,
      id_10,
      id_2,
      id_8,
      id_10,
      id_6,
      id_10
  );
  assign modCall_1.type_27 = 0;
  genvar id_11;
  assign id_8 = id_11;
endmodule
