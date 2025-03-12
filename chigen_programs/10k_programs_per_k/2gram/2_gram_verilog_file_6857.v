// Seed: 3869948302
module module_0 (
    output uwire id_0,
    output tri id_1,
    output wor id_2,
    input tri0 id_3,
    output wor id_4,
    output tri1 id_5,
    input supply1 id_6,
    input uwire id_7
);
  assign id_4 = id_3;
  assign module_1.id_2 = 0;
endmodule
module module_1 (
    input tri id_0,
    input wand id_1,
    input wand id_2,
    inout tri id_3,
    output uwire id_4,
    output tri id_5,
    input tri0 id_6,
    input tri0 id_7,
    input supply1 id_8,
    input supply0 id_9
);
  wire id_11;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_5,
      id_9,
      id_4,
      id_3,
      id_8,
      id_8
  );
  wire id_12;
  xor primCall (id_4, id_11, id_7, id_3, id_1);
endmodule
