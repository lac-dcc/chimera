// Seed: 108725158
module module_0 (
    output supply0 id_0,
    input wor id_1,
    output tri0 id_2,
    input tri id_3,
    input supply1 id_4,
    output tri0 id_5,
    output tri0 id_6,
    output tri0 id_7,
    input wand id_8,
    input uwire id_9,
    output supply1 id_10,
    output tri id_11,
    input supply1 id_12,
    input tri id_13,
    input supply0 id_14
);
  uwire id_16, id_17, id_18;
  assign id_2 = -1;
  id_19(
      .id_0(1), .id_1(id_18)
  );
  assign id_18 = id_3;
  wire id_20;
  wire id_21, id_22, id_23, id_24;
  assign module_1.type_0 = 0;
  assign id_17 = -1;
endmodule
module module_1 (
    output tri0 id_0,
    input supply1 id_1,
    input wor id_2,
    output tri id_3
);
  tri id_5 = -1 ? (id_1) : -1;
  id_6(
      .id_0(1),
      .product(!-1),
      .id_1((-1)),
      .id_2(""),
      .id_3(-1),
      .id_4(id_0),
      .id_5(id_1),
      .id_6(1),
      .id_7(id_2),
      .id_8(-1),
      .id_9(-1),
      .id_10(-1'd0),
      .id_11(-1'b0),
      .id_12(1)
  );
  module_0 modCall_1 (
      id_3,
      id_5,
      id_0,
      id_1,
      id_2,
      id_3,
      id_5,
      id_5,
      id_2,
      id_1,
      id_5,
      id_0,
      id_1,
      id_1,
      id_5
  );
  assign id_3 = -1;
  or primCall (id_3, id_5, id_6, id_1, id_2);
endmodule
