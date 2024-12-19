// Seed: 4245282382
module module_0 (
    input tri0 id_0,
    output tri id_1,
    output tri id_2,
    input supply1 id_3,
    input wor id_4,
    input tri id_5
);
  assign module_1.type_6 = 0;
  wire id_7, id_8;
  module_2 modCall_1 (id_5);
  assign modCall_1.id_0 = 0;
endmodule : SymbolIdentifier
module module_1 (
    output wor   id_0,
    input  tri1  id_1,
    input  wand  id_2,
    input  tri0  id_3,
    input  uwire id_4
);
  assign id_0 = id_1;
  module_0 modCall_1 (
      id_3,
      id_0,
      id_0,
      id_3,
      id_3,
      id_1
  );
endmodule
module module_2 (
    input tri1 id_0
);
  assign id_2 = 1;
endmodule
