// Seed: 250455924
module module_0 (
    output supply1 id_0,
    input wand id_1,
    input tri1 id_2,
    input tri0 id_3,
    output tri1 id_4,
    input wor id_5,
    output wor id_6,
    input wire id_7,
    input tri id_8,
    input uwire id_9,
    input wand id_10,
    output uwire id_11,
    input wand id_12
);
  wire id_14;
  assign id_11 = id_5;
endmodule
module module_1 (
    output tri id_0,
    input supply1 id_1
);
  always id_0 = {id_1, -1, id_1 || 1};
  module_0 modCall_1 (
      id_0,
      id_1,
      id_1,
      id_1,
      id_0,
      id_1,
      id_0,
      id_1,
      id_1,
      id_1,
      id_1,
      id_0,
      id_1
  );
  assign modCall_1.type_2 = 0;
endmodule : SymbolIdentifier
