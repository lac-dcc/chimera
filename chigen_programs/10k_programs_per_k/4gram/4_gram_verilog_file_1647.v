// Seed: 3792547696
module module_0 (
    input uwire id_0,
    output uwire id_1,
    output supply1 id_2,
    input wire id_3,
    input wand id_4,
    input tri id_5,
    output supply1 id_6,
    output tri id_7,
    input tri id_8
    , id_38,
    input wire id_9,
    input uwire id_10,
    input supply0 id_11,
    output tri0 id_12,
    output tri0 id_13,
    output tri0 id_14,
    input supply1 id_15,
    output wire id_16,
    input wire id_17,
    input tri0 id_18,
    output supply1 id_19,
    input wor id_20,
    input wire id_21,
    input wor id_22,
    output wire id_23,
    output wire id_24,
    output tri0 id_25,
    output wire id_26
    , id_39,
    output supply0 id_27,
    input wand id_28,
    input tri1 id_29,
    output tri1 id_30,
    input wand id_31,
    input wor id_32,
    output supply0 id_33,
    input wand id_34,
    input uwire id_35,
    output uwire id_36
);
  id_40 :
  assert property (@(posedge id_31) id_34 ^ id_40)
  else $unsigned(16);
  ;
  assign module_1.id_9 = 0;
  id_41 :
  assert property (@(negedge -1) id_39)
  else $unsigned(59);
  ;
endmodule
module module_1 #(
    parameter id_7 = 32'd8
) (
    input uwire id_0,
    output wand id_1,
    output uwire id_2,
    output tri0 id_3,
    input tri0 id_4,
    output tri1 id_5,
    output supply0 id_6,
    input supply1 _id_7,
    input supply0 id_8
    , id_12,
    output wor id_9,
    input wand id_10
);
  wire [1 : id_7  #  (  1  -  1  ,  -1  +  -1  ,  1  )] id_13;
  module_0 modCall_1 (
      id_10,
      id_3,
      id_9,
      id_4,
      id_0,
      id_4,
      id_3,
      id_6,
      id_4,
      id_0,
      id_0,
      id_10,
      id_1,
      id_6,
      id_2,
      id_0,
      id_5,
      id_8,
      id_8,
      id_2,
      id_10,
      id_0,
      id_8,
      id_1,
      id_6,
      id_1,
      id_1,
      id_6,
      id_4,
      id_0,
      id_2,
      id_4,
      id_8,
      id_1,
      id_10,
      id_8,
      id_1
  );
endmodule
