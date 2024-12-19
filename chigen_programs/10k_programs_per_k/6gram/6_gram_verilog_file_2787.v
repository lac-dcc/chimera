// Seed: 2662286756
module module_0 (
    input supply1 id_0,
    input tri1 id_1,
    input uwire id_2,
    input wand id_3,
    input tri1 id_4,
    input wor id_5,
    input wand id_6,
    input wor id_7
);
  id_9(
      .id_0(1),
      .id_1(id_5),
      .id_2(1),
      .id_3(),
      .id_4(1'd0 * id_6),
      .id_5((id_3 || 1 + (1)) == 1'b0),
      .id_6()
  );
endmodule
module module_1 (
    output supply0 id_0,
    output tri0 id_1,
    output tri0 id_2,
    input tri1 id_3,
    input wor id_4,
    output tri id_5,
    input wire id_6
    , id_15,
    output uwire id_7,
    output wand id_8,
    input tri1 id_9,
    input wand id_10,
    input tri0 id_11,
    output wand id_12,
    output tri id_13
);
  wire id_16;
  module_0 modCall_1 (
      id_6,
      id_10,
      id_10,
      id_10,
      id_9,
      id_3,
      id_11,
      id_4
  );
  assign modCall_1.id_4 = 0;
endmodule
