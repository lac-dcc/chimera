// Seed: 2590104650
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
    id_15
);
  inout wire id_15;
  inout wire id_14;
  input wire id_13;
  output wire id_12;
  input wire id_11;
  inout wire id_10;
  input wire id_9;
  output wire id_8;
  output wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_16;
  wire id_17;
endmodule
module module_1 #(
    parameter id_1 = 32'd26,
    parameter id_4 = 32'd93,
    parameter id_7 = 32'd86,
    parameter id_9 = 32'd53
) (
    output tri0  id_0,
    output wor   _id_1,
    output uwire id_2,
    output wor   id_3
    , id_12,
    input  uwire _id_4,
    input  uwire id_5,
    output wire  id_6,
    input  uwire _id_7,
    output tri0  id_8,
    output tri1  _id_9,
    input  tri0  id_10
);
  struct packed {
    struct packed {
      logic [-1 : 1] id_13;
      logic [id_1  -  id_9 : -1  *  id_4] id_14;
    } [id_1 : id_7] id_15;
  } [1 : id_1] id_16;
  wire id_17;
  localparam id_18 = 1;
  localparam id_19 = -1'b0;
  module_0 modCall_1 (
      id_15,
      id_13,
      id_19,
      id_19,
      id_19,
      id_19,
      id_17,
      id_19,
      id_19,
      id_14,
      id_15,
      id_12,
      id_12,
      id_14,
      id_19
  );
endmodule
