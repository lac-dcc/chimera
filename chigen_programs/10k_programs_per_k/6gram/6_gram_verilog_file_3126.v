// Seed: 2761238242
module module_0 (
    input  wor   id_0,
    output tri0  id_1,
    input  tri   id_2,
    input  tri   id_3,
    output uwire id_4,
    input  tri1  id_5,
    input  tri   id_6,
    output tri1  id_7
);
  always @(*) begin : LABEL_0
    for (id_4 = id_3; 1; id_1 = 1) begin : LABEL_0
      assert (id_5)
      else;
      if (1'b0 - 1) begin : LABEL_0
        id_4 = 1'h0;
      end
    end
  end
  tri1 id_9 = 1 ? id_5 : id_9;
  assign id_4 = id_9;
endmodule
module module_1 (
    input supply1 id_0
    , id_2
);
  tri0 id_3 = id_0;
  wire id_4;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_0,
      id_3,
      id_3,
      id_0,
      id_3,
      id_3
  );
  assign modCall_1.type_11 = 0;
  wire id_5;
  id_6(
      .id_0(1),
      .id_1(1'd0),
      .id_2(1),
      .id_3(~id_3),
      .id_4(1'd0),
      .id_5(1),
      .id_6(id_5),
      .id_7(1),
      .id_8(""),
      .id_9(1),
      .id_10(1'b0)
  );
endmodule
