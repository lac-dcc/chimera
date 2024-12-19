// Seed: 3504009725
module module_0 (
    output tri0 id_0,
    input supply1 id_1,
    output tri id_2,
    output tri0 id_3,
    output wor id_4
    , id_12,
    output supply0 id_5,
    output wor id_6,
    output tri1 id_7,
    input supply0 id_8,
    output tri0 id_9,
    input wand id_10
);
  wire id_13;
  wire id_14;
  id_15(
      .id_0(1), .id_1(1), .id_2(1), .id_3(id_10), .id_4(id_12[1])
  );
endmodule
module module_1 (
    output supply1 id_0,
    output tri id_1,
    output supply1 id_2,
    input uwire id_3
);
  id_5(
      .id_0(1), .id_1(1), .id_2(1), .id_3(1)
  );
  module_0 modCall_1 (
      id_0,
      id_3,
      id_2,
      id_0,
      id_0,
      id_1,
      id_0,
      id_0,
      id_3,
      id_2,
      id_3
  );
  assign modCall_1.id_6 = 0;
endmodule
