// Seed: 2055770854
module module_0 ();
  id_1(
      .id_0(1),
      .id_1(id_2),
      .id_2(-1),
      .id_3(1 ? -1 : id_2),
      .id_4(id_2),
      .id_5(-1 & 1),
      .id_6(-1),
      .id_7(1),
      .id_8(-1)
  );
endmodule
module module_1;
  assign id_1 = 1;
  id_2(
      id_1
  );
  module_0 modCall_1 ();
  wire id_5, id_6 = 1;
  assign id_4 = -1;
  initial if (-1'b0) @(posedge id_1) deassign id_4;
  assign id_1 = id_5;
  assign id_3 = 1;
  assign id_1 = id_3;
endmodule
