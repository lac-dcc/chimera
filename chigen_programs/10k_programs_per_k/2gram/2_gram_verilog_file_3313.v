// Seed: 3060436746
module module_0 ();
  always_latch @(posedge 1) id_1 <= 1;
  assign module_1.id_7 = 0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  input wire id_7;
  output wire id_6;
  input wire id_5;
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  id_8(
      .id_0({1}),
      .id_1(1 + id_7),
      .id_2(id_2),
      .id_3((1 << 1)),
      .id_4(id_1),
      .id_5(id_5),
      .id_6({id_2, 1}),
      .id_7(id_3)
  );
  module_0 modCall_1 ();
endmodule
