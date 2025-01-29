// Seed: 2102956089
module module_0 (
    output uwire id_0
);
  assign module_2.type_7 = 0;
  wire id_2;
endmodule
module module_1 (
    input  tri1  id_0,
    output tri   id_1,
    input  uwire id_2
);
  wand id_4;
  assign id_1 = id_4 < ~id_0;
  id_5(
      1, ~id_1
  );
  module_0 modCall_1 (id_1);
  assign modCall_1.id_0 = 0;
  id_6(
      -1
  );
endmodule : SymbolIdentifier
module module_2 (
    output tri0 id_0,
    input  tri  id_1,
    input  tri1 id_2,
    input  wand id_3,
    input  wor  id_4
);
  wire id_6;
  module_0 modCall_1 (id_0);
endmodule
