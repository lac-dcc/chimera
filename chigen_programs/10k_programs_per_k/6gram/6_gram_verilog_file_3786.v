// Seed: 2102492342
module module_0 (
    input uwire id_0,
    output tri1 id_1,
    input supply1 id_2,
    input supply1 id_3,
    input tri1 id_4,
    output tri1 id_5
);
  tri id_7 = 1'b0;
endmodule
module module_1 (
    input wire id_0,
    input uwire id_1,
    input wand id_2,
    input wor id_3,
    output tri1 id_4,
    input supply0 id_5,
    input tri1 id_6,
    output tri id_7,
    output wand id_8
);
  uwire id_10;
  module_0 modCall_1 (
      id_10,
      id_10,
      id_1,
      id_1,
      id_5,
      id_7
  );
  assign modCall_1.type_11 = 0;
  assign id_7 = id_10;
  wire id_11;
  wand id_12 = id_2;
endmodule
