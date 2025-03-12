// Seed: 2909186096
module module_0 (
    input uwire id_0,
    input supply0 id_1,
    input tri id_2,
    input tri0 id_3,
    input wor id_4,
    input uwire id_5,
    input wor id_6,
    output supply0 id_7,
    input tri id_8,
    input tri id_9,
    input supply0 id_10,
    input tri id_11,
    input wor id_12,
    output wand id_13
);
  wire id_15 = id_10;
endmodule
module module_1 #(
    parameter id_10 = 32'd49,
    parameter id_24 = 32'd51,
    parameter id_27 = 32'd12,
    parameter id_29 = 32'd56
) (
    input wor id_0,
    output tri id_1,
    output tri id_2,
    input wor id_3,
    input wor id_4,
    input wire id_5,
    output wor id_6,
    input wand id_7,
    input wand id_8,
    input uwire id_9,
    output tri0 _id_10,
    input tri0 id_11,
    output tri1 id_12,
    input supply0 id_13,
    input supply1 id_14,
    input tri1 id_15,
    output tri1 id_16,
    input tri1 id_17,
    input tri0 id_18,
    input tri0 id_19,
    input supply0 id_20,
    output wire id_21,
    input wor id_22,
    input tri0 id_23,
    output tri _id_24,
    output tri id_25,
    input supply0 id_26,
    input uwire _id_27,
    input tri id_28,
    input uwire _id_29
);
  module_0 modCall_1 (
      id_20,
      id_11,
      id_5,
      id_9,
      id_8,
      id_19,
      id_26,
      id_12,
      id_28,
      id_0,
      id_19,
      id_5,
      id_28,
      id_6
  );
  assign modCall_1.id_9 = 0;
  assign id_1 = ~-1'b0 < id_17;
  wire id_31;
  wire id_32;
  assign id_32 = {id_8{id_7}};
  logic [-1 : id_10] id_33;
  ;
  logic [-1 : id_24] id_34;
  ;
  logic [{  -1  +  id_27  ,  -1  } : id_29] id_35 = (-1);
  assign id_35 = 1 ? id_35 : -1;
  assign id_33 = id_31;
  assign id_2  = -1;
  logic [-1 'b0 : -  -1] id_36 = -1;
endmodule
