// Seed: 3060636196
module module_0 (
    input  uwire id_0,
    input  tri1  id_1,
    output wor   id_2,
    input  tri0  id_3,
    output uwire id_4,
    input  uwire id_5,
    output wire  id_6,
    input  wand  id_7,
    input  uwire id_8,
    output tri   id_9
);
  always @(id_3 or posedge 1) id_4 = id_1;
endmodule
module module_1 (
    output wire id_0,
    input tri1 id_1,
    output tri0 id_2,
    output tri1 id_3,
    input tri0 id_4,
    input wand id_5,
    output supply1 id_6
);
  assign id_6 = id_5;
  module_0(
      id_4, id_5, id_6, id_1, id_3, id_1, id_6, id_1, id_5, id_2
  );
endmodule
