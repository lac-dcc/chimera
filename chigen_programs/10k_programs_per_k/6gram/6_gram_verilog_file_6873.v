// Seed: 1458541786
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  input wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  logic id_8;
  ;
  assign {-1, id_3} = -1;
  assign id_6 = id_2;
endmodule
module module_1 #(
    parameter id_5 = 32'd76
) (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  output logic [7:0] id_3;
  output wire id_2;
  input wire id_1;
  parameter id_5 = 1;
  assign id_3[-1'b0 : id_5] = id_5;
  wire id_6;
  ;
  initial
  fork : SymbolIdentifier
  join
  module_0 modCall_1 (
      id_4,
      id_1,
      id_1,
      id_6,
      id_2,
      id_6,
      id_6
  );
endmodule
