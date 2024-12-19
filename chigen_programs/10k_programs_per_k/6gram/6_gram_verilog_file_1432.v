// Seed: 1227463517
module module_0 (
    input supply0 id_0,
    input wor id_1,
    input wire id_2,
    input supply1 id_3,
    output tri id_4
);
  assign id_4 = 1;
endmodule
module module_1 (
    input uwire id_0,
    input supply1 id_1,
    input tri id_2,
    output logic id_3,
    input tri0 id_4,
    input tri id_5,
    input wire id_6,
    input tri0 id_7,
    input wor id_8,
    input wire id_9,
    input tri1 id_10,
    output wand id_11,
    input tri0 id_12,
    output wand id_13,
    inout tri0 id_14,
    input uwire id_15,
    input logic id_16,
    output tri0 id_17,
    input tri1 id_18,
    input wire id_19,
    output logic id_20,
    output wand id_21,
    output tri id_22
);
  wire id_24;
  wire id_25;
  wire id_26;
  module_0 modCall_1 (
      id_2,
      id_10,
      id_5,
      id_9,
      id_11
  );
  assign modCall_1.type_1 = 0;
  initial
  fork : SymbolIdentifier
  join : SymbolIdentifier
  always
    if (1) id_20 <= #1 1;
    else id_3 <= id_16;
  assign id_17 = 1'h0;
endmodule
