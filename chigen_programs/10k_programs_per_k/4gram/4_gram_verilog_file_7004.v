// Seed: 2520799171
module module_0;
  module_2 modCall_1 ();
  assign modCall_1.type_3 = 0;
  wire id_2;
  wire id_3;
  wire id_4;
  wire id_5;
endmodule
module module_1;
  wire id_1;
  module_0 modCall_1 ();
endmodule
module module_2;
  reg id_1;
  assign module_3.id_4 = 0;
  always
  fork
    if (id_1)
      assume (id_1);
      else begin : LABEL_0
        id_1.id_1 = #id_2 1'b0;
      end
  join : SymbolIdentifier
endmodule
module module_3 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  module_2 modCall_1 ();
  uwire id_6 = 1;
endmodule
