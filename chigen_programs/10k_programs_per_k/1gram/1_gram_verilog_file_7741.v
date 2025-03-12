// Seed: 319934799
module module_0 (
    output wire id_0,
    input tri0 id_1,
    output tri1 id_2,
    input tri id_3,
    input wire id_4[-1 : 1 'b0],
    output tri0 id_5,
    input tri id_6,
    output uwire id_7,
    output tri1 id_8,
    input supply1 id_9,
    output tri0 id_10,
    input wor id_11,
    input wire id_12,
    input wand id_13
);
  assign id_10 = !'b0;
  assign id_10 = 1;
  wire id_15;
  parameter id_16 = -1;
endmodule
module module_1 (
    output tri1 id_0,
    input tri0 id_1,
    input wire id_2,
    output wor id_3,
    input tri0 id_4,
    input uwire id_5,
    input supply1 id_6,
    input tri id_7
);
  assign id_3 = id_7;
  module_0 modCall_1 (
      id_0,
      id_5,
      id_3,
      id_1,
      id_6,
      id_3,
      id_5,
      id_3,
      id_3,
      id_5,
      id_0,
      id_7,
      id_5,
      id_7
  );
  assign modCall_1.id_10 = 0;
  wire id_9, id_10;
endmodule
