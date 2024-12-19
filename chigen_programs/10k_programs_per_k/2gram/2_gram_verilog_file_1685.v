// Seed: 1576770078
module module_0 (
    input uwire id_0,
    input tri0 id_1,
    input tri1 id_2,
    input wand id_3,
    input supply1 id_4,
    input tri1 id_5
);
endmodule
module module_1 (
    output wand id_0,
    input supply1 id_1,
    input supply1 id_2,
    input wor id_3,
    input tri id_4,
    output tri0 id_5,
    output tri id_6
);
  assign id_5 = 1;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_4,
      id_2,
      id_3,
      id_3
  );
  assign modCall_1.type_1 = 0;
endmodule
module module_2 (
    input tri0 id_0,
    output supply1 id_1,
    input wire id_2,
    input tri1 id_3,
    input tri id_4,
    input wire id_5,
    output wire id_6
);
  module_0 modCall_1 (
      id_3,
      id_5,
      id_5,
      id_2,
      id_5,
      id_0
  );
  assign modCall_1.type_2 = 0;
endmodule
