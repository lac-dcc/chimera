// Seed: 2449145228
module module_0 (
    output wand id_0,
    input supply0 id_1,
    input uwire id_2,
    output tri0 id_3,
    input wor id_4,
    input wire id_5,
    input supply0 id_6,
    output tri1 id_7,
    input wire id_8,
    input wire id_9,
    output supply0 id_10,
    input supply1 id_11
);
  assign id_3 = 1;
endmodule
module module_1 (
    input  uwire id_0,
    output wor   id_1
);
  wand id_3;
  module_0(
      id_1, id_0, id_0, id_1, id_0, id_0, id_0, id_1, id_0, id_0, id_1, id_0
  );
  tri  id_4;
  wand id_5;
  assign id_5 = 1'b0 - id_0;
  rtran (id_3, id_3, 1);
  always @(1) id_3 = id_4 ~^ 1;
endmodule
