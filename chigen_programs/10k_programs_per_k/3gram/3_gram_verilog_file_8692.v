// Seed: 1473178417
module module_0 #(
    parameter id_6 = 32'd59
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    _id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12
);
  output wire id_12;
  output wire id_11;
  inout wire id_10;
  output wire id_9;
  output wire id_8;
  input wire id_7;
  inout wire _id_6;
  input wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_13, id_14;
  parameter [1 : ~  id_6] id_15 = 1;
  id_16 :
  assert property (@(id_14) id_13)
  else begin : LABEL_0
    id_16 <= 1;
  end
endmodule
module module_1 #(
    parameter id_1 = 32'd75,
    parameter id_2 = 32'd45
) (
    _id_1,
    _id_2,
    id_3,
    id_4
);
  input logic [7:0] id_4;
  output wire id_3;
  inout wire _id_2;
  output wire _id_1;
  logic [id_1 : 1] id_5;
  assign id_2 = id_4[id_2];
  wire id_6;
  wire id_7;
  xnor primCall (id_3, id_2, id_5, id_4, id_7, id_6);
  module_0 modCall_1 (
      id_5,
      id_7,
      id_5,
      id_3,
      id_7,
      id_2,
      id_6,
      id_6,
      id_5,
      id_7,
      id_7,
      id_3
  );
endmodule
