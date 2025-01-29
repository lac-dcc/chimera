// Seed: 3532299418
module module_0 (
    input wor id_0,
    input supply1 id_1,
    input tri0 id_2,
    input tri0 id_3,
    input wand id_4,
    input uwire id_5,
    output uwire id_6,
    input wor id_7
);
  assign id_6 = id_1;
  assign module_1.type_2 = 0;
endmodule
module module_1 (
    input supply1 id_0,
    output wand id_1,
    input wire id_2,
    input uwire id_3,
    input tri0 id_4,
    input tri0 id_5,
    input supply1 id_6
);
  wor id_8;
  assign id_1 = id_8;
  module_0 modCall_1 (
      id_2,
      id_5,
      id_5,
      id_0,
      id_6,
      id_4,
      id_1,
      id_6
  );
endmodule
