// Seed: 1393288578
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_4 = 'h0;
  assign module_1.type_5 = 0;
endmodule
module module_1 (
    input  logic id_0,
    input  uwire id_1,
    input  logic id_2,
    output wor   id_3,
    output wor   id_4,
    input  logic id_5,
    output uwire id_6,
    output logic id_7
);
  assign id_7 = id_2;
  logic id_9;
  wire  id_10;
  assign id_9 = 1'b0 ? id_5 : 1 ? id_2 : 1'b0;
  wire id_11;
  module_0 modCall_1 (
      id_11,
      id_11,
      id_11,
      id_11,
      id_11,
      id_11,
      id_10,
      id_11
  );
  assign id_9 = 1;
  always @(*) id_9 = #1 id_0;
endmodule
