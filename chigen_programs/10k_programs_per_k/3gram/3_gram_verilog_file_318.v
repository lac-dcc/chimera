// Seed: 1131712153
module module_0 (
    input tri1 id_0,
    output tri id_1,
    output wand id_2,
    input supply1 id_3,
    input tri1 id_4,
    input wire id_5
);
  wire id_7;
  assign module_2.type_0 = 0;
endmodule
module module_1 (
    output tri id_0,
    output wand id_1,
    input supply0 id_2,
    output wand id_3,
    input tri1 id_4
);
  module_0 modCall_1 (
      id_4,
      id_3,
      id_3,
      id_4,
      id_4,
      id_2
  );
  assign modCall_1.type_8 = 0;
  assign id_1 = 1;
endmodule
module module_2 (
    output tri  id_0,
    input  tri1 id_1,
    output tri1 id_2,
    output wand id_3
);
  id_5(
      id_2, id_3, id_3, 1
  );
  module_0 modCall_1 (
      id_1,
      id_3,
      id_2,
      id_1,
      id_1,
      id_1
  );
endmodule
