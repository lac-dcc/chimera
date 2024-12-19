// Seed: 3191596124
module module_0 (
    input tri1 id_0,
    input tri1 id_1,
    input supply0 id_2,
    input supply1 id_3,
    input wor id_4,
    output wire id_5
);
  uwire id_7 = id_3, id_8;
  wor   id_9 = 1;
endmodule
module module_1 (
    output supply1 id_0,
    output supply1 id_1,
    input wire id_2,
    output supply1 id_3,
    output wire id_4,
    output wor id_5
);
  module_0 modCall_1 (
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_3
  );
  assign modCall_1.type_12 = 0;
endmodule
module module_2 #(
    parameter id_27 = 32'd39,
    parameter id_28 = 32'd37
) (
    output uwire id_0,
    input tri0 id_1
    , id_24,
    input tri0 id_2,
    input tri id_3,
    input uwire id_4,
    input tri0 id_5,
    output wire id_6,
    input supply1 id_7,
    output tri id_8,
    output wire id_9,
    input supply0 id_10,
    input uwire id_11,
    output wor id_12,
    output tri id_13,
    input tri id_14,
    output tri id_15
    , id_25,
    output wor id_16,
    input wand id_17,
    input tri0 id_18,
    output tri id_19,
    output uwire id_20,
    input uwire id_21,
    input tri id_22
);
  tri1 id_26 = 1 / 1;
  assign id_8 = id_26;
  module_0 modCall_1 (
      id_2,
      id_10,
      id_5,
      id_5,
      id_1,
      id_13
  );
  assign modCall_1.id_2 = 0;
  defparam id_27.id_28 = 1;
  assign id_6 = id_21 && id_5 && 1;
  xnor primCall (
      id_13, id_17, id_7, id_1, id_25, id_24, id_11, id_5, id_22, id_10, id_26, id_21, id_4
  );
endmodule
