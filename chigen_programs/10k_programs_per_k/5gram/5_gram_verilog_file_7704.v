// Seed: 4034356807
module module_0 (
    input tri0 id_0,
    output wire id_1,
    output tri id_2,
    input wand id_3,
    input uwire id_4,
    output supply0 id_5,
    input uwire id_6,
    input wire id_7,
    input supply1 id_8,
    output tri0 id_9,
    input tri id_10,
    input wor id_11
);
  wire id_13;
  assign module_1.id_4 = 0;
endmodule
module module_1 (
    output supply1 id_0,
    input tri0 id_1,
    output wand id_2,
    input tri0 id_3,
    output supply1 id_4,
    input supply0 id_5,
    output tri0 id_6,
    output tri1 id_7,
    output tri id_8,
    output tri1 id_9,
    output wand id_10,
    output uwire id_11,
    input supply1 id_12,
    input tri0 id_13,
    output wor id_14
);
  assign id_8 = 1'b0 & 1;
  module_0 modCall_1 (
      id_5,
      id_11,
      id_4,
      id_13,
      id_1,
      id_4,
      id_13,
      id_5,
      id_1,
      id_9,
      id_1,
      id_12
  );
endmodule
