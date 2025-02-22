// Seed: 3078098518
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
    id_15,
    id_16,
    id_17
);
  input wire id_17;
  inout wire id_16;
  output wire id_15;
  input wire id_14;
  input wire id_13;
  output wire id_12;
  input wire id_11;
  output wire id_10;
  output wire id_9;
  inout wire id_8;
  input wire id_7;
  output wire id_6;
  output wire id_5;
  output wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  id_18(
      .id_0(1), .id_1((id_5) | 1), .id_2(1'b0 || (id_12++)), .id_3(1 + 1'b0 - id_17), .id_4(id_6)
  ); id_19(
      .id_0(1), .id_1(id_12), .id_2(id_10 == id_4), .id_3(1), .id_4(1'b0), .id_5(1), .id_6(1'h0)
  ); id_20(
      1, id_17, 1'h0
  );
  assign module_1.type_4 = 0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  input wire id_2;
  input wire id_1;
  assign id_4 = id_2 - id_1;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_1,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4
  );
  assign id_4 = 1;
  reg id_5 = id_2 * id_4 - 1 ? id_2 : 1;
  always @(posedge 1'b0 or posedge 1) id_5 <= id_3;
  initial $display(id_1);
endmodule
