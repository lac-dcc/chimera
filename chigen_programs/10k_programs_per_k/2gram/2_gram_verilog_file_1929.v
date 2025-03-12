// Seed: 1829908218
module module_0 (
    input uwire id_0,
    input tri0 id_1,
    input wor id_2,
    input tri1 id_3,
    output wire id_4
    , id_25,
    input wand id_5,
    input wor id_6,
    input wor id_7,
    output tri1 id_8,
    input wand id_9,
    input tri0 id_10,
    input supply1 id_11,
    input supply1 id_12,
    output tri id_13,
    input tri0 id_14,
    input tri0 id_15,
    input wand id_16,
    output wire id_17,
    output tri0 id_18,
    output supply1 id_19
    , id_26,
    input tri0 id_20,
    output supply0 id_21,
    input uwire id_22,
    input supply1 id_23
);
  assign id_13 = 1'h0;
  assign module_1.id_5 = 0;
  logic id_27;
  ;
endmodule
module module_1 #(
    parameter id_0  = 32'd35,
    parameter id_1  = 32'd21,
    parameter id_14 = 32'd57,
    parameter id_15 = 32'd65,
    parameter id_5  = 32'd47,
    parameter id_7  = 32'd71,
    parameter id_8  = 32'd76
) (
    output supply1 _id_0,
    output supply0 _id_1,
    input wire id_2,
    input tri id_3,
    input tri id_4,
    output supply1 _id_5,
    input tri0 id_6,
    input wor _id_7,
    input tri1 _id_8,
    input uwire id_9,
    output wand id_10,
    output tri1 id_11,
    input tri1 id_12
);
  logic [-1  !==  id_0 : (  -1 'd0 ==  id_0  )] _id_14 = 1;
  module_0 modCall_1 (
      id_12,
      id_4,
      id_4,
      id_4,
      id_10,
      id_3,
      id_4,
      id_6,
      id_10,
      id_2,
      id_2,
      id_9,
      id_4,
      id_11,
      id_12,
      id_12,
      id_2,
      id_11,
      id_11,
      id_10,
      id_3,
      id_10,
      id_3,
      id_3
  );
  wire _id_15;
  assign id_11 = -1;
  and primCall (id_11, id_4, id_2, id_12);
  logic id_16[-1 : (  id_0  #  (
      .  id_15(  id_5  ),
      .  id_7 (  id_1  &  -1  ),
      .  id_14( "" ),
      .  id_8 (  -1  )
)  )];
endmodule
