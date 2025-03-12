// Seed: 1749837430
module module_0 #(
    parameter id_11 = 32'd42
) (
    output wand id_0,
    output tri id_1,
    output supply1 id_2,
    input supply1 id_3,
    input supply0 id_4,
    input supply1 id_5,
    input wire id_6,
    input wire id_7,
    input supply1 id_8
);
  wire id_10;
  wire _id_11;
  wire [-1 : -1  ==  1] id_12;
  wire id_13 = id_8;
  wire id_14;
  logic [id_11 : -1] id_15;
  ;
endmodule
module module_1 (
    output wire id_0,
    input tri0 id_1
    , id_25,
    input tri0 id_2,
    output wand id_3,
    input tri0 id_4,
    output wire id_5,
    output wand id_6,
    input tri1 id_7,
    output supply0 id_8,
    input uwire id_9,
    input wire id_10,
    input wor id_11,
    input supply1 id_12,
    input wor id_13
    , id_26,
    output tri1 id_14,
    input tri1 id_15,
    output supply0 id_16,
    output tri1 id_17,
    input tri0 id_18,
    input wand id_19,
    output tri0 id_20,
    input tri id_21,
    input wire id_22,
    input tri id_23
);
  assign id_3 = id_18;
  module_0 modCall_1 (
      id_5,
      id_6,
      id_5,
      id_9,
      id_1,
      id_18,
      id_2,
      id_22,
      id_15
  );
  assign modCall_1.id_7 = 0;
  wire id_27 = id_18;
  integer id_28;
  xnor primCall (
      id_17,
      id_15,
      id_23,
      id_19,
      id_25,
      id_10,
      id_21,
      id_7,
      id_1,
      id_11,
      id_13,
      id_4,
      id_22,
      id_12,
      id_18,
      id_9,
      id_2
  );
endmodule
