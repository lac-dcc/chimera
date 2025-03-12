// Seed: 3669596393
module module_0 (
    input wand id_0,
    input uwire id_1#(
        .id_14(1),
        .id_15(1 << 1'b0 || 1)
    ),
    input tri1 id_2,
    input wand id_3,
    input supply1 id_4,
    inout supply0 id_5,
    output supply1 id_6,
    input supply0 id_7,
    input uwire id_8,
    input tri1 id_9,
    output wire id_10,
    output tri0 id_11,
    input uwire id_12
);
  wire id_16;
  wire [-1 : 1] id_17, id_18, id_19;
  tri0 id_20;
  assign id_20 = -1;
endmodule
module module_1 (
    output wand id_0,
    input  tri0 id_1,
    output tri0 id_2,
    inout  tri0 id_3
);
  assign id_3 = ^ -1;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_2,
      id_1,
      id_3,
      id_3,
      id_0,
      id_0,
      id_1
  );
  assign modCall_1.id_11 = 0;
  parameter id_5 = -1;
  assign id_0 = -1;
endmodule
