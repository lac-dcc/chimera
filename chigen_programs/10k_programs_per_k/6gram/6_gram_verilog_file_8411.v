// Seed: 1187638846
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
    id_10,
    id_11,
    id_12,
    id_13,
    id_14,
    id_15
);
  inout wire id_15;
  output wire id_14;
  inout wire id_13;
  inout wire id_12;
  output wire id_11;
  input wire id_10;
  output wire id_9;
  output wire id_8;
  output wire id_7;
  output wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_16 = 1;
  assign id_6  = id_13;
  assign id_14 = id_13 ? id_4 : id_10;
  wire id_17;
  assign id_15 = id_10;
  wire id_18;
  assign id_12 = 1'h0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  wand id_5;
  assign id_5 = 1;
  logic [7:0] id_6, id_7, id_8;
  assign id_3 = (id_6[1'h0]);
  always @(id_1) if (id_1) deassign id_5;
  id_9(
      .id_0(1), .id_1(id_6)
  );
  module_0 modCall_1 (
      id_5,
      id_2,
      id_5,
      id_5,
      id_5,
      id_2,
      id_3,
      id_2,
      id_3,
      id_1,
      id_5,
      id_5,
      id_5,
      id_2,
      id_5
  );
  wire id_10;
  wire id_11;
  wire id_12;
  id_13(
      .id_0(1),
      .id_1(id_12),
      .id_2(),
      .id_3(1'b0),
      .id_4(id_11),
      .id_5(1'h0),
      .id_6(id_6),
      .id_7(1),
      .id_8(id_1),
      .id_9(id_10),
      .id_10(id_5),
      .id_11(1'h0),
      .id_12(""),
      .id_13(1 & 1'b0 & 1),
      .id_14(id_4.id_2),
      .id_15(1)
  );
endmodule
