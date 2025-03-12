// Seed: 2999702372
module module_0 (
    input  wor   id_0,
    output wand  id_1,
    input  tri0  id_2,
    input  tri0  id_3,
    input  tri   id_4,
    input  tri0  id_5,
    output tri0  id_6,
    input  uwire id_7,
    output tri   id_8,
    input  uwire id_9,
    input  uwire id_10,
    output tri   id_11,
    input  tri1  id_12,
    input  uwire id_13,
    input  tri0  id_14,
    output tri   id_15
);
  uwire id_17 = 1'b0;
endmodule
module module_1 (
    output tri id_0,
    input wire id_1,
    input wire id_2,
    input tri0 id_3,
    output supply1 id_4,
    input wor id_5,
    output wand id_6,
    input uwire id_7,
    output supply0 id_8,
    input tri id_9,
    input tri id_10,
    input tri1 id_11
);
  initial
  fork : SymbolIdentifier
  join_none : SymbolIdentifier
  module_0 modCall_1 (
      id_10,
      id_4,
      id_9,
      id_5,
      id_1,
      id_5,
      id_4,
      id_7,
      id_6,
      id_7,
      id_9,
      id_6,
      id_5,
      id_7,
      id_10,
      id_0
  );
  assign modCall_1.SymbolIdentifier.SymbolIdentifier.id_8 = 0;
endmodule
