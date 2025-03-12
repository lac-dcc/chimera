// Seed: 2674481550
module module_0 (
    input tri0 id_0,
    output wire id_1,
    input wire id_2,
    input supply1 id_3
    , id_10,
    input supply0 id_4,
    input supply1 id_5,
    input tri0 id_6,
    input tri0 id_7,
    input wor id_8
);
  wire id_11, id_12, id_13;
endmodule
module module_1 #(
    parameter id_11 = 32'd75,
    parameter id_19 = 32'd7,
    parameter id_5  = 32'd74
) (
    output wire id_0,
    input wor id_1,
    output wor id_2,
    output tri1 id_3,
    input tri0 id_4,
    input tri0 _id_5,
    input wand id_6,
    input wand id_7,
    input uwire id_8,
    output tri0 id_9,
    output supply1 id_10,
    input wand _id_11,
    input wand id_12,
    output supply0 id_13,
    input tri id_14,
    input tri1 id_15,
    output supply1 id_16,
    input wand id_17,
    output tri1 id_18,
    output tri _id_19,
    output uwire id_20,
    input wand id_21,
    input uwire id_22,
    input wand id_23
);
  logic id_25;
  module_0 modCall_1 (
      id_21,
      id_10,
      id_21,
      id_8,
      id_15,
      id_12,
      id_23,
      id_12,
      id_7
  );
  assign modCall_1.id_3 = 0;
  logic [1 'b0 : id_11  &  1  +  1  &  id_5  (  id_19  )] id_26 = 1;
  wire id_27;
  wire [-1 'd0 : -1] id_28;
  xor primCall (
      id_18, id_7, id_8, id_25, id_6, id_12, id_4, id_21, id_22, id_1, id_14, id_17, id_15, id_23
  );
endmodule
