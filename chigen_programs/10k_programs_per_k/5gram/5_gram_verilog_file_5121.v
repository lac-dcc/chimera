// Seed: 3517664762
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
    id_13
);
  output wire id_13;
  inout wire id_12;
  input wire id_11;
  output wire id_10;
  output wire id_9;
  inout wire id_8;
  output wire id_7;
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  always_comb force id_1 = id_2;
endmodule
module module_0 #(
    parameter id_12 = 32'd56,
    parameter id_13 = 32'd73,
    parameter id_15 = 32'd62,
    parameter id_17 = 32'd70,
    parameter id_20 = 32'd96,
    parameter id_3  = 32'd81
) (
    input wire id_0,
    output tri0 id_1,
    input supply0 id_2,
    output wire _id_3,
    output tri0 id_4,
    output wire id_5,
    output wor id_6,
    input wire id_7,
    input tri0 id_8,
    input supply1 id_9,
    input wor id_10,
    input supply1 id_11,
    output wand _id_12,
    input tri1 _id_13,
    input wand id_14,
    input uwire _id_15,
    input tri0 id_16,
    input wor _id_17,
    input supply1 id_18,
    input wire id_19,
    input wor _id_20
);
  wire [id_20 : id_17] id_22;
  assign id_6 = 1;
  struct packed {
    logic [id_13 : id_15] id_23;
    logic [-1 : 1 'b0] id_24;
  } [id_13  <  id_3 : id_12] module_1;
  ;
  module_0 modCall_1 (
      id_24,
      id_23,
      id_22,
      id_23,
      id_23,
      id_24,
      id_22,
      id_22,
      id_23,
      id_22,
      id_23,
      id_24,
      id_22
  );
endmodule
