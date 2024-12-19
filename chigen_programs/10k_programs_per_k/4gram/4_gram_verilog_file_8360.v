// Seed: 2003431573
module module_0 (
    input uwire id_0,
    input tri id_1,
    input tri id_2,
    input wire id_3,
    input supply1 id_4,
    input supply1 id_5,
    input supply0 id_6,
    input supply0 id_7,
    input uwire id_8,
    input tri0 id_9,
    output tri1 id_10,
    output tri0 id_11,
    output tri0 id_12,
    input supply1 id_13
);
  wire id_15;
endmodule
module module_1 (
    input tri id_0,
    output tri0 id_1,
    input tri id_2,
    input wor id_3,
    input tri0 id_4,
    input tri0 id_5,
    output tri0 id_6,
    input wand id_7,
    output supply1 id_8,
    input uwire id_9,
    input tri0 id_10,
    output wor id_11,
    input tri1 id_12
);
  wire id_14;
  assign id_6 = id_9;
  wire id_15;
  module_0 modCall_1 (
      id_0,
      id_2,
      id_4,
      id_4,
      id_9,
      id_4,
      id_7,
      id_4,
      id_4,
      id_12,
      id_1,
      id_6,
      id_8,
      id_12
  );
  assign modCall_1.id_6 = 0;
endmodule
