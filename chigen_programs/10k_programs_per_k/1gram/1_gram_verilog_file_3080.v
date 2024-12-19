// Seed: 2161121869
module module_0;
  wire id_2, id_3 = 'b0;
  wire id_4;
  assign module_2.type_7 = 0;
  assign id_1 = {1{id_2}};
  assign id_3 = 1'd0;
  wire id_5;
  wire id_6;
  wire id_7;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_4;
  module_0 modCall_1 ();
endmodule
module module_2 (
    input tri id_0
);
  reg id_2;
  assign id_2 = id_2 * id_0;
  module_0 modCall_1 ();
  reg id_3;
  if (1) begin : LABEL_0
    final id_3 <= id_0 ? ~|id_0 : id_3;
  end else always id_2 <= #1 id_2;
endmodule : SymbolIdentifier
