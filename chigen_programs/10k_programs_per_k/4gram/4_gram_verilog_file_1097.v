// Seed: 3675663363
module module_0 (
    output supply0 id_0,
    input wor id_1,
    input tri0 id_2,
    output tri0 id_3,
    output tri0 id_4,
    input wand id_5,
    output uwire id_6,
    input supply1 id_7,
    input tri id_8,
    input supply1 id_9,
    input tri0 id_10
);
  assign module_1.id_3 = 0;
  assign id_3 = id_8;
endmodule
module module_1 (
    input supply0 id_0,
    input tri1 id_1,
    input tri0 id_2,
    output tri0 id_3,
    input tri1 id_4
);
  assign id_3 = id_4;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_4,
      id_3,
      id_3,
      id_1,
      id_3,
      id_4,
      id_1,
      id_4,
      id_2
  );
endmodule
