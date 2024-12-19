// Seed: 1700364741
module module_0 (
    output tri id_0,
    input tri id_1,
    output supply0 id_2
);
endmodule
module module_1 (
    output uwire id_0,
    input tri id_1,
    output uwire id_2,
    output wor id_3,
    output wor id_4,
    output wand id_5,
    input uwire id_6,
    input wire id_7,
    output wor id_8,
    input supply0 id_9,
    output supply1 id_10,
    output wand id_11,
    input supply1 id_12
);
  supply0 id_14 = id_1, id_15;
  module_0 modCall_1 (
      id_8,
      id_6,
      id_4
  );
  assign modCall_1.id_2 = 0;
  assign id_5 = id_1;
  assign id_4 = id_14 + id_6 - 1 | 1;
  wire id_16;
endmodule
