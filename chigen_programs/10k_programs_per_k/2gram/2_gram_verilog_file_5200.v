// Seed: 1813624952
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  input wire id_9;
  inout wire id_8;
  input wire id_7;
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  id_10(
      .id_0(""),
      .id_1(1),
      .id_2(1'h0 ^ id_1 ^ 1),
      .id_3(id_8 && 1),
      .id_4(~{1{1}}),
      .id_5(id_4),
      .id_6(1),
      .id_7(id_1),
      .id_8(id_8),
      .id_9(),
      .id_10(1 ^ id_1++),
      .id_11(id_1),
      .id_12(id_1 !== id_8),
      .id_13(),
      .id_14(1'b0),
      .id_15(id_4),
      .id_16(1'b0),
      .id_17(id_7 & {id_5, 1'b0} & 1),
      .id_18(1),
      .id_19(id_1),
      .id_20(1)
  );
  wire id_11;
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
  output wire id_10;
  input wire id_9;
  input wire id_8;
  output wire id_7;
  input wire id_6;
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_12, id_13;
  module_0(
      id_12, id_5, id_8, id_5, id_12, id_13, id_9, id_13, id_6
  );
  wire id_14;
  always_comb begin
    id_7 <= id_2;
  end
  assign id_5 = id_1;
endmodule
