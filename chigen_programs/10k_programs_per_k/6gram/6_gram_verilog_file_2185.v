// Seed: 2902294739
module module_0 (
    output tri id_0,
    output wor id_1,
    input tri1 id_2,
    output supply1 id_3,
    input supply0 id_4,
    output supply1 module_0,
    input wand id_6,
    output supply1 id_7
);
  logic id_9 = id_4;
  assign module_1.id_1 = 0;
endmodule
module module_1 (
    output supply0 id_0,
    output wor id_1,
    output tri0 id_2,
    input tri0 id_3,
    input tri0 id_4,
    output wand id_5,
    input uwire id_6,
    input supply1 id_7,
    input tri id_8,
    output supply1 id_9
);
  wire id_11;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_7,
      id_9,
      id_7,
      id_1,
      id_8,
      id_0
  );
  assign id_11 = ~id_7;
  xor primCall (id_0, id_4, id_11, id_7, id_3);
endmodule
