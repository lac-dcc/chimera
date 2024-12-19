// Seed: 2103903314
module module_0 (
    input supply1 id_0,
    input supply0 id_1,
    output tri id_2,
    input wire id_3,
    input wire id_4,
    input tri1 id_5,
    input supply1 id_6,
    output tri1 id_7,
    output supply0 id_8,
    input supply0 id_9
    , id_11
);
  assign id_7  = id_3 == 1;
  assign id_11 = id_6;
endmodule
module module_1 (
    output supply0 id_0,
    input supply1 id_1,
    output tri id_2,
    output wand id_3,
    input uwire id_4,
    input supply0 id_5,
    output tri0 id_6,
    input tri0 id_7,
    input wire id_8
);
  id_10(
      .id_0(1),
      .id_1(1),
      .id_2(1'b0),
      .id_3(id_5),
      .id_4(1),
      .id_5(1),
      .id_6(id_1),
      .id_7(1),
      .id_8(id_7++),
      .id_9(id_6++),
      .id_10((1'd0) - 1),
      .id_11(1),
      .id_12(1),
      .id_13(1),
      .id_14(1),
      .id_15($display(id_2)),
      .id_16(),
      .id_17(1),
      .id_18(1)
  );
  module_0 modCall_1 (
      id_1,
      id_5,
      id_3,
      id_8,
      id_4,
      id_5,
      id_1,
      id_0,
      id_0,
      id_1
  );
  assign modCall_1.id_3 = 0;
endmodule
