// Seed: 2533164129
module module_0 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  initial begin
    id_3 <= id_1;
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
    id_16,
    id_17,
    id_18
);
  input wire id_18;
  inout wire id_17;
  input wire id_16;
  input wire id_15;
  inout wire id_14;
  input wire id_13;
  inout wire id_12;
  output wire id_11;
  inout wire id_10;
  input wire id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  input wire id_3;
  output wire id_2;
  input wire id_1;
  assign id_14 = 1;
  module_0(
      id_6, id_17, id_6
  );
  wire id_19;
  id_20(
      .id_0(id_18),
      .id_1(id_16),
      .id_2(id_10 * id_14 / 1),
      .id_3(1),
      .id_4(id_13[1]),
      .id_5(1),
      .id_6(id_8),
      .id_7((1'h0)),
      .id_8(id_11),
      .id_9(1),
      .id_10(1'h0)
  );
  always @(negedge id_18) begin
    #1;
    id_5 <= id_6;
    id_6 <= id_3;
    id_10 = 1 == id_8;
  end
endmodule
