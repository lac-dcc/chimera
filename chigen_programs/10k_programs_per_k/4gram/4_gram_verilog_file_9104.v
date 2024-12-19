// Seed: 2912403446
module module_0 (
    input uwire id_0,
    output uwire id_1,
    output wor id_2,
    input uwire id_3,
    input supply0 id_4,
    output tri id_5,
    output tri id_6,
    input supply1 id_7,
    output wor id_8,
    output uwire id_9
);
  assign module_1.id_6 = 0;
  assign id_8 = id_7;
endmodule
module module_1 (
    output supply1 id_0,
    input tri id_1,
    input wor id_2,
    input supply1 id_3,
    input wand id_4,
    input supply0 id_5,
    output supply1 id_6,
    input supply0 id_7,
    output tri1 id_8,
    output tri id_9,
    input wand id_10,
    input supply1 id_11,
    output wand id_12,
    output wire id_13
);
  assign id_8 = id_2 ? 1'b0 : 1;
  module_0 modCall_1 (
      id_3,
      id_12,
      id_6,
      id_7,
      id_5,
      id_9,
      id_6,
      id_5,
      id_9,
      id_6
  );
endmodule
