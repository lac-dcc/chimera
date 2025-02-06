// Seed: 4016624113
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
    id_17,
    id_18
);
  inout wire id_18;
  output wire id_17;
  output wire id_16;
  input wire id_15;
  output wire id_14;
  inout wire id_13;
  input wire id_12;
  output wire id_11;
  input wire id_10;
  inout wire id_9;
  output wire id_8;
  input wire id_7;
  inout wire id_6;
  input wire id_5;
  input wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  id_19(
      .id_0(-1), .id_1(-1), .id_2($realtime), .id_3(($realtime)), .id_4(1), .id_5($realtime)
  ); specify
    $hold(negedge id_20, negedge id_21, $realtime, id_22);
  endspecify
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_4,
      id_3,
      id_3,
      id_4,
      id_3,
      id_2,
      id_3,
      id_3,
      id_2,
      id_4,
      id_4,
      id_4,
      id_4,
      id_3,
      id_4,
      id_3
  );
  id_5(
      .id_0(id_1[-1]), .id_1(id_2), .id_2($realtime && $realtime), .id_3($realtime), .id_4()
  );
  wire id_6;
endmodule
