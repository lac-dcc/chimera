// Seed: 2400770607
module module_0 (
    output supply1 id_0,
    output wand id_1,
    output wire id_2,
    output wand id_3,
    output tri id_4,
    input tri1 id_5,
    input wor id_6,
    output tri id_7
);
  assign module_1.id_4 = 0;
endmodule : SymbolIdentifier
module module_1 (
    input supply0 id_0,
    output uwire id_1,
    input uwire id_2,
    output tri id_3,
    output tri id_4,
    input supply1 id_5,
    output wire id_6,
    input wire id_7,
    input uwire id_8
);
  assign id_3 = 1;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_1,
      id_3,
      id_3,
      id_5,
      id_5,
      id_1
  );
endmodule
