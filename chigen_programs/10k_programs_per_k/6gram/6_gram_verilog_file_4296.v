// Seed: 994318863
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
  output wire id_14;
  input wire id_13;
  input wire id_12;
  input wire id_11;
  output wire id_10;
  inout wire id_9;
  output wire id_8;
  output wire id_7;
  input wire id_6;
  inout wire id_5;
  input wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  wire id_15;
  assign id_7 = id_1;
  logic id_16;
endmodule
module module_1 #(
    parameter id_10 = 32'd71,
    parameter id_2  = 32'd40
) (
    id_1,
    _id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    _id_10,
    id_11,
    id_12,
    id_13,
    id_14,
    id_15
);
  output wire id_15;
  output supply0 id_14;
  output wire id_13;
  output wire id_12;
  input wire id_11;
  input wire _id_10;
  output wire id_9;
  output wire id_8;
  inout wire id_7;
  input wire id_6;
  inout logic [7:0] id_5;
  output wire id_4;
  output wire id_3;
  output wire _id_2;
  output wire id_1;
  module_0 modCall_1 (
      id_7,
      id_13,
      id_8,
      id_7,
      id_7,
      id_7,
      id_7,
      id_14,
      id_7,
      id_8,
      id_11,
      id_11,
      id_6,
      id_8
  );
  wire id_16;
  assign id_5[id_10(1)] = id_5;
  assign id_13 = id_11;
  assign id_14 = 1'b0;
  logic [-1 : ~  id_2] id_17;
  ;
endmodule
