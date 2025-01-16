// Seed: 290208946
module module_0;
  wire id_1;
  module_2 modCall_1 ();
  wire id_2, id_3;
endmodule
module module_1;
  module_0 modCall_1 ();
  always_latch id_1 <= -1;
  wire id_2;
endmodule
module module_2 ();
  id_1(
      .id_0(),
      .id_1(id_2),
      .id_2(1),
      .id_3(1),
      .id_4(id_2),
      .id_5(1'b0 == 1),
      .id_6(-1'b0),
      .id_7('d0),
      .id_8(1),
      .id_9(-1),
      .id_10(-1)
  );
  wire id_3;
  assign id_2 = id_1;
endmodule
