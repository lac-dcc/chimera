// Seed: 3970368556
module module_0 (
    output uwire id_0,
    input tri0 id_1,
    output supply0 id_2,
    output uwire id_3,
    input supply1 id_4,
    output supply1 id_5,
    input supply1 id_6,
    input supply1 id_7,
    input tri0 id_8,
    output supply1 id_9,
    output tri id_10,
    input supply0 id_11,
    output uwire id_12,
    output tri0 id_13,
    input wand id_14
);
  assign id_5 = 1;
endmodule
module module_1 (
    output tri0 id_0,
    output supply0 id_1,
    input tri id_2,
    output tri0 id_3,
    output tri1 id_4,
    output supply0 id_5,
    input supply1 id_6
);
  assign id_0 = id_2 == -1'b0;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_5,
      id_0,
      id_6,
      id_0,
      id_6,
      id_2,
      id_2,
      id_5,
      id_3,
      id_2,
      id_4,
      id_0,
      id_2
  );
  assign modCall_1.id_10 = 0;
endmodule
