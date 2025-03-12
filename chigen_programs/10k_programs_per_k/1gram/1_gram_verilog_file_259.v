// Seed: 1853945806
module module_0 (
    input uwire id_0,
    output supply1 id_1,
    input tri id_2,
    input wand id_3,
    output uwire id_4,
    output tri1 id_5,
    output supply1 id_6,
    input wand id_7,
    output tri1 id_8,
    output wor id_9,
    input tri0 id_10,
    input supply1 id_11,
    input wor id_12,
    output wor id_13,
    output supply1 id_14,
    input wire id_15,
    input tri1 id_16,
    input uwire id_17,
    input wor id_18,
    input wor id_19,
    output supply0 id_20,
    output wand id_21,
    input wor id_22,
    input tri id_23,
    input uwire id_24,
    input supply0 id_25
);
  parameter id_27 = 1;
  assign module_1.id_9 = 0;
endmodule
module module_1 #(
    parameter id_8 = 32'd95
) (
    input tri id_0,
    input uwire id_1,
    output tri0 id_2,
    output supply0 id_3,
    output wor id_4
    , id_11,
    output wor id_5,
    input supply1 id_6,
    output wire id_7[-1 : 1  !=  id_8],
    input tri0 _id_8,
    output wire id_9
);
  assign id_9 = id_6;
  module_0 modCall_1 (
      id_6,
      id_5,
      id_1,
      id_1,
      id_4,
      id_5,
      id_2,
      id_1,
      id_7,
      id_9,
      id_1,
      id_0,
      id_0,
      id_2,
      id_9,
      id_6,
      id_0,
      id_0,
      id_6,
      id_6,
      id_3,
      id_5,
      id_1,
      id_0,
      id_0,
      id_0
  );
endmodule
