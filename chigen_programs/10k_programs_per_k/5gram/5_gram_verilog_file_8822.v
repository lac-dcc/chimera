// Seed: 2488208654
module module_0 (
    output uwire id_0,
    input tri1 module_0,
    input supply0 id_2,
    input wire id_3,
    input tri0 id_4,
    output uwire id_5,
    output tri id_6,
    input supply1 id_7,
    output tri1 id_8,
    input wire id_9,
    input wor id_10
);
endmodule
module module_1 (
    output wor id_0,
    input tri0 id_1,
    input supply0 id_2
);
  generate
    assign id_0 = !id_1;
  endgenerate
  assign id_0 = -1;
  module_0 modCall_1 (
      id_0,
      id_1,
      id_1,
      id_1,
      id_2,
      id_0,
      id_0,
      id_2,
      id_0,
      id_2,
      id_1
  );
  assign modCall_1.id_5 = 0;
  assign id_0 = id_2 == 1;
  assign id_0 = id_2;
endmodule
