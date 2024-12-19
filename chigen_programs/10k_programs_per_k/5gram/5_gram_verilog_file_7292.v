// Seed: 2191620602
module module_0 (
    input wand id_0,
    input wor id_1,
    input supply0 id_2,
    input supply1 id_3,
    input tri1 id_4,
    input uwire id_5,
    output wand id_6,
    input tri1 id_7,
    input wand id_8,
    input wor id_9,
    input tri id_10,
    input uwire id_11,
    input supply0 id_12
);
  assign id_6 = id_4;
endmodule
module module_1 (
    input tri1 id_0,
    input tri id_1,
    input wor id_2,
    output tri id_3,
    output supply1 id_4,
    input supply0 id_5,
    output supply1 id_6
);
  assign id_4 = 1'd0;
  module_0 modCall_1 (
      id_0,
      id_5,
      id_5,
      id_2,
      id_5,
      id_0,
      id_6,
      id_1,
      id_2,
      id_5,
      id_0,
      id_2,
      id_2
  );
  assign modCall_1.type_7 = 0;
  wire id_8;
  if (id_0 == 1) wand id_9 = id_1;
  assign id_9 = id_5;
endmodule
