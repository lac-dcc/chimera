// Seed: 3531783687
module module_0 (
    output tri0 id_0,
    input uwire id_1,
    output tri id_2,
    input supply0 id_3
);
  wire id_5;
  wire id_6;
  assign id_5 = id_6;
endmodule
macromodule module_1 (
    input tri0 id_0,
    output tri1 id_1,
    input tri id_2,
    input wire id_3,
    output tri0 id_4,
    output tri id_5,
    input uwire void id_6,
    id_13,
    input tri1 id_7,
    output supply1 id_8,
    inout tri0 id_9,
    input wire id_10,
    input wand id_11
);
  id_14 :
  assert property (@(1) id_9) $display;
  id_15(
      .id_0(-1),
      .id_1({-1{-1}}),
      .id_2(-1),
      .id_3(id_11),
      .id_4(id_1),
      .id_5(id_9),
      .id_6(-1),
      .id_7(id_7),
      .id_8(id_0)
  );
  module_0 modCall_1 (
      id_8,
      id_11,
      id_4,
      id_14
  );
  assign modCall_1.id_1 = 0;
  always_comb $display(id_10, 1'b0 - -1, id_2);
endmodule
