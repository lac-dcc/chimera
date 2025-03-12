// Seed: 2411315341
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
  output wire id_8;
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  parameter id_9 = 1'd0;
  wire  id_10;
  wire  id_11;
  wire  id_12;
  logic id_13;
  ;
endmodule
module module_1 #(
    parameter id_11 = 32'd60
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9[id_11 : (1)],
    id_10,
    _id_11
);
  inout wire _id_11;
  output wire id_10;
  inout logic [7:0] id_9;
  output wire id_8;
  inout wire id_7;
  output wire id_6;
  output wire id_5;
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_12;
  module_0 modCall_1 (
      id_2,
      id_7,
      id_7,
      id_7,
      id_7,
      id_3,
      id_12,
      id_8
  );
  assign id_12 = -1;
endmodule
