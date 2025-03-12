// Seed: 2502642638
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  input wire id_2;
  output uwire id_1;
  assign id_1 = -1;
endmodule
module module_1 #(
    parameter id_15 = 32'd28
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
    id_11,
    id_12,
    id_13,
    id_14,
    _id_15,
    id_16
);
  output wire id_16;
  inout wire _id_15;
  input logic [7:0] id_14;
  input wire id_13;
  output wire id_12;
  output wire id_11;
  output wire id_10;
  output wire id_9;
  output wire id_8;
  input wire id_7;
  input wire id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  module_0 modCall_1 (
      id_8,
      id_6,
      id_13,
      id_6,
      id_1
  );
  output wire id_2;
  inout wire id_1;
  wire id_17;
  logic [id_15 : -1] id_18;
  ;
  parameter id_19 = 1;
  always @({-1, id_15, id_18} or id_13) disable id_20;
  assign id_15 = id_14[!-1'b0];
endmodule
