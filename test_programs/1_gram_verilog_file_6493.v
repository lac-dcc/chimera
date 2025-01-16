// Seed: 371225470
module module_0 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  parameter id_4 = "";
  wire id_5;
  wire id_6;
  localparam id_7 = 1'b0 ? -1 : 1;
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
    id_9
);
  output wire id_9;
  inout wire id_8;
  output wire id_7;
  input wire id_6;
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  logic [7:0] id_10;
  logic [7:0] id_11;
  wire id_12;
  logic [7:0] id_13, id_14;
  always_ff $display(1'h0);
  assign id_11[-1] = id_4 == 1;
  wire id_15;
  assign id_7 = id_11;
  id_16(
      .id_0(-1),
      .id_1(1),
      .id_2(id_1),
      .id_3(id_2),
      .id_4(id_3),
      .id_5(id_10.id_14[1] & id_2),
      .id_6(1),
      .id_7(1'h0),
      .id_8(id_10),
      .id_9(id_9),
      .id_10(id_11),
      .id_11(-1),
      .id_12(id_6),
      .id_13(1),
      .id_14(id_6),
      .id_15(id_13),
      .id_16(1)
  );
  wire id_17;
  module_0 modCall_1 (
      id_1,
      id_12,
      id_3
  );
  assign modCall_1.id_1 = 0;
endmodule
