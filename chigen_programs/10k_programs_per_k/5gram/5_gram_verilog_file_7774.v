// Seed: 1745209843
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
    id_14
);
  input wire id_14;
  input wire id_13;
  output wire id_12;
  output wire id_11;
  inout wire id_10;
  inout wire id_9;
  inout wire id_8;
  input wire id_7;
  input wire id_6;
  inout wire id_5;
  input wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  wire [-1 : -1] id_15;
endmodule
module module_1 #(
    parameter id_0  = 32'd97,
    parameter id_13 = 32'd53,
    parameter id_20 = 32'd92,
    parameter id_8  = 32'd86
) (
    input uwire _id_0,
    input tri1 id_1,
    output supply0 id_2,
    output tri1 id_3,
    output wire id_4,
    output wire id_5,
    input tri0 id_6,
    output uwire id_7,
    output tri _id_8,
    input supply1 id_9,
    output supply1 id_10,
    input wand id_11,
    output uwire id_12,
    output uwire _id_13,
    input wire id_14,
    input wor id_15,
    input tri0 id_16,
    input wand id_17,
    input supply0 id_18,
    output uwire id_19,
    output wire _id_20
);
  logic [(  ~  id_13  ==  id_8  -  ~  id_20  ) : id_0] id_22;
  and primCall (id_5, id_11, id_6, id_15, id_9, id_18, id_23, id_1, id_17, id_14, id_16, id_22);
  assign id_10 = -1;
  logic id_23 = 1;
  module_0 modCall_1 (
      id_22,
      id_22,
      id_23,
      id_22,
      id_23,
      id_23,
      id_22,
      id_23,
      id_22,
      id_23,
      id_22,
      id_22,
      id_22,
      id_23
  );
endmodule
