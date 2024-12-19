// Seed: 1062406122
module module_0;
  id_2(
      .id_0(id_1),
      .id_1(1),
      .id_2(1),
      .id_3(1'b0),
      .id_4(id_1),
      .id_5(|1'b0),
      .id_6(id_3),
      .id_7(id_4),
      .id_8(id_3),
      .id_9(id_1),
      .id_10({id_4 == id_4++, 1, id_3++}),
      .id_11(1)
  );
  assign module_1.id_1 = 0;
endmodule
module module_1 ();
  assign id_1 = 1;
  module_0 modCall_1 ();
  assign id_1 = 1 + 1 == id_1++;
endmodule
