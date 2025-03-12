// Seed: 2436596921
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
  input wire id_17;
  input wire id_16;
  inout wire id_15;
  input wire id_14;
  input wire id_13;
  input wire id_12;
  input wire id_11;
  input wire id_10;
  inout wire id_9;
  inout wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  input wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_18 = id_13(1, 1'b0, id_14, -1, -1, id_18, -1);
endmodule
module module_1 #(
    parameter id_10 = 32'd22,
    parameter id_11 = 32'd47,
    parameter id_4  = 32'd24,
    parameter id_6  = 32'd82
) (
    id_1,
    id_2,
    id_3,
    _id_4,
    id_5,
    _id_6,
    id_7,
    id_8,
    id_9
);
  output wire id_9;
  output wire id_8;
  output wire id_7;
  inout wire _id_6;
  inout wire id_5;
  output wire _id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  logic _id_10;
  logic _id_11;
  ;
  module_0 modCall_1 (
      id_5,
      id_8,
      id_9,
      id_3,
      id_8,
      id_1,
      id_2,
      id_2,
      id_3,
      id_3,
      id_5,
      id_3,
      id_3,
      id_1,
      id_2,
      id_2,
      id_2
  );
  assign id_7 = (id_6);
  assign id_8 = id_10;
  wire id_12;
  logic [{  id_4  ,  id_4  ,  (  id_11  &  -1 'd0 )  } : id_10] \id_13 , id_14;
  wire [~  id_6 : 1] id_15;
endmodule
