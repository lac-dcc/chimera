// Seed: 2042433782
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
    id_10
);
  output wire id_10;
  output wire id_9;
  output wire id_8;
  inout wire id_7;
  input wire id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  input wire id_2;
  output wire id_1;
  wire id_11;
  wire id_12;
  id_13(
      .id_0(-1'd0),
      .id_1(id_9),
      .id_2(id_2),
      .id_3(),
      .id_4($realtime),
      .id_5(id_5),
      .id_6($realtime),
      .id_7(id_11),
      .id_8($realtime),
      .id_9()
  );
  wire id_14;
  assign module_1.id_1 = 0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  always @(negedge -1) begin : LABEL_0
    id_2 <= id_1;
  end
  module_0 modCall_1 (
      id_4,
      id_3,
      id_5,
      id_4,
      id_4,
      id_3,
      id_3,
      id_5,
      id_4,
      id_5
  );
endmodule
