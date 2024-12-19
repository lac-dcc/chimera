// Seed: 1179634785
module module_0 (
    input wand id_0,
    output supply1 id_1,
    input tri0 id_2,
    output tri1 id_3,
    input wor id_4,
    input wor id_5,
    output tri1 id_6,
    input tri id_7,
    input uwire id_8,
    input wand id_9,
    input uwire id_10,
    input wand id_11,
    output tri1 id_12,
    input tri0 id_13,
    input supply1 id_14
);
  id_16(
      .id_0(id_7 & id_13 - 1'b0), .id_1(1), .id_2(id_2), .id_3(1)
  );
  assign module_1.id_8 = 0;
endmodule
module module_1 (
    output wire id_0,
    output tri1 id_1,
    input supply0 id_2,
    input wor id_3,
    output wire id_4,
    output tri0 id_5,
    input wire id_6,
    input tri0 id_7,
    input wand id_8,
    input wand id_9,
    output supply1 id_10,
    input tri0 id_11
);
  module_0 modCall_1 (
      id_8,
      id_4,
      id_8,
      id_5,
      id_6,
      id_11,
      id_5,
      id_7,
      id_11,
      id_8,
      id_9,
      id_6,
      id_5,
      id_7,
      id_3
  );
endmodule
