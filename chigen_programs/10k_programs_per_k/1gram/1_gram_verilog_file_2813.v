// Seed: 168447668
module module_0 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire  id_4;
  logic id_5;
  ;
endmodule
module module_1 #(
    parameter id_10 = 32'd82,
    parameter id_11 = 32'd65,
    parameter id_6  = 32'd51,
    parameter id_8  = 32'd16
) (
    id_1[id_11 : 1],
    id_2,
    id_3,
    id_4,
    id_5,
    _id_6,
    id_7,
    _id_8,
    id_9[id_8 : 1],
    _id_10[1 : id_8],
    _id_11,
    id_12,
    id_13,
    id_14,
    id_15
);
  output wire id_15;
  inout wire id_14;
  input wire id_13;
  output wire id_12;
  module_0 modCall_1 (
      id_14,
      id_14,
      id_14
  );
  inout wire _id_11;
  output logic [7:0] _id_10;
  inout logic [7:0] id_9;
  input wire _id_8;
  inout wire id_7;
  input wire _id_6;
  input wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  inout logic [7:0] id_1;
  assign id_12 = id_6;
  wire id_16;
  union packed {
    integer id_17[id_6 : -1] = 1;
    logic   id_18;
  } [-1 'b0 : id_10] id_19;
  ;
endmodule
