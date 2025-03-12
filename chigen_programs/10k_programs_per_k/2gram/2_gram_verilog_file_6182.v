// Seed: 4200592024
module module_0 #(
    parameter id_15 = 32'd46
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
    id_14,
    _id_15,
    id_16,
    id_17,
    id_18,
    id_19,
    id_20,
    id_21
);
  input wire id_21;
  inout wire id_20;
  output wire id_19;
  output wire id_18;
  input wire id_17;
  output wire id_16;
  input wire _id_15;
  input wire id_14;
  input wire id_13;
  inout wire id_12;
  inout wire id_11;
  inout wire id_10;
  inout wire id_9;
  input wire id_8;
  output wire id_7;
  output wire id_6;
  inout wire id_5;
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  wire [(  id_15  ) : ""] id_22;
  wire id_23;
  wire id_24;
endmodule
module module_1 #(
    parameter id_0 = 32'd53,
    parameter id_1 = 32'd81,
    parameter id_3 = 32'd14,
    parameter id_5 = 32'd38
) (
    input wand _id_0,
    input uwire _id_1,
    input supply1 id_2,
    output wire _id_3
);
  logic ["" : 1] _id_5;
  ;
  struct packed {
    logic [id_0 : |  id_3  !==  1] id_6;
    logic id_7;
  } id_8;
  ;
  assign #id_9 id_8 = id_8.id_6;
  logic [-1 : id_1  ==?  id_5] id_10;
  genvar id_11;
  assign id_8.id_6[1] = 1;
  wire id_12;
  module_0 modCall_1 (
      id_10,
      id_11,
      id_11,
      id_10,
      id_7,
      id_7,
      id_8,
      id_11,
      id_10,
      id_12,
      id_6,
      id_10,
      id_7,
      id_11,
      id_9,
      id_10,
      id_12,
      id_6,
      id_11,
      id_7,
      id_12
  );
endmodule
