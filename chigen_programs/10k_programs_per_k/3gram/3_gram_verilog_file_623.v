// Seed: 620262849
module module_0 (
    output uwire id_0,
    input  wor   id_1
);
  integer id_3;
  module_2 modCall_1 (
      id_0,
      id_1
  );
  assign modCall_1.id_0 = 0;
endmodule
module module_1 (
    output supply1 id_0,
    input tri0 id_1,
    input wand id_2,
    input wor id_3,
    input tri0 id_4,
    input wand id_5,
    output uwire id_6,
    output uwire id_7
);
  assign id_6 = id_3;
  module_0 modCall_1 (
      id_7,
      id_5
  );
endmodule
module module_2 (
    output supply1 id_0,
    input wand id_1
);
  assign id_0 = 1 - id_1;
  wire id_3, id_4;
endmodule
