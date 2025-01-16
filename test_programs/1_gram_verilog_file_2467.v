// Seed: 3645631267
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
    id_14
);
  input wire id_14;
  inout wire id_13;
  inout wire id_12;
  inout wire id_11;
  output wire id_10;
  output wire id_9;
  output wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  always_latch $display(~1'b0 < 1);
  supply0 id_15;
  assign id_8 = {1};
  assign id_6 = -1'b0;
  wire id_16;
  parameter id_17 = id_15 & -1;
endmodule
module module_1;
  assign id_1 = id_1;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1
  );
  assign modCall_1.id_5 = 0;
  wire id_2, id_3;
  wire id_4;
  wire id_5;
  logic [7:0] id_6, id_7, id_8;
  parameter id_9 = -1;
  id_10(
      .id_0(1'b0),
      .sum(1),
      .id_1(1'b0),
      .id_2(-1'd0),
      .id_3(id_1(({id_11}), id_9, id_9, 1, 1, -1'b0)),
      .id_4(id_6),
      .id_5(1),
      .id_6(id_11),
      .id_7(1),
      .id_8(id_8[-1])
  ); id_12();
endmodule
