// Seed: 431372760
module module_0 (
    input supply0 id_0,
    input tri0 id_1,
    input supply1 id_2,
    output uwire id_3,
    output supply1 id_4,
    output supply0 id_5,
    input supply1 id_6
);
  wire id_8;
  assign id_3 = id_0 & 0;
endmodule
module module_1 (
    output supply1 id_0,
    input wand id_1,
    output wire id_2,
    output uwire id_3
);
  assign id_0 = 1;
  tri0 id_5;
  id_6(
      .id_0(1), .sum(1'h0), .id_1(1), .id_2(!id_0)
  );
  module_0 modCall_1 (
      id_1,
      id_5,
      id_1,
      id_3,
      id_0,
      id_3,
      id_5
  );
  assign #1 id_2 = id_5;
  assign id_0 = id_1;
endmodule : SymbolIdentifier
