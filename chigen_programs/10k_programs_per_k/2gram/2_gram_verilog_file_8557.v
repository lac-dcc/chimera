// Seed: 1905722722
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
    id_11
);
  input wire id_11;
  inout wire id_10;
  inout wire id_9;
  inout wire id_8;
  output wire id_7;
  output wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  id_12 :
  assert property (@(negedge 1'd0) id_12)
  else;
  logic [-1 : -1] id_13, id_14, id_15 = id_11;
  wire id_16, id_17, id_18, id_19, id_20, id_21, id_22, id_23, id_24, id_25, id_26, id_27;
  wire id_28;
endmodule
module module_1 #(
    parameter id_3 = 32'd29,
    parameter id_5 = 32'd82
) (
    id_1,
    id_2,
    _id_3,
    id_4,
    _id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10
);
  output wire id_10;
  output wire id_9;
  input wire id_8;
  inout wire id_7;
  output wire id_6;
  inout wire _id_5;
  output uwire id_4;
  inout wire _id_3;
  input wire id_2;
  input wire id_1;
  assign id_4 = 1'b0;
  wire id_11;
  wire id_12;
  logic [id_3  -  -1 : 1] id_13 = 1;
  module_0 modCall_1 (
      id_12,
      id_7,
      id_7,
      id_9,
      id_7,
      id_10,
      id_11,
      id_12,
      id_13,
      id_11,
      id_11
  );
  assign id_12 = ~id_7;
  wire [id_5 : -1 'b0] id_14;
endmodule
