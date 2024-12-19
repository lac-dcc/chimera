// Seed: 1590451340
module module_0 (
    output uwire id_0,
    input  tri1  id_1,
    inout  tri   id_2,
    input  tri0  id_3,
    output tri   id_4,
    output wire  id_5
);
  tri0 id_7 = id_2 ? id_2 | 'b0 : 1 ? 1 : id_2;
  assign module_1.id_19 = 0;
endmodule
module module_1 (
    input supply1 id_0,
    input uwire id_1,
    input wor id_2,
    input tri1 id_3,
    input wand id_4,
    input uwire id_5,
    input tri id_6,
    input wor id_7
    , id_19,
    input tri0 id_8,
    output supply1 id_9,
    output wor id_10,
    input wor id_11,
    input supply1 id_12,
    output wire id_13,
    input tri1 id_14,
    input tri1 id_15,
    input supply1 id_16,
    output wand id_17
);
  always @(posedge 1 or posedge id_3) id_19 = id_4;
  id_20(
      .id_0(1), .id_1(id_19), .id_2(id_19), .id_3(1), .id_4(id_5)
  );
  module_0 modCall_1 (
      id_17,
      id_1,
      id_19,
      id_4,
      id_19,
      id_17
  );
endmodule
