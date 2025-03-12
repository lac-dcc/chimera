// Seed: 1352794660
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  output wire id_5;
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  logic id_7;
endmodule
module module_1 #(
    parameter id_1 = 32'd2,
    parameter id_4 = 32'd66,
    parameter id_7 = 32'd43,
    parameter id_8 = 32'd26
) (
    _id_1,
    id_2,
    id_3,
    _id_4[id_8 :-1],
    id_5,
    id_6[id_4 :-1?id_1 : id_7],
    _id_7,
    _id_8
);
  output wire _id_8;
  output wire _id_7;
  input logic [7:0] id_6;
  output wire id_5;
  inout logic [7:0] _id_4;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_2,
      id_5,
      id_5,
      id_3
  );
  inout wire id_3;
  inout wire id_2;
  inout wire _id_1;
  struct packed {
    logic id_9;
    logic id_10;
    id_11 [1 : 1] id_12;
    real id_13;
    logic id_14;
    union packed {
      logic id_15;
      logic id_16[id_4 : -1] = 1;
    } id_17;
    logic id_18;
  } id_19;
  ;
endmodule
