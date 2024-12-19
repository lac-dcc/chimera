// Seed: 272098608
module module_0 (
    input wand id_0,
    output wand id_1,
    input tri id_2,
    input uwire id_3,
    input tri0 id_4,
    input supply1 id_5,
    output wand id_6,
    input wand id_7
);
endmodule
module module_1 (
    input tri id_0,
    input supply1 id_1,
    output tri0 id_2,
    input uwire id_3,
    input tri0 id_4,
    input supply0 id_5,
    input wand id_6,
    input wire id_7
);
  assign id_2 = 1'h0;
  module_0 modCall_1 (
      id_7,
      id_2,
      id_5,
      id_0,
      id_6,
      id_4,
      id_2,
      id_6
  );
  assign modCall_1.type_1 = 0;
endmodule
