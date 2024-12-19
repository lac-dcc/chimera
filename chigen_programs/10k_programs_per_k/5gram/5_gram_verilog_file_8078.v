// Seed: 2776047968
module module_0;
  final $display(id_1);
  supply0 id_3;
  assign id_2 = id_3 == id_1 - 1;
  wire id_4;
  always_latch @(*) begin : LABEL_0
    if (id_4) id_1 <= 1;
    id_4 += id_3 * 1;
  end
  wire id_5;
endmodule
module module_1;
  id_1(
      .id_0(id_2 != ""), .id_1(1), .id_2(1), .id_3(id_3), .id_4(id_3++), .id_5(id_2), .id_6(1'b0)
  );
  module_0 modCall_1 ();
  assign modCall_1.id_3 = 0;
endmodule
