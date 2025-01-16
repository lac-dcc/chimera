// Seed: 3864259631
module module_0 (
    input  wor   id_0,
    input  tri   id_1,
    input  uwire id_2,
    output uwire id_3,
    input  wire  id_4,
    input  tri   id_5,
    output tri   id_6,
    input  wand  id_7,
    input  wor   id_8,
    output tri0  id_9
);
  bit id_11, id_12, id_13;
  reg id_14, id_15;
  wire id_16;
  initial begin : LABEL_0
    id_13 <= (id_15);
  end
endmodule : SymbolIdentifier
module module_1 (
    input tri1 id_0,
    input tri0 id_1,
    output wire id_2,
    input tri0 id_3,
    output logic id_4,
    input wor id_5,
    input supply0 id_6,
    input wire id_7,
    input supply0 id_8,
    output tri1 id_9,
    input wand id_10,
    input supply1 id_11,
    output tri1 id_12,
    input wor id_13,
    input supply1 id_14,
    output supply0 id_15,
    output tri0 id_16,
    input logic id_17,
    output wor id_18,
    output supply0 id_19
);
  initial id_4 <= id_17;
  module_0 modCall_1 (
      id_5,
      id_1,
      id_6,
      id_9,
      id_6,
      id_6,
      id_18,
      id_11,
      id_11,
      id_9
  );
  assign modCall_1.type_19 = 0;
  nand primCall (id_9, id_17, id_3, id_11, id_7, id_0, id_5, id_10, id_6, id_1, id_14, id_8, id_13);
endmodule
