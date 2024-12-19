// Seed: 3756486000
module module_0;
  always $display(id_1);
  always begin : LABEL_0
    id_1 <= 1;
    id_1 = 1;
  end
  assign id_1 = 1'd0;
  wire id_2;
  assign module_1.id_1 = 0;
  wire id_3;
endmodule
module module_1 ();
  always
  fork
    if (1'b0) id_1 = id_1;
    else id_1 <= id_1;
  join_any : SymbolIdentifier
  module_0 modCall_1 ();
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  xnor primCall (id_1, id_2, id_3);
  module_0 modCall_1 ();
endmodule
