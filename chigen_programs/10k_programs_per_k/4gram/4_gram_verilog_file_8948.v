// Seed: 2896287161
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  input wire id_5;
  inout wire id_4;
  input wire id_3;
  output supply1 id_2;
  output wire id_1;
  assign id_2 = 1 ? {id_4, 1, 1, id_3} : 1'b0;
  wire id_7;
endmodule
module module_1 #(
    parameter id_7 = 32'd96
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    _id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13,
    id_14
);
  input wire id_14;
  output wire id_13;
  inout wire id_12;
  input wire id_11;
  input wire id_10;
  input wire id_9;
  inout wire id_8;
  inout wire _id_7;
  inout logic [7:0] id_6;
  input wire id_5;
  output wire id_4;
  module_0 modCall_1 (
      id_12,
      id_4,
      id_8,
      id_2,
      id_12,
      id_9
  );
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  pmos #(!id_12) (1 != id_2, 1'b0);
  assign id_6[id_7] = -1;
  assign id_3 = id_11;
endmodule
