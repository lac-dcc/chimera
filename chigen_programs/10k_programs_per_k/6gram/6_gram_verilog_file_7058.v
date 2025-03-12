// Seed: 2427710101
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  assign id_1 = id_5;
  logic id_6, id_7;
  reg   id_8;
  logic id_9 = 1;
  parameter id_10 = 1;
  initial begin : LABEL_0
    do id_8 = #1 id_8; while (1);
    wait (-1);
    id_8 = ~(1 - 1) << "";
  end
endmodule
module module_1 #(
    parameter id_10 = 32'd22,
    parameter id_5  = 32'd58,
    parameter id_6  = 32'd69
) (
    id_1,
    id_2,
    id_3,
    id_4,
    _id_5,
    _id_6,
    id_7,
    id_8,
    id_9
);
  output logic [7:0] id_9;
  output wire id_8;
  input logic [7:0] id_7;
  inout wire _id_6;
  inout wire _id_5;
  inout wire id_4;
  module_0 modCall_1 (
      id_4,
      id_8,
      id_8,
      id_3,
      id_4
  );
  output wire id_3;
  output wire id_2;
  output logic [7:0] id_1;
  assign id_8 = id_6;
  logic [1  +  -1 : 1] _id_10;
  assign id_9[id_6]  = 1;
  assign id_1[id_10] = id_7[id_5];
endmodule
