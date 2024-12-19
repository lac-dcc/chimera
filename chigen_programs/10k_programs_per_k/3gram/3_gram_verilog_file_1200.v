// Seed: 1219271046
module module_0 (
    input wor id_0,
    output tri id_1,
    input supply1 id_2,
    input supply0 id_3,
    input supply1 id_4,
    input wand id_5,
    input supply1 id_6,
    input tri1 id_7,
    output tri id_8
);
  always @(*) id_8 = |(id_5);
  assign module_1.type_3 = 0;
  id_10(
      .id_0(1), .id_1(id_4 & id_2)
  );
  assign id_1 = 1;
endmodule
module module_1 (
    output tri0 id_0,
    output tri1 id_1,
    input wire id_2,
    input supply0 id_3,
    input tri0 id_4,
    output wor id_5
);
  id_7(
      .id_0(id_5 != id_0),
      .id_1(1'b0),
      .id_2(1'b0),
      .id_3(""),
      .id_4(1),
      .id_5(id_4),
      .id_6(id_2),
      .id_7(1'b0),
      .id_8(1)
  );
  module_0 modCall_1 (
      id_3,
      id_5,
      id_4,
      id_2,
      id_3,
      id_3,
      id_4,
      id_4,
      id_0
  );
  id_8(
      .id_0(), .id_1(id_5), .id_2(id_3)
  );
endmodule
