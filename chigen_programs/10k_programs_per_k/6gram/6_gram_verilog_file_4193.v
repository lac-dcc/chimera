// Seed: 3534021512
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
  output wire id_14;
  input wire id_13;
  inout wire id_12;
  inout wire id_11;
  inout wire id_10;
  input wire id_9;
  inout wire id_8;
  input wire id_7;
  input wire id_6;
  output wire id_5;
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_15;
  ;
endmodule
module module_1 #(
    parameter id_18 = 32'd23,
    parameter id_4  = 32'd42,
    parameter id_6  = 32'd90
) (
    input supply1 id_0
    , id_17,
    input supply1 id_1,
    input tri1 id_2,
    output supply1 id_3,
    input uwire _id_4,
    input wor id_5,
    input wand _id_6,
    input wand id_7,
    input tri1 id_8
    , _id_18,
    input tri0 id_9,
    output tri1 id_10,
    output supply1 id_11,
    output wor id_12,
    input tri id_13,
    output wire id_14,
    output wand id_15
);
  wire [-1 : id_18  ==  -1] id_19;
  logic [id_6 : id_4] id_20;
  ;
  assign id_20 = 1'b0 ? 1'h0 : id_9;
  logic id_21[-1 : 1 'h0];
  module_0 modCall_1 (
      id_21,
      id_17,
      id_19,
      id_21,
      id_21,
      id_20,
      id_21,
      id_19,
      id_17,
      id_19,
      id_20,
      id_21,
      id_17,
      id_20
  );
  assign id_14 = -1'b0 ? id_21 : -1;
endmodule
