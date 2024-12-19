// Seed: 837039868
module module_0 (
    input tri0 id_0,
    input wand id_1,
    input supply0 id_2,
    output uwire id_3,
    input wire id_4,
    input wire id_5,
    output supply0 id_6,
    input wor id_7,
    input wire id_8,
    input supply0 id_9,
    input tri1 id_10,
    input uwire id_11,
    input tri1 id_12,
    output wire id_13,
    output tri0 id_14,
    input uwire id_15,
    input tri id_16
);
  wire id_18;
  wire id_19;
  assign id_14 = 1;
  initial id_14 = 1;
endmodule
module module_1 (
    input  tri  id_0,
    output wand id_1,
    input  wire id_2,
    output wor  id_3
);
  supply0 id_5;
  wire id_6;
  id_7(
      .id_0(1),
      .id_1(id_0 + 1),
      .id_2(id_0),
      .id_3(id_5),
      .id_4(1 - 1),
      .id_5(id_6),
      .id_6(1),
      .id_7(id_0),
      .id_8(1),
      .id_9(id_5 & id_2),
      .id_10(id_3),
      .id_11(1),
      .id_12(((1))),
      .id_13(id_1),
      .id_14(),
      .id_15(id_3),
      .id_16(1),
      .id_17(1)
  );
  module_0 modCall_1 (
      id_0,
      id_2,
      id_0,
      id_3,
      id_2,
      id_0,
      id_1,
      id_0,
      id_2,
      id_2,
      id_0,
      id_2,
      id_2,
      id_1,
      id_1,
      id_2,
      id_2
  );
  assign modCall_1.id_15 = 0;
endmodule
