// Seed: 3819768500
module module_0 (
    input uwire id_0,
    input tri id_1,
    output tri0 id_2,
    input wor id_3,
    input tri0 id_4,
    input tri0 id_5,
    output wand id_6,
    output supply0 id_7,
    input wand id_8,
    input wire id_9#(.id_12(1)),
    output uwire id_10
);
endmodule
module module_1 (
    input tri0 id_0,
    input supply1 id_1,
    output wire id_2,
    output uwire id_3,
    input wor id_4,
    input wand id_5,
    input uwire id_6,
    output supply1 id_7#(
        .id_9 (|1 - id_1),
        .id_10(1),
        .id_11(1),
        .id_12(1'h0)
    )
);
  xor (id_2, id_1, id_6, id_4, id_5);
  assign id_3  = 1;
  assign id_12 = id_1;
  module_0(
      id_4, id_0, id_7, id_4, id_5, id_4, id_3, id_2, id_1, id_0, id_12
  );
endmodule
