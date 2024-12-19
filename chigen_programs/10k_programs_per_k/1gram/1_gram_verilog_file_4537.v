// Seed: 298984816
module module_0 (
    output supply1 id_0,
    input wand id_1,
    input wire id_2,
    output wand id_3,
    input tri id_4,
    input tri1 id_5
    , id_11,
    output wor id_6,
    output tri id_7,
    input wand id_8,
    input tri id_9
);
  assign module_1.id_7 = 0;
endmodule
module module_1 (
    output supply0 id_0,
    output tri id_1,
    input tri id_2,
    input wor id_3,
    input tri0 id_4,
    input supply1 id_5,
    output supply0 id_6,
    input wire id_7,
    output tri0 id_8
);
  assign id_0 = id_3;
  xor primCall (id_0, id_4, id_7, id_5, id_3);
  assign id_0 = id_4;
  module_0 modCall_1 (
      id_0,
      id_3,
      id_4,
      id_8,
      id_5,
      id_3,
      id_6,
      id_1,
      id_3,
      id_2
  );
endmodule
