// Seed: 1560292855
module module_0 (
    id_1,
    id_2
);
  output wire id_2;
  output wire id_1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  input wire id_1;
  always
    if (id_4) begin
      id_5 <= 1;
    end
  module_0(
      id_4, id_4
  );
endmodule
module module_2 (
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
  input wire id_15;
  output wire id_14;
  inout wire id_13;
  input wire id_12;
  input wire id_11;
  inout wire id_10;
  inout wire id_9;
  output wire id_8;
  output wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_17;
  if (id_12) begin
    always_latch begin
      id_9 <= id_9;
    end
  end else
    id_18(
        .id_0(id_10),
        .id_1(),
        .id_2(id_9),
        .id_3(1),
        .id_4(id_15 == 1'b0),
        .id_5(1'h0),
        .id_6(1),
        .id_7(1'b0),
        .id_8(id_5),
        .id_9(),
        .id_10(1),
        .id_11(1),
        .id_12(id_17),
        .id_13(1'b0),
        .id_14(id_2),
        .id_15(1),
        .id_16(id_14),
        .id_17({1'b0, id_5, 1, (id_8) & id_7}),
        .id_18(1)
    );
  wire id_19;
  assign id_3 = 1;
  module_0(
      id_4, id_19
  );
  always id_18 = id_1;
  wire id_20;
  initial begin
    id_2 = 1;
  end
  tri id_21;
  nor (
      id_14,
      id_6,
      id_2,
      id_3,
      id_12,
      id_17,
      id_16,
      id_5,
      id_10,
      id_4,
      id_15,
      id_18,
      id_1,
      id_13,
      id_9
  );
  id_22(
      id_12, 1, id_21, 1, id_16, id_4
  );
endmodule
