// Seed: 2144707091
module module_0 (
    input uwire id_0,
    input wand id_1,
    input tri0 id_2,
    output wand id_3,
    input supply0 id_4,
    output wire id_5,
    input tri1 id_6,
    input wand module_0
);
  wire id_9;
  assign id_3 = -1;
endmodule
module module_1 (
    output supply1 id_0,
    output wor id_1,
    input uwire id_2,
    input wor id_3,
    output wor id_4,
    output wire id_5,
    input tri id_6
);
  assign id_0 = id_2;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_6,
      id_0,
      id_3,
      id_0,
      id_6,
      id_3
  );
  assign modCall_1.id_6 = 0;
endmodule
