// Seed: 1293584236
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
  input wire id_8;
  output wire id_7;
  input wire id_6;
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_9;
endmodule
module module_1 #(
    parameter id_4 = 32'd68,
    parameter id_6 = 32'd76
) (
    id_1,
    id_2,
    id_3,
    _id_4,
    id_5,
    _id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13
);
  output wire id_13;
  inout wire id_12;
  module_0 modCall_1 (
      id_12,
      id_12,
      id_10,
      id_9,
      id_12,
      id_10,
      id_5,
      id_8
  );
  inout logic [7:0] id_11;
  inout wire id_10;
  input wire id_9;
  input wire id_8;
  inout logic [7:0] id_7;
  inout wire _id_6;
  output wire id_5;
  input wire _id_4;
  input wire id_3;
  output wire id_2;
  output uwire id_1;
  bit id_14;
  assign id_1 = 1;
  bit id_15 = id_9 == id_9;
  assign id_10 = id_11[1];
  always_comb @(negedge -1'b0);
  initial begin : LABEL_0
    id_15 <= -1;
    id_14 <= id_7[id_4&id_6 : 1];
  end
endmodule
