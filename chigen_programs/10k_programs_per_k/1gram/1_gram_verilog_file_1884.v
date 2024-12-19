// Seed: 454467053
module module_0 (
    input wand id_0,
    output wand id_1,
    input tri id_2,
    input tri0 id_3,
    input supply1 id_4,
    input uwire id_5
    , id_11 = 1,
    input wand id_6,
    output wand id_7,
    input tri0 id_8,
    input wire id_9
);
  wire id_12;
endmodule
module module_1 (
    output supply1 id_0,
    input tri id_1,
    input uwire id_2
);
  assign id_0 = id_1;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_1,
      id_1,
      id_2,
      id_1,
      id_2,
      id_0,
      id_2,
      id_2
  );
  assign modCall_1.id_0 = 0;
  assign id_0 = id_1 >= id_2;
  time id_4;
endmodule
