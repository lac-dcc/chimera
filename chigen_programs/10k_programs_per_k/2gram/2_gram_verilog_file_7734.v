// Seed: 729063199
program module_0 (
    input  wor   id_0,
    input  tri0  id_1,
    input  wire  id_2,
    input  uwire id_3,
    input  wand  id_4,
    input  wand  id_5,
    output uwire id_6
);
  supply1 id_8;
  id_9(
      .id_0(1'b0),
      .id_1(id_0),
      .id_2(id_4),
      .id_3(""),
      .id_4(),
      .id_5(),
      .id_6(id_0),
      .id_7(id_6),
      .id_8(!id_1),
      .id_9(id_2),
      .id_10(id_5)
  );
  assign module_1.id_1 = 0;
  always id_8 = 1;
endprogram
module module_1 (
    output uwire id_0,
    input tri1 id_1,
    input supply1 id_2,
    input supply1 id_3,
    input tri1 id_4,
    output tri1 id_5,
    output tri id_6,
    input supply0 id_7,
    output tri1 id_8,
    output wor id_9
    , id_19,
    input tri id_10,
    input tri1 id_11,
    input supply0 id_12,
    input wand id_13
    , id_20,
    output uwire id_14,
    output supply0 id_15,
    input wire id_16,
    input tri0 id_17
);
  assign id_5 = id_19;
  module_0 modCall_1 (
      id_20,
      id_1,
      id_20,
      id_4,
      id_4,
      id_20,
      id_6
  );
endmodule
