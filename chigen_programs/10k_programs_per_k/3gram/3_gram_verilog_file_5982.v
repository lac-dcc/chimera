// Seed: 4166627121
module module_0 (
    id_1,
    id_2
);
  inout wire id_2;
  output wire id_1;
  wire id_3;
endmodule
module module_1 #(
    parameter id_14 = 32'd24,
    parameter id_8  = 32'd37
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
  output reg id_16;
  output wire id_15;
  input wire _id_14;
  xnor primCall (id_12, id_5, id_2, id_9, id_1, id_7, id_13, id_4, id_3, id_11, id_6);
  input wire id_13;
  inout logic [7:0] id_12;
  inout wire id_11;
  output wire id_10;
  inout wire id_9;
  input wire _id_8;
  inout wire id_7;
  module_0 modCall_1 (
      id_7,
      id_5
  );
  input wire id_6;
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  initial id_16 <= id_12[id_8 : id_14];
endmodule
