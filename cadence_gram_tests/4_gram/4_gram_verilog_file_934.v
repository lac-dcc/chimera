// Seed: 4084680382
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
  output wire id_17;
  inout wire id_16;
  output wire id_15;
  output wire id_14;
  output wire id_13;
  output wire id_12;
  input wire id_11;
  output wire id_10;
  output wire id_9;
  output wire id_8;
  output wire id_7;
  output wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_18;
  wire id_19;
  assign id_16 = -1;
  wire id_20;
  id_21(
      .id_0(-1'b0), .id_1($realtime & $realtime), .id_2($realtime)
  );
  wire id_22;
  specify
  endspecify
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
    id_10
);
  output wire id_10;
  inout wire id_9;
  output wire id_8;
  output wire id_7;
  output wire id_6;
  output wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  logic [7:0] id_11;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_4,
      id_9,
      id_7,
      id_10,
      id_8,
      id_8,
      id_3,
      id_6,
      id_3,
      id_8,
      id_6,
      id_3,
      id_4,
      id_9,
      id_3
  );
  id_12(
      .id_0(~id_11[1]), .id_1(id_8), .id_2($realtime), .id_3(1 == $realtime), .id_4(1)
  );
  assign id_3 = id_9;
endmodule
