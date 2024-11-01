// Seed: 916444044
module module_0 (
    output supply1 id_0,
    output wire id_1,
    output tri1 id_2,
    output tri0 id_3,
    input wand id_4,
    input supply0 id_5,
    input tri0 id_6,
    input supply0 id_7,
    input supply1 id_8,
    input wor id_9,
    input tri id_10,
    output uwire id_11,
    input wand id_12
);
  assign id_1 = id_10;
  initial begin
    if (id_5 - id_8) begin
      `define pp_14 0
      id_2 = id_8 && id_4;
    end
  end
endmodule
module module_1 (
    input wor id_0,
    output tri1 id_1,
    output wand id_2,
    input supply0 id_3,
    output wor id_4,
    input uwire id_5,
    output wor id_6
);
  id_8(
      .id_0(id_1),
      .id_1(id_0),
      .id_2(~id_2),
      .id_3(1),
      .id_4(id_1),
      .id_5(),
      .id_6(id_0 == 1),
      .id_7(id_4),
      .id_8(1),
      .id_9(id_2)
  ); module_0(
      id_2, id_6, id_4, id_1, id_3, id_3, id_5, id_5, id_3, id_3, id_0, id_6, id_5
  );
endmodule
