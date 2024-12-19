// Seed: 3317769238
module module_0 (
    input supply0 id_0,
    output wire id_1,
    input tri0 id_2,
    output wand id_3,
    input supply1 id_4,
    input tri1 id_5,
    output wor id_6,
    input supply1 id_7,
    input tri1 id_8,
    input tri1 id_9,
    input tri0 id_10,
    input wor id_11,
    input supply0 id_12,
    input wire id_13
);
  wire id_15;
endmodule
module module_1 (
    output tri id_0,
    inout supply1 id_1,
    input tri id_2,
    input tri id_3,
    input tri0 id_4,
    input tri0 id_5,
    output tri0 id_6,
    input tri id_7,
    output uwire id_8,
    output wand id_9
);
  wire id_11;
  xnor primCall (id_0, id_4, id_2, id_11, id_1, id_5, id_7);
  module_0 modCall_1 (
      id_2,
      id_6,
      id_1,
      id_9,
      id_7,
      id_1,
      id_8,
      id_2,
      id_3,
      id_2,
      id_3,
      id_5,
      id_4,
      id_3
  );
  assign modCall_1.id_7 = 0;
endmodule
