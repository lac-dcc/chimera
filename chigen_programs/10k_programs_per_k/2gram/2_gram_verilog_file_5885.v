// Seed: 2279750870
module module_0 (
    input uwire id_0,
    input tri1 id_1,
    input supply1 id_2
    , id_14,
    input wand id_3,
    output wor id_4,
    input wand id_5,
    output tri1 id_6,
    input wor id_7,
    input uwire id_8,
    input supply1 id_9,
    input tri id_10,
    output wor id_11,
    output tri0 id_12
);
  wire id_15;
  wire id_16;
  supply0 id_17;
  id_18(
      .id_0(id_14),
      .id_1(1),
      .id_2(id_14),
      .id_3(id_11),
      .id_4(id_5),
      .id_5(1),
      .id_6(1'b0),
      .id_7(1)
  );
  assign id_6 = id_17;
endmodule
module module_1 (
    input  wor   id_0,
    output uwire id_1
);
  wire id_3;
  module_0 modCall_1 (
      id_0,
      id_0,
      id_0,
      id_0,
      id_1,
      id_0,
      id_1,
      id_0,
      id_0,
      id_0,
      id_0,
      id_1,
      id_1
  );
  assign modCall_1.id_10 = 0;
endmodule
