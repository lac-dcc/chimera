// Seed: 3093162363
module module_0 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  parameter id_4 = 1;
  assign module_1.id_1 = 0;
endmodule
module module_1 #(
    parameter id_5 = 32'd27
) (
    id_1,
    id_2,
    id_3,
    id_4,
    _id_5
);
  inout wire _id_5;
  input wire id_4;
  input wire id_3;
  output logic [7:0] id_2;
  inout reg id_1;
  logic id_6;
  ;
  parameter id_7 = -1'b0;
  always id_1 = id_1;
  module_0 modCall_1 (
      id_6,
      id_7,
      id_3
  );
  union {
    logic [1 'b0 &&  1 : id_5] id_8;
    logic id_9;
    id_10 id_11;
    struct packed {logic id_12;} id_13;
  } id_14;
  ;
endmodule : SymbolIdentifier
