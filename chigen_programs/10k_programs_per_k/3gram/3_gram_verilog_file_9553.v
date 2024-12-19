// Seed: 3751784877
module module_0 (
    id_1,
    id_2
);
  inout wire id_2;
  output wire id_1;
  assign id_2 = 1;
  assign module_2.id_7 = 0;
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
  inout wire id_7;
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  always_latch #1 id_8(0);
  module_0 modCall_1 (
      id_3,
      id_6
  );
  assign modCall_1.id_2 = 0;
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  inout wire id_7;
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  id_8 :
  assert property (@(posedge ~1'b0) id_6)
  else {1, !id_7} = id_8;
  module_0 modCall_1 (
      id_3,
      id_6
  );
  wire id_9;
  id_10(
      .id_0(1),
      .id_1(id_6),
      .id_2(1 - id_8),
      .id_3(1),
      .id_4(id_1[1]),
      .id_5(1),
      .id_6(),
      .id_7(id_6),
      .id_8(1'b0),
      .id_9(id_3),
      .id_10(id_3),
      .id_11(id_7),
      .id_12(1),
      .id_13(1)
  );
endmodule
