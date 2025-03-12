// Seed: 1715053883
module module_0 #(
    parameter id_6 = 32'd13
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    _id_6
);
  input wire _id_6;
  input wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_7;
  assign id_7 = id_5;
  wire \id_8 ;
  wire [id_6 : 1] id_9;
  wire id_10;
endmodule
module module_1 #(
    parameter id_15 = 32'd39
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
    id_11,
    id_12,
    id_13,
    id_14
);
  input wire id_14;
  output wire id_13;
  output wire id_12;
  inout reg id_11;
  input wire id_10;
  input wire id_9;
  inout wire id_8;
  output wire id_7;
  input wire id_6;
  input wire id_5;
  input logic [7:0] id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  final begin : LABEL_0
    id_11 <= id_9;
  end
  parameter id_15 = -1;
  always assert ({id_15 ? 1 : 1, 1'b0, id_8, id_14, id_10, id_4[1'd0 : id_15] - id_15, -1'b0});
  module_0 modCall_1 (
      id_8,
      id_2,
      id_12,
      id_12,
      id_9,
      id_15
  );
endmodule
