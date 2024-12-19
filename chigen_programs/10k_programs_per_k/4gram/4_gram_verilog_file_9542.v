// Seed: 2349336353
module module_0 (
    output wire  id_0,
    output wand  id_1,
    output uwire id_2,
    input  tri0  id_3,
    input  wor   id_4
);
  module_2 modCall_1 (
      id_0,
      id_2,
      id_4,
      id_0
  );
  assign modCall_1.type_6 = 0;
  assign module_1.type_0  = 0;
endmodule
module module_1 (
    input wand id_0,
    input supply0 id_1,
    output supply1 id_2,
    output wand id_3,
    input wand id_4,
    input wire id_5
    , id_8,
    output wire id_6
);
  nand primCall (id_6, id_0, id_4, id_1, id_8, id_5);
  module_0 modCall_1 (
      id_2,
      id_6,
      id_6,
      id_0,
      id_0
  );
  wire id_9;
endmodule
module module_2 (
    output uwire id_0,
    output supply1 id_1,
    input tri id_2,
    output uwire id_3
);
  supply0 id_5 = id_2;
endmodule
