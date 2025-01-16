// Seed: 1929645193
module module_0 (
    input wand id_0,
    output supply1 id_1,
    output uwire id_2,
    input wand id_3,
    input wor id_4,
    input supply0 id_5,
    output tri0 id_6,
    output tri1 id_7
);
  wire id_9;
  id_10(
      .id_0(id_1.id_0 / 1'b0),
      .id_1(id_7),
      .id_2(1),
      .id_3(-1),
      .id_4(id_3),
      .id_5(id_2),
      .id_6((id_1))
  );
  `define pp_11 0
endmodule
module module_1 (
    input wor id_0,
    output wand id_1,
    input wire id_2,
    output wor id_3,
    input tri1 id_4,
    input wire id_5,
    input uwire id_6,
    input wand id_7,
    output supply1 id_8,
    input wor id_9
);
  assign id_1 = id_4;
  always $display;
  and primCall (id_1, id_2, id_5, id_6, id_9, id_0, id_4, id_7);
  module_0 modCall_1 (
      id_2,
      id_8,
      id_1,
      id_9,
      id_5,
      id_6,
      id_1,
      id_1
  );
  assign modCall_1.id_1 = 0;
endmodule
