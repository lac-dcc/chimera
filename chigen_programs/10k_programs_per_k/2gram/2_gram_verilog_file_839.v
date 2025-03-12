// Seed: 2731948945
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  output tri1 id_1;
  assign id_1 = 1;
  wire id_5;
  ;
endmodule
module module_1 #(
    parameter id_13 = 32'd83,
    parameter id_6  = 32'd7,
    parameter id_9  = 32'd78
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    _id_6,
    id_7,
    id_8,
    _id_9,
    id_10,
    id_11,
    id_12,
    _id_13,
    id_14,
    id_15,
    id_16,
    .id_19(id_17),
    id_18
);
  output wire id_18;
  inout wire id_17;
  input wire id_16;
  output wire id_15;
  input wire id_14;
  inout wire _id_13;
  inout wire id_12;
  output wire id_11;
  output tri1 id_10;
  inout wire _id_9;
  inout wire id_8;
  output wire id_7;
  inout wire _id_6;
  output wire id_5;
  inout logic [7:0] id_4;
  input wire id_3;
  output wire id_2;
  input logic [7:0] id_1;
  assign id_12 = (id_4[id_6]);
  module_0 modCall_1 (
      id_17,
      id_8,
      id_18,
      id_12
  );
  assign modCall_1.id_1 = 0;
  wire id_20;
  assign id_17 = id_1[id_13+:id_9];
  assign id_10 = id_14 - ~-1;
endmodule
