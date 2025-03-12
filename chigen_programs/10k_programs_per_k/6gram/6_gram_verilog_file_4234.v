// Seed: 3862420533
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
    id_15
);
  output wire id_15;
  inout wire id_14;
  inout wire id_13;
  output wire id_12;
  input wire id_11;
  output wire id_10;
  inout wire id_9;
  inout wire id_8;
  output wire id_7;
  output wire id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  wire [1 : 1] id_16;
  wire id_17;
  logic id_18;
  ;
endmodule
module module_1 #(
    parameter id_10 = 32'd30,
    parameter id_13 = 32'd4,
    parameter id_9  = 32'd71
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    _id_9,
    _id_10,
    id_11,
    id_12,
    _id_13,
    id_14,
    id_15,
    id_16,
    id_17,
    id_18
);
  inout wire id_18;
  output wire id_17;
  inout wire id_16;
  output wire id_15;
  output wire id_14;
  input wire _id_13;
  output wire id_12;
  inout wire id_11;
  inout wire _id_10;
  inout wire _id_9;
  inout wire id_8;
  input logic [7:0] id_7;
  inout wire id_6;
  module_0 modCall_1 (
      id_16,
      id_18,
      id_3,
      id_3,
      id_8,
      id_3,
      id_6,
      id_18,
      id_11,
      id_15,
      id_8,
      id_6,
      id_6,
      id_11,
      id_3
  );
  output wire id_5;
  output wire id_4;
  output wire id_3;
  output wor id_2;
  output wire id_1;
  logic [id_13 : 1] id_19;
  ;
  assign id_2  = 1;
  assign id_3  = -1'b0 == -1'b0 ? id_19 : id_18;
  assign id_19 = id_7[id_10 : id_9];
  assign id_18 = id_18;
endmodule
