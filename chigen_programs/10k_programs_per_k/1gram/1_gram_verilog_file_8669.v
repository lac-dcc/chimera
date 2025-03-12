// Seed: 80919453
module module_0 (
    id_1
);
  output wire id_1;
endmodule
module module_1 #(
    parameter id_3 = 32'd14,
    parameter id_4 = 32'd13
) (
    id_1,
    id_2,
    _id_3,
    _id_4,
    id_5
);
  output wire id_5;
  inout wire _id_4;
  input wire _id_3;
  inout wire id_2;
  input wire id_1;
  uwire id_6, id_7, id_8[id_4 : 1 'b0], id_9[-1 : id_3];
  logic id_10, id_11;
  module_0 modCall_1 (id_2);
  assign id_9 = 1;
  xor primCall (id_2, id_1, id_8, id_6, id_10, id_9, id_7, id_11);
  logic id_12;
  wire  id_13;
  assign id_8 = id_12 < id_7 - id_2;
  assign id_6 = id_7 + -1;
endmodule
