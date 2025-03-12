// Seed: 156382549
module module_0 (
    input tri1 id_0,
    input supply0 id_1[1 : 1],
    input uwire id_2,
    input supply1 id_3,
    input uwire id_4,
    output tri0 id_5,
    input tri1 id_6,
    input tri0 id_7,
    input supply0 id_8,
    output tri0 id_9,
    output tri0 id_10
);
  wire id_12;
  assign module_1.id_3 = 0;
endmodule
module module_1 (
    output tri0 id_0,
    input tri id_1,
    output supply0 id_2,
    output supply0 id_3,
    output tri0 id_4,
    input tri1 id_5
);
  assign id_4 = 1'b0;
  module_0 modCall_1 (
      id_1,
      id_5,
      id_1,
      id_1,
      id_1,
      id_3,
      id_5,
      id_5,
      id_1,
      id_3,
      id_4
  );
endmodule
