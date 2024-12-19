// Seed: 1202403888
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  generate
    assign id_3 = 1;
  endgenerate
  module_2 modCall_1 ();
endmodule
module module_1 (
    id_1
);
  inout wire id_1;
  wire id_2;
  module_0 modCall_1 (
      id_2,
      id_1,
      id_1,
      id_2
  );
  assign modCall_1.id_3 = 0;
endmodule
module module_2;
endmodule
module module_3 (
    output tri1 id_0,
    input tri id_1,
    input tri0 id_2,
    input wor id_3,
    output wand id_4,
    output supply1 id_5,
    input supply0 id_6
);
  wire id_8;
  wire id_9;
  always
  fork
  join : SymbolIdentifier
  assign module_4.SymbolIdentifier.id_0 = 0;
endmodule
module module_4 (
    input supply1 id_0,
    output tri1 id_1,
    output tri1 id_2,
    input wor id_3,
    output tri1 id_4
);
  tri0 id_6;
  wire id_7;
  supply0 id_8, id_9;
  module_3 modCall_1 (
      id_4,
      id_3,
      id_0,
      id_0,
      id_4,
      id_1,
      id_0
  );
  assign id_6 = id_8;
  supply1 id_10 = 1'b0;
  static id_11(
      .id_0(id_1), .id_1(), .id_2(1'b0 == ~id_8)
  );
endmodule
