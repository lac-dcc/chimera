// Seed: 4264251053
module module_0 (
    input uwire id_0,
    input supply1 id_1,
    output supply0 id_2,
    input tri1 id_3,
    input wire id_4,
    input tri0 id_5,
    input tri id_6,
    input uwire id_7,
    output supply1 id_8
);
  wire id_10;
  assign id_2 = id_5;
  assign module_1.id_13 = 0;
  wire id_11;
  assign id_10 = id_5;
endmodule
module module_1 (
    input wire id_0,
    output supply0 id_1,
    input tri0 id_2,
    input tri0 id_3,
    input tri id_4,
    input tri id_5,
    output supply0 id_6,
    output uwire id_7,
    output wor id_8,
    input tri0 id_9,
    input tri1 id_10,
    output tri1 id_11,
    input tri1 id_12,
    output supply1 id_13,
    input supply0 id_14
);
  parameter id_16 = 1;
  wire id_17;
  module_0 modCall_1 (
      id_0,
      id_5,
      id_13,
      id_5,
      id_4,
      id_5,
      id_0,
      id_12,
      id_8
  );
  and primCall (id_8, id_3, id_16, id_9, id_5, id_4, id_14, id_12, id_10, id_0);
endmodule
