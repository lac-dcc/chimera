// Seed: 2481728255
module module_0 (
    input  uwire id_0,
    output tri0  id_1,
    input  tri   id_2,
    output wor   id_3,
    input  uwire id_4,
    input  wire  id_5,
    output tri   id_6,
    input  wand  id_7
);
  wor  id_9 = {1};
  wire id_10;
  wire id_11, id_12, id_13;
  wire id_14;
  wire id_15;
  assign id_6 = id_7;
  assign module_1.type_9 = 0;
endmodule
module module_1 (
    output tri0 id_0,
    input tri0 id_1,
    input wand id_2,
    output supply0 id_3,
    input wor id_4,
    output tri0 id_5
);
  assign id_3 = -1;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_2,
      id_3,
      id_2,
      id_2,
      id_3,
      id_4
  );
endmodule : SymbolIdentifier
