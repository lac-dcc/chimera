// Seed: 3581155536
module module_0 (
    input tri id_0,
    input supply1 id_1,
    input wand id_2,
    input supply1 id_3,
    output uwire id_4,
    input uwire id_5,
    input supply0 id_6
);
  assign id_4 = 1;
endmodule
module module_1 (
    output uwire id_0,
    input supply1 id_1,
    input wand id_2,
    output tri1 id_3,
    input supply1 id_4,
    input wand id_5,
    input tri1 id_6,
    input uwire id_7,
    output tri id_8
);
  assign id_3 = id_5;
  module_0 modCall_1 (
      id_4,
      id_1,
      id_1,
      id_1,
      id_3,
      id_5,
      id_6
  );
  assign modCall_1.id_1 = 0;
endmodule
