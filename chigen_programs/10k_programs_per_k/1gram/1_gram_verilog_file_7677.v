// Seed: 2246632313
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  inout wire id_8;
  inout wire id_7;
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  wire id_9;
endmodule
module module_1 #(
    parameter id_10 = 32'd79,
    parameter id_4  = 32'd84,
    parameter id_7  = 32'd93,
    parameter id_8  = 32'd5
) (
    id_1,
    id_2["" : id_10],
    id_3,
    _id_4,
    id_5,
    id_6,
    _id_7[-1 :-1],
    _id_8,
    id_9,
    _id_10
);
  output wire _id_10;
  input wire id_9;
  input wire _id_8;
  input logic [7:0] _id_7;
  module_0 modCall_1 (
      id_5,
      id_1,
      id_5,
      id_5,
      id_6,
      id_5,
      id_6,
      id_6
  );
  inout wire id_6;
  inout wire id_5;
  output wire _id_4;
  input wire id_3;
  input logic [7:0] id_2;
  input wire id_1;
  wire id_11, id_12[id_4 : id_7];
  logic [-1 : id_8] id_13;
  ;
  integer id_14 = 1;
  wire id_15;
  union packed {logic id_16;} id_17;
  assign id_11 = id_1;
  struct packed {
    id_18 id_19  = !-1;
    logic id_20;
    id_21 id_22;
  } id_23;
  ;
endmodule
