// Seed: 3888683665
module module_0 (
    input wire id_0,
    input supply0 id_1,
    input tri1 id_2,
    output wand id_3,
    output supply0 id_4,
    output uwire id_5,
    output wire id_6,
    input wire id_7,
    input tri0 id_8,
    input uwire id_9,
    input tri1 id_10,
    output wire id_11,
    input tri0 id_12,
    input uwire id_13,
    output tri id_14,
    output supply1 id_15,
    input supply1 id_16,
    output wand id_17,
    input wor id_18,
    input supply0 id_19,
    output supply1 id_20,
    output tri0 id_21,
    output wor id_22,
    output supply0 id_23
);
  initial
  fork : SymbolIdentifier
  join_any : SymbolIdentifier
  wire id_25;
endmodule
module module_1 #(
    parameter id_6 = 32'd21
) (
    output supply0 id_0,
    output wor id_1,
    input wire id_2,
    output wand id_3,
    input wand id_4,
    output tri0 id_5,
    input wand _id_6,
    output wand id_7,
    output tri1 id_8
);
  logic [-1 : id_6] id_10;
  wire [-1 : 1] id_11;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_4,
      id_8,
      id_3,
      id_0,
      id_5,
      id_4,
      id_4,
      id_4,
      id_2,
      id_0,
      id_4,
      id_4,
      id_8,
      id_5,
      id_4,
      id_7,
      id_2,
      id_4,
      id_5,
      id_0,
      id_1,
      id_0
  );
  assign modCall_1.id_2 = 0;
  assign id_3 = 1'b0 == id_2;
endmodule
