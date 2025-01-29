// Seed: 2038208143
module module_0 (
    input uwire id_0,
    input wire id_1,
    output uwire id_2,
    input uwire id_3,
    output supply0 id_4,
    output wand id_5,
    output tri id_6
);
  wand id_8, id_9, id_10 = 1;
  uwire id_11 = 1, id_12;
endmodule
module module_1 (
    output tri id_0,
    input uwire id_1,
    output wor id_2,
    input wand id_3,
    input supply0 id_4,
    input wor id_5,
    input wand id_6,
    input supply1 id_7,
    output supply0 id_8,
    output supply0 id_9,
    input supply1 id_10
);
  assign id_0 = -1;
  assign id_9 = id_7 - id_3;
  module_0 modCall_1 (
      id_3,
      id_7,
      id_0,
      id_7,
      id_9,
      id_2,
      id_8
  );
  assign modCall_1.type_13 = 0;
endmodule
