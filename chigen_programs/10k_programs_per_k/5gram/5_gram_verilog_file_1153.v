// Seed: 2416603597
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
  output wire id_8;
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_10;
  assign module_1.id_3 = 0;
  timeunit 1ps;
  assign id_1 = {1, 1};
endmodule
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
  output wire id_13;
  output wire id_12;
  output wire id_11;
  output wire id_10;
  inout wire id_9;
  input wire id_8;
  output wire id_7;
  input wire id_6;
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  logic [7:0] id_15;
  module_0 modCall_1 (
      id_1,
      id_9,
      id_9,
      id_14,
      id_9,
      id_1,
      id_1,
      id_5,
      id_2
  );
  assign id_1 = 1 >= id_4;
  id_16(
      .id_0(id_9),
      .id_1(id_10),
      .id_2({id_3{id_4}}),
      .id_3(!id_14),
      .id_4(!id_11 == 1'b0),
      .id_5(),
      .id_6(1),
      .id_7(id_6),
      .id_8(1 == 1),
      .id_9(id_5),
      .id_10(id_4),
      .id_11(1),
      .id_12(id_2)
  );
  always_latch @(id_6 or posedge id_4) begin : LABEL_0
    id_12 <= id_3;
  end
  module_1(
      .id_0(1), .id_1(), .id_2(1)
  );
endmodule
