// Seed: 2131724765
module module_0 #(
    parameter id_16 = 32'd98,
    parameter id_17 = 32'd86
) (
    input uwire id_0,
    output tri1 id_1,
    output wand id_2,
    output supply0 id_3,
    input tri0 id_4,
    input tri id_5,
    input tri1 id_6,
    output tri1 id_7,
    output wire id_8,
    input supply1 id_9,
    input tri id_10,
    output supply0 id_11
);
  tri0 id_13, id_14;
  wire id_15;
  defparam id_16.id_17 = id_14;
endmodule
module module_0 (
    output wand id_0,
    input tri id_1,
    input supply0 id_2,
    input supply1 id_3,
    output tri id_4,
    input tri id_5,
    input tri0 id_6,
    output tri module_1
);
  wire id_9;
  or primCall (id_0, id_6, id_2, id_1, id_3);
  module_0 modCall_1 (
      id_2,
      id_0,
      id_4,
      id_0,
      id_6,
      id_6,
      id_5,
      id_0,
      id_0,
      id_3,
      id_3,
      id_0
  );
  assign modCall_1.type_21 = 0;
endmodule
