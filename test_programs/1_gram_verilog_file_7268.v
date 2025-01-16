// Seed: 2788279400
module module_0 (
    output tri0  id_0,
    input  uwire id_1,
    output tri1  id_2,
    input  tri1  id_3,
    input  tri   id_4
);
  tri0 id_6 = id_3, id_7;
  assign id_2 = id_4;
endmodule
macromodule module_1 (
    input supply0 id_0,
    output uwire id_1,
    input wand id_2,
    output uwire id_3,
    output wire id_4,
    output tri id_5,
    output uwire id_6,
    input wire id_7,
    output supply1 id_8,
    input tri0 id_9,
    output wire id_10,
    input tri id_11
);
  wire id_13;
  assign id_5 = 1;
  wire id_14;
  module_0 modCall_1 (
      id_8,
      id_9,
      id_6,
      id_9,
      id_9
  );
  assign modCall_1.id_3 = 0;
endmodule
