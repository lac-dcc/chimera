// Seed: 1373726822
module module_0 (
    output supply0 id_0,
    output wand id_1,
    output wire id_2,
    input supply1 id_3,
    output uwire id_4,
    output wand id_5,
    output wor id_6,
    input tri0 id_7,
    input supply0 id_8,
    output tri1 id_9,
    input uwire id_10,
    output tri0 id_11,
    input wor id_12,
    input tri0 id_13,
    output uwire id_14
);
  wire id_16;
  wire id_17;
  assign id_1 = id_8;
  assign module_1.type_4 = 0;
endmodule
module module_1 (
    output tri id_0,
    output wor id_1,
    output tri1 id_2,
    output supply1 id_3,
    input supply0 id_4,
    input supply1 id_5,
    input wand id_6,
    input supply1 id_7,
    output tri id_8,
    input wand id_9,
    input supply1 id_10,
    input wand id_11,
    input wire id_12
);
  assign id_3 = ~id_10 & 1;
  module_0 modCall_1 (
      id_0,
      id_0,
      id_8,
      id_5,
      id_2,
      id_8,
      id_8,
      id_12,
      id_10,
      id_8,
      id_5,
      id_0,
      id_6,
      id_5,
      id_8
  );
endmodule
