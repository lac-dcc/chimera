// Seed: 1122465941
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
    id_17,
    id_18,
    id_19
);
  input wire id_19;
  inout wire id_18;
  inout uwire id_17;
  inout wire id_16;
  inout wire id_15;
  input wire id_14;
  inout wire id_13;
  output wire id_12;
  inout wire id_11;
  input wire id_10;
  output wire id_9;
  inout wire id_8;
  output wire id_7;
  output wire id_6;
  inout wire id_5;
  output wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  assign id_17 = 1;
endmodule
module module_1 #(
    parameter id_1 = 32'd31,
    parameter id_7 = 32'd17
) (
    _id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    _id_7
);
  input wire _id_7;
  module_0 modCall_1 (
      id_6,
      id_5,
      id_6,
      id_5,
      id_6,
      id_3,
      id_2,
      id_6,
      id_5,
      id_6,
      id_6,
      id_3,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6
  );
  inout wire id_6;
  output supply1 id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  input wire _id_1;
  wire id_8;
  wire [id_1 : -1] \id_9 [-1 : -1];
  struct {
    logic [-1  +  id_7 : 1] id_10;
    id_11 id_12;
  } [-1  ==  1 : -1] id_13;
  assign id_5 = 1'h0 == id_13.id_11;
endmodule
