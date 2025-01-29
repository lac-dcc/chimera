// Seed: 2003030991
module module_0 (
    input tri id_0,
    id_17,
    input supply0 id_1,
    output tri0 id_2,
    output tri0 id_3,
    input tri1 id_4,
    output supply0 id_5,
    input supply0 id_6,
    input tri id_7,
    output tri1 id_8,
    input supply0 id_9,
    output supply1 id_10,
    input tri0 id_11,
    output tri0 id_12,
    input supply1 id_13,
    input uwire id_14,
    output supply1 id_15
);
  wire id_18;
endmodule
module module_1 (
    input supply1 id_0,
    input tri0 id_1,
    output tri0 id_2,
    input tri0 id_3,
    output tri1 id_4,
    input tri0 id_5,
    input uwire id_6,
    input tri1 id_7
);
  wire id_9;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_4,
      id_2,
      id_5,
      id_4,
      id_6,
      id_1,
      id_2,
      id_0,
      id_4,
      id_0,
      id_2,
      id_1,
      id_3,
      id_4
  );
  assign modCall_1.type_10 = 0;
  assign id_2 = -1 || id_1;
endmodule
