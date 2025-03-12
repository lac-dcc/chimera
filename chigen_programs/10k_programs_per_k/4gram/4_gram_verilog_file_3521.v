// Seed: 2223261395
module module_0 (
    input tri id_0,
    output wire id_1,
    output supply1 id_2,
    output uwire id_3,
    input supply1 id_4,
    output tri id_5,
    input supply1 id_6,
    input tri1 id_7,
    output wand id_8,
    output tri0 id_9,
    output uwire id_10,
    input uwire id_11,
    input supply1 id_12,
    output wand id_13,
    output uwire id_14,
    input tri id_15,
    output wand id_16,
    output wand id_17,
    input tri id_18,
    input supply0 id_19,
    output wor id_20,
    output wire id_21,
    output supply0 id_22,
    input tri1 id_23,
    output wand id_24,
    output uwire id_25,
    input wor id_26
    , id_38,
    output tri1 id_27,
    output wire id_28,
    input supply0 id_29,
    input wire id_30,
    input wire id_31,
    output tri id_32,
    input tri id_33,
    input uwire id_34,
    input tri1 id_35,
    output tri id_36
);
  parameter id_39 = "";
endmodule
module module_1 #(
    parameter id_10 = 32'd39
) (
    input supply1 id_0,
    output wor id_1,
    input wand id_2,
    input wor id_3,
    output tri id_4,
    input wand id_5,
    input wand id_6,
    output tri id_7,
    output tri0 id_8,
    output tri id_9,
    input wire _id_10,
    input tri0 id_11,
    output supply1 id_12
    , id_16,
    input wand id_13,
    input tri id_14
);
  wire id_17;
  id_18 :
  assert property (@(posedge id_13) (1))
  else $signed(63);
  ;
  module_0 modCall_1 (
      id_6,
      id_12,
      id_4,
      id_1,
      id_14,
      id_4,
      id_14,
      id_13,
      id_8,
      id_7,
      id_9,
      id_2,
      id_11,
      id_7,
      id_1,
      id_13,
      id_7,
      id_7,
      id_5,
      id_0,
      id_8,
      id_7,
      id_4,
      id_6,
      id_9,
      id_1,
      id_11,
      id_1,
      id_12,
      id_5,
      id_3,
      id_14,
      id_1,
      id_11,
      id_0,
      id_3,
      id_7
  );
  assign modCall_1.id_4 = 0;
endmodule
