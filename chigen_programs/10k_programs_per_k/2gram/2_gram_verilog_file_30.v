// Seed: 1158187516
module module_0 (
    output supply0 id_0,
    input tri0 id_1,
    input tri0 id_2,
    input uwire id_3,
    output wire id_4,
    input wor id_5,
    input supply1 id_6,
    input wor id_7,
    input wire id_8,
    output wand id_9,
    output wire id_10
);
  assign id_4 = id_5;
  wire id_12;
  wire id_13;
endmodule
macromodule module_1 (
    input tri id_0,
    output tri id_1,
    output supply0 id_2,
    output tri0 id_3,
    output uwire id_4
);
  module_0 modCall_1 (
      id_3,
      id_0,
      id_0,
      id_0,
      id_3,
      id_0,
      id_0,
      id_0,
      id_0,
      id_4,
      id_2
  );
  assign modCall_1.type_16 = 0;
endmodule
