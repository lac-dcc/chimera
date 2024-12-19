// Seed: 3937986683
module module_0 (
    input  tri1  id_0,
    input  uwire id_1,
    input  tri   id_2,
    input  wor   id_3,
    input  tri   id_4,
    output tri1  id_5,
    input  uwire id_6,
    input  wor   id_7
);
  integer id_9;
  assign module_1.id_6 = 0;
  assign id_5 = 1;
  assign id_9 = id_7;
  wire id_10;
endmodule
module module_1 (
    input supply1 id_0,
    input supply1 id_1,
    input wor id_2,
    output uwire id_3,
    output tri id_4,
    output tri1 id_5,
    input supply1 id_6,
    output supply1 id_7,
    input supply1 id_8
);
  wire id_10;
  module_0 modCall_1 (
      id_6,
      id_0,
      id_1,
      id_8,
      id_8,
      id_5,
      id_6,
      id_1
  );
endmodule
