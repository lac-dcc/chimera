// Seed: 266514079
module module_0 (
    input tri1 id_0,
    output tri0 id_1,
    input tri0 id_2,
    output tri0 id_3,
    input tri id_4,
    output tri id_5,
    input uwire id_6,
    output uwire id_7,
    output supply1 id_8,
    output supply0 id_9,
    input supply1 id_10,
    input tri0 id_11,
    input wire id_12,
    input wire id_13
);
  assign id_3 = id_4;
endmodule
module module_1 (
    input  uwire id_0,
    output tri1  id_1,
    input  uwire id_2
);
  wire id_4;
  module_0 modCall_1 (
      id_2,
      id_1,
      id_0,
      id_1,
      id_2,
      id_1,
      id_2,
      id_1,
      id_1,
      id_1,
      id_0,
      id_0,
      id_2,
      id_2
  );
  assign modCall_1.id_0 = 0;
endmodule
