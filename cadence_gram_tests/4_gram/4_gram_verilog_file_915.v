// Seed: 1892450211
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  output wire id_8;
  inout wire id_7;
  input wire id_6;
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  assign id_4 = $realtime;
  assign module_1.id_9 = 0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  input wire id_8;
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  tri0 id_9;
  reg  id_10;
  module_0 modCall_1 (
      id_2,
      id_6,
      id_5,
      id_9,
      id_5,
      id_6,
      id_7,
      id_5
  );
  id_11(
      .id_0($realtime),
      .id_1(-1),
      .id_2($realtime),
      .id_3(id_2),
      .id_4($realtime),
      .id_5((1)),
      .id_6(1),
      .id_7(1)
  );
  wire id_12;
  wire id_13;
  always @("" or posedge $realtime && $realtime) begin : LABEL_0
    if (id_1) id_10 <= $realtime;
    else id_10 <= 1;
  end
  assign id_9 = -1;
  uwire id_14 = $realtime;
  wire  id_15;
  wire  id_16;
endmodule
