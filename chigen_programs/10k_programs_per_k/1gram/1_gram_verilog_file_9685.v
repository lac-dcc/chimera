// Seed: 1571626711
module module_0 (
    output wire id_0,
    output uwire id_1,
    input tri0 id_2,
    input tri0 id_3,
    input wand id_4,
    input tri0 id_5,
    output uwire id_6,
    input supply1 id_7,
    output wand id_8,
    input uwire id_9
);
  assign id_6 = 1;
  wire id_11;
  assign module_1.id_1 = 0;
endmodule
module module_1 (
    output tri0 id_0,
    output supply1 id_1,
    input wor id_2,
    output wor id_3
);
  module_0 modCall_1 (
      id_3,
      id_0,
      id_2,
      id_2,
      id_2,
      id_2,
      id_1,
      id_2,
      id_3,
      id_2
  );
  assign id_0 = id_2;
  always id_1 = id_2;
endmodule
