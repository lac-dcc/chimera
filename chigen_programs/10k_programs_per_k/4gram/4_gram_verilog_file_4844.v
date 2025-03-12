// Seed: 943745425
module module_0 (
    input uwire id_0,
    input supply1 id_1,
    output tri1 id_2,
    input wand id_3,
    input tri0 id_4,
    output uwire id_5,
    input wire id_6,
    input tri0 id_7,
    input wor id_8,
    input wand id_9,
    input tri id_10,
    input tri1 id_11,
    output supply1 id_12
);
  assign id_12 = id_4;
endmodule
module module_1 (
    input supply0 id_0,
    output tri0 id_1
);
  assign id_1 = id_0;
  module_0 modCall_1 (
      id_0,
      id_0,
      id_1,
      id_0,
      id_0,
      id_1,
      id_0,
      id_0,
      id_0,
      id_0,
      id_0,
      id_0,
      id_1
  );
  assign modCall_1.id_2 = 0;
  assign id_1 = 1;
endmodule
