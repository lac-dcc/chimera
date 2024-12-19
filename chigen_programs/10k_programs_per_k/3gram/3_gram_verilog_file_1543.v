// Seed: 581086730
module module_0 (
    output uwire id_0
    , id_20,
    output tri id_1,
    input supply1 id_2,
    output wire id_3,
    input supply1 id_4,
    output supply0 id_5,
    input uwire id_6,
    output supply0 id_7,
    input wor id_8,
    output wire id_9,
    output supply1 id_10,
    output tri id_11,
    output tri0 id_12,
    output tri1 id_13,
    output tri0 id_14,
    output tri0 id_15,
    input supply1 id_16,
    output supply0 id_17,
    output supply1 id_18
);
  id_21(
      .id_0(id_8),
      .id_1(id_3),
      .id_2(1),
      .id_3(1),
      .id_4(),
      .id_5(1'd0 - id_20),
      .id_6(1),
      .id_7(1'b0 - id_16),
      .id_8(1),
      .id_9(""),
      .id_10(1),
      .id_11(1),
      .id_12(id_8),
      .id_13(),
      .id_14(id_12),
      .id_15(1'h0),
      .id_16(id_4 > id_14),
      .id_17(1),
      .id_18(~id_6),
      .id_19()
  );
  tri0 id_22 = 1;
  wire id_23;
  assign id_22 = 1'b0;
  assign id_15 = id_8;
  wire id_24;
  wire id_25;
  wire id_26;
  assign id_7 = 1;
endmodule
module module_1 (
    input  wire  id_0,
    input  wire  id_1,
    output logic id_2,
    output wire  id_3,
    input  wire  id_4,
    output tri0  id_5,
    input  logic id_6,
    input  tri0  id_7
);
  assign id_5 = 1'h0;
  always #1;
  module_0 modCall_1 (
      id_5,
      id_5,
      id_4,
      id_5,
      id_0,
      id_3,
      id_1,
      id_5,
      id_7,
      id_3,
      id_3,
      id_5,
      id_5,
      id_3,
      id_3,
      id_5,
      id_0,
      id_3,
      id_3
  );
  assign modCall_1.id_15 = 0;
  assign id_3 = 1;
  always id_2 = #1 id_6;
  genvar id_9;
endmodule
