// Seed: 2421152729
module module_0 (
    input uwire id_0,
    input wire id_1,
    input supply1 id_2,
    input tri1 id_3,
    output supply1 id_4
);
  wire id_6;
  module_2 modCall_1 (
      id_2,
      id_4
  );
endmodule
module module_1 (
    input supply1 id_0,
    input supply1 id_1,
    input wand id_2,
    input tri1 id_3,
    input uwire id_4,
    input supply0 id_5,
    output wor id_6,
    input supply1 id_7
);
  assign id_6 = id_2;
  xor primCall (id_6, id_3, id_0, id_4, id_1, id_7, id_2, id_5);
  module_0 modCall_1 (
      id_2,
      id_5,
      id_5,
      id_0,
      id_6
  );
  assign modCall_1.id_4 = 0;
endmodule
module module_2 (
    input  wor  id_0,
    output wand id_1
);
endmodule
