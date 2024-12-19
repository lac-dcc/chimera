// Seed: 2963784380
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  always @(1 or 1) id_1 <= 1;
  wire id_5;
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
    id_12
);
  inout wire id_12;
  inout wire id_11;
  inout wire id_10;
  inout wire id_9;
  inout wire id_8;
  output wire id_7;
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_13;
  id_14(
      .id_0(id_11),
      .id_1(id_9 + id_6),
      .id_2(1),
      .id_3(id_5),
      .id_4(1),
      .id_5(),
      .id_6(1 >> 1),
      .id_7(id_10),
      .id_8(1),
      .id_9(1),
      .id_10(1),
      .id_11(1),
      .id_12(id_1)
  );
  always @(posedge 1) begin : LABEL_0
    if (1 == 1) begin : LABEL_0
      id_8 = #id_15 1;
    end
  end
  module_0 modCall_1 (
      id_8,
      id_12,
      id_4,
      id_12
  );
  always @(id_10) begin : LABEL_0
    if (id_11 || id_9) disable id_16;
    else #1;
  end
endmodule
