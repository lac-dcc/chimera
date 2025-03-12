// Seed: 4237770808
module module_0 (
    input wor id_0,
    output tri0 id_1,
    input supply1 id_2,
    input wor id_3,
    input tri0 id_4,
    input uwire id_5,
    input tri1 id_6
);
endmodule
module module_1 (
    output uwire id_0,
    input uwire id_1,
    input supply1 id_2,
    output uwire id_3,
    output wire id_4,
    output tri0 id_5,
    input supply0 id_6,
    input tri1 id_7,
    output tri1 id_8,
    output supply0 id_9,
    output tri0 id_10[1 : 1]
);
  assign id_0 = id_6;
  module_0 modCall_1 (
      id_2,
      id_3,
      id_1,
      id_7,
      id_7,
      id_1,
      id_6
  );
  assign modCall_1.id_6 = 0;
  wire id_12;
  nor primCall (id_10, id_6, id_2, id_1, id_7);
endmodule
