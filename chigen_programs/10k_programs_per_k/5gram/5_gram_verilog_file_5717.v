// Seed: 3767427142
module module_0 (
    output uwire id_0,
    output tri1 id_1,
    output wire id_2,
    input supply1 id_3,
    output wor id_4,
    output tri id_5,
    output tri0 id_6,
    input uwire id_7,
    input supply1 id_8,
    output wor id_9
);
  wor id_11, id_12;
  wire id_13;
  assign id_2 = id_11 ? id_8 : 1;
  integer id_14 = id_12;
  wire id_15;
endmodule
module module_1 (
    input wire id_0,
    input tri0 id_1,
    input tri1 id_2,
    tri0 id_4
);
  initial id_4 = id_0;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_4,
      id_2,
      id_4,
      id_4,
      id_4,
      id_1,
      id_2,
      id_4
  );
  assign modCall_1.type_4 = 0;
endmodule
