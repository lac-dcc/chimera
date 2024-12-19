// Seed: 2993684374
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  always id_5 <= 1;
  tri1 id_6;
  assign module_1.id_7 = 0;
  assign id_6 = 1'b0;
  tri0 id_7 = 1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  always_ff begin : LABEL_0
    @((1) or id_3) id_6 = #1 id_6;
  end
  assign id_3 = id_6;
  tri id_7;
  id_8(
      .id_0(id_2), .id_1(1), .id_2(1), .id_3(1)
  );
  wire id_9;
  tri1 id_11, id_12, id_13;
  id_14(
      .id_0(id_3), .id_1(id_9)
  ); id_15(
      .id_0(id_13),
      .id_1(1),
      .id_2(id_13 == id_4#(
          .id_3(1),
          .id_4(1'h0),
          .id_5(1 | 1)
      )),
      .id_6(1 - id_7),
      .id_7(id_7),
      .id_8(id_1 == 1),
      .id_9(id_8),
      .id_10(id_11),
      .id_11(id_1 - 1),
      .id_12(id_6),
      .id_13(1 - (1))
  );
  wire id_16;
  module_0 modCall_1 (
      id_4,
      id_13,
      id_13,
      id_13,
      id_6
  );
  always_latch begin : LABEL_0
    disable id_17;
  end
endmodule
