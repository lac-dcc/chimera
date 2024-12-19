// Seed: 4276471677
module module_0 (
    input wor id_0,
    input supply1 id_1,
    output wor id_2,
    output wire id_3,
    input tri0 id_4,
    input supply0 id_5,
    input supply0 id_6,
    input supply1 id_7
);
  assign module_1.type_9 = 0;
  id_9(
      .id_0(id_1),
      .id_1(id_0),
      .id_2(1),
      .id_3(id_0 & 1),
      .id_4(1'b0),
      .id_5(""),
      .id_6(id_7),
      .id_7(id_7),
      .id_8(1),
      .id_9(id_4),
      .id_10(1)
  );
endmodule
module module_1 (
    input tri id_0,
    input supply1 id_1,
    input supply0 id_2,
    input wor id_3,
    input tri1 id_4,
    input tri id_5,
    input wand id_6,
    output supply1 id_7
);
  assign id_7 = id_4;
  module_0 modCall_1 (
      id_2,
      id_5,
      id_7,
      id_7,
      id_6,
      id_4,
      id_5,
      id_6
  );
  always id_7 = id_5;
endmodule
