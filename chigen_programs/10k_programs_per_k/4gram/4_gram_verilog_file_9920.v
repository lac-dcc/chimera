// Seed: 810680582
module module_0 (
    output wire id_0,
    output wire id_1,
    input tri0 id_2,
    output supply0 id_3,
    input wand id_4,
    input tri1 id_5,
    input tri0 id_6,
    output uwire id_7,
    input wor id_8,
    input tri1 id_9,
    input wire id_10,
    output supply0 id_11,
    output wand id_12,
    input tri1 id_13,
    output tri id_14
);
  assign id_14 = -1'b0 ? 1 : id_5;
endmodule
module module_1 (
    output wire id_0,
    output wire id_1,
    input supply1 id_2,
    output tri1 id_3,
    input wire id_4
);
  assign id_3 = id_4;
  bufif0 primCall (id_3, id_2, id_4);
  module_0 modCall_1 (
      id_3,
      id_3,
      id_4,
      id_3,
      id_4,
      id_2,
      id_2,
      id_0,
      id_4,
      id_4,
      id_2,
      id_1,
      id_3,
      id_2,
      id_3
  );
  assign modCall_1.id_5 = 0;
endmodule
