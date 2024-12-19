// Seed: 273412496
module module_0 (
    input tri1 id_0,
    input supply1 id_1,
    output tri id_2,
    input wand id_3,
    input tri id_4,
    input tri0 id_5,
    input uwire id_6,
    output wor id_7,
    input wire id_8,
    output supply1 id_9
);
  specify
    (id_11 *> id_12) = 1;
    (id_13 => id_14) = 1;
  endspecify
endmodule
module module_1 (
    output uwire id_0,
    input  uwire id_1,
    output wire  id_2,
    input  tri   id_3,
    output wire  id_4
);
  assign id_2 = 1 && 1 == 1;
  nor primCall (id_4, id_1, id_3);
  module_0 modCall_1 (
      id_3,
      id_3,
      id_4,
      id_3,
      id_3,
      id_1,
      id_3,
      id_4,
      id_3,
      id_4
  );
  assign modCall_1.type_16 = 0;
endmodule
