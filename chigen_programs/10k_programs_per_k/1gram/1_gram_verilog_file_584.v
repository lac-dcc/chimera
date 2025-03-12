// Seed: 499242346
module module_0 (
    output uwire id_0,
    input tri1 id_1,
    input wand id_2,
    output tri id_3,
    output wor id_4,
    output supply1 id_5,
    input wand id_6,
    output supply1 id_7,
    output wand id_8,
    input tri1 id_9,
    input uwire void id_10,
    input tri0 id_11,
    input tri1 id_12,
    input wor id_13
);
  assign id_8#(
      .id_6 (-1),
      .id_12(1)
  ) = id_9;
  logic id_15;
endmodule
module module_1 (
    input wire id_0,
    input wand id_1,
    input tri id_2,
    output supply0 id_3,
    input uwire id_4,
    inout uwire id_5
);
  logic id_7;
  module_0 modCall_1 (
      id_3,
      id_5,
      id_5,
      id_3,
      id_5,
      id_3,
      id_1,
      id_5,
      id_5,
      id_5,
      id_0,
      id_2,
      id_4,
      id_0
  );
  assign modCall_1.id_0 = 0;
endmodule
