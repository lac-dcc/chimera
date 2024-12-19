// Seed: 4240654254
module module_0 (
    input tri0 id_0,
    output wire id_1,
    output supply0 id_2,
    output tri id_3,
    output wand id_4,
    input tri0 id_5,
    input uwire id_6,
    input tri0 id_7,
    input uwire id_8,
    output wand id_9,
    output supply0 id_10,
    input tri1 id_11
);
  assign id_1 = 1 ? id_8 : id_5;
endmodule
module module_1 (
    output tri   id_0,
    input  uwire id_1,
    output uwire id_2,
    input  wand  id_3
);
  wire id_5;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_2,
      id_0,
      id_0,
      id_1,
      id_3,
      id_1,
      id_3,
      id_2,
      id_2,
      id_1
  );
  assign modCall_1.type_6 = 0;
endmodule
