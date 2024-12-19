// Seed: 3940599273
module module_0 (
    input tri1 id_0,
    input wor  id_1,
    input wor  id_2,
    input tri1 id_3
);
  supply1 id_5 = 1'b0;
  assign module_1.type_4 = 0;
endmodule
module module_0 (
    output tri0 id_0,
    input wor module_1,
    input tri0 id_2,
    input wand id_3,
    input supply0 id_4,
    input wor id_5,
    output tri1 id_6,
    input uwire id_7,
    input uwire id_8,
    output tri id_9
);
  assign id_9 = 1;
  module_0 modCall_1 (
      id_4,
      id_2,
      id_2,
      id_4
  );
endmodule
module module_2 (
    output tri1 id_0,
    output uwire id_1,
    output wand id_2,
    input wor id_3,
    input tri0 id_4,
    output supply1 id_5
);
  assign id_2 = 1'b0 ? 1 : 1;
  module_0 modCall_1 (
      id_3,
      id_4,
      id_3,
      id_3
  );
  assign modCall_1.type_1 = 0;
  tri id_7 = id_3;
endmodule
