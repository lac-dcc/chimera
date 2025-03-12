// Seed: 4196810963
module module_0 (
    output uwire id_0,
    input wor id_1,
    input uwire id_2,
    input tri0 id_3,
    input wor id_4,
    output wand id_5,
    input wand id_6,
    input supply0 id_7,
    input wor id_8,
    input supply1 id_9,
    input wor id_10,
    input wor id_11
);
  assign id_5 = -1'b0;
endmodule
module module_1 (
    output tri1 id_0,
    input wand id_1,
    output uwire id_2,
    input tri0 id_3,
    input uwire id_4,
    input tri id_5,
    input supply0 id_6,
    input tri0 id_7,
    input wire id_8
);
  assign id_0 = id_1 | 1;
  module_0 modCall_1 (
      id_0,
      id_1,
      id_1,
      id_8,
      id_5,
      id_0,
      id_6,
      id_1,
      id_3,
      id_4,
      id_8,
      id_5
  );
  assign modCall_1.id_5 = 0;
endmodule
