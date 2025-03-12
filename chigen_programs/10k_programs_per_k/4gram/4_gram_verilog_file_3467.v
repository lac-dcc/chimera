// Seed: 1694650173
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
    id_16,
    id_17
);
  output wire id_17;
  input wire id_16;
  input wire id_15;
  input wire id_14;
  output wire id_13;
  output wire id_12;
  output wire id_11;
  output tri0 id_10;
  input wire id_9;
  input wire id_8;
  output wire id_7;
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  input wire id_1;
  assign id_10 = -1;
endmodule
module module_1 #(
    parameter id_4 = 32'd91
) (
    id_1,
    id_2,
    id_3,
    _id_4,
    id_5,
    id_6
);
  output wire id_6;
  inout logic [7:0] id_5;
  input wire _id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  logic id_7;
  assign id_7[id_4] = id_5;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_3,
      id_2,
      id_1,
      id_3,
      id_6,
      id_3,
      id_3,
      id_2,
      id_6,
      id_2,
      id_2,
      id_2,
      id_2,
      id_3,
      id_1
  );
  generate
    assign id_5[1'b0] = 1;
  endgenerate
endmodule
