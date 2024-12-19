// Seed: 3329497457
module module_0 (
    input supply1 id_0,
    output tri1 id_1,
    input uwire id_2,
    output tri1 id_3,
    output supply0 id_4,
    output supply1 id_5,
    input supply0 id_6,
    input supply0 id_7,
    input supply1 id_8
);
  assign id_1 = 1'b0;
endmodule
module module_1 (
    output tri0 id_0,
    output tri0 id_1,
    output tri1 id_2,
    input supply1 id_3,
    input supply0 id_4,
    input supply1 id_5
);
  tri0 id_7 = 1, id_8, id_9, id_10;
  module_0 modCall_1 (
      id_5,
      id_0,
      id_4,
      id_1,
      id_1,
      id_0,
      id_3,
      id_4,
      id_5
  );
  assign modCall_1.id_0 = 0;
endmodule
