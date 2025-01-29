// Seed: 1824568273
module module_0;
  wire id_1;
  module_2 modCall_1 ();
endmodule
module module_1 ();
  wire id_1;
  wire id_2;
  module_0 modCall_1 ();
endmodule
module module_2;
  wire id_1, id_2;
  assign id_1 = id_2;
  assign module_3.id_2 = 0;
  parameter id_3 = -1;
endmodule : SymbolIdentifier
module module_3 ();
  assign id_1 = id_1;
  assign id_2 = id_2.id_1;
  wire id_3;
  module_2 modCall_1 ();
  always_comb begin : LABEL_0
    if (id_2) id_2 <= #1 -1;
  end
  supply1 id_4;
  parameter id_5 = -1;
  wire id_6;
  assign id_4 = -1;
  wire id_7;
endmodule
