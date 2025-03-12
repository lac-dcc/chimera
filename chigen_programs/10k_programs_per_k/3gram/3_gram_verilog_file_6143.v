// Seed: 2523095602
module module_0 (
    output wor id_0,
    output supply1 id_1,
    input supply0 id_2,
    input tri0 id_3,
    input wand id_4,
    input wire id_5,
    input tri id_6,
    output wire id_7
    , id_23,
    input supply0 id_8,
    input uwire id_9,
    input tri id_10,
    output wand id_11,
    output wire id_12,
    output uwire id_13,
    output tri1 id_14,
    output tri id_15,
    input wand id_16,
    input wire id_17,
    input supply1 id_18,
    input supply1 id_19,
    output supply1 id_20,
    output wire id_21
);
  reg
      id_24,
      id_25,
      id_26,
      id_27,
      id_28,
      id_29,
      id_30,
      id_31,
      id_32,
      id_33,
      id_34,
      id_35,
      id_36,
      id_37,
      id_38,
      id_39,
      id_40,
      id_41,
      id_42;
  id_43 :
  assert property (@(posedge -1) 1'b0 == id_23)
  else id_24 <= id_9;
endmodule
module module_1 (
    input tri id_0,
    input tri0 id_1,
    input wire id_2,
    input supply1 id_3,
    output uwire id_4,
    input wand id_5,
    output supply0 id_6,
    input wand id_7,
    output wor id_8
);
  assign id_6 = {id_5, -1};
  module_0 modCall_1 (
      id_4,
      id_8,
      id_1,
      id_0,
      id_5,
      id_3,
      id_5,
      id_6,
      id_3,
      id_2,
      id_1,
      id_8,
      id_8,
      id_6,
      id_8,
      id_6,
      id_2,
      id_0,
      id_1,
      id_5,
      id_4,
      id_4
  );
  assign modCall_1.id_1 = 0;
endmodule
