// Seed: 3042610793
module module_0 (
    input wand id_0,
    output wand id_1,
    input wand id_2,
    input supply0 id_3,
    input supply1 id_4,
    input wand id_5,
    input wand id_6,
    output tri id_7
);
  wire id_9;
  assign module_1.id_1 = 0;
  always_ff @* id_9 = !id_2;
endmodule
module module_1 (
    output wand  id_0,
    input  uwire id_1,
    input  wand  id_2,
    input  wand  id_3,
    output wire  id_4,
    input  tri   id_5,
    input  uwire id_6,
    input  uwire id_7
);
  wire id_9;
  wire id_10;
  module_0 modCall_1 (
      id_6,
      id_0,
      id_1,
      id_9,
      id_9,
      id_5,
      id_6,
      id_4
  );
  wire id_11;
endmodule
