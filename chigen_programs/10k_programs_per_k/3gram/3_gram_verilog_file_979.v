// Seed: 580154578
module module_0 (
    input supply1 id_0,
    input tri1 id_1,
    input tri1 id_2,
    input supply0 id_3,
    output supply1 id_4,
    output supply0 id_5,
    input supply0 id_6
);
  assign id_5 = id_2 - -1;
  logic [-1 : 1  &&  (  1  )] id_8;
  ;
endmodule
module module_1 (
    input supply1 id_0,
    output uwire id_1,
    output tri1 id_2,
    input wor id_3,
    input tri id_4,
    output tri0 id_5,
    input uwire id_6,
    output wor id_7,
    input wire id_8,
    input supply1 id_9,
    input wor id_10
);
  always_ff @(1'b0);
  module_0 modCall_1 (
      id_0,
      id_3,
      id_0,
      id_9,
      id_7,
      id_1,
      id_10
  );
  assign modCall_1.id_1 = 0;
endmodule
