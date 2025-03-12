// Seed: 2154357332
module module_0 (
    input tri0 id_0,
    input wand id_1,
    output wand id_2,
    input wire id_3,
    output supply0 id_4
);
endmodule
module module_1 (
    input wand id_0,
    input uwire id_1,
    input wor id_2,
    input wire id_3,
    output wire id_4,
    output wand id_5,
    input supply0 id_6,
    input supply1 id_7,
    input supply1 id_8,
    input uwire id_9
);
  module_0 modCall_1 (
      id_2,
      id_6,
      id_5,
      id_9,
      id_5
  );
  assign modCall_1.id_3 = 0;
endmodule
macromodule module_2 #(
    parameter id_0 = 32'd37
) (
    input  wand _id_0,
    input  wire id_1,
    output tri0 id_2
);
  integer id_4;
  logic [id_0 : -1] id_5;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_2,
      id_1,
      id_2
  );
  assign modCall_1.id_4 = 0;
endmodule
