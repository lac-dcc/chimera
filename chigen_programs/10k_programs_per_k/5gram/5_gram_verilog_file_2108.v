// Seed: 2596556594
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
  output wire id_13;
  output wire id_12;
  input wire id_11;
  output wire id_10;
  inout wire id_9;
  input wire id_8;
  output wire id_7;
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  output supply1 id_2;
  inout wire id_1;
  assign id_2 = -1;
  logic id_15;
  ;
  generate
    assign id_13 = id_11;
  endgenerate
endmodule
module module_1 #(
    parameter id_2 = 32'd87
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
    id_10,
    id_11,
    id_12,
    id_13,
    id_14,
    id_15
);
  input wire id_15;
  input wire id_14;
  inout wire id_13;
  output wire id_12;
  output wire id_11;
  output wire id_10;
  input wire id_9;
  output logic [7:0] id_8;
  input wire id_7;
  module_0 modCall_1 (
      id_1,
      id_11,
      id_6,
      id_13,
      id_5,
      id_9,
      id_6,
      id_14,
      id_13,
      id_3,
      id_13,
      id_3,
      id_4,
      id_3
  );
  output wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire _id_2;
  inout wire id_1;
  time id_16;
  ;
  assign id_8[id_2 : 1'b0] = id_1;
  wire id_17;
endmodule
