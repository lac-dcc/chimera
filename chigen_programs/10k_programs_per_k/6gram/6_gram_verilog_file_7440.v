// Seed: 4195227786
module module_0 (
    output wand id_0,
    input tri0 id_1,
    input wire id_2,
    output uwire id_3,
    output uwire id_4,
    input wor id_5,
    input wire id_6
    , id_19,
    input wire id_7,
    output wor id_8,
    input uwire id_9,
    input tri id_10,
    input wire id_11,
    input wor id_12,
    input wor id_13,
    input wire id_14,
    input supply1 id_15,
    input wor id_16,
    output supply0 id_17
);
endmodule
module module_1 (
    output tri0  id_0,
    input  tri1  id_1,
    output uwire id_2,
    output uwire id_3,
    output wire  id_4
);
  uwire id_6 = 1;
  module_0 modCall_1 (
      id_2,
      id_6,
      id_1,
      id_3,
      id_0,
      id_1,
      id_6,
      id_6,
      id_2,
      id_6,
      id_6,
      id_1,
      id_1,
      id_1,
      id_6,
      id_6,
      id_6,
      id_4
  );
  assign modCall_1.type_1 = 0;
  assign id_6 = 1 ? id_6 : id_1;
  wire id_7;
  id_8(
      .id_0(1),
      .id_1(1),
      .id_2(id_1),
      .id_3(id_7),
      .id_4(1),
      .id_5(1),
      .id_6(~id_9),
      .id_7(1 == 1),
      .id_8(1)
  );
endmodule
