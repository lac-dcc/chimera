// Seed: 3288591592
module module_0 (
    output wor id_0,
    input supply1 id_1,
    input tri1 id_2,
    input tri0 id_3,
    output supply1 id_4,
    input tri id_5,
    output wor id_6,
    input supply0 id_7,
    input uwire id_8,
    input wire id_9,
    input wor id_10,
    input wire id_11,
    input uwire id_12,
    input tri id_13,
    output tri id_14,
    output supply1 id_15,
    input supply1 id_16,
    input supply1 id_17,
    output wor id_18,
    output supply0 id_19,
    output supply0 id_20,
    input tri0 id_21,
    input tri0 id_22,
    input uwire id_23,
    output wire id_24,
    output uwire id_25,
    input uwire id_26,
    input wor id_27
);
  wire id_29;
  wire id_30;
  wire id_31;
endmodule
macromodule module_1 #(
    parameter id_1 = 32'd66,
    parameter id_2 = 32'd28,
    parameter id_6 = 32'd54
) (
    input wire id_0,
    output supply0 _id_1,
    input tri0 _id_2,
    output wand id_3,
    input tri id_4,
    output supply0 id_5,
    output wor _id_6,
    input wand id_7,
    output supply1 id_8
);
  wire id_10;
  assign id_5 = -1'd0;
  module_0 modCall_1 (
      id_5,
      id_7,
      id_7,
      id_0,
      id_8,
      id_0,
      id_8,
      id_0,
      id_0,
      id_7,
      id_4,
      id_0,
      id_0,
      id_0,
      id_3,
      id_8,
      id_4,
      id_4,
      id_3,
      id_8,
      id_3,
      id_4,
      id_4,
      id_0,
      id_3,
      id_3,
      id_7,
      id_7
  );
  assign modCall_1.id_8 = 0;
  assign id_8 = id_2;
  supply1 \id_11 [id_6  ==  id_1 : -1 'b0];
  wire id_12;
  logic [1 : id_2] id_13;
  ;
  assign \id_11 = 1;
  wire id_14;
endmodule
