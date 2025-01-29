// Seed: 441918902
module module_0 (
    input tri0 id_0,
    input tri0 id_1,
    input wand id_2,
    input wand id_3
);
  assign id_5 = -1;
  parameter id_6 = -1;
endmodule
macromodule module_1 (
    output tri1 id_0,
    input supply0 id_1,
    input tri0 id_2,
    input wor id_3,
    output tri0 id_4,
    output supply1 id_5,
    input tri id_6,
    input tri0 id_7,
    input wand id_8
);
  assign id_0 = -1'b0;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_1,
      id_8
  );
  assign modCall_1.id_0 = 0;
endmodule
module module_2 (
    output tri  id_0,
    input  tri0 id_1,
    input  wor  id_2,
    id_6,
    input  tri1 id_3,
    output tri1 id_4
);
  wire id_7;
  xor primCall (id_0, id_3, id_1, id_6, id_7);
  module_0 modCall_1 (
      id_3,
      id_1,
      id_3,
      id_2
  );
  assign modCall_1.id_2 = 0;
endmodule
