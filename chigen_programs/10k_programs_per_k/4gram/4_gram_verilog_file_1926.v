// Seed: 1539405333
module module_0 (
    input supply0 id_0,
    input tri1 id_1,
    input uwire id_2,
    input uwire id_3,
    input tri0 id_4,
    input supply1 id_5
);
  wire id_7;
  assign module_1.type_0 = 0;
endmodule
module module_1 (
    input supply0 id_0,
    output tri1 id_1,
    input uwire id_2
);
  module_0 modCall_1 (
      id_2,
      id_2,
      id_0,
      id_0,
      id_2,
      id_0
  );
  wire id_4;
endmodule
module module_2 (
    input wor id_0,
    input wor id_1,
    input supply1 id_2,
    output wand id_3,
    input supply1 id_4,
    output tri id_5,
    output wire id_6
);
  assign id_6 = id_1 < 1;
  module_0 modCall_1 (
      id_0,
      id_1,
      id_4,
      id_2,
      id_2,
      id_0
  );
  assign modCall_1.type_10 = 0;
endmodule
