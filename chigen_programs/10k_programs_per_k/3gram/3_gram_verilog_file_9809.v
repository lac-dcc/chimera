// Seed: 2545043029
module module_0 (
    output tri1 id_0,
    output wand id_1,
    output uwire id_2,
    input uwire id_3,
    input supply1 id_4,
    input tri id_5,
    input wor id_6,
    output tri0 id_7,
    input wor id_8,
    output tri1 id_9,
    input supply1 id_10,
    output wand id_11,
    input wor id_12,
    input supply0 id_13
);
  wire id_15;
endmodule
module module_1 (
    input uwire id_0,
    input tri1 id_1,
    output tri0 id_2,
    input supply1 id_3,
    output wor id_4,
    input wire id_5,
    output tri id_6,
    input tri0 id_7
);
  integer id_9 = 1'b0, id_10;
  tri id_11;
  assign id_10 = 1;
  wire id_12;
  wire id_13;
  module_0 modCall_1 (
      id_11,
      id_4,
      id_4,
      id_3,
      id_11,
      id_12,
      id_3,
      id_12,
      id_5,
      id_4,
      id_1,
      id_4,
      id_5,
      id_7
  );
  assign modCall_1.id_0 = 0;
  assign id_11 = id_1;
endmodule
