// Seed: 2891418068
module module_0 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  output wire id_2;
  input wire id_1;
  module_2 modCall_1 ();
  id_4(
      id_1, 1, id_1, id_2, id_3
  ); id_5(
      id_1
  );
  assign id_2 = (1'b0);
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  id_4(
      1'd0 - id_2
  );
  module_0 modCall_1 (
      id_3,
      id_3,
      id_1
  );
endmodule : SymbolIdentifier
module module_2;
  assign module_0.id_3 = 0;
  reg id_1;
  always begin : LABEL_0
    id_1 <= 1;
  end
  wire id_2, id_3;
endmodule
