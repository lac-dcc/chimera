// Seed: 2169634653
module module_0 (
    input tri id_0,
    input uwire id_1,
    input tri0 id_2,
    input supply1 id_3,
    input tri id_4,
    input supply1 id_5,
    input supply0 id_6,
    input wor id_7,
    output wor id_8,
    input wand id_9,
    output tri0 id_10,
    input wand id_11
);
  wire id_13;
  assign module_1.id_6 = 0;
endmodule
module module_1 (
    input wand id_0,
    output supply0 id_1,
    input tri0 id_2,
    output wire id_3,
    output tri1 id_4,
    input wor id_5,
    output wor id_6,
    input wire id_7
);
  assign id_1 = 1;
  buf primCall (id_6, id_2);
  module_0 modCall_1 (
      id_2,
      id_5,
      id_5,
      id_0,
      id_0,
      id_5,
      id_5,
      id_5,
      id_3,
      id_0,
      id_3,
      id_7
  );
endmodule
