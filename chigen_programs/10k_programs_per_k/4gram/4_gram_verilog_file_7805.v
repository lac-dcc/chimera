// Seed: 3522962334
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
  input wire id_7;
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  wire id_9;
  ;
  wire id_10;
  ;
  parameter id_11 = -1'b0;
  parameter id_12 = 1;
  parameter id_13 = -1;
  wand id_14;
  assign id_14 = 'h0;
endmodule
module module_1 #(
    parameter id_7 = 32'd64
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    _id_7,
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
  inout wire id_17;
  output wire id_16;
  input wire id_15;
  inout wire id_14;
  output wire id_13;
  input wire id_12;
  input wire id_11;
  input wire id_10;
  output wire id_9;
  input wire id_8;
  inout wire _id_7;
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  module_0 modCall_1 (
      id_5,
      id_4,
      id_17,
      id_4,
      id_14,
      id_2,
      id_12,
      id_13
  );
  assign modCall_1.id_14 = 0;
  output wire id_1;
  wire id_18;
  wire [-1 : id_7  |  -1  |  id_7] id_19;
  assign id_17 = id_5;
endmodule
