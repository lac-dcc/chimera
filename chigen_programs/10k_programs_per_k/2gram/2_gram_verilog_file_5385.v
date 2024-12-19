// Seed: 1363278537
module module_0 (
    output tri id_0,
    input supply1 id_1,
    input tri1 id_2
);
  tri0 id_4;
  id_5(
      .id_0(id_4++), .id_1({1'd0, 1}), .id_2(1), .id_3(1), .id_4(1)
  );
  tri0 id_6 = 1;
  tri0 id_7 = 1 - 1'b0;
  assign id_7 = id_1;
endmodule
module module_1 (
    output uwire id_0,
    output wor id_1,
    input wor id_2,
    input tri1 id_3,
    output wand id_4
    , id_7,
    output supply0 id_5
);
  wor id_8;
  module_0 modCall_1 (
      id_1,
      id_2,
      id_3
  );
  assign modCall_1.id_7 = 0;
  wire id_9 = id_9;
  assign id_1 = 1;
  generate
    wor id_10;
  endgenerate
  initial
  fork
  join : SymbolIdentifier
  assign id_8  = 1'b0;
  assign id_9  = id_7;
  assign id_10 = id_2;
  always_latch begin : LABEL_0
    id_9 = id_9;
  end
endmodule
