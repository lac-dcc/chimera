// Seed: 3979513394
module module_0 (
    output wor id_0,
    input wor id_1,
    output supply0 id_2,
    input wire id_3,
    input supply0 id_4,
    output tri0 id_5,
    input wire id_6,
    input tri id_7,
    output supply0 id_8,
    output supply1 id_9,
    input supply1 id_10
);
  assign id_5 = id_4;
  wire id_12;
  wire id_13;
  assign id_2 = id_6;
endmodule
module module_1 (
    input tri id_0,
    output supply0 id_1,
    inout wor id_2,
    output wor id_3,
    input supply1 id_4
);
  module_0 modCall_1 (
      id_3,
      id_2,
      id_2,
      id_4,
      id_0,
      id_1,
      id_0,
      id_4,
      id_3,
      id_2,
      id_2
  );
  assign modCall_1.type_7 = 0;
  always_latch id_3 = 1;
  assign id_1 = -1;
endmodule
