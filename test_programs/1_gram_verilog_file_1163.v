// Seed: 2070192231
module module_0 (
    input tri0 id_0,
    output supply0 id_1,
    input tri1 id_2,
    input wire id_3,
    output tri1 id_4,
    input tri0 id_5,
    output wand id_6
);
  always $display(1, id_5 ? -1'd0 : id_5, id_5 * id_3);
  assign module_1.type_1 = 0;
endmodule
module module_1 (
    output wand id_0,
    output wor id_1,
    input tri1 id_2,
    output tri1 id_3,
    input wand id_4,
    input supply0 id_5
);
  tri0 id_7;
  wire id_8;
  assign id_7 = id_2;
  assign id_1 = -1;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_5,
      id_5,
      id_7,
      id_4,
      id_1
  );
  wire id_9;
endmodule : SymbolIdentifier
