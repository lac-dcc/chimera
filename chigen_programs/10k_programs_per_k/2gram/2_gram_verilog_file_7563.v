// Seed: 3941658294
module module_0 (
    input uwire id_0,
    output tri id_1,
    input supply1 id_2,
    output wand id_3,
    output wire id_4,
    output supply0 id_5,
    output supply0 id_6,
    input uwire id_7,
    input tri0 id_8,
    output tri1 id_9,
    output wand id_10,
    input uwire id_11,
    input wand id_12,
    output uwire id_13,
    output tri id_14,
    input tri0 id_15,
    output tri1 id_16,
    input wand id_17,
    input wire id_18,
    output wor id_19,
    output uwire id_20,
    input supply1 id_21,
    output wand id_22,
    input wor id_23#(
        .id_25(1),
        .id_26(1)
    )
);
  wire id_27;
  ;
endmodule
module module_1 #(
    parameter id_11 = 32'd21,
    parameter id_2  = 32'd62,
    parameter id_20 = 32'd27
) (
    input wire id_0,
    output supply0 id_1,
    input supply1 _id_2,
    input wand id_3,
    output wor id_4,
    input supply1 id_5,
    input wand id_6,
    output tri id_7
);
  assign #id_9 id_1 = id_0;
  wire id_10;
  wire  [  1  :  id_2  ]  _id_11  ,  id_12  ,  id_13  ,  id_14  ,  id_15  ,  id_16  ,  \id_17  ,  id_18  ,  id_19  ,  _id_20  ,  id_21  ,  id_22  ;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_5,
      id_4,
      id_4,
      id_7,
      id_1,
      id_3,
      id_5,
      id_7,
      id_7,
      id_6,
      id_3,
      id_1,
      id_4,
      id_0,
      id_4,
      id_6,
      id_3,
      id_7,
      id_7,
      id_3,
      id_1,
      id_6
  );
  assign modCall_1.id_14 = 0;
  wire [id_11 : id_20] id_23;
  wire id_24;
endmodule
