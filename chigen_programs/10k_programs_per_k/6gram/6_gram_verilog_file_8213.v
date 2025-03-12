// Seed: 1280630831
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
    id_14
);
  input wire id_14;
  output wire id_13;
  inout wire id_12;
  output wire id_11;
  output wire id_10;
  inout wire id_9;
  inout wire id_8;
  input wire id_7;
  output wire id_6;
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  input wire id_1;
  logic [1 : 1 'b0] id_15 = id_12;
  integer [1 'b0 : 1] id_16, id_17;
endmodule
module module_1 #(
    parameter id_10 = 32'd41,
    parameter id_11 = 32'd70
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
    _id_10,
    _id_11,
    id_12,
    id_13
);
  input wire id_13;
  output wire id_12;
  inout wire _id_11;
  input wire _id_10;
  output wire id_9;
  inout wire id_8;
  output wire id_7;
  input wire id_6;
  input wire id_5;
  module_0 modCall_1 (
      id_2,
      id_7,
      id_2,
      id_8,
      id_8,
      id_12,
      id_13,
      id_8,
      id_3,
      id_8,
      id_3,
      id_8,
      id_9,
      id_3
  );
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  inout logic [7:0] id_1;
  assign id_1[id_10 : !id_11] = id_13;
endmodule
