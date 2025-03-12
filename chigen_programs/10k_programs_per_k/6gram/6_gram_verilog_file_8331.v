// Seed: 745073840
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
  inout wire id_15;
  inout wire id_14;
  inout wire id_13;
  output wire id_12;
  input wire id_11;
  output wire id_10;
  inout wire id_9;
  inout wire id_8;
  inout wire id_7;
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
endmodule
module module_1 #(
    parameter id_17 = 32'd99
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
    id_14
);
  inout wire id_14;
  output wire id_13;
  inout wire id_12;
  output wire id_11;
  output wire id_10;
  inout wire id_9;
  output wire id_8;
  inout logic [7:0] id_7;
  output wire id_6;
  nor primCall (id_12, id_1, id_9, id_4, id_3, id_7, id_14, id_5);
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  module_0 modCall_1 (
      id_3,
      id_9,
      id_12,
      id_9,
      id_5,
      id_9,
      id_14,
      id_14,
      id_12,
      id_2,
      id_5,
      id_3,
      id_9,
      id_14,
      id_12
  );
  input wire id_1;
  wire id_15 = id_7;
  reg id_16 = -1, _id_17 = id_9, id_18 = 1;
  initial begin : LABEL_0
    id_7[1'b0 : id_17] = 1 ^ id_4;
    id_18 <= -1;
  end
endmodule
