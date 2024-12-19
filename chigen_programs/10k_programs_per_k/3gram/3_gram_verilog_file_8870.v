// Seed: 973819676
module module_0 (
    output tri0 id_0,
    output wor  id_1
);
  wand  id_3;
  uwire id_4 = 0;
  tri1  id_5 = 1;
  assign id_0 = 1;
  assign id_3 = id_5;
  wire id_6;
endmodule
module module_1 (
    input uwire id_0,
    output wor id_1,
    input tri0 id_2,
    input tri id_3,
    output wor id_4,
    input supply1 id_5,
    input uwire id_6,
    input tri1 id_7,
    input uwire id_8,
    input wire id_9,
    input tri id_10,
    input wand id_11,
    input tri0 id_12,
    input wand id_13,
    input tri1 id_14,
    input wand id_15,
    output tri0 id_16,
    inout tri0 id_17,
    output wire id_18
);
  always @(id_5 or posedge 1)
    if (id_17 && id_14 && id_14)
      fork : SymbolIdentifier
        id_17 = 1'b0;
      join
  module_0 modCall_1 (
      id_4,
      id_18
  );
  assign modCall_1.SymbolIdentifier.id_1 = 0;
endmodule
