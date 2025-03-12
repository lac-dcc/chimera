// Seed: 1002008939
module module_0 (
    input wire id_0,
    input tri0 id_1,
    input tri id_2,
    output tri1 id_3,
    input uwire id_4,
    input supply1 id_5,
    input supply0 id_6,
    input supply1 id_7,
    input uwire id_8,
    input wor id_9,
    input tri0 id_10,
    output tri id_11,
    input tri0 id_12,
    output wand id_13,
    input uwire id_14
    , id_38,
    output wand id_15,
    input supply0 id_16,
    input wire id_17,
    input wor id_18,
    output supply0 id_19,
    input wire id_20,
    input supply0 id_21,
    input wand id_22,
    input supply0 id_23,
    input tri id_24,
    input tri id_25
    , id_39,
    output wor id_26,
    input wand id_27,
    input supply1 id_28,
    input tri1 id_29
    , id_40,
    input supply1 id_30,
    output tri id_31,
    input uwire id_32,
    input wor id_33,
    input wire id_34,
    input wand id_35,
    output wand id_36
);
  assign id_11 = -1'b0;
  assign module_1.id_4 = 0;
endmodule
module module_1 #(
    parameter id_6 = 32'd14,
    parameter id_9 = 32'd12
) (
    input tri id_0,
    output supply1 id_1,
    output tri1 id_2,
    output wor id_3,
    input wor id_4,
    output wire id_5,
    input wand _id_6,
    input supply0 id_7,
    input wire id_8,
    input tri _id_9
);
  parameter [id_6 : id_9] id_11 = 1;
  module_0 modCall_1 (
      id_0,
      id_8,
      id_0,
      id_2,
      id_4,
      id_4,
      id_4,
      id_0,
      id_0,
      id_0,
      id_8,
      id_3,
      id_4,
      id_1,
      id_7,
      id_1,
      id_7,
      id_8,
      id_8,
      id_5,
      id_7,
      id_7,
      id_7,
      id_4,
      id_0,
      id_0,
      id_2,
      id_8,
      id_8,
      id_0,
      id_8,
      id_2,
      id_0,
      id_0,
      id_8,
      id_4,
      id_2
  );
  wor   id_12;
  logic id_13 = id_8 - id_11;
  assign id_12 = -1 ? id_13 : 1 & -1;
endmodule
