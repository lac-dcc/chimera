// Seed: 384843728
module module_0 (
    output wire id_0,
    output tri  id_1,
    input  tri  id_2
);
  assign id_1 = id_2;
  assign id_1 = id_2;
  assign id_1 = 1;
  wire id_4, id_5, id_6;
  assign module_1.id_0 = 0;
  generate
    wire id_7;
    assign id_5 = ~1;
    id_8(
        .id_0(1'b0),
        .id_1(id_4),
        .id_2(id_5),
        .id_3(1'd0),
        .id_4(""),
        .id_5(id_1 == id_2),
        .id_6((1)),
        .id_7(1),
        .id_8(1),
        .id_9(id_4),
        .id_10(id_6),
        .id_11(id_4),
        .id_12(1)
    );
    wire id_9;
    id_10 :
    assert property (@(posedge id_10) id_7)
    else;
  endgenerate
  id_11(
      .id_0(1), .id_1(1 + 1), .id_2(1), .id_3(id_2), .id_4(1), .id_5(1), .id_6(1), .id_7("")
  ); id_12(
      .id_0(id_13), .id_1(1'h0), .id_2("")
  );
  wire id_14;
  wire id_15;
  assign id_0 = 1;
endmodule
module module_1 (
    input  uwire id_0,
    input  wire  id_1,
    output uwire id_2
);
  wire id_4;
  assign id_2 = 1;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_0
  );
endmodule
