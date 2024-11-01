// Seed: 2825200351
module module_0 (
    input supply0 id_0,
    output uwire id_1,
    input supply1 id_2,
    input supply1 id_3,
    output supply1 id_4,
    output uwire id_5,
    input tri0 id_6,
    input supply1 id_7,
    input tri0 id_8,
    output supply1 id_9,
    input tri id_10,
    input supply0 id_11,
    input uwire id_12
);
  id_14(
      .id_0(1 | id_0),
      .id_1(1'b0),
      .id_2(1'h0),
      .id_3(1),
      .id_4(id_2),
      .id_5(id_2),
      .id_6(),
      .id_7(1),
      .id_8(id_3)
  );
  wire id_15;
  wire id_16;
  assign id_1 = (id_12);
endmodule
module module_1 (
    input supply1 id_0,
    output wor id_1,
    output wor id_2,
    output uwire id_3,
    output supply1 id_4,
    input wand id_5,
    input tri id_6,
    inout wor id_7,
    input tri id_8,
    output supply1 id_9,
    input tri id_10,
    input tri1 id_11,
    input tri0 id_12,
    output wand id_13
);
  module_0(
      id_8, id_4, id_6, id_7, id_9, id_9, id_6, id_5, id_11, id_2, id_10, id_0, id_11
  ); id_15(
      .id_0(id_5), .id_1(1'b0), .id_2(id_10)
  );
endmodule
