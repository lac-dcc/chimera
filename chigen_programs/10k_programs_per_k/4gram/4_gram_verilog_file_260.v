// Seed: 1030615210
module module_0;
  assign id_1 = {id_1, 1};
endmodule
module module_1;
  wire id_1;
  wire id_2;
  wire id_3;
  wire id_4;
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  input wire id_7;
  input wire id_6;
  output wire id_5;
  input wire id_4;
  output wire id_3;
  input wire id_2;
  output wire id_1;
  assign id_1 = 1;
  module_0 modCall_1 ();
endmodule
module module_3 (
    output wire id_0,
    input  tri0 id_1
);
  initial
  fork : SymbolIdentifier
  join_none : SymbolIdentifier
  module_0 modCall_1 ();
  assign modCall_1.SymbolIdentifier.SymbolIdentifier.id_1 = 0;
endmodule
