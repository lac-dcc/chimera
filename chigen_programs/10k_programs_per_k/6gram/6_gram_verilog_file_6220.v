// Seed: 3869535692
module module_0 (
    output supply1 id_0,
    output supply0 id_1,
    input wor id_2,
    input wand id_3,
    output supply1 id_4,
    input supply0 id_5,
    input supply1 id_6,
    output tri id_7
);
endmodule
module module_1 (
    input supply0 id_0,
    input uwire id_1,
    output supply0 id_2,
    input supply1 id_3,
    output tri0 id_4,
    input tri1 id_5,
    output uwire id_6,
    output wor id_7
);
  genvar id_9;
  assign id_6 = -1;
  module_0 modCall_1 (
      id_4,
      id_2,
      id_1,
      id_0,
      id_4,
      id_3,
      id_5,
      id_6
  );
  assign modCall_1.id_5 = 0;
endmodule
