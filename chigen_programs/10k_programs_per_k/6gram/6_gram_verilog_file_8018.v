// Seed: 696113636
module module_0 #(
    parameter id_11 = 32'd56
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
    _id_11,
    id_12,
    id_13
);
  inout wire id_13;
  inout wire id_12;
  output wire _id_11;
  input wire id_10;
  output wire id_9;
  input wire id_8;
  inout wire id_7;
  output wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  logic [1 : id_11] id_14;
endmodule
module module_1 #(
    parameter id_2 = 32'd81,
    parameter id_3 = 32'd93,
    parameter id_4 = 32'd17
) (
    id_1,
    _id_2,
    _id_3,
    _id_4,
    id_5,
    id_6
);
  inout wire id_6;
  inout logic [7:0] id_5;
  input wire _id_4;
  output wire _id_3;
  input wire _id_2;
  output wire id_1;
  assign id_3 = id_5;
  logic [7:0] id_7;
  module_0 modCall_1 (
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_3,
      id_6,
      id_6
  );
  logic [id_3 : 1] id_8 = id_7;
  assign id_7[-1'b0] = id_8 * id_5[id_4];
  logic [id_2 : -1] id_9 = 1;
  assign id_8 = !id_6;
endmodule
