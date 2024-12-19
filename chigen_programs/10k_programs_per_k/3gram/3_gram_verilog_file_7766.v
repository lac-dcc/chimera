// Seed: 3147615054
module module_0 (
    input wand id_0,
    input supply0 id_1,
    input supply1 id_2
);
  assign module_1.type_12 = 0;
  assign id_4 = id_4;
endmodule
module module_1 (
    input tri0 id_0,
    input supply1 id_1,
    output tri0 id_2,
    input supply1 id_3,
    input tri id_4,
    output supply0 id_5,
    input uwire id_6,
    input tri0 id_7
);
  nor primCall (id_5, id_4, id_6, id_3, id_0, id_1, id_7);
  module_0 modCall_1 (
      id_7,
      id_0,
      id_4
  );
endmodule
module module_2 (
    input tri0 id_0,
    input tri id_1,
    output uwire id_2,
    input tri0 id_3,
    input tri0 id_4,
    input tri id_5,
    output tri0 id_6,
    input tri id_7,
    input tri id_8,
    input supply1 id_9,
    input tri id_10
);
  wand id_12 = id_5 == 1;
  module_0 modCall_1 (
      id_10,
      id_4,
      id_8
  );
  assign modCall_1.id_2 = 0;
endmodule
