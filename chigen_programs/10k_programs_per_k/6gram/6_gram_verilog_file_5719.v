// Seed: 1239817611
module module_0 (
    output supply1 id_0,
    output wand id_1,
    input uwire id_2,
    input tri id_3,
    output uwire id_4,
    input tri0 id_5,
    input wire id_6,
    input tri1 id_7,
    output supply1 id_8,
    output uwire id_9,
    output wire id_10,
    input wand id_11
    , id_19,
    output tri id_12,
    output uwire id_13,
    input uwire id_14,
    output tri1 id_15,
    output wor id_16,
    output tri0 id_17
);
  wire id_20;
  assign module_1.id_4 = 0;
endmodule
module module_1 (
    input tri1 id_0,
    input tri1 id_1,
    input tri0 id_2,
    input tri0 id_3,
    output wand id_4,
    input supply1 id_5,
    output tri id_6,
    input wire id_7
);
  wire id_9;
  module_0 modCall_1 (
      id_4,
      id_6,
      id_1,
      id_0,
      id_4,
      id_3,
      id_5,
      id_1,
      id_6,
      id_4,
      id_4,
      id_0,
      id_6,
      id_6,
      id_3,
      id_6,
      id_6,
      id_4
  );
  id_10(
      .id_0(id_5),
      .id_1(1),
      .id_2(id_6 > id_5),
      .id_3(1),
      .id_4(id_2),
      .id_5(""),
      .id_6(id_9),
      .id_7(1),
      .id_8(1),
      .id_9(1'b0),
      .id_10(id_7)
  );
endmodule
