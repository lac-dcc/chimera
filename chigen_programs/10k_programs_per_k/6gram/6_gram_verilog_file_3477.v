// Seed: 3054774342
module module_0 (
    input supply1 id_0,
    input wand id_1
    , id_30,
    input tri id_2,
    output uwire id_3,
    output tri0 id_4,
    input wire id_5,
    output tri1 id_6,
    input uwire id_7,
    input uwire id_8,
    input wire id_9,
    input wand id_10
    , id_31,
    output tri id_11,
    input uwire id_12,
    input uwire id_13,
    input supply1 id_14,
    input tri1 id_15,
    input wor id_16,
    input uwire id_17,
    input tri1 id_18,
    input supply0 id_19,
    input wire id_20,
    output wor id_21,
    output tri0 id_22,
    input wand id_23,
    input supply0 id_24,
    input uwire id_25,
    input wire id_26,
    output wire id_27,
    output supply0 id_28
);
  wire  id_32;
  logic id_33 = id_30 != -1;
endmodule
module module_1 #(
    parameter id_1 = 32'd34,
    parameter id_4 = 32'd39
) (
    output tri id_0,
    input tri0 _id_1,
    input tri1 id_2,
    output supply0 id_3,
    input tri0 _id_4,
    input tri0 id_5,
    input tri1 id_6,
    input wire id_7,
    input tri1 id_8,
    output tri0 id_9
);
  assign id_9 = 1;
  module_0 modCall_1 (
      id_2,
      id_7,
      id_7,
      id_0,
      id_0,
      id_6,
      id_9,
      id_8,
      id_5,
      id_5,
      id_5,
      id_9,
      id_7,
      id_5,
      id_5,
      id_7,
      id_5,
      id_5,
      id_5,
      id_8,
      id_6,
      id_0,
      id_9,
      id_6,
      id_5,
      id_2,
      id_6,
      id_3,
      id_0
  );
  assign modCall_1.id_8 = 0;
  wire id_11 [id_4 : id_1];
  wire id_12;
  ;
  xnor primCall (id_0, id_2, id_5, id_7, id_8, id_6);
endmodule
