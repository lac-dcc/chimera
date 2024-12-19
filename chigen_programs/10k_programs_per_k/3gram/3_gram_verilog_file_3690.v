// Seed: 172063439
module module_0 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  input wire id_2;
  input wire id_1;
endmodule
module module_1 ();
  uwire id_1;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1
  );
  id_5(
      .id_0(1),
      .id_1(1),
      .id_2(1),
      .id_3(),
      .id_4(id_2),
      .id_5((1)),
      .id_6(id_1),
      .id_7(1),
      .id_8(1),
      .id_9(id_2 ? (id_4) : 1),
      .id_10(id_2),
      .id_11(id_1),
      .id_12(id_1),
      .id_13(1)
  );
  assign id_1 = 1;
  wire id_6;
  always_latch #1 begin : LABEL_0
    id_2 <= ~id_1;
  end
endmodule
