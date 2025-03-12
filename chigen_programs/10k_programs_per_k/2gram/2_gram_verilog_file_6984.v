// Seed: 1688860770
module module_0 #(
    parameter id_22 = 32'd86,
    parameter id_24 = 32'd29
) (
    output tri id_0
    , id_19,
    input uwire id_1,
    output supply1 id_2,
    input supply1 id_3,
    input supply1 id_4
    , id_20,
    input tri id_5,
    input wire id_6,
    input tri id_7,
    input wand id_8,
    input tri0 id_9,
    output uwire id_10,
    output uwire id_11,
    input supply1 id_12,
    input wand id_13,
    output tri1 id_14,
    output tri id_15,
    input supply0 id_16,
    input wor id_17
);
  assign id_19 = -1;
  wire id_21;
  ;
  wire _id_22;
  ;
  parameter integer id_23 = 1;
  wire _id_24;
  logic id_25;
  logic [id_22 : id_24] \id_26 = -1;
  assign id_25 = id_24;
endmodule
module module_1 #(
    parameter id_10 = 32'd59,
    parameter id_16 = 32'd9,
    parameter id_4  = 32'd36,
    parameter id_6  = 32'd10
) (
    output tri id_0,
    output wand id_1,
    input wor id_2,
    input tri1 id_3,
    input tri1 _id_4,
    output uwire id_5,
    input supply0 _id_6,
    output supply0 id_7,
    input wire id_8,
    input tri0 id_9,
    input tri _id_10,
    input wand id_11,
    input tri0 id_12,
    input supply1 id_13,
    input tri1 id_14
);
  assign id_7 = (id_3);
  wire _id_16;
  wire id_17;
  assign id_5 = id_9;
  logic [  -1 : id_16] id_18;
  logic [id_4 : id_10] id_19;
  ;
  module_0 modCall_1 (
      id_0,
      id_12,
      id_7,
      id_2,
      id_9,
      id_2,
      id_2,
      id_2,
      id_2,
      id_13,
      id_1,
      id_7,
      id_11,
      id_13,
      id_7,
      id_1,
      id_2,
      id_13
  );
  assign id_7 = id_2 << -1;
  logic id_20;
  ;
  wire [-1 : id_6] id_21;
  xnor primCall (id_0, id_11, id_2, id_18, id_8, id_3, id_14, id_12, id_9, id_17);
endmodule
