// Seed: 2789938925
module module_0 (
    output tri0 id_0,
    output supply0 id_1,
    output uwire id_2,
    input tri0 id_3,
    input wire id_4,
    output wand id_5
    , id_21,
    input wire id_6,
    input tri0 id_7,
    input wire id_8,
    output wor id_9
    , id_22,
    input supply1 id_10,
    output wor id_11,
    output tri1 id_12,
    output tri1 id_13,
    input supply0 id_14,
    input tri1 id_15,
    output wor id_16,
    input supply0 id_17,
    output wand id_18,
    output tri1 id_19
);
  initial
  fork
  join_none : SymbolIdentifier
endmodule
module module_1 (
    input  tri1  id_0,
    input  uwire id_1,
    input  wire  id_2,
    output logic id_3,
    input  uwire id_4,
    output tri   id_5,
    input  logic id_6,
    input  tri   id_7
);
  always @(posedge 1 - (id_7 - 1)) begin : LABEL_0
    id_3 <= 1;
  end
  module_0 modCall_1 (
      id_5,
      id_5,
      id_5,
      id_0,
      id_0,
      id_5,
      id_1,
      id_2,
      id_7,
      id_5,
      id_0,
      id_5,
      id_5,
      id_5,
      id_2,
      id_2,
      id_5,
      id_7,
      id_5,
      id_5
  );
  assign modCall_1.type_26 = 0;
  initial id_3 = #1 id_6;
endmodule
