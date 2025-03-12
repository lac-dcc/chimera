// Seed: 197879788
module module_0 (
    input tri0 id_0,
    input wor id_1,
    input wand id_2,
    input supply0 id_3,
    input tri id_4,
    input tri1 id_5,
    output uwire id_6,
    input wire id_7,
    input wire id_8
);
  wire [1 : -1] id_10;
  assign module_1.id_2 = 0;
endmodule
module module_1 (
    input wor id_0,
    input tri1 id_1,
    input tri id_2,
    output supply1 id_3,
    input supply0 id_4,
    input supply1 id_5,
    input wand id_6,
    input supply1 id_7,
    output tri id_8,
    output wand id_9
);
  wire id_11;
  and primCall (id_3, id_0, id_11, id_4, id_5, id_1, id_6, id_7, id_2);
  module_0 modCall_1 (
      id_2,
      id_7,
      id_1,
      id_7,
      id_7,
      id_1,
      id_8,
      id_6,
      id_0
  );
endmodule
