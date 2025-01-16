// Seed: 2822652810
module module_0 (
    input tri1 id_0,
    input tri id_1,
    output supply1 id_2,
    output tri id_3,
    input uwire id_4,
    input tri id_5,
    input uwire id_6,
    input wor id_7,
    inout wire id_8,
    input tri1 id_9,
    output uwire id_10,
    output tri0 id_11
);
  tri1 id_13 = id_1;
  wire id_14;
  parameter id_15 = 1;
endmodule
module module_1 (
    input supply1 id_0,
    input wand id_1,
    output supply1 id_2
);
  supply1 id_4, id_5;
  wire id_6, id_7, id_8;
  initial #(-1) id_4 = id_0;
  module_0 modCall_1 (
      id_1,
      id_0,
      id_5,
      id_2,
      id_4,
      id_5,
      id_1,
      id_4,
      id_4,
      id_4,
      id_4,
      id_5
  );
  assign modCall_1.type_6 = 0;
  wire id_9;
endmodule
