// Seed: 137844582
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  inout logic [7:0] id_1;
  logic id_6;
endmodule
module module_0 #(
    parameter id_10 = 32'd2,
    parameter id_4  = 32'd22,
    parameter id_9  = 32'd58
) (
    id_1,
    id_2,
    id_3,
    _id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    module_1,
    _id_10,
    id_11,
    id_12,
    id_13,
    id_14
);
  inout wire id_14;
  output wire id_13;
  output wire id_12;
  output wire id_11;
  input wire _id_10;
  inout wire _id_9;
  output wire id_8;
  inout supply1 id_7;
  output wire id_6;
  inout wire id_5;
  input wire _id_4;
  input wire id_3;
  input logic [7:0] id_2;
  inout wire id_1;
  logic id_15;
  assign id_15[id_10==1] = id_1 == id_2;
  assign id_15[!id_9] = -1;
  assign id_7 = id_9 ? 1 : 1;
  module_0 modCall_1 (
      id_15,
      id_12,
      id_7,
      id_7,
      id_5
  );
  generate
    assign id_14 = 1 ? id_2[id_4] : id_14;
  endgenerate
endmodule
