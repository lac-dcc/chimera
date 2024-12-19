// Seed: 1222880183
module module_0 (
    id_1,
    id_2
);
  inout wire id_2;
  inout wire id_1;
  wire id_3;
  wire id_4;
endmodule
module module_1;
  wire id_1;
  module_0 modCall_1 (
      id_1,
      id_1
  );
endmodule
module module_2 (
    input wand id_0,
    input logic id_1,
    output wand id_2,
    output supply0 id_3,
    output wor id_4,
    input uwire id_5,
    input tri1 id_6,
    output wand id_7
);
  wire id_9;
  module_0 modCall_1 (
      id_9,
      id_9
  );
  reg id_10;
  always
  fork
    cover (1);
    #1;
  join : SymbolIdentifier
  tri id_11;
  xnor primCall (id_3, id_5, id_6, id_0);
  assign id_7 = !id_11 - id_1;
  always_comb @(negedge id_9) {id_1, 1} <= id_10;
endmodule
