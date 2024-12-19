// Seed: 2983668319
module module_0 (
    input supply1 id_0,
    output tri0 id_1,
    input tri1 id_2,
    input wand id_3,
    input tri1 id_4,
    input tri id_5,
    input uwire id_6,
    output wand id_7,
    output wor id_8,
    output wor id_9,
    input wire id_10,
    input tri0 id_11,
    output tri id_12,
    input wand id_13,
    input wand id_14,
    input uwire id_15,
    input tri0 id_16,
    input supply1 id_17
);
  assign id_12 = 1 && id_14;
  wire id_19;
  wire id_20, id_21;
endmodule
module module_1 (
    output tri0 id_0,
    output supply0 id_1,
    input tri0 id_2,
    input wand id_3,
    output uwire id_4,
    output logic id_5,
    input logic id_6,
    output supply1 id_7,
    input wor id_8,
    input tri0 id_9,
    input tri id_10
);
  always @(1) id_5 <= id_6;
  module_0 modCall_1 (
      id_2,
      id_7,
      id_2,
      id_9,
      id_9,
      id_2,
      id_10,
      id_0,
      id_0,
      id_0,
      id_10,
      id_8,
      id_4,
      id_3,
      id_8,
      id_9,
      id_10,
      id_3
  );
  assign modCall_1.id_2 = 0;
endmodule : SymbolIdentifier
