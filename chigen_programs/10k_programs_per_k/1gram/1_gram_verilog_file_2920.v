// Seed: 1334811445
module module_0 (
    output tri id_0,
    input supply1 id_1,
    input supply1 id_2,
    input wor id_3,
    input tri id_4
    , id_22,
    output uwire id_5,
    input tri0 id_6,
    input supply0 id_7,
    input wor id_8,
    input wire id_9,
    input supply0 id_10,
    input wor id_11,
    output tri0 id_12,
    output tri1 id_13,
    output tri0 id_14
    , id_23,
    input wire id_15
    , id_24,
    output wand id_16,
    input tri0 id_17,
    input wand id_18,
    input wire id_19,
    input wor id_20
);
  logic id_25 = id_3;
  wire  id_26;
  assign id_22 = -1;
  assign module_1.id_4 = 0;
  assign id_5 = 1;
endmodule
module module_1 #(
    parameter id_10 = 32'd45,
    parameter id_2  = 32'd14,
    parameter id_4  = 32'd67,
    parameter id_7  = 32'd34,
    parameter id_8  = 32'd64
) (
    input tri1 id_0,
    output uwire id_1,
    output wor _id_2,
    input supply1 id_3,
    input wor _id_4,
    output wor id_5[1 : id_8],
    input wand id_6,
    input supply1 _id_7,
    input wor _id_8
);
  wire _id_10[id_7 : id_2];
  module_0 modCall_1 (
      id_5,
      id_3,
      id_6,
      id_6,
      id_0,
      id_1,
      id_0,
      id_6,
      id_0,
      id_6,
      id_3,
      id_6,
      id_5,
      id_5,
      id_5,
      id_6,
      id_5,
      id_3,
      id_0,
      id_0,
      id_6
  );
  logic id_11;
  ;
  wire [1 'b0 : {  id_10  ,  id_4  , "" **  id_7  +  -1  }] id_12, id_13;
  assign id_11 = 1;
endmodule
