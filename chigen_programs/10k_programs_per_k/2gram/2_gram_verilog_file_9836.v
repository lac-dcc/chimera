// Seed: 2707014209
module module_0 (
    input supply0 id_0,
    input tri id_1,
    input supply1 id_2,
    input supply0 id_3,
    input wor id_4,
    input wand id_5,
    input uwire id_6,
    output supply1 id_7,
    input tri id_8,
    output supply1 id_9,
    input uwire id_10,
    input wand id_11,
    output tri0 id_12,
    output tri0 id_13,
    output supply0 id_14
);
  assign id_12 = id_3;
  assign id_13 = 1'b0;
  assign module_1.type_4 = 0;
endmodule
module module_1 (
    output tri id_0,
    input tri id_1,
    input uwire id_2,
    input tri0 id_3,
    output tri1 id_4,
    output tri0 id_5,
    input tri0 id_6,
    input supply1 id_7
);
  module_0 modCall_1 (
      id_2,
      id_6,
      id_6,
      id_1,
      id_6,
      id_6,
      id_1,
      id_5,
      id_3,
      id_0,
      id_3,
      id_7,
      id_5,
      id_0,
      id_4
  );
endmodule
