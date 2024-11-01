// Seed: 3758226995
module module_0 (
    input tri0 id_0,
    output tri0 id_1,
    output tri0 id_2,
    output supply1 id_3,
    input wor id_4,
    input wand id_5,
    output tri0 id_6
);
  id_8(
      .id_0(""),
      .id_1(1 == 1),
      .id_2(1 - 1'b0),
      .id_3(1),
      .id_4(),
      .id_5(1),
      .id_6(1),
      .id_7(id_5),
      .id_8(1'h0),
      .id_9(id_4++),
      .id_10(1'h0 - id_5),
      .id_11(1),
      .id_12(1'd0),
      .id_13(1),
      .id_14(id_0),
      .id_15(1)
  );
endmodule
module module_1 (
    input  tri0  id_0,
    output tri   id_1,
    input  uwire id_2,
    input  tri1  id_3,
    input  tri   id_4,
    output uwire id_5
);
  wire id_7;
  and (id_5, id_8, id_0, id_3, id_2, id_9, id_4);
  id_8 :
  assert property (@(posedge 1) 1 || 1)
  else $display;
  uwire id_9;
  module_0(
      id_3, id_1, id_1, id_9, id_3, id_3, id_5
  );
  assign id_5 = id_3 ? 1 : id_9;
endmodule
