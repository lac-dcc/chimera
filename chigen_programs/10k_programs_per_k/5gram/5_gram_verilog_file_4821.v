// Seed: 3890815790
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
    id_16,
    id_17,
    id_18,
    id_19,
    id_20,
    id_21,
    id_22,
    id_23,
    id_24,
    id_25,
    id_26
);
  input wire id_26;
  input wire id_25;
  input wire id_24;
  output wire id_23;
  input wire id_22;
  input wire id_21;
  input wire id_20;
  output wire id_19;
  output wire id_18;
  input logic [7:0] id_17;
  input wire id_16;
  inout wire id_15;
  output wire id_14;
  input wire id_13;
  output wire id_12;
  output wire id_11;
  inout wire id_10;
  inout wire id_9;
  output wire id_8;
  output wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_9 = id_17['d0];
endmodule
module module_1 #(
    parameter id_5 = 32'd37
) (
    output supply0 id_0,
    input tri1 id_1,
    input wand id_2,
    output tri0 id_3,
    input supply1 id_4,
    input uwire _id_5,
    input wire id_6,
    output supply0 id_7,
    input wand id_8,
    output wire id_9,
    input uwire id_10,
    output tri1 id_11,
    output wor id_12
    , id_23,
    input wire id_13,
    input wand id_14
    , id_24,
    input wand id_15,
    input wor id_16,
    input supply1 id_17,
    input tri id_18,
    input wor id_19,
    output tri id_20,
    input tri1 id_21
);
  logic id_25;
  module_0 modCall_1 (
      id_25,
      id_25,
      id_25,
      id_25,
      id_25,
      id_25,
      id_25,
      id_25,
      id_25,
      id_25,
      id_25,
      id_25,
      id_25,
      id_25,
      id_25,
      id_25,
      id_23,
      id_25,
      id_25,
      id_25,
      id_25,
      id_25,
      id_25,
      id_25,
      id_25,
      id_25
  );
  generate
    always @(1) id_23[id_5] = id_23 == id_15;
  endgenerate
  and primCall (
      id_7,
      id_2,
      id_1,
      id_25,
      id_4,
      id_17,
      id_24,
      id_16,
      id_21,
      id_19,
      id_15,
      id_18,
      id_23,
      id_6,
      id_14,
      id_13,
      id_8
  );
endmodule
