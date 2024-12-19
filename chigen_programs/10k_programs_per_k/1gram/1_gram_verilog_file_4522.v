// Seed: 3089610944
module module_0 (
    output uwire id_0,
    input wor id_1,
    output uwire id_2,
    input uwire id_3,
    output tri id_4,
    input supply1 id_5
);
  wire id_7, id_8;
  wire id_9;
  assign module_1.type_0 = 0;
endmodule
module module_1 (
    input tri id_0,
    input tri0 id_1,
    input supply1 id_2,
    input tri0 id_3,
    input wor id_4,
    input tri1 id_5,
    input supply0 id_6,
    input wor id_7,
    output supply0 id_8,
    output tri0 id_9,
    input tri0 id_10,
    output wand id_11,
    output uwire id_12,
    output supply1 id_13,
    input tri id_14
);
  wire id_16;
  id_17(
      id_13, id_13 * id_0
  );
  wire id_18;
  xor primCall (
      id_13, id_3, id_17, id_5, id_10, id_7, id_18, id_1, id_6, id_4, id_2, id_14, id_0, id_16
  );
  module_0 modCall_1 (
      id_12,
      id_2,
      id_8,
      id_2,
      id_13,
      id_3
  );
endmodule
