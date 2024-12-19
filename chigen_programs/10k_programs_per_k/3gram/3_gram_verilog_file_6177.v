// Seed: 1234368000
module module_0 (
    input wor id_0,
    output supply1 id_1,
    output tri id_2,
    output wor id_3,
    output tri1 id_4,
    output wand id_5,
    input tri id_6,
    input supply0 id_7
);
endmodule
module module_1 (
    output wand  id_0,
    input  uwire id_1,
    input  wire  id_2,
    input  wire  id_3,
    input  uwire id_4,
    input  tri1  id_5,
    input  wire  id_6,
    output logic id_7
);
  always
  fork
    id_7 <= 1;
  join : SymbolIdentifier
  module_0 modCall_1 (
      id_2,
      id_0,
      id_0,
      id_0,
      id_0,
      id_0,
      id_5,
      id_6
  );
  assign modCall_1.SymbolIdentifier.id_5 = 0;
  wire id_9, id_10, id_11;
  assign id_9 = 1;
endmodule
