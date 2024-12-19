// Seed: 401721617
module module_0 (
    input supply0 id_0,
    input supply1 id_1,
    input supply0 id_2,
    input supply0 id_3,
    input uwire id_4,
    output tri id_5,
    input wor id_6,
    output wand id_7
);
  assign module_2.id_0 = 0;
endmodule
module module_1 (
    output uwire id_0,
    input  wand  id_1,
    output wor   id_2
);
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_0,
      id_1,
      id_2
  );
  assign modCall_1.type_1 = 0;
  wire id_4;
  wire id_5 = id_4;
  wire id_6;
endmodule
module module_2 (
    input tri1 id_0,
    output tri0 id_1,
    input wor id_2,
    input wor id_3,
    input logic id_4,
    input tri1 id_5,
    input supply0 id_6,
    output supply0 id_7,
    input uwire id_8,
    input supply0 id_9,
    input uwire id_10,
    input wor id_11,
    input uwire id_12,
    input tri0 id_13,
    output wand id_14,
    output wor id_15,
    output supply1 id_16,
    output tri0 id_17
    , id_22,
    input logic id_18,
    output wor id_19,
    output tri1 id_20
);
  id_23 :
  assert property (@(id_18) id_4)
  else begin : LABEL_0
    id_23 <= 1 && 1;
  end
  wire id_24;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_13,
      id_13,
      id_12,
      id_16,
      id_2,
      id_20
  );
endmodule : SymbolIdentifier
