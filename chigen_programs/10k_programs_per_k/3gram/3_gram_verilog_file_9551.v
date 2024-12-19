// Seed: 1744067397
module module_0 (
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
  input wire id_2;
  output wire id_1;
  wire id_7;
  if (1) begin : LABEL_0
    wire id_8;
  end else begin : LABEL_0
    assign id_4 = id_5 + id_5;
  end
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
    id_11,
    id_12,
    id_13,
    id_14,
    id_15,
    id_16
);
  inout wire id_16;
  inout wire id_15;
  output wire id_14;
  inout wire id_13;
  input wire id_12;
  output wire id_11;
  inout wire id_10;
  input wire id_9;
  input wire id_8;
  input wire id_7;
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  assign id_13 = 1;
  module_0 modCall_1 (
      id_6,
      id_5,
      id_15,
      id_5,
      id_10,
      id_10
  );
  id_17(
      .id_0(), .id_1(id_7), .id_2(1), .id_3({1{1}}), .id_4()
  );
  wire id_18;
  wire id_19;
  id_20(
      .id_0((1'b0)),
      .id_1(1),
      .id_2(id_11),
      .id_3(id_8),
      .id_4(id_6),
      .id_5(id_18),
      .id_6(1),
      .id_7(1 ? id_8 : 1),
      .id_8()
  );
  wire id_21 = id_16;
  final begin : LABEL_0
    id_19 = !1;
  end
endmodule
