// Seed: 3602196447
module module_0 (
    output wor id_0,
    input uwire id_1,
    input wand id_2,
    input wor id_3,
    input tri0 id_4,
    output supply1 id_5,
    input tri0 id_6,
    output uwire id_7,
    input supply0 id_8,
    input uwire id_9,
    output wor id_10
);
  tri0 id_12 = (id_3);
  assign module_1.type_0 = 0;
  module_2 modCall_1 (id_10);
  assign modCall_1.type_2 = 0;
endmodule
module module_1 (
    input wand id_0,
    input supply0 id_1
);
  generate
    assign id_3 = id_1;
  endgenerate
  module_0 modCall_1 (
      id_3,
      id_1,
      id_1,
      id_0,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3
  );
endmodule
module module_2 (
    output wor id_0
);
  assign id_0 = -1;
endmodule
