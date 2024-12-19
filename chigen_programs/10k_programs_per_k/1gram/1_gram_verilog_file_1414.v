// Seed: 2763096158
module module_0 (
    output tri1 id_0,
    input supply1 id_1,
    input wand id_2,
    output uwire id_3,
    output wand id_4,
    input tri1 id_5,
    input wor id_6,
    output uwire id_7,
    input wor id_8,
    input supply0 id_9,
    input wand id_10,
    input wor id_11
);
  wire id_13;
  assign id_0 = id_1;
  always_comb $display;
  assign module_1.id_6 = 0;
  wire id_14;
  wire id_15;
endmodule
module module_1 (
    output supply1 id_0,
    output tri id_1,
    input supply0 id_2,
    output wor id_3,
    output wire id_4,
    output supply0 id_5,
    output wor id_6,
    input supply1 id_7,
    output wor id_8,
    input tri id_9,
    output uwire id_10,
    input tri0 id_11,
    input wand id_12
);
  assign id_8 = 1;
  tri0 id_14;
  module_0 modCall_1 (
      id_8,
      id_12,
      id_12,
      id_3,
      id_5,
      id_9,
      id_14,
      id_14,
      id_11,
      id_2,
      id_12,
      id_2
  );
  assign id_6 = id_14;
  wire id_15;
  id_16(
      .id_0(id_10)
  );
endmodule
