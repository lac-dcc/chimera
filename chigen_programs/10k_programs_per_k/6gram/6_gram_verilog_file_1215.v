// Seed: 4195811212
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  initial
  fork : SymbolIdentifier
  join : SymbolIdentifier
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  module_0 modCall_1 (
      id_1,
      id_4,
      id_5,
      id_4
  );
  output wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  logic id_6;
  ;
  always @(posedge -1 or posedge 1) begin : LABEL_0
    assign id_5 = id_1;
  end
endmodule
