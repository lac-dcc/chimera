// Seed: 2137466490
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
    id_18
);
  input wire id_18;
  output wire id_17;
  input wire id_16;
  output wire id_15;
  output wire id_14;
  output wire id_13;
  input wire id_12;
  input wire id_11;
  input wire id_10;
  inout wire id_9;
  input wire id_8;
  inout wire id_7;
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
endmodule
module module_1 #(
    parameter id_0 = 32'd8,
    parameter id_3 = 32'd29
) (
    output tri _id_0,
    input tri id_1,
    output supply1 id_2,
    input supply1 _id_3,
    output wor id_4,
    input wor id_5,
    output uwire id_6,
    output supply1 id_7[-1 : id_0]
);
  logic id_9;
  logic id_10;
  assign id_7 = id_5;
  logic [-1 : id_3] id_11 = id_1;
  module_0 modCall_1 (
      id_10,
      id_10,
      id_10,
      id_9,
      id_9,
      id_9,
      id_11,
      id_10,
      id_11,
      id_11,
      id_9,
      id_9,
      id_11,
      id_10,
      id_10,
      id_10,
      id_11,
      id_9
  );
  assign id_2 = (1);
  xnor primCall (id_4, id_9, id_1, id_11, id_10, id_5);
  logic id_12;
  ;
  logic [-1 : 1] id_13 = (id_12);
  parameter integer id_14 = 1;
endmodule
