// Seed: 1308524913
module module_0 (
    output uwire id_0,
    input wor id_1,
    input wor id_2,
    input wand id_3,
    input supply1 id_4,
    output wor id_5,
    output supply1 id_6,
    input tri1 id_7,
    output wor id_8,
    input tri0 id_9,
    input uwire id_10,
    input tri id_11,
    input wor id_12,
    input wor id_13,
    input uwire id_14
);
  id_16(
      .id_0(), .id_1(id_7), .id_2(), .id_3(1'b0), .id_4(id_0), .id_5(1 + id_11)
  );
  supply1 id_17 = id_12 ^ 1;
  assign id_6 = id_3;
endmodule
module module_1 (
    input supply1 id_0,
    output tri1 id_1
);
  pullup ((id_0), 1, 1, id_0);
  module_0 modCall_1 (
      id_1,
      id_0,
      id_0,
      id_0,
      id_0,
      id_1,
      id_1,
      id_0,
      id_1,
      id_0,
      id_0,
      id_0,
      id_0,
      id_0,
      id_0
  );
  wire id_3;
endmodule
