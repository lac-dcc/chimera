// Seed: 1318198614
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_5;
  localparam id_6 = 1;
  assign id_1 = id_3;
  assign id_2 = id_5;
  logic id_7;
  wire [-1 : -1] id_8, id_9, id_10;
endmodule
module module_1 #(
    parameter id_2 = 32'd54,
    parameter id_6 = 32'd75,
    parameter id_8 = 32'd64
) (
    id_1,
    _id_2,
    id_3,
    id_4,
    id_5,
    _id_6[1 : id_8],
    id_7,
    _id_8
);
  inout wire _id_8;
  output wire id_7;
  inout logic [7:0] _id_6;
  inout wire id_5;
  input wire id_4;
  inout reg id_3;
  input wire _id_2;
  input wire id_1;
  assign id_6 = id_5;
  module_0 modCall_1 (
      id_5,
      id_7,
      id_4,
      id_5
  );
  always id_3 = id_5;
  integer id_9 = id_1;
  logic [1 : id_2] id_10;
  ;
  struct packed {logic [id_2 : 1] id_11;} id_12;
  logic id_13;
  logic [7:0][id_6 : -1] id_14;
  wire id_15, id_16;
  assign id_14[1-1] = 1;
endmodule
