// Seed: 3388143303
module module_0 #(
    parameter id_10 = 32'd70
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  output tri0 id_7;
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire  id_8;
  logic id_9 = 1;
  logic _id_10;
  ;
  wire id_11, id_12, id_13;
  logic id_14;
  assign id_7 = -1;
  wire id_15;
  ;
  wire [id_10 : -1 'd0] id_16, id_17;
endmodule
module module_1 #(
    parameter id_4 = 32'd68
) (
    id_1,
    id_2,
    id_3,
    _id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11
);
  output wire id_11;
  output wire id_10;
  input wire id_9;
  inout wire id_8;
  module_0 modCall_1 (
      id_6,
      id_6,
      id_8,
      id_9,
      id_6,
      id_6,
      id_7
  );
  output wire id_7;
  inout wire id_6;
  output wire id_5;
  inout wire _id_4;
  input logic [7:0] id_3;
  input wire id_2;
  input wire id_1;
  assign id_6 = id_3[id_4];
endmodule
