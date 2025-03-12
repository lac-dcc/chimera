// Seed: 1704875205
module module_0 (
    id_1,
    id_2
);
  input wire id_2;
  output wire id_1;
  logic [  7:0] id_3;
  logic [1 : 1] id_4;
  assign id_3[-1] = -1;
  wire id_5;
  ;
endmodule
module module_1 #(
    parameter id_1  = 32'd93,
    parameter id_11 = 32'd85,
    parameter id_3  = 32'd75
) (
    _id_1,
    id_2,
    _id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    _id_11,
    id_12,
    id_13,
    id_14,
    id_15
);
  input wire id_15;
  inout wire id_14;
  input wire id_13;
  inout logic [7:0] id_12;
  input wire _id_11;
  output wire id_10;
  output wire id_9;
  module_0 modCall_1 (
      id_5,
      id_4
  );
  input wire id_8;
  output wire id_7;
  input wire id_6;
  output wire id_5;
  inout wire id_4;
  inout wire _id_3;
  and primCall (id_4, id_13, id_2, id_14, id_12, id_15, id_6, id_8);
  inout wire id_2;
  output wire _id_1;
  logic [-1 'b0 : -1] id_16;
  assign id_12[1&id_11-:1<1] = id_4 | "" ? -1 : "";
  logic [id_3 : id_1] id_17;
endmodule
