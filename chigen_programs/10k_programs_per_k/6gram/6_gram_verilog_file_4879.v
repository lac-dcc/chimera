// Seed: 1824233061
module module_0 (
    input wor id_0,
    input tri0 id_1,
    input wand id_2,
    output supply0 id_3,
    input supply1 id_4,
    output wor id_5
);
endmodule
module module_1 (
    input wand id_0,
    output tri1 id_1,
    output supply0 id_2,
    output tri id_3,
    input uwire id_4,
    input wire id_5,
    input supply0 id_6,
    output supply0 id_7,
    output supply1 id_8
);
  wire id_10;
  nor primCall (id_1, id_11, id_5, id_0, id_10, id_6, id_4);
  wire id_11;
  initial assume (1);
  module_0 modCall_1 (
      id_0,
      id_6,
      id_6,
      id_8,
      id_6,
      id_1
  );
  assign modCall_1.id_3 = 0;
endmodule
