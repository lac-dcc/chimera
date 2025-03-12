// Seed: 291319569
module module_0 (
    output tri1 id_0,
    input wor id_1,
    input tri0 id_2,
    input supply1 id_3,
    output supply1 id_4,
    input supply0 id_5,
    input tri id_6,
    input uwire id_7,
    output tri1 id_8
);
  parameter id_10 = 1;
  assign id_4 = id_3;
endmodule
module module_1 (
    input  uwire id_0,
    input  tri   id_1,
    output wire  id_2,
    input  wor   id_3,
    input  uwire id_4,
    input  wor   id_5,
    input  wor   id_6,
    output uwire id_7,
    output wire  id_8,
    output uwire id_9
);
  module_0 modCall_1 (
      id_2,
      id_6,
      id_5,
      id_1,
      id_9,
      id_6,
      id_1,
      id_1,
      id_2
  );
  assign modCall_1.id_1 = 0;
endmodule
