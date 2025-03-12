// Seed: 2264483174
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  input wire id_7;
  output wire id_6;
  input wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
endmodule
module module_1 #(
    parameter id_14 = 32'd92,
    parameter id_8  = 32'd80
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    _id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13,
    _id_14,
    id_15,
    id_16,
    id_17
);
  output wire id_17;
  output wire id_16;
  input wire id_15;
  input wire _id_14;
  inout wire id_13;
  inout wire id_12;
  inout wire id_11;
  inout logic [7:0] id_10;
  inout wire id_9;
  input wire _id_8;
  input wire id_7;
  input wire id_6;
  input wire id_5;
  input wire id_4;
  input wire id_3;
  module_0 modCall_1 (
      id_16,
      id_12,
      id_3,
      id_12,
      id_9,
      id_17,
      id_6
  );
  input wire id_2;
  input wire id_1;
  assign id_16 = id_10[id_8+:id_14];
  logic id_18;
  ;
  assign id_16 = id_5;
endmodule
