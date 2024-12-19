// Seed: 2311438001
module module_0 (
    output wire id_0,
    output wor id_1,
    output supply0 id_2,
    output tri0 id_3,
    input tri id_4,
    input supply1 id_5
    , id_14,
    output uwire id_6,
    output wand id_7,
    input supply0 id_8,
    output wire id_9,
    input tri1 id_10,
    input tri1 id_11,
    output tri id_12
);
  wire id_15;
  wire id_16;
endmodule
module module_1 (
    output supply0 id_0,
    output wor id_1,
    output tri1 id_2,
    input tri1 id_3,
    input tri0 id_4
);
  tri id_6 = id_3;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_2,
      id_1,
      id_6,
      id_3,
      id_6,
      id_6,
      id_3,
      id_6,
      id_6,
      id_3,
      id_1
  );
  assign modCall_1.id_8 = 0;
  id_7(
      .id_0(1),
      .id_1(1),
      .id_2(id_0),
      .id_3(1'b0),
      .id_4(1'h0),
      .id_5(id_1),
      .id_6(),
      .id_7(id_2 && 1)
  );
  xnor primCall (id_1, id_3, id_6, id_4);
endmodule
