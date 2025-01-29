// Seed: 1192669588
module module_0 (
    input supply0 id_0,
    output uwire id_1,
    output uwire id_2,
    input wire id_3,
    output tri id_4,
    output uwire id_5,
    input wire id_6,
    input wor id_7,
    output wand id_8,
    output supply1 id_9,
    output tri0 id_10,
    input wire id_11,
    input tri id_12
);
  tri0 id_14 = -1;
  assign id_4 = 1;
endmodule
module module_1 (
    input uwire id_0,
    output tri id_1,
    output supply1 id_2,
    output tri0 id_3,
    output supply0 id_4
);
  module_0 modCall_1 (
      id_0,
      id_3,
      id_4,
      id_0,
      id_3,
      id_1,
      id_0,
      id_0,
      id_3,
      id_4,
      id_2,
      id_0,
      id_0
  );
  assign modCall_1.id_3 = 0;
endmodule
