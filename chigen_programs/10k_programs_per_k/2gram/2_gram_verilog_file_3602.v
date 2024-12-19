// Seed: 2363572686
module module_0 (
    input wand id_0,
    output tri id_1,
    input tri1 id_2,
    input supply1 id_3,
    input wand id_4,
    output wire id_5
);
  wand id_7 = id_3;
  assign module_1.type_1 = 0;
endmodule
module module_1 (
    input  uwire id_0,
    input  tri   id_1,
    input  wand  id_2,
    output uwire id_3,
    input  wor   id_4,
    output wor   id_5,
    input  uwire id_6
);
  wire id_8;
  logic [7:0] id_9;
  module_0 modCall_1 (
      id_0,
      id_3,
      id_1,
      id_0,
      id_4,
      id_3
  );
  assign id_9[1] = id_8;
endmodule
