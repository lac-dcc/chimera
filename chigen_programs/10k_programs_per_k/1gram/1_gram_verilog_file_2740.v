// Seed: 3720127517
module module_0 (
    input tri0 id_0,
    input tri id_1,
    output supply1 id_2,
    input tri id_3,
    input uwire id_4,
    output tri id_5,
    output tri1 id_6,
    output wire id_7
);
  wire id_9;
  wire id_10;
  wire id_11;
  wire id_12 = 1;
  wire id_13;
  wire id_14;
  rnmos (
      .sum(1),
      .id_0(id_4),
      .id_1(id_4),
      .id_2(id_13),
      .id_3(id_9),
      .id_4(id_6),
      .id_5(1'b0),
      .id_6(id_9)
  );
  wire id_15;
endmodule
module module_1 (
    input uwire id_0,
    output supply0 id_1,
    input tri id_2
    , id_16,
    output supply0 id_3,
    input wor id_4,
    input wand id_5,
    input supply1 id_6,
    input uwire id_7,
    input supply1 id_8,
    output tri id_9,
    output supply1 id_10,
    input uwire id_11,
    input wand id_12,
    inout tri0 id_13,
    inout tri0 id_14
);
  integer id_17 = 1;
  and primCall (id_1, id_11, id_4, id_2, id_14, id_0, id_5, id_6, id_7, id_13, id_17, id_16, id_8);
  module_0 modCall_1 (
      id_6,
      id_11,
      id_3,
      id_5,
      id_4,
      id_14,
      id_13,
      id_1
  );
endmodule
