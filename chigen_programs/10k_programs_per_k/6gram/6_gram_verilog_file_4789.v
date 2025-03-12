// Seed: 1598693250
module module_0 (
    output uwire id_0,
    output wand id_1,
    output supply0 id_2,
    output supply1 id_3,
    output supply1 id_4,
    output wor id_5,
    input tri0 id_6,
    output wor id_7,
    input supply1 id_8,
    input tri1 id_9,
    input tri id_10
);
  assign id_5 = -1;
  assign module_1.id_0 = 0;
endmodule
module module_1 (
    input  uwire id_0,
    output tri0  id_1,
    input  uwire id_2,
    output tri1  id_3,
    output tri1  id_4
);
  assign id_1 = -1 ? 1'h0 : -1 ? id_2 ==? -1 : id_0;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_4,
      id_3,
      id_3,
      id_1,
      id_0,
      id_4,
      id_0,
      id_2,
      id_2
  );
endmodule : SymbolIdentifier
