// Seed: 4027275171
module module_0;
  uwire id_1, id_2 = 1'b0;
  module_2 modCall_1 ();
endmodule
module module_1 (
    id_1,
    id_2
);
  inout wire id_2;
  input wire id_1;
  always_latch id_2 <= 1;
  always begin : LABEL_0
    id_2 <= ~1;
  end
  module_0 modCall_1 ();
  assign id_2 = id_1;
  reg  id_3;
  wire id_4;
  assign id_3 = id_2;
  wire id_5;
  wire id_6, id_7;
  wire id_8;
endmodule : SymbolIdentifier
module module_2;
  wire id_1, id_2, id_3;
  assign module_0.id_1 = 0;
endmodule
macromodule module_3 (
    input supply1 id_0,
    input supply1 id_1,
    output wor id_2,
    output supply0 id_3,
    input supply0 id_4,
    output uwire id_5,
    output tri id_6
);
  wire id_8;
  wire id_9, id_10;
  module_2 modCall_1 ();
endmodule
