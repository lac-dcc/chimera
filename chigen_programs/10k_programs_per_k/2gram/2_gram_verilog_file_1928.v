// Seed: 1174993546
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
    id_13,
    id_14,
    id_15,
    id_16
);
  inout wire id_16;
  inout wire id_15;
  output wire id_14;
  output wire id_13;
  output wire id_12;
  output wire id_11;
  inout wire id_10;
  output wire id_9;
  input wire id_8;
  input wire id_7;
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  final #(1);
endmodule
module module_1 #(
    parameter id_11 = 32'd63,
    parameter id_8  = 32'd49
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    _id_8,
    id_9,
    id_10
);
  output wire id_10;
  output wire id_9;
  inout wire _id_8;
  output wire id_7;
  output wire id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  assign id_7 = id_8;
  wire [-1 : id_8] _id_11;
  wire [id_8 : -1] id_12;
  module_0 modCall_1 (
      id_12,
      id_12,
      id_4,
      id_12,
      id_12,
      id_5,
      id_12,
      id_12,
      id_12,
      id_12,
      id_10,
      id_2,
      id_2,
      id_10,
      id_12,
      id_12
  );
  wire [-1 : id_8  / ""] id_13;
  logic [7:0][id_11  &  -1 : 1] id_14;
  assign id_14 = id_14[1'b0];
  assign id_9  = id_14[1 : 1];
endmodule
