// Seed: 3399753767
module module_0 (
    output tri id_0,
    output supply0 id_1,
    output supply1 id_2,
    input tri0 id_3,
    input tri1 id_4,
    input wand id_5,
    output supply0 id_6,
    output supply1 id_7,
    input tri id_8,
    input tri0 id_9,
    input wire id_10,
    output uwire id_11,
    input tri1 id_12,
    input tri0 id_13,
    output tri0 id_14
);
  wire id_16;
endmodule
module module_1 (
    input tri id_0,
    input wand id_1,
    output supply0 id_2,
    input supply1 id_3,
    output supply1 id_4
);
  assign id_2 = 1;
  module_0 modCall_1 (
      id_4,
      id_2,
      id_4,
      id_3,
      id_3,
      id_1,
      id_2,
      id_4,
      id_3,
      id_0,
      id_1,
      id_4,
      id_3,
      id_0,
      id_2
  );
  assign modCall_1.id_7 = 0;
endmodule
