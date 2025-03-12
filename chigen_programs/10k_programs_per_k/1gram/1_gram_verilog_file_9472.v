// Seed: 1256539449
module module_0 (
    output wand id_0,
    output wire id_1,
    output supply1 id_2,
    input supply1 id_3,
    output wor id_4,
    input wire id_5,
    input wire id_6,
    input wire id_7,
    input tri id_8,
    input supply1 id_9,
    input supply0 id_10,
    output supply1 id_11,
    input wire id_12,
    output tri id_13,
    input tri1 id_14
    , id_18,
    input supply1 id_15,
    output wand id_16
);
  logic id_19, id_20, id_21;
endmodule
module module_1 #(
    parameter id_2 = 32'd28,
    parameter id_6 = 32'd76
) (
    output wand  id_0,
    input  uwire id_1,
    input  wor   _id_2,
    input  tri1  id_3
);
  parameter id_5 = 1;
  assign id_0 = -1;
  module_0 modCall_1 (
      id_0,
      id_0,
      id_0,
      id_3,
      id_0,
      id_1,
      id_3,
      id_1,
      id_3,
      id_3,
      id_1,
      id_0,
      id_1,
      id_0,
      id_1,
      id_3,
      id_0
  );
  logic [7:0][id_2 : -1] _id_6, id_7, id_8[id_6 : 1];
  struct packed {
    id_9  id_10;
    logic id_11;
    logic id_12  = id_5;
    logic id_13;
    logic id_14;
  } id_15;
  ;
  logic id_16;
  logic id_17;
  ;
  assign id_7 = id_15.id_9;
  assign id_6 = id_16;
  assign id_15.id_12[(1)] = {-1, 1, !1, id_16[id_2]};
  integer id_18 = -1'd0 + id_15.id_14;
  assign id_7[1] = id_17;
endmodule
