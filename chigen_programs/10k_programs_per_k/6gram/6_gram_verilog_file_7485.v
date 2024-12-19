// Seed: 4287977614
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  inout wire id_7;
  input wire id_6;
  output wire id_5;
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  always @(|id_6 or id_7 or 1'b0) begin : LABEL_0
    id_2 <= 1'd0;
  end
  id_8(
      .id_0(1'b0),
      .id_1(id_6),
      .id_2(1),
      .id_3(id_4),
      .id_4(id_5 == 1),
      .id_5(1),
      .id_6(1'b0),
      .id_7(1)
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
    id_11,
    id_12,
    id_13,
    id_14,
    id_15
);
  inout wire id_15;
  input wire id_14;
  input wire id_13;
  inout wire id_12;
  output wire id_11;
  inout wire id_10;
  output wire id_9;
  input wire id_8;
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  initial begin : LABEL_0
    id_12 <= 1;
    id_10 = id_15;
  end
  module_0 modCall_1 (
      id_8,
      id_12,
      id_15,
      id_14,
      id_9,
      id_5,
      id_7
  );
endmodule
