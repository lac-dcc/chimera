// Seed: 1947833357
module module_0 (
    output wand id_0,
    input uwire id_1,
    input tri1 id_2,
    input supply0 id_3,
    input tri0 id_4,
    output tri id_5,
    input tri1 id_6,
    input tri1 id_7,
    output wire id_8
);
  assign id_5 = id_2 ? 1 : (id_3 == 1);
endmodule
module module_1 (
    input tri0 id_0,
    input tri0 id_1,
    output supply1 id_2,
    input tri1 id_3,
    output tri0 id_4,
    output tri id_5,
    input tri id_6,
    input uwire id_7,
    input supply0 id_8,
    input supply1 id_9
);
  assign id_5 = 1'd0;
  module_0 modCall_1 (
      id_2,
      id_6,
      id_1,
      id_9,
      id_9,
      id_2,
      id_7,
      id_1,
      id_2
  );
  assign modCall_1.type_10 = 0;
endmodule
