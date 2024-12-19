// Seed: 435747454
module module_0 (
    output tri id_0,
    output tri0 id_1,
    input uwire id_2,
    input tri id_3,
    input supply0 id_4,
    input wor id_5,
    input tri0 id_6,
    output supply1 id_7,
    output tri1 id_8,
    input tri1 id_9,
    input supply1 id_10,
    input wor id_11,
    output uwire id_12,
    input tri1 id_13,
    input tri id_14
);
  assign id_12 = id_6;
  assign module_1.type_6 = 0;
endmodule
module module_1 (
    input uwire id_0,
    input uwire id_1,
    input wor id_2,
    input wor id_3,
    input uwire id_4,
    input uwire id_5,
    input supply0 id_6,
    output tri id_7,
    output uwire id_8,
    input tri id_9,
    input supply1 id_10,
    input wire id_11,
    input wire id_12,
    input tri1 id_13
);
  wire id_15;
  assign id_8 = id_3;
  wire id_16;
  tri  id_17;
  assign id_17 = 1;
  wire id_18;
  module_0 modCall_1 (
      id_7,
      id_17,
      id_6,
      id_2,
      id_2,
      id_13,
      id_4,
      id_7,
      id_17,
      id_10,
      id_5,
      id_4,
      id_17,
      id_12,
      id_10
  );
  wire id_19;
  assign id_7 = id_17;
  wire id_20;
  xor primCall (
      id_8, id_9, id_5, id_11, id_2, id_17, id_16, id_3, id_15, id_18, id_6, id_12, id_1, id_13
  );
endmodule
