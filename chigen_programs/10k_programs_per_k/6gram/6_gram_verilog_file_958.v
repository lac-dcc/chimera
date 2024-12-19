// Seed: 974229536
module module_0 (
    output supply1 id_0,
    input supply1 id_1,
    output supply1 id_2,
    input tri id_3,
    output tri0 id_4,
    input wand id_5,
    output wire id_6,
    output uwire id_7,
    input wor id_8,
    input uwire id_9,
    output wand id_10,
    input supply1 id_11,
    input wire id_12,
    output wire id_13
);
  id_15(
      .id_0(id_5),
      .id_1(1 - (1 && id_6 == 1)),
      .id_2(id_9 == id_9),
      .id_3(1'b0),
      .id_4(),
      .id_5(1),
      .id_6(1),
      .id_7(id_5),
      .id_8(),
      .id_9(id_13),
      .id_10(1),
      .id_11(id_1),
      .id_12(1),
      .id_13("")
  );
endmodule
module module_1 (
    input supply1 id_0,
    output tri1 id_1,
    output supply1 id_2,
    input supply0 id_3,
    output wand id_4,
    output supply0 id_5
    , id_12,
    input tri0 id_6,
    input uwire id_7,
    output wand id_8,
    output wire id_9,
    output supply0 id_10
);
  assign id_9 = 1;
  module_0 modCall_1 (
      id_10,
      id_0,
      id_8,
      id_6,
      id_1,
      id_7,
      id_5,
      id_9,
      id_6,
      id_0,
      id_9,
      id_6,
      id_3,
      id_1
  );
  assign modCall_1.type_16 = 0;
endmodule
