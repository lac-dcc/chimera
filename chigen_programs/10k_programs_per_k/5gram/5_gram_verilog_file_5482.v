// Seed: 1201681796
module module_0 (
    output wor id_0,
    output tri1 id_1,
    output supply1 id_2,
    input wor id_3,
    input supply1 id_4,
    input supply1 id_5,
    input tri id_6,
    output supply1 id_7,
    input wor id_8,
    input tri0 id_9,
    input tri id_10,
    input tri1 id_11,
    input wor id_12,
    input wand id_13,
    input supply1 id_14,
    input supply0 id_15,
    input tri0 id_16,
    input supply1 id_17,
    input uwire id_18,
    input uwire id_19,
    input wire id_20,
    input wand id_21,
    output tri id_22,
    input tri0 id_23
);
  wire id_25;
  initial
  fork : SymbolIdentifier
  join_any : SymbolIdentifier
endmodule
module module_1 (
    input wire id_0,
    input wand id_1
);
  assign id_3 = id_0;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_3,
      id_0,
      id_3,
      id_1,
      id_3,
      id_3,
      id_3,
      id_3,
      id_1,
      id_0,
      id_0,
      id_3,
      id_1,
      id_0,
      id_0,
      id_3,
      id_0,
      id_1,
      id_0,
      id_0,
      id_3,
      id_1
  );
  assign modCall_1.type_33 = 0;
endmodule
