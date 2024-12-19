// Seed: 130042563
module module_0;
  tri  id_2;
  wire id_3;
  wire id_4;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  output wire id_7;
  inout wire id_6;
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  id_8(
      .id_0(1),
      .id_1(id_4),
      .id_2(1 - id_2),
      .id_3(id_5),
      .id_4(1 & 1),
      .id_5(~id_9),
      .id_6(1'b0),
      .id_7(id_1),
      .id_8(1),
      .id_9(1)
  );
  always_latch @(negedge id_9)
    if (id_6) begin : LABEL_0
      id_5 <= 1'b0;
      id_6 = id_4;
    end else id_9 <= 1;
  module_0 modCall_1 ();
  wire id_10;
  wire id_11;
  wire id_12, id_13;
  wire id_14;
endmodule
