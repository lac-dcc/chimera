// Seed: 1133221144
module module_0 (
    output wand id_0,
    input supply0 id_1,
    input supply1 id_2,
    output tri1 id_3
);
  wire id_5;
  assign module_2.type_3 = 0;
  wire id_6;
endmodule
module module_1 (
    output tri id_0,
    output supply0 id_1,
    output tri0 id_2
    , id_7,
    input wand id_3,
    input tri1 id_4,
    input wor id_5
);
  wire id_8;
  module_0 modCall_1 (
      id_2,
      id_5,
      id_5,
      id_0
  );
  assign id_1 = id_3;
endmodule
module module_2 (
    input supply0 id_0,
    output supply1 id_1,
    input tri1 id_2,
    output supply0 id_3,
    input supply1 id_4,
    inout wand id_5,
    input tri0 id_6,
    output uwire id_7,
    input tri0 id_8,
    input wire id_9,
    output tri1 id_10,
    output uwire id_11,
    output supply0 id_12,
    input uwire id_13,
    input wand id_14,
    input wire id_15
);
  supply0 id_17;
  and primCall (id_5, id_17, id_0, id_2, id_4, id_8, id_13, id_15, id_14, id_6, id_9);
  module_0 modCall_1 (
      id_3,
      id_5,
      id_13,
      id_5
  );
  wire id_18;
  id_19(
      .id_0(id_10),
      .id_1(id_15),
      .id_2(id_12),
      .id_3(1'h0),
      .id_4(id_5),
      .id_5(id_1),
      .id_6(id_3),
      .id_7(1),
      .id_8(1),
      .id_9(id_3),
      .id_10(id_2),
      .id_11(id_6)
  );
  assign id_12 = id_17 - id_2;
endmodule
