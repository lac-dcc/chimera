// Seed: 1860351346
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  inout wire id_8;
  output wire id_7;
  output wire id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_8 = 1;
  id_9(
      .id_0(1), .id_1(1), .id_2(id_8)
  );
  wire id_10;
  id_11(
      .id_0(1),
      .id_1(id_6 - id_2),
      .id_2(1),
      .id_3(id_8),
      .id_4(id_5 == id_6),
      .id_5(1),
      .id_6(1'b0),
      .id_7(id_1),
      .id_8(id_6),
      .id_9(id_9),
      .id_10(1 == 1),
      .id_11(1),
      .id_12(1),
      .id_13($display(id_8)),
      .id_14(1),
      .id_15(""),
      .id_16(id_1),
      .id_17(id_6)
  );
  assign id_4 = 1;
  always @(*) #1;
  wire id_12;
  wire id_13;
  tri  id_14 = 1 == "";
  wire id_15;
  assign id_11 = id_9;
  assign id_3  = 1 < id_14;
  wire module_0;
  assign {1, 1, id_10, id_5, 0, id_4} = 1 ? 1 : 1;
  always @(posedge id_2 or posedge id_8) begin : LABEL_0
    id_3 = id_13 + id_10 ~^ 1;
  end
endmodule
module module_1 (
    id_1,
    id_2
);
  inout wire id_2;
  inout wire id_1;
  always id_2 = #1 1;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1
  );
endmodule
