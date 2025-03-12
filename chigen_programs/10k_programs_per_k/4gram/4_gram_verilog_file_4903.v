// Seed: 2902209773
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
    id_10
);
  input wire id_10;
  input wire id_9;
  output wire id_8;
  input wire id_7;
  output wire id_6;
  output wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  input wire id_1;
endmodule
module module_1 #(
    parameter id_11 = 32'd72,
    parameter id_12 = 32'd59
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
    _id_11,
    _id_12,
    id_13,
    id_14
);
  output wire id_14;
  output wire id_13;
  input wire _id_12;
  input wire _id_11;
  input wire id_10;
  output wire id_9;
  inout logic [7:0] id_8;
  output wire id_7;
  input wire id_6;
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  wire [id_12 : id_11] id_15;
  module_0 modCall_1 (
      id_6,
      id_5,
      id_10,
      id_3,
      id_14,
      id_15,
      id_4,
      id_15,
      id_6,
      id_5
  );
  logic id_16 = id_8[id_11 :-1] - id_10;
endmodule
