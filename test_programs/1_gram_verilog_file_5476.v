// Seed: 1756518725
module module_0 (
    output wand id_0,
    input supply0 id_1,
    output tri1 id_2,
    input supply0 id_3
);
  supply1 id_5, id_6, id_7, id_8;
  id_9(
      .id_0(1'b0),
      .id_1(-1),
      .id_2(id_6),
      .id_3(-1),
      .id_4(),
      .id_5(-1'b0),
      .id_6(1'b0),
      .id_7(id_5),
      .id_8(id_2),
      .id_9(id_3),
      .id_10(id_5),
      .id_11(1),
      .id_12(id_7),
      .id_13(id_8),
      .id_14(id_2),
      .id_15(""),
      .id_16($display(id_7) ? id_3 : id_7)
  );
  wire id_10;
  wire id_11;
  assign id_6 = 1;
  assign id_2 = -1'd0;
  wire id_12;
  always_ff begin : LABEL_0
    disable id_13;
    disable id_14;
    begin : LABEL_0
      return id_12 & 1 < 1;
      @(*) disable id_15;
    end
  end
endmodule
module module_1 (
    output tri0  id_0,
    input  wand  id_1,
    input  tri   id_2,
    input  uwire id_3,
    input  wor   id_4
);
  wire id_6, id_7;
  supply1 id_8;
  module_0 modCall_1 (
      id_8,
      id_2,
      id_0,
      id_1
  );
  assign modCall_1.id_8 = 0;
  assign id_0 = id_8;
  assign id_0 = id_3;
  always return -1'b0;
  wire id_9;
  integer id_10 = 1'd0 == -1;
  integer id_11;
endmodule
