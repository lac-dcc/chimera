// Seed: 2771426978
module module_0 (
    input wand id_0,
    input wor id_1,
    input supply1 id_2
);
  wire id_4;
  assign module_2.type_7 = 0;
endmodule
module module_0 (
    output wor id_0
    , id_13,
    output tri1 id_1,
    input supply0 id_2,
    output tri1 id_3,
    input tri0 id_4,
    output wor module_1,
    input uwire id_6,
    input supply0 id_7,
    input supply0 id_8,
    input wor id_9,
    input tri1 id_10,
    input wor id_11
);
  wire id_14;
  nand primCall (id_1, id_6, id_4, id_2, id_9, id_14, id_13, id_11, id_10, id_7);
  module_0 modCall_1 (
      id_11,
      id_4,
      id_8
  );
  assign modCall_1.type_5 = 0;
endmodule
module module_2 #(
    parameter id_15 = 32'd84,
    parameter id_16 = 32'd53
) (
    input wor id_0
    , id_12,
    output uwire id_1,
    input uwire id_2,
    output supply1 id_3,
    output tri1 id_4,
    output tri id_5,
    output supply1 id_6,
    input tri id_7,
    input uwire id_8,
    output supply0 id_9,
    input tri id_10
);
  wire id_13;
  module_0 modCall_1 (
      id_0,
      id_7,
      id_8
  );
  wire id_14;
  defparam id_15.id_16 = !id_8;
endmodule
