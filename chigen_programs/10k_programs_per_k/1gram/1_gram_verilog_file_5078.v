// Seed: 3098254248
module module_0 (
    output tri1 id_0,
    input supply1 id_1,
    input wire id_2,
    input supply1 id_3,
    input tri id_4,
    output tri id_5,
    input supply0 id_6,
    output tri1 id_7,
    output tri id_8,
    output wand id_9,
    input supply0 id_10,
    input wire id_11,
    output wand id_12,
    input wor id_13,
    input wire id_14,
    input wire id_15,
    output tri0 id_16,
    input uwire id_17,
    input uwire id_18,
    input uwire void id_19,
    input wor id_20,
    output wor id_21,
    output uwire id_22,
    output uwire id_23,
    input tri id_24,
    output wand id_25,
    output wire id_26
    , id_29,
    output wor id_27
);
  assign id_25 = 1;
  always_ff id_29 = 1;
  assign module_1.type_6 = 0;
endmodule : SymbolIdentifier
module module_1 (
    input  wire  id_0,
    input  tri   id_1,
    input  logic id_2,
    output uwire id_3,
    output wor   id_4,
    input  wor   id_5,
    output tri   id_6,
    output logic id_7
);
  always_ff id_7 <= id_2;
  xor primCall (id_4, id_1, id_5, id_2, id_0);
  module_0 modCall_1 (
      id_6,
      id_5,
      id_5,
      id_0,
      id_0,
      id_4,
      id_5,
      id_6,
      id_3,
      id_3,
      id_0,
      id_5,
      id_6,
      id_1,
      id_1,
      id_5,
      id_3,
      id_1,
      id_5,
      id_0,
      id_0,
      id_3,
      id_4,
      id_4,
      id_0,
      id_3,
      id_4,
      id_4
  );
endmodule
