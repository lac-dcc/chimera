// Seed: 693195503
module module_0 (
    output uwire id_0,
    input  tri   id_1,
    input  wor   id_2,
    input  tri0  id_3,
    input  wor   id_4
);
  assign module_1.id_3 = 0;
endmodule
module module_1 (
    output uwire id_0,
    input wor id_1,
    input wire id_2,
    input supply1 id_3,
    input wand id_4,
    inout wor id_5,
    input supply0 id_6
);
  wire id_8;
  module_0 modCall_1 (
      id_5,
      id_5,
      id_5,
      id_1,
      id_6
  );
endmodule
module module_2 #(
    parameter id_3 = 32'd99
) (
    input wire id_0,
    input wand id_1,
    input tri0 id_2,
    input wor _id_3
    , id_12,
    input tri1 id_4,
    output tri0 id_5,
    input tri1 id_6,
    input tri0 id_7,
    input supply0 id_8,
    output supply1 id_9,
    input tri1 id_10
);
  logic [-1 : id_3] id_13;
  module_0 modCall_1 (
      id_5,
      id_4,
      id_8,
      id_8,
      id_6
  );
  assign modCall_1.id_4 = 0;
endmodule
