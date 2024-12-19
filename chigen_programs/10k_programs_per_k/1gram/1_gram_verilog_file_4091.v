// Seed: 2982926092
module module_0 (
    input tri1 id_0,
    input uwire id_1,
    input tri id_2,
    input tri1 id_3,
    input wire id_4,
    input tri id_5,
    input tri0 id_6,
    input tri1 id_7,
    input tri0 id_8,
    output tri0 id_9,
    input supply1 id_10
);
  tri0 id_12 = id_2;
  assign id_9  = id_2;
  assign id_12 = id_1 ? id_12 : 1;
  assign id_12 = id_4;
  tri0 id_13;
  initial id_12 = 1;
  assign id_13 = 1;
  assign id_9  = 1 - 1;
  id_14(
      id_13
  );
  wire id_15;
  wire id_16;
endmodule
module module_1 (
    input supply0 id_0,
    input supply1 id_1,
    output tri id_2,
    input tri0 id_3,
    output supply0 id_4,
    output tri0 id_5,
    input supply0 id_6,
    output supply0 id_7
);
  wire id_9;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_1,
      id_0,
      id_3,
      id_3,
      id_6,
      id_1,
      id_3,
      id_2,
      id_1
  );
  assign modCall_1.id_2 = 0;
  assign id_7 = 1;
endmodule
