// Seed: 680565632
module module_0 (
    output tri0 id_0,
    input tri0 id_1,
    input tri id_2,
    input wire id_3,
    input supply1 id_4,
    output supply1 id_5,
    output supply0 id_6,
    input supply0 id_7,
    input tri0 id_8,
    output supply0 id_9,
    output wor id_10,
    input wor id_11,
    input supply1 id_12,
    input tri1 id_13,
    input uwire id_14,
    input wor id_15
);
  logic id_17;
  ;
endmodule
module module_1 (
    input wand id_0,
    output supply1 id_1
);
  assign id_1 = id_0;
  module_0 modCall_1 (
      id_1,
      id_0,
      id_0,
      id_0,
      id_0,
      id_1,
      id_1,
      id_0,
      id_0,
      id_1,
      id_1,
      id_0,
      id_0,
      id_0,
      id_0,
      id_0
  );
  assign modCall_1.id_11 = 0;
  assign id_1 = 1;
endmodule
