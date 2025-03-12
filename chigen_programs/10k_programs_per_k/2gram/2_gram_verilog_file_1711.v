// Seed: 1369302058
module module_0 (
    input tri0 id_0,
    input supply0 id_1,
    input wor id_2,
    input tri1 id_3,
    input tri0 id_4,
    input wor id_5,
    input uwire id_6
);
  wire id_8;
  assign id_8 = id_1;
  module_2 modCall_1 (id_8);
  wire id_9;
endmodule
module module_1 (
    input wand id_0,
    input wor id_1,
    input supply1 id_2,
    output tri0 id_3
);
  assign id_3 = id_2;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_0,
      id_2,
      id_2,
      id_1,
      id_2
  );
  assign modCall_1.id_1 = 0;
endmodule
module module_2 (
    id_1
);
  inout wire id_1;
  wire id_2;
  ;
  assign module_0.id_0 = 0;
  wire id_3;
endmodule
