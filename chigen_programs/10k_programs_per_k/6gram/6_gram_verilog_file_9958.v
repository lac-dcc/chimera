// Seed: 798274300
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  inout wire id_7;
  inout wire id_6;
  output wire id_5;
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_4;
  module_0 modCall_1 (
      id_4,
      id_3,
      id_4,
      id_4,
      id_3,
      id_4,
      id_4
  );
  initial begin : LABEL_0
    fork : SymbolIdentifier
      id_5;
      $display;
    join
  end
  wire id_6;
endmodule
