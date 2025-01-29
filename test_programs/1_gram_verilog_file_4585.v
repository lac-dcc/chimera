// Seed: 2137029365
module module_0 (
    input uwire id_0,
    input wire id_1,
    input supply1 id_2,
    output supply1 id_3,
    input supply0 void id_4,
    input supply0 id_5,
    output uwire id_6,
    output tri id_7
);
  tri id_9, id_10, id_11, id_12, id_13;
  id_14(
      .id_0(id_0 ? -1 : -1), .id_1(-1'b0), .id_2(id_12), .id_3(-1), .id_4(id_3), .id_5(-1)
  );
  wire id_15, id_16;
  assign id_12 = -1'd0;
endmodule : SymbolIdentifier
module module_1 (
    input tri0 id_0,
    input tri id_1,
    output wire void id_2,
    input wand id_3,
    output tri0 id_4,
    input supply1 id_5,
    output wand id_6,
    input supply1 id_7,
    output supply1 id_8
);
  module_0 modCall_1 (
      id_3,
      id_1,
      id_1,
      id_8,
      id_5,
      id_3,
      id_6,
      id_6
  );
  assign modCall_1.id_1 = 0;
  tri0 id_10, id_11, id_12 = id_5, id_13;
endmodule
