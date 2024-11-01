// Seed: 2562030988
module module_0 (
    input uwire id_0,
    input tri0 id_1,
    input tri id_2,
    output tri id_3,
    output tri0 id_4,
    output uwire id_5,
    output wor id_6,
    input wor id_7,
    input tri id_8,
    output wand id_9,
    output tri0 id_10,
    output tri id_11,
    input wor id_12,
    input supply1 id_13,
    output supply0 id_14,
    input wor id_15,
    input tri1 id_16
);
  wire id_18;
  generate
    integer id_19 (
        .id_0(id_7),
        .id_1(!id_14),
        .id_2(1),
        .id_3(id_9)
    );
    assign id_4 = id_16;
  endgenerate
  wire id_20;
endmodule
module module_1 (
    input  wire id_0,
    output tri1 id_1
);
  assign id_1 = id_0;
  module_0(
      id_0,
      id_0,
      id_0,
      id_1,
      id_1,
      id_1,
      id_1,
      id_0,
      id_0,
      id_1,
      id_1,
      id_1,
      id_0,
      id_0,
      id_1,
      id_0,
      id_0
  );
endmodule
