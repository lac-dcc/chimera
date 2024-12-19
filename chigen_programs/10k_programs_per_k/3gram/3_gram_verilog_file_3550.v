// Seed: 3488149655
module module_0 (
    input  tri0  id_0,
    output tri1  id_1,
    input  wire  id_2,
    output wire  id_3,
    input  tri   id_4,
    input  tri0  id_5,
    output tri   id_6,
    input  uwire id_7
);
  always @(negedge 1);
  assign module_1.id_8 = 0;
  wire id_9;
endmodule
module module_1 (
    input  tri0 id_0,
    input  tri  id_1,
    output tri1 id_2,
    output tri  id_3,
    output wire id_4,
    input  wire id_5,
    input  wand id_6,
    output wand id_7,
    output tri1 id_8
);
  not primCall (id_8, id_5);
  module_0 modCall_1 (
      id_0,
      id_8,
      id_1,
      id_8,
      id_5,
      id_5,
      id_7,
      id_1
  );
endmodule
