// Seed: 2709822154
module module_0 (
    output supply1 id_0,
    input tri0 id_1,
    input tri0 id_2,
    output wor id_3,
    input wire id_4,
    output wor id_5,
    output tri id_6,
    output supply0 id_7,
    input wand id_8,
    input wire id_9,
    input uwire id_10,
    output wire id_11,
    input supply1 id_12,
    input tri id_13
);
  wire [1 : -1] id_15;
endmodule
module module_1 (
    input wire id_0,
    input wire id_1,
    input wor id_2,
    input supply1 id_3,
    output tri0 id_4,
    output wire id_5,
    output uwire id_6,
    input tri id_7,
    input tri0 id_8,
    input tri id_9,
    output tri id_10,
    output wor id_11,
    input uwire id_12,
    input supply0 id_13
);
  wire id_15, id_16;
  assign id_4 = (id_0);
  wire id_17;
  module_0 modCall_1 (
      id_6,
      id_8,
      id_3,
      id_5,
      id_1,
      id_5,
      id_10,
      id_11,
      id_2,
      id_7,
      id_9,
      id_6,
      id_3,
      id_0
  );
  assign modCall_1.id_6 = 0;
endmodule
