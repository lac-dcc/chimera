// Seed: 3792993820
module module_0 (
    input uwire id_0,
    output wor id_1,
    input tri1 id_2,
    output supply1 id_3,
    input tri1 id_4,
    input tri1 id_5,
    input uwire id_6,
    input tri0 id_7,
    input tri id_8,
    input wor id_9
);
  tri1 id_11 = id_8;
  wire id_12, id_13;
  assign id_1 = 1'b0;
  wire id_14;
  assign module_1.type_1 = 0;
endmodule
module module_1 (
    output uwire id_0,
    input supply0 id_1,
    input tri id_2,
    input uwire id_3,
    input uwire id_4,
    input wor id_5
);
  assign id_0 = 1;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_2,
      id_0,
      id_2,
      id_3,
      id_4,
      id_4,
      id_2,
      id_5
  );
endmodule
