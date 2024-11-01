// Seed: 1101720941
module module_0 (
    input supply1 id_0,
    input uwire id_1,
    input tri id_2,
    input supply0 id_3,
    input uwire id_4,
    input tri1 id_5,
    output wor id_6
);
  wire id_8, id_9, id_10;
  tri id_11;
  supply0 id_12, id_13;
  wire id_14;
  supply1 id_15 = id_13;
  assign id_6  = 1;
  assign id_12 = 1;
  wire id_16;
  wire id_17, id_18;
  wire id_19;
  assign id_11 = 1;
  assign id_11 = 1'b0;
endmodule
module module_1 (
    output wand id_0,
    input supply0 id_1,
    input wand id_2,
    input supply1 id_3,
    input tri0 id_4
);
  uwire id_6;
  module_0(
      id_2, id_4, id_2, id_1, id_2, id_3, id_0
  );
  assign id_6 = id_6;
  assign id_0 = id_4;
  always_latch $display(1'h0, id_1 + id_3);
  assign id_0 = 1;
  id_7(
      .id_0(id_2 ? id_6 : 1),
      .id_1(id_0),
      .id_2(1),
      .id_3(id_1 - 1'b0),
      .id_4(id_3),
      .id_5(id_3),
      .id_6(1'h0),
      .id_7(1),
      .id_8(1),
      .id_9(1),
      .id_10(id_1),
      .id_11(id_2),
      .id_12(1),
      .id_13(),
      .id_14(id_6),
      .id_15(id_4 && 1),
      .id_16(id_4)
  );
  assign id_6 = id_6;
endmodule
