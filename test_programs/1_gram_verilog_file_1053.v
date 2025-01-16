// Seed: 1125427740
module module_0 (
    output wor id_0,
    input tri id_1,
    output uwire id_2,
    input wand id_3,
    output wand id_4,
    input tri0 id_5,
    input uwire id_6,
    output wire id_7,
    output supply0 id_8,
    input wire id_9,
    output tri id_10,
    output tri id_11
);
  parameter id_13 = 1, id_14 = 1;
endmodule
module module_1 (
    output wor id_0,
    output wand id_1,
    input supply1 id_2,
    input supply0 id_3,
    input uwire id_4,
    output supply0 id_5
);
  module_0 modCall_1 (
      id_1,
      id_4,
      id_0,
      id_3,
      id_0,
      id_3,
      id_4,
      id_5,
      id_1,
      id_3,
      id_5,
      id_1
  );
  assign modCall_1.type_7 = 0;
endmodule
