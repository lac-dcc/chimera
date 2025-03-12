// Seed: 3100608501
module module_0 (
    input tri0 id_0,
    input wire id_1,
    input tri1 id_2,
    output supply0 id_3,
    input uwire id_4,
    output wand id_5,
    input tri id_6,
    output supply1 id_7,
    input tri0 id_8,
    input uwire id_9,
    input uwire id_10
);
  wire id_12;
endmodule
module module_1 (
    input supply0 id_0,
    output tri1 id_1,
    input tri1 id_2,
    input tri id_3,
    output wand id_4,
    output wand id_5
);
  assign id_5 = 1;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_2,
      id_1,
      id_0,
      id_1,
      id_3,
      id_4,
      id_2,
      id_3,
      id_3
  );
  assign modCall_1.id_2 = 0;
endmodule
