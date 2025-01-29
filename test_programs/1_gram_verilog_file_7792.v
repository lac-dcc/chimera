// Seed: 2473971242
module module_0 (
    input  tri0  id_0,
    output wand  id_1,
    output wire  id_2,
    input  uwire id_3,
    input  tri0  id_4,
    input  uwire id_5,
    input  tri   id_6
);
  always_latch
    if (id_0.id_0 / -1) id_2 = ~id_3 - id_0;
    else id_2 = 1;
  reg id_8, id_9;
  bit id_10 = id_8, id_11, id_12, id_13, id_14, id_15;
  always id_8 = id_13;
  assign id_1 = -1 - id_4;
  tri0 id_16;
  bit  id_17 = id_13;
  assign id_1 = ((id_6));
  reg id_18 = id_11, id_19;
  assign id_12 = -1;
  always id_13 <= -1;
  wire id_20, id_21;
  assign id_18 = id_17;
endmodule : SymbolIdentifier
module module_1 (
    input tri id_0,
    output tri1 id_1,
    input uwire id_2,
    output wand id_3,
    output tri0 id_4,
    input supply1 id_5,
    input supply0 id_6,
    input tri id_7,
    input wire id_8
);
  module_0 modCall_1 (
      id_0,
      id_1,
      id_1,
      id_8,
      id_5,
      id_5,
      id_6
  );
  assign modCall_1.type_2 = 0;
endmodule
