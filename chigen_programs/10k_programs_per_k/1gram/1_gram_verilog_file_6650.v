// Seed: 4160658358
module module_0 (
    input  tri1  id_0,
    input  wire  id_1,
    input  tri   id_2,
    output uwire id_3,
    input  tri0  id_4,
    output tri1  id_5
);
  always #1 id_3 = id_2;
  wire id_7;
endmodule
module module_1 (
    output supply1 id_0,
    output wand id_1,
    output wire id_2,
    output supply1 id_3,
    input wand id_4,
    input tri0 id_5,
    input tri1 id_6,
    input wire id_7,
    input supply1 id_8
);
  wire id_10;
  or primCall (id_0, id_7, id_8, id_6, id_10, id_4);
  module_0 modCall_1 (
      id_6,
      id_5,
      id_4,
      id_1,
      id_4,
      id_0
  );
  assign modCall_1.id_2 = 0;
endmodule
