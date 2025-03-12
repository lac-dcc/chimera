// Seed: 631646055
program module_0 (
    input tri1 id_0,
    input supply1 id_1,
    input wand id_2,
    input supply1 id_3,
    input supply0 id_4,
    output tri0 id_5,
    input supply1 id_6,
    input tri0 id_7,
    output wor id_8,
    output tri1 id_9,
    input supply0 id_10,
    output wire id_11
);
  assign module_1.id_2 = 0;
endprogram
module module_1 (
    input tri id_0,
    input wor id_1,
    output supply1 id_2
);
  assign id_2 = id_0;
  module_0 modCall_1 (
      id_0,
      id_1,
      id_1,
      id_0,
      id_1,
      id_2,
      id_1,
      id_0,
      id_2,
      id_2,
      id_1,
      id_2
  );
endmodule : SymbolIdentifier
module module_2 #(
    parameter id_0  = 32'd44,
    parameter id_14 = 32'd46
) (
    input uwire _id_0[id_0 : id_14],
    output uwire id_1,
    input wire id_2,
    output supply1 id_3,
    output uwire id_4,
    input supply0 id_5
    , id_16,
    input wire id_6,
    input tri1 id_7,
    input tri id_8,
    output supply1 id_9,
    input tri0 id_10,
    input wire id_11,
    output tri0 id_12,
    input wire id_13,
    output wor _id_14[id_14 : id_14]
);
  logic id_17;
  ;
  assign id_1 = id_7;
  assign id_3 = id_6;
  module_0 modCall_1 (
      id_8,
      id_6,
      id_13,
      id_6,
      id_2,
      id_4,
      id_7,
      id_5,
      id_4,
      id_9,
      id_10,
      id_4
  );
  assign modCall_1.id_10 = 0;
endmodule
