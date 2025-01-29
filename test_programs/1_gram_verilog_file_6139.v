// Seed: 2595299576
module module_0 (
    output tri1 id_0,
    input wor id_1,
    output tri id_2,
    input tri id_3,
    output wand id_4,
    input supply1 id_5
);
  wire id_7;
endmodule
module module_1 (
    input uwire id_0,
    input wand id_1,
    input uwire id_2,
    input wire id_3,
    input wand id_4,
    output tri id_5,
    input uwire id_6,
    inout supply1 id_7
);
  wire id_9;
  module_0 modCall_1 (
      id_7,
      id_1,
      id_5,
      id_0,
      id_5,
      id_3
  );
  assign modCall_1.type_0 = 0;
  assign id_5 = id_6 | id_0 - id_3;
endmodule
