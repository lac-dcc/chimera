// Seed: 4138151630
module module_0 (
    output wand id_0,
    output uwire id_1,
    input wand id_2,
    input uwire id_3,
    output tri id_4,
    output tri1 id_5,
    input wand id_6,
    output supply1 id_7
);
  assign id_4 = 1 ? id_2 : 1;
endmodule
module module_1 (
    output uwire id_0,
    input  tri   id_1,
    input  tri   id_2,
    input  tri1  id_3,
    output wor   id_4,
    output tri   id_5,
    output tri1  id_6,
    output uwire id_7,
    input  wor   id_8
    , id_12,
    output tri0  id_9,
    output tri   id_10
);
  always @(id_3) $display;
  module_0 modCall_1 (
      id_10,
      id_4,
      id_8,
      id_8,
      id_6,
      id_5,
      id_3,
      id_7
  );
  assign modCall_1.id_4 = 0;
endmodule
