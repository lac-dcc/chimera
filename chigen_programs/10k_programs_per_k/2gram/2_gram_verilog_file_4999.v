// Seed: 3833004573
module module_0 (
    output supply0 id_0,
    output supply0 id_1,
    input  supply1 id_2
);
  always if (1 == 1) #1 fork : SymbolIdentifier join
  assign id_1 = id_2;
  localparam id_4 = "";
  assign module_2.SymbolIdentifier.id_1 = 0;
  assign module_1.SymbolIdentifier.id_1 = 0;
endmodule
module module_1 (
    output wand id_0,
    input tri0 id_1,
    output wor id_2,
    input supply0 id_3,
    input uwire id_4
);
  assign id_0 = id_1;
  module_0 modCall_1 (
      id_0,
      id_2,
      id_4
  );
endmodule
module module_2 (
    output tri0 id_0,
    input supply1 id_1
);
  assign id_0 = -1;
  module_0 modCall_1 (
      id_0,
      id_0,
      id_1
  );
endmodule
