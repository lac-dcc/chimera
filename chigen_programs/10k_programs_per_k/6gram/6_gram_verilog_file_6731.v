// Seed: 2495469338
module module_0 (
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
  output wire id_5;
  input wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  id_8(
      .id_0(~id_2),
      .id_1(id_7 == 1),
      .id_2(1),
      .id_3(1 & 1),
      .id_4(1'b0),
      .id_5(1),
      .id_6(1'b0),
      .id_7(1),
      .id_8(id_4),
      .id_9(1),
      .id_10(1),
      .id_11(1),
      .id_12(id_4),
      .id_13(1'b0),
      .id_14(id_4 == 1)
  );
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_6;
  always @(1 or posedge 1) begin : LABEL_0
    if (1) id_3 <= 1;
  end
  module_0 modCall_1 (
      id_5,
      id_1,
      id_1,
      id_2,
      id_6,
      id_6,
      id_4
  );
  initial begin : LABEL_0
    id_5 = id_2;
  end
endmodule
