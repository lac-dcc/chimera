// Seed: 3612724031
module module_0 (
    output wor id_0,
    output tri id_1,
    input supply1 id_2,
    output uwire id_3,
    input tri0 id_4
    , id_19, id_20,
    output supply1 id_5,
    output wor id_6,
    output wor id_7,
    output supply1 id_8,
    input wire id_9,
    input tri1 id_10,
    input uwire id_11,
    output supply1 id_12,
    input wor id_13,
    input wor id_14,
    input tri1 id_15,
    input wand id_16,
    output uwire id_17
);
  wire id_21;
  assign id_0 = id_16;
  id_22(
      .id_0(1),
      .id_1(id_4),
      .id_2(id_11 ^ id_13),
      .id_3(1),
      .id_4(id_2 + 1'b0),
      .id_5(id_7),
      .id_6(1),
      .id_7(1)
  );
  assign module_1.type_4 = 0;
endmodule
module module_1 (
    input  uwire id_0,
    output tri1  id_1,
    input  tri   id_2
);
  assign id_1 = 1'h0;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_0,
      id_1,
      id_2,
      id_1,
      id_1,
      id_1,
      id_1,
      id_2,
      id_2,
      id_0,
      id_1,
      id_2,
      id_2,
      id_0,
      id_0,
      id_1
  );
  assign id_1 = id_0;
endmodule
