// Seed: 2641120686
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  input wire id_9;
  input wire id_8;
  assign module_1.id_3 = 0;
  inout wire id_7;
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
endmodule
module module_1 #(
    parameter id_11 = 32'd38
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    _id_11
);
  input wire _id_11;
  inout wire id_10;
  inout wire id_9;
  input wire id_8;
  inout wire id_7;
  input wire id_6;
  input logic [7:0] id_5;
  input wire id_4;
  inout reg id_3;
  inout wire id_2;
  inout wire id_1;
  initial begin : LABEL_0
    id_3 = id_7;
  end
  logic [1 : (  id_11  )] id_12;
  module_0 modCall_1 (
      id_2,
      id_7,
      id_10,
      id_9,
      id_7,
      id_10,
      id_12,
      id_8,
      id_1
  );
  assign id_2 = id_5[-1];
endmodule
