// Seed: 1871546831
module module_0 (
    output wor id_0,
    input tri1 id_1,
    output supply0 id_2,
    output supply0 id_3,
    input uwire id_4,
    input tri1 id_5,
    input wand id_6,
    input tri id_7,
    input tri0 id_8
);
  wire  id_10;
  logic id_11;
endmodule
module module_1 (
    input wor id_0,
    input tri0 id_1,
    inout uwire id_2,
    output tri0 id_3#(.id_9(1)),
    input supply1 id_4,
    output wor id_5,
    input uwire id_6#(
        .id_10(1),
        .id_11(1)
    ),
    input tri1 id_7
);
  module_0 modCall_1 (
      id_2,
      id_6,
      id_3,
      id_2,
      id_6,
      id_1,
      id_7,
      id_7,
      id_2
  );
  assign modCall_1.id_6 = 0;
endmodule
