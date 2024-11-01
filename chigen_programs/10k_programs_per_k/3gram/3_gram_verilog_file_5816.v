// Seed: 3750486909
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10
);
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
  integer id_11 = id_6;
  id_12(
      .id_0(id_1),
      .id_1(1'b0),
      .id_2(id_6 == id_10),
      .id_3(id_9),
      .id_4(1'b0),
      .id_5(id_5[1]),
      .id_6(1),
      .id_7(id_3),
      .id_8(1),
      .id_9(id_3),
      .id_10("" * id_10 + id_8),
      .id_11(1),
      .id_12(id_2),
      .id_13(id_7),
      .sum(1),
      .id_14(1),
      .id_15(1),
      .id_16()
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
    id_15,
    id_16,
    id_17,
    id_18
);
  inout wire id_18;
  inout wire id_17;
  output wire id_16;
  input wire id_15;
  output wire id_14;
  inout wire id_13;
  inout wire id_12;
  output wire id_11;
  output wire id_10;
  output wire id_9;
  output wire id_8;
  output wire id_7;
  inout wire id_6;
  input wire id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  wire id_19;
  wire id_20;
  wire id_21;
  wire id_22;
  id_23 :
  assert property (@(posedge 1'b0) id_15[1])
  else begin
    id_4 <= 1'b0;
  end
  always @(1'h0 or posedge 1) begin
    id_11 <= id_13;
  end
  assign id_7[1] = 1;
  assign id_16   = id_3;
  tri id_24 = 0;
  module_0(
      id_20, id_19, id_20, id_14, id_7, id_17, id_19, id_24, id_23, id_21
  );
  wire id_25;
endmodule
