// Seed: 3916332446
module module_0 (
    input supply1 id_0,
    output tri0 id_1,
    output tri1 id_2,
    input tri0 id_3,
    input tri id_4,
    output uwire id_5,
    input tri0 id_6,
    input supply0 id_7,
    output supply1 id_8,
    output wor id_9
);
  id_11(
      id_9, id_8, id_9, id_4
  );
  always_comb id_5 = id_4;
  id_12(
      .id_0(1)
  );
endmodule
module module_1 (
    input wire id_0,
    output uwire id_1,
    output tri0 id_2,
    input wand id_3,
    input supply0 id_4,
    output wand id_5,
    input tri0 id_6,
    input tri0 id_7,
    input uwire id_8,
    input wire id_9,
    output wand id_10,
    input tri0 id_11,
    input wor id_12
);
  assign id_1 = 1;
  module_0 modCall_1 (
      id_11,
      id_5,
      id_1,
      id_3,
      id_11,
      id_2,
      id_7,
      id_12,
      id_10,
      id_5
  );
  wand id_14 = 1'b0 - 1;
endmodule
