// Seed: 2628135043
module module_0 (
    input wor id_0,
    output uwire id_1,
    input uwire id_2,
    input uwire id_3,
    input supply0 id_4,
    output tri id_5,
    output wor id_6,
    input uwire id_7,
    input uwire void id_8
);
  id_10(
      .id_0(id_7),
      .id_1(-1'h0),
      .id_2($realtime),
      .id_3(id_2),
      .id_4(id_5),
      .id_5(id_5),
      .id_6(1'd0),
      .id_7(id_1),
      .id_8(1 & -1),
      .id_9(id_5)
  );
  assign module_1.id_7 = 0;
endmodule
module module_1 (
    output wor id_0,
    input supply0 id_1,
    input tri id_2,
    output wor id_3,
    input uwire id_4,
    output uwire id_5,
    output wand id_6,
    output tri0 id_7,
    input tri id_8,
    input tri id_9,
    input wand id_10,
    output wand id_11,
    input supply1 id_12,
    input supply0 id_13
);
  wire id_15;
  nand primCall (id_11, id_10, id_2, id_9, id_8, id_13, id_15, id_12);
  module_0 modCall_1 (
      id_8,
      id_11,
      id_4,
      id_4,
      id_9,
      id_0,
      id_7,
      id_4,
      id_1
  );
endmodule
