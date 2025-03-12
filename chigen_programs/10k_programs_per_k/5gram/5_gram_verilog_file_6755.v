// Seed: 2583988725
module module_0 (
    input supply0 id_0,
    input uwire id_1
    , id_26, id_27,
    output wor id_2,
    input tri0 id_3,
    input supply1 id_4,
    input wand id_5,
    output wire id_6,
    output tri id_7,
    input wand id_8,
    input wire id_9,
    input uwire id_10,
    input tri1 id_11,
    output tri id_12,
    input wand id_13,
    input supply0 id_14,
    input tri0 id_15,
    input supply1 id_16,
    input tri id_17,
    input wire id_18,
    input wire id_19,
    input supply1 id_20,
    output supply1 id_21,
    input supply1 id_22,
    output wire id_23,
    input wor id_24
);
  assign id_27 = 1;
  assign module_1.id_3 = 0;
endmodule
module module_1 (
    output supply1 id_0,
    output uwire id_1,
    output supply1 id_2,
    input tri id_3,
    output wor id_4,
    input supply0 id_5,
    input tri0 id_6,
    output wire id_7
);
  logic [7:0] id_9;
  assign id_1 = id_9 >= 1;
  assign id_9[-1'b0==1] = -1'b0;
  logic id_10;
  ;
  module_0 modCall_1 (
      id_6,
      id_5,
      id_4,
      id_6,
      id_5,
      id_5,
      id_1,
      id_1,
      id_5,
      id_6,
      id_3,
      id_3,
      id_2,
      id_5,
      id_5,
      id_3,
      id_5,
      id_5,
      id_3,
      id_6,
      id_6,
      id_0,
      id_6,
      id_0,
      id_5
  );
  initial
  fork : SymbolIdentifier
  join : SymbolIdentifier
endmodule
