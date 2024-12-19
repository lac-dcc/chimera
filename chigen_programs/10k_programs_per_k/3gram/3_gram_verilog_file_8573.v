// Seed: 2964555665
module module_0 (
    input wor id_0,
    output supply1 id_1,
    input tri1 id_2,
    output uwire id_3,
    output wor id_4,
    input wor id_5,
    input tri1 id_6,
    output tri1 id_7,
    input wor id_8,
    output supply0 id_9,
    input tri id_10,
    input tri0 id_11,
    input tri0 id_12,
    input tri0 id_13,
    input wire id_14,
    output supply1 id_15,
    output supply1 id_16,
    output supply1 id_17
);
  wire id_19;
  assign id_1 = id_6;
  id_20(
      .id_0(id_19), .sum(id_11), .id_1(id_15), .id_2(id_12)
  );
  wire id_21;
endmodule
module module_1 (
    input  tri0 id_0,
    input  wand id_1,
    input  tri  id_2,
    output wand id_3,
    input  tri1 id_4,
    input  wand id_5,
    output tri0 id_6,
    output tri0 id_7
);
  wire id_9 = 1;
  module_0 modCall_1 (
      id_0,
      id_3,
      id_1,
      id_3,
      id_3,
      id_5,
      id_5,
      id_6,
      id_0,
      id_6,
      id_4,
      id_0,
      id_5,
      id_1,
      id_1,
      id_6,
      id_7,
      id_6
  );
  assign modCall_1.type_8 = 0;
endmodule
