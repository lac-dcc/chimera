// Seed: 3872876626
module module_0 ();
  always begin : LABEL_0
    if (1'b0) id_1 <= +id_1;
  end
  reg id_3;
  assign id_3 = 1;
  final begin : LABEL_0
    while (1) id_3 <= 1 === 1;
    id_2 = 1;
  end
  wire id_4;
  wire id_5;
  logic [7:0] id_6;
  id_7(
      .id_0(""),
      .id_1(id_6),
      .id_2(id_6),
      .id_3(1),
      .id_4(1),
      .id_5(),
      .id_6(1),
      .id_7(id_2 ^ id_8),
      .id_8(1),
      .id_9(id_3 <-> 1),
      .id_10(1),
      .id_11(id_5),
      .id_12(1),
      .id_13(1),
      .id_14(id_6),
      .id_15(1),
      .id_16(id_8),
      .id_17(id_6[1])
  );
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11
);
  output wire id_11;
  inout wire id_10;
  input wire id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_4 = id_10;
  id_12 :
  assert property (@(posedge {
    (1), id_6, 1, id_6, id_9
  }, 1'b0 or posedge id_8 == id_3) id_8 ? 1'b0 : 1)
  else;
  module_0 modCall_1 ();
  assign id_1 = id_6;
  wire id_13;
endmodule
