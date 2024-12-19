// Seed: 2439969156
module module_0 (
    output wor id_0,
    input tri0 id_1,
    input tri id_2,
    output supply0 id_3,
    output tri0 id_4,
    output tri0 id_5,
    output wand id_6
    , id_9,
    input uwire id_7
    , id_10
);
  assign id_4 = id_2;
  wire id_11;
  assign module_1.id_24 = 0;
endmodule
module module_1 (
    input uwire id_0,
    output supply1 id_1,
    output tri0 id_2,
    output tri0 id_3,
    output tri id_4,
    input tri1 id_5
    , id_9,
    input wand id_6,
    input uwire id_7
);
  id_10(
      .id_0(id_1)
  );
  assign id_3 = 1;
  module_0 modCall_1 (
      id_1,
      id_5,
      id_7,
      id_1,
      id_4,
      id_2,
      id_1,
      id_5
  );
  wand  id_11  ,  id_12  ,  id_13  ,  id_14  ,  id_15  ,  id_16  ,  id_17  ,  id_18  ,  id_19  ,  id_20  ,  id_21  ,  id_22  ,  id_23  ,  id_24  ,  id_25  ;
  id_26(
      .id_0(id_22),
      .id_1(1'b0),
      .id_2(id_19),
      .id_3({1'b0, 1 - 1}),
      .id_4(id_24),
      .id_5(1),
      .id_6(1'b0),
      .id_7({id_19, 1, 1'd0, 1, {1{id_7}}}),
      .id_8(1),
      .id_9(id_3++),
      .id_10(id_21),
      .id_11((id_9)),
      .id_12((1'h0)),
      .id_13(1'h0),
      .id_14(id_16),
      .id_15(id_14),
      .id_16(1'd0)
  );
endmodule
