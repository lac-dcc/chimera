// Seed: 1341310370
module module_0 (
    input supply1 id_0,
    output supply1 id_1,
    input wor id_2,
    input supply0 id_3,
    output supply0 id_4,
    input wor id_5,
    input uwire id_6,
    output uwire id_7,
    input wand id_8,
    input tri id_9,
    input supply0 id_10,
    output wand id_11
);
  wire id_13;
  assign module_1.id_1 = 0;
endmodule
module module_1 (
    output supply0 id_0,
    input supply1 id_1,
    output tri id_2,
    input wire id_3,
    input uwire id_4,
    output wand id_5,
    output wire id_6
);
  initial id_2 = id_4.id_1;
  module_0 modCall_1 (
      id_3,
      id_5,
      id_4,
      id_3,
      id_5,
      id_3,
      id_1,
      id_0,
      id_1,
      id_4,
      id_3,
      id_2
  );
endmodule
