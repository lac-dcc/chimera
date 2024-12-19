// Seed: 3557784740
module module_0 (
    output uwire id_0,
    input tri0 id_1,
    input wor id_2,
    input tri1 id_3,
    output tri0 id_4,
    output wire id_5,
    input supply1 id_6,
    input tri id_7,
    output tri0 id_8,
    input tri id_9,
    output wor id_10,
    input tri0 id_11,
    input tri0 id_12,
    output tri0 id_13,
    input wand id_14
);
  assign id_4 = id_1;
  wire id_16;
  wire id_17;
  id_18(
      .id_0(id_12), .id_1(1), .id_2(id_4), .id_3(1)
  );
  tri0 id_19 = (id_11);
  wire id_20;
endmodule
module module_1 (
    input  tri0 id_0,
    output tri1 id_1
);
  module_0 modCall_1 (
      id_1,
      id_0,
      id_0,
      id_0,
      id_1,
      id_1,
      id_0,
      id_0,
      id_1,
      id_0,
      id_1,
      id_0,
      id_0,
      id_1,
      id_0
  );
  assign modCall_1.id_6 = 0;
endmodule
