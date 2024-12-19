// Seed: 461154075
module module_0 (
    output tri id_0,
    output tri1 id_1,
    output tri1 id_2,
    input wor id_3,
    output tri id_4,
    output tri id_5,
    input uwire id_6,
    input tri1 id_7,
    input tri0 id_8,
    input wire id_9,
    input wor id_10,
    input wor id_11,
    input supply0 id_12,
    input wand id_13
);
endmodule
module module_1 (
    input tri id_0,
    input wand id_1,
    output wire id_2,
    input supply1 id_3,
    input wor id_4,
    output wire id_5
);
  module_0 modCall_1 (
      id_2,
      id_5,
      id_2,
      id_1,
      id_2,
      id_2,
      id_4,
      id_4,
      id_3,
      id_1,
      id_4,
      id_1,
      id_1,
      id_3
  );
  assign modCall_1.type_3 = 0;
  always assume (1);
endmodule
