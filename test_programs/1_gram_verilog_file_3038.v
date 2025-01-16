// Seed: 1820697451
module module_0 #(
    parameter id_8 = 32'd83
) (
    input tri id_0,
    output wor id_1,
    output tri id_2,
    output wire id_3,
    output supply0 id_4,
    output tri id_5,
    output wor id_6
);
  defparam id_8 = -1;
  wire id_9;
endmodule
module module_1 (
    output supply0 id_0,
    input supply1 id_1,
    input wand id_2,
    output supply1 id_3,
    output wire id_4,
    input supply1 id_5,
    input tri1 id_6,
    input tri id_7,
    input tri0 id_8,
    input wor id_9,
    output tri1 id_10
);
  wire id_12;
  nand primCall (id_4, id_12, id_8, id_9, id_7, id_2, id_1, id_6);
  module_0 modCall_1 (
      id_5,
      id_4,
      id_4,
      id_0,
      id_0,
      id_4,
      id_4
  );
  assign modCall_1.id_4 = 0;
endmodule
