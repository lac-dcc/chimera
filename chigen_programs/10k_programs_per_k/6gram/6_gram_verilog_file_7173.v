// Seed: 224357135
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  input wire id_3;
  output wire id_2;
  input wire id_1;
  wire id_5;
endmodule
module module_1 #(
    parameter id_15 = 32'd92,
    parameter id_18 = 32'd47,
    parameter id_2  = 32'd29,
    parameter id_20 = 32'd49,
    parameter id_7  = 32'd35
) (
    id_1,
    _id_2,
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
    id_14,
    _id_15,
    id_16,
    id_17
);
  inout wire id_17;
  inout wire id_16;
  inout wire _id_15;
  output wire id_14;
  inout wire id_13;
  output wire id_12;
  output wire id_11;
  input wire id_10;
  module_0 modCall_1 (
      id_17,
      id_11,
      id_5,
      id_6
  );
  output wire id_9;
  output wire id_8;
  input wire _id_7;
  input wire id_6;
  input wire id_5;
  input logic [7:0] id_4;
  inout logic [7:0] id_3;
  input wire _id_2;
  inout wire id_1;
  logic [1 : 1] _id_18;
  logic id_19 = 1, _id_20;
  assign id_1 = 1;
  wire [-1 : ~  id_15  |  id_7] id_21;
  logic [id_20 : -1] id_22;
  ;
  assign id_3[id_18==1] = id_5 ? -1 : id_13 == id_15 ? id_3 : id_4[id_2];
  assign id_19 = !id_15;
endmodule
