// Seed: 1753073896
module module_0 (
    input wand id_0,
    input wire id_1,
    input wor id_2,
    input supply0 id_3,
    output supply1 id_4,
    input wand id_5,
    output tri id_6,
    input uwire id_7,
    input uwire id_8,
    output wor id_9,
    input wor id_10,
    output uwire id_11
);
  wire id_13;
  assign id_6 = id_7;
  uwire id_14;
  wire  id_15;
  id_16(
      .id_0(),
      .id_1(1),
      .id_2(id_6 & id_7),
      .id_3(1),
      .id_4(id_5),
      .id_5(id_9),
      .id_6(id_6),
      .id_7((id_8))
  );
  assign id_14 = 1;
endmodule
module module_1 (
    input tri1 id_0,
    input wand id_1,
    output supply1 id_2,
    output tri0 id_3,
    output tri1 id_4,
    input wor id_5,
    input wor id_6,
    output tri id_7,
    input uwire id_8,
    output wand id_9
);
  id_11(
      1 - id_8, 1
  );
  wire id_12;
  module_0 modCall_1 (
      id_5,
      id_0,
      id_8,
      id_5,
      id_2,
      id_5,
      id_4,
      id_8,
      id_1,
      id_7,
      id_0,
      id_4
  );
  assign modCall_1.id_2 = 0;
  wire id_13;
  wire id_14;
  assign id_7 = id_8;
endmodule
