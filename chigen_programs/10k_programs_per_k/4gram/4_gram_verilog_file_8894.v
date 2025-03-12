// Seed: 2718194146
module module_0 (
    output tri1 id_0,
    input wand id_1,
    input supply1 id_2,
    input uwire id_3,
    output wand id_4,
    output wor id_5,
    input tri0 id_6,
    input uwire id_7,
    input tri id_8,
    input tri1 id_9,
    input supply1 id_10,
    output wire id_11,
    input tri0 id_12,
    input supply0 id_13
);
  assign module_1.id_0 = 0;
endmodule
module module_1 (
    output uwire id_0,
    output supply0 id_1,
    output tri1 id_2,
    output supply0 id_3,
    output tri1 id_4,
    inout wor id_5,
    output uwire id_6,
    input tri0 id_7,
    input supply0 id_8
);
  assign id_3 = ~id_8;
  module_0 modCall_1 (
      id_3,
      id_8,
      id_5,
      id_8,
      id_5,
      id_3,
      id_5,
      id_8,
      id_7,
      id_7,
      id_8,
      id_0,
      id_5,
      id_7
  );
endmodule
