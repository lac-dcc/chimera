// Seed: 4260110780
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
    id_15,
    id_16
);
  input wire id_16;
  input wire id_15;
  inout wire id_14;
  input wire id_13;
  output wire id_12;
  output wire id_11;
  inout wire id_10;
  input wire id_9;
  input wire id_8;
  inout wire id_7;
  input wire id_6;
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_17;
endmodule
module module_1 #(
    parameter id_11 = 32'd71,
    parameter id_12 = 32'd40,
    parameter id_14 = 32'd25,
    parameter id_16 = 32'd43,
    parameter id_18 = 32'd72,
    parameter id_2  = 32'd91,
    parameter id_6  = 32'd89
) (
    id_1,
    _id_2,
    id_3,
    id_4,
    id_5,
    _id_6,
    id_7[id_14 : id_12],
    id_8,
    id_9,
    id_10,
    _id_11,
    _id_12,
    id_13,
    _id_14,
    id_15,
    _id_16
);
  input wire _id_16;
  output wire id_15;
  output wire _id_14;
  output wire id_13;
  output wire _id_12;
  input wire _id_11;
  input wire id_10;
  output wire id_9;
  output wire id_8;
  inout logic [7:0] id_7;
  input wire _id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  output wire _id_2;
  output wire id_1;
  wire id_17;
  ;
  wire [{  -1  } : id_16] _id_18;
  assign id_8 = id_10;
  wire [-1 : id_16] id_19;
  logic [id_11  ?  -1  ?  id_18 : id_6 : id_2  |  id_11 : -1] id_20;
  logic id_21;
  module_0 modCall_1 (
      id_21,
      id_17,
      id_5,
      id_17,
      id_19,
      id_20,
      id_5,
      id_19,
      id_17,
      id_20,
      id_13,
      id_21,
      id_20,
      id_19,
      id_20,
      id_17
  );
endmodule
