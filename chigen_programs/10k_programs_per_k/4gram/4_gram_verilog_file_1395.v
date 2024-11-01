// Seed: 1907157074
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
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  input wire id_2;
  output wire id_1;
  wire id_9;
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
    id_17
);
  input wire id_17;
  inout wire id_16;
  input wire id_15;
  input wire id_14;
  inout wire id_13;
  inout wire id_12;
  inout wire id_11;
  output wire id_10;
  input wire id_9;
  output wire id_8;
  input wire id_7;
  inout wire id_6;
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  always @(1) begin
    id_16 = 1;
  end
  module_0(
      id_6, id_12, id_3, id_5, id_10, id_5, id_8, id_13
  ); id_18(
      .id_0(id_15 == {id_12, !id_6, 1, id_16}),
      .id_1(1'h0),
      .id_2({1, 1}),
      .id_3(id_10),
      .id_4(1),
      .id_5(id_12 + id_9),
      .id_6(id_11),
      .id_7(id_13),
      .id_8(id_2),
      .id_9(id_1)
  );
  xor (id_13, id_12, id_9, id_3, id_15, id_5, id_6, id_11, id_7, id_14, id_17, id_16);
endmodule
