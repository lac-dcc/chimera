// Seed: 1472089834
module module_0 (
    input tri0 id_0,
    output supply0 id_1,
    input tri0 id_2,
    input supply0 id_3,
    input uwire id_4,
    output wor id_5,
    output tri id_6,
    output tri1 id_7,
    input supply1 id_8,
    output supply0 id_9,
    output wand id_10,
    input supply1 id_11,
    input tri0 id_12,
    output supply0 id_13,
    input supply1 id_14
);
  logic id_16;
  ;
  logic [-1 'h0 : -1 'b0] id_17 = id_2;
endmodule
module module_1 (
    output tri id_0,
    input wire id_1,
    input supply1 id_2,
    input wand id_3,
    output tri0 id_4
);
  assign id_0 = id_1 ? id_2 : 1 ? 1 : {1{id_1}};
  module_0 modCall_1 (
      id_3,
      id_0,
      id_2,
      id_3,
      id_3,
      id_4,
      id_0,
      id_4,
      id_3,
      id_4,
      id_4,
      id_1,
      id_3,
      id_0,
      id_3
  );
  assign modCall_1.id_10 = 0;
endmodule
