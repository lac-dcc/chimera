// Seed: 2309622463
module module_0 (
    output supply1 id_0,
    output wand id_1,
    output tri id_2,
    input wand id_3
);
endmodule
module module_1 (
    input tri1 id_0,
    output tri id_1,
    output tri id_2,
    input supply1 id_3,
    input tri id_4,
    output uwire id_5,
    input uwire id_6
);
  wire id_8;
  module_0 modCall_1 (
      id_2,
      id_5,
      id_5,
      id_0
  );
  assign modCall_1.id_2 = 0;
endmodule
module module_2 (
    input  tri id_0,
    input  tri id_1,
    output wor id_2
);
  assign id_2 = id_0;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_2,
      id_0
  );
  assign modCall_1.id_3 = 0;
endmodule
