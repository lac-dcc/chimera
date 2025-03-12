// Seed: 1029765492
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  localparam id_6 = 1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output logic [7:0] id_4;
  input wire id_3;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_1,
      id_3,
      id_2
  );
  inout wire id_2;
  inout wire id_1;
  always
  fork : SymbolIdentifier
  join_any
  wire [1 : -1] id_5;
  assign id_4[-1] = id_2 / id_5;
endmodule
