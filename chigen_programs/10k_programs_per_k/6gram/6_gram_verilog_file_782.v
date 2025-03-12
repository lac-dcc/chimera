// Seed: 983585756
module module_0 (
    input wire id_0,
    input wire id_1,
    input tri0 id_2,
    output tri0 id_3,
    input supply0 id_4,
    input tri1 id_5,
    input wand id_6,
    output uwire id_7,
    input wire id_8,
    input wor id_9,
    output tri0 id_10,
    input supply1 id_11,
    output wor id_12,
    input supply1 id_13,
    input wand id_14,
    output wor id_15,
    output wor id_16,
    input uwire id_17,
    input wire id_18,
    input tri0 id_19,
    output wor id_20,
    input supply1 id_21,
    input wire id_22,
    output wor id_23
);
  initial
  fork : SymbolIdentifier
  join : SymbolIdentifier
endmodule
module module_1 (
    input wor id_0,
    input uwire id_1,
    input wor id_2,
    input uwire id_3,
    input uwire id_4,
    output tri id_5,
    input wand id_6,
    input wire id_7,
    output uwire id_8,
    input uwire id_9,
    input supply0 id_10,
    input tri id_11,
    input tri id_12,
    output supply1 id_13,
    input wire id_14,
    output wire id_15,
    input tri1 id_16,
    inout supply1 id_17,
    input wor id_18,
    input supply0 id_19,
    output supply1 id_20,
    input wand id_21,
    input supply1 id_22,
    input supply0 id_23,
    output supply1 id_24
);
  logic id_26, id_27;
  wire id_28;
  assign id_27 = 1'b0;
  module_0 modCall_1 (
      id_3,
      id_22,
      id_16,
      id_13,
      id_6,
      id_21,
      id_3,
      id_20,
      id_18,
      id_9,
      id_17,
      id_23,
      id_8,
      id_9,
      id_9,
      id_17,
      id_5,
      id_4,
      id_2,
      id_12,
      id_5,
      id_9,
      id_12,
      id_5
  );
  assign modCall_1.id_16 = 0;
endmodule
