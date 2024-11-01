// Seed: 143142958
module module_0 (
    input supply0 id_0,
    output tri0 id_1,
    output supply1 id_2,
    input tri0 id_3,
    input supply1 id_4
    , id_10,
    input wire id_5,
    input wire id_6,
    output wor id_7,
    input wand id_8
);
  supply0 id_11 = 1 <-> id_0;
  assign id_1 = 1'b0;
  id_12(
      .id_0(),
      .id_1(id_3 + id_2),
      .id_2(id_0 | id_11 | 1),
      .id_3(1),
      .id_4(1),
      .id_5(1),
      .id_6(1),
      .id_7(1 + id_1)
  );
endmodule
module module_1 (
    output wire id_0,
    input supply0 id_1,
    input tri1 id_2,
    input wor id_3,
    input wire id_4,
    input tri id_5,
    output supply1 id_6,
    input wand id_7
);
  nor (id_6, id_14, id_12, id_10, id_11);
  wire id_9, id_10, id_11, id_12, id_13, id_14, id_15, id_16 = id_14, id_17;
  module_0(
      id_5, id_0, id_6, id_4, id_1, id_4, id_7, id_0, id_7
  );
endmodule
