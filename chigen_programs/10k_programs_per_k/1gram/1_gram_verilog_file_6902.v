// Seed: 2437448818
module module_0 (
    output tri id_0,
    output wand id_1,
    input uwire id_2,
    output uwire id_3,
    output wor id_4,
    output wor id_5,
    output uwire id_6,
    input wire id_7,
    input wor id_8,
    input supply0 id_9,
    input supply1 id_10,
    input wand id_11,
    input supply1 id_12
);
  assign id_4 = id_10 | id_8;
  supply0 id_14, id_15;
  assign id_6 = 1;
  assign id_0 = ~id_8;
  supply1 id_16 = id_11;
  always_ff id_15 = 1;
endmodule
module module_1 (
    output tri0 id_0,
    output wor id_1,
    output uwire id_2 id_6,
    output tri1 id_3,
    output tri0 id_4
);
  assign id_6 = 1;
  module_0(
      id_2, id_0, id_6, id_1, id_0, id_3, id_4, id_6, id_6, id_6, id_6, id_6, id_6
  );
endmodule
