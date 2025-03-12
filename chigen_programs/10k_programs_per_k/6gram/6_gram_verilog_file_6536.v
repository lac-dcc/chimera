// Seed: 3183957653
module module_0 (
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
    id_13
);
  output wire id_13;
  input wire id_12;
  inout wire id_11;
  inout wire id_10;
  output wire id_9;
  inout wire id_8;
  inout wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  logic id_14;
  assign id_11 = id_2;
endmodule
module module_1 #(
    parameter id_1 = 32'd63,
    parameter id_6 = 32'd60
) (
    _id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    _id_6,
    id_7,
    id_8,
    id_9
);
  inout wire id_9;
  output wire id_8;
  input wire id_7;
  output wire _id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  output wire _id_1;
  wire id_10;
  ;
  struct {
    logic [-1 : id_1] id_11;
    logic [1 : id_6]  id_12;
  } [1 : -1] id_13;
  module_0 modCall_1 (
      id_13,
      id_13,
      id_11,
      id_9,
      id_9,
      id_11,
      id_12,
      id_10,
      id_2,
      id_12,
      id_12,
      id_9,
      id_5
  );
endmodule
